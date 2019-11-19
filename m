Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6AB101116
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 03:03:24 +0100 (CET)
Received: from localhost ([::1]:41034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWsrT-00032D-NU
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 21:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37743)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <706701795@qq.com>) id 1iWsqA-0002Xy-W0
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 21:02:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <706701795@qq.com>) id 1iWsq2-0003e9-8J
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 21:01:56 -0500
Received: from smtpbg503.qq.com ([203.205.250.57]:37947 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <706701795@qq.com>) id 1iWsq1-0003bM-0h
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 21:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1574128298; bh=WQ2DgKrrwA1Dt8FKBstVcOrXNT+3obYmXRbp1xksZqU=;
 h=From:To:Subject:Date:Message-Id;
 b=bDld48iVL1IQxct4VOBg9VIeZ8A20IbfVO3ZZE6SdjvqM++H+qZM2DYCN4XZMGJ1B
 vtWWokBkGzXt25kvhcmEPiqxptxZrmR7moEOFvmrvCJy2vocFUttn7SF7LNGquq/nm
 ltr+jx7rU2XGmYtSCKxnMkLP5JRbVhcH7tTLkuTQ=
X-QQ-mid: esmtp6t1574128297t4culn2fj
Received: from CentOS.localdomain (unknown [218.85.80.138])
 by esmtp4.qq.com (ESMTP) with 
 id ; Tue, 19 Nov 2019 09:51:31 +0800 (CST)
X-QQ-SSF: B1000000000000B0RF101F00000000Q
X-QQ-FEAT: s5D6j/nU2lJS/V7pPust6/VeUIuKVgPZNgZVPNIfUroJi/Q/r4djN/kM+h+JV
 FigX4HEwDOmjt/BVFzEmTS6EGCU2NOGc09PPoTW0EuL16XysezykcLRjEDjNN1VraGIpl+5
 ESQuwgyM9OKWmZ2VC+0r5qLoc4t6y56Vgv8jC8rGuDRuIM6MC222VlEh9VVsVey2QP7JSWZ
 VOjih0Kvl1RJNfb2KIMIGv4QiXXXUPxDVWUgW1umgMF85OI35tkmY9/V+Z0CU5ARhebAQ+M
 TDM7HUI9e9+4CAHd2iZvoAzi7YONRy+FGeBA==
X-QQ-GoodBg: 0
From: lichun <706701795@qq.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] i440FX-pcihost: add 'allow-hotplug' property for configuring
 whether to expose the BSEL to the guest.
Date: Tue, 19 Nov 2019 17:51:20 +0800
Message-Id: <1574157080-7724-1-git-send-email-706701795@qq.com>
X-Mailer: git-send-email 1.8.3.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtp:qq.com:bgweb:bgweb1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 203.205.250.57
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: imammedo@redhat.com, 706701795@qq.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: lichun <706701795@qq.com>
---
 hw/acpi/pcihp.c              |  2 +-
 hw/pci-host/i440fx.c         | 11 +++++++++++
 include/hw/pci-host/i440fx.h |  1 +
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 8413348..4f5e0d3 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -98,7 +98,7 @@ static void acpi_set_pci_info(void)
     bsel_is_set = true;
 
     bus = find_i440fx(); /* TODO: Q35 support */
-    if (bus) {
+    if (bus && i440fx_allow_hotplug()) {
         /* Scan all PCI buses. Set property to enable acpi based hotplug. */
         pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &bsel_alloc);
     }
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index f271311..32bf9bf 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -49,6 +49,7 @@ typedef struct I440FXState {
     uint64_t pci_hole64_size;
     bool pci_hole64_fix;
     uint32_t short_root_bus;
+    bool allow_hotplug;
 } I440FXState;
 
 #define I440FX_PCI_DEVICE(obj) \
@@ -354,6 +355,15 @@ PCIBus *find_i440fx(void)
     return s ? s->bus : NULL;
 }
 
+bool i440fx_allow_hotplug(void)
+{
+    I440FXState *s;
+
+    s = I440FX_PCI_HOST_BRIDGE(object_resolve_path("/machine/i440fx", NULL));
+
+    return s ? s->allow_hotplug : true;
+}
+
 static void i440fx_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -487,6 +497,7 @@ static Property i440fx_props[] = {
                      pci_hole64_size, I440FX_PCI_HOST_HOLE64_SIZE_DEFAULT),
     DEFINE_PROP_UINT32("short_root_bus", I440FXState, short_root_bus, 0),
     DEFINE_PROP_BOOL("x-pci-hole64-fix", I440FXState, pci_hole64_fix, true),
+    DEFINE_PROP_BOOL("allow-hotplug", I440FXState, allow_hotplug, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index f54e646..4a607e9 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -32,5 +32,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     MemoryRegion *ram_memory);
 
 PCIBus *find_i440fx(void);
+bool i440fx_allow_hotplug(void);
 
 #endif
-- 
1.8.3.1


