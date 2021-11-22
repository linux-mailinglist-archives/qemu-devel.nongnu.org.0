Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ED7458EB5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:51:29 +0100 (CET)
Received: from localhost ([::1]:50322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8nA-0004zV-8Z
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:51:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mp8dE-0004zy-Dz
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:41:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mp8dB-0000EL-SF
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637584868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9nTFeOLRVbwU0A2W3Cdqm3bKuYIuwPrG1l490zy5PpQ=;
 b=JOp6UmMsS3VSNq8HGWWZmDQu6dK1FAShfdlUHxFMMvPDlV8anJXTxpnB5PHL9a2REWN25Y
 mQQK6IGBg7soBNwhgU94Tgy7OQZkpSDqQ5uqtqwHzYufeVr+/XOWT/VszvF54vw52UI2VB
 LeVlrJ6cHWkR+AJ/AH/s+vIeo+yeQ1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-yRQ_xXu8NEimMsS2nL0C4Q-1; Mon, 22 Nov 2021 07:41:05 -0500
X-MC-Unique: yRQ_xXu8NEimMsS2nL0C4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 733DB1018722;
 Mon, 22 Nov 2021 12:41:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 103467945D;
 Mon, 22 Nov 2021 12:40:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5CB9D1800851; Mon, 22 Nov 2021 13:40:15 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] ui: fix incorrect pointer position on highdpi with gtk
Date: Mon, 22 Nov 2021 13:40:09 +0100
Message-Id: <20211122124015.909318-3-kraxel@redhat.com>
In-Reply-To: <20211122124015.909318-1-kraxel@redhat.com>
References: <20211122124015.909318-1-kraxel@redhat.com>
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
Message-Id: <20211121065504.29101-3-orzechowski.alexander@gmail.com>

[ kraxel: codestyle fix ]

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index d2892ea6b4a9..dc4a1491f0ce 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -838,10 +838,11 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
 {
     VirtualConsole *vc = opaque;
     GtkDisplayState *s = vc->s;
+    GdkWindow *window;
     int x, y;
     int mx, my;
     int fbh, fbw;
-    int ww, wh;
+    int ww, wh, ws;
 
     if (!vc->gfx.ds) {
         return TRUE;
@@ -850,8 +851,10 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     fbw = surface_width(vc->gfx.ds) * vc->gfx.scale_x;
     fbh = surface_height(vc->gfx.ds) * vc->gfx.scale_y;
 
-    ww = gdk_window_get_width(gtk_widget_get_window(vc->gfx.drawing_area));
-    wh = gdk_window_get_height(gtk_widget_get_window(vc->gfx.drawing_area));
+    window = gtk_widget_get_window(vc->gfx.drawing_area);
+    ww = gdk_window_get_width(window);
+    wh = gdk_window_get_height(window);
+    ws = gdk_window_get_scale_factor(window);
 
     mx = my = 0;
     if (ww > fbw) {
@@ -861,8 +864,8 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
         my = (wh - fbh) / 2;
     }
 
-    x = (motion->x - mx) / vc->gfx.scale_x;
-    y = (motion->y - my) / vc->gfx.scale_y;
+    x = (motion->x - mx) / vc->gfx.scale_x * ws;
+    y = (motion->y - my) / vc->gfx.scale_y * ws;
 
     if (qemu_input_is_absolute()) {
         if (x < 0 || y < 0 ||
-- 
2.33.1


