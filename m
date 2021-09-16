Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6117440D308
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 08:05:57 +0200 (CEST)
Received: from localhost ([::1]:40298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQkWy-0002vD-FZ
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 02:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mQkOO-0000Td-Np
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:57:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mQkOL-0006x6-Rt
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631771819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pE/H6Up1ECb47ln2lM3dexSnbY5K8T7EmB416Zaaw7E=;
 b=C3e21xm56OFJpJ0Iv8g5TsC+KtpkCMJg+qNHgegkN2VC9cfTCHjQAWSdI2n1c4AY81kXXM
 yez43+u+nlj5CZv+8OIhMYzgfkBnkqOimAuCKas0Fr+l3oHxifmp8LiKeE4UPZWJGj5tT2
 Siz2oBAhc8zMlC2/1+/94zZmKVbRFt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-ufhJ9kHFPi2d4Qddyqb9Hw-1; Thu, 16 Sep 2021 01:56:57 -0400
X-MC-Unique: ufhJ9kHFPi2d4Qddyqb9Hw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DF1213E0;
 Thu, 16 Sep 2021 05:56:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62EFF5C1C5;
 Thu, 16 Sep 2021 05:56:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 307381800939; Thu, 16 Sep 2021 07:56:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] ui/gtk-egl: Wait for the draw signal for dmabuf blobs
Date: Thu, 16 Sep 2021 07:56:22 +0200
Message-Id: <20210916055623.1846418-6-kraxel@redhat.com>
In-Reply-To: <20210916055623.1846418-1-kraxel@redhat.com>
References: <20210916055623.1846418-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Message-Id: <20210914211837.3229977-5-vivek.kasireddy@intel.com>
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
index 3a90aeb2b9e1..72ce5e1f8f41 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -309,6 +309,21 @@ void gd_egl_scanout_flush(DisplayChangeListener *dcl,
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


