Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC0728A09F
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 16:02:33 +0200 (CEST)
Received: from localhost ([::1]:33036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRFSC-0007KI-Oj
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 10:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1kRFN2-00012p-ES; Sat, 10 Oct 2020 09:57:12 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:43610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1kRFMz-0004JN-GP; Sat, 10 Oct 2020 09:57:12 -0400
Received: from sekoia-pc.home.lmichel.fr (sekoia-pc.home.lmichel.fr
 [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPS id 11E12C603D8;
 Sat, 10 Oct 2020 13:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1602338224;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLwlDIyHFc0C8pkaVLGy6Y49SxN2cz8QpoPh2p0BZHI=;
 b=Sa+9zNwq5AHs8KvvOTGjIMRQPpu6MQeea1U/F6pnI0DIFI8UOuswlAVtGRwZUFhUjgh950
 v7Rm184hj7156i0d9861FjJZhyzDCdT+PQO/zUCZGRKZOjvoW8jfQIYICzgq9muaLwVuzI
 BzyfE+qLwUDAnl6jwUbYycYDmTj48V+a2OCP0Lgb8w9qO0VVlVrlylgCSQQrkH9vESAf7G
 T61i0I+rOSU50gPlHdq3qRF0UslYwZ2wtThoxBbWwHaxOg7nDaUUFKcyVTXUYjvSTrQKvX
 nUyvtTCkXxyFekdUBiQqmmrbRHzJK42uEZ4X17nkpyrYfYnNZniDwM1fMIB9JA==
From: Luc Michel <luc@lmichel.fr>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/15] hw/misc/bcm2835_cprman: add a PLL skeleton
 implementation
Date: Sat, 10 Oct 2020 15:57:50 +0200
Message-Id: <20201010135759.437903-7-luc@lmichel.fr>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201010135759.437903-1-luc@lmichel.fr>
References: <20201010135759.437903-1-luc@lmichel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr;
 s=pharaoh; t=1602338224;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLwlDIyHFc0C8pkaVLGy6Y49SxN2cz8QpoPh2p0BZHI=;
 b=iiVFNJPshsfhotyQHl5Yt6KRsl5YdI2tPUDP5V99dnSGTV7gx9sOjYC+sC5hKLJXQEFVqD
 lPDEdaJ4V/kHu2sMnVQxKWPpE7J7AcOwR7aZ8Gf3d9Ekz03HuZjepKBJ4tqGT5EUvQyZ++
 8Ma4RYcEnC1fsjMcS482rLLFJlVKDdsLLJMIqpul888cnRpnu4airZjCb5smvZNxFxw67D
 dotN9cHtAE2NRLKh0JJQIevOAqJRMVLwtbWDPDY4A/NZs/wgFy3BSrsua3s7lfmxkTyZjf
 bYW+W8fQ2EexB79UBc9CP36DVsrWY59FbzgrUmXoLEnqlFbRL8uJFjpnwH4ilA==
ARC-Seal: i=1; s=pharaoh; d=lmichel.fr; t=1602338224; a=rsa-sha256; cv=none;
 b=gp2usRPS3GzReqkAnFhWy6ogHC64BxVoZRtY4QlfNRm7ADJIlkBHXNOqjdOxlKkIgry2okezlSN5Lv+9W+hnK/4nZ7tdhwpwC4oHonjC3IHOnTkmxh01+LMGAIlxqGuCtaP/0HVrW1LptFVufNiXzdAS/e89Nu/LTpvu8m6Y/flylpOEsbOx0d+72XBIN+avvjm18RbNTGJFmuTnQeOw+zvKLMBl/sOg8VuIfMRCBYMIlFDlFQZ0l/kPJHB1l+5eEHI4eirPRHEUU/7LajvwEetPQgrNBrBR0BsVMs94S3WTZoE4yb0o6HQgkMO6pzyxYsy0524CKs9p4QJ3k0QtTA==
ARC-Authentication-Results: i=1;
	pharaoh.lmichel.fr
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/10 07:32:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are 5 PLLs in the CPRMAN, namely PLL A, C, D, H and B. All of them
take the xosc clock as input and produce a new clock.

This commit adds a skeleton implementation for the PLLs as sub-devices
of the CPRMAN. The PLLs are instantiated and connected internally to the
main oscillator.

Each PLL has 6 registers : CM, A2W_CTRL, A2W_ANA[0,1,2,3], A2W_FRAC. A
write to any of them triggers a call to the (not yet implemented)
pll_update function.

If the main oscillator changes frequency, an update is also triggered.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Luc Michel <luc@lmichel.fr>
---
 include/hw/misc/bcm2835_cprman.h           |  29 +++++
 include/hw/misc/bcm2835_cprman_internals.h | 144 +++++++++++++++++++++
 hw/misc/bcm2835_cprman.c                   | 108 ++++++++++++++++
 3 files changed, 281 insertions(+)

diff --git a/include/hw/misc/bcm2835_cprman.h b/include/hw/misc/bcm2835_cprman.h
index 8ae2d4d17c..5c442e6ff9 100644
--- a/include/hw/misc/bcm2835_cprman.h
+++ b/include/hw/misc/bcm2835_cprman.h
@@ -19,17 +19,46 @@ typedef struct BCM2835CprmanState BCM2835CprmanState;
 DECLARE_INSTANCE_CHECKER(BCM2835CprmanState, CPRMAN,
                          TYPE_BCM2835_CPRMAN)
 
 #define CPRMAN_NUM_REGS (0x2000 / sizeof(uint32_t))
 
+typedef enum CprmanPll {
+    CPRMAN_PLLA = 0,
+    CPRMAN_PLLC,
+    CPRMAN_PLLD,
+    CPRMAN_PLLH,
+    CPRMAN_PLLB,
+
+    CPRMAN_NUM_PLL
+} CprmanPll;
+
+typedef struct CprmanPllState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+    CprmanPll id;
+
+    uint32_t *reg_cm;
+    uint32_t *reg_a2w_ctrl;
+    uint32_t *reg_a2w_ana; /* ANA[0] .. ANA[3] */
+    uint32_t prediv_mask; /* prediv bit in ana[1] */
+    uint32_t *reg_a2w_frac;
+
+    Clock *xosc_in;
+    Clock *out;
+} CprmanPllState;
+
 struct BCM2835CprmanState {
     /*< private >*/
     SysBusDevice parent_obj;
 
     /*< public >*/
     MemoryRegion iomem;
 
+    CprmanPllState plls[CPRMAN_NUM_PLL];
+
     uint32_t regs[CPRMAN_NUM_REGS];
     uint32_t xosc_freq;
 
     Clock *xosc;
 };
diff --git a/include/hw/misc/bcm2835_cprman_internals.h b/include/hw/misc/bcm2835_cprman_internals.h
index 8fcc6d1d09..340ad623bb 100644
--- a/include/hw/misc/bcm2835_cprman_internals.h
+++ b/include/hw/misc/bcm2835_cprman_internals.h
@@ -10,15 +10,159 @@
 #define HW_MISC_CPRMAN_INTERNALS_H
 
 #include "hw/registerfields.h"
 #include "hw/misc/bcm2835_cprman.h"
 
+#define TYPE_CPRMAN_PLL "bcm2835-cprman-pll"
+
+DECLARE_INSTANCE_CHECKER(CprmanPllState, CPRMAN_PLL,
+                         TYPE_CPRMAN_PLL)
+
 /* Register map */
 
+/* PLLs */
+REG32(CM_PLLA, 0x104)
+    FIELD(CM_PLLA, LOADDSI0, 0, 1)
+    FIELD(CM_PLLA, HOLDDSI0, 1, 1)
+    FIELD(CM_PLLA, LOADCCP2, 2, 1)
+    FIELD(CM_PLLA, HOLDCCP2, 3, 1)
+    FIELD(CM_PLLA, LOADCORE, 4, 1)
+    FIELD(CM_PLLA, HOLDCORE, 5, 1)
+    FIELD(CM_PLLA, LOADPER, 6, 1)
+    FIELD(CM_PLLA, HOLDPER, 7, 1)
+    FIELD(CM_PLLx, ANARST, 8, 1)
+REG32(CM_PLLC, 0x108)
+    FIELD(CM_PLLC, LOADCORE0, 0, 1)
+    FIELD(CM_PLLC, HOLDCORE0, 1, 1)
+    FIELD(CM_PLLC, LOADCORE1, 2, 1)
+    FIELD(CM_PLLC, HOLDCORE1, 3, 1)
+    FIELD(CM_PLLC, LOADCORE2, 4, 1)
+    FIELD(CM_PLLC, HOLDCORE2, 5, 1)
+    FIELD(CM_PLLC, LOADPER, 6, 1)
+    FIELD(CM_PLLC, HOLDPER, 7, 1)
+REG32(CM_PLLD, 0x10c)
+    FIELD(CM_PLLD, LOADDSI0, 0, 1)
+    FIELD(CM_PLLD, HOLDDSI0, 1, 1)
+    FIELD(CM_PLLD, LOADDSI1, 2, 1)
+    FIELD(CM_PLLD, HOLDDSI1, 3, 1)
+    FIELD(CM_PLLD, LOADCORE, 4, 1)
+    FIELD(CM_PLLD, HOLDCORE, 5, 1)
+    FIELD(CM_PLLD, LOADPER, 6, 1)
+    FIELD(CM_PLLD, HOLDPER, 7, 1)
+REG32(CM_PLLH, 0x110)
+    FIELD(CM_PLLH, LOADPIX, 0, 1)
+    FIELD(CM_PLLH, LOADAUX, 1, 1)
+    FIELD(CM_PLLH, LOADRCAL, 2, 1)
+REG32(CM_PLLB, 0x170)
+    FIELD(CM_PLLB, LOADARM, 0, 1)
+    FIELD(CM_PLLB, HOLDARM, 1, 1)
+
+REG32(A2W_PLLA_CTRL, 0x1100)
+    FIELD(A2W_PLLx_CTRL, NDIV, 0, 10)
+    FIELD(A2W_PLLx_CTRL, PDIV, 12, 3)
+    FIELD(A2W_PLLx_CTRL, PWRDN, 16, 1)
+    FIELD(A2W_PLLx_CTRL, PRST_DISABLE, 17, 1)
+REG32(A2W_PLLC_CTRL, 0x1120)
+REG32(A2W_PLLD_CTRL, 0x1140)
+REG32(A2W_PLLH_CTRL, 0x1160)
+REG32(A2W_PLLB_CTRL, 0x11e0)
+
+REG32(A2W_PLLA_ANA0, 0x1010)
+REG32(A2W_PLLA_ANA1, 0x1014)
+    FIELD(A2W_PLLx_ANA1, FB_PREDIV, 14, 1)
+REG32(A2W_PLLA_ANA2, 0x1018)
+REG32(A2W_PLLA_ANA3, 0x101c)
+
+REG32(A2W_PLLC_ANA0, 0x1030)
+REG32(A2W_PLLC_ANA1, 0x1034)
+REG32(A2W_PLLC_ANA2, 0x1038)
+REG32(A2W_PLLC_ANA3, 0x103c)
+
+REG32(A2W_PLLD_ANA0, 0x1050)
+REG32(A2W_PLLD_ANA1, 0x1054)
+REG32(A2W_PLLD_ANA2, 0x1058)
+REG32(A2W_PLLD_ANA3, 0x105c)
+
+REG32(A2W_PLLH_ANA0, 0x1070)
+REG32(A2W_PLLH_ANA1, 0x1074)
+    FIELD(A2W_PLLH_ANA1, FB_PREDIV, 11, 1)
+REG32(A2W_PLLH_ANA2, 0x1078)
+REG32(A2W_PLLH_ANA3, 0x107c)
+
+REG32(A2W_PLLB_ANA0, 0x10f0)
+REG32(A2W_PLLB_ANA1, 0x10f4)
+REG32(A2W_PLLB_ANA2, 0x10f8)
+REG32(A2W_PLLB_ANA3, 0x10fc)
+
+REG32(A2W_PLLA_FRAC, 0x1200)
+    FIELD(A2W_PLLx_FRAC, FRAC, 0, 20)
+REG32(A2W_PLLC_FRAC, 0x1220)
+REG32(A2W_PLLD_FRAC, 0x1240)
+REG32(A2W_PLLH_FRAC, 0x1260)
+REG32(A2W_PLLB_FRAC, 0x12e0)
+
 /*
  * This field is common to all registers. Each register write value must match
  * the CPRMAN_PASSWORD magic value in its 8 MSB.
  */
 FIELD(CPRMAN, PASSWORD, 24, 8)
 #define CPRMAN_PASSWORD 0x5a
 
+/* PLL init info */
+typedef struct PLLInitInfo {
+    const char *name;
+    size_t cm_offset;
+    size_t a2w_ctrl_offset;
+    size_t a2w_ana_offset;
+    uint32_t prediv_mask; /* Prediv bit in ana[1] */
+    size_t a2w_frac_offset;
+} PLLInitInfo;
+
+#define FILL_PLL_INIT_INFO(pll_)                \
+    .cm_offset = R_CM_ ## pll_,                 \
+    .a2w_ctrl_offset = R_A2W_ ## pll_ ## _CTRL, \
+    .a2w_ana_offset = R_A2W_ ## pll_ ## _ANA0,  \
+    .a2w_frac_offset = R_A2W_ ## pll_ ## _FRAC
+
+static const PLLInitInfo PLL_INIT_INFO[] = {
+    [CPRMAN_PLLA] = {
+        .name = "plla",
+        .prediv_mask = R_A2W_PLLx_ANA1_FB_PREDIV_MASK,
+        FILL_PLL_INIT_INFO(PLLA),
+    },
+    [CPRMAN_PLLC] = {
+        .name = "pllc",
+        .prediv_mask = R_A2W_PLLx_ANA1_FB_PREDIV_MASK,
+        FILL_PLL_INIT_INFO(PLLC),
+    },
+    [CPRMAN_PLLD] = {
+        .name = "plld",
+        .prediv_mask = R_A2W_PLLx_ANA1_FB_PREDIV_MASK,
+        FILL_PLL_INIT_INFO(PLLD),
+    },
+    [CPRMAN_PLLH] = {
+        .name = "pllh",
+        .prediv_mask = R_A2W_PLLH_ANA1_FB_PREDIV_MASK,
+        FILL_PLL_INIT_INFO(PLLH),
+    },
+    [CPRMAN_PLLB] = {
+        .name = "pllb",
+        .prediv_mask = R_A2W_PLLx_ANA1_FB_PREDIV_MASK,
+        FILL_PLL_INIT_INFO(PLLB),
+    },
+};
+
+#undef FILL_PLL_CHANNEL_INIT_INFO
+
+static inline void set_pll_init_info(BCM2835CprmanState *s,
+                                     CprmanPllState *pll,
+                                     CprmanPll id)
+{
+    pll->id = id;
+    pll->reg_cm = &s->regs[PLL_INIT_INFO[id].cm_offset];
+    pll->reg_a2w_ctrl = &s->regs[PLL_INIT_INFO[id].a2w_ctrl_offset];
+    pll->reg_a2w_ana = &s->regs[PLL_INIT_INFO[id].a2w_ana_offset];
+    pll->prediv_mask = PLL_INIT_INFO[id].prediv_mask;
+    pll->reg_a2w_frac = &s->regs[PLL_INIT_INFO[id].a2w_frac_offset];
+}
+
 #endif
diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
index 57ab9910b5..b86f5901b8 100644
--- a/hw/misc/bcm2835_cprman.c
+++ b/hw/misc/bcm2835_cprman.c
@@ -46,10 +46,56 @@
 #include "hw/qdev-properties.h"
 #include "hw/misc/bcm2835_cprman.h"
 #include "hw/misc/bcm2835_cprman_internals.h"
 #include "trace.h"
 
+/* PLL */
+
+static void pll_update(CprmanPllState *pll)
+{
+    clock_update(pll->out, 0);
+}
+
+static void pll_xosc_update(void *opaque)
+{
+    pll_update(CPRMAN_PLL(opaque));
+}
+
+static void pll_init(Object *obj)
+{
+    CprmanPllState *s = CPRMAN_PLL(obj);
+
+    s->xosc_in = qdev_init_clock_in(DEVICE(s), "xosc-in", pll_xosc_update, s);
+    s->out = qdev_init_clock_out(DEVICE(s), "out");
+}
+
+static const VMStateDescription pll_vmstate = {
+    .name = TYPE_CPRMAN_PLL,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_CLOCK(xosc_in, CprmanPllState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void pll_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &pll_vmstate;
+}
+
+static const TypeInfo cprman_pll_info = {
+    .name = TYPE_CPRMAN_PLL,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(CprmanPllState),
+    .class_init = pll_class_init,
+    .instance_init = pll_init,
+};
+
+
 /* CPRMAN "top level" model */
 
 static uint64_t cprman_read(void *opaque, hwaddr offset,
                             unsigned size)
 {
@@ -64,10 +110,19 @@ static uint64_t cprman_read(void *opaque, hwaddr offset,
 
     trace_bcm2835_cprman_read(offset, r);
     return r;
 }
 
+#define CASE_PLL_REGS(pll_)       \
+    case R_CM_ ## pll_:           \
+    case R_A2W_ ## pll_ ## _CTRL: \
+    case R_A2W_ ## pll_ ## _ANA0: \
+    case R_A2W_ ## pll_ ## _ANA1: \
+    case R_A2W_ ## pll_ ## _ANA2: \
+    case R_A2W_ ## pll_ ## _ANA3: \
+    case R_A2W_ ## pll_ ## _FRAC
+
 static void cprman_write(void *opaque, hwaddr offset,
                          uint64_t value, unsigned size)
 {
     BCM2835CprmanState *s = CPRMAN(opaque);
     size_t idx = offset / sizeof(uint32_t);
@@ -80,12 +135,35 @@ static void cprman_write(void *opaque, hwaddr offset,
     value &= ~R_CPRMAN_PASSWORD_MASK;
 
     trace_bcm2835_cprman_write(offset, value);
     s->regs[idx] = value;
 
+    switch (idx) {
+    CASE_PLL_REGS(PLLA) :
+        pll_update(&s->plls[CPRMAN_PLLA]);
+        break;
+
+    CASE_PLL_REGS(PLLC) :
+        pll_update(&s->plls[CPRMAN_PLLC]);
+        break;
+
+    CASE_PLL_REGS(PLLD) :
+        pll_update(&s->plls[CPRMAN_PLLD]);
+        break;
+
+    CASE_PLL_REGS(PLLH) :
+        pll_update(&s->plls[CPRMAN_PLLH]);
+        break;
+
+    CASE_PLL_REGS(PLLB) :
+        pll_update(&s->plls[CPRMAN_PLLB]);
+        break;
+    }
 }
 
+#undef CASE_PLL_REGS
+
 static const MemoryRegionOps cprman_ops = {
     .read = cprman_read,
     .write = cprman_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
@@ -104,27 +182,55 @@ static const MemoryRegionOps cprman_ops = {
 };
 
 static void cprman_reset(DeviceState *dev)
 {
     BCM2835CprmanState *s = CPRMAN(dev);
+    size_t i;
 
     memset(s->regs, 0, sizeof(s->regs));
 
+    for (i = 0; i < CPRMAN_NUM_PLL; i++) {
+        device_cold_reset(DEVICE(&s->plls[i]));
+    }
+
     clock_update_hz(s->xosc, s->xosc_freq);
 }
 
 static void cprman_init(Object *obj)
 {
     BCM2835CprmanState *s = CPRMAN(obj);
+    size_t i;
+
+    for (i = 0; i < CPRMAN_NUM_PLL; i++) {
+        object_initialize_child(obj, PLL_INIT_INFO[i].name,
+                                &s->plls[i], TYPE_CPRMAN_PLL);
+        set_pll_init_info(s, &s->plls[i], i);
+    }
 
     s->xosc = clock_new(obj, "xosc");
 
     memory_region_init_io(&s->iomem, obj, &cprman_ops,
                           s, "bcm2835-cprman", 0x2000);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
 }
 
+static void cprman_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835CprmanState *s = CPRMAN(dev);
+    size_t i;
+
+    for (i = 0; i < CPRMAN_NUM_PLL; i++) {
+        CprmanPllState *pll = &s->plls[i];
+
+        clock_set_source(pll->xosc_in, s->xosc);
+
+        if (!qdev_realize(DEVICE(pll), NULL, errp)) {
+            return;
+        }
+    }
+}
+
 static const VMStateDescription cprman_vmstate = {
     .name = TYPE_BCM2835_CPRMAN,
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
@@ -140,10 +246,11 @@ static Property cprman_properties[] = {
 
 static void cprman_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->realize = cprman_realize;
     dc->reset = cprman_reset;
     dc->vmsd = &cprman_vmstate;
     device_class_set_props(dc, cprman_properties);
 }
 
@@ -156,8 +263,9 @@ static const TypeInfo cprman_info = {
 };
 
 static void cprman_register_types(void)
 {
     type_register_static(&cprman_info);
+    type_register_static(&cprman_pll_info);
 }
 
 type_init(cprman_register_types);
-- 
2.28.0


