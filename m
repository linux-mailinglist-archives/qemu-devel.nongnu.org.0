Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39AB3EA8EC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 19:00:46 +0200 (CEST)
Received: from localhost ([::1]:37094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEE4T-00013C-MK
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 13:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxv-0007oB-BZ
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:53:59 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:39553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxm-00062q-K8
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:53:59 -0400
Received: by mail-qk1-x736.google.com with SMTP id y130so7371365qkb.6
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 09:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8+435bw22s57J4dB7dZnjVtq/PQBXSBTmGSwBfTw/2k=;
 b=wIaiMU5xhvrMbEEdCOGReohEZcUQ6e7bq04ZANSP8Tcwdj/sQ7Clq9oO9RLsnoKTjH
 DbLC41nlOFodS3byJ+cmfp5igIdDMLYincTmSWm5YeGwmoxfrWFrT8PIhx8zVLALtWkQ
 TnZhePRdQ6tgJe1w+cbJwsgXyeYQaopOBPfHrjU27wSTeYmYes/J6mdFrgEpQAlRbQM6
 sBBYQsynPjnrOf3RKbiDmXAmMjfWODqHHiylJkp3YeOtLpN/jjPAh0wdRjgr4Zm/ZpOu
 7XvpqQLXFDafP6y0MTpc4BdbyYzXNc9D6zeRroUKjSDWwsXwd7G/ehT3YuBC5gdX8vw/
 1Jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8+435bw22s57J4dB7dZnjVtq/PQBXSBTmGSwBfTw/2k=;
 b=JlOO6Vy0ZHtC0kGlNIOwvdvPJO4Lf25q9Pv1fQepOCPA454k7+UurEVWIKk6wVU4rf
 8/H8jsXV3LlN6CQTFutAIVTOxIMOJZ3G8MFMBm2/8UvMn3NAXkywYvzkXkiI2HtP4j7V
 nQGdmZCJt+e7xczejzb3PypC3UgFbBUH5o4qJ83mGvf7fQQQPITWMzxuTE439A4rkAUH
 ELpT+VRqk2BUpSUhlWhiZuhLShgv+ZdoPskWKMrJPWMK1X3D4pXNYe7OLKn4sO4pBHVi
 tiULKV1M+heefCQrKrzwZX28ipVM1IpWsbGlz7CVU6jU7kUecg9fDpTAQ5iy3CbsFfGB
 4thw==
X-Gm-Message-State: AOAM531pL+2PhPlIQhhsnj9FCXjZppTD3WFmIgyMyf/rRYLFXOOkILHC
 y4oXbiK7f5nJaIKbnobDYpeFJQ==
X-Google-Smtp-Source: ABdhPJw2Dqpdzja3T5IPIkvb1GWqY8lrF/XBlgHFzVRFgM/bUxkeLeOxNrsU/IcmQs8jAlg7ajZwXA==
X-Received: by 2002:a37:6514:: with SMTP id z20mr3837538qkb.23.1628787229560; 
 Thu, 12 Aug 2021 09:53:49 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id c69sm1714864qkg.1.2021.08.12.09.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 09:53:48 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v8 05/10] hw/intc: GICv3 ITS Feature enablement
Date: Thu, 12 Aug 2021 12:53:36 -0400
Message-Id: <20210812165341.40784-6-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812165341.40784-1-shashi.mallela@linaro.org>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added properties to enable ITS feature and define qemu system
address space memory in gicv3 common,setup distributor and
redistributor registers to indicate LPI support.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
---
 hw/intc/arm_gicv3_common.c         | 12 ++++++++++++
 hw/intc/arm_gicv3_dist.c           |  5 ++++-
 hw/intc/arm_gicv3_redist.c         | 12 +++++++++---
 hw/intc/gicv3_internal.h           |  2 ++
 include/hw/intc/arm_gicv3_common.h |  1 +
 5 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 58ef65f589..53dea2a775 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -345,6 +345,11 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->lpi_enable && !s->dma) {
+        error_setg(errp, "Redist-ITS: Guest 'sysmem' reference link not set");
+        return;
+    }
+
     s->cpu = g_new0(GICv3CPUState, s->num_cpu);
 
     for (i = 0; i < s->num_cpu; i++) {
@@ -381,6 +386,10 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
             (1 << 24) |
             (i << 8) |
             (last << 4);
+
+        if (s->lpi_enable) {
+            s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
+        }
     }
 }
 
@@ -494,9 +503,12 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", GICv3State, num_cpu, 1),
     DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
+    DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
     DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
                       redist_region_count, qdev_prop_uint32, uint32_t),
+    DEFINE_PROP_LINK("sysmem", GICv3State, dma, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index b65f56f903..43128b376d 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -371,7 +371,9 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
          * A3V == 1 (non-zero values of Affinity level 3 supported)
          * IDbits == 0xf (we support 16-bit interrupt identifiers)
          * DVIS == 0 (Direct virtual LPI injection not supported)
-         * LPIS == 0 (LPIs not supported)
+         * LPIS == 1 (LPIs are supported if affinity routing is enabled)
+         * num_LPIs == 0b00000 (bits [15:11],Number of LPIs as indicated
+         *                      by GICD_TYPER.IDbits)
          * MBIS == 0 (message-based SPIs not supported)
          * SecurityExtn == 1 if security extns supported
          * CPUNumber == 0 since for us ARE is always 1
@@ -386,6 +388,7 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
         bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
 
         *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
+            (s->lpi_enable << GICD_TYPER_LPIS_SHIFT) |
             (0xf << 19) | itlinesnumber;
         return MEMTX_OK;
     }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 53da703ed8..2108abfe9c 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -248,10 +248,16 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
     case GICR_CTLR:
         /* For our implementation, GICR_TYPER.DPGS is 0 and so all
          * the DPG bits are RAZ/WI. We don't do anything asynchronously,
-         * so UWP and RWP are RAZ/WI. And GICR_TYPER.LPIS is 0 (we don't
-         * implement LPIs) so Enable_LPIs is RES0. So there are no writable
-         * bits for us.
+         * so UWP and RWP are RAZ/WI. GICR_TYPER.LPIS is 1 (we
+         * implement LPIs) so Enable_LPIs is programmable.
          */
+        if (cs->gicr_typer & GICR_TYPER_PLPIS) {
+            if (value & GICR_CTLR_ENABLE_LPIS) {
+                cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
+            } else {
+                cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
+            }
+        }
         return MEMTX_OK;
     case GICR_STATUSR:
         /* RAZ/WI for our implementation */
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 1966444790..530d1c1789 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -68,6 +68,8 @@
 #define GICD_CTLR_E1NWF             (1U << 7)
 #define GICD_CTLR_RWP               (1U << 31)
 
+#define GICD_TYPER_LPIS_SHIFT          17
+
 /* 16 bits EventId */
 #define GICD_TYPER_IDBITS            0xf
 
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 0715b0bc2a..c1348cc60a 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -221,6 +221,7 @@ struct GICv3State {
     uint32_t num_cpu;
     uint32_t num_irq;
     uint32_t revision;
+    bool lpi_enable;
     bool security_extn;
     bool irq_reset_nonsecure;
     bool gicd_no_migration_shift_bug;
-- 
2.27.0


