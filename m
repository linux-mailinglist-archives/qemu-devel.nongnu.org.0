Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C20631C2A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 09:58:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox2WM-0003V9-SZ; Mon, 21 Nov 2022 03:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ox2WJ-0003UO-AD
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:51:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ox2WE-00019u-02
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669020669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dWlB+cevXfmtboqEY2u1+CahwXrHZ+HTv3/7cTu5jQ=;
 b=S/w6zVslolAAribDSG9HnfNI7aPFyMbnYuRWiIhcD8qjinboBrs57Db6JAO4UbGFLPs0o6
 uufl3VsyMLJ2hf1iuM9NVXk3MH1Az687iAW2ZbNf6GDnLWpjYA1dJ5LhO2vXb1AyGCOV4U
 lIqoMehc1a9WGzTSTXNbnkhz4UQgKUs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-NhsFWf8KOtWXq5Wm1SzZlg-1; Mon, 21 Nov 2022 03:50:58 -0500
X-MC-Unique: NhsFWf8KOtWXq5Wm1SzZlg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1A85185A7A9;
 Mon, 21 Nov 2022 08:50:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AF3F2027061;
 Mon, 21 Nov 2022 08:50:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5257421E6930; Mon, 21 Nov 2022 09:50:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: eblake@redhat.com,
	vsementsov@yandex-team.ru
Subject: [PATCH 01/10] error: Drop some obviously superfluous error_propagate()
Date: Mon, 21 Nov 2022 09:50:45 +0100
Message-Id: <20221121085054.683122-2-armbru@redhat.com>
In-Reply-To: <20221121085054.683122-1-armbru@redhat.com>
References: <20221121085054.683122-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

When error_propagate(errp, local_err) is the only reader of
@local_err, we can just as well change its writers to write @errp
directly, and drop the error_propagate() along with @local_err.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/virt.c        | 14 +++++---------
 hw/hyperv/vmbus.c    |  8 +++-----
 qga/commands-win32.c |  8 +++-----
 3 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b871350856..02d627a5ab 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2771,24 +2771,20 @@ static void virt_dimm_unplug_request(HotplugHandler *hotplug_dev,
                                      DeviceState *dev, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
-    Error *local_err = NULL;
 
     if (!vms->acpi_dev) {
-        error_setg(&local_err,
+        error_setg(errp,
                    "memory hotplug is not enabled: missing acpi-ged device");
-        goto out;
+        return;
     }
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
-        error_setg(&local_err,
-                   "nvdimm device hot unplug is not supported yet.");
-        goto out;
+        error_setg(errp, "nvdimm device hot unplug is not supported yet.");
+        return;
     }
 
     hotplug_handler_unplug_request(HOTPLUG_HANDLER(vms->acpi_dev), dev,
-                                   &local_err);
-out:
-    error_propagate(errp, local_err);
+                                   errp);
 }
 
 static void virt_dimm_unplug(HotplugHandler *hotplug_dev,
diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 30bc04e1c4..5db3fc1192 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -2404,7 +2404,6 @@ static const TypeInfo vmbus_dev_type_info = {
 static void vmbus_realize(BusState *bus, Error **errp)
 {
     int ret = 0;
-    Error *local_err = NULL;
     VMBus *vmbus = VMBUS(bus);
 
     qemu_mutex_init(&vmbus->rx_queue_lock);
@@ -2415,13 +2414,13 @@ static void vmbus_realize(BusState *bus, Error **errp)
     ret = hyperv_set_msg_handler(VMBUS_MESSAGE_CONNECTION_ID,
                                  vmbus_recv_message, vmbus);
     if (ret != 0) {
-        error_setg(&local_err, "hyperv set message handler failed: %d", ret);
+        error_setg(errp, "hyperv set message handler failed: %d", ret);
         goto error_out;
     }
 
     ret = event_notifier_init(&vmbus->notifier, 0);
     if (ret != 0) {
-        error_setg(&local_err, "event notifier failed to init with %d", ret);
+        error_setg(errp, "event notifier failed to init with %d", ret);
         goto remove_msg_handler;
     }
 
@@ -2429,7 +2428,7 @@ static void vmbus_realize(BusState *bus, Error **errp)
     ret = hyperv_set_event_flag_handler(VMBUS_EVENT_CONNECTION_ID,
                                         &vmbus->notifier);
     if (ret != 0) {
-        error_setg(&local_err, "hyperv set event handler failed with %d", ret);
+        error_setg(errp, "hyperv set event handler failed with %d", ret);
         goto clear_event_notifier;
     }
 
@@ -2441,7 +2440,6 @@ remove_msg_handler:
     hyperv_set_msg_handler(VMBUS_MESSAGE_CONNECTION_ID, NULL, NULL);
 error_out:
     qemu_mutex_destroy(&vmbus->rx_queue_lock);
-    error_propagate(errp, local_err);
 }
 
 static void vmbus_unrealize(BusState *bus)
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index ec9f55b453..962db8e543 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -275,13 +275,12 @@ static void acquire_privilege(const char *name, Error **errp)
 {
     HANDLE token = NULL;
     TOKEN_PRIVILEGES priv;
-    Error *local_err = NULL;
 
     if (OpenProcessToken(GetCurrentProcess(),
         TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &token))
     {
         if (!LookupPrivilegeValue(NULL, name, &priv.Privileges[0].Luid)) {
-            error_setg(&local_err, QERR_QGA_COMMAND_FAILED,
+            error_setg(errp, QERR_QGA_COMMAND_FAILED,
                        "no luid for requested privilege");
             goto out;
         }
@@ -290,13 +289,13 @@ static void acquire_privilege(const char *name, Error **errp)
         priv.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;
 
         if (!AdjustTokenPrivileges(token, FALSE, &priv, 0, NULL, 0)) {
-            error_setg(&local_err, QERR_QGA_COMMAND_FAILED,
+            error_setg(errp, QERR_QGA_COMMAND_FAILED,
                        "unable to acquire requested privilege");
             goto out;
         }
 
     } else {
-        error_setg(&local_err, QERR_QGA_COMMAND_FAILED,
+        error_setg(errp, QERR_QGA_COMMAND_FAILED,
                    "failed to open privilege token");
     }
 
@@ -304,7 +303,6 @@ out:
     if (token) {
         CloseHandle(token);
     }
-    error_propagate(errp, local_err);
 }
 
 static void execute_async(DWORD WINAPI (*func)(LPVOID), LPVOID opaque,
-- 
2.37.3


