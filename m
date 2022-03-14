Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A014D85C7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:12:43 +0100 (CET)
Received: from localhost ([::1]:53742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkV8-0006nJ-S1
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:12:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nTkJO-0004ao-Gu
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nTkJM-00035k-KO
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647262832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v099OcPbOtt9k+lcjiDiAouQgYElAzCtF1EUPr0juPk=;
 b=iO7Gw4iyyBiC2G6aIDkCl51Uuy5mr+hs0sdat13iEz5WuMncgtkgmB6tXWpXD0MFuyWA1g
 VTmf45LORSyyDIp2uiD1xcZw5fT8Af75MTScG6qQ3tHI3t8ZNjvzdfGTaYn+Cc3sgGlACJ
 D7NfMYMC2umB1S1TvJii2cmrtpMC5g8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-AHJx6glLNhGMP0brwlT4nA-1; Mon, 14 Mar 2022 09:00:30 -0400
X-MC-Unique: AHJx6glLNhGMP0brwlT4nA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 939AC8041AF;
 Mon, 14 Mar 2022 13:00:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79DAF4644ED;
 Mon, 14 Mar 2022 13:00:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 08/12] ui/console: add a dpy_gfx_switch callback helper
Date: Mon, 14 Mar 2022 16:59:36 +0400
Message-Id: <20220314125940.1866728-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
References: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Slight code improvement.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index d3ecbb215736..102fcf0a5068 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1058,6 +1058,15 @@ static void console_putchar(QemuConsole *s, int ch)
     }
 }
 
+static void displaychangelistener_gfx_switch(DisplayChangeListener *dcl,
+                                             struct DisplaySurface *new_surface)
+{
+    if (dcl->ops->dpy_gfx_switch) {
+        dcl->ops->dpy_gfx_switch(dcl, new_surface);
+    }
+}
+
+
 static void displaychangelistener_display_console(DisplayChangeListener *dcl,
                                                   QemuConsole *con,
                                                   Error **errp)
@@ -1067,13 +1076,10 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
     static DisplaySurface *dummy;
 
     if (!con || !console_compatible_with(con, dcl, errp)) {
-        if (!dcl->ops->dpy_gfx_switch) {
-            return;
-        }
         if (!dummy) {
             dummy = qemu_create_placeholder_surface(640, 480, nodev);
         }
-        dcl->ops->dpy_gfx_switch(dcl, dummy);
+        displaychangelistener_gfx_switch(dcl, dummy);
         return;
     }
 
@@ -1091,9 +1097,8 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
                                          con->scanout.texture.y,
                                          con->scanout.texture.width,
                                          con->scanout.texture.height);
-    } else if (con->scanout.kind == SCANOUT_SURFACE &&
-               dcl->ops->dpy_gfx_switch) {
-        dcl->ops->dpy_gfx_switch(dcl, con->surface);
+    } else if (con->scanout.kind == SCANOUT_SURFACE) {
+        displaychangelistener_gfx_switch(dcl, con->surface);
     }
 
     dcl->ops->dpy_gfx_update(dcl, 0, 0,
@@ -1677,9 +1682,7 @@ void dpy_gfx_replace_surface(QemuConsole *con,
         if (con != (dcl->con ? dcl->con : active_console)) {
             continue;
         }
-        if (dcl->ops->dpy_gfx_switch) {
-            dcl->ops->dpy_gfx_switch(dcl, surface);
-        }
+        displaychangelistener_gfx_switch(dcl, surface);
     }
     qemu_free_displaysurface(old_surface);
 }
-- 
2.35.1.273.ge6ebfd0e8cbb


