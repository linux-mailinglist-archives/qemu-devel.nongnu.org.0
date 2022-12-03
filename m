Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E0C641A01
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 00:22:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1bnM-00006l-4r; Sat, 03 Dec 2022 18:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p1bnJ-000050-Li; Sat, 03 Dec 2022 18:19:41 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p1bnE-0001Zp-2w; Sat, 03 Dec 2022 18:19:41 -0500
Received: by mail-lj1-x22e.google.com with SMTP id z24so9415794ljn.4;
 Sat, 03 Dec 2022 15:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OwV0IdsvFUwiwgonjdaaaLXb1o1stWZ7D+ZfqdOotso=;
 b=DfNyQFZDAacO/eEk9RCnkYagW3UuKBOK7L+EIdeL1DxIjGPswjub5mXjmW0gDjEwvq
 CQCqpFMXpVktK6I/TzzFRfkYorT5HRHfIjIlCx3P3FZu320fJ8Sy/TprnTfATTCDeY9w
 t6EIx2fAMBd/BVVLJK4fUdtjL7VrbEq6of/IWk+bAZfVERFjIM2tlaYhKbg8X6zJVOco
 O9/Umyd8zfRdUaj7AxMyHtnSZaod9p/NapkFVzhvqYrpdHLpiVFlGPscwW+cg2F7AV0d
 QmKNXK61AShj+CD2nhvxkV5sL8rotYnsGDjm2PLVn4EMC+LaYlIuLTLQTNJ9mv59nS1e
 mXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OwV0IdsvFUwiwgonjdaaaLXb1o1stWZ7D+ZfqdOotso=;
 b=bb8lakH8V/1qF8D7RlJbA4vJfcOkOheoTCa7ZDx1CFir/W1JJLUH06yONTT2Fi/gwI
 t56NLp7JVkvlusiwFkOhvmDjTl16CDgglIppyldnmT5JMxpDryzgCHRP/cJiqDM5KQ5H
 u8wHnziHvcc8Aa+QTObMejsd4XcIwh5EXJ/UYaYpsgPvnfvftvkoSfVKxrcT8/T+4Kls
 wWarcWatsZ5tAwLcwk2xz5Mi34CIVH7TI4+CD3x9+avJgpDhVYxJJPlL9D/nSl4l5bTR
 bL80nb+DZ5JMIOMrkm3bLIotXfiV0Ef4W1d5WElIi7pVgZBmSiv5YkPI587DLH0F6wGM
 ncHw==
X-Gm-Message-State: ANoB5pk9d6MfosfzjvLQLXESKPG3gC+eUBAVb0FxHhhNFEi8HYi7uEfL
 RbBZGzZSo710JCp2d7ZjbC8=
X-Google-Smtp-Source: AA0mqf4GPTZCd7c/tbfjFbXvL6lcZUflF3jLynX1e/eVz0c50GCUpfZ9qYzBQIIsxVnly0rrsjAv+A==
X-Received: by 2002:a2e:6812:0:b0:279:4159:ab79 with SMTP id
 c18-20020a2e6812000000b002794159ab79mr19974345lja.144.1670109574001; 
 Sat, 03 Dec 2022 15:19:34 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 b27-20020a05651c033b00b002770e6c620bsm22623ljp.106.2022.12.03.15.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 15:19:33 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 4/6] hw/misc: Allwinner AXP-209 Emulation
Date: Sun,  4 Dec 2022 00:19:02 +0100
Message-Id: <20221203231904.25155-5-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This patch adds minimal support for AXP-209 PMU.
Most important is chip ID since U-Boot SPL expects version 0x1. Besides
the chip ID register, reset values for two more registers used by A10
U-Boot SPL are covered.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 hw/arm/Kconfig              |   1 +
 hw/misc/Kconfig             |   4 +
 hw/misc/allwinner-axp-209.c | 263 ++++++++++++++++++++++++++++++++++++
 hw/misc/meson.build         |   1 +
 4 files changed, 269 insertions(+)
 create mode 100644 hw/misc/allwinner-axp-209.c

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index eefe1fd134..67c6e83fe6 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -323,6 +323,7 @@ config ALLWINNER_A10
     select ALLWINNER_A10_DRAMC
     select ALLWINNER_EMAC
     select ALLWINNER_I2C
+    select ALLWINNER_AXP_209
     select SERIAL
     select UNIMP
 
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 052fb54310..3855d937fd 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -180,4 +180,8 @@ config ALLWINNER_A10_CCM
 config ALLWINNER_A10_DRAMC
     bool
 
+config ALLWINNER_AXP_209
+    bool
+    depends on I2C
+
 source macio/Kconfig
diff --git a/hw/misc/allwinner-axp-209.c b/hw/misc/allwinner-axp-209.c
new file mode 100644
index 0000000000..229e3961b6
--- /dev/null
+++ b/hw/misc/allwinner-axp-209.c
@@ -0,0 +1,263 @@
+/*
+ * AXP-209 Emulation
+ *
+ * Written by Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/i2c/i2c.h"
+#include "migration/vmstate.h"
+
+#ifndef AXP_209_ERR_DEBUG
+#define AXP_209_ERR_DEBUG 0
+#endif
+
+#define TYPE_AXP_209 "allwinner.axp209"
+
+#define AXP_209(obj) \
+    OBJECT_CHECK(AXP209I2CState, (obj), TYPE_AXP_209)
+
+#define DB_PRINT(fmt, args...) do { \
+    if (AXP_209_ERR_DEBUG) { \
+        fprintf(stderr, "%s: " fmt, __func__, ## args); \
+    } \
+} while (0)
+
+/* registers */
+enum {
+    REG_POWER_STATUS = 0x0u,
+    REG_OPERATING_MODE,
+    REG_OTG_VBUS_STATUS,
+    REG_CHIP_VERSION,
+    REG_DATA_CACHE_0,
+    REG_DATA_CACHE_1,
+    REG_DATA_CACHE_2,
+    REG_DATA_CACHE_3,
+    REG_DATA_CACHE_4,
+    REG_DATA_CACHE_5,
+    REG_DATA_CACHE_6,
+    REG_DATA_CACHE_7,
+    REG_DATA_CACHE_8,
+    REG_DATA_CACHE_9,
+    REG_DATA_CACHE_A,
+    REG_DATA_CACHE_B,
+    REG_POWER_OUTPUT_CTRL = 0x12u,
+    REG_DC_DC2_OUT_V_CTRL = 0x23u,
+    REG_DC_DC2_DVS_CTRL = 0x25u,
+    REG_DC_DC3_OUT_V_CTRL = 0x27u,
+    REG_LDO2_4_OUT_V_CTRL,
+    REG_LDO3_OUT_V_CTRL,
+    REG_VBUS_CH_MGMT = 0x30u,
+    REG_SHUTDOWN_V_CTRL,
+    REG_SHUTDOWN_CTRL,
+    REG_CHARGE_CTRL_1,
+    REG_CHARGE_CTRL_2,
+    REG_SPARE_CHARGE_CTRL,
+    REG_PEK_KEY_CTRL,
+    REG_DC_DC_FREQ_SET,
+    REG_CHR_TEMP_TH_SET,
+    REG_CHR_HIGH_TEMP_TH_CTRL,
+    REG_IPSOUT_WARN_L1,
+    REG_IPSOUT_WARN_L2,
+    REG_DISCHR_TEMP_TH_SET,
+    REG_DISCHR_HIGH_TEMP_TH_CTRL,
+    REG_IRQ_BANK_1_CTRL = 0x40u,
+    REG_IRQ_BANK_2_CTRL,
+    REG_IRQ_BANK_3_CTRL,
+    REG_IRQ_BANK_4_CTRL,
+    REG_IRQ_BANK_5_CTRL,
+    REG_IRQ_BANK_1_STAT = 0x48u,
+    REG_IRQ_BANK_2_STAT,
+    REG_IRQ_BANK_3_STAT,
+    REG_IRQ_BANK_4_STAT,
+    REG_IRQ_BANK_5_STAT,
+    REG_ADC_ACIN_V_H = 0x56u,
+    REG_ADC_ACIN_V_L,
+    REG_ADC_ACIN_CURR_H,
+    REG_ADC_ACIN_CURR_L,
+    REG_ADC_VBUS_V_H,
+    REG_ADC_VBUS_V_L,
+    REG_ADC_VBUS_CURR_H,
+    REG_ADC_VBUS_CURR_L,
+    REG_ADC_INT_TEMP_H,
+    REG_ADC_INT_TEMP_L,
+    REG_ADC_TEMP_SENS_V_H = 0x62u,
+    REG_ADC_TEMP_SENS_V_L,
+    REG_ADC_BAT_V_H = 0x78u,
+    REG_ADC_BAT_V_L,
+    REG_ADC_BAT_DISCHR_CURR_H,
+    REG_ADC_BAT_DISCHR_CURR_L,
+    REG_ADC_BAT_CHR_CURR_H,
+    REG_ADC_BAT_CHR_CURR_L,
+    REG_ADC_IPSOUT_V_H,
+    REG_ADC_IPSOUT_V_L,
+    REG_DC_DC_MOD_SEL = 0x80u,
+    REG_ADC_EN_1,
+    REG_ADC_EN_2,
+    REG_ADC_SR_CTRL,
+    REG_ADC_IN_RANGE,
+    REG_GPIO1_ADC_IRQ_RISING_TH,
+    REG_GPIO1_ADC_IRQ_FALLING_TH,
+    REG_TIMER_CTRL = 0x8au,
+    REG_VBUS_CTRL_MON_SRP,
+    REG_OVER_TEMP_SHUTDOWN = 0x8fu,
+    REG_GPIO0_FEAT_SET,
+    REG_GPIO_OUT_HIGH_SET,
+    REG_GPIO1_FEAT_SET,
+    REG_GPIO2_FEAT_SET,
+    REG_GPIO_SIG_STATE_SET_MON,
+    REG_GPIO3_SET,
+    REG_COULOMB_CNTR_CTRL = 0xb8u,
+    REG_POWER_MEAS_RES,
+    NR_REGS
+};
+
+#define AXP_209_CHIP_VERSION_ID             (0x01)
+#define AXP_209_DC_DC2_OUT_V_CTRL_RESET     (0x16)
+#define AXP_209_IRQ_BANK_1_CTRL_RESET       (0xd8)
+
+/* A simple I2C slave which returns values of ID or CNT register. */
+typedef struct AXP209I2CState {
+    /*< private >*/
+    I2CSlave i2c;
+    /*< public >*/
+    uint8_t regs[NR_REGS];  /* peripheral registers */
+    uint8_t ptr;            /* current register index */
+    uint8_t count;          /* counter used for tx/rx */
+} AXP209I2CState;
+
+/* Reset all counters and load ID register */
+static void axp_209_reset_enter(Object *obj, ResetType type)
+{
+    AXP209I2CState *s = AXP_209(obj);
+
+    memset(s->regs, 0, NR_REGS);
+    s->ptr = 0;
+    s->count = 0;
+    s->regs[REG_CHIP_VERSION] = AXP_209_CHIP_VERSION_ID;
+    s->regs[REG_DC_DC2_OUT_V_CTRL] = AXP_209_DC_DC2_OUT_V_CTRL_RESET;
+    s->regs[REG_IRQ_BANK_1_CTRL] = AXP_209_IRQ_BANK_1_CTRL_RESET;
+}
+
+/* Handle events from master. */
+static int axp_209_event(I2CSlave *i2c, enum i2c_event event)
+{
+    AXP209I2CState *s = AXP_209(i2c);
+
+    s->count = 0;
+
+    return 0;
+}
+
+/* Called when master requests read */
+static uint8_t axp_209_rx(I2CSlave *i2c)
+{
+    AXP209I2CState *s = AXP_209(i2c);
+    uint8_t ret = 0xff;
+
+    if (s->ptr < NR_REGS) {
+        ret = s->regs[s->ptr++];
+    }
+
+    DB_PRINT("Reading from %d : %d\n", s->ptr - 1, ret);
+
+    return ret;
+}
+
+/*
+ * Called when master sends write.
+ * Update ptr with byte 0, then perform write with second byte.
+ */
+static int axp_209_tx(I2CSlave *i2c, uint8_t data)
+{
+    AXP209I2CState *s = AXP_209(i2c);
+
+    if (s->count == 0) {
+        /* Store register address */
+        s->ptr = data;
+        s->count++;
+        DB_PRINT("Register to access %d\n", data);
+    } else {
+        DB_PRINT("Writing to register %d : %d\n", s->ptr, data);
+        if (s->ptr == REG_DC_DC2_OUT_V_CTRL) {
+            s->regs[s->ptr++] = data;
+        }
+    }
+
+    return 0;
+}
+
+/* Initialization */
+static void axp_209_init(Object *obj)
+{
+    AXP209I2CState *s = AXP_209(obj);
+
+    s->count = 0;
+    s->ptr = 0;
+    memset(s->regs, 0, NR_REGS);
+    s->regs[REG_CHIP_VERSION] = AXP_209_CHIP_VERSION_ID;
+    s->regs[REG_DC_DC2_OUT_V_CTRL] = 0x16;
+    s->regs[REG_IRQ_BANK_1_CTRL] = 0xd8;
+
+    DB_PRINT("INIT AXP209\n");
+
+    return;
+}
+
+static const VMStateDescription vmstate_axp_209 = {
+    .name = TYPE_AXP_209,
+    .version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(regs, AXP209I2CState, NR_REGS),
+        VMSTATE_UINT8(count, AXP209I2CState),
+        VMSTATE_UINT8(ptr, AXP209I2CState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void axp_209_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    I2CSlaveClass *isc = I2C_SLAVE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
+
+    rc->phases.enter = axp_209_reset_enter;
+    dc->vmsd = &vmstate_axp_209;
+    isc->event = axp_209_event;
+    isc->recv = axp_209_rx;
+    isc->send = axp_209_tx;
+}
+
+static const TypeInfo axp_209_info = {
+    .name = TYPE_AXP_209,
+    .parent = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(AXP209I2CState),
+    .instance_init = axp_209_init,
+    .class_init = axp_209_class_init
+};
+
+static void axp_209_register_devices(void)
+{
+    type_register_static(&axp_209_info);
+}
+
+type_init(axp_209_register_devices);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index d7f49f0f81..c85a0127fe 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -40,6 +40,7 @@ softmmu_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem.c'))
 
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_CCM', if_true: files('allwinner-a10-ccm.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_DRAMC', if_true: files('allwinner-a10-dramc.c'))
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_AXP_209', if_true: files('allwinner-axp-209.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-ccu.c'))
 specific_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-cpucfg.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-dramc.c'))
-- 
2.30.2


