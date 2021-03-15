Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A0133C291
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:55:13 +0100 (CET)
Received: from localhost ([::1]:47226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqUq-0002Vx-37
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lLqPd-0007kA-4m
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:49:49 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:34232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lLqPR-0005AV-Jb
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:49:48 -0400
Received: by mail-qk1-x72d.google.com with SMTP id t4so32352482qkp.1
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9CHtq6Li1b1vOqUuLIROp5KukLwycLCMDzo00TyT/uo=;
 b=euJ8/kVyBmVEvNdwb0vwXiiSWyB26WLw2Q89CS6nn3hHGyQZGMFPBg0cvrEXIvUEOL
 wj/0yWEByxysmraEKlxRbScFR8MExIcO0XE1u9YVyKHTeP+ygsAw7WzTEv+rx31d5gSy
 6lD2PFSs4Wpp1yP2Yskg3yPRDZ1sZcelEMQdVHPIwpTgn1ViM1k36l6rLfERAx4O1WYV
 BdT23CMQ8uuue4Al4WRaeXB5iTIFgBq29QGea8pC58Ivtpe+tSuKc2kK8etM0oEtqAM+
 wjYveLeO8hLgYF924ph9o5+L7yuNSvvfG4qHHEY1s4/qK9kB1urOQ6cyHK298gsjZuPG
 gntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9CHtq6Li1b1vOqUuLIROp5KukLwycLCMDzo00TyT/uo=;
 b=s6heU1eoWrybt+yyDurdYx0mLwxlUccZNzVNwtSiityWrWIN3I8/C/6rrycQOqC69d
 dYh2o9b2YVO7rPANQUG32eeciPY2x2v/m0FOBJAceFqNNFk1eyzfkNuHx5h1oQKRuxib
 +1jEKQmhUdR2zrVYlpgbhe/Yf/Toa3r5ADJte5v4Fh1eZllrQFPf5fqyNqen9Pn10KHO
 bCGKWhta5j+W/vyinYEefP3hjVJ5D4Rovk3Bj4qW4vcVZrguo+uND+VKxjd/SgF/P/e+
 jxQiKw7hQzk9rGkrNx2UEcPTsMl63ibBR6NAivjqdm51GFefL6b1qwXhQSxRqJZes3j+
 /z1A==
X-Gm-Message-State: AOAM531ljm/9TRofPZELUYplSKkKn3TRG1YHh6mXZgvW7reeeMhFaw6H
 cqXSdvlTmdnKE79ETtTCFklJ6A==
X-Google-Smtp-Source: ABdhPJwsp6rqLgjy2CT+ZEsYB7LE8mnH/y43IypRs+r48NdRIJQEbe3BPsoagblwxZkzEyTix6d5mQ==
X-Received: by 2002:a37:85c3:: with SMTP id
 h186mr26885955qkd.217.1615826972664; 
 Mon, 15 Mar 2021 09:49:32 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-187.dsl.bell.ca. [174.92.28.187])
 by smtp.googlemail.com with ESMTPSA id s6sm1824824qke.44.2021.03.15.09.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:49:32 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH 1/2] hw/intc: GICv3 ITS implementation
Date: Mon, 15 Mar 2021 12:49:30 -0400
Message-Id: <20210315164931.23477-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72d.google.com
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

Implementation of Interrupt Translation Service which allows eventid
from devices to be translated to physical LPI IntIds.Extended the
redistributor functionality to process LPI Interrupts as well.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3.c                    |    6 +
 hw/intc/arm_gicv3_common.c             |   20 +-
 hw/intc/arm_gicv3_cpuif.c              |   15 +-
 hw/intc/arm_gicv3_dist.c               |   22 +-
 hw/intc/arm_gicv3_its.c                | 1386 ++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |   17 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  163 ++-
 hw/intc/gicv3_internal.h               |  169 ++-
 hw/intc/meson.build                    |    1 +
 include/hw/intc/arm_gicv3_common.h     |   13 +
 include/hw/intc/arm_gicv3_its_common.h |   12 +-
 12 files changed, 1807 insertions(+), 19 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 66eaa97198..c974ab8bb2 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -166,6 +166,12 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
         cs->hppi.grp = gicv3_irq_group(cs->gic, cs, cs->hppi.irq);
     }
 
+    if (cs->gic->lpi_enable) {
+        if(gicv3_redist_update_lpi(cs)) {
+            seenbetter = true;
+        }
+    }
+
     /* If the best interrupt we just found would preempt whatever
      * was the previous best interrupt before this update, then
      * we know it's definitely the best one now.
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 58ef65f589..924d18019a 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -156,6 +156,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
         VMSTATE_UINT32(gicr_waker, GICv3CPUState),
         VMSTATE_UINT64(gicr_propbaser, GICv3CPUState),
         VMSTATE_UINT64(gicr_pendbaser, GICv3CPUState),
+        VMSTATE_BOOL(lpi_outofrange, GICv3CPUState),
         VMSTATE_UINT32(gicr_igroupr0, GICv3CPUState),
         VMSTATE_UINT32(gicr_ienabler0, GICv3CPUState),
         VMSTATE_UINT32(gicr_ipendr0, GICv3CPUState),
@@ -227,6 +228,7 @@ static const VMStateDescription vmstate_gicv3 = {
     .priority = MIG_PRI_GICV3,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(gicd_ctlr, GICv3State),
+        VMSTATE_UINT32(gicd_typer, GICv3State),
         VMSTATE_UINT32_ARRAY(gicd_statusr, GICv3State, 2),
         VMSTATE_UINT32_ARRAY(group, GICv3State, GICV3_BMP_SIZE),
         VMSTATE_UINT32_ARRAY(grpmod, GICv3State, GICV3_BMP_SIZE),
@@ -320,7 +322,7 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (s->num_irq > GICV3_MAXIRQ) {
+    if ((s->num_irq > GICV3_MAXIRQ) && !s->lpi_enable) {
         error_setg(errp,
                    "requested %u interrupt lines exceeds GIC maximum %d",
                    s->num_irq, GICV3_MAXIRQ);
@@ -338,7 +340,7 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
      * so we don't have to deal with bitfields where only some of the
      * bits in a 32-bit word should be valid.
      */
-    if (s->num_irq % 32) {
+    if ((s->num_irq % 32) && !s->lpi_enable) {
         error_setg(errp,
                    "%d interrupt lines unsupported: not divisible by 32",
                    s->num_irq);
@@ -381,6 +383,16 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
             (1 << 24) |
             (i << 8) |
             (last << 4);
+
+        if (s->lpi_enable) {
+            s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
+
+            if (!s->sysmem) {
+                error_setg(errp,
+                    "Redist-ITS: Guest 'sysmem' reference link not set");
+                return;
+            }
+        }
     }
 }
 
@@ -406,6 +418,7 @@ static void arm_gicv3_common_reset(DeviceState *dev)
         cs->gicr_waker = GICR_WAKER_ProcessorSleep | GICR_WAKER_ChildrenAsleep;
         cs->gicr_propbaser = 0;
         cs->gicr_pendbaser = 0;
+        cs->lpi_outofrange = false;
         /* If we're resetting a TZ-aware GIC as if secure firmware
          * had set it up ready to start a kernel in non-secure, we
          * need to set interrupts to group 1 so the kernel can use them.
@@ -494,9 +507,12 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", GICv3State, num_cpu, 1),
     DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
+    DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
     DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
                       redist_region_count, qdev_prop_uint32, uint32_t),
+    DEFINE_PROP_LINK("sysmem", GICv3State, sysmem, TYPE_MEMORY_REGION,
+		    MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 43ef1d7a84..416b1ff6d9 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -899,9 +899,14 @@ static void icc_activate_irq(GICv3CPUState *cs, int irq)
         cs->gicr_ipendr0 = deposit32(cs->gicr_ipendr0, irq, 1, 0);
         gicv3_redist_update(cs);
     } else {
-        gicv3_gicd_active_set(cs->gic, irq);
-        gicv3_gicd_pending_clear(cs->gic, irq);
-        gicv3_update(cs->gic, irq, 1);
+        if (irq >= GICV3_LPI_INTID_START) {
+            gicv3_redist_lpi_pending(cs, irq, 0);
+            gicv3_redist_update(cs);
+	} else {
+            gicv3_gicd_active_set(cs->gic, irq);
+            gicv3_gicd_pending_clear(cs->gic, irq);
+            gicv3_update(cs->gic, irq, 1);
+        }
     }
 }
 
@@ -1337,7 +1342,9 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
          * valid interrupt value read from the Interrupt Acknowledge
          * register" and so this is UNPREDICTABLE. We choose to ignore it.
          */
-        return;
+        if (!(cs->gic->lpi_enable && (irq >= GICV3_LPI_INTID_START))) {
+            return;
+        }
     }
 
     if (icc_highest_active_group(cs) != grp) {
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index b65f56f903..229fe7541d 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -366,12 +366,15 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
         return MEMTX_OK;
     case GICD_TYPER:
     {
+        bool lpi_supported = false;
         /* For this implementation:
          * No1N == 1 (1-of-N SPI interrupts not supported)
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
@@ -385,8 +388,23 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
          */
         bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
 
+        /*
+         * With securityextn on,LPIs are supported when affinity routing
+         * is enabled for non-secure state and if off LPIs are supported
+         * when affinity routing is enabled.
+         */
+        if(s->lpi_enable) {
+            if(sec_extn) {
+                lpi_supported = (s->gicd_ctlr & GICD_CTLR_ARE_NS);
+            } else {
+                lpi_supported = (s->gicd_ctlr & GICD_CTLR_ARE);
+            }
+        }
+
         *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
-            (0xf << 19) | itlinesnumber;
+            (lpi_supported << GICD_TYPER_LPIS_OFFSET) | (GICD_TYPER_IDBITS <<
+            GICD_TYPER_IDBITS_OFFSET) | itlinesnumber;
+        s->gicd_typer = *data;
         return MEMTX_OK;
     }
     case GICD_IIDR:
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
new file mode 100644
index 0000000000..da930803a4
--- /dev/null
+++ b/hw/intc/arm_gicv3_its.c
@@ -0,0 +1,1386 @@
+/*
+ * ITS emulation for a GICv3-based system
+ *
+ * Copyright Linaro.org 2021
+ *
+ * Authors:
+ *  Shashi Mallela <shashi.mallela@linaro.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at your
+ * option) any later version.  See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/qdev-properties.h"
+#include "hw/intc/arm_gicv3_its_common.h"
+#include "gicv3_internal.h"
+#include "qom/object.h"
+
+typedef struct GICv3ITSClass GICv3ITSClass;
+/* This is reusing the GICv3ITSState typedef from ARM_GICV3_ITS_COMMON */
+DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
+                     ARM_GICV3_ITS, TYPE_ARM_GICV3_ITS)
+
+typedef struct {
+    bool valid;
+    bool indirect;
+    uint16_t entry_sz;
+    uint32_t max_entries;
+    uint32_t max_devids;
+    uint64_t base_addr;
+} DevTableDesc;
+
+typedef struct {
+    bool valid;
+    bool indirect;
+    uint16_t entry_sz;
+    uint32_t max_entries;
+    uint32_t max_collids;
+    uint64_t base_addr;
+} CollTableDesc;
+
+typedef struct {
+    bool valid;
+    uint32_t max_entries;
+    uint64_t base_addr;
+} CmdQDesc;
+
+struct GICv3ITSClass {
+    GICv3ITSCommonClass parent_class;
+    void (*parent_reset)(DeviceState *dev);
+
+    DevTableDesc  dt;
+    CollTableDesc ct;
+    CmdQDesc      cq;
+};
+
+typedef enum ItsCmdType {
+    NONE = 0, /* internal indication for GITS_TRANSLATER write */
+    CLEAR = 1,
+    DISCARD = 2,
+    INT = 3,
+} ItsCmdType;
+
+static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte) {
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint8_t  page_sz_type;
+    uint64_t l2t_addr;
+    uint64_t value;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t page_sz = 0;
+    uint32_t max_l2_entries;
+    bool status = false;
+
+    if(c->ct.indirect) {
+        /* 2 level table */
+        page_sz_type = (s->baser[0] >>
+                        GITS_BASER_PAGESIZE_OFFSET) &
+                        GITS_BASER_PAGESIZE_MASK;
+
+        if (page_sz_type == 0) {
+            page_sz = GITS_ITT_PAGE_SIZE_0;
+        } else if (page_sz_type == 1) {
+            page_sz = GITS_ITT_PAGE_SIZE_1;
+        } if (page_sz_type == 2) {
+            page_sz = GITS_ITT_PAGE_SIZE_2;
+        }
+
+        l2t_id = icid / (page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     c->ct.base_addr + l2t_id,
+                                     MEMTXATTRS_UNSPECIFIED, NULL);
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = page_sz / c->ct.entry_sz;
+
+            l2t_addr = (value >> page_sz_type) &
+                        ((1ULL << (51-page_sz_type))-1);
+
+            address_space_read(as, l2t_addr +
+                                 (icid % max_l2_entries),
+                                 MEMTXATTRS_UNSPECIFIED,
+                                 cte, sizeof(*cte));
+       }
+    } else {
+        /* Flat level table */
+        address_space_read(as,c->ct.base_addr + icid,
+                            MEMTXATTRS_UNSPECIFIED, cte,
+                            sizeof(*cte));
+    }
+
+    if (*cte & VALID_MASK) {
+        status = true;
+    }
+
+    return status;
+}
+
+static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
+        uint16_t *icid, uint32_t *pIntid) {
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint8_t buff[GITS_TYPER_ITT_ENTRY_SIZE];
+    uint64_t itt_addr;
+    bool status = false;
+
+    itt_addr = (dte >> 2ULL) & ITTADDR_MASK;
+    itt_addr <<= ITTADDR_OFFSET; /* 256 byte aligned */
+
+    address_space_read(as, itt_addr + eventid,
+                MEMTXATTRS_UNSPECIFIED, &buff,
+                sizeof(buff));
+
+    if (buff[0] & VALID_MASK) {
+        if ((buff[0] >> 1U) & GITS_TYPER_PHYSICAL) {
+            memcpy(&pIntid, &buff[1], 3);
+            memcpy(icid, &buff[7], sizeof(*icid));
+            status = true;
+        }
+    }
+
+    return status;
+}
+
+static bool get_dte(GICv3ITSState *s, uint32_t devid, uint64_t *dte) {
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint8_t  page_sz_type;
+    uint64_t l2t_addr;
+    uint64_t value;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t page_sz = 0;
+    uint32_t max_l2_entries;
+    bool status = false;
+
+    if(c->ct.indirect) {
+        /* 2 level table */
+        page_sz_type = (s->baser[0] >>
+                        GITS_BASER_PAGESIZE_OFFSET) &
+                        GITS_BASER_PAGESIZE_MASK;
+
+        if (page_sz_type == 0) {
+            page_sz = GITS_ITT_PAGE_SIZE_0;
+        } else if (page_sz_type == 1) {
+            page_sz = GITS_ITT_PAGE_SIZE_1;
+        } if (page_sz_type == 2) {
+            page_sz = GITS_ITT_PAGE_SIZE_2;
+        }
+
+        l2t_id = devid / (page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     c->dt.base_addr + l2t_id,
+                                     MEMTXATTRS_UNSPECIFIED, NULL);
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = page_sz / c->dt.entry_sz;
+
+            l2t_addr = (value >> page_sz_type) &
+                        ((1ULL << (51-page_sz_type))-1);
+
+            address_space_read(as, l2t_addr +
+                                 (devid % max_l2_entries),
+                                 MEMTXATTRS_UNSPECIFIED,
+                                 dte, sizeof(*dte));
+        }
+    } else {
+        /* Flat level table */
+        address_space_read(as,c->dt.base_addr + devid,
+                            MEMTXATTRS_UNSPECIFIED, dte,
+                            sizeof(*dte));
+    }
+
+    if (*dte & VALID_MASK) {
+        status = true;
+    }
+    return status;
+}
+
+static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset) {
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint64_t rdbase;
+    uint64_t value;
+    bool pta = false;
+    MemTxResult res = MEMTX_OK;
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    value = address_space_ldq_le(as, c->cq.base_addr + offset,
+                                     MEMTXATTRS_UNSPECIFIED, &res);
+
+    if ((s->typer >> GITS_TYPER_PTA_OFFSET) & GITS_TYPER_PTA_MASK) {
+        /* only bits[47:16] are considered instead of bits [51:16]
+         * since with a physical address the target address must be
+         * 64KB aligned
+         */
+        rdbase = (value >> RDBASE_OFFSET) & RDBASE_MASK;
+        pta = true;
+    } else {
+        rdbase = (value >> RDBASE_OFFSET) & RDBASE_PROCNUM_MASK;
+    }
+
+    if (!pta && (rdbase < (s->gicv3->num_cpu))) {
+        /*
+         * Current implementation makes a blocking synchronous call
+         * for every command issued earlier,hence the internal state
+         * is already consistent by the time SYNC command is executed.
+         */
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    return res;
+}
+
+static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
+                                    uint32_t offset, ItsCmdType cmd) {
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint32_t devid,eventid;
+    MemTxResult res = MEMTX_OK;
+    bool dte_valid;
+    uint64_t dte = 0;
+    uint32_t max_eventid;
+    uint16_t icid = 0;
+    uint32_t pIntid = 0;
+    bool ite_valid = false;
+    uint64_t cte = 0;
+    bool cte_valid = false;
+    uint64_t rdbase;
+    uint8_t buff[GITS_TYPER_ITT_ENTRY_SIZE];
+    uint64_t itt_addr;
+
+    if (cmd == NONE) {
+        devid = offset;
+    } else {
+        devid = (value >> DEVID_OFFSET) & DEVID_MASK;
+
+        offset += NUM_BYTES_IN_DW;
+        value = address_space_ldq_le(as, c->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    }
+
+    eventid = (value & EVENTID_MASK);
+
+    dte_valid = get_dte(s, devid, &dte);
+
+    if (dte_valid) {
+        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+
+        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid);
+
+    if (ite_valid) {
+            cte_valid = get_cte(s, icid, &cte);
+    }
+    }
+
+    if ((devid > c->dt.max_devids) || !dte_valid || !ite_valid ||
+            !cte_valid || (eventid > max_eventid)) {
+        if ((s->typer >> GITS_TYPER_SEIS_OFFSET) &
+                         GITS_TYPER_SEIS_MASK) {
+            /* Generate System Error here if supported
+             * for each of the individual error cases
+             */
+        }
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: invalid interrupt translation table attributes "
+            "devid %d or eventid %d\n",
+            __func__, devid, eventid);
+        /* in this implementation,in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        if ((s->typer >> GITS_TYPER_PTA_OFFSET) & GITS_TYPER_PTA_MASK) {
+            /* only bits[47:16] are considered instead of bits [51:16]
+             * since with a physical address the target address must be
+             * 64KB aligned
+             */
+            rdbase = (cte >> 1U) & RDBASE_MASK;
+            /*
+             * Current implementation only supports rdbase == procnum
+             * Hence rdbase physical address is ignored
+             */
+        } else {
+            rdbase = (cte >> 1U) & RDBASE_PROCNUM_MASK;
+            if ((cmd == CLEAR) || (cmd == DISCARD)) {
+                gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
+            } else {
+                gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
+            }
+
+            if (cmd == DISCARD) {
+                /* remove mapping from interrupt translation table */
+                memset(buff, 0, sizeof(buff));
+
+                itt_addr = (dte >> 2ULL) & ITTADDR_MASK;
+                itt_addr <<= ITTADDR_OFFSET; /* 256 byte aligned */
+
+                address_space_write(as, itt_addr + eventid,
+                                    MEMTXATTRS_UNSPECIFIED, &buff,
+                                    sizeof(buff));
+            }
+        }
+    }
+
+    if (cmd != NONE) {
+        offset += NUM_BYTES_IN_DW;
+        offset += NUM_BYTES_IN_DW;
+    }
+
+    return res;
+}
+
+static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
+                                    uint32_t offset, bool ignore_pInt) {
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint32_t devid,eventid;
+    uint32_t pIntid = 0;
+    uint32_t max_eventid,max_Intid;
+    bool dte_valid;
+    MemTxResult res = MEMTX_OK;
+    uint16_t icid = 0;
+    uint64_t dte = 0;
+    uint64_t itt_addr;
+    uint8_t buff[GITS_TYPER_ITT_ENTRY_SIZE];
+    uint32_t int_spurious = INTID_SPURIOUS;
+
+    devid = (value >> DEVID_OFFSET) & DEVID_MASK;
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, c->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    eventid = (value & EVENTID_MASK);
+
+    if (!ignore_pInt) {
+        pIntid = (value >> pINTID_OFFSET) & pINTID_MASK;
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, c->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    icid = value & ICID_MASK;
+
+    dte_valid = get_dte(s, devid, &dte);
+
+    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+
+    if (!ignore_pInt) {
+        max_Intid = (1UL << (((s->typer >> GITS_TYPER_IDBITS_OFFSET) &
+                      GITS_TYPER_IDBITS_MASK) + 1));
+    }
+
+    if ((devid > c->dt.max_devids) || (icid > c->ct.max_collids) ||
+            !dte_valid || (eventid > max_eventid) ||
+            (!ignore_pInt && ((pIntid < GICV3_LPI_INTID_START) ||
+               (pIntid > max_Intid)))) {
+        if ((s->typer >> GITS_TYPER_SEIS_OFFSET) &
+                         GITS_TYPER_SEIS_MASK) {
+            /* Generate System Error here if supported
+             * for each of the individual error cases
+             */
+        }
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: invalid interrupt translation table attributes "
+            "devid %d or icid %d or eventid %d or pIntid %d\n",
+            __func__, devid, icid, eventid, pIntid);
+        /* in this implementation,in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        /* add entry to interrupt translation table */
+        memset(buff, 0, sizeof(buff));
+        buff[0] = (dte_valid & VALID_MASK) | (GITS_TYPER_PHYSICAL << 1U);
+        if (ignore_pInt) {
+            memcpy(&buff[1], &eventid, 3);
+        } else {
+            memcpy(&buff[1], &pIntid, 3);
+        }
+        memcpy(&buff[4], &int_spurious, 3);
+        memcpy(&buff[7], &icid, sizeof(icid));
+
+        itt_addr = (dte >> 2ULL) & ITTADDR_MASK;
+        itt_addr <<= ITTADDR_OFFSET; /* 256 byte aligned */
+
+        address_space_write(as, itt_addr + eventid,
+                    MEMTXATTRS_UNSPECIFIED, &buff,
+                    sizeof(buff));
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    return res;
+}
+
+static void update_cte(GICv3ITSState *s, uint16_t icid, uint64_t cte) {
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint64_t value;
+    uint8_t  page_sz_type;
+    uint64_t l2t_addr;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t page_sz = 0;
+    uint32_t max_l2_entries;
+
+    if(c->ct.indirect) {
+        /* 2 level table */
+        page_sz_type = (s->baser[0] >>
+                        GITS_BASER_PAGESIZE_OFFSET) &
+                        GITS_BASER_PAGESIZE_MASK;
+
+        if (page_sz_type == 0) {
+            page_sz = GITS_ITT_PAGE_SIZE_0;
+        } else if (page_sz_type == 1) {
+            page_sz = GITS_ITT_PAGE_SIZE_1;
+        } if (page_sz_type == 2) {
+            page_sz = GITS_ITT_PAGE_SIZE_2;
+        }
+
+        l2t_id = icid / (page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     c->ct.base_addr + l2t_id,
+                                     MEMTXATTRS_UNSPECIFIED, NULL);
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = page_sz / c->ct.entry_sz;
+
+            l2t_addr = (value >> page_sz_type) &
+                        ((1ULL << (51-page_sz_type))-1);
+
+            address_space_write(as, l2t_addr +
+                                 (icid % max_l2_entries),
+                                 MEMTXATTRS_UNSPECIFIED,
+                                 &cte, sizeof(cte));
+        }
+    } else {
+        /* Flat level table */
+        address_space_write(as,c->ct.base_addr + icid,
+                            MEMTXATTRS_UNSPECIFIED, &cte,
+                            sizeof(cte));
+    }
+}
+
+static MemTxResult process_mapc(GICv3ITSState *s, uint32_t offset) {
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint16_t icid;
+    uint64_t rdbase;
+    bool valid;
+    bool pta = false;
+    MemTxResult res = MEMTX_OK;
+    uint64_t cte_entry;
+    uint64_t value;
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    value = address_space_ldq_le(as, c->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    icid = value & ICID_MASK;
+
+    if ((s->typer >> GITS_TYPER_PTA_OFFSET) & GITS_TYPER_PTA_MASK) {
+        /* only bits[47:16] are considered instead of bits [51:16]
+         * since with a physical address the target address must be
+         * 64KB aligned
+         */
+        rdbase = (value >> RDBASE_OFFSET) & RDBASE_MASK;
+        pta = true;
+    } else {
+        rdbase = (value >> RDBASE_OFFSET) & RDBASE_PROCNUM_MASK;
+    }
+
+    valid = (value >> VALID_SHIFT) & VALID_MASK;
+
+    if(valid) {
+        if ((icid > c->ct.max_collids) || (!pta &&
+                (rdbase > s->gicv3->num_cpu))) {
+            if ((s->typer >> GITS_TYPER_SEIS_OFFSET) &
+                             GITS_TYPER_SEIS_MASK) {
+                /* Generate System Error here if supported */
+            }
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: invalid collection table attributes "
+                "icid %d rdbase %lu\n", __func__, icid, rdbase);
+            /* in this implementation,in case of error
+             * we ignore this command and move onto the next
+             * command in the queue
+             */
+        } else {
+            if(c->ct.valid) {
+            /* add mapping entry to collection table */
+                cte_entry = (valid & VALID_MASK) |
+                            (pta ? ((rdbase & RDBASE_MASK) << 1ULL) :
+                                ((rdbase & RDBASE_PROCNUM_MASK) << 1ULL));
+
+                update_cte(s, icid, cte_entry);
+            }
+        }
+    } else {
+        if(c->ct.valid) {
+            /* remove mapping entry from collection table */
+            cte_entry = 0;
+
+            update_cte(s, icid, cte_entry);
+        }
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    return res;
+}
+
+static void update_dte(GICv3ITSState *s, uint32_t devid, uint64_t dte) {
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint64_t value;
+    uint8_t  page_sz_type;
+    uint64_t l2t_addr;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t page_sz = 0;
+    uint32_t max_l2_entries;
+
+    if(c->dt.indirect) {
+        /* 2 level table */
+        page_sz_type = (s->baser[0] >>
+                        GITS_BASER_PAGESIZE_OFFSET) &
+                        GITS_BASER_PAGESIZE_MASK;
+
+        if (page_sz_type == 0) {
+            page_sz = GITS_ITT_PAGE_SIZE_0;
+        } else if (page_sz_type == 1) {
+            page_sz = GITS_ITT_PAGE_SIZE_1;
+        } if (page_sz_type == 2) {
+            page_sz = GITS_ITT_PAGE_SIZE_2;
+        }
+
+        l2t_id = devid / (page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     c->dt.base_addr + l2t_id,
+                                     MEMTXATTRS_UNSPECIFIED, NULL);
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = page_sz / c->dt.entry_sz;
+
+            l2t_addr = (value >> page_sz_type) &
+                        ((1ULL << (51-page_sz_type))-1);
+
+            address_space_write(as, l2t_addr +
+                                 (devid % max_l2_entries),
+                                 MEMTXATTRS_UNSPECIFIED,
+                                 &dte, sizeof(dte));
+        }
+    } else {
+        /* Flat level table */
+        address_space_write(as,c->dt.base_addr + devid,
+                            MEMTXATTRS_UNSPECIFIED, &dte,
+                            sizeof(dte));
+    }
+}
+
+static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
+                                    uint32_t offset) {
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint32_t devid;
+    uint8_t size;
+    uint64_t itt_addr;
+    bool valid;
+    MemTxResult res = MEMTX_OK;
+    uint64_t dte_entry;
+
+    devid = (value >> DEVID_OFFSET) & DEVID_MASK;
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, c->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    size = (value & SIZE_MASK);
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, c->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    itt_addr = (value >> ITTADDR_OFFSET) & ITTADDR_MASK;
+
+    valid = (value >> VALID_SHIFT) & VALID_MASK;
+
+    if(valid) {
+        if ((devid > c->dt.max_devids) ||
+            (size > ((s->typer >> GITS_TYPER_IDBITS_OFFSET) &
+                          GITS_TYPER_IDBITS_MASK))) {
+            if ((s->typer >> GITS_TYPER_SEIS_OFFSET) &
+                             GITS_TYPER_SEIS_MASK) {
+                /* Generate System Error here if supported */
+            }
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: invalid device table attributes "
+                "devid %d or size %d\n", __func__, devid, size);
+            /* in this implementation,in case of error
+             * we ignore this command and move onto the next
+             * command in the queue
+             */
+        } else {
+            if(c->dt.valid) {
+            /* add mapping entry to device table */
+                dte_entry = (valid & VALID_MASK) |
+                            ((size & SIZE_MASK) << 1U) |
+                            ((itt_addr & ITTADDR_MASK) << 6ULL);
+
+                update_dte(s, devid, dte_entry);
+            }
+        }
+    } else {
+        if(c->dt.valid) {
+            /* remove mapping entry from device table */
+            dte_entry = 0;
+            update_dte(s, devid, dte_entry);
+        }
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    return res;
+}
+
+/* Current implementation blocks until all
+ * commands are processed
+ */
+static MemTxResult process_cmdq(GICv3ITSState *s) {
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    uint32_t wr_offset = 0;
+    uint32_t rd_offset = 0;
+    uint32_t cq_offset = 0;
+    uint64_t data;
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    MemTxResult res = MEMTX_OK;
+    uint8_t cmd;
+
+    wr_offset = (s->cwriter >> GITS_CWRITER_OFFSET) &
+                             GITS_CWRITER_OFFSET_MASK;
+
+    if(wr_offset > c->cq.max_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: invalid write offset "
+                        "%d\n", __func__, wr_offset);
+        res = MEMTX_ERROR;
+        return res;
+    }
+
+    rd_offset = (s->creadr >> GITS_CREADR_OFFSET) &
+                             GITS_CREADR_OFFSET_MASK;
+
+    while (wr_offset != rd_offset) {
+        cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
+        data = address_space_ldq_le(as, c->cq.base_addr + cq_offset,
+                                      MEMTXATTRS_UNSPECIFIED, &res);
+        cmd = (data & CMD_MASK);
+
+        switch(cmd) {
+        case GITS_CMD_INT:
+            res = process_int(s, data, cq_offset, INT);
+            break;
+        case GITS_CMD_CLEAR:
+            res = process_int(s, data, cq_offset, CLEAR);
+            break;
+        case GITS_CMD_SYNC:
+            res = process_sync(s, cq_offset);
+            break;
+        case GITS_CMD_MAPD:
+            res = process_mapd(s, data, cq_offset);
+            break;
+        case GITS_CMD_MAPC:
+            res = process_mapc(s, cq_offset);
+            break;
+        case GITS_CMD_MAPTI:
+            res = process_mapti(s, data, cq_offset, false);
+            break;
+        case GITS_CMD_MAPI:
+            res = process_mapti(s, data, cq_offset, true);
+            break;
+        case GITS_CMD_DISCARD:
+            res = process_int(s, data, cq_offset, DISCARD);
+            break;
+        default:
+            break;
+        }
+        if (res == MEMTX_OK) {
+            rd_offset++;
+            rd_offset %= c->cq.max_entries;
+            s->creadr = (rd_offset << GITS_CREADR_OFFSET);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: %x cmd processing failed!! \n", __func__, cmd);
+            break;
+        }
+    }
+    return res;
+}
+
+static bool extract_table_params(GICv3ITSState *s, int index)
+{
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    uint16_t num_pages = 0;
+    uint8_t  page_sz_type;
+    uint8_t type;
+    uint32_t page_sz = 0;
+    uint64_t value = s->baser[index];
+
+    num_pages = (value & GITS_BASER_SIZE);
+    page_sz_type = (value >> GITS_BASER_PAGESIZE_OFFSET) &
+                        GITS_BASER_PAGESIZE_MASK;
+
+    if (page_sz_type == 0) {
+        page_sz = GITS_ITT_PAGE_SIZE_0;
+    } else if (page_sz_type == 0) {
+        page_sz = GITS_ITT_PAGE_SIZE_1;
+    } else if (page_sz_type == 2) {
+        page_sz = GITS_ITT_PAGE_SIZE_2;
+    } else {
+        return false;
+    }
+
+    type = (value >> GITS_BASER_TYPE_OFFSET) &
+                        GITS_BASER_TYPE_MASK;
+
+    if (type == GITS_ITT_TYPE_DEVICE) {
+        c->dt.valid = (value >> GITS_BASER_VALID) & GITS_BASER_VALID_MASK;
+
+        if(c->dt.valid) {
+            c->dt.indirect = (value >> GITS_BASER_INDIRECT_OFFSET) &
+                                       GITS_BASER_INDIRECT_MASK;
+            c->dt.entry_sz = (value >> GITS_BASER_ENTRYSIZE_OFFSET) &
+                                   GITS_BASER_ENTRYSIZE_MASK;
+
+            if (!c->dt.indirect) {
+                c->dt.max_entries = ((num_pages + 1) * page_sz) /
+                                                       c->dt.entry_sz;
+            } else {
+                c->dt.max_entries = ((((num_pages + 1) * page_sz) /
+                                        L1TABLE_ENTRY_SIZE) *
+                                    (page_sz / c->dt.entry_sz));
+            }
+
+            c->dt.max_devids = (1UL << (((value >> GITS_TYPER_DEVBITS_OFFSET) &
+                                           GITS_TYPER_DEVBITS_MASK) + 1));
+
+            if ((page_sz == GITS_ITT_PAGE_SIZE_0) ||
+                    (page_sz == GITS_ITT_PAGE_SIZE_1)) {
+                c->dt.base_addr = (value >> GITS_BASER_PHYADDR_OFFSET) &
+                                        GITS_BASER_PHYADDR_MASK;
+                c->dt.base_addr <<= GITS_BASER_PHYADDR_OFFSET;
+            } else if (page_sz == GITS_ITT_PAGE_SIZE_2) {
+                c->dt.base_addr = ((value >> GITS_BASER_PHYADDR_OFFSETL_64K) &
+                                   GITS_BASER_PHYADDR_MASKL_64K) <<
+                                     GITS_BASER_PHYADDR_OFFSETL_64K;
+                c->dt.base_addr |= ((value >> GITS_BASER_PHYADDR_OFFSET) &
+                                    GITS_BASER_PHYADDR_MASKH_64K) <<
+                                     GITS_BASER_PHYADDR_OFFSETH_64K;
+            }
+        }
+    } else if (type == GITS_ITT_TYPE_COLLECTION) {
+        c->ct.valid = (value >> GITS_BASER_VALID) & GITS_BASER_VALID_MASK;
+
+        /* GITS_TYPER.HCC is 0 for this implementation
+         * hence writes are discarded if ct.valid is 0
+         */
+        if(c->ct.valid) {
+            c->ct.indirect = (value >> GITS_BASER_INDIRECT_OFFSET) &
+                                       GITS_BASER_INDIRECT_MASK;
+            c->ct.entry_sz = (value >> GITS_BASER_ENTRYSIZE_OFFSET) &
+                                    GITS_BASER_ENTRYSIZE_MASK;
+
+            if (!c->ct.indirect) {
+                c->ct.max_entries = ((num_pages + 1) * page_sz) /
+                                      c->ct.entry_sz;
+            } else {
+                c->ct.max_entries = ((((num_pages + 1) * page_sz) /
+                                      L1TABLE_ENTRY_SIZE) *
+                                      (page_sz / c->ct.entry_sz));
+            }
+
+            if ((value >> GITS_TYPER_CIL_OFFSET) & GITS_TYPER_CIL_MASK) {
+                c->ct.max_collids = (1UL << (((value >>
+                                               GITS_TYPER_CIDBITS_OFFSET) &
+                                               GITS_TYPER_CIDBITS_MASK) + 1));
+            } else {
+                /* 16-bit CollectionId supported when CIL == 0 */
+                c->ct.max_collids = (1UL << 16);
+            }
+
+            if ((page_sz == GITS_ITT_PAGE_SIZE_0) ||
+                 (page_sz == GITS_ITT_PAGE_SIZE_1)) {
+                c->ct.base_addr = (value >> GITS_BASER_PHYADDR_OFFSET) &
+                                            GITS_BASER_PHYADDR_MASK;
+                c->ct.base_addr <<= GITS_BASER_PHYADDR_OFFSET;
+            } else if (page_sz == GITS_ITT_PAGE_SIZE_2) {
+                c->ct.base_addr = ((value >> GITS_BASER_PHYADDR_OFFSETL_64K) &
+                                   GITS_BASER_PHYADDR_MASKL_64K) <<
+                                    GITS_BASER_PHYADDR_OFFSETL_64K;
+                c->ct.base_addr |= ((value >> GITS_BASER_PHYADDR_OFFSET) &
+                                    GITS_BASER_PHYADDR_MASKH_64K) <<
+                                    GITS_BASER_PHYADDR_OFFSETH_64K;
+            }
+        }
+    } else {
+        //unsupported ITS table type
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Unsupported ITS table type %d",
+                         __func__, type);
+        return false;
+    }
+    return true;
+}
+
+static bool extract_cmdq_params(GICv3ITSState *s)
+{
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    uint16_t num_pages = 0;
+    uint64_t value = s->cbaser;
+
+    num_pages = (value & GITS_CBASER_SIZE);
+
+    c->cq.valid = (value >> GITS_CBASER_VALID_OFFSET) &
+                                GITS_CBASER_VALID_MASK;
+
+    if (!num_pages || !c->cq.valid) {
+        return false;
+    }
+
+    if(c->cq.valid) {
+        c->cq.max_entries = ((num_pages + 1) * GITS_ITT_PAGE_SIZE_0) /
+                                                GITS_CMDQ_ENTRY_SIZE;
+        c->cq.base_addr = (value >> GITS_CBASER_PHYADDR_OFFSET) &
+                                    GITS_CBASER_PHYADDR_MASK;
+        c->cq.base_addr <<= GITS_CBASER_PHYADDR_OFFSET;
+    }
+    return true;
+}
+
+static MemTxResult its_trans_writew(GICv3ITSState *s, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+    uint32_t devid = 0;
+
+    switch(offset) {
+    case GITS_TRANSLATER:
+        if (s->ctlr & GITS_CTLR_ENABLED) {
+            s->translater = (value & 0x0000FFFFU);
+            devid = attrs.requester_id;
+            result = process_int(s, s->translater, devid, NONE);
+        }
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
+    return result;
+}
+
+static MemTxResult its_trans_writel(GICv3ITSState *s, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+    uint32_t devid = 0;
+
+    switch(offset) {
+    case GITS_TRANSLATER:
+        if (s->ctlr & GITS_CTLR_ENABLED) {
+            s->translater = value;
+            devid = attrs.requester_id;
+            result = process_int(s, s->translater, devid, NONE);
+        }
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
+    return result;
+}
+
+static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
+                               uint64_t data, unsigned size, MemTxAttrs attrs)
+{
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
+    MemTxResult result;
+
+    switch (size) {
+    case 2:
+        result = its_trans_writew(s, offset, data, attrs);
+        break;
+    case 4:
+        result = its_trans_writel(s, offset, data, attrs);
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
+
+    if (result == MEMTX_ERROR) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest write at offset " TARGET_FMT_plx
+                      "size %u\n", __func__, offset, size);
+        /* The spec requires that reserved registers are RAZ/WI;
+         * so use MEMTX_ERROR returns from leaf functions as a way to
+         * trigger the guest-error logging but don't return it to
+         * the caller, or we'll cause a spurious guest data abort.
+         */
+        result = MEMTX_OK;
+    }
+    return result;
+}
+
+static MemTxResult gicv3_its_trans_read(void *opaque, hwaddr offset,
+                              uint64_t *data, unsigned size, MemTxAttrs attrs)
+{
+    qemu_log_mask(LOG_GUEST_ERROR,
+        "%s: Invalid read from transaction register area at offset "
+        TARGET_FMT_plx "\n", __func__, offset);
+    return MEMTX_ERROR;
+}
+
+static MemTxResult its_writeb(GICv3ITSState *s, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
+{
+    qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: unsupported byte write to register at offset "
+                TARGET_FMT_plx "\n", __func__, offset);
+    return MEMTX_ERROR;
+}
+
+static MemTxResult its_readb(GICv3ITSState *s, hwaddr offset,
+                               uint64_t *data, MemTxAttrs attrs)
+{
+    qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: unsupported byte read from register at offset "
+                TARGET_FMT_plx "\n", __func__, offset);
+    return MEMTX_ERROR;
+}
+
+static MemTxResult its_writew(GICv3ITSState *s, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
+{
+    qemu_log_mask(LOG_GUEST_ERROR,
+        "%s: unsupported word write to register at offset "
+        TARGET_FMT_plx "\n", __func__, offset);
+    return MEMTX_ERROR;
+}
+
+static MemTxResult its_readw(GICv3ITSState *s, hwaddr offset,
+                               uint64_t *data, MemTxAttrs attrs)
+{
+    qemu_log_mask(LOG_GUEST_ERROR,
+        "%s: unsupported word read from register at offset "
+        TARGET_FMT_plx "\n", __func__, offset);
+    return MEMTX_ERROR;
+}
+
+static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+    int index;
+    uint64_t temp = 0;
+
+    switch (offset) {
+    case GITS_CTLR:
+        s->ctlr |= (value & ~(s->ctlr));
+        break;
+    case GITS_CBASER:
+        /* GITS_CBASER register becomes RO if ITS is already enabled */
+        if(!(s->ctlr & GITS_CTLR_ENABLED)) {
+            s->cbaser = deposit64(s->cbaser, 0, 32, value);
+            s->creadr = 0;
+        }
+        break;
+    case GITS_CBASER + 4:
+        /* GITS_CBASER register becomes RO if ITS is already enabled */
+        if(!(s->ctlr & GITS_CTLR_ENABLED)) {
+            s->cbaser = deposit64(s->cbaser, 32, 32, value);
+            if(!extract_cmdq_params(s)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: error extracting GITS_CBASER parameters "
+                       TARGET_FMT_plx "\n", __func__, offset);
+                s->cbaser = 0;
+                result = MEMTX_ERROR;
+            } else {
+                s->creadr = 0;
+            }
+        }
+        break;
+    case GITS_CWRITER:
+        s->cwriter = deposit64(s->cwriter, 0, 32, value);
+        if ((s->ctlr & GITS_CTLR_ENABLED) && (s->cwriter != s->creadr)) {
+            result = process_cmdq(s);
+        }
+        break;
+    case GITS_CWRITER + 4:
+        s->cwriter = deposit64(s->cwriter, 32, 32, value);
+        break;
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        /* GITS_BASERn registers become RO if ITS is already enabled */
+        if(!(s->ctlr & GITS_CTLR_ENABLED)) {
+            index = (offset - GITS_BASER) / 8;
+
+            if (offset & 7) {
+                temp = s->baser[index];
+                temp = deposit64(temp, 32, 32, (value & ~GITS_BASER_VAL_MASK));
+                s->baser[index] |= temp;
+
+                if(!extract_table_params(s, index)) {
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: error extracting GITS_BASER parameters "
+                        TARGET_FMT_plx "\n", __func__, offset);
+                    s->baser[index] = 0;
+                    result = MEMTX_ERROR;
+                }
+            } else {
+                s->baser[index] =  deposit64(s->baser[index], 0, 32, value);
+            }
+        }
+        break;
+    case GITS_IIDR:
+    case GITS_TYPER:
+    case GITS_CREADR:
+        /* RO registers, ignore the write */
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: invalid guest write to RO register at offset "
+            TARGET_FMT_plx "\n", __func__, offset);
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
+    return result;
+}
+
+static MemTxResult its_readl(GICv3ITSState *s, hwaddr offset,
+                               uint64_t *data, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+    int index;
+
+    switch (offset) {
+    case GITS_CTLR:
+        *data = s->ctlr;
+        break;
+    case GITS_IIDR:
+        *data = s->iidr;
+        break;
+    case GITS_PIDR2:
+        *data = 0x30; /* GICv3 */
+        break;
+    case GITS_TYPER:
+        *data = extract64(s->typer, 0, 32);
+        break;
+    case GITS_TYPER + 4:
+        *data = extract64(s->typer, 32, 32);
+        break;
+    case GITS_CBASER:
+        *data = extract64(s->cbaser, 0, 32);
+        break;
+    case GITS_CBASER + 4:
+        *data = extract64(s->cbaser, 32, 32);
+        break;
+    case GITS_CREADR:
+        *data = extract64(s->creadr, 0, 32);
+        break;
+    case GITS_CREADR + 4:
+        *data = extract64(s->creadr, 32, 32);
+        break;
+    case GITS_CWRITER:
+        *data = extract64(s->cwriter, 0, 32);
+        break;
+    case GITS_CWRITER + 4:
+        *data = extract64(s->cwriter, 32, 32);
+        break;
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        index = (offset - GITS_BASER) / 8;
+        if (offset & 7) {
+            *data = s->baser[index] >> 32;
+        } else {
+            *data = (uint32_t)s->baser[index];
+        }
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
+    return result;
+}
+
+static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+    int index;
+
+    switch (offset) {
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        /* GITS_BASERn registers become RO if ITS is already enabled */
+        if(!(s->ctlr & GITS_CTLR_ENABLED)) {
+            index = (offset - GITS_BASER) / 8;
+            s->baser[index] |= (value & ~GITS_BASER_VAL_MASK);
+            if(!extract_table_params(s, index)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: error extracting GITS_BASER parameters "
+                        TARGET_FMT_plx "\n", __func__, offset);
+                s->baser[index] = 0;
+                result = MEMTX_ERROR;
+            }
+        }
+        break;
+    case GITS_CBASER:
+        /* GITS_CBASER register becomes RO if ITS is already enabled */
+        if(!(s->ctlr & GITS_CTLR_ENABLED)) {
+            s->cbaser = value;
+            if(!extract_cmdq_params(s)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: error extracting GITS_CBASER parameters "
+                       TARGET_FMT_plx "\n", __func__, offset);
+                s->cbaser = 0;
+                result = MEMTX_ERROR;
+            } else {
+                s->creadr = 0;
+            }
+        }
+        break;
+    case GITS_CWRITER:
+        s->cwriter = value;
+        if ((s->ctlr & GITS_CTLR_ENABLED) && (s->cwriter != s->creadr)) {
+            result = process_cmdq(s);
+        }
+        break;
+    case GITS_TYPER:
+    case GITS_CREADR:
+        /* RO register, ignore the write */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest write to RO register at offset "
+                      TARGET_FMT_plx "\n", __func__, offset);
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
+    return result;
+}
+
+static MemTxResult its_readll(GICv3ITSState *s, hwaddr offset,
+                               uint64_t *data, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+    int index;
+
+    switch (offset) {
+    case GITS_TYPER:
+        *data = s->typer;
+        break;
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        index = (offset - GITS_BASER) / 8;
+        *data = s->baser[index];
+        break;
+    case GITS_CBASER:
+        *data = s->cbaser;
+        break;
+    case GITS_CREADR:
+        *data = s->creadr;
+        break;
+    case GITS_CWRITER:
+        *data = s->cwriter;
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
+    return result;
+}
+
+static MemTxResult gicv3_its_read(void *opaque, hwaddr offset, uint64_t *data,
+                              unsigned size, MemTxAttrs attrs)
+{
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
+    MemTxResult result;
+
+    switch (size) {
+    case 1:
+        result = its_readb(s, offset, data, attrs);
+        break;
+    case 2:
+        result = its_readw(s, offset, data, attrs);
+        break;
+    case 4:
+        result = its_readl(s, offset, data, attrs);
+        break;
+    case 8:
+        result = its_readll(s, offset, data, attrs);
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
+
+    if (result == MEMTX_ERROR) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest read at offset " TARGET_FMT_plx
+                      "size %u\n", __func__, offset, size);
+        /* The spec requires that reserved registers are RAZ/WI;
+         * so use MEMTX_ERROR returns from leaf functions as a way to
+         * trigger the guest-error logging but don't return it to
+         * the caller, or we'll cause a spurious guest data abort.
+         */
+        result = MEMTX_OK;
+        *data = 0;
+    }
+    return result;
+}
+
+static MemTxResult gicv3_its_write(void *opaque, hwaddr offset, uint64_t data,
+                               unsigned size, MemTxAttrs attrs)
+{
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
+    MemTxResult result;
+
+    switch (size) {
+    case 1:
+        result = its_writeb(s, offset, data, attrs);
+        break;
+    case 2:
+        result = its_writew(s, offset, data, attrs);
+        break;
+    case 4:
+        result = its_writel(s, offset, data, attrs);
+        break;
+    case 8:
+        result = its_writell(s, offset, data, attrs);
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
+
+    if (result == MEMTX_ERROR) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest write at offset " TARGET_FMT_plx
+                      "size %u\n", __func__, offset, size);
+        /* The spec requires that reserved registers are RAZ/WI;
+         * so use MEMTX_ERROR returns from leaf functions as a way to
+         * trigger the guest-error logging but don't return it to
+         * the caller, or we'll cause a spurious guest data abort.
+         */
+        result = MEMTX_OK;
+    }
+    return result;
+}
+
+static const MemoryRegionOps gicv3_its_control_ops = {
+    .read_with_attrs = gicv3_its_read,
+    .write_with_attrs = gicv3_its_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static const MemoryRegionOps gicv3_its_trans_ops = {
+    .read_with_attrs = gicv3_its_trans_read,
+    .write_with_attrs = gicv3_its_trans_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
+{
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+
+    gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_trans_ops);
+
+    address_space_init(&s->gicv3->sysmem_as, s->gicv3->sysmem,
+                        "gicv3-its-sysmem");
+}
+
+static void gicv3_its_reset(DeviceState *dev)
+{
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+
+    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
+        c->parent_reset(dev);
+        memset(&c->dt, 0 ,sizeof(c->dt));
+        memset(&c->ct, 0 ,sizeof(c->ct));
+        memset(&c->cq, 0 ,sizeof(c->cq));
+
+        /* set the ITS default features supported */
+        s->typer = GITS_TYPER_PHYSICAL | (GITS_TYPER_ITT_ENTRY_SIZE <<
+                   GITS_TYPER_ITT_ENTRY_OFFSET) | (GITS_TYPER_IDBITS <<
+                   GITS_TYPER_IDBITS_OFFSET) | GITS_TYPER_DEVBITS |
+                   GITS_TYPER_CIL | GITS_TYPER_CIDBITS;
+
+        /* We claim to be an ARM r0p0 with a zero ProductID.
+         * This is the same as an r0p0 GIC-500.
+         */
+        s->iidr = gicv3_iidr();
+
+        /* Quiescent bit reset to 1 */
+        s->ctlr = (1U << 31);
+
+        /* setting GITS_BASER0.Type = 0b001 (Device)
+         *         GITS_BASER1.Type = 0b100 (Collection Table)
+         *         GITS_BASER<n>.Type,where n = 3 to 7 are 0b00 (Unimplemented)
+         * and default translation table entry size to 16 bytes
+         */
+        s->baser[0] = (GITS_ITT_TYPE_DEVICE << GITS_BASER_TYPE_OFFSET) |
+                        (GITS_DTE_SIZE << GITS_BASER_ENTRYSIZE_OFFSET);
+        s->baser[1] = (GITS_ITT_TYPE_COLLECTION << GITS_BASER_TYPE_OFFSET) |
+                        (GITS_CTE_SIZE << GITS_BASER_ENTRYSIZE_OFFSET);
+    }
+}
+
+static Property gicv3_its_props[] = {
+    DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "arm-gicv3",
+                     GICv3State *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void gicv3_its_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    GICv3ITSClass *ic = ARM_GICV3_ITS_CLASS(klass);
+
+    dc->realize = gicv3_arm_its_realize;
+    device_class_set_props(dc, gicv3_its_props);
+    device_class_set_parent_reset(dc, gicv3_its_reset, &ic->parent_reset);
+}
+
+static const TypeInfo gicv3_its_info = {
+    .name = TYPE_ARM_GICV3_ITS,
+    .parent = TYPE_ARM_GICV3_ITS_COMMON,
+    .instance_size = sizeof(GICv3ITSState),
+    .class_init = gicv3_its_class_init,
+    .class_size = sizeof(GICv3ITSClass),
+};
+
+static void gicv3_its_register_types(void)
+{
+    type_register_static(&gicv3_its_info);
+}
+
+type_init(gicv3_its_register_types)
diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 66c4c6a188..b1a50b9aeb 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -55,7 +55,9 @@ static const VMStateDescription vmstate_its = {
     .priority = MIG_PRI_GICV3_ITS,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(ctlr, GICv3ITSState),
+        VMSTATE_UINT32(translater, GICv3ITSState),
         VMSTATE_UINT32(iidr, GICv3ITSState),
+        VMSTATE_UINT64(typer, GICv3ITSState),
         VMSTATE_UINT64(cbaser, GICv3ITSState),
         VMSTATE_UINT64(cwriter, GICv3ITSState),
         VMSTATE_UINT64(creadr, GICv3ITSState),
@@ -99,15 +101,21 @@ static const MemoryRegionOps gicv3_its_trans_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops)
+void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
+		const MemoryRegionOps *tops)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(s);
 
     memory_region_init_io(&s->iomem_its_cntrl, OBJECT(s), ops, s,
                           "control", ITS_CONTROL_SIZE);
-    memory_region_init_io(&s->iomem_its_translation, OBJECT(s),
-                          &gicv3_its_trans_ops, s,
-                          "translation", ITS_TRANS_SIZE);
+    if(tops == NULL) {
+        memory_region_init_io(&s->iomem_its_translation, OBJECT(s),
+                              &gicv3_its_trans_ops, s,
+                              "translation", ITS_TRANS_SIZE);
+    } else {
+        memory_region_init_io(&s->iomem_its_translation, OBJECT(s),
+                              tops, s, "translation", ITS_TRANS_SIZE);
+    }
 
     /* Our two regions are always adjacent, therefore we now combine them
      * into a single one in order to make our users' life easier.
@@ -130,6 +138,7 @@ static void gicv3_its_common_reset(DeviceState *dev)
     s->cwriter = 0;
     s->creadr = 0;
     s->iidr = 0;
+    s->translater = 0;
     memset(&s->baser, 0, sizeof(s->baser));
 }
 
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index b554d2ede0..0b4cbed28b 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -106,7 +106,7 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
     kvm_arm_register_device(&s->iomem_its_cntrl, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_ITS_ADDR_TYPE, s->dev_fd, 0);
 
-    gicv3_its_init_mmio(s, NULL);
+    gicv3_its_init_mmio(s, NULL, NULL);
 
     if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
         GITS_CTLR)) {
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8645220d61..04d6b7e599 100644
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
@@ -275,6 +281,14 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         cs->gicr_waker = value;
         return MEMTX_OK;
     case GICR_PROPBASER:
+        if ((value & GICR_PROPBASER_IDBITS_MASK) <
+            GICR_PROPBASER_IDBITS_THRESHOLD) {
+            cs->lpi_outofrange = true;
+        }
+        if ((value & GICR_PROPBASER_IDBITS_MASK) > GICD_TYPER_IDBITS) {
+            value &= ~GICR_PROPBASER_IDBITS_MASK;
+            value |= GICD_TYPER_IDBITS;
+        }
         cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 0, 32, value);
         return MEMTX_OK;
     case GICR_PROPBASER + 4:
@@ -397,6 +411,15 @@ static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
 {
     switch (offset) {
     case GICR_PROPBASER:
+        if ((value & GICR_PROPBASER_IDBITS_MASK) <
+            GICR_PROPBASER_IDBITS_THRESHOLD) {
+            cs->lpi_outofrange = true;
+        }
+        if ((value & GICR_PROPBASER_IDBITS_MASK) >
+            GICD_TYPER_IDBITS) {
+            value &= ~GICR_PROPBASER_IDBITS_MASK;
+            value |= GICD_TYPER_IDBITS;
+        }
         cs->gicr_propbaser = value;
         return MEMTX_OK;
     case GICR_PENDBASER:
@@ -526,6 +549,140 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
     return r;
 }
 
+bool gicv3_redist_update_lpi(GICv3CPUState *cs)
+{
+    AddressSpace *as = &cs->gic->sysmem_as;
+    uint64_t lpict_baddr,lpipt_baddr;
+    uint32_t pendt_size = 0;
+    uint8_t lpite;
+    uint8_t prio,pend;
+    int i,j;
+    bool seenbetter = false;
+
+    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+        !cs->gicr_pendbaser || cs->lpi_outofrange) {
+        return seenbetter;
+    }
+
+    lpict_baddr = (cs->gicr_propbaser >> GICR_PROPBASER_ADDR_OFFSET) &
+                       GICR_PROPBASER_ADDR_MASK;
+    lpict_baddr <<= GICR_PROPBASER_ADDR_OFFSET;
+
+    lpipt_baddr = (cs->gicr_pendbaser >> GICR_PENDBASER_ADDR_OFFSET) &
+                       GICR_PENDBASER_ADDR_MASK;
+    lpipt_baddr <<= GICR_PENDBASER_ADDR_OFFSET;
+
+    /* Determine the highest priority pending interrupt among LPIs */
+    pendt_size = (1UL << ((cs->gicr_propbaser & GICR_PROPBASER_IDBITS_MASK)
+			+ 1)) / 8;
+
+    for (i = 0; i < pendt_size; i++) {
+        address_space_read(as, lpipt_baddr + i,
+                MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+
+	for (j = 0; j < 8; j++) {
+            if (((pend >> j) & 0x1)) {
+                address_space_read(as, lpict_baddr + ((i * 8) + j),
+                     MEMTXATTRS_UNSPECIFIED, &lpite, sizeof(lpite));
+
+		prio = ((lpite >> LPI_CTE_PRIORITY_OFFSET) &
+			 LPI_CTE_PRIORITY_MASK);
+		prio &= LPI_PRIORITY_MASK;
+
+		if (prio < cs->hppi.prio) {
+                    cs->hppi.irq = GICV3_LPI_INTID_START + ((i * 8) + j);
+                    cs->hppi.prio = prio;
+                    seenbetter = true;
+                }
+            }
+        }
+    }
+
+    if (seenbetter) {
+        /* All LPIs belong to Group 1 Non secure in 2 security states mode
+	 * or Group 1 in single security state mode
+	 */
+        if (cs->gic->gicd_ctlr & GICD_CTLR_DS) {
+            cs->hppi.grp = GICV3_G1;
+        } else {
+            cs->hppi.grp = GICV3_G1NS;
+        }
+    }
+
+    return seenbetter;
+}
+
+void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
+{
+    AddressSpace *as = &cs->gic->sysmem_as;
+    uint64_t lpipt_baddr;
+    bool ispend = false;
+    uint8_t pend;
+
+    /* get the bit value corresponding to this irq in the
+     * lpi pending table
+     */
+    lpipt_baddr = (cs->gicr_pendbaser >> GICR_PENDBASER_ADDR_OFFSET) &
+	              GICR_PENDBASER_ADDR_MASK;
+    lpipt_baddr <<= GICR_PENDBASER_ADDR_OFFSET;
+
+    address_space_read(as, lpipt_baddr + (irq / 8),
+		         MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+    ispend = ((pend >> (irq % 8)) & 0x1);
+
+    if (ispend) {
+        if (!level) {
+            /*
+	     * clear the pending bit and update the lpi pending table
+	     */
+            pend &= ~(1 << (irq % 8));
+
+            address_space_write(as, lpipt_baddr + (irq / 8),
+                                   MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+	}
+    } else {
+        if (level) {
+            /* if pending bit is not already set for this irq,turn-on the
+	     * pending bit and update the lpi pending table
+	     */
+            pend |= (1 << (irq % 8));
+
+            address_space_write(as, lpipt_baddr + (irq / 8),
+                                  MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+        }
+    }
+}
+
+void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
+{
+    AddressSpace *as = &cs->gic->sysmem_as;
+    uint64_t lpict_baddr;
+    uint8_t lpite;
+
+    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+         !cs->gicr_pendbaser || cs->lpi_outofrange) {
+        return;
+    }
+
+    lpict_baddr = (cs->gicr_propbaser >> GICR_PROPBASER_ADDR_OFFSET) &
+                      GICR_PROPBASER_ADDR_MASK;
+    lpict_baddr <<= GICR_PROPBASER_ADDR_OFFSET;
+
+    /* get the lpi config table entry corresponding to this irq */
+    address_space_read(as, lpict_baddr + (irq - GICV3_LPI_INTID_START),
+		         MEMTXATTRS_UNSPECIFIED, &lpite, sizeof(lpite));
+
+    /* check if this irq is enabled before proceeding further */
+    if (!(lpite & LPI_CTE_ENABLED)) {
+        return;
+    }
+
+    /* set/clear the pending bit for this irq */
+    gicv3_redist_lpi_pending(cs, irq, level);
+
+    gicv3_redist_update(cs);
+}
+
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
 {
     /* Update redistributor state for a change in an external PPI input line */
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 05303a55c8..a719fa9f43 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -67,6 +67,12 @@
 #define GICD_CTLR_E1NWF             (1U << 7)
 #define GICD_CTLR_RWP               (1U << 31)
 
+#define GICD_TYPER_LPIS_OFFSET         17
+#define GICD_TYPER_IDBITS_OFFSET       19
+#define GICD_TYPER_IDBITS_MASK       0x1f
+/* 16 bits EventId */
+#define GICD_TYPER_IDBITS            0xf
+
 /*
  * Redistributor frame offsets from RD_base
  */
@@ -123,14 +129,17 @@
 #define GICR_WAKER_ChildrenAsleep    (1U << 2)
 
 #define GICR_PROPBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
-#define GICR_PROPBASER_ADDR_MASK               (0xfffffffffULL << 12)
+#define GICR_PROPBASER_ADDR_OFFSET               12
+#define GICR_PROPBASER_ADDR_MASK               ((1ULL << 40)-1)
 #define GICR_PROPBASER_SHAREABILITY_MASK       (3U << 10)
 #define GICR_PROPBASER_CACHEABILITY_MASK       (7U << 7)
 #define GICR_PROPBASER_IDBITS_MASK             (0x1f)
+#define GICR_PROPBASER_IDBITS_THRESHOLD          0xd
 
 #define GICR_PENDBASER_PTZ                     (1ULL << 62)
 #define GICR_PENDBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
-#define GICR_PENDBASER_ADDR_MASK               (0xffffffffULL << 16)
+#define GICR_PENDBASER_ADDR_OFFSET               16
+#define GICR_PENDBASER_ADDR_MASK               ((1ULL << 36)-1)
 #define GICR_PENDBASER_SHAREABILITY_MASK       (3U << 10)
 #define GICR_PENDBASER_CACHEABILITY_MASK       (7U << 7)
 
@@ -239,11 +248,164 @@
 #define ICH_VTR_EL2_PREBITS_SHIFT 26
 #define ICH_VTR_EL2_PRIBITS_SHIFT 29
 
+#define GITS_CTLR_ENABLED             (1U << 0)  /* ITS Enabled or not */
+#define GITS_CTLR_QUIESCENT           (1U << 31) /* Quiescent bit */
+
+#define GITS_BASER_SIZE                     (0xff)
+#define GITS_BASER_PAGESIZE_OFFSET            8
+#define GITS_BASER_PAGESIZE_MASK             0x3
+#define GITS_BASER_SHAREABILITY_OFFSET        10
+#define GITS_BASER_SHAREABILITY_MASK         0x3
+#define GITS_BASER_PHYADDR_OFFSET             12
+#define GITS_BASER_PHYADDR_MASK             ((1ULL << 36)-1)
+#define GITS_BASER_PHYADDR_OFFSETL_64K        16
+#define GITS_BASER_PHYADDR_MASKL_64K        ((1ULL << 32)-1)
+#define GITS_BASER_PHYADDR_OFFSETH_64K        48
+#define GITS_BASER_PHYADDR_MASKH_64K        ((1ULL << 4)-1)
+#define GITS_BASER_ENTRYSIZE_OFFSET           48
+#define GITS_BASER_ENTRYSIZE_MASK           ((1U << 5)-1)
+#define GITS_BASER_OUTERCACHE_OFFSET          53
+#define GITS_BASER_OUTERCACHE_MASK            0x7
+#define GITS_BASER_TYPE_OFFSET                56
+#define GITS_BASER_TYPE_MASK                  0x7
+#define GITS_BASER_INNERCACHE_OFFSET          59
+#define GITS_BASER_INNERCACHE_MASK            0x7
+#define GITS_BASER_INDIRECT_OFFSET            62
+#define GITS_BASER_INDIRECT_MASK              0x1
+#define GITS_BASER_VALID                      63
+#define GITS_BASER_VALID_MASK                 0x1
+
+#define GITS_BASER_VAL_MASK                 ((0x7ULL << 56) | (0x1fULL << 48))
+
+#define GITS_ITT_TYPE_DEVICE                  1ULL
+#define GITS_ITT_TYPE_COLLECTION              4ULL
+
+#define GITS_CBASER_SIZE                    (0xff)
+#define GITS_CBASER_SHAREABILITY_OFFSET       10
+#define GITS_CBASER_SHAREABILITY_MASK        0x3
+#define GITS_CBASER_PHYADDR_OFFSET            12
+#define GITS_CBASER_PHYADDR_MASK       ((1ULL << 40)-1)
+#define GITS_CBASER_OUTERCACHE_OFFSET         53
+#define GITS_CBASER_OUTERCACHE_MASK          0x7
+#define GITS_CBASER_INNERCACHE_OFFSET         59
+#define GITS_CBASER_INNERCACHE_MASK          0x7
+#define GITS_CBASER_VALID_OFFSET              63
+#define GITS_CBASER_VALID_MASK               0x1
+
+#define GITS_CREADR_STALLED           (1U << 0)
+#define GITS_CREADR_OFFSET             5
+#define GITS_CREADR_OFFSET_MASK       ((1U << 15)-1)
+
+#define GITS_CWRITER_RETRY            (1U << 0)
+#define GITS_CWRITER_OFFSET             5
+#define GITS_CWRITER_OFFSET_MASK      ((1U << 15)-1)
+
+#define GITS_TYPER_DEVBITS_OFFSET       13
+#define GITS_TYPER_DEVBITS_MASK        0x1f
+#define GITS_TYPER_IDBITS_OFFSET        8
+#define GITS_TYPER_IDBITS_MASK         0x1f
+#define GITS_TYPER_CIDBITS_OFFSET       32
+#define GITS_TYPER_CIDBITS_MASK        0xf
+#define GITS_TYPER_CIL_OFFSET           36
+#define GITS_TYPER_CIL_MASK             0x1
+#define GITS_TYPER_PTA_OFFSET           19
+#define GITS_TYPER_PTA_MASK             0x1
+#define GITS_TYPER_SEIS_OFFSET          18
+#define GITS_TYPER_SEIS_MASK            0x1
+
+/* Default features advertised by this version of ITS */
+/* Physical LPIs supported */
+#define GITS_TYPER_PHYSICAL           (1U << 0)
+/* 11 bytes Interrupt translation Table Entry size
+ * Valid = 1 bit,InterruptType = 1 bit,
+ * Size of LPI number space[considering max 24 bits],
+ * Size of LPI number space[considering max 24 bits],
+ * ICID = 16 bits,
+ * vPEID = 16 bits
+ */
+#define GITS_TYPER_ITT_ENTRY_OFFSET     4
+#define GITS_TYPER_ITT_ENTRY_SIZE       0xB
+#define GITS_TYPER_IDBITS_OFFSET        8
+
+/* 16 bits EventId */
+#define GITS_TYPER_IDBITS             GICD_TYPER_IDBITS
+/* 16 bits DeviceId */
+#define GITS_TYPER_DEVBITS            (0xf << 13)
+/* Collection ID Limit indicated by CIDbits(next) */
+#define GITS_TYPER_CIL                (1ULL << 36)
+/* 16 bits CollectionId */
+#define GITS_TYPER_CIDBITS            (0xfULL << 32)
+/* 8 bytes Device Table Entry size
+ * Valid = 1 bit,ITTAddr = 44 bits,Size = 5 bits
+ */
+#define GITS_DTE_SIZE                 (0x8ULL)
+/* 8 bytes Collection Table Entry size
+ * Valid = 1 bit,RDBase = 36 bits(considering max RDBASE)
+ */
+#define GITS_CTE_SIZE                 (0x8ULL)
+
 /* Special interrupt IDs */
 #define INTID_SECURE 1020
 #define INTID_NONSECURE 1021
 #define INTID_SPURIOUS 1023
 
+/* ITS Commands */
+#define GITS_CMD_CLEAR            0x04
+#define GITS_CMD_DISCARD          0x0F
+#define GITS_CMD_INT              0x03
+#define GITS_CMD_MAPC             0x09
+#define GITS_CMD_MAPD             0x08
+#define GITS_CMD_MAPI             0x0B
+#define GITS_CMD_MAPTI            0x0A
+#define GITS_CMD_SYNC             0x05
+
+#define GITS_ITT_PAGE_SIZE_0      0x1000
+#define GITS_ITT_PAGE_SIZE_1      0x4000
+#define GITS_ITT_PAGE_SIZE_2      0x10000
+
+#define GITS_CMDQ_ENTRY_SIZE               32
+#define GITS_CMDQ_MAX_ENTRIES_PER_PAGE     128
+#define NUM_BYTES_IN_DW                     8
+
+#define CMD_MASK                  0xff
+
+/* MAPC command fields */
+#define ICID_LEN                  16
+#define ICID_MASK                 ((1U << ICID_LEN)-1)
+#define RDBASE_LEN                32
+#define RDBASE_OFFSET             16
+#define RDBASE_MASK               ((1ULL << RDBASE_LEN)-1)
+#define RDBASE_PROCNUM_LEN        16
+#define RDBASE_PROCNUM_MASK       ((1ULL << RDBASE_PROCNUM_LEN)-1)
+
+#define DEVID_OFFSET              32
+#define DEVID_LEN                 32
+#define DEVID_MASK                ((1ULL << DEVID_LEN)-1)
+
+/* MAPD command fields */
+#define ITTADDR_LEN               44
+#define ITTADDR_OFFSET            8
+#define ITTADDR_MASK              ((1ULL << ITTADDR_LEN)-1)
+#define SIZE_MASK                 0x1f
+
+/* MAPI command fields */
+#define EVENTID_MASK              ((1ULL << 32)-1)
+
+/* MAPTI command fields */
+#define pINTID_OFFSET              32
+#define pINTID_MASK               ((1ULL << 32)-1)
+
+#define VALID_SHIFT               63
+#define VALID_MASK                0x1
+
+#define L1TABLE_ENTRY_SIZE         8
+
+#define LPI_CTE_ENABLE_OFFSET      0
+#define LPI_CTE_ENABLED          VALID_MASK
+#define LPI_CTE_PRIORITY_OFFSET    2
+#define LPI_CTE_PRIORITY_MASK     ((1U << 6)-1)
+#define LPI_PRIORITY_MASK         0xfc
+
 /* Functions internal to the emulated GICv3 */
 
 /**
@@ -296,6 +458,9 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
                                unsigned size, MemTxAttrs attrs);
 void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
+bool gicv3_redist_update_lpi(GICv3CPUState *cs);
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 8df3656419..f312acef04 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -8,6 +8,7 @@ softmmu_ss.add(when: 'CONFIG_ARM_GIC', if_true: files(
   'arm_gicv3_dist.c',
   'arm_gicv3_its_common.c',
   'arm_gicv3_redist.c',
+  'arm_gicv3_its.c',
 ))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
 softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 91491a2f66..227e00cbbb 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -36,6 +36,8 @@
 #define GICV3_MAXIRQ 1020
 #define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
 
+#define GICV3_LPI_INTID_START 8192
+
 #define GICV3_REDIST_SIZE 0x20000
 
 /* Number of SGI target-list bits */
@@ -173,6 +175,12 @@ struct GICv3CPUState {
     uint32_t gicr_nsacr;
     uint8_t gicr_ipriorityr[GIC_INTERNAL];
 
+    /* flag to indicate LPIs are out of range
+     * since IDbits from GICR_PROPBASER is less
+     * than 0b1101
+     */
+    bool lpi_outofrange;
+
     /* CPU interface */
     uint64_t icc_sre_el1;
     uint64_t icc_ctlr_el1[2];
@@ -219,6 +227,7 @@ struct GICv3State {
     uint32_t num_cpu;
     uint32_t num_irq;
     uint32_t revision;
+    bool lpi_enable;
     bool security_extn;
     bool irq_reset_nonsecure;
     bool gicd_no_migration_shift_bug;
@@ -226,12 +235,16 @@ struct GICv3State {
     int dev_fd; /* kvm device fd if backed by kvm vgic support */
     Error *migration_blocker;
 
+    MemoryRegion *sysmem;
+    AddressSpace sysmem_as;
+
     /* Distributor */
 
     /* for a GIC with the security extensions the NS banked version of this
      * register is just an alias of bit 1 of the S banked version.
      */
     uint32_t gicd_ctlr;
+    uint32_t gicd_typer;
     uint32_t gicd_statusr[2];
     GIC_DECLARE_BITMAP(group);        /* GICD_IGROUPR */
     GIC_DECLARE_BITMAP(grpmod);       /* GICD_IGRPMODR */
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 5a0952b404..08bc5652ed 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -25,17 +25,24 @@
 #include "hw/intc/arm_gicv3_common.h"
 #include "qom/object.h"
 
+#define TYPE_ARM_GICV3_ITS "arm-gicv3-its"
+
 #define ITS_CONTROL_SIZE 0x10000
 #define ITS_TRANS_SIZE   0x10000
 #define ITS_SIZE         (ITS_CONTROL_SIZE + ITS_TRANS_SIZE)
 
 #define GITS_CTLR        0x0
 #define GITS_IIDR        0x4
+#define GITS_TYPER       0x8
 #define GITS_CBASER      0x80
 #define GITS_CWRITER     0x88
 #define GITS_CREADR      0x90
 #define GITS_BASER       0x100
 
+#define GITS_TRANSLATER  0x0040
+
+#define GITS_PIDR2       0xFFE8
+
 struct GICv3ITSState {
     SysBusDevice parent_obj;
 
@@ -52,6 +59,8 @@ struct GICv3ITSState {
     /* Registers */
     uint32_t ctlr;
     uint32_t iidr;
+    uint32_t translater;
+    uint64_t typer;
     uint64_t cbaser;
     uint64_t cwriter;
     uint64_t creadr;
@@ -62,7 +71,8 @@ struct GICv3ITSState {
 
 typedef struct GICv3ITSState GICv3ITSState;
 
-void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops);
+void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
+                   const MemoryRegionOps *tops);
 
 #define TYPE_ARM_GICV3_ITS_COMMON "arm-gicv3-its-common"
 typedef struct GICv3ITSCommonClass GICv3ITSCommonClass;
-- 
2.27.0


