Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B350406CCF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:20:16 +0200 (CEST)
Received: from localhost ([::1]:59448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgRz-0002lN-L0
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOgPP-000775-LK
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:17:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOgPN-0004jT-Lt
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:17:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631279852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVhjy4EBdeIAiJLE5tLtzGA/26BZ/4pSj8tdlZDlOsQ=;
 b=jLwR6be32jN2qUqom8Eq36CcFh1YsVYAin1CfEluj4WoSC5NIVnZcSBx0zb5sAChi+G4cb
 ADktUBMaJeMjWNy4NDgjezZBd8KLWp02w+B3ezQfwi14EhZ5Ff0X1JctglVQtOenzPSM7x
 pdS4nB8jjktkJBavv2W5nGqw2QnPrX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-V2sgdWcGOJWl4s1GA-gRXg-1; Fri, 10 Sep 2021 09:17:31 -0400
X-MC-Unique: V2sgdWcGOJWl4s1GA-gRXg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A1671B18BC1;
 Fri, 10 Sep 2021 13:17:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF8615C1A1;
 Fri, 10 Sep 2021 13:17:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 242A6180060E; Fri, 10 Sep 2021 15:17:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] ui/gtk-egl: Wait for the draw signal for dmabuf blobs
Date: Fri, 10 Sep 2021 15:17:07 +0200
Message-Id: <20210910131709.3681492-5-kraxel@redhat.com>
In-Reply-To: <20210910131709.3681492-1-kraxel@redhat.com>
References: <20210910131709.3681492-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

Instead of immediately drawing and submitting, queue and wait
for the draw signal if the dmabuf submitted is a blob.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210901211014.2800391-5-vivek.kasireddy@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/gtk.h |  2 ++
 ui/gtk-egl.c     | 15 +++++++++++++++
 ui/gtk.c         |  2 +-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 43854f350907..7d22affd381a 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -182,6 +182,8 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl,
                           uint32_t hot_x, uint32_t hot_y);
 void gd_egl_cursor_position(DisplayChangeListener *dcl,
                             uint32_t pos_x, uint32_t pos_y);
+void gd_egl_flush(DisplayChangeListener *dcl,
+                  uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gd_egl_scanout_flush(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gtk_egl_init(DisplayGLMode mode);
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 2c68696d9fab..737e7b90d47b 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -304,6 +304,21 @@ void gd_egl_scanout_flush(DisplayChangeListener *dcl,
     eglSwapBuffers(qemu_egl_display, vc->gfx.esurface);
 }
 
+void gd_egl_flush(DisplayChangeListener *dcl,
+                  uint32_t x, uint32_t y, uint32_t w, uint32_t h)
+{
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+    GtkWidget *area = vc->gfx.drawing_area;
+
+    if (vc->gfx.guest_fb.dmabuf) {
+        graphic_hw_gl_block(vc->gfx.dcl.con, true);
+        gtk_widget_queue_draw_area(area, x, y, w, h);
+        return;
+    }
+
+    gd_egl_scanout_flush(&vc->gfx.dcl, x, y, w, h);
+}
+
 void gtk_egl_init(DisplayGLMode mode)
 {
     GdkDisplay *gdk_display = gdk_display_get_default();
diff --git a/ui/gtk.c b/ui/gtk.c
index 5105c0a33ff1..b0564d80c191 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -637,7 +637,7 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_scanout_dmabuf   = gd_egl_scanout_dmabuf,
     .dpy_gl_cursor_dmabuf    = gd_egl_cursor_dmabuf,
     .dpy_gl_cursor_position  = gd_egl_cursor_position,
-    .dpy_gl_update           = gd_egl_scanout_flush,
+    .dpy_gl_update           = gd_egl_flush,
     .dpy_gl_release_dmabuf   = gd_gl_release_dmabuf,
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
-- 
2.31.1


