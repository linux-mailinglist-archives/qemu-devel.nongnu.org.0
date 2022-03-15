Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49344D9A19
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:13:44 +0100 (CET)
Received: from localhost ([::1]:35852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU57X-000318-S5
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:13:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nU53B-0006Ll-OQ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:09:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nU539-0005qf-N4
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:09:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647342551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iAVXlPNa+jsMgCn8+FeHE/cMBbWsepJZw/rNFvwgHHQ=;
 b=Ve+bVX284vus0/6gWpFU95IS/PIerPBZ3nOglt/bbulJP4Hq0y4lImjkmC2+tzUPutXXBO
 7V36mwBvUxffCJn4BUk9H58zGWAl7oK5tBML/tUhfPYI1SEibP0Jo4tSmpRhf1nRrVDKvh
 8oBeHoGjmPEp3/IiupIa1gWtHCjLrag=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25--MMvoXoSMJCo5bXcK1aUaw-1; Tue, 15 Mar 2022 07:09:07 -0400
X-MC-Unique: -MMvoXoSMJCo5bXcK1aUaw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 479BC3800500;
 Tue, 15 Mar 2022 11:09:07 +0000 (UTC)
Received: from localhost (unknown [10.39.208.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53A18111CD4C;
 Tue, 15 Mar 2022 11:08:51 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 09/12] ui/console: optionally update after gfx switch
Date: Tue, 15 Mar 2022 15:07:36 +0400
Message-Id: <20220315110739.2095676-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220315110739.2095676-1-marcandre.lureau@redhat.com>
References: <20220315110739.2095676-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

When switching to the dummy surface, we should also call gfx_update.
But when using GL, we shouldn't call it.

By making it an argument to displaychangelistener_gfx_switch(), it will
be explicit, and cannot be forgotten that easily.

Fixes: commit ebced091 ("console: save current scanout details")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 102fcf0a5068..06ba82db61c9 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1059,11 +1059,18 @@ static void console_putchar(QemuConsole *s, int ch)
 }
 
 static void displaychangelistener_gfx_switch(DisplayChangeListener *dcl,
-                                             struct DisplaySurface *new_surface)
+                                             struct DisplaySurface *new_surface,
+                                             bool update)
 {
     if (dcl->ops->dpy_gfx_switch) {
         dcl->ops->dpy_gfx_switch(dcl, new_surface);
     }
+
+    if (update && dcl->ops->dpy_gfx_update) {
+        dcl->ops->dpy_gfx_update(dcl, 0, 0,
+                                 surface_width(new_surface),
+                                 surface_height(new_surface));
+    }
 }
 
 
@@ -1079,7 +1086,7 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
         if (!dummy) {
             dummy = qemu_create_placeholder_surface(640, 480, nodev);
         }
-        displaychangelistener_gfx_switch(dcl, dummy);
+        displaychangelistener_gfx_switch(dcl, dummy, TRUE);
         return;
     }
 
@@ -1098,12 +1105,8 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
                                          con->scanout.texture.width,
                                          con->scanout.texture.height);
     } else if (con->scanout.kind == SCANOUT_SURFACE) {
-        displaychangelistener_gfx_switch(dcl, con->surface);
+        displaychangelistener_gfx_switch(dcl, con->surface, TRUE);
     }
-
-    dcl->ops->dpy_gfx_update(dcl, 0, 0,
-                             qemu_console_get_width(con, 0),
-                             qemu_console_get_height(con, 0));
 }
 
 void console_select(unsigned int index)
@@ -1682,7 +1685,7 @@ void dpy_gfx_replace_surface(QemuConsole *con,
         if (con != (dcl->con ? dcl->con : active_console)) {
             continue;
         }
-        displaychangelistener_gfx_switch(dcl, surface);
+        displaychangelistener_gfx_switch(dcl, surface, FALSE);
     }
     qemu_free_displaysurface(old_surface);
 }
-- 
2.35.1.273.ge6ebfd0e8cbb


