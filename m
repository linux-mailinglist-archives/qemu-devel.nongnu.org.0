Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C7F694264
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:11:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVnf-0005EY-Vp; Mon, 13 Feb 2023 05:11:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVnd-0005EC-4F
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:11:05 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVna-0003QK-FC
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:11:04 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a2so11543949wrd.6
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e8yrXFW0jUJr8712z9qQtwR4EVFVh/k+PCDGhmBSEkw=;
 b=QeXmOlWnU9ZUpVHBUDR4/rZc6gLh6q5amrTn6UblZxGIhwkmeeIvUVYrB4EFoA2sbl
 4UJ1jx2heQeHhZkDsALE9ljG6yqdxiU9E1skjEvTDFGPn/OuSiPMYT6IL/DbfT9KKwU0
 QpYfUEKdzQTcDydwofjR2f8dOGvpUqhc9Aib7ZNdQv4h54813+vXrIK6IJ5cxHUBZvTo
 1ATLeY+0iWzvEB6/AHQarvAY4PZjaz544zxw97JZXFHi8tL9KDcCxb/CzTIyhaYQl+YY
 OoCBZZr8HdOiKRHzukAwYlr2DxCkUZlIEwO9QThPVHVNttMsaNb/JJfT2kNi60ltB6Ma
 DC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e8yrXFW0jUJr8712z9qQtwR4EVFVh/k+PCDGhmBSEkw=;
 b=HK8PAQdpK2XqSLblPvsuLK7zi08nvOY9REIq2CnG+CoppLtV6FkMheaMGVrbCcziVv
 QD8Nqaoso3vlXuC2LYvLpCLkC7OGbNfIu/tL0VrqR4kPV6Sxuo5IsiHZk/04VKF1uC32
 BBOiCslNxusmFl7TRWqHkcNzY1m5Sw1Eytp+/T1x+b1CJJIX2Qgw37/38uO3+qwb6moj
 D2pYSLN3fZpVwUGN+pvcjcJOmmvR76zY5lKjy8lSauodMR4LrBaPCn0rH0GKeiTmvy2v
 RgW0kVGEKtCEXIi+dAh1o9SUMoHQsPNBityRj7/98XdHWcHn1F11+p0C6yw1E8/XAKJZ
 G6EQ==
X-Gm-Message-State: AO0yUKUX706qEq6G/wf22TTvcl17F1MQ2Mx9Y9+saYcmcmSEjt7G15eg
 jFQTHb+5NMmKc4M7wYdJVxWinuBPF9e571OB
X-Google-Smtp-Source: AK7set/2U167agw0mqjV+ZFagoXor36FT0ks3MgE5pNSF6n26E1EyNF4/qprC8aPjb9nCFAeB1zH3w==
X-Received: by 2002:a5d:55cf:0:b0:2c5:557b:f837 with SMTP id
 i15-20020a5d55cf000000b002c5557bf837mr2869021wrw.14.1676283060322; 
 Mon, 13 Feb 2023 02:11:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a5d6201000000b002c3ea5ebc73sm10030121wru.101.2023.02.13.02.10.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 02:11:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/7] hw/net/eepro100: Introduce TYPE_EEPRO100 QOM abstract
 parent
Date: Mon, 13 Feb 2023 11:10:43 +0100
Message-Id: <20230213101048.94519-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213101048.94519-1-philmd@linaro.org>
References: <20230213101048.94519-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Have all the EEPRO100-based devices share a common (abstract)
QOM parent.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/eepro100.c | 58 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 17 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index dce75039ec..4b5d45576b 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -235,8 +235,20 @@ typedef enum {
     ru_ready = 4
 } ru_state_t;
 
-typedef struct {
+#define TYPE_EEPRO100 "eepro100"
+OBJECT_DECLARE_TYPE(EEPRO100State, EEPRO100Class, EEPRO100)
+
+struct EEPRO100Class {
+    /*< private >*/
+    PCIDeviceClass parent_class;
+    /*< public >*/
+};
+
+struct EEPRO100State {
+    /*< private >*/
     PCIDevice dev;
+    /*< public >*/
+
     /* Hash register (multicast mask array, multiple individual addresses). */
     uint8_t mult[8];
     MemoryRegion mmio_bar;
@@ -279,7 +291,7 @@ typedef struct {
     /* Quasi static device properties (no need to save them). */
     uint16_t stats_size;
     bool has_extended_tcb_support;
-} EEPRO100State;
+};
 
 /* Word indices in EEPROM. */
 typedef enum {
@@ -2055,43 +2067,55 @@ static Property e100_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void eepro100_class_init(ObjectClass *klass, void *data)
+static void eepro100_base_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     E100PCIDeviceInfo *info;
 
-    info = eepro100_get_class_by_name(object_class_get_name(klass));
 
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
     device_class_set_props(dc, e100_properties);
-    dc->desc = info->desc;
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->class_id = PCI_CLASS_NETWORK_ETHERNET;
     k->romfile = "pxe-eepro100.rom";
     k->realize = e100_nic_realize;
     k->exit = pci_nic_uninit;
+
+    info = eepro100_get_class_by_name(object_class_get_name(klass));
+    if (!info) {
+        /* base class */
+        return;
+    }
+    dc->desc = info->desc;
     k->device_id = info->device_id;
     k->revision = info->revision;
     k->subsystem_vendor_id = info->subsystem_vendor_id;
     k->subsystem_id = info->subsystem_id;
 }
 
+static const TypeInfo eepro100_base_info = {
+    .name          = TYPE_EEPRO100,
+    .parent        = TYPE_PCI_DEVICE,
+    .abstract      = true,
+    .class_init    = eepro100_base_class_init,
+    .class_size    = sizeof(EEPRO100Class),
+    .instance_size = sizeof(EEPRO100State),
+    .instance_init = eepro100_instance_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
 static void eepro100_register_types(void)
 {
-    size_t i;
-    for (i = 0; i < ARRAY_SIZE(e100_devices); i++) {
-        TypeInfo type_info = {};
-        E100PCIDeviceInfo *info = &e100_devices[i];
+    type_register_static(&eepro100_base_info);
 
-        type_info.name = info->name;
-        type_info.parent = TYPE_PCI_DEVICE;
-        type_info.class_init = eepro100_class_init;
-        type_info.instance_size = sizeof(EEPRO100State);
-        type_info.instance_init = eepro100_instance_init;
-        type_info.interfaces = (InterfaceInfo[]) {
-            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-            { },
+    for (size_t i = 0; i < ARRAY_SIZE(e100_devices); i++) {
+        TypeInfo type_info = {
+            .name   = e100_devices[i].name,
+            .parent = TYPE_EEPRO100,
         };
 
         type_register(&type_info);
-- 
2.38.1


