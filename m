Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C87B143DF5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:24:28 +0100 (CET)
Received: from localhost ([::1]:53760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittW7-0000P0-8P
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51742)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsdj-0008MT-7b
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsdf-00033w-5J
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44748
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsde-00033W-VI
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBF2Y9nkezpnXKnGhywn1BsxUXsjHbXc0YWyFevohj0=;
 b=hn9d3D4XEt9E0jF1lSKmqqO/tLAuUHPa06DegpNAZA3Iw85g/qABJsaBmVch1Jd8rhisTy
 anTIOMUXR+giO04+naujWMWI2yC5rNkBSwutLxw0CHxWSu7VLAjjm0jA0AYEHOafFVA/LU
 o3iegj7aExmzY8gB+/yrvfuy4/jdLM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-OuZijAa6OLO-M6oAH_Umvw-1; Tue, 21 Jan 2020 07:28:08 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D73C9937C2;
 Tue, 21 Jan 2020 12:28:06 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A6FC60BE0;
 Tue, 21 Jan 2020 12:28:04 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 042/109] virtiofsd: add fuse_mbuf_iter API
Date: Tue, 21 Jan 2020 12:23:26 +0000
Message-Id: <20200121122433.50803-43-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: OuZijAa6OLO-M6oAH_Umvw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

From: Stefan Hajnoczi <stefanha@redhat.com>

Introduce an API for consuming bytes from a buffer with size checks.
All FUSE operations will be converted to use this safe API instead of
void *inarg.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/buffer.c      | 28 ++++++++++++++++++++
 tools/virtiofsd/fuse_common.h | 49 ++++++++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
index db1885ab19..918e0f41e0 100644
--- a/tools/virtiofsd/buffer.c
+++ b/tools/virtiofsd/buffer.c
@@ -267,3 +267,31 @@ ssize_t fuse_buf_copy(struct fuse_bufvec *dstv, struct=
 fuse_bufvec *srcv,
=20
     return copied;
 }
+
+void *fuse_mbuf_iter_advance(struct fuse_mbuf_iter *iter, size_t len)
+{
+    void *ptr;
+
+    if (len > iter->size - iter->pos) {
+        return NULL;
+    }
+
+    ptr =3D iter->mem + iter->pos;
+    iter->pos +=3D len;
+    return ptr;
+}
+
+const char *fuse_mbuf_iter_advance_str(struct fuse_mbuf_iter *iter)
+{
+    const char *str =3D iter->mem + iter->pos;
+    size_t remaining =3D iter->size - iter->pos;
+    size_t i;
+
+    for (i =3D 0; i < remaining; i++) {
+        if (str[i] =3D=3D '\0') {
+            iter->pos +=3D i + 1;
+            return str;
+        }
+    }
+    return NULL;
+}
diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index bd9bf861f0..deac132081 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -747,10 +747,57 @@ size_t fuse_buf_size(const struct fuse_bufvec *bufv);
 ssize_t fuse_buf_copy(struct fuse_bufvec *dst, struct fuse_bufvec *src,
                       enum fuse_buf_copy_flags flags);
=20
+/**
+ * Memory buffer iterator
+ *
+ */
+struct fuse_mbuf_iter {
+    /**
+     * Data pointer
+     */
+    void *mem;
+
+    /**
+     * Total length, in bytes
+     */
+    size_t size;
+
+    /**
+     * Offset from start of buffer
+     */
+    size_t pos;
+};
+
+/* Initialize memory buffer iterator from a fuse_buf */
+#define FUSE_MBUF_ITER_INIT(fbuf) \
+    ((struct fuse_mbuf_iter){     \
+        .mem =3D fbuf->mem,         \
+        .size =3D fbuf->size,       \
+        .pos =3D 0,                 \
+    })
+
+/**
+ * Consume bytes from a memory buffer iterator
+ *
+ * @param iter memory buffer iterator
+ * @param len number of bytes to consume
+ * @return pointer to start of consumed bytes or
+ *         NULL if advancing beyond end of buffer
+ */
+void *fuse_mbuf_iter_advance(struct fuse_mbuf_iter *iter, size_t len);
+
+/**
+ * Consume a NUL-terminated string from a memory buffer iterator
+ *
+ * @param iter memory buffer iterator
+ * @return pointer to the string or
+ *         NULL if advancing beyond end of buffer or there is no NUL-termi=
nator
+ */
+const char *fuse_mbuf_iter_advance_str(struct fuse_mbuf_iter *iter);
+
 /*
  * Signal handling
  */
-
 /**
  * Exit session on HUP, TERM and INT signals and ignore PIPE signal
  *
--=20
2.24.1


