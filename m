Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C80145150C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 21:21:58 +0100 (CET)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmiUG-000082-Ul
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 15:21:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmiSI-0006P0-4G
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 15:19:57 -0500
Received: from [2a00:1450:4864:20::435] (port=44953
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmiSF-0001we-G9
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 15:19:53 -0500
Received: by mail-wr1-x435.google.com with SMTP id n29so32991534wra.11
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 12:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5DM3N2GiZ5nQ0yywEE7g0QO0v2WNK/EcT7McNX9kK5I=;
 b=PKi56hEpdpUExBPeoVonER5QTQwGwhj2QJKbkHvLT7BK197zdP2lRA4pGWmVMy4AU6
 ksSvL4YGwvnj9o4vckDnkuoFBhvqlav1qnzgEB8FE5/LQ4BdoUsEbIWcczrZj67ynOfM
 63sAw4eFnTVfyya3LRqzJtui5Oeav1SN0U+VJw+n5iSaMNE1Kn+cZEDgWAnFC/ScJ8Ae
 SbzCRoNPHGF8LoKvaqIbdPElfZk0TevtB/vxcK2dUFqV06BogppR+KDqfnG9Xm60jPTW
 1Wd2qiXjuoUGoKK6g+RMKfuUPPTllVbKD2Jt39SQpEXDo/ble4k8vQAqQbTVCaY48nmb
 BZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5DM3N2GiZ5nQ0yywEE7g0QO0v2WNK/EcT7McNX9kK5I=;
 b=oxEY+aUzVpUl1s4RNghKhPqmaFDTMsop/0KY9Tjwh9e0pqlyXY87JMXOgpbjz7fCwc
 13xJgNbqEmICB6lmc+/KpH1h9WJZSVgzTqJkiAJQXMkqofgWxmBD2uT+6cQDAa4wxpF0
 Tl1OHBL51IOfnUnEB0H1DFmA/JvY6Huo5KB4uWY4hkJjE8QABY/Vol5qR2sen/Mzm0Qq
 rfjYypszI8hE7N9DjdUNp3jaynJQC7AeaTAtlMyPPHN/8OwRJ6gwtcRB+6dbYeU8cZmx
 E1oqf2KIhCivuRS8oSK9DKmauk5fXJ+zKNatmmWQPfsWtQq/cYwCqwwWclQuVuMe6RMl
 kV/w==
X-Gm-Message-State: AOAM531qpypPS1X61NNF5/ykR6V42QbyGXy8L1P/6s0eeHZrtdIki67b
 QhypYOGsClTBFD5sqOi6y8/13kCCwT1p6g==
X-Google-Smtp-Source: ABdhPJxw4FsyNykZaDYenJtP3yKFrfKpshVVsAz4BB2hmfnnKzS29lGHbUqLkgn203AjcIrVyGNeBA==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr2075352wrm.259.1637007590016; 
 Mon, 15 Nov 2021 12:19:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm15419033wrs.48.2021.11.15.12.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 12:19:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] hw/intc/arm_gicv3: Support multiple redistributor regions
Date: Mon, 15 Nov 2021 20:19:45 +0000
Message-Id: <20211115201946.327770-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115201946.327770-1-peter.maydell@linaro.org>
References: <20211115201946.327770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our GICv3 QOM interface includes an array property
redist-region-count which allows board models to specify that the
registributor registers are not in a single contiguous range, but
split into multiple pieces.  We implemented this for KVM, but
currently the TCG GICv3 model insists that there is only one region.
You can see the limit being hit with a setup like:
  qemu-system-aarch64 -machine virt,gic-version=3 -smp 124

Add support for split regions to the TCG GICv3.  To do this we switch
from allocating a simple array of MemoryRegions to an array of
GICv3RedistRegion structs so that we can use the GICv3RedistRegion as
the opaque pointer in the MemoryRegion read/write callbacks.  Each
GICv3RedistRegion contains the MemoryRegion, a backpointer allowing
the read/write callback to get hold of the GICv3State, and an index
which allows us to calculate which CPU's redistributor is being
accessed.

Note that arm_gicv3_kvm always passes in NULL as the ops argument
to gicv3_init_irqs_and_mmio(), so the only MemoryRegion read/write
callbacks we need to update to handle this new scheme are the
gicv3_redist_read/write functions used by the emulated GICv3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/intc/arm_gicv3_common.h | 12 ++++++++-
 hw/intc/arm_gicv3.c                |  6 -----
 hw/intc/arm_gicv3_common.c         | 15 ++++++++---
 hw/intc/arm_gicv3_kvm.c            |  4 +--
 hw/intc/arm_gicv3_redist.c         | 40 ++++++++++++++++--------------
 5 files changed, 46 insertions(+), 31 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index cb2b0d0ad45..fc38e4b7dca 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -215,13 +215,23 @@ struct GICv3CPUState {
     bool seenbetter;
 };
 
+/*
+ * The redistributor pages might be split into more than one region
+ * on some machine types if there are many CPUs.
+ */
+typedef struct GICv3RedistRegion {
+    GICv3State *gic;
+    MemoryRegion iomem;
+    uint32_t cpuidx; /* index of first CPU this region covers */
+} GICv3RedistRegion;
+
 struct GICv3State {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
 
     MemoryRegion iomem_dist; /* Distributor */
-    MemoryRegion *iomem_redist; /* Redistributor Regions */
+    GICv3RedistRegion *redist_regions; /* Redistributor Regions */
     uint32_t *redist_region_count; /* redistributor count within each region */
     uint32_t nb_redist_regions; /* number of redist regions */
 
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index bcf54a5f0a5..c6282984b1e 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -387,12 +387,6 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (s->nb_redist_regions != 1) {
-        error_setg(errp, "VGICv3 redist region number(%d) not equal to 1",
-                   s->nb_redist_regions);
-        return;
-    }
-
     gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops);
 
     gicv3_init_cpuif(s);
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 8de9205b386..9884d2e39b9 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -254,6 +254,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(s);
     int i;
+    int cpuidx;
 
     /* For the GIC, also expose incoming GPIO lines for PPIs for each CPU.
      * GPIO array layout is thus:
@@ -282,14 +283,20 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
                           "gicv3_dist", 0x10000);
     sysbus_init_mmio(sbd, &s->iomem_dist);
 
-    s->iomem_redist = g_new0(MemoryRegion, s->nb_redist_regions);
+    s->redist_regions = g_new0(GICv3RedistRegion, s->nb_redist_regions);
+    cpuidx = 0;
     for (i = 0; i < s->nb_redist_regions; i++) {
         char *name = g_strdup_printf("gicv3_redist_region[%d]", i);
+        GICv3RedistRegion *region = &s->redist_regions[i];
 
-        memory_region_init_io(&s->iomem_redist[i], OBJECT(s),
-                              ops ? &ops[1] : NULL, s, name,
+        region->gic = s;
+        region->cpuidx = cpuidx;
+        cpuidx += s->redist_region_count[i];
+
+        memory_region_init_io(&region->iomem, OBJECT(s),
+                              ops ? &ops[1] : NULL, region, name,
                               s->redist_region_count[i] * GICV3_REDIST_SIZE);
-        sysbus_init_mmio(sbd, &s->iomem_redist[i]);
+        sysbus_init_mmio(sbd, &region->iomem);
         g_free(name);
     }
 }
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index ab58c73306d..5ec5ff9ef6e 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -825,7 +825,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
                             KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd, 0);
 
     if (!multiple_redist_region_allowed) {
-        kvm_arm_register_device(&s->iomem_redist[0], -1,
+        kvm_arm_register_device(&s->redist_regions[0].iomem, -1,
                                 KVM_DEV_ARM_VGIC_GRP_ADDR,
                                 KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd, 0);
     } else {
@@ -838,7 +838,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
             uint64_t addr_ormask =
                         i | ((uint64_t)s->redist_region_count[i] << 52);
 
-            kvm_arm_register_device(&s->iomem_redist[i], -1,
+            kvm_arm_register_device(&s->redist_regions[i].iomem, -1,
                                     KVM_DEV_ARM_VGIC_GRP_ADDR,
                                     KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION,
                                     s->dev_fd, addr_ormask);
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 7072bfcbb1d..424e7e28a86 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -425,22 +425,24 @@ static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
 MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
                               unsigned size, MemTxAttrs attrs)
 {
-    GICv3State *s = opaque;
+    GICv3RedistRegion *region = opaque;
+    GICv3State *s = region->gic;
     GICv3CPUState *cs;
     MemTxResult r;
     int cpuidx;
 
     assert((offset & (size - 1)) == 0);
 
-    /* This region covers all the redistributor pages; there are
-     * (for GICv3) two 64K pages per CPU. At the moment they are
-     * all contiguous (ie in this one region), though we might later
-     * want to allow splitting of redistributor pages into several
-     * blocks so we can support more CPUs.
+    /*
+     * There are (for GICv3) two 64K redistributor pages per CPU.
+     * In some cases the redistributor pages for all CPUs are not
+     * contiguous (eg on the virt board they are split into two
+     * parts if there are too many CPUs to all fit in the same place
+     * in the memory map); if so then the GIC has multiple MemoryRegions
+     * for the redistributors.
      */
-    cpuidx = offset / 0x20000;
-    offset %= 0x20000;
-    assert(cpuidx < s->num_cpu);
+    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
+    offset %= GICV3_REDIST_SIZE;
 
     cs = &s->cpu[cpuidx];
 
@@ -482,22 +484,24 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
 MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
                                unsigned size, MemTxAttrs attrs)
 {
-    GICv3State *s = opaque;
+    GICv3RedistRegion *region = opaque;
+    GICv3State *s = region->gic;
     GICv3CPUState *cs;
     MemTxResult r;
     int cpuidx;
 
     assert((offset & (size - 1)) == 0);
 
-    /* This region covers all the redistributor pages; there are
-     * (for GICv3) two 64K pages per CPU. At the moment they are
-     * all contiguous (ie in this one region), though we might later
-     * want to allow splitting of redistributor pages into several
-     * blocks so we can support more CPUs.
+    /*
+     * There are (for GICv3) two 64K redistributor pages per CPU.
+     * In some cases the redistributor pages for all CPUs are not
+     * contiguous (eg on the virt board they are split into two
+     * parts if there are too many CPUs to all fit in the same place
+     * in the memory map); if so then the GIC has multiple MemoryRegions
+     * for the redistributors.
      */
-    cpuidx = offset / 0x20000;
-    offset %= 0x20000;
-    assert(cpuidx < s->num_cpu);
+    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
+    offset %= GICV3_REDIST_SIZE;
 
     cs = &s->cpu[cpuidx];
 
-- 
2.25.1


