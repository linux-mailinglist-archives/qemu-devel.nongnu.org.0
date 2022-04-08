Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36964F9865
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:41:50 +0200 (CEST)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpo6-0007SD-2k
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPb-0007NJ-7g
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPY-0002Ta-Jd
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b19so13039372wrh.11
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9WO0uuchbjE/iukCWaKI+CQ8T+7VqjTELcpt1RFvvfs=;
 b=wT5Qr6RXNiGMcMd3kycgPo20bufw8wEJXfnNmrGO6rjoEW5K6ckTMkmLtIjywC1Ql/
 MJafSkZ26R2jziidbMp8UhSSZ9d/WHHt15QlLTD5Lf+eHSMb9N3VpB4Ii6JMwxg3JAFS
 kP6d8p3b2xhis+A7mZx1YMKt0DStuacMSExNExVYhnYxfeeuGMAPOUpqwQoPWzPMFPJ+
 Aq4dyEfAtdZjbp5tU8xAccwVBKIMJBEVbo0QI39bls8TuyiGWxdOSxfT/ikGIrKEHoLJ
 bBG2OIZ3vkArTi9mPvddEEE5Ofg4KPKdSTWs8jBiq2oxQ8gps51truFaOSeQLwaks3KN
 6XUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9WO0uuchbjE/iukCWaKI+CQ8T+7VqjTELcpt1RFvvfs=;
 b=Su9HUZtsfzBVBiaUXRHi3XVeqRyTTYtk2JEA49SAhZFEhnmtY4lgDs0x0X/SBC7Elb
 ZaRSxppK882pVkur0U9WCG0KOhMUXHHcL3Bc43XhTK7APL7un/n0s4aVW4wZquCzZFyR
 72KGTvLGKq06vKPVw4x2fWzX7W5P/t51Ev7Su/7H/bsiwafMyjhRewUDZU3PJYLwt70i
 VksHrszkuZJGm5fpfdkorV6ZsJA37WdkT3j/f6NCmKlZg9sg44GhjHtNxaQFw7e0zLl3
 zbF4HTNADB03tcPsg5rlRPD2Re/j6Zw/HuoUT6uzyoVx2G7otKbrRcobIknsLP0Vfm1x
 iJxg==
X-Gm-Message-State: AOAM532jBQwByQFFBDdvnWHleiwPi80jJfoPAxzim+wlGKDViCSfPBtV
 VePIhivNi4JNVlkjVhf3WNDlRw==
X-Google-Smtp-Source: ABdhPJz1cb/ViU+1iM5l+1roVBMHBDuz93c0eB7NobJvIliidIjT80lQObzEQultSqqS6DK+vu6b5w==
X-Received: by 2002:a05:6000:156a:b0:204:1fb0:47e with SMTP id
 10-20020a056000156a00b002041fb0047emr15013024wrz.590.1649427387282; 
 Fri, 08 Apr 2022 07:16:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 37/41] hw/intc/arm_gicv3: Update ID and feature registers for
 GICv4
Date: Fri,  8 Apr 2022 15:15:46 +0100
Message-Id: <20220408141550.1271295-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the various GIC ID and feature registers for GICv4:
 * PIDR2 [7:4] is the GIC architecture revision
 * GICD_TYPER.DVIS is 1 to indicate direct vLPI injection support
 * GICR_TYPER.VLPIS is 1 to indicate redistributor support for vLPIs
 * GITS_TYPER.VIRTUAL is 1 to indicate vLPI support
 * GITS_TYPER.VMOVP is 1 to indicate that our VMOVP implementation
   handles cross-ITS synchronization for the guest
 * ICH_VTR_EL2.nV4 is 0 to indicate direct vLPI injection support

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h   | 15 +++++++++++----
 hw/intc/arm_gicv3_common.c |  7 +++++--
 hw/intc/arm_gicv3_cpuif.c  |  6 +++++-
 hw/intc/arm_gicv3_dist.c   |  7 ++++---
 hw/intc/arm_gicv3_its.c    |  7 ++++++-
 hw/intc/arm_gicv3_redist.c |  2 +-
 6 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 07644b2be6f..0bf68452395 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -309,6 +309,7 @@ FIELD(GITS_TYPER, SEIS, 18, 1)
 FIELD(GITS_TYPER, PTA, 19, 1)
 FIELD(GITS_TYPER, CIDBITS, 32, 4)
 FIELD(GITS_TYPER, CIL, 36, 1)
+FIELD(GITS_TYPER, VMOVP, 37, 1)
 
 #define GITS_IDREGS           0xFFD0
 
@@ -747,23 +748,29 @@ static inline uint32_t gicv3_iidr(void)
 #define GICV3_PIDR0_REDIST 0x93
 #define GICV3_PIDR0_ITS 0x94
 
-static inline uint32_t gicv3_idreg(int regoffset, uint8_t pidr0)
+static inline uint32_t gicv3_idreg(GICv3State *s, int regoffset, uint8_t pidr0)
 {
     /* Return the value of the CoreSight ID register at the specified
      * offset from the first ID register (as found in the distributor
      * and redistributor register banks).
-     * These values indicate an ARM implementation of a GICv3.
+     * These values indicate an ARM implementation of a GICv3 or v4.
      */
     static const uint8_t gicd_ids[] = {
-        0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x3B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
+        0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x0B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
     };
+    uint32_t id;
 
     regoffset /= 4;
 
     if (regoffset == 4) {
         return pidr0;
     }
-    return gicd_ids[regoffset];
+    id = gicd_ids[regoffset];
+    if (regoffset == 6) {
+        /* PIDR2 bits [7:4] are the GIC architecture revision */
+        id |= s->revision << 4;
+    }
+    return id;
 }
 
 /**
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 3f47b3501fe..181f342f32c 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -406,8 +406,8 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
          *  Last == 1 if this is the last redistributor in a series of
          *            contiguous redistributor pages
          *  DirectLPI == 0 (direct injection of LPIs not supported)
-         *  VLPIS == 0 (virtual LPIs not supported)
-         *  PLPIS == 0 (physical LPIs not supported)
+         *  VLPIS == 1 if vLPIs supported (GICv4 and up)
+         *  PLPIS == 1 if LPIs supported
          */
         cpu_affid = object_property_get_uint(OBJECT(cpu), "mp-affinity", NULL);
 
@@ -422,6 +422,9 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
 
         if (s->lpi_enable) {
             s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
+            if (s->revision > 3) {
+                s->cpu[i].gicr_typer |= GICR_TYPER_VLPIS;
+            }
         }
     }
 
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index d627ddac90f..8404f46ee0b 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2578,11 +2578,15 @@ static uint64_t ich_vtr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     uint64_t value;
 
     value = ((cs->num_list_regs - 1) << ICH_VTR_EL2_LISTREGS_SHIFT)
-        | ICH_VTR_EL2_TDS | ICH_VTR_EL2_NV4 | ICH_VTR_EL2_A3V
+        | ICH_VTR_EL2_TDS | ICH_VTR_EL2_A3V
         | (1 << ICH_VTR_EL2_IDBITS_SHIFT)
         | ((cs->vprebits - 1) << ICH_VTR_EL2_PREBITS_SHIFT)
         | ((cs->vpribits - 1) << ICH_VTR_EL2_PRIBITS_SHIFT);
 
+    if (cs->gic->revision < 4) {
+        value |= ICH_VTR_EL2_NV4;
+    }
+
     trace_gicv3_ich_vtr_read(gicv3_redist_affid(cs), value);
     return value;
 }
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 7f6275363ea..b9ed955e36b 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -383,7 +383,7 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
          * No1N == 1 (1-of-N SPI interrupts not supported)
          * A3V == 1 (non-zero values of Affinity level 3 supported)
          * IDbits == 0xf (we support 16-bit interrupt identifiers)
-         * DVIS == 0 (Direct virtual LPI injection not supported)
+         * DVIS == 1 (Direct virtual LPI injection supported) if GICv4
          * LPIS == 1 (LPIs are supported if affinity routing is enabled)
          * num_LPIs == 0b00000 (bits [15:11],Number of LPIs as indicated
          *                      by GICD_TYPER.IDbits)
@@ -399,8 +399,9 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
          * so we only need to check the DS bit.
          */
         bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
+        bool dvis = s->revision >= 4;
 
-        *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
+        *data = (1 << 25) | (1 << 24) | (dvis << 18) | (sec_extn << 10) |
             (s->lpi_enable << GICD_TYPER_LPIS_SHIFT) |
             (0xf << 19) | itlinesnumber;
         return true;
@@ -557,7 +558,7 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
     }
     case GICD_IDREGS ... GICD_IDREGS + 0x2f:
         /* ID registers */
-        *data = gicv3_idreg(offset - GICD_IDREGS, GICV3_PIDR0_DIST);
+        *data = gicv3_idreg(s, offset - GICD_IDREGS, GICV3_PIDR0_DIST);
         return true;
     case GICD_SGIR:
         /* WO registers, return unknown value */
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6c44cccd369..56f43faafd4 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1699,7 +1699,7 @@ static bool its_readl(GICv3ITSState *s, hwaddr offset,
         break;
     case GITS_IDREGS ... GITS_IDREGS + 0x2f:
         /* ID registers */
-        *data = gicv3_idreg(offset - GITS_IDREGS, GICV3_PIDR0_ITS);
+        *data = gicv3_idreg(s->gicv3, offset - GITS_IDREGS, GICV3_PIDR0_ITS);
         break;
     case GITS_TYPER:
         *data = extract64(s->typer, 0, 32);
@@ -1946,6 +1946,11 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, DEVBITS, ITS_DEVBITS);
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIL, 1);
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIDBITS, ITS_CIDBITS);
+    if (s->gicv3->revision >= 4) {
+        /* Our VMOVP handles cross-ITS synchronization itself */
+        s->typer = FIELD_DP64(s->typer, GITS_TYPER, VMOVP, 1);
+        s->typer = FIELD_DP64(s->typer, GITS_TYPER, VIRTUAL, 1);
+    }
 }
 
 static void gicv3_its_reset(DeviceState *dev)
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 0738d3822d1..82dab296456 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -441,7 +441,7 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
         *data = cs->gicr_nsacr;
         return MEMTX_OK;
     case GICR_IDREGS ... GICR_IDREGS + 0x2f:
-        *data = gicv3_idreg(offset - GICR_IDREGS, GICV3_PIDR0_REDIST);
+        *data = gicv3_idreg(cs->gic, offset - GICR_IDREGS, GICV3_PIDR0_REDIST);
         return MEMTX_OK;
         /*
          * VLPI frame registers. We don't need a version check for
-- 
2.25.1


