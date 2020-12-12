Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1633A2D898A
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 20:03:58 +0100 (CET)
Received: from localhost ([::1]:57654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koABQ-0005hg-J1
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 14:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9U2-0000fo-Nz
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:19:06 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:52471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9Ty-00027N-MV
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:19:06 -0500
Received: from localhost.localdomain ([82.252.152.214]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N5UoU-1k4lJP3iYc-0170Ry; Sat, 12 Dec 2020 18:55:02 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] hw/m68k/q800: Don't connect two qemu_irqs directly to the
 same input
Date: Sat, 12 Dec 2020 18:54:54 +0100
Message-Id: <20201212175458.259960-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201212175458.259960-1-laurent@vivier.eu>
References: <20201212175458.259960-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:I4fkby6ZmrgodSAXpPeZKvKTnWrpS2olwDJ2NsWWHZKHFt2veie
 lfaOiVVXP+sB426rbJNs8V/54Y4T20stGIrU4mVMu72FFNw3dqhdvvfgXYQu3mqbDjBxt6h
 wNNo00cblMmoVzsGU8/6YJVSHWwh69Z27d1Qxh7zAjDmw4aduFD9ZHrloaPCZnlEphZCImZ
 bcOcTH67HlwJ/rJgInkkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:84uPdYbLF+E=:V4SNzK5jCfgZA3wtErnrk8
 kyWcrYh5K0r11TdDnAz+ycUbOGUUnNoDx8QdURvX8/3v73Vqwc8Djh5PqJ/grxmRHoftdvQwr
 dJN2lZJ2m8+C4v0qfD5A2jeIj/b8JIijtY562oJYx5Fa8GF28PDZG4gMcmeAslSeuLATBhPUJ
 7gkGwH6+5wfyi1LyK1cif0VCYkuy7wEI164BWZ/PLIXWCpPUCOOejOb08FMPm43WnZ9088DL9
 ZfXDPtC08/dj7dAJDN1gPu9kBPStxXimyHLUbYhf4OqmwCCU4Ex+oDwQhcZkm6/9z1bipeOI+
 UYuXpu0a66G0QvTr1/IqWkVpbsxX5FIiftPwMo3shwN4HgRatj2H7jOEkOuBSNddWoytdYxhj
 vOwHa5UUXKkFOkAYna0t2jA0FCn71pKiT8zUXKlYq28rFbEr7SmuG0HEyOXe4xY/eRQcCDqe6
 vSH4ff3mSQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The q800 board code connects both of the IRQ outputs of the ESCC
to the same pic[3] qemu_irq. Connecting two qemu_irqs outputs directly
to the same input is not valid as it produces subtly wrong behaviour
(for instance if both the IRQ lines are high, and then one goes
low, the PIC input will see this as a high-to-low transition
even though the second IRQ line should still be holding it high).

This kind of wiring needs an explicitly created OR gate; add one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201106235109.7066-2-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c  | 12 ++++++++++--
 hw/m68k/Kconfig |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 4db2b9bbc7b4..f9a2be776eb0 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -29,6 +29,7 @@
 #include "hw/hw.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
+#include "hw/or-irq.h"
 #include "elf.h"
 #include "hw/loader.h"
 #include "ui/console.h"
@@ -173,6 +174,7 @@ static void q800_init(MachineState *machine)
     CPUState *cs;
     DeviceState *dev;
     DeviceState *via_dev;
+    DeviceState *escc_orgate;
     SysBusESPState *sysbus_esp;
     ESPState *esp;
     SysBusDevice *sysbus;
@@ -285,8 +287,14 @@ static void q800_init(MachineState *machine)
     qdev_prop_set_uint32(dev, "chnAtype", 0);
     sysbus = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
-    sysbus_connect_irq(sysbus, 0, pic[3]);
-    sysbus_connect_irq(sysbus, 1, pic[3]);
+
+    /* Logically OR both its IRQs together */
+    escc_orgate = DEVICE(object_new(TYPE_OR_IRQ));
+    object_property_set_int(OBJECT(escc_orgate), "num-lines", 2, &error_fatal);
+    qdev_realize_and_unref(escc_orgate, NULL, &error_fatal);
+    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(escc_orgate, 0));
+    sysbus_connect_irq(sysbus, 1, qdev_get_gpio_in(escc_orgate, 1));
+    qdev_connect_gpio_out(DEVICE(escc_orgate), 0, pic[3]);
     sysbus_mmio_map(sysbus, 0, SCC_BASE);
 
     /* SCSI */
diff --git a/hw/m68k/Kconfig b/hw/m68k/Kconfig
index c757e7dfa48b..60d7bcfb8f2b 100644
--- a/hw/m68k/Kconfig
+++ b/hw/m68k/Kconfig
@@ -22,3 +22,4 @@ config Q800
     select ESCC
     select ESP
     select DP8393X
+    select OR_IRQ
-- 
2.29.2


