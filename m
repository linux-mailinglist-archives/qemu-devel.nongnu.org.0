Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1FA1471A7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:19:44 +0100 (CET)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iui10-0006h6-HH
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42649)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iuff4-0006EX-0I
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iuff1-0000E9-Q7
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21168
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iuff1-0000DN-NA
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xPTFVLKkpPqpNGMFw2Pb4zQ3DPr6AATTIVJBUAAy3pk=;
 b=N3JAtRXsEXYwayd12rpqTvH21XRCxzrTe11ccQ0CtIC7akQHzdxP64+yn9Bph6zVSwlrd+
 NI879OQLt5mC/yeN/A40ttAdriYcbxGHhq0UcrhLHV/X/jleuHJjhJH+sep2omfaA+X838
 QoWHOfNQvth7gYaa1c3c02KbTQkHGHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-OgWC6KlXMrud1H1WTFIAig-1; Thu, 23 Jan 2020 11:48:49 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 306D48C84CC
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:48:48 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BD3228993;
 Thu, 23 Jan 2020 16:48:45 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 100/108] virtiofsd: use fuse_buf_writev to replace
 fuse_buf_write for better performance
Date: Thu, 23 Jan 2020 16:46:22 +0000
Message-Id: <20200123164630.91498-101-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: OgWC6KlXMrud1H1WTFIAig-1
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

From: piaojun <piaojun@huawei.com>

fuse_buf_writev() only handles the normal write in which src is buffer
and dest is fd. Specially if src buffer represents guest physical
address that can't be mapped by the daemon process, IO must be bounced
back to the VMM to do it by fuse_buf_copy().

Signed-off-by: Jun Piao <piaojun@huawei.com>
Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/buffer.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
index 37befebac2..27c1377f22 100644
--- a/tools/virtiofsd/buffer.c
+++ b/tools/virtiofsd/buffer.c
@@ -34,7 +34,6 @@ size_t fuse_buf_size(const struct fuse_bufvec *bufv)
     return size;
 }
=20
-__attribute__((unused))
 static ssize_t fuse_buf_writev(struct fuse_buf *out_buf,
                                struct fuse_bufvec *in_buf)
 {
@@ -262,12 +261,29 @@ static int fuse_bufvec_advance(struct fuse_bufvec *bu=
fv, size_t len)
=20
 ssize_t fuse_buf_copy(struct fuse_bufvec *dstv, struct fuse_bufvec *srcv)
 {
-    size_t copied =3D 0;
+    size_t copied =3D 0, i;
=20
     if (dstv =3D=3D srcv) {
         return fuse_buf_size(dstv);
     }
=20
+    /*
+     * use writev to improve bandwidth when all the
+     * src buffers already mapped by the daemon
+     * process
+     */
+    for (i =3D 0; i < srcv->count; i++) {
+        if (srcv->buf[i].flags & FUSE_BUF_IS_FD) {
+            break;
+        }
+    }
+    if ((i =3D=3D srcv->count) && (dstv->count =3D=3D 1) &&
+        (dstv->idx =3D=3D 0) &&
+        (dstv->buf[0].flags & FUSE_BUF_IS_FD)) {
+        dstv->buf[0].pos +=3D dstv->off;
+        return fuse_buf_writev(&dstv->buf[0], srcv);
+    }
+
     for (;;) {
         const struct fuse_buf *src =3D fuse_bufvec_current(srcv);
         const struct fuse_buf *dst =3D fuse_bufvec_current(dstv);
--=20
2.24.1


