Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8225E6AD822
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:15:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRU6-0006Ka-Rh; Tue, 07 Mar 2023 02:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTm-0005mm-BX
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTj-0005si-H6
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678173078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orfRvQD16z46Lzfsgv60vvB0123u5ES8okmizwx/Ha8=;
 b=aE+61bMU4a7MotvmjkAQM2IbxF9QArjGzEvKPG1qoxq+lMb0WoK10he1VV8XJXTXirkqH7
 Pf//W68FBy96i6lmRGdsmItzOClp4iPGURFKmD3+ueXnsLDHe4z1LHwVqD09MzEfoLo8CL
 e1+IbyeRANy6XxC9KyT2qUWhomqM+8M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-Lo0U6cqoMxuSY4C6PLmnMg-1; Tue, 07 Mar 2023 02:11:15 -0500
X-MC-Unique: Lo0U6cqoMxuSY4C6PLmnMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C43B287B2A3;
 Tue,  7 Mar 2023 07:11:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6E4040C1106;
 Tue,  7 Mar 2023 07:11:12 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 48/51] hw/net/eepro100: Pass E100PCIDeviceInfo as class init
 data
Date: Tue,  7 Mar 2023 15:08:13 +0800
Message-Id: <20230307070816.34833-49-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

QOM already provides the TypeInfo::class_data to set
class-specific data. Use it instead of reinventing the
wheel with eepro100_get_class_by_name(). This finishes
the QDev conversion started 12 years ago in commit
40021f0888 ("pci: convert to QEMU Object Model").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/eepro100.c | 63 ++++++++++++++++++-------------------------------------
 1 file changed, 20 insertions(+), 43 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 722fb55..ab20558 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -242,6 +242,8 @@ struct EEPRO100Class {
     /*< private >*/
     PCIDeviceClass parent_class;
     /*< public >*/
+
+    const E100PCIDeviceInfo *info;
 };
 
 struct EEPRO100State {
@@ -338,8 +340,6 @@ static const uint16_t eepro100_mdi_mask[] = {
     0xffff, 0xffff, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
 };
 
-static E100PCIDeviceInfo *eepro100_get_class(EEPRO100State *s);
-
 /* Read a 16 bit control/status (CSR) register. */
 static uint16_t e100_read_reg2(EEPRO100State *s, E100RegisterOffset addr)
 {
@@ -489,8 +489,9 @@ static void eepro100_fcp_interrupt(EEPRO100State * s)
 static void e100_pci_reset(DeviceState *dev)
 {
     EEPRO100State *s = EEPRO100(dev);
-    E100PCIDeviceInfo *info = eepro100_get_class(s);
-    uint32_t device = s->device;
+    EEPRO100Class *ek = EEPRO100_GET_CLASS(s);
+    const E100PCIDeviceInfo *info = ek->info;
+    uint32_t device = info->device;
     uint8_t *pci_conf = s->dev.config;
 
     TRACE(OTHER, logout("%p\n", s));
@@ -1847,11 +1848,11 @@ static NetClientInfo net_eepro100_info = {
 static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 {
     EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, pci_dev);
-    E100PCIDeviceInfo *info = eepro100_get_class(s);
+    EEPRO100Class *ek = EEPRO100_GET_CLASS(s);
 
     TRACE(OTHER, logout("\n"));
 
-    s->device = info->device;
+    s->device = ek->info->device;
 
     /* Add 64 * 2 EEPROM. i82557 and i82558 support a 64 word EEPROM,
      * i82559 and later support 64 or 256 word EEPROM. */
@@ -2028,32 +2029,19 @@ static E100PCIDeviceInfo e100_devices[] = {
     }
 };
 
-static E100PCIDeviceInfo *eepro100_get_class_by_name(const char *typename)
+static void eepro100_class_init(ObjectClass *klass, void *data)
 {
-    E100PCIDeviceInfo *info = NULL;
-    int i;
-
-    /* This is admittedly awkward but also temporary.  QOM allows for
-     * parameterized typing and for subclassing both of which would suitable
-     * handle what's going on here.  But class_data is already being used as
-     * a stop-gap hack to allow incremental qdev conversion so we cannot use it
-     * right now.  Once we merge the final QOM series, we can come back here and
-     * do this in a much more elegant fashion.
-     */
-    for (i = 0; i < ARRAY_SIZE(e100_devices); i++) {
-        if (strcmp(e100_devices[i].name, typename) == 0) {
-            info = &e100_devices[i];
-            break;
-        }
-    }
-    assert(info != NULL);
-
-    return info;
-}
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    EEPRO100Class *ek = EEPRO100_CLASS(klass);
+    const E100PCIDeviceInfo *info = data;
 
-static E100PCIDeviceInfo *eepro100_get_class(EEPRO100State *s)
-{
-    return eepro100_get_class_by_name(object_get_typename(OBJECT(s)));
+    dc->desc = info->desc;
+    k->device_id = info->device_id;
+    k->revision = info->revision;
+    k->subsystem_vendor_id = info->subsystem_vendor_id;
+    k->subsystem_id = info->subsystem_id;
+    ek->info = info;
 }
 
 static Property e100_properties[] = {
@@ -2065,8 +2053,6 @@ static void eepro100_base_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-    E100PCIDeviceInfo *info;
-
 
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
     device_class_set_props(dc, e100_properties);
@@ -2076,17 +2062,6 @@ static void eepro100_base_class_init(ObjectClass *klass, void *data)
     k->romfile = "pxe-eepro100.rom";
     k->realize = e100_nic_realize;
     k->exit = pci_nic_uninit;
-
-    info = eepro100_get_class_by_name(object_class_get_name(klass));
-    if (!info) {
-        /* base class */
-        return;
-    }
-    dc->desc = info->desc;
-    k->device_id = info->device_id;
-    k->revision = info->revision;
-    k->subsystem_vendor_id = info->subsystem_vendor_id;
-    k->subsystem_id = info->subsystem_id;
 }
 
 static const TypeInfo eepro100_base_info = {
@@ -2111,6 +2086,8 @@ static void eepro100_register_types(void)
         TypeInfo type_info = {
             .name   = e100_devices[i].name,
             .parent = TYPE_EEPRO100,
+            .class_init    = eepro100_class_init,
+            .class_data = (void *)&e100_devices[i],
         };
 
         type_register(&type_info);
-- 
2.7.4


