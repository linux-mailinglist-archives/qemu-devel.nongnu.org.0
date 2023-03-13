Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88736B7510
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:02:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbfwB-00025r-D5; Mon, 13 Mar 2023 07:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfw9-00025Z-3V
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfw7-0003uT-Jc
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678705311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Um3n+CTQRxL3PnrARU7ObOzyxLsrZaGrEUDVOetGQuo=;
 b=hsghq2DlRG97O1+m9Tu8Iv1uo/MCc4fLMWSwCAejmsFPz9MqVcGNN7WZQabqLnqs7Vy/d7
 HzYfOeQQ+4EAZvXbNwviptBpD1sdQEjm/KgY2xGi8urUbQ2n1DoEt04/MZ3rmk6FHGUbpL
 L10tIwRR6IJbYsLYWAx3NxFe1vpUDvk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-0RLfqsUONZOFHtel6-Awgw-1; Mon, 13 Mar 2023 07:01:47 -0400
X-MC-Unique: 0RLfqsUONZOFHtel6-Awgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BE7A2A5957A;
 Mon, 13 Mar 2023 11:01:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84412140E95F;
 Mon, 13 Mar 2023 11:01:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 04/18] ui/dbus: set mouse is-absolute during console creation
Date: Mon, 13 Mar 2023 15:01:12 +0400
Message-Id: <20230313110126.383392-5-marcandre.lureau@redhat.com>
In-Reply-To: <20230313110126.383392-1-marcandre.lureau@redhat.com>
References: <20230313110126.383392-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 ui/dbus-console.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/ui/dbus-console.c b/ui/dbus-console.c
index 0bfaa2298d..f77bc49d2e 100644
--- a/ui/dbus-console.c
+++ b/ui/dbus-console.c
@@ -411,15 +411,21 @@ dbus_mouse_release(DBusDisplayConsole *ddc,
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
@@ -492,6 +498,7 @@ dbus_display_console_new(DBusDisplay *display, QemuConsole *con)
     register_displaychangelistener(&ddc->dcl);
     ddc->mouse_mode_notifier.notify = dbus_mouse_mode_change;
     qemu_add_mouse_mode_change_notifier(&ddc->mouse_mode_notifier);
+    dbus_mouse_update_is_absolute(ddc);
 
     return ddc;
 }
-- 
2.39.2


