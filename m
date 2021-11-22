Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0B2458EA9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:48:26 +0100 (CET)
Received: from localhost ([::1]:44682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8kD-00017H-Tn
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:48:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mp8co-0004km-5W
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:40:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mp8cm-00008G-5j
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:40:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637584842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4JaB0rIb8ZziaYLtht1TSLju4CiVwqQdj3eTMouM9Ek=;
 b=WOEjjVIazvBltvar/mC6IlNHzIuw17uAwAIqMnHIGiqBbYko3+BEJwY48Zgm0et+jKZAFi
 Ad2k6tPkWdVtLcPwtSc3Djdzs8Wmjx2sSrLgQ6y68fVmJovxTSiEKlsdNdX6pV8BIVroGl
 xYKCMyPZAqTtAb+1e0hyQrH0BQ4HhOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-pdyycFvDMaKW_jBtL9epPQ-1; Mon, 22 Nov 2021 07:40:39 -0500
X-MC-Unique: pdyycFvDMaKW_jBtL9epPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7306D19200C0;
 Mon, 22 Nov 2021 12:40:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 833671980E;
 Mon, 22 Nov 2021 12:40:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 519BE18007A2; Mon, 22 Nov 2021 13:40:15 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] ui: fix incorrect scaling on highdpi with gtk/opengl
Date: Mon, 22 Nov 2021 13:40:08 +0100
Message-Id: <20211122124015.909318-2-kraxel@redhat.com>
In-Reply-To: <20211122124015.909318-1-kraxel@redhat.com>
References: <20211122124015.909318-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Orzechowski <orzechowski.alexander@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Orzechowski <orzechowski.alexander@gmail.com>

Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
Message-Id: <20211121065504.29101-2-orzechowski.alexander@gmail.com>

[ kraxel: codestyle fix ]

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk-gl-area.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 461da7712f4f..01e4e74ee361 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -41,15 +41,16 @@ void gd_gl_area_draw(VirtualConsole *vc)
 #ifdef CONFIG_GBM
     QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
 #endif
-    int ww, wh, y1, y2;
+    int ww, wh, ws, y1, y2;
 
     if (!vc->gfx.gls) {
         return;
     }
 
     gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
-    ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area);
-    wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area);
+    ws = gdk_window_get_scale_factor(gtk_widget_get_window(vc->gfx.drawing_area));
+    ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area) * ws;
+    wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area) * ws;
 
     if (vc->gfx.scanout_mode) {
         if (!vc->gfx.guest_fb.framebuffer) {
-- 
2.33.1


