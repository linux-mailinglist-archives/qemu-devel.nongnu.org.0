Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD4A5EC8C5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:58:09 +0200 (CEST)
Received: from localhost ([::1]:46742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCyG-0002LZ-U1
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMm-000595-PO
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:20 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMf-0005y9-Hj
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:20 -0400
Received: by mail-wm1-x329.google.com with SMTP id iv17so6621186wmb.4
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=r0tBXvF/ifeoq8b5qrcFwHoN4i2ZgT7ReFA291oacHo=;
 b=kv34vR1csQQ4KdNOsTQCVTPCw8psYKECHCtNqbWdHe88h7QWnJa+mJkY6MD3Os8Hdt
 noEzWWrPgogIgyiFH3K45ZB6j8AaVhutapgVo6W9d+gLMJ8YB5uAbiSyXh5JVU9BaMya
 QyGpFuko1Y00wrIgiuwnN59CXdichDHgOqAepebzHyg5i3Wi6PES/Jr5u3+w+jMjUiut
 Z7TffNI4CEr1vrKtJGSDgy0jussRyo++ztmXn9UkAZ3oc/jT6l18xuTdATFhsC+9omze
 foKrCKIt957JFIxKr2g4TkEliLQb1oPY+I3qOEylzbkGmmDlbOvN06HFD5o1jOz7kL1K
 Rl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=r0tBXvF/ifeoq8b5qrcFwHoN4i2ZgT7ReFA291oacHo=;
 b=7kgE3NAhMZdyvMY9kPrali0KBfbHO+fLCi3bjMyEjRX6DoPEFPr0VN9e752TFcUirc
 2uOL7wP5vKP0EOH4bUEH5jByCFU/4eoyT2eKC2i/nFh7UarOMZOYkxvABYeDhSNRQco6
 ONpJTEY1QQGvHzaMV4bzHKxHy3DBbkBkL1NslNaSZPUean0oiM9BmwTMUDNPTFhvxIR7
 36Vv2NbsT6NOSjgRODqZfigZscb3lHhEbKNC4P3YtCeUXX122NtZsiCvgFbF/TeyDkda
 SSfag0SARSzBUSSzAWIe5Nn+X7oq/QN2dMlhbuyIxwNDSwGhhb+ptlop2PRRTX1fji98
 PLng==
X-Gm-Message-State: ACrzQf0iInaze9M/K3KRDGEhCom5Y0z+AbXBK/7BWouXMlsZgKViXnvq
 Y5wm3BxCbk1NhmcGY/cyW7qzNg==
X-Google-Smtp-Source: AMsMyM4l/dgNZbJGJoOOu+1g+yWn5ka2aovubNcPnT9iHWtE52Gu0l9nUoDJlF8KwZjRRnsTEGsc0A==
X-Received: by 2002:a05:600c:4f13:b0:3b4:9a07:efdb with SMTP id
 l19-20020a05600c4f1300b003b49a07efdbmr2879933wmq.94.1664288112156; 
 Tue, 27 Sep 2022 07:15:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b003b332a7bf15sm15107398wms.7.2022.09.27.07.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:15:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ACAF41FFB7;
 Tue, 27 Sep 2022 15:15:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v3 08/15] hw/intc/gic: use MxTxAttrs to divine accessing CPU
Date: Tue, 27 Sep 2022 15:14:57 +0100
Message-Id: <20220927141504.3886314-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Now that MxTxAttrs encodes a CPU we should use that to figure it out.
This solves edge cases like accessing via gdbstub or qtest. As we
should only be processing accesses from CPU cores we can push the CPU
extraction logic out to the main access functions. If the access does
not come from a CPU we log it and fail the transaction with
MEMTX_ACCESS_ERROR.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124

---
v2
  - update for new field
  - bool asserts
v3
  - fail non-CPU transactions
---
 hw/intc/arm_gic.c | 174 +++++++++++++++++++++++++++++++---------------
 1 file changed, 118 insertions(+), 56 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 492b2421ab..7b4f3fb81a 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -56,17 +56,42 @@ static const uint8_t gic_id_gicv2[] = {
     0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0xb1
 };
 
-static inline int gic_get_current_cpu(GICState *s)
+
+/*
+ * The GIC should only be accessed by the CPU so if it is not we
+ * should fail the transaction (it would either be a bug in how we've
+ * wired stuff up, a limitation of the translator or the guest doing
+ * something weird like programming a DMA master to write to the MMIO
+ * region).
+ *
+ * Note the cpu_index is global and we currently don't have any models
+ * with multiple SoC's with different CPUs. However if we did we would
+ * need to transform the cpu_index into the socket core.
+ */
+typedef struct {
+    bool valid;
+    int cpu_index;
+} GicCPU;
+
+static inline GicCPU gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
 {
-    if (!qtest_enabled() && s->num_cpu > 1) {
-        return current_cpu->cpu_index;
+    if (attrs.requester_type != MTRT_CPU) {
+        qemu_log_mask(LOG_UNIMP | LOG_GUEST_ERROR,
+                      "%s: saw non-CPU transaction", __func__);
+        return (GicCPU) { .valid = false };
     }
-    return 0;
+    g_assert(attrs.requester_id < s->num_cpu);
+
+    return (GicCPU) { .valid = true, .cpu_index = attrs.requester_id };
 }
 
-static inline int gic_get_current_vcpu(GICState *s)
+static inline GicCPU gic_get_current_vcpu(GICState *s, MemTxAttrs attrs)
 {
-    return gic_get_current_cpu(s) + GIC_NCPU;
+    GicCPU cpu = gic_get_current_cpu(s, attrs);
+    if (cpu.valid) {
+        cpu.cpu_index += GIC_NCPU;
+    }
+    return cpu;
 }
 
 /* Return true if this GIC config has interrupt groups, which is
@@ -941,17 +966,14 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
     gic_update(s);
 }
 
-static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
+static uint32_t gic_dist_readb(GICState *s, int cpu, hwaddr offset, MemTxAttrs attrs)
 {
-    GICState *s = (GICState *)opaque;
     uint32_t res;
     int irq;
     int i;
-    int cpu;
     int cm;
     int mask;
 
-    cpu = gic_get_current_cpu(s);
     cm = 1 << cpu;
     if (offset < 0x100) {
         if (offset == 0) {      /* GICD_CTLR */
@@ -1152,19 +1174,26 @@ bad_reg:
 static MemTxResult gic_dist_read(void *opaque, hwaddr offset, uint64_t *data,
                                  unsigned size, MemTxAttrs attrs)
 {
+    GICState *s = (GICState *)opaque;
+    GicCPU cpu = gic_get_current_cpu(s, attrs);
+
+    if (!cpu.valid) {
+        return MEMTX_ACCESS_ERROR;
+    }
+
     switch (size) {
     case 1:
-        *data = gic_dist_readb(opaque, offset, attrs);
+        *data = gic_dist_readb(s, cpu.cpu_index, offset, attrs);
         break;
     case 2:
-        *data = gic_dist_readb(opaque, offset, attrs);
-        *data |= gic_dist_readb(opaque, offset + 1, attrs) << 8;
+        *data = gic_dist_readb(s, cpu.cpu_index, offset, attrs);
+        *data |= gic_dist_readb(s, cpu.cpu_index, offset + 1, attrs) << 8;
         break;
     case 4:
-        *data = gic_dist_readb(opaque, offset, attrs);
-        *data |= gic_dist_readb(opaque, offset + 1, attrs) << 8;
-        *data |= gic_dist_readb(opaque, offset + 2, attrs) << 16;
-        *data |= gic_dist_readb(opaque, offset + 3, attrs) << 24;
+        *data = gic_dist_readb(s, cpu.cpu_index, offset, attrs);
+        *data |= gic_dist_readb(s, cpu.cpu_index, offset + 1, attrs) << 8;
+        *data |= gic_dist_readb(s, cpu.cpu_index, offset + 2, attrs) << 16;
+        *data |= gic_dist_readb(s, cpu.cpu_index, offset + 3, attrs) << 24;
         break;
     default:
         return MEMTX_ERROR;
@@ -1174,15 +1203,12 @@ static MemTxResult gic_dist_read(void *opaque, hwaddr offset, uint64_t *data,
     return MEMTX_OK;
 }
 
-static void gic_dist_writeb(void *opaque, hwaddr offset,
+static void gic_dist_writeb(GICState *s, int cpu, hwaddr offset,
                             uint32_t value, MemTxAttrs attrs)
 {
-    GICState *s = (GICState *)opaque;
     int irq;
     int i;
-    int cpu;
 
-    cpu = gic_get_current_cpu(s);
     if (offset < 0x100) {
         if (offset == 0) {
             if (s->security_extn && !attrs.secure) {
@@ -1459,24 +1485,21 @@ bad_reg:
                   "gic_dist_writeb: Bad offset %x\n", (int)offset);
 }
 
-static void gic_dist_writew(void *opaque, hwaddr offset,
+static void gic_dist_writew(GICState *s, int cpu, hwaddr offset,
                             uint32_t value, MemTxAttrs attrs)
 {
-    gic_dist_writeb(opaque, offset, value & 0xff, attrs);
-    gic_dist_writeb(opaque, offset + 1, value >> 8, attrs);
+    gic_dist_writeb(s, cpu, offset, value & 0xff, attrs);
+    gic_dist_writeb(s, cpu, offset + 1, value >> 8, attrs);
 }
 
-static void gic_dist_writel(void *opaque, hwaddr offset,
+static void gic_dist_writel(GICState *s, int cpu, hwaddr offset,
                             uint32_t value, MemTxAttrs attrs)
 {
-    GICState *s = (GICState *)opaque;
     if (offset == 0xf00) {
-        int cpu;
         int irq;
         int mask;
         int target_cpu;
 
-        cpu = gic_get_current_cpu(s);
         irq = value & 0xf;
         switch ((value >> 24) & 3) {
         case 0:
@@ -1503,24 +1526,31 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
         gic_update(s);
         return;
     }
-    gic_dist_writew(opaque, offset, value & 0xffff, attrs);
-    gic_dist_writew(opaque, offset + 2, value >> 16, attrs);
+    gic_dist_writew(s, cpu, offset, value & 0xffff, attrs);
+    gic_dist_writew(s, cpu, offset + 2, value >> 16, attrs);
 }
 
 static MemTxResult gic_dist_write(void *opaque, hwaddr offset, uint64_t data,
                                   unsigned size, MemTxAttrs attrs)
 {
+    GICState *s = (GICState *)opaque;
+    GicCPU cpu = gic_get_current_cpu(s, attrs);
+
+    if (!cpu.valid) {
+        return MEMTX_ACCESS_ERROR;
+    }
+
     trace_gic_dist_write(offset, size, data);
 
     switch (size) {
     case 1:
-        gic_dist_writeb(opaque, offset, data, attrs);
+        gic_dist_writeb(s, cpu.cpu_index, offset, data, attrs);
         return MEMTX_OK;
     case 2:
-        gic_dist_writew(opaque, offset, data, attrs);
+        gic_dist_writew(s, cpu.cpu_index, offset, data, attrs);
         return MEMTX_OK;
     case 4:
-        gic_dist_writel(opaque, offset, data, attrs);
+        gic_dist_writel(s, cpu.cpu_index, offset, data, attrs);
         return MEMTX_OK;
     default:
         return MEMTX_ERROR;
@@ -1780,7 +1810,12 @@ static MemTxResult gic_thiscpu_read(void *opaque, hwaddr addr, uint64_t *data,
                                     unsigned size, MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-    return gic_cpu_read(s, gic_get_current_cpu(s), addr, data, attrs);
+    GicCPU cpu = gic_get_current_cpu(s, attrs);
+    if (cpu.valid) {
+        return gic_cpu_read(s, cpu.cpu_index, addr, data, attrs);
+    } else {
+        return MEMTX_ACCESS_ERROR;
+    }
 }
 
 static MemTxResult gic_thiscpu_write(void *opaque, hwaddr addr,
@@ -1788,7 +1823,12 @@ static MemTxResult gic_thiscpu_write(void *opaque, hwaddr addr,
                                      MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-    return gic_cpu_write(s, gic_get_current_cpu(s), addr, value, attrs);
+    GicCPU cpu = gic_get_current_cpu(s, attrs);
+    if (cpu.valid) {
+        return gic_cpu_write(s, cpu.cpu_index, addr, value, attrs);
+    } else {
+        return MEMTX_ACCESS_ERROR;
+    }
 }
 
 /* Wrappers to read/write the GIC CPU interface for a specific CPU.
@@ -1817,8 +1857,12 @@ static MemTxResult gic_thisvcpu_read(void *opaque, hwaddr addr, uint64_t *data,
                                     unsigned size, MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-
-    return gic_cpu_read(s, gic_get_current_vcpu(s), addr, data, attrs);
+    GicCPU cpu = gic_get_current_vcpu(s, attrs);
+    if (cpu.valid) {
+        return gic_cpu_read(s, cpu.cpu_index, addr, data, attrs);
+    } else {
+        return MEMTX_ACCESS_ERROR;
+    }
 }
 
 static MemTxResult gic_thisvcpu_write(void *opaque, hwaddr addr,
@@ -1826,8 +1870,12 @@ static MemTxResult gic_thisvcpu_write(void *opaque, hwaddr addr,
                                      MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-
-    return gic_cpu_write(s, gic_get_current_vcpu(s), addr, value, attrs);
+    GicCPU cpu = gic_get_current_vcpu(s, attrs);
+    if (cpu.valid) {
+        return gic_cpu_write(s, cpu.cpu_index, addr, value, attrs);
+    } else {
+        return MEMTX_ACCESS_ERROR;
+    }
 }
 
 static uint32_t gic_compute_eisr(GICState *s, int cpu, int lr_start)
@@ -1858,9 +1906,8 @@ static uint32_t gic_compute_elrsr(GICState *s, int cpu, int lr_start)
     return ret;
 }
 
-static void gic_vmcr_write(GICState *s, uint32_t value, MemTxAttrs attrs)
+static void gic_vmcr_write(GICState *s, int vcpu, uint32_t value, MemTxAttrs attrs)
 {
-    int vcpu = gic_get_current_vcpu(s);
     uint32_t ctlr;
     uint32_t abpr;
     uint32_t bpr;
@@ -1881,7 +1928,10 @@ static MemTxResult gic_hyp_read(void *opaque, int cpu, hwaddr addr,
                                 uint64_t *data, MemTxAttrs attrs)
 {
     GICState *s = ARM_GIC(opaque);
-    int vcpu = cpu + GIC_NCPU;
+    GicCPU vcpu = gic_get_current_vcpu(s, attrs);
+    if (!vcpu.valid) {
+        return MEMTX_ACCESS_ERROR;
+    }
 
     switch (addr) {
     case A_GICH_HCR: /* Hypervisor Control */
@@ -1898,11 +1948,11 @@ static MemTxResult gic_hyp_read(void *opaque, int cpu, hwaddr addr,
 
     case A_GICH_VMCR: /* Virtual Machine Control */
         *data = FIELD_DP32(0, GICH_VMCR, VMCCtlr,
-                           extract32(s->cpu_ctlr[vcpu], 0, 10));
-        *data = FIELD_DP32(*data, GICH_VMCR, VMABP, s->abpr[vcpu]);
-        *data = FIELD_DP32(*data, GICH_VMCR, VMBP, s->bpr[vcpu]);
+                           extract32(s->cpu_ctlr[vcpu.cpu_index], 0, 10));
+        *data = FIELD_DP32(*data, GICH_VMCR, VMABP, s->abpr[vcpu.cpu_index]);
+        *data = FIELD_DP32(*data, GICH_VMCR, VMBP, s->bpr[vcpu.cpu_index]);
         *data = FIELD_DP32(*data, GICH_VMCR, VMPriMask,
-                           extract32(s->priority_mask[vcpu], 3, 5));
+                           extract32(s->priority_mask[vcpu.cpu_index], 3, 5));
         break;
 
     case A_GICH_MISR: /* Maintenance Interrupt Status */
@@ -1949,7 +1999,10 @@ static MemTxResult gic_hyp_write(void *opaque, int cpu, hwaddr addr,
                                  uint64_t value, MemTxAttrs attrs)
 {
     GICState *s = ARM_GIC(opaque);
-    int vcpu = cpu + GIC_NCPU;
+    GicCPU vcpu = gic_get_current_vcpu(s, attrs);
+    if (!vcpu.valid) {
+        return MEMTX_ACCESS_ERROR;
+    }
 
     trace_gic_hyp_write(addr, value);
 
@@ -1959,12 +2012,13 @@ static MemTxResult gic_hyp_write(void *opaque, int cpu, hwaddr addr,
         break;
 
     case A_GICH_VMCR: /* Virtual Machine Control */
-        gic_vmcr_write(s, value, attrs);
+        gic_vmcr_write(s, vcpu.cpu_index, value, attrs);
         break;
 
     case A_GICH_APR: /* Active Priorities */
         s->h_apr[cpu] = value;
-        s->running_priority[vcpu] = gic_get_prio_from_apr_bits(s, vcpu);
+        s->running_priority[vcpu.cpu_index] =
+            gic_get_prio_from_apr_bits(s, vcpu.cpu_index);
         break;
 
     case A_GICH_LR0 ... A_GICH_LR63: /* List Registers */
@@ -1991,20 +2045,28 @@ static MemTxResult gic_hyp_write(void *opaque, int cpu, hwaddr addr,
 }
 
 static MemTxResult gic_thiscpu_hyp_read(void *opaque, hwaddr addr, uint64_t *data,
-                                    unsigned size, MemTxAttrs attrs)
+                                        unsigned size, MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-
-    return gic_hyp_read(s, gic_get_current_cpu(s), addr, data, attrs);
+    GicCPU cpu = gic_get_current_cpu(s, attrs);
+    if (cpu.valid) {
+        return gic_hyp_read(s, cpu.cpu_index, addr, data, attrs);
+    } else {
+        return MEMTX_ACCESS_ERROR;
+    }
 }
 
 static MemTxResult gic_thiscpu_hyp_write(void *opaque, hwaddr addr,
-                                     uint64_t value, unsigned size,
-                                     MemTxAttrs attrs)
+                                         uint64_t value, unsigned size,
+                                         MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-
-    return gic_hyp_write(s, gic_get_current_cpu(s), addr, value, attrs);
+    GicCPU cpu = gic_get_current_cpu(s, attrs);
+    if (cpu.valid) {
+        return gic_hyp_write(s, cpu.cpu_index, addr, value, attrs);
+    } else {
+        return MEMTX_ACCESS_ERROR;
+    }
 }
 
 static MemTxResult gic_do_hyp_read(void *opaque, hwaddr addr, uint64_t *data,
-- 
2.34.1


