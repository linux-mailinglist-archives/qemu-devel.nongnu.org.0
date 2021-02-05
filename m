Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8867A310569
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:06:29 +0100 (CET)
Received: from localhost ([::1]:41342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vCG-0007I1-IG
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v35-0001If-5E
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v33-0001Ch-9Z
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AWGpCc9HFIl4FnRtD+D+nbkEVjBryDWqHQOY4oshYxk=;
 b=fvB5dfgX64Y/IVF9t+d6fuFoXUB+Z5xeuQ/tAAflSyp5lXvzq5wZq4el4Z4oIbmAOBibaP
 ukhlux4qUhKs4lK9RisvaCWYQvg+DAX/Ue2EA9rqC7ZnNfL32q9hOXsjcGa2CvqBP597UU
 b+qIB1W66OepkkZxtI4dy+aTKdtuDAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-acRQP3ULMP6eDqtc28aQsw-1; Fri, 05 Feb 2021 01:56:54 -0500
X-MC-Unique: acRQP3ULMP6eDqtc28aQsw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9095192CC41
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B72BC60C5F;
 Fri,  5 Feb 2021 06:56:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 062ED18003B7; Fri,  5 Feb 2021 07:56:21 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/24] ui: add gd_gl_area_scanout_disable
Date: Fri,  5 Feb 2021 07:56:07 +0100
Message-Id: <20210205065620.1726554-12-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Require the callback, drop the fallback path.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210204105232.834642-8-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/gtk.h | 1 +
 ui/console.c     | 7 +------
 ui/gtk-gl-area.c | 7 +++++++
 ui/gtk.c         | 1 +
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 3f395d7f943b..7569d090fa95 100644
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
index c0b1a3689c3d..ab9224429e29 100644
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
index 98c22d23f501..96fbe75387ce 100644
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
index a0e6b60ac4f5..00045881b121 100644
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
2.29.2


