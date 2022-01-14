Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FDF48E4F2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:43:11 +0100 (CET)
Received: from localhost ([::1]:58386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8HEs-00054M-9W
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:43:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUy-0007iF-LL
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUs-0007Wx-Vx
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KFSJ34/po/2hSQ6VeabJhk6yM8xTT9hn9cXGdSI7W+8=;
 b=JbZ7upNloRxU9o0P9sf/WDX6GFhv4cyYlm/fkF4udGszU1NI/qJTej+1vg7MnhcgWzKhRb
 vrNP/yrhzQFH81FpY2uTktU1FzQLpPrH0oAqcD1KdBPn9Suyp3ayDg8Ws1SZl7z1I6Tap3
 9cYjsbv5VKaxbd9GYcmG35vDfiPz/7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-iTYrLioMNyiTAZB5pRoSUg-1; Fri, 14 Jan 2022 01:55:30 -0500
X-MC-Unique: iTYrLioMNyiTAZB5pRoSUg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FB79101AFA7;
 Fri, 14 Jan 2022 06:55:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2A3D4699B;
 Fri, 14 Jan 2022 06:55:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 763A41800851; Fri, 14 Jan 2022 07:53:27 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/20] ui/gtk: pass horizontal scroll information to the device
 code
Date: Fri, 14 Jan 2022 07:53:24 +0100
Message-Id: <20220114065326.782420-19-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Dmitry Petrov <dpetroff@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Petrov <dpetroff@gmail.com>

Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
Message-Id: <20220108153947.171861-4-dpetroff@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 54 ++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 6a1f65d51894..a8567b9ddc8f 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -968,33 +968,63 @@ static gboolean gd_scroll_event(GtkWidget *widget, GdkEventScroll *scroll,
                                 void *opaque)
 {
     VirtualConsole *vc = opaque;
-    InputButton btn;
+    InputButton btn_vertical;
+    InputButton btn_horizontal;
+    bool has_vertical = false;
+    bool has_horizontal = false;
 
     if (scroll->direction == GDK_SCROLL_UP) {
-        btn = INPUT_BUTTON_WHEEL_UP;
+        btn_vertical = INPUT_BUTTON_WHEEL_UP;
+        has_vertical = true;
     } else if (scroll->direction == GDK_SCROLL_DOWN) {
-        btn = INPUT_BUTTON_WHEEL_DOWN;
+        btn_vertical = INPUT_BUTTON_WHEEL_DOWN;
+        has_vertical = true;
+    } else if (scroll->direction == GDK_SCROLL_LEFT) {
+        btn_horizontal = INPUT_BUTTON_WHEEL_LEFT;
+        has_horizontal = true;
+    } else if (scroll->direction == GDK_SCROLL_RIGHT) {
+        btn_horizontal = INPUT_BUTTON_WHEEL_RIGHT;
+        has_horizontal = true;
     } else if (scroll->direction == GDK_SCROLL_SMOOTH) {
         gdouble delta_x, delta_y;
         if (!gdk_event_get_scroll_deltas((GdkEvent *)scroll,
                                          &delta_x, &delta_y)) {
             return TRUE;
         }
-        if (delta_y == 0) {
-            return TRUE;
-        } else if (delta_y > 0) {
-            btn = INPUT_BUTTON_WHEEL_DOWN;
+
+        if (delta_y > 0) {
+            btn_vertical = INPUT_BUTTON_WHEEL_DOWN;
+            has_vertical = true;
+        } else if (delta_y < 0) {
+            btn_vertical = INPUT_BUTTON_WHEEL_UP;
+            has_vertical = true;
+        } else if (delta_x > 0) {
+            btn_horizontal = INPUT_BUTTON_WHEEL_RIGHT;
+            has_horizontal = true;
+        } else if (delta_x < 0) {
+            btn_horizontal = INPUT_BUTTON_WHEEL_LEFT;
+            has_horizontal = true;
         } else {
-            btn = INPUT_BUTTON_WHEEL_UP;
+            return TRUE;
         }
     } else {
         return TRUE;
     }
 
-    qemu_input_queue_btn(vc->gfx.dcl.con, btn, true);
-    qemu_input_event_sync();
-    qemu_input_queue_btn(vc->gfx.dcl.con, btn, false);
-    qemu_input_event_sync();
+    if (has_vertical) {
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_vertical, true);
+        qemu_input_event_sync();
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_vertical, false);
+        qemu_input_event_sync();
+    }
+
+    if (has_horizontal) {
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_horizontal, true);
+        qemu_input_event_sync();
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_horizontal, false);
+        qemu_input_event_sync();
+    }
+
     return TRUE;
 }
 
-- 
2.34.1


