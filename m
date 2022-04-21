Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40DD509E79
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:23:14 +0200 (CEST)
Received: from localhost ([::1]:37414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUu1-0007qa-V9
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpv-0002wb-Q1
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:59 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpr-0003RH-HQ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:59 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l3-20020a05600c1d0300b0038ff89c938bso3652828wms.0
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0h0Rvkwm6rsblcwsPxp9qPIXdkCkI7ax30Wxe1BZzVA=;
 b=CD/PiLoAr/lGQjPW0dqR/2R2juPclgbDVak4cLQiRUjqQ/5vCVCTvKkmGkeEmvSE29
 slbDICrAhwPWWS17KAJ7dowZUgn5WSpHom2bfNXsC3GbRZB4d7P2Hyc5V3S1ur0vlqrx
 3wkygZudbmxaYHZMj1s6alU9xZxVaZ5mleFXWAVHYQdKcYXvU5j4GRf70qEwO0wrSV+z
 ivFnCcZlmgr7ox95yRNOmT1BbHjF32KjRavsEZTKVyWRF67e9fLNbnxpwdqc849ZI6Co
 H8MlmNoiFLgaTqoC00516t3RMSRbAwj5TbElanon7Ykt+6G+Kx/XHBU979Og/jko5TPZ
 NfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0h0Rvkwm6rsblcwsPxp9qPIXdkCkI7ax30Wxe1BZzVA=;
 b=7VV8vzvW3iJxILKUOvJcOzkSocZV9k0SrCt2DovYQkusf2NsoaKMRpOWRytUPwxKR7
 YeUY2j+EoOeOSem1Ybqrjk85CYBQl0bvCDOp9NTO8aIgzBP0id26URxoCd49/4IGEN9B
 JTGzYoHm3GRD5h4FiNwEFg7hxuj6l1u342rQHBxsY29DJa1OzaKPpAn1JcP929Sg6/fr
 Okb4KM27NH0jK6svnR6eEv8vfPSwddCpnXfSi01SuL4ubhcNxgD0vPtwZxhyG+JOxUcC
 GwyXef5jt5x3Cm6jcehoKcDmjyEtKMSp2q65QshVF0zcsQuVHrGxCCmG/7zQ7wI3uOB/
 dC0Q==
X-Gm-Message-State: AOAM531EzfRrYZD9L3kwHA+P6R0MgxV2cllJDeErZ/+AxMXTxE3bRFWT
 wKu4l1bF2MnWjqT85sQFwlIYXuUAJv4+2Q==
X-Google-Smtp-Source: ABdhPJxHgfUEWim6BcA6MXPvbl8lFwUXbFlp42/MwBrNuJ/gTLEfGmMpzofMSUr76dQXxXpcNas4Ug==
X-Received: by 2002:a05:600c:1456:b0:38e:bd55:700 with SMTP id
 h22-20020a05600c145600b0038ebd550700mr8006170wmi.204.1650539933965; 
 Thu, 21 Apr 2022 04:18:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.18.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:18:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/31] hw/misc: Add a model of the Xilinx Versal CRL
Date: Thu, 21 Apr 2022 12:18:21 +0100
Message-Id: <20220421111846.2011565-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a model of the Xilinx Versal CRL.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Frederic Konrad <fkonrad@amd.com>
Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
Message-id: 20220406174303.2022038-4-edgar.iglesias@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/xlnx-versal-crl.h | 235 +++++++++++++++++
 hw/misc/xlnx-versal-crl.c         | 421 ++++++++++++++++++++++++++++++
 hw/misc/meson.build               |   1 +
 3 files changed, 657 insertions(+)
 create mode 100644 include/hw/misc/xlnx-versal-crl.h
 create mode 100644 hw/misc/xlnx-versal-crl.c

diff --git a/include/hw/misc/xlnx-versal-crl.h b/include/hw/misc/xlnx-versal-crl.h
new file mode 100644
index 00000000000..2857f4169a5
--- /dev/null
+++ b/include/hw/misc/xlnx-versal-crl.h
@@ -0,0 +1,235 @@
+/*
+ * QEMU model of the Clock-Reset-LPD (CRL).
+ *
+ * Copyright (c) 2022 Xilinx Inc.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ */
+#ifndef HW_MISC_XLNX_VERSAL_CRL_H
+#define HW_MISC_XLNX_VERSAL_CRL_H
+
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "target/arm/cpu.h"
+
+#define TYPE_XLNX_VERSAL_CRL "xlnx,versal-crl"
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxVersalCRL, XLNX_VERSAL_CRL)
+
+REG32(ERR_CTRL, 0x0)
+    FIELD(ERR_CTRL, SLVERR_ENABLE, 0, 1)
+REG32(IR_STATUS, 0x4)
+    FIELD(IR_STATUS, ADDR_DECODE_ERR, 0, 1)
+REG32(IR_MASK, 0x8)
+    FIELD(IR_MASK, ADDR_DECODE_ERR, 0, 1)
+REG32(IR_ENABLE, 0xc)
+    FIELD(IR_ENABLE, ADDR_DECODE_ERR, 0, 1)
+REG32(IR_DISABLE, 0x10)
+    FIELD(IR_DISABLE, ADDR_DECODE_ERR, 0, 1)
+REG32(WPROT, 0x1c)
+    FIELD(WPROT, ACTIVE, 0, 1)
+REG32(PLL_CLK_OTHER_DMN, 0x20)
+    FIELD(PLL_CLK_OTHER_DMN, APLL_BYPASS, 0, 1)
+REG32(RPLL_CTRL, 0x40)
+    FIELD(RPLL_CTRL, POST_SRC, 24, 3)
+    FIELD(RPLL_CTRL, PRE_SRC, 20, 3)
+    FIELD(RPLL_CTRL, CLKOUTDIV, 16, 2)
+    FIELD(RPLL_CTRL, FBDIV, 8, 8)
+    FIELD(RPLL_CTRL, BYPASS, 3, 1)
+    FIELD(RPLL_CTRL, RESET, 0, 1)
+REG32(RPLL_CFG, 0x44)
+    FIELD(RPLL_CFG, LOCK_DLY, 25, 7)
+    FIELD(RPLL_CFG, LOCK_CNT, 13, 10)
+    FIELD(RPLL_CFG, LFHF, 10, 2)
+    FIELD(RPLL_CFG, CP, 5, 4)
+    FIELD(RPLL_CFG, RES, 0, 4)
+REG32(RPLL_FRAC_CFG, 0x48)
+    FIELD(RPLL_FRAC_CFG, ENABLED, 31, 1)
+    FIELD(RPLL_FRAC_CFG, SEED, 22, 3)
+    FIELD(RPLL_FRAC_CFG, ALGRTHM, 19, 1)
+    FIELD(RPLL_FRAC_CFG, ORDER, 18, 1)
+    FIELD(RPLL_FRAC_CFG, DATA, 0, 16)
+REG32(PLL_STATUS, 0x50)
+    FIELD(PLL_STATUS, RPLL_STABLE, 2, 1)
+    FIELD(PLL_STATUS, RPLL_LOCK, 0, 1)
+REG32(RPLL_TO_XPD_CTRL, 0x100)
+    FIELD(RPLL_TO_XPD_CTRL, CLKACT, 25, 1)
+    FIELD(RPLL_TO_XPD_CTRL, DIVISOR0, 8, 10)
+REG32(LPD_TOP_SWITCH_CTRL, 0x104)
+    FIELD(LPD_TOP_SWITCH_CTRL, CLKACT_ADMA, 26, 1)
+    FIELD(LPD_TOP_SWITCH_CTRL, CLKACT, 25, 1)
+    FIELD(LPD_TOP_SWITCH_CTRL, DIVISOR0, 8, 10)
+    FIELD(LPD_TOP_SWITCH_CTRL, SRCSEL, 0, 3)
+REG32(LPD_LSBUS_CTRL, 0x108)
+    FIELD(LPD_LSBUS_CTRL, CLKACT, 25, 1)
+    FIELD(LPD_LSBUS_CTRL, DIVISOR0, 8, 10)
+    FIELD(LPD_LSBUS_CTRL, SRCSEL, 0, 3)
+REG32(CPU_R5_CTRL, 0x10c)
+    FIELD(CPU_R5_CTRL, CLKACT_OCM2, 28, 1)
+    FIELD(CPU_R5_CTRL, CLKACT_OCM, 27, 1)
+    FIELD(CPU_R5_CTRL, CLKACT_CORE, 26, 1)
+    FIELD(CPU_R5_CTRL, CLKACT, 25, 1)
+    FIELD(CPU_R5_CTRL, DIVISOR0, 8, 10)
+    FIELD(CPU_R5_CTRL, SRCSEL, 0, 3)
+REG32(IOU_SWITCH_CTRL, 0x114)
+    FIELD(IOU_SWITCH_CTRL, CLKACT, 25, 1)
+    FIELD(IOU_SWITCH_CTRL, DIVISOR0, 8, 10)
+    FIELD(IOU_SWITCH_CTRL, SRCSEL, 0, 3)
+REG32(GEM0_REF_CTRL, 0x118)
+    FIELD(GEM0_REF_CTRL, CLKACT_RX, 27, 1)
+    FIELD(GEM0_REF_CTRL, CLKACT_TX, 26, 1)
+    FIELD(GEM0_REF_CTRL, CLKACT, 25, 1)
+    FIELD(GEM0_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(GEM0_REF_CTRL, SRCSEL, 0, 3)
+REG32(GEM1_REF_CTRL, 0x11c)
+    FIELD(GEM1_REF_CTRL, CLKACT_RX, 27, 1)
+    FIELD(GEM1_REF_CTRL, CLKACT_TX, 26, 1)
+    FIELD(GEM1_REF_CTRL, CLKACT, 25, 1)
+    FIELD(GEM1_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(GEM1_REF_CTRL, SRCSEL, 0, 3)
+REG32(GEM_TSU_REF_CTRL, 0x120)
+    FIELD(GEM_TSU_REF_CTRL, CLKACT, 25, 1)
+    FIELD(GEM_TSU_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(GEM_TSU_REF_CTRL, SRCSEL, 0, 3)
+REG32(USB0_BUS_REF_CTRL, 0x124)
+    FIELD(USB0_BUS_REF_CTRL, CLKACT, 25, 1)
+    FIELD(USB0_BUS_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(USB0_BUS_REF_CTRL, SRCSEL, 0, 3)
+REG32(UART0_REF_CTRL, 0x128)
+    FIELD(UART0_REF_CTRL, CLKACT, 25, 1)
+    FIELD(UART0_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(UART0_REF_CTRL, SRCSEL, 0, 3)
+REG32(UART1_REF_CTRL, 0x12c)
+    FIELD(UART1_REF_CTRL, CLKACT, 25, 1)
+    FIELD(UART1_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(UART1_REF_CTRL, SRCSEL, 0, 3)
+REG32(SPI0_REF_CTRL, 0x130)
+    FIELD(SPI0_REF_CTRL, CLKACT, 25, 1)
+    FIELD(SPI0_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(SPI0_REF_CTRL, SRCSEL, 0, 3)
+REG32(SPI1_REF_CTRL, 0x134)
+    FIELD(SPI1_REF_CTRL, CLKACT, 25, 1)
+    FIELD(SPI1_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(SPI1_REF_CTRL, SRCSEL, 0, 3)
+REG32(CAN0_REF_CTRL, 0x138)
+    FIELD(CAN0_REF_CTRL, CLKACT, 25, 1)
+    FIELD(CAN0_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(CAN0_REF_CTRL, SRCSEL, 0, 3)
+REG32(CAN1_REF_CTRL, 0x13c)
+    FIELD(CAN1_REF_CTRL, CLKACT, 25, 1)
+    FIELD(CAN1_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(CAN1_REF_CTRL, SRCSEL, 0, 3)
+REG32(I2C0_REF_CTRL, 0x140)
+    FIELD(I2C0_REF_CTRL, CLKACT, 25, 1)
+    FIELD(I2C0_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(I2C0_REF_CTRL, SRCSEL, 0, 3)
+REG32(I2C1_REF_CTRL, 0x144)
+    FIELD(I2C1_REF_CTRL, CLKACT, 25, 1)
+    FIELD(I2C1_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(I2C1_REF_CTRL, SRCSEL, 0, 3)
+REG32(DBG_LPD_CTRL, 0x148)
+    FIELD(DBG_LPD_CTRL, CLKACT, 25, 1)
+    FIELD(DBG_LPD_CTRL, DIVISOR0, 8, 10)
+    FIELD(DBG_LPD_CTRL, SRCSEL, 0, 3)
+REG32(TIMESTAMP_REF_CTRL, 0x14c)
+    FIELD(TIMESTAMP_REF_CTRL, CLKACT, 25, 1)
+    FIELD(TIMESTAMP_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(TIMESTAMP_REF_CTRL, SRCSEL, 0, 3)
+REG32(CRL_SAFETY_CHK, 0x150)
+REG32(PSM_REF_CTRL, 0x154)
+    FIELD(PSM_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(PSM_REF_CTRL, SRCSEL, 0, 3)
+REG32(DBG_TSTMP_CTRL, 0x158)
+    FIELD(DBG_TSTMP_CTRL, CLKACT, 25, 1)
+    FIELD(DBG_TSTMP_CTRL, DIVISOR0, 8, 10)
+    FIELD(DBG_TSTMP_CTRL, SRCSEL, 0, 3)
+REG32(CPM_TOPSW_REF_CTRL, 0x15c)
+    FIELD(CPM_TOPSW_REF_CTRL, CLKACT, 25, 1)
+    FIELD(CPM_TOPSW_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(CPM_TOPSW_REF_CTRL, SRCSEL, 0, 3)
+REG32(USB3_DUAL_REF_CTRL, 0x160)
+    FIELD(USB3_DUAL_REF_CTRL, CLKACT, 25, 1)
+    FIELD(USB3_DUAL_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(USB3_DUAL_REF_CTRL, SRCSEL, 0, 3)
+REG32(RST_CPU_R5, 0x300)
+    FIELD(RST_CPU_R5, RESET_PGE, 4, 1)
+    FIELD(RST_CPU_R5, RESET_AMBA, 2, 1)
+    FIELD(RST_CPU_R5, RESET_CPU1, 1, 1)
+    FIELD(RST_CPU_R5, RESET_CPU0, 0, 1)
+REG32(RST_ADMA, 0x304)
+    FIELD(RST_ADMA, RESET, 0, 1)
+REG32(RST_GEM0, 0x308)
+    FIELD(RST_GEM0, RESET, 0, 1)
+REG32(RST_GEM1, 0x30c)
+    FIELD(RST_GEM1, RESET, 0, 1)
+REG32(RST_SPARE, 0x310)
+    FIELD(RST_SPARE, RESET, 0, 1)
+REG32(RST_USB0, 0x314)
+    FIELD(RST_USB0, RESET, 0, 1)
+REG32(RST_UART0, 0x318)
+    FIELD(RST_UART0, RESET, 0, 1)
+REG32(RST_UART1, 0x31c)
+    FIELD(RST_UART1, RESET, 0, 1)
+REG32(RST_SPI0, 0x320)
+    FIELD(RST_SPI0, RESET, 0, 1)
+REG32(RST_SPI1, 0x324)
+    FIELD(RST_SPI1, RESET, 0, 1)
+REG32(RST_CAN0, 0x328)
+    FIELD(RST_CAN0, RESET, 0, 1)
+REG32(RST_CAN1, 0x32c)
+    FIELD(RST_CAN1, RESET, 0, 1)
+REG32(RST_I2C0, 0x330)
+    FIELD(RST_I2C0, RESET, 0, 1)
+REG32(RST_I2C1, 0x334)
+    FIELD(RST_I2C1, RESET, 0, 1)
+REG32(RST_DBG_LPD, 0x338)
+    FIELD(RST_DBG_LPD, RPU_DBG1_RESET, 5, 1)
+    FIELD(RST_DBG_LPD, RPU_DBG0_RESET, 4, 1)
+    FIELD(RST_DBG_LPD, RESET_HSDP, 1, 1)
+    FIELD(RST_DBG_LPD, RESET, 0, 1)
+REG32(RST_GPIO, 0x33c)
+    FIELD(RST_GPIO, RESET, 0, 1)
+REG32(RST_TTC, 0x344)
+    FIELD(RST_TTC, TTC3_RESET, 3, 1)
+    FIELD(RST_TTC, TTC2_RESET, 2, 1)
+    FIELD(RST_TTC, TTC1_RESET, 1, 1)
+    FIELD(RST_TTC, TTC0_RESET, 0, 1)
+REG32(RST_TIMESTAMP, 0x348)
+    FIELD(RST_TIMESTAMP, RESET, 0, 1)
+REG32(RST_SWDT, 0x34c)
+    FIELD(RST_SWDT, RESET, 0, 1)
+REG32(RST_OCM, 0x350)
+    FIELD(RST_OCM, RESET, 0, 1)
+REG32(RST_IPI, 0x354)
+    FIELD(RST_IPI, RESET, 0, 1)
+REG32(RST_SYSMON, 0x358)
+    FIELD(RST_SYSMON, SEQ_RST, 1, 1)
+    FIELD(RST_SYSMON, CFG_RST, 0, 1)
+REG32(RST_FPD, 0x360)
+    FIELD(RST_FPD, SRST, 1, 1)
+    FIELD(RST_FPD, POR, 0, 1)
+REG32(PSM_RST_MODE, 0x370)
+    FIELD(PSM_RST_MODE, WAKEUP, 2, 1)
+    FIELD(PSM_RST_MODE, RST_MODE, 0, 2)
+
+#define CRL_R_MAX (R_PSM_RST_MODE + 1)
+
+#define RPU_MAX_CPU 2
+
+struct XlnxVersalCRL {
+    SysBusDevice parent_obj;
+    qemu_irq irq;
+
+    struct {
+        ARMCPU *cpu_r5[RPU_MAX_CPU];
+        DeviceState *adma[8];
+        DeviceState *uart[2];
+        DeviceState *gem[2];
+        DeviceState *usb;
+    } cfg;
+
+    RegisterInfoArray *reg_array;
+    uint32_t regs[CRL_R_MAX];
+    RegisterInfo regs_info[CRL_R_MAX];
+};
+#endif
diff --git a/hw/misc/xlnx-versal-crl.c b/hw/misc/xlnx-versal-crl.c
new file mode 100644
index 00000000000..767106b7a30
--- /dev/null
+++ b/hw/misc/xlnx-versal-crl.c
@@ -0,0 +1,421 @@
+/*
+ * QEMU model of the Clock-Reset-LPD (CRL).
+ *
+ * Copyright (c) 2022 Advanced Micro Devices, Inc.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Written by Edgar E. Iglesias <edgar.iglesias@amd.com>
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "qemu/bitops.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/register.h"
+#include "hw/resettable.h"
+
+#include "target/arm/arm-powerctl.h"
+#include "hw/misc/xlnx-versal-crl.h"
+
+#ifndef XLNX_VERSAL_CRL_ERR_DEBUG
+#define XLNX_VERSAL_CRL_ERR_DEBUG 0
+#endif
+
+static void crl_update_irq(XlnxVersalCRL *s)
+{
+    bool pending = s->regs[R_IR_STATUS] & ~s->regs[R_IR_MASK];
+    qemu_set_irq(s->irq, pending);
+}
+
+static void crl_status_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+    crl_update_irq(s);
+}
+
+static uint64_t crl_enable_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IR_MASK] &= ~val;
+    crl_update_irq(s);
+    return 0;
+}
+
+static uint64_t crl_disable_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IR_MASK] |= val;
+    crl_update_irq(s);
+    return 0;
+}
+
+static void crl_reset_dev(XlnxVersalCRL *s, DeviceState *dev,
+                          bool rst_old, bool rst_new)
+{
+    device_cold_reset(dev);
+}
+
+static void crl_reset_cpu(XlnxVersalCRL *s, ARMCPU *armcpu,
+                          bool rst_old, bool rst_new)
+{
+    if (rst_new) {
+        arm_set_cpu_off(armcpu->mp_affinity);
+    } else {
+        arm_set_cpu_on_and_reset(armcpu->mp_affinity);
+    }
+}
+
+#define REGFIELD_RESET(type, s, reg, f, new_val, dev) {     \
+    bool old_f = ARRAY_FIELD_EX32((s)->regs, reg, f);       \
+    bool new_f = FIELD_EX32(new_val, reg, f);               \
+                                                            \
+    /* Detect edges.  */                                    \
+    if (dev && old_f != new_f) {                            \
+        crl_reset_ ## type(s, dev, old_f, new_f);           \
+    }                                                       \
+}
+
+static uint64_t crl_rst_r5_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+
+    REGFIELD_RESET(cpu, s, RST_CPU_R5, RESET_CPU0, val64, s->cfg.cpu_r5[0]);
+    REGFIELD_RESET(cpu, s, RST_CPU_R5, RESET_CPU1, val64, s->cfg.cpu_r5[1]);
+    return val64;
+}
+
+static uint64_t crl_rst_adma_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+    int i;
+
+    /* A single register fans out to all ADMA reset inputs.  */
+    for (i = 0; i < ARRAY_SIZE(s->cfg.adma); i++) {
+        REGFIELD_RESET(dev, s, RST_ADMA, RESET, val64, s->cfg.adma[i]);
+    }
+    return val64;
+}
+
+static uint64_t crl_rst_uart0_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+
+    REGFIELD_RESET(dev, s, RST_UART0, RESET, val64, s->cfg.uart[0]);
+    return val64;
+}
+
+static uint64_t crl_rst_uart1_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+
+    REGFIELD_RESET(dev, s, RST_UART1, RESET, val64, s->cfg.uart[1]);
+    return val64;
+}
+
+static uint64_t crl_rst_gem0_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+
+    REGFIELD_RESET(dev, s, RST_GEM0, RESET, val64, s->cfg.gem[0]);
+    return val64;
+}
+
+static uint64_t crl_rst_gem1_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+
+    REGFIELD_RESET(dev, s, RST_GEM1, RESET, val64, s->cfg.gem[1]);
+    return val64;
+}
+
+static uint64_t crl_rst_usb_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+
+    REGFIELD_RESET(dev, s, RST_USB0, RESET, val64, s->cfg.usb);
+    return val64;
+}
+
+static const RegisterAccessInfo crl_regs_info[] = {
+    {   .name = "ERR_CTRL",  .addr = A_ERR_CTRL,
+    },{ .name = "IR_STATUS",  .addr = A_IR_STATUS,
+        .w1c = 0x1,
+        .post_write = crl_status_postw,
+    },{ .name = "IR_MASK",  .addr = A_IR_MASK,
+        .reset = 0x1,
+        .ro = 0x1,
+    },{ .name = "IR_ENABLE",  .addr = A_IR_ENABLE,
+        .pre_write = crl_enable_prew,
+    },{ .name = "IR_DISABLE",  .addr = A_IR_DISABLE,
+        .pre_write = crl_disable_prew,
+    },{ .name = "WPROT",  .addr = A_WPROT,
+    },{ .name = "PLL_CLK_OTHER_DMN",  .addr = A_PLL_CLK_OTHER_DMN,
+        .reset = 0x1,
+        .rsvd = 0xe,
+    },{ .name = "RPLL_CTRL",  .addr = A_RPLL_CTRL,
+        .reset = 0x24809,
+        .rsvd = 0xf88c00f6,
+    },{ .name = "RPLL_CFG",  .addr = A_RPLL_CFG,
+        .reset = 0x2000000,
+        .rsvd = 0x1801210,
+    },{ .name = "RPLL_FRAC_CFG",  .addr = A_RPLL_FRAC_CFG,
+        .rsvd = 0x7e330000,
+    },{ .name = "PLL_STATUS",  .addr = A_PLL_STATUS,
+        .reset = R_PLL_STATUS_RPLL_STABLE_MASK |
+                 R_PLL_STATUS_RPLL_LOCK_MASK,
+        .rsvd = 0xfa,
+        .ro = 0x5,
+    },{ .name = "RPLL_TO_XPD_CTRL",  .addr = A_RPLL_TO_XPD_CTRL,
+        .reset = 0x2000100,
+        .rsvd = 0xfdfc00ff,
+    },{ .name = "LPD_TOP_SWITCH_CTRL",  .addr = A_LPD_TOP_SWITCH_CTRL,
+        .reset = 0x6000300,
+        .rsvd = 0xf9fc00f8,
+    },{ .name = "LPD_LSBUS_CTRL",  .addr = A_LPD_LSBUS_CTRL,
+        .reset = 0x2000800,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "CPU_R5_CTRL",  .addr = A_CPU_R5_CTRL,
+        .reset = 0xe000300,
+        .rsvd = 0xe1fc00f8,
+    },{ .name = "IOU_SWITCH_CTRL",  .addr = A_IOU_SWITCH_CTRL,
+        .reset = 0x2000500,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "GEM0_REF_CTRL",  .addr = A_GEM0_REF_CTRL,
+        .reset = 0xe000a00,
+        .rsvd = 0xf1fc00f8,
+    },{ .name = "GEM1_REF_CTRL",  .addr = A_GEM1_REF_CTRL,
+        .reset = 0xe000a00,
+        .rsvd = 0xf1fc00f8,
+    },{ .name = "GEM_TSU_REF_CTRL",  .addr = A_GEM_TSU_REF_CTRL,
+        .reset = 0x300,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "USB0_BUS_REF_CTRL",  .addr = A_USB0_BUS_REF_CTRL,
+        .reset = 0x2001900,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "UART0_REF_CTRL",  .addr = A_UART0_REF_CTRL,
+        .reset = 0xc00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "UART1_REF_CTRL",  .addr = A_UART1_REF_CTRL,
+        .reset = 0xc00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "SPI0_REF_CTRL",  .addr = A_SPI0_REF_CTRL,
+        .reset = 0x600,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "SPI1_REF_CTRL",  .addr = A_SPI1_REF_CTRL,
+        .reset = 0x600,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "CAN0_REF_CTRL",  .addr = A_CAN0_REF_CTRL,
+        .reset = 0xc00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "CAN1_REF_CTRL",  .addr = A_CAN1_REF_CTRL,
+        .reset = 0xc00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "I2C0_REF_CTRL",  .addr = A_I2C0_REF_CTRL,
+        .reset = 0xc00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "I2C1_REF_CTRL",  .addr = A_I2C1_REF_CTRL,
+        .reset = 0xc00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "DBG_LPD_CTRL",  .addr = A_DBG_LPD_CTRL,
+        .reset = 0x300,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "TIMESTAMP_REF_CTRL",  .addr = A_TIMESTAMP_REF_CTRL,
+        .reset = 0x2000c00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "CRL_SAFETY_CHK",  .addr = A_CRL_SAFETY_CHK,
+    },{ .name = "PSM_REF_CTRL",  .addr = A_PSM_REF_CTRL,
+        .reset = 0xf04,
+        .rsvd = 0xfffc00f8,
+    },{ .name = "DBG_TSTMP_CTRL",  .addr = A_DBG_TSTMP_CTRL,
+        .reset = 0x300,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "CPM_TOPSW_REF_CTRL",  .addr = A_CPM_TOPSW_REF_CTRL,
+        .reset = 0x300,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "USB3_DUAL_REF_CTRL",  .addr = A_USB3_DUAL_REF_CTRL,
+        .reset = 0x3c00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "RST_CPU_R5",  .addr = A_RST_CPU_R5,
+        .reset = 0x17,
+        .rsvd = 0x8,
+        .pre_write = crl_rst_r5_prew,
+    },{ .name = "RST_ADMA",  .addr = A_RST_ADMA,
+        .reset = 0x1,
+        .pre_write = crl_rst_adma_prew,
+    },{ .name = "RST_GEM0",  .addr = A_RST_GEM0,
+        .reset = 0x1,
+        .pre_write = crl_rst_gem0_prew,
+    },{ .name = "RST_GEM1",  .addr = A_RST_GEM1,
+        .reset = 0x1,
+        .pre_write = crl_rst_gem1_prew,
+    },{ .name = "RST_SPARE",  .addr = A_RST_SPARE,
+        .reset = 0x1,
+    },{ .name = "RST_USB0",  .addr = A_RST_USB0,
+        .reset = 0x1,
+        .pre_write = crl_rst_usb_prew,
+    },{ .name = "RST_UART0",  .addr = A_RST_UART0,
+        .reset = 0x1,
+        .pre_write = crl_rst_uart0_prew,
+    },{ .name = "RST_UART1",  .addr = A_RST_UART1,
+        .reset = 0x1,
+        .pre_write = crl_rst_uart1_prew,
+    },{ .name = "RST_SPI0",  .addr = A_RST_SPI0,
+        .reset = 0x1,
+    },{ .name = "RST_SPI1",  .addr = A_RST_SPI1,
+        .reset = 0x1,
+    },{ .name = "RST_CAN0",  .addr = A_RST_CAN0,
+        .reset = 0x1,
+    },{ .name = "RST_CAN1",  .addr = A_RST_CAN1,
+        .reset = 0x1,
+    },{ .name = "RST_I2C0",  .addr = A_RST_I2C0,
+        .reset = 0x1,
+    },{ .name = "RST_I2C1",  .addr = A_RST_I2C1,
+        .reset = 0x1,
+    },{ .name = "RST_DBG_LPD",  .addr = A_RST_DBG_LPD,
+        .reset = 0x33,
+        .rsvd = 0xcc,
+    },{ .name = "RST_GPIO",  .addr = A_RST_GPIO,
+        .reset = 0x1,
+    },{ .name = "RST_TTC",  .addr = A_RST_TTC,
+        .reset = 0xf,
+    },{ .name = "RST_TIMESTAMP",  .addr = A_RST_TIMESTAMP,
+        .reset = 0x1,
+    },{ .name = "RST_SWDT",  .addr = A_RST_SWDT,
+        .reset = 0x1,
+    },{ .name = "RST_OCM",  .addr = A_RST_OCM,
+    },{ .name = "RST_IPI",  .addr = A_RST_IPI,
+    },{ .name = "RST_FPD",  .addr = A_RST_FPD,
+        .reset = 0x3,
+    },{ .name = "PSM_RST_MODE",  .addr = A_PSM_RST_MODE,
+        .reset = 0x1,
+        .rsvd = 0xf8,
+    }
+};
+
+static void crl_reset_enter(Object *obj, ResetType type)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(obj);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+}
+
+static void crl_reset_hold(Object *obj)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(obj);
+
+    crl_update_irq(s);
+}
+
+static const MemoryRegionOps crl_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void crl_init(Object *obj)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    int i;
+
+    s->reg_array =
+        register_init_block32(DEVICE(obj), crl_regs_info,
+                              ARRAY_SIZE(crl_regs_info),
+                              s->regs_info, s->regs,
+                              &crl_ops,
+                              XLNX_VERSAL_CRL_ERR_DEBUG,
+                              CRL_R_MAX * 4);
+    sysbus_init_mmio(sbd, &s->reg_array->mem);
+    sysbus_init_irq(sbd, &s->irq);
+
+    for (i = 0; i < ARRAY_SIZE(s->cfg.cpu_r5); ++i) {
+        object_property_add_link(obj, "cpu_r5[*]", TYPE_ARM_CPU,
+                                 (Object **)&s->cfg.cpu_r5[i],
+                                 qdev_prop_allow_set_link_before_realize,
+                                 OBJ_PROP_LINK_STRONG);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->cfg.adma); ++i) {
+        object_property_add_link(obj, "adma[*]", TYPE_DEVICE,
+                                 (Object **)&s->cfg.adma[i],
+                                 qdev_prop_allow_set_link_before_realize,
+                                 OBJ_PROP_LINK_STRONG);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->cfg.uart); ++i) {
+        object_property_add_link(obj, "uart[*]", TYPE_DEVICE,
+                                 (Object **)&s->cfg.uart[i],
+                                 qdev_prop_allow_set_link_before_realize,
+                                 OBJ_PROP_LINK_STRONG);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->cfg.gem); ++i) {
+        object_property_add_link(obj, "gem[*]", TYPE_DEVICE,
+                                 (Object **)&s->cfg.gem[i],
+                                 qdev_prop_allow_set_link_before_realize,
+                                 OBJ_PROP_LINK_STRONG);
+    }
+
+    object_property_add_link(obj, "usb", TYPE_DEVICE,
+                             (Object **)&s->cfg.gem[i],
+                             qdev_prop_allow_set_link_before_realize,
+                             OBJ_PROP_LINK_STRONG);
+}
+
+static void crl_finalize(Object *obj)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(obj);
+    register_finalize_block(s->reg_array);
+}
+
+static const VMStateDescription vmstate_crl = {
+    .name = TYPE_XLNX_VERSAL_CRL,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxVersalCRL, CRL_R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void crl_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_crl;
+
+    rc->phases.enter = crl_reset_enter;
+    rc->phases.hold = crl_reset_hold;
+}
+
+static const TypeInfo crl_info = {
+    .name          = TYPE_XLNX_VERSAL_CRL,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxVersalCRL),
+    .class_init    = crl_class_init,
+    .instance_init = crl_init,
+    .instance_finalize = crl_finalize,
+};
+
+static void crl_register_types(void)
+{
+    type_register_static(&crl_info);
+}
+
+type_init(crl_register_types)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 6fb69612e06..2ff05c7afa9 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -86,6 +86,7 @@ softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
 specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
 specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-apu-ctrl.c'))
+specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-crl.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(
   'xlnx-versal-xramc.c',
   'xlnx-versal-pmc-iou-slcr.c',
-- 
2.25.1


