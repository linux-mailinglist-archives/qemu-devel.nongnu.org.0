Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0F56C1AEF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:09:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peI4a-00012A-Ex; Mon, 20 Mar 2023 12:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1peI4Y-00011o-2i
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:09:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1peI4W-0003TM-8T
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679328558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DMH4oXHpGBtFxwo5IeR8CzFSvedQH3hCGSGmbysd89M=;
 b=WSWFHLmo8MvLCkFPKzeJmBJ6PD7OhLD3yfPoJbhKC0OyEpQ5xX+80isufsqz0cvl6fSQO3
 8gvBQgneYK3DjslFpzpwFAWMqLob2xHmlnSVvQLv6VAMFzkRD79JYmjhMqE0ZxHDA6EFCe
 r9tA9GBT+UID42ORPx+VNjeKyO3uvxY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-Vz4RUeX5P1KGb16JgWRxzw-1; Mon, 20 Mar 2023 12:09:16 -0400
X-MC-Unique: Vz4RUeX5P1KGb16JgWRxzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE8AE885622
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 16:09:16 +0000 (UTC)
Received: from centennial.enunes.eu (unknown [10.43.17.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B5C62166B29;
 Mon, 20 Mar 2023 16:09:16 +0000 (UTC)
From: Erico Nunes <ernunes@redhat.com>
To: qemu-devel@nongnu.org
Cc: Erico Nunes <ernunes@redhat.com>
Subject: [PATCH 1/2] ui/gtk: use widget size for cursor motion event
Date: Mon, 20 Mar 2023 17:08:55 +0100
Message-Id: <20230320160856.364319-1-ernunes@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ernunes@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The gd_motion_event size has some calculations for the cursor position,
which also take into account things like different size of the
framebuffer compared to the window size.
The use of window size makes things more difficult though, as at least
in the case of Wayland includes the size of ui elements like a menu bar
at the top of the window. This leads to a wrong position calculation by
a few pixels.
Fix it by using the size of the widget, which already returns the size
of the actual space to render the framebuffer.

Signed-off-by: Erico Nunes <ernunes@redhat.com>
---
 ui/gtk.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index fd82e9b1ca..d1b2a80c2b 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -868,7 +868,6 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
 {
     VirtualConsole *vc = opaque;
     GtkDisplayState *s = vc->s;
-    GdkWindow *window;
     int x, y;
     int mx, my;
     int fbh, fbw;
@@ -881,10 +880,9 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     fbw = surface_width(vc->gfx.ds) * vc->gfx.scale_x;
     fbh = surface_height(vc->gfx.ds) * vc->gfx.scale_y;
 
-    window = gtk_widget_get_window(vc->gfx.drawing_area);
-    ww = gdk_window_get_width(window);
-    wh = gdk_window_get_height(window);
-    ws = gdk_window_get_scale_factor(window);
+    ww = gtk_widget_get_allocated_width(widget);
+    wh = gtk_widget_get_allocated_height(widget);
+    ws = gtk_widget_get_scale_factor(widget);
 
     mx = my = 0;
     if (ww > fbw) {
-- 
2.39.2


