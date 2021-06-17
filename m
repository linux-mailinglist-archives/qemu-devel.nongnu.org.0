Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097EB3AB5B3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 16:18:55 +0200 (CEST)
Received: from localhost ([::1]:59034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltsr8-0005vJ-4B
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 10:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ltso5-00034e-FP
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:15:45 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:27890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ltso3-0007kv-F0
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:15:45 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-yslf7ReKOXum6zuzzDMCQA-1; Thu, 17 Jun 2021 10:15:30 -0400
X-MC-Unique: yslf7ReKOXum6zuzzDMCQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDF1A1084F46;
 Thu, 17 Jun 2021 14:15:28 +0000 (UTC)
Received: from bahia.lan (ovpn-112-206.ams2.redhat.com [10.36.112.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B7A260875;
 Thu, 17 Jun 2021 14:15:18 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtiofsd: Don't allow file creation with FUSE_OPEN
Date: Thu, 17 Jun 2021 16:15:18 +0200
Message-Id: <20210617141518.304659-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A well behaved FUSE client uses FUSE_CREATE to create files. It isn't
supposed to pass O_CREAT along a FUSE_OPEN request, as documented in
the "fuse_lowlevel.h" header :

    /**
     * Open a file
     *
     * Open flags are available in fi->flags. The following rules
     * apply.
     *
     *  - Creation (O_CREAT, O_EXCL, O_NOCTTY) flags will be
     *    filtered out / handled by the kernel.

But if it does anyway, virtiofsd crashes with:

*** invalid openat64 call: O_CREAT or O_TMPFILE without mode ***: terminate=
d

This is because virtiofsd ends up passing this flag to openat() without
passing a mode_t 4th argument which is mandatory with O_CREAT, and glibc
aborts.

The offending path is:

lo_open()
    lo_do_open()
        lo_inode_open()

Other callers of lo_inode_open() only pass O_RDWR and lo_create()
passes a valid fd to lo_do_open() which thus doesn't even call
lo_inode_open() in this case.

Specifying O_CREAT with FUSE_OPEN is a protocol violation. Check this
in lo_open() and return an error to the client : EINVAL since this is
already what glibc returns with other illegal flag combinations.

The FUSE filesystem doesn't currently support O_TMPFILE, but the very
same would happen if O_TMPFILE was passed in a FUSE_OPEN request. Check
that as well.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tools/virtiofsd/passthrough_ll.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 49c21fd85570..14f62133131c 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2145,6 +2145,12 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, =
struct fuse_file_info *fi)
         return;
     }
=20
+    /* File creation is handled by lo_create() */
+    if (fi->flags & (O_CREAT | O_TMPFILE)) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
     err =3D lo_do_open(lo, inode, -1, fi);
     lo_inode_put(lo, &inode);
     if (err) {
--=20
2.31.1


