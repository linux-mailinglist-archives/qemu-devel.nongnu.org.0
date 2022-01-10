Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72578489B09
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:06:09 +0100 (CET)
Received: from localhost ([::1]:47842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vJI-0006gN-8r
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:06:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6v0m-0002EC-VG
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:47:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6v0k-000722-RC
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641822418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kE9QTO0QrbN3FbKC9QgtZf3QAJc0flztkO6IMgwqh2o=;
 b=hAOa/S746lSkI4F/Nge/k46SK2Trf/dy7pLTjvad6bcnMjyVOaJZM2WR+DSRe438seyQ0U
 QOGujRU4Xaw139+rDtuTq3SLchrjCtK16JgXSYVInEzHLbGRjQsNV/n3msXtjs54j+66Ze
 uOPSBnI8JebdhF3EX+E0+p2tl7/69mI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-_ZsksWMTPNem5ip-dZ2NJw-1; Mon, 10 Jan 2022 08:46:55 -0500
X-MC-Unique: _ZsksWMTPNem5ip-dZ2NJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 524681006AA4;
 Mon, 10 Jan 2022 13:46:54 +0000 (UTC)
Received: from kostyanf14nb.Dlink (unknown [10.40.193.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C49D7BB53;
 Mon, 10 Jan 2022 13:46:53 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/9] gqa-win: get_pci_info: Split logic to separate functions
Date: Mon, 10 Jan 2022 15:46:40 +0200
Message-Id: <20220110134644.107375-6-kkostiuk@redhat.com>
In-Reply-To: <20220110134644.107375-1-kkostiuk@redhat.com>
References: <20220110134644.107375-1-kkostiuk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kostiantyn Kostiuk <konstantin@daynix.com>

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-win32.c | 161 +++++++++++++++++++++++--------------------
 1 file changed, 87 insertions(+), 74 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index f6de9e2676..8588fa8633 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -512,6 +512,92 @@ DEFINE_GUID(GUID_DEVINTERFACE_STORAGEPORT,
         0x2accfe60L, 0xc130, 0x11d2, 0xb0, 0x82,
         0x00, 0xa0, 0xc9, 0x1e, 0xfb, 0x8b);
 
+static void get_pci_address_for_device(GuestPCIAddress *pci,
+                                       HDEVINFO dev_info)
+{
+    SP_DEVINFO_DATA dev_info_data;
+    DWORD j;
+    DWORD size;
+    bool partial_pci = false;
+
+    dev_info_data.cbSize = sizeof(SP_DEVINFO_DATA);
+
+    for (j = 0;
+         SetupDiEnumDeviceInfo(dev_info, j, &dev_info_data);
+         j++) {
+        DWORD addr, bus, ui_slot, type;
+        int func, slot;
+        size = sizeof(DWORD);
+
+        /*
+        * There is no need to allocate buffer in the next functions. The
+        * size is known and ULONG according to
+        * https://msdn.microsoft.com/en-us/library/windows/hardware/ff543095(v=vs.85).aspx
+        */
+        if (!SetupDiGetDeviceRegistryProperty(
+                dev_info, &dev_info_data, SPDRP_BUSNUMBER,
+                &type, (PBYTE)&bus, size, NULL)) {
+            debug_error("failed to get PCI bus");
+            bus = -1;
+            partial_pci = true;
+        }
+
+        /*
+        * The function retrieves the device's address. This value will be
+        * transformed into device function and number
+        */
+        if (!SetupDiGetDeviceRegistryProperty(
+                dev_info, &dev_info_data, SPDRP_ADDRESS,
+                &type, (PBYTE)&addr, size, NULL)) {
+            debug_error("failed to get PCI address");
+            addr = -1;
+            partial_pci = true;
+        }
+
+        /*
+        * This call returns UINumber of DEVICE_CAPABILITIES structure.
+        * This number is typically a user-perceived slot number.
+        */
+        if (!SetupDiGetDeviceRegistryProperty(
+                dev_info, &dev_info_data, SPDRP_UI_NUMBER,
+                &type, (PBYTE)&ui_slot, size, NULL)) {
+            debug_error("failed to get PCI slot");
+            ui_slot = -1;
+            partial_pci = true;
+        }
+
+        /*
+        * SetupApi gives us the same information as driver with
+        * IoGetDeviceProperty. According to Microsoft:
+        *
+        *   FunctionNumber = (USHORT)((propertyAddress) & 0x0000FFFF)
+        *   DeviceNumber = (USHORT)(((propertyAddress) >> 16) & 0x0000FFFF)
+        *   SPDRP_ADDRESS is propertyAddress, so we do the same.
+        *
+        * https://docs.microsoft.com/en-us/windows/desktop/api/setupapi/nf-setupapi-setupdigetdeviceregistrypropertya
+        */
+        if (partial_pci) {
+            pci->domain = -1;
+            pci->slot = -1;
+            pci->function = -1;
+            pci->bus = -1;
+            continue;
+        } else {
+            func = ((int)addr == -1) ? -1 : addr & 0x0000FFFF;
+            slot = ((int)addr == -1) ? -1 : (addr >> 16) & 0x0000FFFF;
+            if ((int)ui_slot != slot) {
+                g_debug("mismatch with reported slot values: %d vs %d",
+                        (int)ui_slot, slot);
+            }
+            pci->domain = 0;
+            pci->slot = (int)ui_slot;
+            pci->function = func;
+            pci->bus = (int)bus;
+            return;
+        }
+    }
+}
+
 static GuestPCIAddress *get_pci_info(int number, Error **errp)
 {
     HDEVINFO dev_info = INVALID_HANDLE_VALUE;
@@ -522,7 +608,6 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
     HANDLE dev_file;
     int i;
     GuestPCIAddress *pci = NULL;
-    bool partial_pci = false;
 
     pci = g_malloc0(sizeof(*pci));
     pci->domain = -1;
@@ -545,7 +630,6 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         STORAGE_DEVICE_NUMBER sdn;
         char *parent_dev_id = NULL;
         SP_DEVINFO_DATA parent_dev_info_data;
-        DWORD j;
         DWORD size = 0;
 
         g_debug("getting device path");
@@ -672,79 +756,8 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
             goto end;
         }
 
-        for (j = 0;
-             SetupDiEnumDeviceInfo(parent_dev_info, j, &parent_dev_info_data);
-             j++) {
-            DWORD addr, bus, ui_slot, type;
-            int func, slot;
+        get_pci_address_for_device(pci, parent_dev_info);
 
-            /*
-             * There is no need to allocate buffer in the next functions. The
-             * size is known and ULONG according to
-             * https://msdn.microsoft.com/en-us/library/windows/hardware/ff543095(v=vs.85).aspx
-             */
-            if (!SetupDiGetDeviceRegistryProperty(
-                  parent_dev_info, &parent_dev_info_data, SPDRP_BUSNUMBER,
-                  &type, (PBYTE)&bus, size, NULL)) {
-                debug_error("failed to get PCI bus");
-                bus = -1;
-                partial_pci = true;
-            }
-
-            /*
-             * The function retrieves the device's address. This value will be
-             * transformed into device function and number
-             */
-            if (!SetupDiGetDeviceRegistryProperty(
-                    parent_dev_info, &parent_dev_info_data, SPDRP_ADDRESS,
-                    &type, (PBYTE)&addr, size, NULL)) {
-                debug_error("failed to get PCI address");
-                addr = -1;
-                partial_pci = true;
-            }
-
-            /*
-             * This call returns UINumber of DEVICE_CAPABILITIES structure.
-             * This number is typically a user-perceived slot number.
-             */
-            if (!SetupDiGetDeviceRegistryProperty(
-                    parent_dev_info, &parent_dev_info_data, SPDRP_UI_NUMBER,
-                    &type, (PBYTE)&ui_slot, size, NULL)) {
-                debug_error("failed to get PCI slot");
-                ui_slot = -1;
-                partial_pci = true;
-            }
-
-            /*
-             * SetupApi gives us the same information as driver with
-             * IoGetDeviceProperty. According to Microsoft:
-             *
-             *   FunctionNumber = (USHORT)((propertyAddress) & 0x0000FFFF)
-             *   DeviceNumber = (USHORT)(((propertyAddress) >> 16) & 0x0000FFFF)
-             *   SPDRP_ADDRESS is propertyAddress, so we do the same.
-             *
-             * https://docs.microsoft.com/en-us/windows/desktop/api/setupapi/nf-setupapi-setupdigetdeviceregistrypropertya
-             */
-            if (partial_pci) {
-                pci->domain = -1;
-                pci->slot = -1;
-                pci->function = -1;
-                pci->bus = -1;
-                continue;
-            } else {
-                func = ((int)addr == -1) ? -1 : addr & 0x0000FFFF;
-                slot = ((int)addr == -1) ? -1 : (addr >> 16) & 0x0000FFFF;
-                if ((int)ui_slot != slot) {
-                    g_debug("mismatch with reported slot values: %d vs %d",
-                            (int)ui_slot, slot);
-                }
-                pci->domain = 0;
-                pci->slot = (int)ui_slot;
-                pci->function = func;
-                pci->bus = (int)bus;
-                break;
-            }
-        }
         break;
     }
 
-- 
2.25.1


