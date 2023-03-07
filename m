Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A786AD823
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:15:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRUS-0006tG-Nz; Tue, 07 Mar 2023 02:12:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTm-0005me-BN
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTf-0005sG-HK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678173075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cq5G3WEGJ/6Zz+rrPCWfk8i0GOn43bnChlWjtdUE1gc=;
 b=DpcIdyLRtA0sJ/7fU+AsEI9nmuc/4gUIKCtJLahTdrTuLyiILsgl5vSPMuguOs0HH3UfKO
 lyyFAxsRnEiuu1/nbn8tzOqCforzFosZxfw1OcbAD1DCB6YzKNkdcGDzc+xK70jpKSRlZZ
 kCR990l1WjG/GxZBT+jc2qmG3xk2oNg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-AI6uAQhLMQSAWcmK7X_eAQ-1; Tue, 07 Mar 2023 02:11:09 -0500
X-MC-Unique: AI6uAQhLMQSAWcmK7X_eAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8582F18A6461;
 Tue,  7 Mar 2023 07:11:09 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96E84400F8FA;
 Tue,  7 Mar 2023 07:11:07 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 46/51] hw/net/eepro100: Introduce TYPE_EEPRO100 QOM abstract
 parent
Date: Tue,  7 Mar 2023 15:08:11 +0800
Message-Id: <20230307070816.34833-47-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Have all the EEPRO100-based devices share a common (abstract)
QOM parent.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/eepro100.c | 60 ++++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 18 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index dce7503..4b5d455 100644
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
-
-        type_info.name = info->name;
-        type_info.parent = TYPE_PCI_DEVICE;
-        type_info.class_init = eepro100_class_init;
-        type_info.instance_size = sizeof(EEPRO100State);
-        type_info.instance_init = eepro100_instance_init;
-        type_info.interfaces = (InterfaceInfo[]) {
-            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-            { },
+    type_register_static(&eepro100_base_info);
+
+    for (size_t i = 0; i < ARRAY_SIZE(e100_devices); i++) {
+        TypeInfo type_info = {
+            .name   = e100_devices[i].name,
+            .parent = TYPE_EEPRO100,
         };
 
         type_register(&type_info);
-- 
2.7.4


