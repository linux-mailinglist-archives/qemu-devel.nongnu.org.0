Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C2430C1FB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:39:36 +0100 (CET)
Received: from localhost ([::1]:34142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wq6-0005yg-QA
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wes-0008SX-GG
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:27:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6weq-0003GC-L6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:27:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqma0burnlHUoNw3xXyxvaS56E6bstS4Ok5rSSzEyj8=;
 b=aZDMqnZWycM6XmFK23z6LWC1mQI49izr4bJGolNbkjzN8sT/ZUcB17UfkV3emGmRYjqk+O
 aIJJDbQL6jhpMDNGWlHV8NpOLWxIF/EuFbE8yzCQ5zP4ymb3xVY9XMKQDtkuxJ0rbL39K7
 bDsEYknz5Bj1Sn2QIU2MGzAAfa1q/YE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-ZXcNNjPqM_Sg0BzL_NLl7g-1; Tue, 02 Feb 2021 09:27:53 -0500
X-MC-Unique: ZXcNNjPqM_Sg0BzL_NLl7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED62B108C21B
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:27:52 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FABB6E71A;
 Tue,  2 Feb 2021 14:27:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 07/20] ui: add gd_gl_area_scanout_disable
Date: Tue,  2 Feb 2021 18:26:12 +0400
Message-Id: <20210202142625.609070-8-marcandre.lureau@redhat.com>
In-Reply-To: <20210202142625.609070-1-marcandre.lureau@redhat.com>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Require the callback, drop the fallback path.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/gtk.h | 1 +
 ui/console.c     | 7 +------
 ui/gtk-gl-area.c | 7 +++++++
 ui/gtk.c         | 1 +
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 3f395d7f94..7569d090fa 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -140,6 +140,7 @@ void gd_gl_area_scanout_texture(DisplayChangeListener *dcl,
                                 uint32_t backing_height,
                                 uint32_t x, uint32_t y,
                                 uint32_t w, uint32_t h);
+void gd_gl_area_scanout_disable(DisplayChangeListener *dcl);
 void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
                               uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gtk_gl_area_init(void);
diff --git a/ui/console.c b/ui/console.c
index c0b1a3689c..ab9224429e 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1806,12 +1806,7 @@ int dpy_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx)
 void dpy_gl_scanout_disable(QemuConsole *con)
 {
     assert(con->gl);
-    if (con->gl->ops->dpy_gl_scanout_disable) {
-        con->gl->ops->dpy_gl_scanout_disable(con->gl);
-    } else {
-        con->gl->ops->dpy_gl_scanout_texture(con->gl, 0, false, 0, 0,
-                                             0, 0, 0, 0);
-    }
+    con->gl->ops->dpy_gl_scanout_disable(con->gl);
 }
 
 void dpy_gl_scanout_texture(QemuConsole *con,
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 98c22d23f5..96fbe75387 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -198,6 +198,13 @@ void gd_gl_area_scanout_texture(DisplayChangeListener *dcl,
                          backing_id, false);
 }
 
+void gd_gl_area_scanout_disable(DisplayChangeListener *dcl)
+{
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+
+    gtk_gl_area_set_scanout_mode(vc, false);
+}
+
 void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h)
 {
diff --git a/ui/gtk.c b/ui/gtk.c
index a0e6b60ac4..00045881b1 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -638,6 +638,7 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_gl_ctx_destroy      = gd_gl_area_destroy_context,
     .dpy_gl_ctx_make_current = gd_gl_area_make_current,
     .dpy_gl_scanout_texture  = gd_gl_area_scanout_texture,
+    .dpy_gl_scanout_disable  = gd_gl_area_scanout_disable,
     .dpy_gl_update           = gd_gl_area_scanout_flush,
 };
 
-- 
2.29.0


