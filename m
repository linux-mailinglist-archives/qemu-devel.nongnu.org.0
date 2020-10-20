Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F0528408E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 22:24:18 +0200 (CEST)
Received: from localhost ([::1]:47692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPX1t-00004w-FY
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 16:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1kPWZx-00049z-B5; Mon, 05 Oct 2020 15:55:25 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:35938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1kPWZu-0007Wq-Fh; Mon, 05 Oct 2020 15:55:24 -0400
Received: from sekoia-pc.home.lmichel.fr (sekoia-pc.home.lmichel.fr
 [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPS id A3659C60F20;
 Mon,  5 Oct 2020 19:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1601927715;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9qLCcBY4noWNDZEFR7O5gq5n2c/yZEP8cmmEnoo4i4=;
 b=GDEA92JFl1OYiixtOhsxqFbf0uocaBz1I0xtrenF3KWyamTGwSSIQG1nDx59CVPktbqj3x
 CPVUunT96Xgy9PcZfu6gkd1CVplcnSYggdpRHHjLxTPmiBxv4fqGfD65D6+Znd4fHcj18e
 NYxjhPCsPam81GxDfvA4XCEIa7zBYhX4UKjrslTCVRmaa7i2sbRx69X6hhEiFwTMt49Gmp
 jcd9MZiSMYPvu/vurXoghzip+TnE0Su4YpNZmlzkfXo+bNYjwB3BR0BWqiyO2q7VB21t40
 FQ9JNFtx4+bxdA7FTpy1ExCznN6ZMumkGVBpjYYe1t423WnkWhH3Qentr+JvYQ==
From: Luc Michel <luc@lmichel.fr>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/15] hw/misc/bcm2835_cprman: add a PLL channel skeleton
 implementation
Date: Mon,  5 Oct 2020 21:56:05 +0200
Message-Id: <20201005195612.1999165-9-luc@lmichel.fr>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005195612.1999165-1-luc@lmichel.fr>
References: <20201005195612.1999165-1-luc@lmichel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr;
 s=pharaoh; t=1601927715;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9qLCcBY4noWNDZEFR7O5gq5n2c/yZEP8cmmEnoo4i4=;
 b=WDZNBTZC02X0WRReQG/1oFxCUZzZ88fQNtzw8/xsZTEosp5pBmevDrPnoPMry9UgSf4HLv
 D5WYyuBXV8Xn3A+13z0sPsg3nFZzp5v2EeOWaqnR8eAsT7clggdLtCOuw+1XaBcJOvQ+GP
 qJW47VjBSjhVN5g0dO2LMuD5JF8HzYrEF4MYMbQ+4JLxkG9AjbS/iwcgbjlb7zQnQZshav
 qVTA9lqc0ABNyyipns5mGqAkuvTtRMoqRBN4dJ2vrxouihOn/VEwTIwF8kySZRlvnDheXx
 2/k7fyn3xJp45TY7udOICwp/otH+w7wjE2I5holKZN6oVvlT8gBBMotzbyL9Gg==
ARC-Seal: i=1; s=pharaoh; d=lmichel.fr; t=1601927715; a=rsa-sha256; cv=none;
 b=ZNih1ZN0BhjtBVRw443jwLy3sFJ/c9auH5UywkbihOiKqz9+3NUkTObUyeT/tnD9T9NiOpGMH0Fwj3XGSfNJKjfNdnefjGFYh82OVKCWzxWprdThqlo7wCI8KuW1A2Bes42jR4xrxZycngSdcIxWWaO7z2KV1NACeOBgLpzI5ergoRDlelETr6XtdzuR8OogLxA59wke+FXEZu/FyunyNygODrCOIA0JWTFTrjcbuHZWifRJC01B6PUy54FsHw44SgkfonoWg4ix0YIuOCG6z2Oh3S881JgUzgayR0nZ9m15lGJV0cRb3zOQ4hO5mnwDA/krRATtVEskwXri8L7baQ==
ARC-Authentication-Results: i=1;
	pharaoh.lmichel.fr
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 15:49:50
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

PLLs are composed of multiple channels. Each channel outputs one clock
signal. They are modeled as one device taking the PLL generated clock as
input, and outputting a new clock.

A channel shares the CM register with its parent PLL, and has its own
A2W_CTRL register. A write to the CM register will trigger an update of
the PLL and all its channels, while a write to an A2W_CTRL channel
register will update the required channel only.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Luc Michel <luc@lmichel.fr>
---
 include/hw/misc/bcm2835_cprman.h           |  44 ++++++
 include/hw/misc/bcm2835_cprman_internals.h | 146 +++++++++++++++++++
 hw/misc/bcm2835_cprman.c                   | 155 +++++++++++++++++++--
 3 files changed, 337 insertions(+), 8 deletions(-)

diff --git a/include/hw/misc/bcm2835_cprman.h b/include/hw/misc/bcm2835_cprman.h
index ddbb3e0237..8d3e39f0a8 100644
--- a/include/hw/misc/bcm2835_cprman.h
+++ b/include/hw/misc/bcm2835_cprman.h
@@ -29,10 +29,35 @@ typedef enum CprmanPll {
     CPRMAN_PLLB,
 
     CPRMAN_NUM_PLL
 } CprmanPll;
 
+typedef enum CprmanPllChannel {
+    CPRMAN_PLLA_CHANNEL_DSI0 = 0,
+    CPRMAN_PLLA_CHANNEL_CORE,
+    CPRMAN_PLLA_CHANNEL_PER,
+    CPRMAN_PLLA_CHANNEL_CCP2,
+
+    CPRMAN_PLLC_CHANNEL_CORE2,
+    CPRMAN_PLLC_CHANNEL_CORE1,
+    CPRMAN_PLLC_CHANNEL_PER,
+    CPRMAN_PLLC_CHANNEL_CORE0,
+
+    CPRMAN_PLLD_CHANNEL_DSI0,
+    CPRMAN_PLLD_CHANNEL_CORE,
+    CPRMAN_PLLD_CHANNEL_PER,
+    CPRMAN_PLLD_CHANNEL_DSI1,
+
+    CPRMAN_PLLH_CHANNEL_AUX,
+    CPRMAN_PLLH_CHANNEL_RCAL,
+    CPRMAN_PLLH_CHANNEL_PIX,
+
+    CPRMAN_PLLB_CHANNEL_ARM,
+
+    CPRMAN_NUM_PLL_CHANNEL,
+} CprmanPllChannel;
+
 typedef struct CprmanPllState {
     /*< private >*/
     DeviceState parent_obj;
 
     /*< public >*/
@@ -46,18 +71,37 @@ typedef struct CprmanPllState {
 
     Clock *xosc_in;
     Clock *out;
 } CprmanPllState;
 
+typedef struct CprmanPllChannelState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+    CprmanPllChannel id;
+    CprmanPll parent;
+
+    uint32_t *reg_cm;
+    uint32_t hold_mask;
+    uint32_t load_mask;
+    uint32_t *reg_a2w_ctrl;
+    int fixed_divider;
+
+    Clock *pll_in;
+    Clock *out;
+} CprmanPllChannelState;
+
 struct BCM2835CprmanState {
     /*< private >*/
     SysBusDevice parent_obj;
 
     /*< public >*/
     MemoryRegion iomem;
 
     CprmanPllState plls[CPRMAN_NUM_PLL];
+    CprmanPllChannelState channels[CPRMAN_NUM_PLL_CHANNEL];
 
     uint32_t regs[CPRMAN_NUM_REGS];
     uint32_t xosc_freq;
 
     Clock *xosc;
diff --git a/include/hw/misc/bcm2835_cprman_internals.h b/include/hw/misc/bcm2835_cprman_internals.h
index 7aa46c6e18..7409ddb024 100644
--- a/include/hw/misc/bcm2835_cprman_internals.h
+++ b/include/hw/misc/bcm2835_cprman_internals.h
@@ -11,13 +11,16 @@
 
 #include "hw/registerfields.h"
 #include "hw/misc/bcm2835_cprman.h"
 
 #define TYPE_CPRMAN_PLL "bcm2835-cprman-pll"
+#define TYPE_CPRMAN_PLL_CHANNEL "bcm2835-cprman-pll-channel"
 
 DECLARE_INSTANCE_CHECKER(CprmanPllState, CPRMAN_PLL,
                          TYPE_CPRMAN_PLL)
+DECLARE_INSTANCE_CHECKER(CprmanPllChannelState, CPRMAN_PLL_CHANNEL,
+                         TYPE_CPRMAN_PLL_CHANNEL)
 
 /* Register map */
 
 /* PLLs */
 REG32(CM_PLLA, 0x104)
@@ -98,10 +101,35 @@ REG32(A2W_PLLA_FRAC, 0x1200)
 REG32(A2W_PLLC_FRAC, 0x1220)
 REG32(A2W_PLLD_FRAC, 0x1240)
 REG32(A2W_PLLH_FRAC, 0x1260)
 REG32(A2W_PLLB_FRAC, 0x12e0)
 
+/* PLL channels */
+REG32(A2W_PLLA_DSI0, 0x1300)
+    FIELD(A2W_PLLx_CHANNELy, DIV, 0, 8)
+    FIELD(A2W_PLLx_CHANNELy, DISABLE, 8, 1)
+REG32(A2W_PLLA_CORE, 0x1400)
+REG32(A2W_PLLA_PER, 0x1500)
+REG32(A2W_PLLA_CCP2, 0x1600)
+
+REG32(A2W_PLLC_CORE2, 0x1320)
+REG32(A2W_PLLC_CORE1, 0x1420)
+REG32(A2W_PLLC_PER, 0x1520)
+REG32(A2W_PLLC_CORE0, 0x1620)
+
+REG32(A2W_PLLD_DSI0, 0x1340)
+REG32(A2W_PLLD_CORE, 0x1440)
+REG32(A2W_PLLD_PER, 0x1540)
+REG32(A2W_PLLD_DSI1, 0x1640)
+
+REG32(A2W_PLLH_AUX, 0x1360)
+REG32(A2W_PLLH_RCAL, 0x1460)
+REG32(A2W_PLLH_PIX, 0x1560)
+REG32(A2W_PLLH_STS, 0x1660)
+
+REG32(A2W_PLLB_ARM, 0x13e0)
+
 /* misc registers */
 REG32(CM_LOCK, 0x114)
     FIELD(CM_LOCK, FLOCKH, 12, 1)
     FIELD(CM_LOCK, FLOCKD, 11, 1)
     FIELD(CM_LOCK, FLOCKC, 10, 1)
@@ -171,6 +199,124 @@ static inline void set_pll_init_info(BCM2835CprmanState *s,
     pll->reg_a2w_ana = &s->regs[PLL_INIT_INFO[id].a2w_ana_offset];
     pll->prediv_mask = PLL_INIT_INFO[id].prediv_mask;
     pll->reg_a2w_frac = &s->regs[PLL_INIT_INFO[id].a2w_frac_offset];
 }
 
+
+/* PLL channel init info */
+typedef struct PLLChannelInitInfo {
+    const char *name;
+    CprmanPll parent;
+    size_t cm_offset;
+    uint32_t cm_hold_mask;
+    uint32_t cm_load_mask;
+    size_t a2w_ctrl_offset;
+    unsigned int fixed_divider;
+} PLLChannelInitInfo;
+
+#define FILL_PLL_CHANNEL_INIT_INFO_common(pll_, channel_)            \
+    .parent = CPRMAN_ ## pll_,                                       \
+    .cm_offset = R_CM_ ## pll_,                                      \
+    .cm_load_mask = R_CM_ ## pll_ ## _ ## LOAD ## channel_ ## _MASK, \
+    .a2w_ctrl_offset = R_A2W_ ## pll_ ## _ ## channel_
+
+#define FILL_PLL_CHANNEL_INIT_INFO(pll_, channel_)                   \
+    FILL_PLL_CHANNEL_INIT_INFO_common(pll_, channel_),               \
+    .cm_hold_mask = R_CM_ ## pll_ ## _ ## HOLD ## channel_ ## _MASK, \
+    .fixed_divider = 1
+
+#define FILL_PLL_CHANNEL_INIT_INFO_nohold(pll_, channel_) \
+    FILL_PLL_CHANNEL_INIT_INFO_common(pll_, channel_),    \
+    .cm_hold_mask = 0
+
+static PLLChannelInitInfo PLL_CHANNEL_INIT_INFO[] = {
+    [CPRMAN_PLLA_CHANNEL_DSI0] = {
+        .name = "plla-dsi0",
+        FILL_PLL_CHANNEL_INIT_INFO(PLLA, DSI0),
+    },
+    [CPRMAN_PLLA_CHANNEL_CORE] = {
+        .name = "plla-core",
+        FILL_PLL_CHANNEL_INIT_INFO(PLLA, CORE),
+    },
+    [CPRMAN_PLLA_CHANNEL_PER] = {
+        .name = "plla-per",
+        FILL_PLL_CHANNEL_INIT_INFO(PLLA, PER),
+    },
+    [CPRMAN_PLLA_CHANNEL_CCP2] = {
+        .name = "plla-ccp2",
+        FILL_PLL_CHANNEL_INIT_INFO(PLLA, CCP2),
+    },
+
+    [CPRMAN_PLLC_CHANNEL_CORE2] = {
+        .name = "pllc-core2",
+        FILL_PLL_CHANNEL_INIT_INFO(PLLC, CORE2),
+    },
+    [CPRMAN_PLLC_CHANNEL_CORE1] = {
+        .name = "pllc-core1",
+        FILL_PLL_CHANNEL_INIT_INFO(PLLC, CORE1),
+    },
+    [CPRMAN_PLLC_CHANNEL_PER] = {
+        .name = "pllc-per",
+        FILL_PLL_CHANNEL_INIT_INFO(PLLC, PER),
+    },
+    [CPRMAN_PLLC_CHANNEL_CORE0] = {
+        .name = "pllc-core0",
+        FILL_PLL_CHANNEL_INIT_INFO(PLLC, CORE0),
+    },
+
+    [CPRMAN_PLLD_CHANNEL_DSI0] = {
+        .name = "plld-dsi0",
+        FILL_PLL_CHANNEL_INIT_INFO(PLLD, DSI0),
+    },
+    [CPRMAN_PLLD_CHANNEL_CORE] = {
+        .name = "plld-core",
+        FILL_PLL_CHANNEL_INIT_INFO(PLLD, CORE),
+    },
+    [CPRMAN_PLLD_CHANNEL_PER] = {
+        .name = "plld-per",
+        FILL_PLL_CHANNEL_INIT_INFO(PLLD, PER),
+    },
+    [CPRMAN_PLLD_CHANNEL_DSI1] = {
+        .name = "plld-dsi1",
+        FILL_PLL_CHANNEL_INIT_INFO(PLLD, DSI1),
+    },
+
+    [CPRMAN_PLLH_CHANNEL_AUX] = {
+        .name = "pllh-aux",
+        .fixed_divider = 1,
+        FILL_PLL_CHANNEL_INIT_INFO_nohold(PLLH, AUX),
+    },
+    [CPRMAN_PLLH_CHANNEL_RCAL] = {
+        .name = "pllh-rcal",
+        .fixed_divider = 10,
+        FILL_PLL_CHANNEL_INIT_INFO_nohold(PLLH, RCAL),
+    },
+    [CPRMAN_PLLH_CHANNEL_PIX] = {
+        .name = "pllh-pix",
+        .fixed_divider = 10,
+        FILL_PLL_CHANNEL_INIT_INFO_nohold(PLLH, PIX),
+    },
+
+    [CPRMAN_PLLB_CHANNEL_ARM] = {
+        .name = "pllb-arm",
+        FILL_PLL_CHANNEL_INIT_INFO(PLLB, ARM),
+    },
+};
+
+#undef FILL_PLL_CHANNEL_INIT_INFO_nohold
+#undef FILL_PLL_CHANNEL_INIT_INFO
+#undef FILL_PLL_CHANNEL_INIT_INFO_common
+
+static inline void set_pll_channel_init_info(BCM2835CprmanState *s,
+                                             CprmanPllChannelState *channel,
+                                             CprmanPllChannel id)
+{
+    channel->id = id;
+    channel->parent = PLL_CHANNEL_INIT_INFO[id].parent;
+    channel->reg_cm = &s->regs[PLL_CHANNEL_INIT_INFO[id].cm_offset];
+    channel->hold_mask = PLL_CHANNEL_INIT_INFO[id].cm_hold_mask;
+    channel->load_mask = PLL_CHANNEL_INIT_INFO[id].cm_load_mask;
+    channel->reg_a2w_ctrl = &s->regs[PLL_CHANNEL_INIT_INFO[id].a2w_ctrl_offset];
+    channel->fixed_divider = PLL_CHANNEL_INIT_INFO[id].fixed_divider;
+}
+
 #endif
diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
index 144bcc289d..12fa78181b 100644
--- a/hw/misc/bcm2835_cprman.c
+++ b/hw/misc/bcm2835_cprman.c
@@ -130,10 +130,73 @@ static const TypeInfo cprman_pll_info = {
     .class_init = pll_class_init,
     .instance_init = pll_init,
 };
 
 
+/* PLL channel */
+
+static void pll_channel_update(CprmanPllChannelState *channel)
+{
+    clock_update(channel->out, 0);
+}
+
+/* Update a PLL and all its channels */
+static void pll_update_all_channels(BCM2835CprmanState *s,
+                                    CprmanPllState *pll)
+{
+    size_t i;
+
+    pll_update(pll);
+
+    for (i = 0; i < CPRMAN_NUM_PLL_CHANNEL; i++) {
+        CprmanPllChannelState *channel = &s->channels[i];
+        if (channel->parent == pll->id) {
+            pll_channel_update(channel);
+        }
+    }
+}
+
+static void pll_channel_pll_in_update(void *opaque)
+{
+    pll_channel_update(CPRMAN_PLL_CHANNEL(opaque));
+}
+
+static void pll_channel_init(Object *obj)
+{
+    CprmanPllChannelState *s = CPRMAN_PLL_CHANNEL(obj);
+
+    s->pll_in = qdev_init_clock_in(DEVICE(s), "pll-in",
+                                   pll_channel_pll_in_update, s);
+    s->out = qdev_init_clock_out(DEVICE(s), "out");
+}
+
+static const VMStateDescription pll_channel_vmstate = {
+    .name = TYPE_CPRMAN_PLL_CHANNEL,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_CLOCK(pll_in, CprmanPllChannelState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void pll_channel_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &pll_channel_vmstate;
+}
+
+static const TypeInfo cprman_pll_channel_info = {
+    .name = TYPE_CPRMAN_PLL_CHANNEL,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(CprmanPllChannelState),
+    .class_init = pll_channel_class_init,
+    .instance_init = pll_channel_init,
+};
+
+
 /* CPRMAN "top level" model */
 
 static uint32_t get_cm_lock(const BCM2835CprmanState *s)
 {
     static const int CM_LOCK_MAPPING[CPRMAN_NUM_PLL] = {
@@ -172,12 +235,36 @@ static uint64_t cprman_read(void *opaque, hwaddr offset,
 
     trace_bcm2835_cprman_read(offset, r);
     return r;
 }
 
-#define CASE_PLL_REGS(pll_)       \
-    case R_CM_ ## pll_:           \
+static inline void update_pll_and_channels_from_cm(BCM2835CprmanState *s,
+                                                   size_t idx)
+{
+    size_t i;
+
+    for (i = 0; i < CPRMAN_NUM_PLL; i++) {
+        if (PLL_INIT_INFO[i].cm_offset == idx) {
+            pll_update_all_channels(s, &s->plls[i]);
+            return;
+        }
+    }
+}
+
+static inline void update_channel_from_a2w(BCM2835CprmanState *s, size_t idx)
+{
+    size_t i;
+
+    for (i = 0; i < CPRMAN_NUM_PLL_CHANNEL; i++) {
+        if (PLL_CHANNEL_INIT_INFO[i].a2w_ctrl_offset == idx) {
+            pll_channel_update(&s->channels[i]);
+            return;
+        }
+    }
+}
+
+#define CASE_PLL_A2W_REGS(pll_) \
     case R_A2W_ ## pll_ ## _CTRL: \
     case R_A2W_ ## pll_ ## _ANA0: \
     case R_A2W_ ## pll_ ## _ANA1: \
     case R_A2W_ ## pll_ ## _ANA2: \
     case R_A2W_ ## pll_ ## _ANA3: \
@@ -198,33 +285,61 @@ static void cprman_write(void *opaque, hwaddr offset,
 
     trace_bcm2835_cprman_write(offset, value);
     s->regs[idx] = value;
 
     switch (idx) {
-    CASE_PLL_REGS(PLLA) :
+    case R_CM_PLLA ... R_CM_PLLH:
+    case R_CM_PLLB:
+        /*
+         * A given CM_PLLx register is shared by both the PLL and the channels
+         * of this PLL.
+         */
+        update_pll_and_channels_from_cm(s, idx);
+        break;
+
+    CASE_PLL_A2W_REGS(PLLA) :
         pll_update(&s->plls[CPRMAN_PLLA]);
         break;
 
-    CASE_PLL_REGS(PLLC) :
+    CASE_PLL_A2W_REGS(PLLC) :
         pll_update(&s->plls[CPRMAN_PLLC]);
         break;
 
-    CASE_PLL_REGS(PLLD) :
+    CASE_PLL_A2W_REGS(PLLD) :
         pll_update(&s->plls[CPRMAN_PLLD]);
         break;
 
-    CASE_PLL_REGS(PLLH) :
+    CASE_PLL_A2W_REGS(PLLH) :
         pll_update(&s->plls[CPRMAN_PLLH]);
         break;
 
-    CASE_PLL_REGS(PLLB) :
+    CASE_PLL_A2W_REGS(PLLB) :
         pll_update(&s->plls[CPRMAN_PLLB]);
         break;
+
+    case R_A2W_PLLA_DSI0:
+    case R_A2W_PLLA_CORE:
+    case R_A2W_PLLA_PER:
+    case R_A2W_PLLA_CCP2:
+    case R_A2W_PLLC_CORE2:
+    case R_A2W_PLLC_CORE1:
+    case R_A2W_PLLC_PER:
+    case R_A2W_PLLC_CORE0:
+    case R_A2W_PLLD_DSI0:
+    case R_A2W_PLLD_CORE:
+    case R_A2W_PLLD_PER:
+    case R_A2W_PLLD_DSI1:
+    case R_A2W_PLLH_AUX:
+    case R_A2W_PLLH_RCAL:
+    case R_A2W_PLLH_PIX:
+    case R_A2W_PLLB_ARM:
+        update_channel_from_a2w(s, idx);
+        break;
     }
 }
 
-#undef CASE_PLL_REGS
+#undef CASE_PLL_A2W_REGS
 
 static const MemoryRegionOps cprman_ops = {
     .read = cprman_read,
     .write = cprman_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
@@ -252,10 +367,14 @@ static void cprman_reset(DeviceState *dev)
 
     for (i = 0; i < CPRMAN_NUM_PLL; i++) {
         device_cold_reset(DEVICE(&s->plls[i]));
     }
 
+    for (i = 0; i < CPRMAN_NUM_PLL_CHANNEL; i++) {
+        device_cold_reset(DEVICE(&s->channels[i]));
+    }
+
     clock_update_hz(s->xosc, s->xosc_freq);
 }
 
 static void cprman_init(Object *obj)
 {
@@ -266,10 +385,17 @@ static void cprman_init(Object *obj)
         object_initialize_child(obj, PLL_INIT_INFO[i].name,
                                 &s->plls[i], TYPE_CPRMAN_PLL);
         set_pll_init_info(s, &s->plls[i], i);
     }
 
+    for (i = 0; i < CPRMAN_NUM_PLL_CHANNEL; i++) {
+        object_initialize_child(obj, PLL_CHANNEL_INIT_INFO[i].name,
+                                &s->channels[i],
+                                TYPE_CPRMAN_PLL_CHANNEL);
+        set_pll_channel_init_info(s, &s->channels[i], i);
+    }
+
     s->xosc = clock_new(obj, "xosc");
 
     memory_region_init_io(&s->iomem, obj, &cprman_ops,
                           s, "bcm2835-cprman", 0x2000);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
@@ -287,10 +413,22 @@ static void cprman_realize(DeviceState *dev, Error **errp)
 
         if (!qdev_realize(DEVICE(pll), NULL, errp)) {
             return;
         }
     }
+
+    for (i = 0; i < CPRMAN_NUM_PLL_CHANNEL; i++) {
+        CprmanPllChannelState *channel = &s->channels[i];
+        CprmanPll parent = PLL_CHANNEL_INIT_INFO[i].parent;
+        Clock *parent_clk = s->plls[parent].out;
+
+        clock_set_source(channel->pll_in, parent_clk);
+
+        if (!qdev_realize(DEVICE(channel), NULL, errp)) {
+            return;
+        }
+    }
 }
 
 static const VMStateDescription cprman_vmstate = {
     .name = TYPE_BCM2835_CPRMAN,
     .version_id = 1,
@@ -326,8 +464,9 @@ static const TypeInfo cprman_info = {
 
 static void cprman_register_types(void)
 {
     type_register_static(&cprman_info);
     type_register_static(&cprman_pll_info);
+    type_register_static(&cprman_pll_channel_info);
 }
 
 type_init(cprman_register_types);
-- 
2.28.0


