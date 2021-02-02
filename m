Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA030C269
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:51:18 +0100 (CET)
Received: from localhost ([::1]:33774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6x1R-0001Zi-JS
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wgV-0003DR-Ao
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:29:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wgP-0003zc-NJ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iAjgD2HxI5CRJrYmtMdOMhwLEqD+c2PlXBfujPZTe+8=;
 b=NUUKQ0mi4xJgjRBKhbnhQJfcdou+h7ZoV5FRB3ZzZr0dwrFTsyCQeP4EN6U3Z7xZqySZWp
 382vQt+w1NYqCovHLKJwvsjnpkCrNW401vqSfbqgeXiLcfd5dICSGZ+mMZWDXMOfKzosIZ
 xjYFYZ2Hks4szTcjwxZ0VGWErhzx56Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-GzVyfvfaPB6mmMRfzLwWXA-1; Tue, 02 Feb 2021 09:29:30 -0500
X-MC-Unique: GzVyfvfaPB6mmMRfzLwWXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8645BBBEF0
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:29:29 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 044265D9C6;
 Tue,  2 Feb 2021 14:29:19 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 15/20] ui: check gtk-egl dmabuf support
Date: Tue,  2 Feb 2021 18:26:20 +0400
Message-Id: <20210202142625.609070-16-marcandre.lureau@redhat.com>
In-Reply-To: <20210202142625.609070-1-marcandre.lureau@redhat.com>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/gtk.h | 1 +
 ui/gtk.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 7569d090fa..aaef884b95 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -48,6 +48,7 @@ typedef struct VirtualGfxConsole {
     int cursor_y;
     bool y0_top;
     bool scanout_mode;
+    bool has_dmabuf;
 #endif
 } VirtualGfxConsole;
 
diff --git a/ui/gtk.c b/ui/gtk.c
index 00045881b1..f41c396cb9 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -623,6 +623,13 @@ static const DisplayChangeListenerOps dcl_ops = {
 
 #if defined(CONFIG_OPENGL)
 
+static bool gd_has_dmabuf(DisplayChangeListener *dcl)
+{
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+
+    return vc->gfx.has_dmabuf;
+}
+
 /** DisplayState Callbacks (opengl version) **/
 
 static const DisplayChangeListenerOps dcl_gl_area_ops = {
@@ -661,6 +668,7 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_cursor_position  = gd_egl_cursor_position,
     .dpy_gl_release_dmabuf   = gd_egl_release_dmabuf,
     .dpy_gl_update           = gd_egl_scanout_flush,
+    .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
 #endif /* CONFIG_OPENGL */
@@ -2004,6 +2012,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
             gtk_widget_set_double_buffered(vc->gfx.drawing_area, FALSE);
 #pragma GCC diagnostic pop
             vc->gfx.dcl.ops = &dcl_egl_ops;
+            vc->gfx.has_dmabuf = qemu_egl_has_dmabuf();
         }
     } else
 #endif
-- 
2.29.0


