Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0E03D5843
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:08:42 +0200 (CEST)
Received: from localhost ([::1]:41862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7yTR-0004P9-9X
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7yQp-0001M5-MK
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:06:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7yQm-0004aQ-1q
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:05:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627297555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Qho4eUmI2j3ooWz1Puc624X/X0cOSrEZ+/Jzjb9PEk=;
 b=jUbgYZVfJAsh1PctRyqZglOp3pIHIJDCxRfBrIdcdBhhUKNiF6jr5P+904RdVouXauQ8xQ
 MK0IAATAy3fjwaa4ekcZyauFvEHWYi1gQMeaf53u/n/CkVSwMn3/K7seXcWh/Tw+ASMlgE
 kRFCJ+5VrfprGNAORqqMhwNfwo6Qkxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-SOE7j1YDMcq5lbQEQmQmqw-1; Mon, 26 Jul 2021 07:05:53 -0400
X-MC-Unique: SOE7j1YDMcq5lbQEQmQmqw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E112D1008061;
 Mon, 26 Jul 2021 11:05:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BAF4F60C5F;
 Mon, 26 Jul 2021 11:05:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 420691800903; Mon, 26 Jul 2021 13:05:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] ui/gtk: Fix relative mouse with multiple monitors
Date: Mon, 26 Jul 2021 13:05:39 +0200
Message-Id: <20210726110544.1934386-2-kraxel@redhat.com>
In-Reply-To: <20210726110544.1934386-1-kraxel@redhat.com>
References: <20210726110544.1934386-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Dennis=20W=C3=B6lfing?= <denniswoelfing@gmx.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dennis Wölfing <denniswoelfing@gmx.de>

To handle relative mouse input the event handler needs to move the mouse
away from the screen edges. Failing to do so results in the mouse
getting stuck at invisible walls. However the current implementation for
this is broken on hosts with multiple monitors.

With multiple monitors the mouse can be located outside of the current
monitor which is not handled by the current code. Also the monitor
itself might be located at coordinates different from (0, 0).

Signed-off-by: Dennis Wölfing <denniswoelfing@gmx.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210720143940.291413-1-denniswoelfing@gmx.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 376b4d528daa..18542c763312 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -865,37 +865,25 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
         GdkWindow *win = gtk_widget_get_window(widget);
         GdkMonitor *monitor = gdk_display_get_monitor_at_window(dpy, win);
         GdkRectangle geometry;
-        int screen_width, screen_height;
 
         int x = (int)motion->x_root;
         int y = (int)motion->y_root;
 
         gdk_monitor_get_geometry(monitor, &geometry);
-        screen_width = geometry.width;
-        screen_height = geometry.height;
 
         /* In relative mode check to see if client pointer hit
-         * one of the screen edges, and if so move it back by
-         * 200 pixels. This is important because the pointer
+         * one of the monitor edges, and if so move it back to the
+         * center of the monitor. This is important because the pointer
          * in the server doesn't correspond 1-for-1, and so
          * may still be only half way across the screen. Without
          * this warp, the server pointer would thus appear to hit
          * an invisible wall */
-        if (x == 0) {
-            x += 200;
-        }
-        if (y == 0) {
-            y += 200;
-        }
-        if (x == (screen_width - 1)) {
-            x -= 200;
-        }
-        if (y == (screen_height - 1)) {
-            y -= 200;
-        }
-
-        if (x != (int)motion->x_root || y != (int)motion->y_root) {
+        if (x <= geometry.x || x - geometry.x >= geometry.width - 1 ||
+            y <= geometry.y || y - geometry.y >= geometry.height - 1) {
             GdkDevice *dev = gdk_event_get_device((GdkEvent *)motion);
+            x = geometry.x + geometry.width / 2;
+            y = geometry.y + geometry.height / 2;
+
             gdk_device_warp(dev, screen, x, y);
             s->last_set = FALSE;
             return FALSE;
-- 
2.31.1


