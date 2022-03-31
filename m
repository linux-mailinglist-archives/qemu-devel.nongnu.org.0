Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EC14ED5BD
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 10:36:49 +0200 (CEST)
Received: from localhost ([::1]:48634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqIS-0001pI-7W
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 04:36:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nZpzS-000290-Jf; Thu, 31 Mar 2022 04:17:10 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:46365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nZpzQ-00017L-Be; Thu, 31 Mar 2022 04:17:10 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22V84ttu054264;
 Thu, 31 Mar 2022 16:04:55 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 31 Mar
 2022 16:15:53 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v2 8/9] aspeed: Add an AST1030 eval board
Date: Thu, 31 Mar 2022 16:15:44 +0800
Message-ID: <20220331081545.7140-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331081545.7140-1-jamin_lin@aspeedtech.com>
References: <20220331081545.7140-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22V84ttu054264
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The image should be supplied with ELF binary.
$ qemu-system-arm -M ast1030-evb -kernel zephyr.elf -nographic

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/arm/aspeed.c         | 111 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/aspeed.h |  21 ++++++++
 2 files changed, 132 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d205384d98..14ce0dff8b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -24,6 +24,7 @@
 #include "hw/loader.h"
 #include "qemu/error-report.h"
 #include "qemu/units.h"
+#include "hw/qdev-clock.h"
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -1361,3 +1362,113 @@ static const TypeInfo aspeed_machine_types[] = {
 };
 
 DEFINE_TYPES(aspeed_machine_types)
+
+#define AST1030_INTERNAL_FLASH_SIZE (1024 * 1024)
+
+struct AspeedMiniBmcMachineState {
+    /* Private */
+    MachineState parent_obj;
+    /* Public */
+
+    AspeedSoCState soc;
+    MemoryRegion ram_container;
+    MemoryRegion max_ram;
+    bool mmio_exec;
+    char *fmc_model;
+    char *spi_model;
+};
+
+/* Main SYSCLK frequency in Hz (200MHz) */
+#define SYSCLK_FRQ 200000000ULL
+
+static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
+                                                          void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMiniBmcMachineClass *amc = ASPEED_MINIBMC_MACHINE_CLASS(oc);
+
+    mc->desc = "Aspeed AST1030 MiniBMC (Cortex-M4)";
+    amc->soc_name = "ast1030-a1";
+    amc->hw_strap1 = 0;
+    amc->hw_strap2 = 0;
+    mc->default_ram_size = 0;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus = 1;
+    amc->fmc_model = "sst25vf032b";
+    amc->spi_model = "sst25vf032b";
+    amc->num_cs = 2;
+}
+
+static void ast1030_machine_instance_init(Object *obj)
+{
+    ASPEED_MINIBMC_MACHINE(obj)->mmio_exec = false;
+}
+
+static void aspeed_minibmc_machine_init(MachineState *machine)
+{
+    AspeedMiniBmcMachineState *bmc = ASPEED_MINIBMC_MACHINE(machine);
+    AspeedMiniBmcMachineClass *amc = ASPEED_MINIBMC_MACHINE_GET_CLASS(machine);
+    Clock *sysclk;
+
+    sysclk = clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(sysclk, SYSCLK_FRQ);
+
+    object_initialize_child(OBJECT(machine), "soc", &bmc->soc, amc->soc_name);
+    qdev_connect_clock_in(DEVICE(&bmc->soc), "sysclk", sysclk);
+
+    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
+                         amc->uart_default);
+    qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
+
+    aspeed_board_init_flashes(&bmc->soc.fmc,
+                              bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
+                              amc->num_cs,
+                              0);
+
+    aspeed_board_init_flashes(&bmc->soc.spi[0],
+                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
+                              amc->num_cs, amc->num_cs);
+
+    aspeed_board_init_flashes(&bmc->soc.spi[1],
+                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
+                              amc->num_cs, (amc->num_cs * 2));
+
+    if (amc->i2c_init) {
+        amc->i2c_init(bmc);
+    }
+
+    armv7m_load_kernel(ARM_CPU(first_cpu),
+                       machine->kernel_filename,
+                       AST1030_INTERNAL_FLASH_SIZE);
+}
+
+static void aspeed_minibmc_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMiniBmcMachineClass *amc = ASPEED_MINIBMC_MACHINE_CLASS(oc);
+
+    mc->init = aspeed_minibmc_machine_init;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->no_parallel = 1;
+    mc->default_ram_id = "ram";
+    amc->uart_default = ASPEED_DEV_UART5;
+}
+
+static const TypeInfo aspeed_minibmc_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("ast1030-evb"),
+        .parent         = TYPE_ASPEED_MINIBMC_MACHINE,
+        .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
+    }, {
+        .name           = TYPE_ASPEED_MINIBMC_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .instance_size  = sizeof(AspeedMiniBmcMachineState),
+        .instance_init  = ast1030_machine_instance_init,
+        .class_size    = sizeof(AspeedMiniBmcMachineClass),
+        .class_init    = aspeed_minibmc_machine_class_init,
+        .abstract      = true,
+    }
+};
+
+DEFINE_TYPES(aspeed_minibmc_machine_types)
+
diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index cbeacb214c..d300ab0042 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -13,12 +13,18 @@
 #include "qom/object.h"
 
 typedef struct AspeedMachineState AspeedMachineState;
+typedef struct AspeedMiniBmcMachineState AspeedMiniBmcMachineState;
 
 #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
+#define TYPE_ASPEED_MINIBMC_MACHINE MACHINE_TYPE_NAME("aspeed-minibmc")
 typedef struct AspeedMachineClass AspeedMachineClass;
 DECLARE_OBJ_CHECKERS(AspeedMachineState, AspeedMachineClass,
                      ASPEED_MACHINE, TYPE_ASPEED_MACHINE)
 
+typedef struct AspeedMiniBmcMachineClass AspeedMiniBmcMachineClass;
+DECLARE_OBJ_CHECKERS(AspeedMiniBmcMachineState, AspeedMiniBmcMachineClass,
+                     ASPEED_MINIBMC_MACHINE, TYPE_ASPEED_MINIBMC_MACHINE)
+
 #define ASPEED_MAC0_ON   (1 << 0)
 #define ASPEED_MAC1_ON   (1 << 1)
 #define ASPEED_MAC2_ON   (1 << 2)
@@ -41,5 +47,20 @@ struct AspeedMachineClass {
     uint32_t uart_default;
 };
 
+struct AspeedMiniBmcMachineClass {
+    MachineClass parent_obj;
+
+    const char *name;
+    const char *desc;
+    const char *soc_name;
+    uint32_t hw_strap1;
+    uint32_t hw_strap2;
+    const char *fmc_model;
+    const char *spi_model;
+    uint32_t num_cs;
+    uint32_t macs_mask;
+    void (*i2c_init)(AspeedMiniBmcMachineState *bmc);
+    uint32_t uart_default;
+};
 
 #endif
-- 
2.17.1


