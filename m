Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A604BA064
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:53:06 +0100 (CET)
Received: from localhost ([::1]:55424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKgHQ-0007Uo-HZ
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:53:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfTp-0000C8-Ez
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:01:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfTe-0001hg-6I
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:01:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KdfW8EWn9HAFN9rtDr4m2Xs1y65Nmx5hvt7SEdnLv88=;
 b=OMhG9Gh4s7XW3pEI7j/KT5QwOgiM+hJwdSc7HGXncBjCxzMf2PPpATw//1ZlgvZdtOpVaM
 sE4iHjq+tFOxYNIzSIuigxiUbNkSxguk5UrI+GXAOQ2E5dWv33/HUPxgwvger+K/AWqrRg
 34BAZKNucjRX4oAeYfO+uJvcKt+H85M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-X9uuJghvPMGWR8IAKHCEUQ-1; Thu, 17 Feb 2022 07:01:32 -0500
X-MC-Unique: X9uuJghvPMGWR8IAKHCEUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FF691883620;
 Thu, 17 Feb 2022 12:01:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03AD06E1B8;
 Thu, 17 Feb 2022 12:01:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/12] ui/console: add a dpy_gfx_switch callback helper
Date: Thu, 17 Feb 2022 15:58:28 +0400
Message-Id: <20220217115829.2314347-12-marcandre.lureau@redhat.com>
In-Reply-To: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 kraxel@redhat.com, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Slight code improvement.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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
2.34.1.428.gdcc0cd074f0c


