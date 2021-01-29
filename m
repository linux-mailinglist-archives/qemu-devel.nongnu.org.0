Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12841308841
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:28:38 +0100 (CET)
Received: from localhost ([::1]:35164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Rx7-0007PB-2d
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWL-00053x-BE
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:57 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:47077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWD-000780-Jt
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:57 -0500
Received: by mail-wr1-x430.google.com with SMTP id q7so8360965wre.13
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LdChXWvig4K9vtaYyGdJgouYmGk4finx7K8kf9XdaMA=;
 b=vPnFOZxZBM4+56AfxqlxxEuzTeQlN7BUGSpGxP090NdxtfNBDSk9R4ULvAHd3/BcqL
 Vfsn1PFl67e9srnvBC/NCAaWSmvZCIYKqNmGg60cjWK1gPJ2BE78hKK6c5VqsYV+2O4R
 FdCO9K4w80Rs3DoBtvCM+B1nPutE2AabYMElQyBmw0z69H5Kb2sEsWo1uNAgdr4qIZgn
 fYDZm74uglhTXvm8Cq+eNQIO5te3l4hyegKO45cH/IY23Gv7TdBFbgHR2bLEUyxiZYNy
 0SfOMm4mN9mej+2BqZlnERexh7TfBO3otCHU1LddKZaDckP1jmO1714t6s1rN/TKcNOZ
 NHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LdChXWvig4K9vtaYyGdJgouYmGk4finx7K8kf9XdaMA=;
 b=bsE5XzdkFLfsBrcFUwPVkiA+fi4Lr1ihPnaTIPLs2IB+4rELW9adRI4AvJDdOc6PTn
 udn0I2EwR4P5hLTIgsKIJEyiWL5RTN/qGRfZfNzOmVVtGSIeBK9HNu6YLD4KubGVls8d
 rE+pPdEOe1U9ODqHyLgbQwzN/4GWukLLsPw57dhQ5bPdqBvHh6AhwvuX3tSyzVkbTKyR
 SpgERoHKzCAVXULTwoVY4/5oe6ibvwLBQDAe4K+AxmQMO8IrTvuSwfPFyrMwXa+WF9Yv
 kM4okAV5Ye3KUTUs1Ei7SHFFwMMmbUyyFDhHwSivmgdKj3tVvHma01/5ZH1FQ4RPYVCI
 mQqw==
X-Gm-Message-State: AOAM533A/YgUat2PNIgKQfN4CjUKiWuPMdeyHX+xt2WAsQFdJfjNYbgf
 N9scZsSgF1FUNZBerh8ono5iRGmWJ/FLXA==
X-Google-Smtp-Source: ABdhPJytgZevu1xoCnNasE5Jxpy7t4UuOYLLOi+JdeORZBH1vMqQ/hIQP3VWqtFgpubjjBTad94OgQ==
X-Received: by 2002:adf:eb4e:: with SMTP id u14mr3884668wrn.99.1611918048091; 
 Fri, 29 Jan 2021 03:00:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/46] hw/arm/stellaris: Convert SSYS to QOM device
Date: Fri, 29 Jan 2021 11:00:03 +0000
Message-Id: <20210129110012.8660-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the SSYS code in the Stellaris boards (which encapsulates the
system registers) to a proper QOM device.  This will provide us with
somewhere to put the output Clock whose frequency depends on the
setting of the PLL configuration registers.

This is a migration compatibility break for lm3s811evb, lm3s6965evb.

We use 3-phase reset here because the Clock will need to propagate
its value in the hold phase.

For the moment we reset the device during the board creation so that
the system_clock_scale global gets set; this will be removed in a
subsequent commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-17-peter.maydell@linaro.org
Message-id: 20210121190622.22000-17-peter.maydell@linaro.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stellaris.c | 132 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 107 insertions(+), 25 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 652823195b1..0194ede2fe0 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -357,7 +357,12 @@ static void stellaris_gptm_realize(DeviceState *dev, Error **errp)
 
 /* System controller.  */
 
-typedef struct {
+#define TYPE_STELLARIS_SYS "stellaris-sys"
+OBJECT_DECLARE_SIMPLE_TYPE(ssys_state, STELLARIS_SYS)
+
+struct ssys_state {
+    SysBusDevice parent_obj;
+
     MemoryRegion iomem;
     uint32_t pborctl;
     uint32_t ldopctl;
@@ -371,11 +376,18 @@ typedef struct {
     uint32_t dcgc[3];
     uint32_t clkvclr;
     uint32_t ldoarst;
+    qemu_irq irq;
+    /* Properties (all read-only registers) */
     uint32_t user0;
     uint32_t user1;
-    qemu_irq irq;
-    stellaris_board_info *board;
-} ssys_state;
+    uint32_t did0;
+    uint32_t did1;
+    uint32_t dc0;
+    uint32_t dc1;
+    uint32_t dc2;
+    uint32_t dc3;
+    uint32_t dc4;
+};
 
 static void ssys_update(ssys_state *s)
 {
@@ -430,7 +442,7 @@ static uint32_t pllcfg_fury[16] = {
 
 static int ssys_board_class(const ssys_state *s)
 {
-    uint32_t did0 = s->board->did0;
+    uint32_t did0 = s->did0;
     switch (did0 & DID0_VER_MASK) {
     case DID0_VER_0:
         return DID0_CLASS_SANDSTORM;
@@ -456,19 +468,19 @@ static uint64_t ssys_read(void *opaque, hwaddr offset,
 
     switch (offset) {
     case 0x000: /* DID0 */
-        return s->board->did0;
+        return s->did0;
     case 0x004: /* DID1 */
-        return s->board->did1;
+        return s->did1;
     case 0x008: /* DC0 */
-        return s->board->dc0;
+        return s->dc0;
     case 0x010: /* DC1 */
-        return s->board->dc1;
+        return s->dc1;
     case 0x014: /* DC2 */
-        return s->board->dc2;
+        return s->dc2;
     case 0x018: /* DC3 */
-        return s->board->dc3;
+        return s->dc3;
     case 0x01c: /* DC4 */
-        return s->board->dc4;
+        return s->dc4;
     case 0x030: /* PBORCTL */
         return s->pborctl;
     case 0x034: /* LDOPCTL */
@@ -646,9 +658,9 @@ static const MemoryRegionOps ssys_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void ssys_reset(void *opaque)
+static void stellaris_sys_reset_enter(Object *obj, ResetType type)
 {
-    ssys_state *s = (ssys_state *)opaque;
+    ssys_state *s = STELLARIS_SYS(obj);
 
     s->pborctl = 0x7ffd;
     s->rcc = 0x078e3ac0;
@@ -661,9 +673,19 @@ static void ssys_reset(void *opaque)
     s->rcgc[0] = 1;
     s->scgc[0] = 1;
     s->dcgc[0] = 1;
+}
+
+static void stellaris_sys_reset_hold(Object *obj)
+{
+    ssys_state *s = STELLARIS_SYS(obj);
+
     ssys_calculate_system_clock(s);
 }
 
+static void stellaris_sys_reset_exit(Object *obj)
+{
+}
+
 static int stellaris_sys_post_load(void *opaque, int version_id)
 {
     ssys_state *s = opaque;
@@ -695,27 +717,66 @@ static const VMStateDescription vmstate_stellaris_sys = {
     }
 };
 
+static Property stellaris_sys_properties[] = {
+    DEFINE_PROP_UINT32("user0", ssys_state, user0, 0),
+    DEFINE_PROP_UINT32("user1", ssys_state, user1, 0),
+    DEFINE_PROP_UINT32("did0", ssys_state, did0, 0),
+    DEFINE_PROP_UINT32("did1", ssys_state, did1, 0),
+    DEFINE_PROP_UINT32("dc0", ssys_state, dc0, 0),
+    DEFINE_PROP_UINT32("dc1", ssys_state, dc1, 0),
+    DEFINE_PROP_UINT32("dc2", ssys_state, dc2, 0),
+    DEFINE_PROP_UINT32("dc3", ssys_state, dc3, 0),
+    DEFINE_PROP_UINT32("dc4", ssys_state, dc4, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void stellaris_sys_instance_init(Object *obj)
+{
+    ssys_state *s = STELLARIS_SYS(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(s);
+
+    memory_region_init_io(&s->iomem, obj, &ssys_ops, s, "ssys", 0x00001000);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
 static int stellaris_sys_init(uint32_t base, qemu_irq irq,
                               stellaris_board_info * board,
                               uint8_t *macaddr)
 {
-    ssys_state *s;
+    DeviceState *dev = qdev_new(TYPE_STELLARIS_SYS);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-    s = g_new0(ssys_state, 1);
-    s->irq = irq;
-    s->board = board;
     /* Most devices come preprogrammed with a MAC address in the user data. */
-    s->user0 = macaddr[0] | (macaddr[1] << 8) | (macaddr[2] << 16);
-    s->user1 = macaddr[3] | (macaddr[4] << 8) | (macaddr[5] << 16);
+    qdev_prop_set_uint32(dev, "user0",
+                         macaddr[0] | (macaddr[1] << 8) | (macaddr[2] << 16));
+    qdev_prop_set_uint32(dev, "user1",
+                         macaddr[3] | (macaddr[4] << 8) | (macaddr[5] << 16));
+    qdev_prop_set_uint32(dev, "did0", board->did0);
+    qdev_prop_set_uint32(dev, "did1", board->did1);
+    qdev_prop_set_uint32(dev, "dc0", board->dc0);
+    qdev_prop_set_uint32(dev, "dc1", board->dc1);
+    qdev_prop_set_uint32(dev, "dc2", board->dc2);
+    qdev_prop_set_uint32(dev, "dc3", board->dc3);
+    qdev_prop_set_uint32(dev, "dc4", board->dc4);
+
+    sysbus_realize_and_unref(sbd, &error_fatal);
+    sysbus_mmio_map(sbd, 0, base);
+    sysbus_connect_irq(sbd, 0, irq);
+
+    /*
+     * Normally we should not be resetting devices like this during
+     * board creation. For the moment we need to do so, because
+     * system_clock_scale will only get set when the STELLARIS_SYS
+     * device is reset, and we need its initial value to pass to
+     * the watchdog device. This hack can be removed once the
+     * watchdog has been converted to use a Clock input instead.
+     */
+    device_cold_reset(dev);
 
-    memory_region_init_io(&s->iomem, NULL, &ssys_ops, s, "ssys", 0x00001000);
-    memory_region_add_subregion(get_system_memory(), base, &s->iomem);
-    ssys_reset(s);
-    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_stellaris_sys, s);
     return 0;
 }
 
-
 /* I2C controller.  */
 
 #define TYPE_STELLARIS_I2C "stellaris-i2c"
@@ -1553,11 +1614,32 @@ static const TypeInfo stellaris_adc_info = {
     .class_init    = stellaris_adc_class_init,
 };
 
+static void stellaris_sys_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    dc->vmsd = &vmstate_stellaris_sys;
+    rc->phases.enter = stellaris_sys_reset_enter;
+    rc->phases.hold = stellaris_sys_reset_hold;
+    rc->phases.exit = stellaris_sys_reset_exit;
+    device_class_set_props(dc, stellaris_sys_properties);
+}
+
+static const TypeInfo stellaris_sys_info = {
+    .name = TYPE_STELLARIS_SYS,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(ssys_state),
+    .instance_init = stellaris_sys_instance_init,
+    .class_init = stellaris_sys_class_init,
+};
+
 static void stellaris_register_types(void)
 {
     type_register_static(&stellaris_i2c_info);
     type_register_static(&stellaris_gptm_info);
     type_register_static(&stellaris_adc_info);
+    type_register_static(&stellaris_sys_info);
 }
 
 type_init(stellaris_register_types)
-- 
2.20.1


