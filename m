Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5006626116
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:28:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYiy-00087n-MM; Fri, 11 Nov 2022 13:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYir-00084n-46
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:49 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYik-0005Fq-Eb
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:48 -0500
Received: by mail-wr1-x430.google.com with SMTP id d9so2818749wrm.13
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wj2jpKFKaCJfkPE6OoW08uPMwZbV7IZcdHHoNHuye0E=;
 b=AItZgk5++O/TvV5hJ0FHkaaImlcCgkVIlFScFFxdShONe6/I3cH+cpIpGgB8C3hKoI
 LOePtu4CWeCKga4rEswk+/uYlK7oiiZJp1H7xiw4vrKiQGhnCsCioQyaz7+XiRF9pOEI
 Kk5A/NvtvPVBvOxI7C1g1kZmP/oB3Pu3E9NjbiWAQ9OQyN0Gs88YFT7U2B/+GNknXdeT
 ozMyhVtWqvUpdIlJT5qYPwq5psBg+Ug19dp9YIiOLbh1yHAfHf0rP5THy/t1VoKrfR5s
 nGgowqaT+3uSYDhyOEgB3EUVZCXCNUd2P6lWdQmgWVLphyfxIqFyesiKVC/i39SG/5zR
 Qcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wj2jpKFKaCJfkPE6OoW08uPMwZbV7IZcdHHoNHuye0E=;
 b=wHRhd0eaHs53ed7mtik1rG5TXgea/hw7gFo1e2iib1CRHsQ5FwbKkkaerJWaGG08T8
 3QRLthRpyB6aZ49fRqrTvCSm6GOKNFxZbbf+XBRYFA79eNIlCZtofNZrthRVtoxOBmc/
 Bj8svjdOnl9RsOpQaDqJf73OYGKGqvDQ0Eyo7mqZBdb4VEIROga82Dd681U1aW5rjkF5
 RPm4XGcfv0HF3646o652m0Pf96Et7yKtgLgFKBoeRMne//ciCQdzQit053zYR5LNSZEt
 dLFrPTlleOWGK9yr3AcfuH5CHjEi4nD7+C9JmKkNHwTkgLShlY6XVErUt4idH4ktbeQy
 tagg==
X-Gm-Message-State: ANoB5pmGa7vzFKhqtWK3AdBLihySVHF91VjFhRO0Hy5/rL8mb3/3F0ev
 48D9hmTlcqfr4a43kUOsK4kbDQ==
X-Google-Smtp-Source: AA0mqf58IeBPPWCzouZRKka4jaw89Qvwr5wkiQQN6tKh/Al6hGDrpDnu322xkq3KVdSxi3NWTOksdw==
X-Received: by 2002:adf:fc4a:0:b0:22e:307c:cc39 with SMTP id
 e10-20020adffc4a000000b0022e307ccc39mr2007963wrs.690.1668191140897; 
 Fri, 11 Nov 2022 10:25:40 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ay19-20020a05600c1e1300b003c6bbe910fdsm11410141wmb.9.2022.11.11.10.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 592331FFBF;
 Fri, 11 Nov 2022 18:25:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM cores)
Subject: [PATCH  v5 07/20] hw/intc/gic: use MxTxAttrs to divine accessing CPU
Date: Fri, 11 Nov 2022 18:25:22 +0000
Message-Id: <20221111182535.64844-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
v5
  - split gic_valid_cpu from gic_get_current_cpu and use this
  - fix dud return false from gic_valid_cpu()
---
 hw/intc/arm_gic.c | 159 +++++++++++++++++++++++++++++-----------------
 1 file changed, 102 insertions(+), 57 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 65b1ef7151..62f36b247f 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -56,17 +56,38 @@ static const uint8_t gic_id_gicv2[] = {
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
+
+static bool gic_valid_cpu(MemTxAttrs attrs)
 {
-    if (!qtest_enabled() && s->num_cpu > 1) {
-        return current_cpu->cpu_index;
+    if (attrs.requester_type != MTRT_CPU) {
+        qemu_log_mask(LOG_UNIMP | LOG_GUEST_ERROR,
+                      "%s: saw non-CPU transaction", __func__);
+        return false;
     }
-    return 0;
+    return true;
+}
+
+static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
+{
+    g_assert(attrs.requester_id < s->num_cpu);
+    return attrs.requester_id;
 }
 
-static inline int gic_get_current_vcpu(GICState *s)
+static inline int gic_get_current_vcpu(GICState *s, MemTxAttrs attrs)
 {
-    return gic_get_current_cpu(s) + GIC_NCPU;
+    return gic_get_current_cpu(s, attrs) + GIC_NCPU;
 }
 
 /* Return true if this GIC config has interrupt groups, which is
@@ -945,17 +966,14 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
  * Although this is named a byte read we don't always return bytes and
  * rely on the calling function oring bits together.
  */
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
         if (offset < 0xc) {
@@ -1168,19 +1186,27 @@ bad_reg:
 static MemTxResult gic_dist_read(void *opaque, hwaddr offset, uint64_t *data,
                                  unsigned size, MemTxAttrs attrs)
 {
+    GICState *s = (GICState *)opaque;
+    int cpu;
+
+    if (!gic_valid_cpu(attrs)) {
+        return MEMTX_ACCESS_ERROR;
+    }
+    cpu = gic_get_current_cpu(s, attrs);
+
     switch (size) {
     case 1:
-        *data = gic_dist_readb(opaque, offset, attrs);
+        *data = gic_dist_readb(s, cpu, offset, attrs);
         break;
     case 2:
-        *data = gic_dist_readb(opaque, offset, attrs);
-        *data |= gic_dist_readb(opaque, offset + 1, attrs) << 8;
+        *data = gic_dist_readb(s, cpu, offset, attrs);
+        *data |= gic_dist_readb(s, cpu, offset + 1, attrs) << 8;
         break;
     case 4:
-        *data = gic_dist_readb(opaque, offset, attrs);
-        *data |= gic_dist_readb(opaque, offset + 1, attrs) << 8;
-        *data |= gic_dist_readb(opaque, offset + 2, attrs) << 16;
-        *data |= gic_dist_readb(opaque, offset + 3, attrs) << 24;
+        *data = gic_dist_readb(s, cpu, offset, attrs);
+        *data |= gic_dist_readb(s, cpu, offset + 1, attrs) << 8;
+        *data |= gic_dist_readb(s, cpu, offset + 2, attrs) << 16;
+        *data |= gic_dist_readb(s, cpu, offset + 3, attrs) << 24;
         break;
     default:
         return MEMTX_ERROR;
@@ -1190,15 +1216,12 @@ static MemTxResult gic_dist_read(void *opaque, hwaddr offset, uint64_t *data,
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
@@ -1475,24 +1498,21 @@ bad_reg:
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
@@ -1519,24 +1539,32 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
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
+    int cpu;
+
+    if (!gic_valid_cpu(attrs)) {
+        return MEMTX_ACCESS_ERROR;
+    }
+    cpu = gic_get_current_cpu(s, attrs);
+
     trace_gic_dist_write(offset, size, data);
 
     switch (size) {
     case 1:
-        gic_dist_writeb(opaque, offset, data, attrs);
+        gic_dist_writeb(s, cpu, offset, data, attrs);
         return MEMTX_OK;
     case 2:
-        gic_dist_writew(opaque, offset, data, attrs);
+        gic_dist_writew(s, cpu, offset, data, attrs);
         return MEMTX_OK;
     case 4:
-        gic_dist_writel(opaque, offset, data, attrs);
+        gic_dist_writel(s, cpu, offset, data, attrs);
         return MEMTX_OK;
     default:
         return MEMTX_ERROR;
@@ -1796,7 +1824,10 @@ static MemTxResult gic_thiscpu_read(void *opaque, hwaddr addr, uint64_t *data,
                                     unsigned size, MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-    return gic_cpu_read(s, gic_get_current_cpu(s), addr, data, attrs);
+    if (!gic_valid_cpu(attrs)) {
+        return MEMTX_ACCESS_ERROR;
+    }
+    return gic_cpu_read(s, gic_get_current_cpu(s, attrs), addr, data, attrs);
 }
 
 static MemTxResult gic_thiscpu_write(void *opaque, hwaddr addr,
@@ -1804,7 +1835,10 @@ static MemTxResult gic_thiscpu_write(void *opaque, hwaddr addr,
                                      MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-    return gic_cpu_write(s, gic_get_current_cpu(s), addr, value, attrs);
+    if (!gic_valid_cpu(attrs)) {
+        return MEMTX_ACCESS_ERROR;
+    }
+    return gic_cpu_write(s, gic_get_current_cpu(s, attrs), addr, value, attrs);
 }
 
 /* Wrappers to read/write the GIC CPU interface for a specific CPU.
@@ -1833,8 +1867,10 @@ static MemTxResult gic_thisvcpu_read(void *opaque, hwaddr addr, uint64_t *data,
                                     unsigned size, MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-
-    return gic_cpu_read(s, gic_get_current_vcpu(s), addr, data, attrs);
+    if (!gic_valid_cpu(attrs)) {
+        return MEMTX_ACCESS_ERROR;
+    }
+    return gic_cpu_read(s, gic_get_current_vcpu(s, attrs), addr, data, attrs);
 }
 
 static MemTxResult gic_thisvcpu_write(void *opaque, hwaddr addr,
@@ -1842,8 +1878,10 @@ static MemTxResult gic_thisvcpu_write(void *opaque, hwaddr addr,
                                      MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-
-    return gic_cpu_write(s, gic_get_current_vcpu(s), addr, value, attrs);
+    if (!gic_valid_cpu(attrs)) {
+        return MEMTX_ACCESS_ERROR;
+    }
+    return gic_cpu_write(s, gic_get_current_vcpu(s, attrs), addr, value, attrs);
 }
 
 static uint32_t gic_compute_eisr(GICState *s, int cpu, int lr_start)
@@ -1874,9 +1912,8 @@ static uint32_t gic_compute_elrsr(GICState *s, int cpu, int lr_start)
     return ret;
 }
 
-static void gic_vmcr_write(GICState *s, uint32_t value, MemTxAttrs attrs)
+static void gic_vmcr_write(GICState *s, int vcpu, uint32_t value, MemTxAttrs attrs)
 {
-    int vcpu = gic_get_current_vcpu(s);
     uint32_t ctlr;
     uint32_t abpr;
     uint32_t bpr;
@@ -1893,11 +1930,10 @@ static void gic_vmcr_write(GICState *s, uint32_t value, MemTxAttrs attrs)
     gic_set_priority_mask(s, vcpu, prio_mask, attrs);
 }
 
-static MemTxResult gic_hyp_read(void *opaque, int cpu, hwaddr addr,
+static MemTxResult gic_hyp_read(GICState *s, int cpu, hwaddr addr,
                                 uint64_t *data, MemTxAttrs attrs)
 {
-    GICState *s = ARM_GIC(opaque);
-    int vcpu = cpu + GIC_NCPU;
+    int vcpu = gic_get_current_vcpu(s, attrs);
 
     switch (addr) {
     case A_GICH_HCR: /* Hypervisor Control */
@@ -1961,11 +1997,10 @@ static MemTxResult gic_hyp_read(void *opaque, int cpu, hwaddr addr,
     return MEMTX_OK;
 }
 
-static MemTxResult gic_hyp_write(void *opaque, int cpu, hwaddr addr,
+static MemTxResult gic_hyp_write(GICState *s, int cpu, hwaddr addr,
                                  uint64_t value, MemTxAttrs attrs)
 {
-    GICState *s = ARM_GIC(opaque);
-    int vcpu = cpu + GIC_NCPU;
+    int vcpu = gic_get_current_vcpu(s, attrs);
 
     trace_gic_hyp_write(addr, value);
 
@@ -1975,12 +2010,13 @@ static MemTxResult gic_hyp_write(void *opaque, int cpu, hwaddr addr,
         break;
 
     case A_GICH_VMCR: /* Virtual Machine Control */
-        gic_vmcr_write(s, value, attrs);
+        gic_vmcr_write(s, vcpu, value, attrs);
         break;
 
     case A_GICH_APR: /* Active Priorities */
         s->h_apr[cpu] = value;
-        s->running_priority[vcpu] = gic_get_prio_from_apr_bits(s, vcpu);
+        s->running_priority[vcpu] =
+            gic_get_prio_from_apr_bits(s, vcpu);
         break;
 
     case A_GICH_LR0 ... A_GICH_LR63: /* List Registers */
@@ -2007,20 +2043,24 @@ static MemTxResult gic_hyp_write(void *opaque, int cpu, hwaddr addr,
 }
 
 static MemTxResult gic_thiscpu_hyp_read(void *opaque, hwaddr addr, uint64_t *data,
-                                    unsigned size, MemTxAttrs attrs)
+                                        unsigned size, MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-
-    return gic_hyp_read(s, gic_get_current_cpu(s), addr, data, attrs);
+    if (!gic_valid_cpu(attrs)) {
+        return MEMTX_ACCESS_ERROR;
+    }
+    return gic_hyp_read(s, gic_get_current_cpu(s, attrs), addr, data, attrs);
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
+    if (!gic_valid_cpu(attrs)) {
+        return MEMTX_ACCESS_ERROR;
+    }
+    return gic_hyp_write(s, gic_get_current_cpu(s, attrs), addr, value, attrs);
 }
 
 static MemTxResult gic_do_hyp_read(void *opaque, hwaddr addr, uint64_t *data,
@@ -2029,6 +2069,9 @@ static MemTxResult gic_do_hyp_read(void *opaque, hwaddr addr, uint64_t *data,
     GICState **backref = (GICState **)opaque;
     GICState *s = *backref;
     int id = (backref - s->backref);
+    if (!gic_valid_cpu(attrs)) {
+        return MEMTX_ACCESS_ERROR;
+    }
 
     return gic_hyp_read(s, id, addr, data, attrs);
 }
@@ -2040,9 +2083,11 @@ static MemTxResult gic_do_hyp_write(void *opaque, hwaddr addr,
     GICState **backref = (GICState **)opaque;
     GICState *s = *backref;
     int id = (backref - s->backref);
+    if (!gic_valid_cpu(attrs)) {
+        return MEMTX_ACCESS_ERROR;
+    }
 
     return gic_hyp_write(s, id + GIC_NCPU, addr, value, attrs);
-
 }
 
 static const MemoryRegionOps gic_ops[2] = {
-- 
2.34.1


