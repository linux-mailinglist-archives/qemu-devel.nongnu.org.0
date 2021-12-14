Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CAA4742EE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 13:51:08 +0100 (CET)
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7Gt-00080s-6j
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 07:51:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mx77W-0001pC-JQ
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:41:28 -0500
Received: from [2a00:1450:4864:20::534] (port=44585
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mx77S-0004bz-DC
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:41:26 -0500
Received: by mail-ed1-x534.google.com with SMTP id z7so1399440edc.11
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 04:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=f/W7/VwO6j4MnJ8SawZpEZqcFMZTX0S/EkbM3JmnkUI=;
 b=G+Y6mGFzyasbSG/WTgEjtjdRYUUl30q98Py3m1zQVKebAOZwwj5r91pLc2kf74ho+m
 ZahdBv/h7MJzY4C6DL1UplQaE8ZI7h9mV2cpx7s/AUjvvTQiCQedPPcSEVvakefT2tUj
 Hs6Ey04DjtZtGbp0a0jiwRd+f1VQkXRwPwjPVx06GU0NoIEkV91GaCV1BcFJ9Sv8EC4p
 Nuq9sAvQmCj3meijMAzG1TYlnjRStkEpbVRzvzAc30wqbB+zi2ewPlzozoicc0hyiEAY
 Yp/OYbTdj6iXZpvKpWV8LPQDPQ+164uEygnDC9HIsfbY76j6IaN1IiIoRZ4wy85O0CRI
 b+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f/W7/VwO6j4MnJ8SawZpEZqcFMZTX0S/EkbM3JmnkUI=;
 b=XfOP7XaATnIAn47+EPxMEvRCz34OJ8E7Wk/zcWCXHMgUipENJBvkv6H2Z50nWJ3LqI
 iewKGElWWESwm7Ym/Bztsritc9hc9N9+IXZwbtnrU5AOaZkGdA9/ZhGqNMtZI7LiQ/RH
 viTwEb+htm6hY/gn70I7P6+biy/vGrKZIwQ9F29ZlCfpq0Z6A2b1y7Z6IHOZKXJoC0fY
 04SBRKrzaAD9gj4uHozLfRR3fjfWONjKGYynZfE8cvajiUul5l25FEVIZO8B6J8Eu7fZ
 5GWtukrYWkMuKnkZ8AUXgHrhR4daMa1kUQSqeIToN+DBQCmvMZamYPBdDME/CvkQNE5o
 jvGg==
X-Gm-Message-State: AOAM531B9PuVyaspEL0JTnZF1WBoFtEaNeWh2ySR0mCW4XYOZsbktr7c
 4Qve6fevRIlGqXr472IAZy104Ii5FLPTIs+g
X-Google-Smtp-Source: ABdhPJy5wT6pqBjRJRfdxF9ZiUl6/+/OUSzLL0CauLBlAG9XIBgSBkDU2ZOEhGDkB4uFLXppLuVYOQ==
X-Received: by 2002:a05:6402:1768:: with SMTP id
 da8mr7720764edb.252.1639485680684; 
 Tue, 14 Dec 2021 04:41:20 -0800 (PST)
Received: from localhost.localdomain ([37.72.42.118])
 by smtp.gmail.com with ESMTPSA id e4sm1025351ejl.196.2021.12.14.04.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 04:41:20 -0800 (PST)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 4/6] gqa-win: get_pci_info: Split logic to separate
 functions
Date: Tue, 14 Dec 2021 14:41:07 +0200
Message-Id: <20211214124109.103102-5-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214124109.103102-1-konstantin@daynix.com>
References: <20211214124109.103102-1-konstantin@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=konstantin@daynix.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
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

