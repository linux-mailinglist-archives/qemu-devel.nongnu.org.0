Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E0D3F758E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:06:04 +0200 (CEST)
Received: from localhost ([::1]:45480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsbT-0003pW-4X
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chunming_li1234@163.com>)
 id 1mIoDK-0003sT-9M; Wed, 25 Aug 2021 04:24:50 -0400
Received: from m12-13.163.com ([220.181.12.13]:48193)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chunming_li1234@163.com>)
 id 1mIoDG-00042E-Gb; Wed, 25 Aug 2021 04:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=ZsBOUwcbt9HyG3oB0M
 /jgN+U6YGgQiivDFADOVfq6Hg=; b=X71kToX5cGE1pToGeuB9JZMY8HIQxJST0W
 Q8EYtaXXaBq/BBDpVB3IoaY+tPgd/ram3VbHkTeMGS0VyZjNo/019hz2nbiOlApL
 b4QL1+rfDc8Lxlj+uYrEuJq6kEFVVyuedqrbfHn10izFMr0awpoUOcUH866agOhP
 /e0iw2lG4=
Received: from localhost.localdomain (unknown [180.169.130.89])
 by smtp9 (Coremail) with SMTP id DcCowABnCwWL+iVhtO7SAQ--.38418S6;
 Wed, 25 Aug 2021 16:08:51 +0800 (CST)
From: chunming <chunming_li1234@163.com>
To: eric.auger@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 3/4] hw/arm/virt: Update SMMU v3 creation to support non
 PCI/PCIe device connection
Date: Wed, 25 Aug 2021 16:08:41 +0800
Message-Id: <1629878922-173270-4-git-send-email-chunming_li1234@163.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
References: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
X-CM-TRANSID: DcCowABnCwWL+iVhtO7SAQ--.38418S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyDCr1fXr1xCrykZw4ktFb_yoW8tFW3pF
 4kGF1vgry5W3WfWrZ2qr13u3W5Gw4kGw1UKrs7uw4Syw17t34UXr4DKa1YkFWDWF1kuF13
 ZFs2gF47WF4xXrJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bS2-5UUUUU=
X-Originating-IP: [180.169.130.89]
X-CM-SenderInfo: xfkx0zplqjszjlrsjki6rwjhhfrp/1tbiNRP5dlrPdFx6owAAsN
Received-SPF: pass client-ip=220.181.12.13;
 envelope-from=chunming_li1234@163.com; helo=m12-13.163.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 Aug 2021 09:00:24 -0400
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
Cc: renwei.liu@verisilicon.com, qemu-arm@nongnu.org,
 jianxian.wen@verisilicon.com, qemu-devel@nongnu.org,
 chunming <chunming.li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: chunming <chunming.li@verisilicon.com>

  . Add "smmuv3_sidmap" to set non PCI/PCIe devices SID value
  . Pass non PCI/PCIe devices SID value to SMMU v3 model creation
  . Store SMMU v3 device in virtual machine then non PCI/PCIe can get its memory region later

Signed-off-by: chunming <chunming.li@verisilicon.com>
---
 hw/arm/virt.c         | 18 +++++++++++++++++-
 include/hw/arm/virt.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81eda46b0b..c3fd30e071 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,6 +204,10 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("max"),
 };
 
+static const uint16_t smmuv3_sidmap[] = {
+
+};
+
 static bool cpu_type_valid(const char *cpu)
 {
     int i;
@@ -1223,7 +1227,7 @@ static void create_pcie_irq_map(const MachineState *ms,
                            0x7           /* PCI irq */);
 }
 
-static void create_smmu(const VirtMachineState *vms,
+static void create_smmu(VirtMachineState *vms,
                         PCIBus *bus)
 {
     char *node;
@@ -1244,6 +1248,16 @@ static void create_smmu(const VirtMachineState *vms,
 
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
+
+    vms->smmuv3 = dev;
+
+    qdev_prop_set_uint32(dev, "len-sid-map", ARRAY_SIZE(smmuv3_sidmap));
+
+    for (i = 0; i < ARRAY_SIZE(smmuv3_sidmap); i++) {
+        g_autofree char *propname = g_strdup_printf("sid-map[%d]", i);
+        qdev_prop_set_uint16(dev, propname, smmuv3_sidmap[i]);
+    }
+
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     for (i = 0; i < NUM_SMMU_IRQS; i++) {
@@ -2762,6 +2776,8 @@ static void virt_instance_init(Object *obj)
 
     vms->irqmap = a15irqmap;
 
+    vms->sidmap = smmuv3_sidmap;
+
     virt_flash_create(vms);
 
     vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9661c46699..d3402a43dd 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -167,6 +167,8 @@ struct VirtMachineState {
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
+    DeviceState *smmuv3;
+    const uint16_t *sidmap;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
-- 
2.30.2



