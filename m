Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927E7147197
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:16:25 +0100 (CET)
Received: from localhost ([::1]:35458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuhxn-0002yU-Q2
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42647)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iuff3-0006EI-Q1
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iuff1-0000Dz-MR
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:53 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27877
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iuff1-0000Ck-Jb
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gB1RSOX5RQcMIwg7eijdA5s/Ix1cF/u9GB6nvKLgVHA=;
 b=jSyq+bIB71N/deFF2pWJ2OOcCbu/vGgwMznXDIHbYqjEKja+WXHB1D9EjcxvW0ciuNMfFS
 +vNCpsr0EPheWEQ/WfnF672HZhM+SdMIkJ9QQRWw2KK3lVZo05Q13URCm/CXGtPOANyvAs
 dogEIl49w15Asvgno2YyLe+tNrxnOaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-ipYvL-KJMXq5QVzLxB2u1A-1; Thu, 23 Jan 2020 11:48:45 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D57748045C4
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:48:44 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D99F19C69;
 Thu, 23 Jan 2020 16:48:44 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 099/108] virtiofsd: add definition of fuse_buf_writev()
Date: Thu, 23 Jan 2020 16:46:21 +0000
Message-Id: <20200123164630.91498-100-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ipYvL-KJMXq5QVzLxB2u1A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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

Define fuse_buf_writev() which use pwritev and writev to improve io
bandwidth. Especially, the src bufs with 0 size should be skipped as
their mems are not *block_size* aligned which will cause writev failed
in direct io mode.

Signed-off-by: Jun Piao <piaojun@huawei.com>
Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/buffer.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
index 42a608f6bd..37befebac2 100644
--- a/tools/virtiofsd/buffer.c
+++ b/tools/virtiofsd/buffer.c
@@ -14,6 +14,7 @@
 #include "fuse_lowlevel.h"
 #include <assert.h>
 #include <errno.h>
+#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
=20
@@ -33,6 +34,43 @@ size_t fuse_buf_size(const struct fuse_bufvec *bufv)
     return size;
 }
=20
+__attribute__((unused))
+static ssize_t fuse_buf_writev(struct fuse_buf *out_buf,
+                               struct fuse_bufvec *in_buf)
+{
+    ssize_t res, i, j;
+    size_t iovcnt =3D in_buf->count;
+    struct iovec *iov;
+    int fd =3D out_buf->fd;
+
+    iov =3D calloc(iovcnt, sizeof(struct iovec));
+    if (!iov) {
+        return -ENOMEM;
+    }
+
+    for (i =3D 0, j =3D 0; i < iovcnt; i++) {
+        /* Skip the buf with 0 size */
+        if (in_buf->buf[i].size) {
+            iov[j].iov_base =3D in_buf->buf[i].mem;
+            iov[j].iov_len =3D in_buf->buf[i].size;
+            j++;
+        }
+    }
+
+    if (out_buf->flags & FUSE_BUF_FD_SEEK) {
+        res =3D pwritev(fd, iov, iovcnt, out_buf->pos);
+    } else {
+        res =3D writev(fd, iov, iovcnt);
+    }
+
+    if (res =3D=3D -1) {
+        res =3D -errno;
+    }
+
+    free(iov);
+    return res;
+}
+
 static size_t min_size(size_t s1, size_t s2)
 {
     return s1 < s2 ? s1 : s2;
--=20
2.24.1


