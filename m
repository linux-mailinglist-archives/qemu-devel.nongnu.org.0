Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D54119EC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:37:43 +0200 (CEST)
Received: from localhost ([::1]:50776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMIY-0002xh-3V
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4n-0005xL-PY
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:23:31 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:47975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4e-0004EM-TN
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:23:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.35])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 978FF13EB74;
 Mon, 20 Sep 2021 16:23:14 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 18:23:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005443192fb-46cc-46b1-80d7-f42416cfffd5,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 08/12] aspeed/smc: QOMify AspeedSMCFlash
Date: Mon, 20 Sep 2021 18:23:05 +0200
Message-ID: <20210920162309.1091711-9-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920162309.1091711-1-clg@kaod.org>
References: <20210920162309.1091711-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4030b99e-b178-4fba-91bb-cc0f443a69fb
X-Ovh-Tracer-Id: 13074512671625087849
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AspeedSMCFlash is a small structure representing the AHB memory window
through which the contents of a flash device can be accessed with MMIOs.

Introduce an AspeedSMCFlash SysBusDevice model and attach the associated
memory region to the newly instantiated objects.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h | 13 +++++--
 hw/ssi/aspeed_smc.c         | 76 +++++++++++++++++++++++++++++++++----
 2 files changed, 77 insertions(+), 12 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 40b6926b3e02..ee943228b96f 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -30,18 +30,23 @@
 #include "qom/object.h"
 
 struct AspeedSMCState;
-typedef struct AspeedSMCFlash {
-    struct AspeedSMCState *controller;
 
+#define TYPE_ASPEED_SMC_FLASH "aspeed.smc.flash"
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedSMCFlash, ASPEED_SMC_FLASH)
+struct AspeedSMCFlash {
+    SysBusDevice parent_obj;
+
+    struct AspeedSMCState *controller;
     uint8_t cs;
 
     MemoryRegion mmio;
-} AspeedSMCFlash;
+};
 
 #define TYPE_ASPEED_SMC "aspeed.smc"
 OBJECT_DECLARE_TYPE(AspeedSMCState, AspeedSMCClass, ASPEED_SMC)
 
 #define ASPEED_SMC_R_MAX        (0x100 / 4)
+#define ASPEED_SMC_CS_MAX       5
 
 struct AspeedSMCState {
     SysBusDevice parent_obj;
@@ -72,7 +77,7 @@ struct AspeedSMCState {
     MemoryRegion *dram_mr;
     AddressSpace dram_as;
 
-    AspeedSMCFlash *flashes;
+    AspeedSMCFlash flashes[ASPEED_SMC_CS_MAX];
 
     uint8_t snoop_index;
     uint8_t snoop_dummies;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 643cde832396..c534e9bf87ee 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1101,6 +1101,18 @@ static const MemoryRegionOps aspeed_smc_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+static void aspeed_smc_instance_init(Object *obj)
+{
+    AspeedSMCState *s = ASPEED_SMC(obj);
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
+    int i;
+
+    for (i = 0; i < asc->max_peripherals; i++) {
+        object_initialize_child(obj, "flash[*]", &s->flashes[i],
+                                TYPE_ASPEED_SMC_FLASH);
+    }
+}
+
 /*
  * Initialize the custom address spaces for DMAs
  */
@@ -1123,7 +1135,6 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     AspeedSMCState *s = ASPEED_SMC(dev);
     AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
     int i;
-    char name[32];
     hwaddr offset = 0;
 
     /* keep a copy under AspeedSMCState to speed up accesses */
@@ -1170,8 +1181,6 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
                              &s->mmio_flash, 0, asc->flash_window_size);
     sysbus_init_mmio(sbd, &s->mmio_flash_alias);
 
-    s->flashes = g_new0(AspeedSMCFlash, asc->max_peripherals);
-
     /*
      * Let's create a sub memory region for each possible peripheral. All
      * have a configurable memory segment in the overall flash mapping
@@ -1182,12 +1191,17 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < asc->max_peripherals; ++i) {
         AspeedSMCFlash *fl = &s->flashes[i];
 
-        snprintf(name, sizeof(name), TYPE_ASPEED_SMC ".flash.%d", i);
+        if (!object_property_set_link(OBJECT(fl), "controller", OBJECT(s),
+                                      errp)) {
+            return;
+        }
+        if (!object_property_set_uint(OBJECT(fl), "cs", i, errp)) {
+            return;
+        }
+        if (!sysbus_realize(SYS_BUS_DEVICE(fl), errp)) {
+            return;
+        }
 
-        fl->cs = i;
-        fl->controller = s;
-        memory_region_init_io(&fl->mmio, OBJECT(s), &aspeed_smc_flash_ops,
-                              fl, name, asc->segments[i].size);
         memory_region_add_subregion(&s->mmio_flash, offset, &fl->mmio);
         offset += asc->segments[i].size;
     }
@@ -1231,12 +1245,57 @@ static void aspeed_smc_class_init(ObjectClass *klass, void *data)
 static const TypeInfo aspeed_smc_info = {
     .name           = TYPE_ASPEED_SMC,
     .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_init  = aspeed_smc_instance_init,
     .instance_size  = sizeof(AspeedSMCState),
     .class_size     = sizeof(AspeedSMCClass),
     .class_init     = aspeed_smc_class_init,
     .abstract       = true,
 };
 
+static void aspeed_smc_flash_realize(DeviceState *dev, Error **errp)
+{
+    AspeedSMCFlash *s = ASPEED_SMC_FLASH(dev);
+    AspeedSMCClass *asc;
+    g_autofree char *name = g_strdup_printf(TYPE_ASPEED_SMC_FLASH ".%d", s->cs);
+
+    if (!s->controller) {
+        error_setg(errp, TYPE_ASPEED_SMC_FLASH ": 'controller' link not set");
+        return;
+    }
+
+    asc = ASPEED_SMC_GET_CLASS(s->controller);
+
+    /*
+     * Use the default segment value to size the memory region. This
+     * can be changed by FW at runtime.
+     */
+    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_flash_ops,
+                          s, name, asc->segments[s->cs].size);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+}
+
+static Property aspeed_smc_flash_properties[] = {
+    DEFINE_PROP_UINT8("cs", AspeedSMCFlash, cs, 0),
+    DEFINE_PROP_LINK("controller", AspeedSMCFlash, controller, TYPE_ASPEED_SMC,
+                     AspeedSMCState *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aspeed_smc_flash_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "Aspeed SMC Flash device region";
+    dc->realize = aspeed_smc_flash_realize;
+    device_class_set_props(dc, aspeed_smc_flash_properties);
+}
+
+static const TypeInfo aspeed_smc_flash_info = {
+    .name           = TYPE_ASPEED_SMC_FLASH,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(AspeedSMCFlash),
+    .class_init     = aspeed_smc_flash_class_init,
+};
 
 /*
  * The Segment Registers of the AST2400 and AST2500 have a 8MB
@@ -1625,6 +1684,7 @@ static const TypeInfo aspeed_2600_spi2_info = {
 
 static void aspeed_smc_register_types(void)
 {
+    type_register_static(&aspeed_smc_flash_info);
     type_register_static(&aspeed_smc_info);
     type_register_static(&aspeed_2400_smc_info);
     type_register_static(&aspeed_2400_fmc_info);
-- 
2.31.1


