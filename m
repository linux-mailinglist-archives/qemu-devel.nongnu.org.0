Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8B41DD06
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:11:24 +0200 (CEST)
Received: from localhost ([::1]:48782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxiV-00066R-5R
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxg7-0003xv-8G
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:08:56 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:45630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxg4-00019O-EE
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:08:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 b192-20020a1c1bc9000000b0030cfaf18864so4592037wmb.4
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8L0rcLYer97m5XJ0cEUlqhLq50Ovc127of8s10tTwzA=;
 b=zGBH/N6ArzRb3OFkcJyuQT8GuBySnMNe1+ylz8AzFz9AZTIgu41u2SxVB0GF53nt9x
 j6s7uEsT065GcjsqEZN/DKW7CNjjqjKs7bdrkQdrSeuLMMIjQXm3n5L6fv1Lt+bC7Bkm
 rv2QIeKYH1mOUDOvLfUzZEV3U9kL8Ia/7odclWmkuThV/ny2Ell+7vLEZaXxbpoezqie
 xHqlY6wgBC3q31LUveamuNyn2Z94Cy3mV5INSQT1au56F6FyaPq3qDHt9/HDpFLGFj2Y
 CMzHgO86U4Vzbotgvrh8a4R1eMoOioM0vYMBX5sooVCFZxcxVC3ClNNt9A8UKa70LO+W
 T7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8L0rcLYer97m5XJ0cEUlqhLq50Ovc127of8s10tTwzA=;
 b=rHSrQIL1g9vHFggXivWqYb4E5ixfaGvT2Uayd2IqBDUy1rNU8u8yDnjmD2p93I+Pxz
 3pqCY4IQnC7zcZFvXHQ0V1+WhMh3AmA78KXyUoxj+3rnWCTjLsghfJByddQ8Woc7ni+M
 ihxsj+BaaS882iljLehXGtN/ArpItDjDRog2MO0bkNLguUEeQKTCSfa5mLv3H0FWwTmP
 AXFGDF8ksTviiLHpNHQrjVS3mFu10s/iwgabFpKTKbQOh9X5ws436LReWrV3iCvcfqU5
 SnlHY9K3XoLCkBZECx35aEKb5cZMsDz/aM0WK6j9WDUrjBREn1djCRFVk8nuARV22lBq
 zw2w==
X-Gm-Message-State: AOAM531rsZElkJ9qy/5s9LdzKj47mW8euVzmSx+iKMTtmjd7/tIaooLN
 AHFJEYw8bpbRKWWHoHQSjbSSuQ==
X-Google-Smtp-Source: ABdhPJxTP2EWNXVNH4KZwNQVc0w0QgeMtnrug9QjRoK3pwBRFO/p8uqRBH8xoRImXUr84ctPBP5XVQ==
X-Received: by 2002:a05:600c:2193:: with SMTP id
 e19mr5986608wme.38.1633014530680; 
 Thu, 30 Sep 2021 08:08:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o26sm5085942wmc.17.2021.09.30.08.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:08:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/intc/arm_gicv3: Support multiple redistributor regions
Date: Thu, 30 Sep 2021 16:08:42 +0100
Message-Id: <20210930150842.3810-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930150842.3810-1-peter.maydell@linaro.org>
References: <20210930150842.3810-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
index ab58c73306d..2ca7152500c 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -825,7 +825,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
                             KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd, 0);
 
     if (!multiple_redist_region_allowed) {
-        kvm_arm_register_device(&s->iomem_redist[0], -1,
+        kvm_arm_register_device(&s->redist[0].iomem, -1,
                                 KVM_DEV_ARM_VGIC_GRP_ADDR,
                                 KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd, 0);
     } else {
@@ -838,7 +838,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
             uint64_t addr_ormask =
                         i | ((uint64_t)s->redist_region_count[i] << 52);
 
-            kvm_arm_register_device(&s->iomem_redist[i], -1,
+            kvm_arm_register_device(&s->redist[i].iomem, -1,
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
2.20.1


