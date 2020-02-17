Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14778160BD1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 08:43:39 +0100 (CET)
Received: from localhost ([::1]:41422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3b45-0005vN-OY
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 02:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39270)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xuyandong2@huawei.com>) id 1j3b2v-0004HC-0l
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 02:42:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <xuyandong2@huawei.com>) id 1j3b2t-0000TZ-FR
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 02:42:24 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2715 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <xuyandong2@huawei.com>)
 id 1j3b2q-0000Jq-FF; Mon, 17 Feb 2020 02:42:20 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 240E8450A0A70BD7C906;
 Mon, 17 Feb 2020 15:42:15 +0800 (CST)
Received: from localhost (10.175.124.177) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Mon, 17 Feb 2020
 15:42:08 +0800
From: Xu Yandong <xuyandong2@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH RFC 08/16] hw/arm/virt: split secure extension related codes
 from create_gic
Date: Mon, 17 Feb 2020 02:51:20 -0500
Message-ID: <1581925888-103620-9-git-send-email-xuyandong2@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581925888-103620-1-git-send-email-xuyandong2@huawei.com>
References: <1581925888-103620-1-git-send-email-xuyandong2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.177]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: zhang.zhanghailiang@huawei.com, slp@redhat.com,
 Xu Yandong <xuyandong2@huawei.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

EL3 extension is not always needed.

Signed-off-by: Xu Yandong <xuyandong2@huawei.com>
---
 hw/arm/virt.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index afaf143888..087616190e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -627,6 +627,14 @@ static void gic_set_msi_interrupt(VirtMachineState *vms)
     }
 }
 
+static void qdev_gic_set_secure_bit(VirtMachineState *vms)
+{
+    if (!kvm_irqchip_in_kernel()) {
+        qdev_prop_set_bit(vms->gic, "has-security-extensions",
+                          vms->secure);
+    }
+}
+
 static void qdev_gic_set_virt_bit(VirtMachineState *vms)
 {
     if (vms->gic_version != 3 && !kvm_irqchip_in_kernel()) {
@@ -681,9 +689,6 @@ static void create_gic(VirtMachineState *vms)
      * interrupts; there are always 32 of the former (mandated by GIC spec).
      */
     qdev_prop_set_uint32(vms->gic, "num-irq", NUM_IRQS + 32);
-    if (!kvm_irqchip_in_kernel()) {
-        qdev_prop_set_bit(vms->gic, "has-security-extensions", vms->secure);
-    }
 
     if (type == 3) {
         uint32_t redist0_capacity =
@@ -704,6 +709,7 @@ static void create_gic(VirtMachineState *vms)
                 MIN(smp_cpus - redist0_count, redist1_capacity));
         }
     }
+    qdev_gic_set_secure_bit(vms);
     qdev_gic_set_virt_bit(vms);
     qdev_init_nofail(vms->gic);
     gicbusdev = SYS_BUS_DEVICE(vms->gic);
-- 
2.18.1


