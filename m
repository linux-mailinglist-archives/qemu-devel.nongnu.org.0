Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45849143F32
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 15:17:10 +0100 (CET)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ituL6-00047o-Vd
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 09:17:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52846)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsi0-0003eU-IA
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:32:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itshw-0004xu-H8
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:32:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52557
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itshw-0004xl-D6
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2dbUAWAejYnRc42sWcPyVmlxq/L9lJHFi3bByYfEubM=;
 b=QLnAGf18jTiiZyHOl6GMceaZ0bq5rh876jfiiXnjo1/YfCz4j7jMTViVoI7dbLrngcNJQR
 37oZZeiusPBIE99X5UxA3I8SAcPQ8S1xHls/iTiAZaDSAZ+QaTOIawoZJE6KNErS1Be7yM
 Ee6Rde6qSe2yxMRCuT64xrk9OCiFp9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-tDJ7Rh4OP76mz5gzdkyFdg-1; Tue, 21 Jan 2020 07:32:34 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABD28DB22;
 Tue, 21 Jan 2020 12:32:33 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E06C960BE0;
 Tue, 21 Jan 2020 12:32:31 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 100/109] virtiofsd: add definition of fuse_buf_writev()
Date: Tue, 21 Jan 2020 12:24:24 +0000
Message-Id: <20200121122433.50803-101-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: tDJ7Rh4OP76mz5gzdkyFdg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
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
---
 tools/virtiofsd/buffer.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
index 918e0f41e0..70980550d2 100644
--- a/tools/virtiofsd/buffer.c
+++ b/tools/virtiofsd/buffer.c
@@ -13,6 +13,7 @@
 #include "fuse_lowlevel.h"
 #include <assert.h>
 #include <errno.h>
+#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
=20
@@ -32,6 +33,43 @@ size_t fuse_buf_size(const struct fuse_bufvec *bufv)
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


