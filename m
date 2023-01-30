Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4086680BDD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:25:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSHP-0006Qi-1r; Mon, 30 Jan 2023 06:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMSHM-0006Q3-Ix
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:24:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMSHK-00081I-Mt
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675077890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tq9A6kvWcG3qXORH7zjW3800S+CMJJCRNZgtOxmrjMI=;
 b=cADuWlofuxtTQ09YPRv1qyg3+WhqoZRZvp3412gb7GSpfNgHVAw8x8wYjlq47anl7f75Hh
 UDz6AAy9B+7DEmRloHzGUYl8//M14PcdW+jNB66DvcfGAiHpnBbdQY+FZhNTqcrA7jsAlw
 e4kHZMIg12EUznmFi2L0SFru88JQnlU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-VEgXW4lgMqCVf6twsrOcvg-1; Mon, 30 Jan 2023 06:24:48 -0500
X-MC-Unique: VEgXW4lgMqCVf6twsrOcvg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7D3E1C3A078
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:24:46 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD4A91121314;
 Mon, 30 Jan 2023 11:24:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 03/11] ui/dbus: set mouse is-absolute during console creation
Date: Mon, 30 Jan 2023 15:24:23 +0400
Message-Id: <20230130112431.69559-4-marcandre.lureau@redhat.com>
In-Reply-To: <20230130112431.69559-1-marcandre.lureau@redhat.com>
References: <20230130112431.69559-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/dbus-console.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/ui/dbus-console.c b/ui/dbus-console.c
index 898a4ac8a5..241797b7e9 100644
--- a/ui/dbus-console.c
+++ b/ui/dbus-console.c
@@ -410,15 +410,21 @@ dbus_mouse_release(DBusDisplayConsole *ddc,
     return DBUS_METHOD_INVOCATION_HANDLED;
 }
 
+static void
+dbus_mouse_update_is_absolute(DBusDisplayConsole *ddc)
+{
+    g_object_set(ddc->iface_mouse,
+                 "is-absolute", qemu_input_is_absolute(),
+                 NULL);
+}
+
 static void
 dbus_mouse_mode_change(Notifier *notify, void *data)
 {
     DBusDisplayConsole *ddc =
         container_of(notify, DBusDisplayConsole, mouse_mode_notifier);
 
-    g_object_set(ddc->iface_mouse,
-                 "is-absolute", qemu_input_is_absolute(),
-                 NULL);
+    dbus_mouse_update_is_absolute(ddc);
 }
 
 int dbus_display_console_get_index(DBusDisplayConsole *ddc)
@@ -491,6 +497,7 @@ dbus_display_console_new(DBusDisplay *display, QemuConsole *con)
     register_displaychangelistener(&ddc->dcl);
     ddc->mouse_mode_notifier.notify = dbus_mouse_mode_change;
     qemu_add_mouse_mode_change_notifier(&ddc->mouse_mode_notifier);
+    dbus_mouse_update_is_absolute(ddc);
 
     return ddc;
 }
-- 
2.39.1


