Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1298D339028
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:38:27 +0100 (CET)
Received: from localhost ([::1]:55162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKivq-000372-20
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKiUh-0002ge-TW
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:10:23 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:46968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKiUf-0003uV-H4
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:10:23 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-MO7gm_TUOemda3JyKN8QPA-1; Fri, 12 Mar 2021 09:10:16 -0500
X-MC-Unique: MO7gm_TUOemda3JyKN8QPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB2C4107ACCA;
 Fri, 12 Mar 2021 14:10:15 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 765DA5D6D7;
 Fri, 12 Mar 2021 14:10:14 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] virtiofsd: Don't allow empty paths in lookup_name()
Date: Fri, 12 Mar 2021 15:10:01 +0100
Message-Id: <20210312141003.819108-2-groug@kaod.org>
In-Reply-To: <20210312141003.819108-1-groug@kaod.org>
References: <20210312141003.819108-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
Cc: virtio-fs@redhat.com, Miklos Szeredi <mszeredi@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When passed an empty filename, lookup_name() returns the inode of
the parent directory, unless the parent is the root in which case
the st_dev doesn't match and lo_find() returns NULL. This is
because lookup_name() passes AT_EMPTY_PATH down to fstatat() or
statx().

This behavior doesn't quite make sense because users of lookup_name()
then pass the name to unlinkat(), renameat() or renameat2(), all of
which will always fail on empty names.

Drop AT_EMPTY_PATH from the flags in lookup_name() so that it has
the consistent behavior of "returning an existing child inode or
NULL" for all directories.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tools/virtiofsd/passthrough_ll.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index fc7e1b1e8e2b..27a6c636dcaf 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1308,8 +1308,7 @@ static struct lo_inode *lookup_name(fuse_req_t req, f=
use_ino_t parent,
         return NULL;
     }
=20
-    res =3D do_statx(lo, dir->fd, name, &attr,
-                   AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);
+    res =3D do_statx(lo, dir->fd, name, &attr, AT_SYMLINK_NOFOLLOW, &mnt_i=
d);
     lo_inode_put(lo, &dir);
     if (res =3D=3D -1) {
         return NULL;
--=20
2.26.2


