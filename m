Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D808DA7EE0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 11:08:48 +0200 (CEST)
Received: from localhost ([::1]:54812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5RHT-0000QJ-TI
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 05:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38621)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R76-0007P7-Qp
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 04:58:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R75-0007FV-Ge
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 04:58:04 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2259 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R72-0007Dh-SF; Wed, 04 Sep 2019 04:58:01 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 00B234839B1CCFF82788;
 Wed,  4 Sep 2019 16:57:59 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Sep 2019 16:57:50 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 4 Sep 2019 09:56:25 +0100
Message-ID: <20190904085629.13872-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-devel] [PATCH-for-4.2 v10 07/11] hw/arm: Factor out powerdown
 notifier from GPIO
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is in preparation of using GED device for
system_powerdown event. Make the powerdown notifier
registration independent of create_gpio() fn.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c         | 12 ++++--------
 include/hw/arm/virt.h |  1 +
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 95accc28f1..89ee37d7de 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -791,10 +791,6 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
     qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
 }
 
-static Notifier virt_system_powerdown_notifier = {
-    .notify = virt_powerdown_req
-};
-
 static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
 {
     char *nodename;
@@ -835,10 +831,6 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
                           KEY_POWER);
     qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
                            "gpios", phandle, 3, 0);
-
-    /* connect powerdown request */
-    qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);
-
     g_free(nodename);
 }
 
@@ -1730,6 +1722,10 @@ static void machvirt_init(MachineState *machine)
         vms->acpi_dev = create_acpi_ged(vms, pic);
     }
 
+     /* connect powerdown request */
+     vms->powerdown_notifier.notify = virt_powerdown_req;
+     qemu_register_powerdown_notifier(&vms->powerdown_notifier);
+
     /* Create mmio transports, so the user can create virtio backends
      * (which will be automatically plugged in to the transports). If
      * no backend is created the transport will just sit harmlessly idle.
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 577ee49b4b..0b41083e9d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -137,6 +137,7 @@ typedef struct {
     int psci_conduit;
     hwaddr highest_gpa;
     DeviceState *acpi_dev;
+    Notifier powerdown_notifier;
 } VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
-- 
2.17.1



