Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50171406CD5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:22:58 +0200 (CEST)
Received: from localhost ([::1]:35180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgUb-0005ay-BF
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOgPJ-0006sz-JO
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:17:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOgPD-0004aj-Vg
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631279842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9pQ4/0nLu/pwKy7CVMGCu3rwS8FTm5JF6YHVxkwPmY=;
 b=bXFjYS6Dql+dTj2wP3U/HfKjLKT6upQOYCOtVkTlvI9Kz1iSt0dqBk5J8+UnJ0k/YLJXr/
 TrKbTNkYeRV7+nOUvp3kt8+GiQGTuZE7ekBFt1rC+oUXIqZC+N62sgXtDNiSLmgoVZ4any
 Osh8cH6qzz29lJt9fCCUbOQ0PFkDbPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-mXrEE8AkP8unnvwoXPkgXA-1; Fri, 10 Sep 2021 09:17:21 -0400
X-MC-Unique: mXrEE8AkP8unnvwoXPkgXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27DCB1084683;
 Fri, 10 Sep 2021 13:17:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71E6660C04;
 Fri, 10 Sep 2021 13:17:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E4221180038E; Fri, 10 Sep 2021 15:17:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] ui/gtk: Create a common release_dmabuf helper
Date: Fri, 10 Sep 2021 15:17:04 +0200
Message-Id: <20210910131709.3681492-2-kraxel@redhat.com>
In-Reply-To: <20210910131709.3681492-1-kraxel@redhat.com>
References: <20210910131709.3681492-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Since the texture release mechanism is same for both gtk-egl
and gtk-glarea, move the helper from gtk-egl to common gtk
code so that it can be shared by both gtk backends.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210901211014.2800391-2-vivek.kasireddy@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/gtk.h |  2 --
 ui/gtk-egl.c     |  8 --------
 ui/gtk.c         | 11 ++++++++++-
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 7835ef1a7108..8e98a79ac813 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -181,8 +181,6 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl,
                           uint32_t hot_x, uint32_t hot_y);
 void gd_egl_cursor_position(DisplayChangeListener *dcl,
                             uint32_t pos_x, uint32_t pos_y);
-void gd_egl_release_dmabuf(DisplayChangeListener *dcl,
-                           QemuDmaBuf *dmabuf);
 void gd_egl_scanout_flush(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gtk_egl_init(DisplayGLMode mode);
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 2a2e6d3a17d4..b671181272d5 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -249,14 +249,6 @@ void gd_egl_cursor_position(DisplayChangeListener *dcl,
     vc->gfx.cursor_y = pos_y * vc->gfx.scale_y;
 }
 
-void gd_egl_release_dmabuf(DisplayChangeListener *dcl,
-                           QemuDmaBuf *dmabuf)
-{
-#ifdef CONFIG_GBM
-    egl_dmabuf_release_texture(dmabuf);
-#endif
-}
-
 void gd_egl_scanout_flush(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h)
 {
diff --git a/ui/gtk.c b/ui/gtk.c
index cfb0728d1fb4..784a2f6c749c 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -575,6 +575,14 @@ static bool gd_has_dmabuf(DisplayChangeListener *dcl)
     return vc->gfx.has_dmabuf;
 }
 
+static void gd_gl_release_dmabuf(DisplayChangeListener *dcl,
+                                 QemuDmaBuf *dmabuf)
+{
+#ifdef CONFIG_GBM
+    egl_dmabuf_release_texture(dmabuf);
+#endif
+}
+
 /** DisplayState Callbacks (opengl version) **/
 
 static const DisplayChangeListenerOps dcl_gl_area_ops = {
@@ -593,6 +601,7 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_gl_scanout_disable  = gd_gl_area_scanout_disable,
     .dpy_gl_update           = gd_gl_area_scanout_flush,
     .dpy_gl_scanout_dmabuf   = gd_gl_area_scanout_dmabuf,
+    .dpy_gl_release_dmabuf   = gd_gl_release_dmabuf,
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
@@ -615,8 +624,8 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_scanout_dmabuf   = gd_egl_scanout_dmabuf,
     .dpy_gl_cursor_dmabuf    = gd_egl_cursor_dmabuf,
     .dpy_gl_cursor_position  = gd_egl_cursor_position,
-    .dpy_gl_release_dmabuf   = gd_egl_release_dmabuf,
     .dpy_gl_update           = gd_egl_scanout_flush,
+    .dpy_gl_release_dmabuf   = gd_gl_release_dmabuf,
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
-- 
2.31.1


