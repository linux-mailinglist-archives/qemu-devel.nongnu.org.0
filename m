Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CC64CF317
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:59:57 +0100 (CET)
Received: from localhost ([::1]:37074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8Hc-0007Yc-Ib
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:59:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR87M-0008Bc-N2
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:49:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR87L-0007SK-5k
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:49:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646639358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ggOxutgeZ6F25/wK/QwP33YXyU6A0c5P/TwhxFsNak=;
 b=E4zrg1Ssf0DgQTWqF/EUI8iFNTAse6ktSYv+gsqa7OnTi6hK/OYjC0a2M6RDX2at6okJpT
 AH7VntZ8vWjCHobjuEAp94ld8us+sk8s+7gT2P3nHqzajPEF2zG40o6FJoXdxrCHWQekYs
 NpjOOBIaHpPuNliWZtqJeu042irjXjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-vSeBFAVjO2GkKEs264ifEA-1; Mon, 07 Mar 2022 02:49:15 -0500
X-MC-Unique: vSeBFAVjO2GkKEs264ifEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E4738145F6;
 Mon,  7 Mar 2022 07:49:14 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B50CF7FA2E;
 Mon,  7 Mar 2022 07:49:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/12] ui/console: optionally update after gfx switch
Date: Mon,  7 Mar 2022 11:46:29 +0400
Message-Id: <20220307074632.238049-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220307074632.238049-1-marcandre.lureau@redhat.com>
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

When switching to the dummy surface, we should also call gfx_update.
But when using GL, we shouldn't call it.

By making it an argument to displaychangelistener_gfx_switch(), it will
be explicit, and cannot be forgotten that easily.

Fixes: commit ebced091 ("console: save current scanout details")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


