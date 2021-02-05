Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E88311701
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:28:35 +0100 (CET)
Received: from localhost ([::1]:47440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AWg-0007Ol-Db
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A3O-0002y3-24
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:18 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A3M-0003hi-3e
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:17 -0500
Received: by mail-pf1-x42a.google.com with SMTP id d26so4064767pfn.5
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cw7C2/8Hm5Mq4WanVG/o7OnGCD6iSp3z66Fxb9TU/eA=;
 b=uCtUDeQ+1o1dpRkpPNWq6Duzwjjx1n8EcqVu0sjxq6hzZCRxTjkSwLuDaemCzrsWEc
 dSx1WlejbDZ6A0pOSqG/aNi0ZgeSJVt4HK/2f2oklKgDq95ijvz6rP2dHotokgzrmP67
 7AL/n3q4TEaov/ycmrzpSY8p6GcHLp2FJGYws9obNgOdniDG2VNLmKplBP+A10dNDDuT
 wxilEZ9vdkUl9C/lF9G9sL5sahOtu92NToJ/OXNeFRPeSeq9G5Uw1w4TXh+vmOV/hVzv
 Wz3axF+HOXHkM+tgdEbctF9nxEUlvijJYK6M7jEYnsxeLsmgxlI0aeG0qssWwLCZhzE+
 iuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cw7C2/8Hm5Mq4WanVG/o7OnGCD6iSp3z66Fxb9TU/eA=;
 b=LOZHRufu1PXYw78Cdjv+UiJZr67xO2EIzTYjY5ztNUB5wSIvu+9WeTffmzQKbA0g5v
 xwDtVE2HCm0hXDPnnKPKAZR29IU7eRhicg8LXWhKLgPJh7qHEnQ7PRPxnjaCvBcmXA4O
 oDC9NT/TDt6CUXSqTFBmplrxr/OsBeq3qqi2IYLuK0PtARSrvQmOhHDVfSyW2D1xKBkk
 ZvL4Eh63boNRH+irEDBimgbyHRCEA4LUA0VZICJbJyczSm+2aeNC+X4jSLqhbVwBjFdu
 iXhJl/kIY28SvBORh2LABy9xqYjYW8iO++dXSSzMNKt6qvA8R6DYy0sZ92VhyLDMB9KB
 twfw==
X-Gm-Message-State: AOAM531I4tEH38wJuX07ANwhJtyBoDR1BJaAV5Phr3/pj7bGw9NbEgu4
 ql27U85j37duIKwCXPV3ukHylkXQBRozGB4m
X-Google-Smtp-Source: ABdhPJxYjKTR1ZTXLn52JC0NX+NRgddeyqPn/tyLSpMgkuKfurLK1DO3wkwUdkP/3+a1sxct+CwOjA==
X-Received: by 2002:a63:4966:: with SMTP id y38mr6359004pgk.428.1612565893859; 
 Fri, 05 Feb 2021 14:58:13 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:58:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/46] cpu: move debug_check_watchpoint to tcg_ops
Date: Fri,  5 Feb 2021 12:56:46 -1000
Message-Id: <20210205225650.1330794-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

commit 568496c0c0f1 ("cpu: Add callback to check architectural") and
commit 3826121d9298 ("target-arm: Implement checking of fired")
introduced an ARM-specific hack for cpu_check_watchpoint.

Make debug_check_watchpoint optional, and move it to tcg_ops.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210204163931.7358-15-cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 9 ++++++---
 accel/tcg/user-exec.c | 3 ++-
 hw/core/cpu.c         | 9 ---------
 softmmu/physmem.c     | 4 ++--
 target/arm/cpu.c      | 4 ++--
 5 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 832dd26e92..e76a49754d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -141,6 +141,12 @@ typedef struct TcgCpuOperations {
      */
     vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
 
+    /**
+     * @debug_check_watchpoint: return true if the architectural
+     * watchpoint whose address has matched should really fire, used by ARM
+     */
+    bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
+
 } TcgCpuOperations;
 
 /**
@@ -177,8 +183,6 @@ typedef struct TcgCpuOperations {
  *       a memory access with the specified memory transaction attributes.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
- * @debug_check_watchpoint: Callback: return true if the architectural
- *       watchpoint whose address has matched should really fire.
  * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
  * 64-bit VM coredump.
  * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
@@ -232,7 +236,6 @@ struct CPUClass {
     int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
-    bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
 
     int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
                             int cpuid, void *opaque);
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 5509dd53e9..9e6e188d19 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -187,7 +187,8 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
     clear_helper_retaddr();
 
     cc = CPU_GET_CLASS(cpu);
-    cc->tcg_ops.tlb_fill(cpu, address, 0, access_type, MMU_USER_IDX, false, pc);
+    cc->tcg_ops.tlb_fill(cpu, address, 0, access_type,
+                         MMU_USER_IDX, false, pc);
     g_assert_not_reached();
 }
 
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 3d5bf9fe02..00330ba07d 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -186,14 +186,6 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
     return 0;
 }
 
-static bool cpu_common_debug_check_watchpoint(CPUState *cpu, CPUWatchpoint *wp)
-{
-    /* If no extra check is required, QEMU watchpoint match can be considered
-     * as an architectural match.
-     */
-    return true;
-}
-
 static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
 {
     return target_words_bigendian();
@@ -415,7 +407,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
-    k->debug_check_watchpoint = cpu_common_debug_check_watchpoint;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3d9a9c39bd..9e64cf7adf 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -917,8 +917,8 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
             wp->hitaddr = MAX(addr, wp->vaddr);
             wp->hitattrs = attrs;
             if (!cpu->watchpoint_hit) {
-                if (wp->flags & BP_CPU &&
-                    !cc->debug_check_watchpoint(cpu, wp)) {
+                if (wp->flags & BP_CPU && cc->tcg_ops.debug_check_watchpoint &&
+                    !cc->tcg_ops.debug_check_watchpoint(cpu, wp)) {
                     wp->flags &= ~BP_WATCHPOINT_HIT;
                     continue;
                 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2a14431065..c9a66d3103 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2280,12 +2280,12 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.synchronize_from_tb = arm_cpu_synchronize_from_tb;
     cc->tcg_ops.tlb_fill = arm_cpu_tlb_fill;
     cc->tcg_ops.debug_excp_handler = arm_debug_excp_handler;
-    cc->debug_check_watchpoint = arm_debug_check_watchpoint;
 #if !defined(CONFIG_USER_ONLY)
+    cc->tcg_ops.do_interrupt = arm_cpu_do_interrupt;
     cc->tcg_ops.do_transaction_failed = arm_cpu_do_transaction_failed;
     cc->tcg_ops.do_unaligned_access = arm_cpu_do_unaligned_access;
     cc->tcg_ops.adjust_watchpoint_address = arm_adjust_watchpoint_address;
-    cc->tcg_ops.do_interrupt = arm_cpu_do_interrupt;
+    cc->tcg_ops.debug_check_watchpoint = arm_debug_check_watchpoint;
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 #endif /* CONFIG_TCG */
 }
-- 
2.25.1


