Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AFB63E9A9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 07:14:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0cp4-0005ib-Pi; Thu, 01 Dec 2022 01:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0cp1-0005fu-AM
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:13:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0coz-0005mg-PW
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669875200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3mraL02whqE7GGSbymR+PEsAwhNJpgNaTJIuOzmgZI=;
 b=ePWk6b6DE2Hf8nyN+0nSxtCKpRkTnFoC/jzifHJOhh9NnlMNPnw4w4eEDw6yVdq+VxazDU
 pESpYLHZ+2KxFP27xAbJFyzIvLBnMWPGqc+ucfw8u1w8wuW5zmn7Rarq/xhWl+LsUY0Gfw
 FKXChfcFzNHX9zKqJ10kTDiruxLJryk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-dWCO-t17PWWbA756qldnkA-1; Thu, 01 Dec 2022 01:13:18 -0500
X-MC-Unique: dWCO-t17PWWbA756qldnkA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1FFB3C0D194
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 06:13:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 862C2492B04;
 Thu,  1 Dec 2022 06:13:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EEF0821E65C7; Thu,  1 Dec 2022 07:13:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 7/9] ui: Improve "change vnc" error reporting
Date: Thu,  1 Dec 2022 07:13:09 +0100
Message-Id: <20221201061311.3619052-8-armbru@redhat.com>
In-Reply-To: <20221201061311.3619052-1-armbru@redhat.com>
References: <20221201061311.3619052-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Switch from monitor_printf() to error_setg() and hmp_handle_error().
This makes "this is an error" more obvious both in the source and in
the monitor, where hmp_handle_error() prefixes the message with
"Error: ".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/hmp-cmds.c |  8 ++++----
 ui/ui-hmp-cmds.c   | 22 ++++++++++++++++++++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index f0f7b74fb3..8542eee3d4 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1209,9 +1209,8 @@ void hmp_change(Monitor *mon, const QDict *qdict)
 #ifdef CONFIG_VNC
     if (strcmp(device, "vnc") == 0) {
         if (read_only) {
-            monitor_printf(mon,
-                           "Parameter 'read-only-mode' is invalid for VNC\n");
-            return;
+            error_setg(&err, "Parameter 'read-only-mode' is invalid for VNC");
+            goto end;
         }
         if (strcmp(target, "passwd") == 0 ||
             strcmp(target, "password") == 0) {
@@ -1223,7 +1222,8 @@ void hmp_change(Monitor *mon, const QDict *qdict)
                 qmp_change_vnc_password(arg, &err);
             }
         } else {
-            monitor_printf(mon, "Expected 'password' after 'vnc'\n");
+            error_setg(&err, "Expected 'password' after 'vnc'");
+            goto end;
         }
     } else
 #endif
diff --git a/ui/ui-hmp-cmds.c b/ui/ui-hmp-cmds.c
index af290da9e1..90a4f86f25 100644
--- a/ui/ui-hmp-cmds.c
+++ b/ui/ui-hmp-cmds.c
@@ -270,6 +270,28 @@ out:
     hmp_handle_error(mon, err);
 }
 
+void hmp_change_vnc(Monitor *mon, const char *device, const char *target,
+                    const char *arg, const char *read_only, bool force,
+                    Error **errp)
+{
+    if (read_only) {
+        error_setg(mon, "Parameter 'read-only-mode' is invalid for VNC");
+        return;
+    }
+    if (strcmp(target, "passwd") == 0 ||
+        strcmp(target, "password") == 0) {
+        if (!arg) {
+            MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
+            monitor_read_password(hmp_mon, hmp_change_read_arg, NULL);
+            return;
+        } else {
+            qmp_change_vnc_password(arg, &err);
+        }
+    } else {
+        monitor_printf(mon, "Expected 'password' after 'vnc'\n");
+    }
+}
+
 void hmp_sendkey(Monitor *mon, const QDict *qdict)
 {
     const char *keys = qdict_get_str(qdict, "keys");
-- 
2.37.3


