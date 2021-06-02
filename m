Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D528839922C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 20:06:42 +0200 (CEST)
Received: from localhost ([::1]:58122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loVGL-0003Ll-UO
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 14:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAm-0008JH-QR
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:00:56 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:35448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAg-0006bD-LS
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:00:56 -0400
Received: by mail-qt1-x82c.google.com with SMTP id k19so2490907qta.2
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 11:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2woulWYT3uxpqpn2RvNQKT7M1BLZsu895mqto08io6A=;
 b=iSyDZHHAYPQybL0QqU9eNxqujJ6n6kbB8aKa9ITV7Jw8DndD3RRJVSoKfvm9TiV/AE
 sY36r/uk52zn3YRyFzPENImX/jlSL6npcb2jD3gxdGIo4QRvglrEHX8UQ0YDgXKrAn39
 pj9oBL/BJsKs52036f3QDlPGiJ/D0/Lk2bXuI80d/8GNgWLnwGLlgo8bB3LrtPfXSmTE
 6pFu0/VI5ES8x7zDtF5YEIio6NzhtbJ+DrJAXSIGnqcO42yjP/CGm2U1GybhUbF+gFx6
 QjkiBd8pYJfGmJj9qRsDE+mRuAW67cpPFTCUBUx0xMG4VxdAD2WvGrK3dOXEDLdH6Vcp
 HfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2woulWYT3uxpqpn2RvNQKT7M1BLZsu895mqto08io6A=;
 b=UIyokApc3fb1TJlHkiZx1P+rzsjg6YNCSujmVR9yyNieU91XL4OZzvlmhFXMJOa5wV
 LZ2OJwjOC+lToh1yr1kDi0Np6/QMZBwn4D5BKNPAgd2c50satlx+qInVmaccw5fwXwuL
 lAzEjUbyOCrjcBdGM85tO/ouDkQ4Q2VagBXrQ2HuW3A/YuGxuZWMLOwv24YmFdJn+yjV
 pJaVYF1yfIrNvaxdClLGhQu1L7276BdJjENoxCq2onqrnfsxdzo+4pvx4nfbv1bHdSrS
 agUilvK67aQiXXl2jQ9bPlAVoXmNJ5S9Z2qFxbjUU6OZpODIUbKUKxfK17rk7Xf88vBC
 uAMg==
X-Gm-Message-State: AOAM533YQa0eg8QPt69GcXrH8j7sLqm2xsWrQQ1C+QkvFh37qOPI01CI
 j/VU3h2at5N2V6vFqAbpvwwp2Q==
X-Google-Smtp-Source: ABdhPJzGfkezs3Pc1xxjJMmREdPHcz03/w5gvQmJPLawlnPD3i8N/W+Hd/pYKRLprvyOj86dTfx2yA==
X-Received: by 2002:aed:210f:: with SMTP id 15mr25937223qtc.149.1622656848515; 
 Wed, 02 Jun 2021 11:00:48 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.googlemail.com with ESMTPSA id 97sm273044qte.20.2021.06.02.11.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:00:48 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v4 5/8] hw/intc: GICv3 ITS Feature enablement
Date: Wed,  2 Jun 2021 14:00:39 -0400
Message-Id: <20210602180042.111347-6-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210602180042.111347-1-shashi.mallela@linaro.org>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x82c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added properties to enable ITS feature and define qemu system
address space memory in gicv3 common,setup distributor and
redistributor registers to indicate LPI support.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_common.c         | 12 ++++++++++++
 hw/intc/arm_gicv3_dist.c           |  7 +++++--
 hw/intc/arm_gicv3_its.c            |  9 ++++++++-
 hw/intc/arm_gicv3_redist.c         | 14 +++++++++++---
 hw/intc/gicv3_internal.h           | 17 +++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 6 files changed, 54 insertions(+), 6 deletions(-)

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
index b65f56f903..7e57654061 100644
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
@@ -386,7 +388,8 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
         bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
 
         *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
-            (0xf << 19) | itlinesnumber;
+            (s->lpi_enable << GICD_TYPER_LPIS_OFFSET) |
+            (GICD_TYPER_IDBITS << GICD_TYPER_IDBITS_OFFSET) | itlinesnumber;
         return MEMTX_OK;
     }
     case GICD_IIDR:
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 82bb5b84ef..0a978cf55b 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -294,6 +294,7 @@ static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
     uint64_t itel = 0;
     uint32_t iteh = 0;
     uint32_t int_spurious = INTID_SPURIOUS;
+    uint64_t idbits;
 
     devid = (value >> DEVID_SHIFT) & DEVID_MASK;
     offset += NUM_BYTES_IN_DW;
@@ -330,7 +331,13 @@ static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
     max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
 
     if (!ignore_pInt) {
-        max_Intid = (1UL << (FIELD_EX64(s->typer, GITS_TYPER, IDBITS) + 1));
+        idbits = MIN(FIELD_EX64(s->gicv3->cpu->gicr_propbaser, GICR_PROPBASER,
+                                IDBITS), GICD_TYPER_IDBITS);
+
+        if (idbits < GICR_PROPBASER_IDBITS_THRESHOLD) {
+            return res;
+        }
+        max_Intid = (1ULL << (idbits + 1));
     }
 
     if ((devid > s->dt.max_devids) || (icid > s->ct.max_collids) ||
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8645220d61..fb9a4ee3cc 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -244,14 +244,21 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
 static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
                                uint64_t value, MemTxAttrs attrs)
 {
+
     switch (offset) {
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
@@ -395,6 +402,7 @@ static MemTxResult gicr_readll(GICv3CPUState *cs, hwaddr offset,
 static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
                                 uint64_t value, MemTxAttrs attrs)
 {
+
     switch (offset) {
     case GICR_PROPBASER:
         cs->gicr_propbaser = value;
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index ce45cd0ef6..91dbe01176 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -68,6 +68,9 @@
 #define GICD_CTLR_E1NWF             (1U << 7)
 #define GICD_CTLR_RWP               (1U << 31)
 
+#define GICD_TYPER_LPIS_OFFSET         17
+#define GICD_TYPER_IDBITS_OFFSET       19
+#define GICD_TYPER_IDBITS_MASK       0x1f
 /* 16 bits EventId */
 #define GICD_TYPER_IDBITS            0xf
 
@@ -126,6 +129,20 @@
 #define GICR_WAKER_ProcessorSleep    (1U << 1)
 #define GICR_WAKER_ChildrenAsleep    (1U << 2)
 
+FIELD(GICR_PROPBASER, IDBITS, 0, 5)
+FIELD(GICR_PROPBASER, INNERCACHE, 7, 3)
+FIELD(GICR_PROPBASER, SHAREABILITY, 10, 2)
+FIELD(GICR_PROPBASER, PHYADDR, 12, 40)
+FIELD(GICR_PROPBASER, OUTERCACHE, 56, 3)
+
+#define GICR_PROPBASER_IDBITS_THRESHOLD          0xd
+
+FIELD(GICR_PENDBASER, INNERCACHE, 7, 3)
+FIELD(GICR_PENDBASER, SHAREABILITY, 10, 2)
+FIELD(GICR_PENDBASER, PHYADDR, 16, 36)
+FIELD(GICR_PENDBASER, OUTERCACHE, 56, 3)
+FIELD(GICR_PENDBASER, PTZ, 62, 1)
+
 #define ICC_CTLR_EL1_CBPR           (1U << 0)
 #define ICC_CTLR_EL1_EOIMODE        (1U << 1)
 #define ICC_CTLR_EL1_PMHE           (1U << 6)
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


