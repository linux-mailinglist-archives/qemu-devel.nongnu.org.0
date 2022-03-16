Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207614DB6BD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 17:53:28 +0100 (CET)
Received: from localhost ([::1]:43276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUWtr-0007YF-1o
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 12:53:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUWnY-000090-GI; Wed, 16 Mar 2022 12:46:56 -0400
Received: from [2a00:1450:4864:20::231] (port=40922
 helo=mail-lj1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUWnV-0006Ee-1P; Wed, 16 Mar 2022 12:46:55 -0400
Received: by mail-lj1-x231.google.com with SMTP id g24so2698816lja.7;
 Wed, 16 Mar 2022 09:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fOykozH9+9r/fjt2hgs1sMxT9O1LZ/vKqyjs8HDuh3g=;
 b=TPbObjz7l8rfA7PJBaSiX+M+X+8TvbJUERq+M5V+UhsMNUItdf+7YnyXrEigg3kmdg
 mmY2cfG4wivHSsH3zHkPjvlUo0NAb2QwrdYlMmuKSupsJv7uWWdr331U0K+LWbWoBbc7
 qUAjRdX+y+5/DEFWNzBy7/rznJciFA32xGG0O5cue3SQgC+tBpjnUdmSQ4d9kDOZ+qJ7
 osntrybOsbY+/iQ9jk5/Sf3n8u90EQi5bC5xJfkc9dox6uCgkQCBDxqgMForRuTtBz7U
 xKK/rD7s2iXiUXuXoe4BDgEu0u9xvG33s3LyNwCsUGZhsw/VjTGB6e2GKgbPnZt/GDkT
 ua6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fOykozH9+9r/fjt2hgs1sMxT9O1LZ/vKqyjs8HDuh3g=;
 b=fbxJPgtC+f5B8SILqbmYU7q4vUgUl60BiLL16neJfFWl0Iitfp76ZAsPTQC5bzwa2v
 bhEjWcD0NRY7hEINiuKac9xp92E0cG3aHqCl7cQIZ6ailq0oWD8stUw5hoN8JtM59BKU
 RWp66NkKP8LrI8m86be15sFFd5iq4J5bi1PQCbacbezxvMeKupRMd59que39HN5bO5HX
 3qTmt7TJXftxgaXB1tQZEqiTTvDQY6xb81UFU6UnBpZ2g46IA2aRyBSERspGG1RV6Wn8
 wVCzYDlHov6ATNtO73VTnM/kAuM1yH70YzBk4OlKNXTKuFR/STukEwUb5ihWVm8hEBmh
 fQ2A==
X-Gm-Message-State: AOAM5326Tr0aTrnKPav2BJKpkrfhrkdAwxRQX+Y02rB97t8puv2JbAUX
 sXIkhKTzIHm+V9pBOn94mM+0Rh3bR8NaoA==
X-Google-Smtp-Source: ABdhPJxj4QSQKH72YNs3/hQ/GqblBsgTDwz8GoxAnWrT2kcWMEu7udNlOxElM4ts3ft0JakBgk3skg==
X-Received: by 2002:a2e:910e:0:b0:247:e33b:cbee with SMTP id
 m14-20020a2e910e000000b00247e33bcbeemr320610ljg.256.1647449210138; 
 Wed, 16 Mar 2022 09:46:50 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a2eb805000000b0023cfa330e59sm219316ljo.83.2022.03.16.09.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 09:46:49 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] hw/misc: Add a model of the Xilinx ZynqMP CRF
Date: Wed, 16 Mar 2022 17:46:42 +0100
Message-Id: <20220316164645.2303510-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
References: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::231
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org, f4bug@amsat.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add a model of the Xilinx ZynqMP CRF. At the moment this
is mostly a stub model.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/misc/xlnx-zynqmp-crf.h | 211 ++++++++++++++++++++++++
 hw/misc/xlnx-zynqmp-crf.c         | 266 ++++++++++++++++++++++++++++++
 hw/misc/meson.build               |   1 +
 3 files changed, 478 insertions(+)
 create mode 100644 include/hw/misc/xlnx-zynqmp-crf.h
 create mode 100644 hw/misc/xlnx-zynqmp-crf.c

diff --git a/include/hw/misc/xlnx-zynqmp-crf.h b/include/hw/misc/xlnx-zynqmp-crf.h
new file mode 100644
index 0000000000..02ef0bdeee
--- /dev/null
+++ b/include/hw/misc/xlnx-zynqmp-crf.h
@@ -0,0 +1,211 @@
+/*
+ * QEMU model of the CRF - Clock Reset FPD.
+ *
+ * Copyright (c) 2022 Xilinx Inc.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ */
+#ifndef HW_MISC_XLNX_ZYNQMP_CRF_H
+#define HW_MISC_XLNX_ZYNQMP_CRF_H
+
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+#define TYPE_XLNX_ZYNQMP_CRF "xlnx.zynqmp_crf"
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPCRF, XLNX_ZYNQMP_CRF)
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
+REG32(CRF_WPROT, 0x1c)
+    FIELD(CRF_WPROT, ACTIVE, 0, 1)
+REG32(APLL_CTRL, 0x20)
+    FIELD(APLL_CTRL, POST_SRC, 24, 3)
+    FIELD(APLL_CTRL, PRE_SRC, 20, 3)
+    FIELD(APLL_CTRL, CLKOUTDIV, 17, 1)
+    FIELD(APLL_CTRL, DIV2, 16, 1)
+    FIELD(APLL_CTRL, FBDIV, 8, 7)
+    FIELD(APLL_CTRL, BYPASS, 3, 1)
+    FIELD(APLL_CTRL, RESET, 0, 1)
+REG32(APLL_CFG, 0x24)
+    FIELD(APLL_CFG, LOCK_DLY, 25, 7)
+    FIELD(APLL_CFG, LOCK_CNT, 13, 10)
+    FIELD(APLL_CFG, LFHF, 10, 2)
+    FIELD(APLL_CFG, CP, 5, 4)
+    FIELD(APLL_CFG, RES, 0, 4)
+REG32(APLL_FRAC_CFG, 0x28)
+    FIELD(APLL_FRAC_CFG, ENABLED, 31, 1)
+    FIELD(APLL_FRAC_CFG, SEED, 22, 3)
+    FIELD(APLL_FRAC_CFG, ALGRTHM, 19, 1)
+    FIELD(APLL_FRAC_CFG, ORDER, 18, 1)
+    FIELD(APLL_FRAC_CFG, DATA, 0, 16)
+REG32(DPLL_CTRL, 0x2c)
+    FIELD(DPLL_CTRL, POST_SRC, 24, 3)
+    FIELD(DPLL_CTRL, PRE_SRC, 20, 3)
+    FIELD(DPLL_CTRL, CLKOUTDIV, 17, 1)
+    FIELD(DPLL_CTRL, DIV2, 16, 1)
+    FIELD(DPLL_CTRL, FBDIV, 8, 7)
+    FIELD(DPLL_CTRL, BYPASS, 3, 1)
+    FIELD(DPLL_CTRL, RESET, 0, 1)
+REG32(DPLL_CFG, 0x30)
+    FIELD(DPLL_CFG, LOCK_DLY, 25, 7)
+    FIELD(DPLL_CFG, LOCK_CNT, 13, 10)
+    FIELD(DPLL_CFG, LFHF, 10, 2)
+    FIELD(DPLL_CFG, CP, 5, 4)
+    FIELD(DPLL_CFG, RES, 0, 4)
+REG32(DPLL_FRAC_CFG, 0x34)
+    FIELD(DPLL_FRAC_CFG, ENABLED, 31, 1)
+    FIELD(DPLL_FRAC_CFG, SEED, 22, 3)
+    FIELD(DPLL_FRAC_CFG, ALGRTHM, 19, 1)
+    FIELD(DPLL_FRAC_CFG, ORDER, 18, 1)
+    FIELD(DPLL_FRAC_CFG, DATA, 0, 16)
+REG32(VPLL_CTRL, 0x38)
+    FIELD(VPLL_CTRL, POST_SRC, 24, 3)
+    FIELD(VPLL_CTRL, PRE_SRC, 20, 3)
+    FIELD(VPLL_CTRL, CLKOUTDIV, 17, 1)
+    FIELD(VPLL_CTRL, DIV2, 16, 1)
+    FIELD(VPLL_CTRL, FBDIV, 8, 7)
+    FIELD(VPLL_CTRL, BYPASS, 3, 1)
+    FIELD(VPLL_CTRL, RESET, 0, 1)
+REG32(VPLL_CFG, 0x3c)
+    FIELD(VPLL_CFG, LOCK_DLY, 25, 7)
+    FIELD(VPLL_CFG, LOCK_CNT, 13, 10)
+    FIELD(VPLL_CFG, LFHF, 10, 2)
+    FIELD(VPLL_CFG, CP, 5, 4)
+    FIELD(VPLL_CFG, RES, 0, 4)
+REG32(VPLL_FRAC_CFG, 0x40)
+    FIELD(VPLL_FRAC_CFG, ENABLED, 31, 1)
+    FIELD(VPLL_FRAC_CFG, SEED, 22, 3)
+    FIELD(VPLL_FRAC_CFG, ALGRTHM, 19, 1)
+    FIELD(VPLL_FRAC_CFG, ORDER, 18, 1)
+    FIELD(VPLL_FRAC_CFG, DATA, 0, 16)
+REG32(PLL_STATUS, 0x44)
+    FIELD(PLL_STATUS, VPLL_STABLE, 5, 1)
+    FIELD(PLL_STATUS, DPLL_STABLE, 4, 1)
+    FIELD(PLL_STATUS, APLL_STABLE, 3, 1)
+    FIELD(PLL_STATUS, VPLL_LOCK, 2, 1)
+    FIELD(PLL_STATUS, DPLL_LOCK, 1, 1)
+    FIELD(PLL_STATUS, APLL_LOCK, 0, 1)
+REG32(APLL_TO_LPD_CTRL, 0x48)
+    FIELD(APLL_TO_LPD_CTRL, DIVISOR0, 8, 6)
+REG32(DPLL_TO_LPD_CTRL, 0x4c)
+    FIELD(DPLL_TO_LPD_CTRL, DIVISOR0, 8, 6)
+REG32(VPLL_TO_LPD_CTRL, 0x50)
+    FIELD(VPLL_TO_LPD_CTRL, DIVISOR0, 8, 6)
+REG32(ACPU_CTRL, 0x60)
+    FIELD(ACPU_CTRL, CLKACT_HALF, 25, 1)
+    FIELD(ACPU_CTRL, CLKACT_FULL, 24, 1)
+    FIELD(ACPU_CTRL, DIVISOR0, 8, 6)
+    FIELD(ACPU_CTRL, SRCSEL, 0, 3)
+REG32(DBG_TRACE_CTRL, 0x64)
+    FIELD(DBG_TRACE_CTRL, CLKACT, 24, 1)
+    FIELD(DBG_TRACE_CTRL, DIVISOR0, 8, 6)
+    FIELD(DBG_TRACE_CTRL, SRCSEL, 0, 3)
+REG32(DBG_FPD_CTRL, 0x68)
+    FIELD(DBG_FPD_CTRL, CLKACT, 24, 1)
+    FIELD(DBG_FPD_CTRL, DIVISOR0, 8, 6)
+    FIELD(DBG_FPD_CTRL, SRCSEL, 0, 3)
+REG32(DP_VIDEO_REF_CTRL, 0x70)
+    FIELD(DP_VIDEO_REF_CTRL, CLKACT, 24, 1)
+    FIELD(DP_VIDEO_REF_CTRL, DIVISOR1, 16, 6)
+    FIELD(DP_VIDEO_REF_CTRL, DIVISOR0, 8, 6)
+    FIELD(DP_VIDEO_REF_CTRL, SRCSEL, 0, 3)
+REG32(DP_AUDIO_REF_CTRL, 0x74)
+    FIELD(DP_AUDIO_REF_CTRL, CLKACT, 24, 1)
+    FIELD(DP_AUDIO_REF_CTRL, DIVISOR1, 16, 6)
+    FIELD(DP_AUDIO_REF_CTRL, DIVISOR0, 8, 6)
+    FIELD(DP_AUDIO_REF_CTRL, SRCSEL, 0, 3)
+REG32(DP_STC_REF_CTRL, 0x7c)
+    FIELD(DP_STC_REF_CTRL, CLKACT, 24, 1)
+    FIELD(DP_STC_REF_CTRL, DIVISOR1, 16, 6)
+    FIELD(DP_STC_REF_CTRL, DIVISOR0, 8, 6)
+    FIELD(DP_STC_REF_CTRL, SRCSEL, 0, 3)
+REG32(DDR_CTRL, 0x80)
+    FIELD(DDR_CTRL, CLKACT, 24, 1)
+    FIELD(DDR_CTRL, DIVISOR0, 8, 6)
+    FIELD(DDR_CTRL, SRCSEL, 0, 3)
+REG32(GPU_REF_CTRL, 0x84)
+    FIELD(GPU_REF_CTRL, PP1_CLKACT, 26, 1)
+    FIELD(GPU_REF_CTRL, PP0_CLKACT, 25, 1)
+    FIELD(GPU_REF_CTRL, CLKACT, 24, 1)
+    FIELD(GPU_REF_CTRL, DIVISOR0, 8, 6)
+    FIELD(GPU_REF_CTRL, SRCSEL, 0, 3)
+REG32(SATA_REF_CTRL, 0xa0)
+    FIELD(SATA_REF_CTRL, CLKACT, 24, 1)
+    FIELD(SATA_REF_CTRL, DIVISOR0, 8, 6)
+    FIELD(SATA_REF_CTRL, SRCSEL, 0, 3)
+REG32(PCIE_REF_CTRL, 0xb4)
+    FIELD(PCIE_REF_CTRL, CLKACT, 24, 1)
+    FIELD(PCIE_REF_CTRL, DIVISOR0, 8, 6)
+    FIELD(PCIE_REF_CTRL, SRCSEL, 0, 3)
+REG32(GDMA_REF_CTRL, 0xb8)
+    FIELD(GDMA_REF_CTRL, CLKACT, 24, 1)
+    FIELD(GDMA_REF_CTRL, DIVISOR0, 8, 6)
+    FIELD(GDMA_REF_CTRL, SRCSEL, 0, 3)
+REG32(DPDMA_REF_CTRL, 0xbc)
+    FIELD(DPDMA_REF_CTRL, CLKACT, 24, 1)
+    FIELD(DPDMA_REF_CTRL, DIVISOR0, 8, 6)
+    FIELD(DPDMA_REF_CTRL, SRCSEL, 0, 3)
+REG32(TOPSW_MAIN_CTRL, 0xc0)
+    FIELD(TOPSW_MAIN_CTRL, CLKACT, 24, 1)
+    FIELD(TOPSW_MAIN_CTRL, DIVISOR0, 8, 6)
+    FIELD(TOPSW_MAIN_CTRL, SRCSEL, 0, 3)
+REG32(TOPSW_LSBUS_CTRL, 0xc4)
+    FIELD(TOPSW_LSBUS_CTRL, CLKACT, 24, 1)
+    FIELD(TOPSW_LSBUS_CTRL, DIVISOR0, 8, 6)
+    FIELD(TOPSW_LSBUS_CTRL, SRCSEL, 0, 3)
+REG32(DBG_TSTMP_CTRL, 0xf8)
+    FIELD(DBG_TSTMP_CTRL, DIVISOR0, 8, 6)
+    FIELD(DBG_TSTMP_CTRL, SRCSEL, 0, 3)
+REG32(RST_FPD_TOP, 0x100)
+    FIELD(RST_FPD_TOP, PCIE_CFG_RESET, 19, 1)
+    FIELD(RST_FPD_TOP, PCIE_BRIDGE_RESET, 18, 1)
+    FIELD(RST_FPD_TOP, PCIE_CTRL_RESET, 17, 1)
+    FIELD(RST_FPD_TOP, DP_RESET, 16, 1)
+    FIELD(RST_FPD_TOP, SWDT_RESET, 15, 1)
+    FIELD(RST_FPD_TOP, AFI_FM5_RESET, 12, 1)
+    FIELD(RST_FPD_TOP, AFI_FM4_RESET, 11, 1)
+    FIELD(RST_FPD_TOP, AFI_FM3_RESET, 10, 1)
+    FIELD(RST_FPD_TOP, AFI_FM2_RESET, 9, 1)
+    FIELD(RST_FPD_TOP, AFI_FM1_RESET, 8, 1)
+    FIELD(RST_FPD_TOP, AFI_FM0_RESET, 7, 1)
+    FIELD(RST_FPD_TOP, GDMA_RESET, 6, 1)
+    FIELD(RST_FPD_TOP, GPU_PP1_RESET, 5, 1)
+    FIELD(RST_FPD_TOP, GPU_PP0_RESET, 4, 1)
+    FIELD(RST_FPD_TOP, GPU_RESET, 3, 1)
+    FIELD(RST_FPD_TOP, GT_RESET, 2, 1)
+    FIELD(RST_FPD_TOP, SATA_RESET, 1, 1)
+REG32(RST_FPD_APU, 0x104)
+    FIELD(RST_FPD_APU, ACPU3_PWRON_RESET, 13, 1)
+    FIELD(RST_FPD_APU, ACPU2_PWRON_RESET, 12, 1)
+    FIELD(RST_FPD_APU, ACPU1_PWRON_RESET, 11, 1)
+    FIELD(RST_FPD_APU, ACPU0_PWRON_RESET, 10, 1)
+    FIELD(RST_FPD_APU, APU_L2_RESET, 8, 1)
+    FIELD(RST_FPD_APU, ACPU3_RESET, 3, 1)
+    FIELD(RST_FPD_APU, ACPU2_RESET, 2, 1)
+    FIELD(RST_FPD_APU, ACPU1_RESET, 1, 1)
+    FIELD(RST_FPD_APU, ACPU0_RESET, 0, 1)
+REG32(RST_DDR_SS, 0x108)
+    FIELD(RST_DDR_SS, DDR_RESET, 3, 1)
+    FIELD(RST_DDR_SS, APM_RESET, 2, 1)
+
+#define CRF_R_MAX (R_RST_DDR_SS + 1)
+
+struct XlnxZynqMPCRF {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+    qemu_irq irq_ir;
+
+    RegisterInfoArray *reg_array;
+    uint32_t regs[CRF_R_MAX];
+    RegisterInfo regs_info[CRF_R_MAX];
+};
+
+#endif
diff --git a/hw/misc/xlnx-zynqmp-crf.c b/hw/misc/xlnx-zynqmp-crf.c
new file mode 100644
index 0000000000..57bc8cf49a
--- /dev/null
+++ b/hw/misc/xlnx-zynqmp-crf.c
@@ -0,0 +1,266 @@
+/*
+ * QEMU model of the CRF - Clock Reset FPD.
+ *
+ * Copyright (c) 2022 Xilinx Inc.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "migration/vmstate.h"
+#include "hw/irq.h"
+#include "hw/misc/xlnx-zynqmp-crf.h"
+#include "target/arm/arm-powerctl.h"
+
+#ifndef XLNX_ZYNQMP_CRF_ERR_DEBUG
+#define XLNX_ZYNQMP_CRF_ERR_DEBUG 0
+#endif
+
+#define CRF_MAX_CPU    4
+
+static void ir_update_irq(XlnxZynqMPCRF *s)
+{
+    bool pending = s->regs[R_IR_STATUS] & ~s->regs[R_IR_MASK];
+    qemu_set_irq(s->irq_ir, pending);
+}
+
+static void ir_status_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPCRF *s = XLNX_ZYNQMP_CRF(reg->opaque);
+    ir_update_irq(s);
+}
+
+static uint64_t ir_enable_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPCRF *s = XLNX_ZYNQMP_CRF(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IR_MASK] &= ~val;
+    ir_update_irq(s);
+    return 0;
+}
+
+static uint64_t ir_disable_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPCRF *s = XLNX_ZYNQMP_CRF(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IR_MASK] |= val;
+    ir_update_irq(s);
+    return 0;
+}
+
+static uint64_t rst_fpd_apu_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPCRF *s = XLNX_ZYNQMP_CRF(reg->opaque);
+    uint32_t val = val64;
+    uint32_t val_old = s->regs[R_RST_FPD_APU];
+    unsigned int i;
+
+    for (i = 0; i < CRF_MAX_CPU; i++) {
+        uint32_t mask = (1 << (R_RST_FPD_APU_ACPU0_RESET_SHIFT + i));
+
+        if ((val ^ val_old) & mask) {
+            if (val & mask) {
+                arm_set_cpu_off(i);
+            } else {
+                arm_set_cpu_on_and_reset(i);
+            }
+        }
+    }
+    return val64;
+}
+
+static const RegisterAccessInfo crf_regs_info[] = {
+    {   .name = "ERR_CTRL",  .addr = A_ERR_CTRL,
+    },{ .name = "IR_STATUS",  .addr = A_IR_STATUS,
+        .w1c = 0x1,
+        .post_write = ir_status_postw,
+    },{ .name = "IR_MASK",  .addr = A_IR_MASK,
+        .reset = 0x1,
+        .ro = 0x1,
+    },{ .name = "IR_ENABLE",  .addr = A_IR_ENABLE,
+        .pre_write = ir_enable_prew,
+    },{ .name = "IR_DISABLE",  .addr = A_IR_DISABLE,
+        .pre_write = ir_disable_prew,
+    },{ .name = "CRF_WPROT",  .addr = A_CRF_WPROT,
+    },{ .name = "APLL_CTRL",  .addr = A_APLL_CTRL,
+        .reset = 0x12c09,
+        .rsvd = 0xf88c80f6,
+    },{ .name = "APLL_CFG",  .addr = A_APLL_CFG,
+        .rsvd = 0x1801210,
+    },{ .name = "APLL_FRAC_CFG",  .addr = A_APLL_FRAC_CFG,
+        .rsvd = 0x7e330000,
+    },{ .name = "DPLL_CTRL",  .addr = A_DPLL_CTRL,
+        .reset = 0x2c09,
+        .rsvd = 0xf88c80f6,
+    },{ .name = "DPLL_CFG",  .addr = A_DPLL_CFG,
+        .rsvd = 0x1801210,
+    },{ .name = "DPLL_FRAC_CFG",  .addr = A_DPLL_FRAC_CFG,
+        .rsvd = 0x7e330000,
+    },{ .name = "VPLL_CTRL",  .addr = A_VPLL_CTRL,
+        .reset = 0x12809,
+        .rsvd = 0xf88c80f6,
+    },{ .name = "VPLL_CFG",  .addr = A_VPLL_CFG,
+        .rsvd = 0x1801210,
+    },{ .name = "VPLL_FRAC_CFG",  .addr = A_VPLL_FRAC_CFG,
+        .rsvd = 0x7e330000,
+    },{ .name = "PLL_STATUS",  .addr = A_PLL_STATUS,
+        .reset = 0x3f,
+        .rsvd = 0xc0,
+        .ro = 0x3f,
+    },{ .name = "APLL_TO_LPD_CTRL",  .addr = A_APLL_TO_LPD_CTRL,
+        .reset = 0x400,
+        .rsvd = 0xc0ff,
+    },{ .name = "DPLL_TO_LPD_CTRL",  .addr = A_DPLL_TO_LPD_CTRL,
+        .reset = 0x400,
+        .rsvd = 0xc0ff,
+    },{ .name = "VPLL_TO_LPD_CTRL",  .addr = A_VPLL_TO_LPD_CTRL,
+        .reset = 0x400,
+        .rsvd = 0xc0ff,
+    },{ .name = "ACPU_CTRL",  .addr = A_ACPU_CTRL,
+        .reset = 0x3000400,
+        .rsvd = 0xfcffc0f8,
+    },{ .name = "DBG_TRACE_CTRL",  .addr = A_DBG_TRACE_CTRL,
+        .reset = 0x2500,
+        .rsvd = 0xfeffc0f8,
+    },{ .name = "DBG_FPD_CTRL",  .addr = A_DBG_FPD_CTRL,
+        .reset = 0x1002500,
+        .rsvd = 0xfeffc0f8,
+    },{ .name = "DP_VIDEO_REF_CTRL",  .addr = A_DP_VIDEO_REF_CTRL,
+        .reset = 0x1002300,
+        .rsvd = 0xfec0c0f8,
+    },{ .name = "DP_AUDIO_REF_CTRL",  .addr = A_DP_AUDIO_REF_CTRL,
+        .reset = 0x1032300,
+        .rsvd = 0xfec0c0f8,
+    },{ .name = "DP_STC_REF_CTRL",  .addr = A_DP_STC_REF_CTRL,
+        .reset = 0x1203200,
+        .rsvd = 0xfec0c0f8,
+    },{ .name = "DDR_CTRL",  .addr = A_DDR_CTRL,
+        .reset = 0x1000500,
+        .rsvd = 0xfeffc0f8,
+    },{ .name = "GPU_REF_CTRL",  .addr = A_GPU_REF_CTRL,
+        .reset = 0x1500,
+        .rsvd = 0xf8ffc0f8,
+    },{ .name = "SATA_REF_CTRL",  .addr = A_SATA_REF_CTRL,
+        .reset = 0x1001600,
+        .rsvd = 0xfeffc0f8,
+    },{ .name = "PCIE_REF_CTRL",  .addr = A_PCIE_REF_CTRL,
+        .reset = 0x1500,
+        .rsvd = 0xfeffc0f8,
+    },{ .name = "GDMA_REF_CTRL",  .addr = A_GDMA_REF_CTRL,
+        .reset = 0x1000500,
+        .rsvd = 0xfeffc0f8,
+    },{ .name = "DPDMA_REF_CTRL",  .addr = A_DPDMA_REF_CTRL,
+        .reset = 0x1000500,
+        .rsvd = 0xfeffc0f8,
+    },{ .name = "TOPSW_MAIN_CTRL",  .addr = A_TOPSW_MAIN_CTRL,
+        .reset = 0x1000400,
+        .rsvd = 0xfeffc0f8,
+    },{ .name = "TOPSW_LSBUS_CTRL",  .addr = A_TOPSW_LSBUS_CTRL,
+        .reset = 0x1000800,
+        .rsvd = 0xfeffc0f8,
+    },{ .name = "DBG_TSTMP_CTRL",  .addr = A_DBG_TSTMP_CTRL,
+        .reset = 0xa00,
+        .rsvd = 0xffffc0f8,
+    },
+    {   .name = "RST_FPD_TOP",  .addr = A_RST_FPD_TOP,
+        .reset = 0xf9ffe,
+        .rsvd = 0xf06001,
+    },{ .name = "RST_FPD_APU",  .addr = A_RST_FPD_APU,
+        .reset = 0x3d0f,
+        .rsvd = 0xc2f0,
+        .pre_write = rst_fpd_apu_prew,
+    },{ .name = "RST_DDR_SS",  .addr = A_RST_DDR_SS,
+        .reset = 0xf,
+        .rsvd = 0xf3,
+    }
+};
+
+static void crf_reset_enter(Object *obj, ResetType type)
+{
+    XlnxZynqMPCRF *s = XLNX_ZYNQMP_CRF(obj);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+}
+
+static void crf_reset_hold(Object *obj)
+{
+    XlnxZynqMPCRF *s = XLNX_ZYNQMP_CRF(obj);
+    ir_update_irq(s);
+}
+
+static const MemoryRegionOps crf_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void crf_init(Object *obj)
+{
+    XlnxZynqMPCRF *s = XLNX_ZYNQMP_CRF(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    s->reg_array =
+        register_init_block32(DEVICE(obj), crf_regs_info,
+                              ARRAY_SIZE(crf_regs_info),
+                              s->regs_info, s->regs,
+                              &crf_ops,
+                              XLNX_ZYNQMP_CRF_ERR_DEBUG,
+                              CRF_R_MAX * 4);
+    sysbus_init_mmio(sbd, &s->reg_array->mem);
+    sysbus_init_irq(sbd, &s->irq_ir);
+}
+
+static void crf_finalize(Object *obj)
+{
+    XlnxZynqMPCRF *s = XLNX_ZYNQMP_CRF(obj);
+    register_finalize_block(s->reg_array);
+}
+
+static const VMStateDescription vmstate_crf = {
+    .name = TYPE_XLNX_ZYNQMP_CRF,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxZynqMPCRF, CRF_R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void crf_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_crf;
+    rc->phases.enter = crf_reset_enter;
+    rc->phases.hold = crf_reset_hold;
+}
+
+static const TypeInfo crf_info = {
+    .name              = TYPE_XLNX_ZYNQMP_CRF,
+    .parent            = TYPE_SYS_BUS_DEVICE,
+    .instance_size     = sizeof(XlnxZynqMPCRF),
+    .class_init        = crf_class_init,
+    .instance_init     = crf_init,
+    .instance_finalize = crf_finalize,
+};
+
+static void crf_register_types(void)
+{
+    type_register_static(&crf_info);
+}
+
+type_init(crf_register_types)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 645585371a..61397f3bbb 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -84,6 +84,7 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
 ))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
+specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(
   'xlnx-versal-xramc.c',
   'xlnx-versal-pmc-iou-slcr.c',
-- 
2.25.1


