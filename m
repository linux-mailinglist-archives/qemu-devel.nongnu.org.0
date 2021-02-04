Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B97830F17C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:04:54 +0100 (CET)
Received: from localhost ([::1]:56748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cRR-0004CH-4l
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cH8-0006pk-Aa
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:54:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cH6-0007tW-5t
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:54:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612436051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqma0burnlHUoNw3xXyxvaS56E6bstS4Ok5rSSzEyj8=;
 b=Dvw/nPVKwBijD5yB873XsA6J7QhnYtAP9C4bWzyPdR51faasvAzFfQKE67Td6MXBmO/0gs
 DWkQK8oEwvu6T2o8U2T/rA4UI0HmH5ujb1NbgAYWqtf/RftowrDInmEHc8LKI3/IhIhWLO
 ziCFNwirgBecwIsgVOONbPA9jSHDcNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-6dQXFgj0NoaQLUkzAYPt9Q-1; Thu, 04 Feb 2021 05:54:09 -0500
X-MC-Unique: 6dQXFgj0NoaQLUkzAYPt9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D07CB195D560
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 10:54:08 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 715EC5D9EF;
 Thu,  4 Feb 2021 10:53:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/20] ui: add gd_gl_area_scanout_disable
Date: Thu,  4 Feb 2021 14:52:19 +0400
Message-Id: <20210204105232.834642-8-marcandre.lureau@redhat.com>
In-Reply-To: <20210204105232.834642-1-marcandre.lureau@redhat.com>
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
 kraxel@redhat.com
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


