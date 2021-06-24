Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CAD3B2C4F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:19:32 +0200 (CEST)
Received: from localhost ([::1]:57354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMSJ-00025H-TT
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lwMRN-0000up-1Y
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:18:33 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:54918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lwMRL-0005gH-EI
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:18:32 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-xxSKPlhDMKOUhdrfxoaDlg-1; Thu, 24 Jun 2021 06:18:21 -0400
X-MC-Unique: xxSKPlhDMKOUhdrfxoaDlg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72E05824F98;
 Thu, 24 Jun 2021 10:18:19 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-114-242.ams2.redhat.com [10.36.114.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 230E960E3A;
 Thu, 24 Jun 2021 10:18:09 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] virtiofsd: Don't allow file creation with FUSE_OPEN
Date: Thu, 24 Jun 2021 12:18:09 +0200
Message-Id: <20210624101809.48032-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Miklos Szeredi <miklos@szeredi.hu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
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

But if the client happens to do it anyway, the server ends up passing
this flag to open() without the mandatory mode_t 4th argument. Since
open() is a variadic function, glibc will happily pass whatever it
finds on the stack to the syscall. If this file is compiled with
-D_FORTIFY_SOURCE=3D2, glibc will even detect that and abort:

*** invalid openat64 call: O_CREAT or O_TMPFILE without mode ***: terminate=
d

Specifying O_CREAT with FUSE_OPEN is a protocol violation. Check this
in do_open(), print out a message and return an error to the client,
EINVAL like we already do when fuse_mbuf_iter_advance() fails.

The FUSE filesystem doesn't currently support O_TMPFILE, but the very
same would happen if O_TMPFILE was passed in a FUSE_OPEN request. Check
that as well.

Signed-off-by: Greg Kurz <groug@kaod.org>
---

v2:
 - do the check in core FUSE code instead of passthrough_ll (libfuse folks)


 tools/virtiofsd/fuse_lowlevel.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 7fe2cef1eb3b..3d725bcba2ca 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1084,6 +1084,12 @@ static void do_open(fuse_req_t req, fuse_ino_t nodei=
d,
         return;
     }
=20
+    /* File creation is handled by do_create() or do_mknod() */
+    if (arg->flags & (O_CREAT | O_TMPFILE)) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
     memset(&fi, 0, sizeof(fi));
     fi.flags =3D arg->flags;
     fi.kill_priv =3D arg->open_flags & FUSE_OPEN_KILL_SUIDGID;
--=20
2.31.1


