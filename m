Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AEA30F154
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:58:39 +0100 (CET)
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cLO-0004g0-Cv
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cHm-0008Eg-SK
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:54:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cHk-0008I0-W4
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612436092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yde8X9XnmKn2gyM1YtGKEctJEWrVEdKdCqcaQ86u+Kk=;
 b=O4jZdQP/dYk1tuOXAC07hBlS/3X3a0QQ6lTs71cH5BZ5xGOdBxdFX1ZiMTys5ykEae9hE1
 wD4xv1W0idxjn4Jb2gXQFV5Bl+fZFKT8NMyKu9IpgpFBzhTMFhrlxEIlCMDPZQ2TzYNlWv
 KHIQ+gPNKDw8UHQAIW8WwbLAZ0l5oHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-RnZtLy4XNd2ZRAjgDhi7ng-1; Thu, 04 Feb 2021 05:54:50 -0500
X-MC-Unique: RnZtLy4XNd2ZRAjgDhi7ng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3221874983
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 10:54:49 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C99215FC3A;
 Thu,  4 Feb 2021 10:54:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/20] ui: add an optional get_flags callback to
 GraphicHwOps
Date: Thu,  4 Feb 2021 14:52:23 +0400
Message-Id: <20210204105232.834642-12-marcandre.lureau@redhat.com>
In-Reply-To: <20210204105232.834642-1-marcandre.lureau@redhat.com>
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Those flags can be used to express different requirements for the
display or other needs.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h         |  9 +++++++++
 hw/display/virtio-gpu-base.c | 18 ++++++++++++++++++
 hw/display/virtio-vga.c      |  9 +++++++++
 hw/vfio/display.c            |  6 ++++++
 4 files changed, 42 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index ac989fdf70..0595aa9953 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -368,7 +368,16 @@ static inline void console_write_ch(console_ch_t *dest, uint32_t ch)
     *dest = ch;
 }
 
+enum {
+    GRAPHIC_FLAGS_NONE     = 0,
+    /* require a console/display with GL callbacks */
+    GRAPHIC_FLAGS_GL       = 1 << 0,
+    /* require a console/display with DMABUF import */
+    GRAPHIC_FLAGS_DMABUF   = 1 << 1,
+};
+
 typedef struct GraphicHwOps {
+    int (*get_flags)(void *opaque); /* optional, default 0 */
     void (*invalidate)(void *opaque);
     void (*gfx_update)(void *opaque);
     bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 40ccd00f94..f27a6fbe75 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -114,7 +114,25 @@ virtio_gpu_gl_block(void *opaque, bool block)
     }
 }
 
+static int
+virtio_gpu_get_flags(void *opaque)
+{
+    VirtIOGPUBase *g = opaque;
+    int flags = GRAPHIC_FLAGS_NONE;
+
+    if (virtio_gpu_virgl_enabled(g->conf)) {
+        flags |= GRAPHIC_FLAGS_GL;
+    }
+
+    if (virtio_gpu_dmabuf_enabled(g->conf)) {
+        flags |= GRAPHIC_FLAGS_DMABUF;
+    }
+
+    return flags;
+}
+
 static const GraphicHwOps virtio_gpu_ops = {
+    .get_flags = virtio_gpu_get_flags,
     .invalidate = virtio_gpu_invalidate_display,
     .gfx_update = virtio_gpu_update_display,
     .text_update = virtio_gpu_text_update,
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 81f776ee36..b071909b68 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -68,7 +68,16 @@ static void virtio_vga_base_gl_block(void *opaque, bool block)
     }
 }
 
+static int virtio_vga_base_get_flags(void *opaque)
+{
+    VirtIOVGABase *vvga = opaque;
+    VirtIOGPUBase *g = vvga->vgpu;
+
+    return g->hw_ops->get_flags(g);
+}
+
 static const GraphicHwOps virtio_vga_base_ops = {
+    .get_flags = virtio_vga_base_get_flags,
     .invalidate = virtio_vga_base_invalidate_display,
     .gfx_update = virtio_vga_base_update_display,
     .text_update = virtio_vga_base_text_update,
diff --git a/hw/vfio/display.c b/hw/vfio/display.c
index 42d67e870b..f04473e3ce 100644
--- a/hw/vfio/display.c
+++ b/hw/vfio/display.c
@@ -335,7 +335,13 @@ static void vfio_display_dmabuf_update(void *opaque)
     }
 }
 
+static int vfio_display_get_flags(void *opaque)
+{
+    return GRAPHIC_FLAGS_GL | GRAPHIC_FLAGS_DMABUF;
+}
+
 static const GraphicHwOps vfio_display_dmabuf_ops = {
+    .get_flags  = vfio_display_get_flags,
     .gfx_update = vfio_display_dmabuf_update,
     .ui_info    = vfio_display_edid_ui_info,
 };
-- 
2.29.0


