Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3618E50835B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 10:25:24 +0200 (CEST)
Received: from localhost ([::1]:37898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh5eN-0002pr-5o
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 04:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Ot-000280-QE
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:09:23 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Or-0001Mn-Pi
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:09:23 -0400
Received: by mail-pj1-x102a.google.com with SMTP id bx5so1224953pjb.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 01:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1wxd7QnNyAh08ZgiYuWj1vo8G5mMO4VL1EN8v3zYAbs=;
 b=UIQLOW9cRRGljdeJ7B/uLY2ZjOo36dpcMbl+QivgR+pjFt9QTxhkvmxpxJOPO9asQq
 BgNl40w0UoHJ/MBYCJIabe2hiZAujrXxwJUpbegPsA5UwDfukjV/omy08TL7tITRdSHJ
 kcjz4PKJdzkajCD9J626e/nwcav7kXXrhO6gSEmX9kKhhEg5EdjJTzVUbKoPKfsd4r9Z
 JHPN9Ep+tzJUs1oqs/xfftn+gwdOVBkfA3oTEPGQmXphlhjA3fGn5uQ4GLrF69408q6M
 OUMJg24Q0Kw5B1PedP5gLRs1mhyrqHPklDzPOFpWf08GofjVCQRBSFYnm0tSvjX+BCmA
 Evjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1wxd7QnNyAh08ZgiYuWj1vo8G5mMO4VL1EN8v3zYAbs=;
 b=BI4eIVEYkBfakdto+jANCwm8qQ/osj7MSTF5QQXAWAcTTmBK2gOffy5FFFFCv7hm6F
 B4m2xc3NUlmtKrviy6/om92yP+B+Q0swdqwz8BTX+LYpCvmvTJISjPa6KAVs3muAr5ga
 F4jlRXPx8UsjL7PdYjLwjYxzOXtO/ybtTunNTGgvUis3+qD7KhxuqVdylmOyvlPy0PUT
 6C68hyvAZ79V2uxKtzMwUXFk4W8VhiNW3v5+4MaIncGWHqBZvmu/Als9AFOtA/zenUvW
 IRUqZgfOqhL7mwTSMsEC0XFpiNOeU10Wxx80Yjre3rDMBNkgD7hE70tnXvmedkBl+V2j
 fMaA==
X-Gm-Message-State: AOAM531dPOBh/Y+jGS6eBzSByeAT1l+EUhuAEUr0/NcxfYR7akdkCT3R
 QT9pw3AW/41ym8JIoP0hj7wTm0Voqrmk/Fv4
X-Google-Smtp-Source: ABdhPJyeMGhXtrjyNg1s3fwW2z7QAxrkh4ZcYRSEIMBu/5NLHrIP0tHfu97oBURN9AV7j3OQnp7R4g==
X-Received: by 2002:a17:902:e881:b0:158:fd34:7b28 with SMTP id
 w1-20020a170902e88100b00158fd347b28mr13582242plg.95.1650442160116; 
 Wed, 20 Apr 2022 01:09:20 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g15-20020aa7818f000000b00505ce2e4640sm18554898pfi.100.2022.04.20.01.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:09:19 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/4] hw/intc: Make RISC-V ACLINT mtime MMIO register
 writable
Date: Wed, 20 Apr 2022 16:08:59 +0800
Message-Id: <20220420080901.14655-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420080901.14655-1-frank.chang@sifive.com>
References: <20220420080901.14655-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Anup Patel <anup.patel@wdc.com>, qemu-riscv@nongnu.org,
 Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Jim Shu <jim.shu@sifive.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

RISC-V privilege spec defines that mtime is exposed as a memory-mapped
machine-mode read-write register. However, as QEMU uses host monotonic
timer as timer source, this makes mtime to be read-only in RISC-V
ACLINT.

This patch makes mtime to be writable by recording the time delta value
between the mtime value to be written and the timer value at the time
mtime is written. Time delta value is then added back whenever the timer
value is retrieved.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/riscv_aclint.c         | 71 ++++++++++++++++++++++++----------
 include/hw/intc/riscv_aclint.h |  1 +
 target/riscv/cpu.h             |  8 ++--
 target/riscv/cpu_helper.c      |  4 +-
 4 files changed, 57 insertions(+), 27 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index ff082090fe..3b3ab548f6 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -38,12 +38,18 @@ typedef struct riscv_aclint_mtimer_callback {
     int num;
 } riscv_aclint_mtimer_callback;
 
-static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
+static uint64_t cpu_riscv_read_rtc_raw(uint32_t timebase_freq)
 {
     return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
         timebase_freq, NANOSECONDS_PER_SECOND);
 }
 
+static uint64_t cpu_riscv_read_rtc(void *opaque)
+{
+    RISCVAclintMTimerState *mtimer = opaque;
+    return cpu_riscv_read_rtc_raw(mtimer->timebase_freq) + mtimer->time_delta;
+}
+
 /*
  * Called when timecmp is written to update the QEMU timer or immediately
  * trigger timer interrupt if mtimecmp <= current timer value.
@@ -51,13 +57,13 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
 static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
                                               RISCVCPU *cpu,
                                               int hartid,
-                                              uint64_t value,
-                                              uint32_t timebase_freq)
+                                              uint64_t value)
 {
+    uint32_t timebase_freq = mtimer->timebase_freq;
     uint64_t next;
     uint64_t diff;
 
-    uint64_t rtc_r = cpu_riscv_read_rtc(timebase_freq);
+    uint64_t rtc_r = cpu_riscv_read_rtc(mtimer);
 
     cpu->env.timecmp = value;
     if (cpu->env.timecmp <= rtc_r) {
@@ -140,11 +146,11 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
         }
     } else if (addr == mtimer->time_base) {
         /* time_lo for RV32/RV64 or timecmp for RV64 */
-        uint64_t rtc = cpu_riscv_read_rtc(mtimer->timebase_freq);
+        uint64_t rtc = cpu_riscv_read_rtc(mtimer);
         return (size == 4) ? (rtc & 0xFFFFFFFF) : rtc;
     } else if (addr == mtimer->time_base + 4) {
         /* time_hi */
-        return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) & 0xFFFFFFFF;
+        return (cpu_riscv_read_rtc(mtimer) >> 32) & 0xFFFFFFFF;
     }
 
     qemu_log_mask(LOG_UNIMP,
@@ -157,6 +163,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
     uint64_t value, unsigned size)
 {
     RISCVAclintMTimerState *mtimer = opaque;
+    int i;
 
     if (addr >= mtimer->timecmp_base &&
         addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
@@ -172,20 +179,18 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
                 /* timecmp_lo for RV32/RV64 */
                 uint64_t timecmp_hi = env->timecmp >> 32;
                 riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
-                    timecmp_hi << 32 | (value & 0xFFFFFFFF),
-                    mtimer->timebase_freq);
+                    timecmp_hi << 32 | (value & 0xFFFFFFFF));
             } else {
                 /* timecmp for RV64 */
                 riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
-                                                  value, mtimer->timebase_freq);
+                                                  value);
             }
         } else if ((addr & 0x7) == 4) {
             if (size == 4) {
                 /* timecmp_hi for RV32/RV64 */
                 uint64_t timecmp_lo = env->timecmp;
                 riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
-                    value << 32 | (timecmp_lo & 0xFFFFFFFF),
-                    mtimer->timebase_freq);
+                    value << 32 | (timecmp_lo & 0xFFFFFFFF));
             } else {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "aclint-mtimer: invalid timecmp_hi write: %08x",
@@ -197,15 +202,39 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
                           (uint32_t)addr);
         }
         return;
-    } else if (addr == mtimer->time_base) {
-        /* time_lo */
-        qemu_log_mask(LOG_UNIMP,
-                      "aclint-mtimer: time_lo write not implemented");
-        return;
-    } else if (addr == mtimer->time_base + 4) {
-        /* time_hi */
-        qemu_log_mask(LOG_UNIMP,
-                      "aclint-mtimer: time_hi write not implemented");
+    } else if (addr == mtimer->time_base || addr == mtimer->time_base + 4) {
+        uint64_t rtc_r = cpu_riscv_read_rtc_raw(mtimer->timebase_freq);
+
+        if (addr == mtimer->time_base) {
+            if (size == 4) {
+                /* time_lo for RV32/RV64 */
+                mtimer->time_delta = ((rtc_r & ~0xFFFFFFFFULL) | value) - rtc_r;
+            } else {
+                /* time for RV64 */
+                mtimer->time_delta = value - rtc_r;
+            }
+        } else {
+            if (size == 4) {
+                /* time_hi for RV32/RV64 */
+                mtimer->time_delta = (value << 32 | (rtc_r & 0xFFFFFFFF)) - rtc_r;
+            } else {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "aclint-mtimer: invalid time_hi write: %08x",
+                              (uint32_t)addr);
+                return;
+            }
+        }
+
+        /* Check if timer interrupt is triggered for each hart. */
+        for (i = 0; i < mtimer->num_harts; i++) {
+            CPUState *cpu = qemu_get_cpu(mtimer->hartid_base + i);
+            CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
+            if (!env) {
+                continue;
+            }
+            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
+                                              i, env->timecmp);
+        }
         return;
     }
 
@@ -315,7 +344,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
             continue;
         }
         if (provide_rdtime) {
-            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_freq);
+            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, dev);
         }
 
         cb->s = RISCV_ACLINT_MTIMER(dev);
diff --git a/include/hw/intc/riscv_aclint.h b/include/hw/intc/riscv_aclint.h
index 229bd08d25..26d4048687 100644
--- a/include/hw/intc/riscv_aclint.h
+++ b/include/hw/intc/riscv_aclint.h
@@ -31,6 +31,7 @@
 typedef struct RISCVAclintMTimerState {
     /*< private >*/
     SysBusDevice parent_obj;
+    uint64_t time_delta;
 
     /*< public >*/
     MemoryRegion mmio;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 249fce4c3b..0cb7c2a05a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -286,8 +286,8 @@ struct CPUArchState {
     type2_trigger_t type2_trig[TRIGGER_TYPE2_NUM];
 
     /* machine specific rdtime callback */
-    uint64_t (*rdtime_fn)(uint32_t);
-    uint32_t rdtime_fn_arg;
+    uint64_t (*rdtime_fn)(void *);
+    void *rdtime_fn_arg;
 
     /* machine specific AIA ireg read-modify-write callback */
 #define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
@@ -505,8 +505,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
 uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
-void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
-                             uint32_t arg);
+void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
+                             void *arg);
 void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
                                    int (*rmw_fn)(void *arg,
                                                  target_ulong reg,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b5bbe6fc39..51a3d96a66 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -632,8 +632,8 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
     return old;
 }
 
-void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
-                             uint32_t arg)
+void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
+                             void *arg)
 {
     env->rdtime_fn = fn;
     env->rdtime_fn_arg = arg;
-- 
2.35.1


