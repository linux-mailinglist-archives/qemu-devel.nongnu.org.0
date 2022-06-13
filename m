Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA8A548503
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 13:57:48 +0200 (CEST)
Received: from localhost ([::1]:41728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0ihX-0002uy-KC
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 07:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o0iNX-0001Tx-8D
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:37:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o0iNU-0002L6-R5
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655120223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/Rq0T4qHdj5P4fsrjuVBaKf49W5WppINvxKA/pkbYI=;
 b=QNP9udGfOSmGCNM5IAcXtor7yJxlrLai4f4wF9UIOoAAd57YXqSsZwoSYRPTKolgrqtOVg
 7Yu9Fy3JCIMu8pHXHArtCMoN+9OmDfDPADl/6FmuEkIps2v8KDYdfNlVakXfTF4kGFWR2x
 XDNBb9ysLuf9UQhbqOZ8qC+ZM9R3XG4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-fRcmcX6VO6ac2iBNsirumA-1; Mon, 13 Jun 2022 07:36:59 -0400
X-MC-Unique: fRcmcX6VO6ac2iBNsirumA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA5A7100BAC0;
 Mon, 13 Jun 2022 11:36:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42140492C3B;
 Mon, 13 Jun 2022 11:36:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DCEDF18007B8; Mon, 13 Jun 2022 13:36:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Canokeys.org" <contact@canokeys.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 01/16] ui/gtk-gl-area: implement GL context destruction
Date: Mon, 13 Jun 2022 13:36:40 +0200
Message-Id: <20220613113655.3693872-2-kraxel@redhat.com>
In-Reply-To: <20220613113655.3693872-1-kraxel@redhat.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

The counterpart function for gd_gl_area_create_context() is
currently empty. Implement the gd_gl_area_destroy_context()
function to avoid GL context leaks.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220605085131.7711-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk-gl-area.c | 8 +++++++-
 ui/trace-events  | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index fc5a082eb846..0e20ea031d34 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -201,7 +201,13 @@ QEMUGLContext gd_gl_area_create_context(DisplayGLCtx *dgc,
 
 void gd_gl_area_destroy_context(DisplayGLCtx *dgc, QEMUGLContext ctx)
 {
-    /* FIXME */
+    GdkGLContext *current_ctx = gdk_gl_context_get_current();
+
+    trace_gd_gl_area_destroy_context(ctx, current_ctx);
+    if (ctx == current_ctx) {
+        gdk_gl_context_clear_current();
+    }
+    g_clear_object(&ctx);
 }
 
 void gd_gl_area_scanout_texture(DisplayChangeListener *dcl,
diff --git a/ui/trace-events b/ui/trace-events
index f78b5e66061f..1040ba0f88c7 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -26,6 +26,7 @@ gd_key_event(const char *tab, int gdk_keycode, int qkeycode, const char *action)
 gd_grab(const char *tab, const char *device, const char *reason) "tab=%s, dev=%s, reason=%s"
 gd_ungrab(const char *tab, const char *device) "tab=%s, dev=%s"
 gd_keymap_windowing(const char *name) "backend=%s"
+gd_gl_area_destroy_context(void *ctx, void *current_ctx) "ctx=%p, current_ctx=%p"
 
 # vnc-auth-sasl.c
 # vnc-auth-vencrypt.c
-- 
2.36.1


