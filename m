Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F66146B4E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 15:29:53 +0100 (CET)
Received: from localhost ([::1]:58044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iudUV-0006zB-UA
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 09:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41689)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iubAj-0004EL-Lh
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:01:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iubAh-0006ba-N8
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:01:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57996
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iubAf-0006Zx-RE
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aLZjkQwegSYpdgRATUG0pRrWmWYP1vk2vwHAPH7tVEg=;
 b=XUx+OifFrc9uxWVC5cuanTp67wBieen1lgjNP/BjJgtAXkhCzvLp+QRx0NkYSHruJe2rJH
 jaDbV+0kAjR+22oqpZcZMqo1sltLQ/EhXDmGAoyLFox2he11rFUDtMkhhF72k5KWHvQMd8
 qcXtnAug88f0wonnqaOzLbQeLaPWEYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-tb3UhsxrNlSNe2HNoEsGsQ-1; Thu, 23 Jan 2020 07:01:09 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1885A0CBF
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 12:01:08 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E361485750;
 Thu, 23 Jan 2020 12:01:07 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 100/111] virtiofsd: Fix data corruption with O_APPEND write in
 writeback mode
Date: Thu, 23 Jan 2020 11:58:30 +0000
Message-Id: <20200123115841.138849-101-dgilbert@redhat.com>
In-Reply-To: <20200123115841.138849-1-dgilbert@redhat.com>
References: <20200123115841.138849-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: tb3UhsxrNlSNe2HNoEsGsQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>

When writeback mode is enabled (-o writeback), O_APPEND handling is
done in kernel. Therefore virtiofsd clears O_APPEND flag when open.
Otherwise O_APPEND flag takes precedence over pwrite() and write
data may corrupt.

Currently clearing O_APPEND flag is done in lo_open(), but we also
need the same operation in lo_create(). So, factor out the flag
update operation in lo_open() to update_open_flags() and call it
in both lo_open() and lo_create().

This fixes the failure of xfstest generic/069 in writeback mode
(which tests O_APPEND write data integrity).

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 66 ++++++++++++++++----------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 948cb19c77..4c61ac5065 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1692,6 +1692,37 @@ static void lo_releasedir(fuse_req_t req, fuse_ino_t=
 ino,
     fuse_reply_err(req, 0);
 }
=20
+static void update_open_flags(int writeback, struct fuse_file_info *fi)
+{
+    /*
+     * With writeback cache, kernel may send read requests even
+     * when userspace opened write-only
+     */
+    if (writeback && (fi->flags & O_ACCMODE) =3D=3D O_WRONLY) {
+        fi->flags &=3D ~O_ACCMODE;
+        fi->flags |=3D O_RDWR;
+    }
+
+    /*
+     * With writeback cache, O_APPEND is handled by the kernel.
+     * This breaks atomicity (since the file may change in the
+     * underlying filesystem, so that the kernel's idea of the
+     * end of the file isn't accurate anymore). In this example,
+     * we just accept that. A more rigorous filesystem may want
+     * to return an error here
+     */
+    if (writeback && (fi->flags & O_APPEND)) {
+        fi->flags &=3D ~O_APPEND;
+    }
+
+    /*
+     * O_DIRECT in guest should not necessarily mean bypassing page
+     * cache on host as well. If somebody needs that behavior, it
+     * probably should be a configuration knob in daemon.
+     */
+    fi->flags &=3D ~O_DIRECT;
+}
+
 static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
                       mode_t mode, struct fuse_file_info *fi)
 {
@@ -1721,12 +1752,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t par=
ent, const char *name,
         goto out;
     }
=20
-    /*
-     * O_DIRECT in guest should not necessarily mean bypassing page
-     * cache on host as well. If somebody needs that behavior, it
-     * probably should be a configuration knob in daemon.
-     */
-    fi->flags &=3D ~O_DIRECT;
+    update_open_flags(lo->writeback, fi);
=20
     fd =3D openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOL=
LOW,
                 mode);
@@ -1936,33 +1962,7 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, =
struct fuse_file_info *fi)
     fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=3D%" PRIu64 ", flags=3D%d)\n", i=
no,
              fi->flags);
=20
-    /*
-     * With writeback cache, kernel may send read requests even
-     * when userspace opened write-only
-     */
-    if (lo->writeback && (fi->flags & O_ACCMODE) =3D=3D O_WRONLY) {
-        fi->flags &=3D ~O_ACCMODE;
-        fi->flags |=3D O_RDWR;
-    }
-
-    /*
-     * With writeback cache, O_APPEND is handled by the kernel.
-     * This breaks atomicity (since the file may change in the
-     * underlying filesystem, so that the kernel's idea of the
-     * end of the file isn't accurate anymore). In this example,
-     * we just accept that. A more rigorous filesystem may want
-     * to return an error here
-     */
-    if (lo->writeback && (fi->flags & O_APPEND)) {
-        fi->flags &=3D ~O_APPEND;
-    }
-
-    /*
-     * O_DIRECT in guest should not necessarily mean bypassing page
-     * cache on host as well. If somebody needs that behavior, it
-     * probably should be a configuration knob in daemon.
-     */
-    fi->flags &=3D ~O_DIRECT;
+    update_open_flags(lo->writeback, fi);
=20
     sprintf(buf, "%i", lo_fd(req, ino));
     fd =3D openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
--=20
2.24.1


