Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1D73389E4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:20:55 +0100 (CET)
Received: from localhost ([::1]:50872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeuc-0007Yq-Kr
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKegG-0004Gk-0P
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:06:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKegE-0004mS-0H
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqcirxw7PlLOaqPlNIi9jaYlIKwyGNvgiE8y1ygFVKo=;
 b=JgsedziwM50iQb98ca+IJMYy/KEvhnSQ7bDKb4nU7wPLxN7FK3PZshFE/ViT0lDwKU3sUc
 PlmYvZ19+9wj2fC6LSeuhsWbgZEqWeU2eVZ8QaNEpTFY1SYwxoYOpYh3R6IeSUuMfHTZ7t
 C+5/M2YRbAE56PBhjJc8pEeCePf8LXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-s1m-rMORMYCgme-vS3xzIQ-1; Fri, 12 Mar 2021 05:05:59 -0500
X-MC-Unique: s1m-rMORMYCgme-vS3xzIQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 773E5100C618
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:05:58 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F021D5DDAD;
 Fri, 12 Mar 2021 10:05:56 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 25/27] vhost-user-gpu: implement register_dbus_listener()
Date: Fri, 12 Mar 2021 14:01:06 +0400
Message-Id: <20210312100108.2706195-26-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Send the listener fd over the vhost-user connection if the backend
supports it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  1 +
 hw/display/vhost-user-gpu.c    | 33 +++++++++++++++++++++++++++++++++
 hw/display/virtio-gpu-base.c   | 14 ++++++++++++++
 hw/display/virtio-vga.c        | 10 ++++++++++
 4 files changed, 58 insertions(+)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index fae149235c..bf33c05121 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -122,6 +122,7 @@ struct VirtIOGPUBaseClass {
     VirtioDeviceClass parent;
 
     void (*gl_flushed)(VirtIOGPUBase *g);
+    bool (*register_dbus_listener)(VirtIOGPUBase *g, QemuConsole *con, int fd);
 };
 
 #define VIRTIO_GPU_BASE_PROPERTIES(_state, _conf)                       \
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index a2a011e9cc..b48ddabcc8 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -370,6 +370,38 @@ vhost_user_gpu_gl_flushed(VirtIOGPUBase *b)
     vhost_user_gpu_update_blocked(VHOST_USER_GPU(g), false);
 }
 
+static bool
+vhost_user_gpu_scanout_idx(VirtIOGPUBase *b, QemuConsole *con, uint8_t *idx)
+{
+    VhostUserGPU *g = VHOST_USER_GPU(b);
+    struct virtio_gpu_scanout *s;
+    uint8_t i;
+
+    for (i = 0; i < G_N_ELEMENTS(g->parent_obj.scanout); i++) {
+        s = &g->parent_obj.scanout[i];
+        if (s->con == con) {
+            *idx = i;
+            return true;
+        }
+    }
+
+    return false;
+}
+
+static bool
+vhost_user_gpu_do_register_dbus_listener(VirtIOGPUBase *b, QemuConsole *con, int fd)
+{
+    VhostUserGPU *g = VHOST_USER_GPU(b);
+    uint8_t idx = 0;
+
+    if (!vhost_user_gpu_scanout_idx(b, con, &idx)) {
+        error_report("Failed to find attached console %p", con);
+        return false;
+    }
+
+    return vhost_user_gpu_register_dbus_listener(&g->vhost->dev, idx, fd) == 0;
+}
+
 static bool
 vhost_user_gpu_do_set_socket(VhostUserGPU *g, Error **errp)
 {
@@ -577,6 +609,7 @@ vhost_user_gpu_class_init(ObjectClass *klass, void *data)
     VirtIOGPUBaseClass *vgc = VIRTIO_GPU_BASE_CLASS(klass);
 
     vgc->gl_flushed = vhost_user_gpu_gl_flushed;
+    vgc->register_dbus_listener = vhost_user_gpu_do_register_dbus_listener;
 
     vdc->realize = vhost_user_gpu_device_realize;
     vdc->reset = vhost_user_gpu_reset;
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index ee2753001a..392719a830 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -141,6 +141,19 @@ virtio_gpu_get_flags(void *opaque)
     return flags;
 }
 
+static bool
+virtio_gpu_register_dbus_listener(void *opaque, QemuConsole *con, int fd)
+{
+    VirtIOGPUBase *g = opaque;
+    VirtIOGPUBaseClass *vgc = VIRTIO_GPU_BASE_GET_CLASS(g);
+
+    if (vgc->register_dbus_listener) {
+        return vgc->register_dbus_listener(g, con, fd);
+    }
+
+    return false;
+}
+
 static const GraphicHwOps virtio_gpu_ops = {
     .get_flags = virtio_gpu_get_flags,
     .invalidate = virtio_gpu_invalidate_display,
@@ -148,6 +161,7 @@ static const GraphicHwOps virtio_gpu_ops = {
     .text_update = virtio_gpu_text_update,
     .ui_info = virtio_gpu_ui_info,
     .gl_block = virtio_gpu_gl_block,
+    .register_dbus_listener = virtio_gpu_register_dbus_listener,
 };
 
 bool
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index b071909b68..777c7fc409 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -76,6 +76,15 @@ static int virtio_vga_base_get_flags(void *opaque)
     return g->hw_ops->get_flags(g);
 }
 
+static bool virtio_vga_base_register_dbus_listener(void *opaque,
+                                                   QemuConsole *con, int fd)
+{
+    VirtIOVGABase *vvga = opaque;
+    VirtIOGPUBase *g = vvga->vgpu;
+
+    return g->hw_ops->register_dbus_listener(g, con, fd);
+}
+
 static const GraphicHwOps virtio_vga_base_ops = {
     .get_flags = virtio_vga_base_get_flags,
     .invalidate = virtio_vga_base_invalidate_display,
@@ -83,6 +92,7 @@ static const GraphicHwOps virtio_vga_base_ops = {
     .text_update = virtio_vga_base_text_update,
     .ui_info = virtio_vga_base_ui_info,
     .gl_block = virtio_vga_base_gl_block,
+    .register_dbus_listener = virtio_vga_base_register_dbus_listener,
 };
 
 static const VMStateDescription vmstate_virtio_vga_base = {
-- 
2.29.0


