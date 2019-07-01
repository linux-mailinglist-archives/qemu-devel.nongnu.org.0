Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5031BD6B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 20:50:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQG1u-00077t-Aj
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 14:50:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hQFwg-0003Tx-65
	for qemu-devel@nongnu.org; Mon, 13 May 2019 14:45:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hQFwe-0003l4-7u
	for qemu-devel@nongnu.org; Mon, 13 May 2019 14:45:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42686)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1hQFwc-0003j5-8s
	for qemu-devel@nongnu.org; Mon, 13 May 2019 14:45:04 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3E5859467
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 18:45:00 +0000 (UTC)
Received: from localhost (unknown [10.36.112.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6EC321001943;
	Mon, 13 May 2019 18:45:00 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 20:44:28 +0200
Message-Id: <20190513184433.21038-4-marcandre.lureau@redhat.com>
In-Reply-To: <20190513184433.21038-1-marcandre.lureau@redhat.com>
References: <20190513184433.21038-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 13 May 2019 18:45:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 3/8] virtio-gpu: add a pixman helper header
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow to share the format conversion function with
vhost-user-gpu.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/hw/virtio/virtio-gpu-pixman.h | 45 +++++++++++++++++++++++++++
 hw/display/virtio-gpu.c               | 29 ++---------------
 2 files changed, 48 insertions(+), 26 deletions(-)
 create mode 100644 include/hw/virtio/virtio-gpu-pixman.h

diff --git a/include/hw/virtio/virtio-gpu-pixman.h b/include/hw/virtio/vi=
rtio-gpu-pixman.h
new file mode 100644
index 0000000000..4dba782758
--- /dev/null
+++ b/include/hw/virtio/virtio-gpu-pixman.h
@@ -0,0 +1,45 @@
+/*
+ * Virtio GPU Device
+ *
+ * Copyright Red Hat, Inc. 2013-2014
+ *
+ * Authors:
+ *     Dave Airlie <airlied@redhat.com>
+ *     Gerd Hoffmann <kraxel@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_VIRTIO_GPU_PIXMAN_H
+#define HW_VIRTIO_GPU_PIXMAN_H
+
+#include "ui/qemu-pixman.h"
+#include "standard-headers/linux/virtio_gpu.h"
+
+static inline pixman_format_code_t
+virtio_gpu_get_pixman_format(uint32_t virtio_gpu_format)
+{
+    switch (virtio_gpu_format) {
+    case VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM:
+        return PIXMAN_BE_b8g8r8x8;
+    case VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM:
+        return PIXMAN_BE_b8g8r8a8;
+    case VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM:
+        return PIXMAN_BE_x8r8g8b8;
+    case VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM:
+        return PIXMAN_BE_a8r8g8b8;
+    case VIRTIO_GPU_FORMAT_R8G8B8X8_UNORM:
+        return PIXMAN_BE_r8g8b8x8;
+    case VIRTIO_GPU_FORMAT_R8G8B8A8_UNORM:
+        return PIXMAN_BE_r8g8b8a8;
+    case VIRTIO_GPU_FORMAT_X8B8G8R8_UNORM:
+        return PIXMAN_BE_x8b8g8r8;
+    case VIRTIO_GPU_FORMAT_A8B8G8R8_UNORM:
+        return PIXMAN_BE_a8b8g8r8;
+    default:
+        return 0;
+    }
+}
+
+#endif
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index c35025b6fb..3262f7f1f1 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -21,6 +21,7 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-gpu.h"
 #include "hw/virtio/virtio-gpu-bswap.h"
+#include "hw/virtio/virtio-gpu-pixman.h"
 #include "hw/virtio/virtio-bus.h"
 #include "hw/display/edid.h"
 #include "migration/blocker.h"
@@ -298,30 +299,6 @@ void virtio_gpu_get_edid(VirtIOGPU *g,
     virtio_gpu_ctrl_response(g, cmd, &edid.hdr, sizeof(edid));
 }
=20
-static pixman_format_code_t get_pixman_format(uint32_t virtio_gpu_format=
)
-{
-    switch (virtio_gpu_format) {
-    case VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM:
-        return PIXMAN_BE_b8g8r8x8;
-    case VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM:
-        return PIXMAN_BE_b8g8r8a8;
-    case VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM:
-        return PIXMAN_BE_x8r8g8b8;
-    case VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM:
-        return PIXMAN_BE_a8r8g8b8;
-    case VIRTIO_GPU_FORMAT_R8G8B8X8_UNORM:
-        return PIXMAN_BE_r8g8b8x8;
-    case VIRTIO_GPU_FORMAT_R8G8B8A8_UNORM:
-        return PIXMAN_BE_r8g8b8a8;
-    case VIRTIO_GPU_FORMAT_X8B8G8R8_UNORM:
-        return PIXMAN_BE_x8b8g8r8;
-    case VIRTIO_GPU_FORMAT_A8B8G8R8_UNORM:
-        return PIXMAN_BE_a8b8g8r8;
-    default:
-        return 0;
-    }
-}
-
 static uint32_t calc_image_hostmem(pixman_format_code_t pformat,
                                    uint32_t width, uint32_t height)
 {
@@ -368,7 +345,7 @@ static void virtio_gpu_resource_create_2d(VirtIOGPU *=
g,
     res->format =3D c2d.format;
     res->resource_id =3D c2d.resource_id;
=20
-    pformat =3D get_pixman_format(c2d.format);
+    pformat =3D virtio_gpu_get_pixman_format(c2d.format);
     if (!pformat) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: host couldn't handle guest format %d\n",
@@ -1142,7 +1119,7 @@ static int virtio_gpu_load(QEMUFile *f, void *opaqu=
e, size_t size,
         res->iov_cnt =3D qemu_get_be32(f);
=20
         /* allocate */
-        pformat =3D get_pixman_format(res->format);
+        pformat =3D virtio_gpu_get_pixman_format(res->format);
         if (!pformat) {
             g_free(res);
             return -EINVAL;
--=20
2.21.0.777.g83232e3864


