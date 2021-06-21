Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890743AE723
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:29:12 +0200 (CEST)
Received: from localhost ([::1]:32866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHB1-00084G-G7
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGip-0008BV-Bl
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGim-0007Df-DL
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xu0ePZHwyyU3kOX+XyiLzvKVCGXq4mXtUtrX4dDBfQ=;
 b=iS/2jfgKKi9PhBpfJF6Mca4rOZa9LuOCDtnPyOmHsMinNGyf/5xTVjkCbkdFxu+gp+vim+
 22DeE7N8OEWYMfNrhFEFbciKQwQpZvaMck/KvtV7GtO5kPnJ3rC6cSCfZHC/JT4IQ9R+gW
 Z2j6bPOI89wE9Jyj1Gfo15+T+IdSdJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-GtXJibsxOV2yvjpcmn7vaQ-1; Mon, 21 Jun 2021 05:59:58 -0400
X-MC-Unique: GtXJibsxOV2yvjpcmn7vaQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C0CC6127B;
 Mon, 21 Jun 2021 09:59:56 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 787233A47;
 Mon, 21 Jun 2021 09:59:54 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 29/37] target/s390x: Expose load_psw and get_psw_mask to cpu.h
Date: Mon, 21 Jun 2021 11:58:34 +0200
Message-Id: <20210621095842.335162-30-cohuck@redhat.com>
In-Reply-To: <20210621095842.335162-1-cohuck@redhat.com>
References: <20210621095842.335162-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ruixin.bao@ibm.com,
 "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Rename to s390_cpu_set_psw and s390_cpu_get_psw_mask at the
same time.  Adjust so that they compile for user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Tested-by: jonathan.albrecht <jonathan.albrecht@linux.vnet.ibm.com>
Tested-by: <ruixin.bao@ibm.com>
Message-Id: <20210615030744.1252385-2-richard.henderson@linaro.org>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cc_helper.c   |  2 +-
 target/s390x/cpu.h         |  3 ++
 target/s390x/excp_helper.c | 28 ++++++------
 target/s390x/helper.c      | 89 ++++++++++++++++++++------------------
 target/s390x/internal.h    |  5 ---
 target/s390x/sigp.c        |  3 +-
 6 files changed, 69 insertions(+), 61 deletions(-)

diff --git a/target/s390x/cc_helper.c b/target/s390x/cc_helper.c
index e7039d0d183a..e7a74d66ddc0 100644
--- a/target/s390x/cc_helper.c
+++ b/target/s390x/cc_helper.c
@@ -509,7 +509,7 @@ uint32_t HELPER(calc_cc)(CPUS390XState *env, uint32_t cc_op, uint64_t src,
 #ifndef CONFIG_USER_ONLY
 void HELPER(load_psw)(CPUS390XState *env, uint64_t mask, uint64_t addr)
 {
-    load_psw(env, mask, addr);
+    s390_cpu_set_psw(env, mask, addr);
     cpu_loop_exit(env_cpu(env));
 }
 
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 2464d4076c0a..b26ae8fff2f2 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -845,6 +845,9 @@ int s390_cpu_pv_mem_rw(S390CPU *cpu, unsigned int offset, void *hostbuf,
 int s390_cpu_restart(S390CPU *cpu);
 void s390_init_sigp(void);
 
+/* helper.c */
+void s390_cpu_set_psw(CPUS390XState *env, uint64_t mask, uint64_t addr);
+uint64_t s390_cpu_get_psw_mask(CPUS390XState *env);
 
 /* outside of target/s390x/ */
 S390CPU *s390_cpu_addr2state(uint16_t cpu_addr);
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index 20625c2c8f6b..9c361428c85e 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -252,7 +252,7 @@ static void do_program_interrupt(CPUS390XState *env)
 
     lowcore->pgm_ilen = cpu_to_be16(ilen);
     lowcore->pgm_code = cpu_to_be16(env->int_pgm_code);
-    lowcore->program_old_psw.mask = cpu_to_be64(get_psw_mask(env));
+    lowcore->program_old_psw.mask = cpu_to_be64(s390_cpu_get_psw_mask(env));
     lowcore->program_old_psw.addr = cpu_to_be64(env->psw.addr);
     mask = be64_to_cpu(lowcore->program_new_psw.mask);
     addr = be64_to_cpu(lowcore->program_new_psw.addr);
@@ -260,7 +260,7 @@ static void do_program_interrupt(CPUS390XState *env)
 
     cpu_unmap_lowcore(lowcore);
 
-    load_psw(env, mask, addr);
+    s390_cpu_set_psw(env, mask, addr);
 }
 
 static void do_svc_interrupt(CPUS390XState *env)
@@ -272,14 +272,14 @@ static void do_svc_interrupt(CPUS390XState *env)
 
     lowcore->svc_code = cpu_to_be16(env->int_svc_code);
     lowcore->svc_ilen = cpu_to_be16(env->int_svc_ilen);
-    lowcore->svc_old_psw.mask = cpu_to_be64(get_psw_mask(env));
+    lowcore->svc_old_psw.mask = cpu_to_be64(s390_cpu_get_psw_mask(env));
     lowcore->svc_old_psw.addr = cpu_to_be64(env->psw.addr + env->int_svc_ilen);
     mask = be64_to_cpu(lowcore->svc_new_psw.mask);
     addr = be64_to_cpu(lowcore->svc_new_psw.addr);
 
     cpu_unmap_lowcore(lowcore);
 
-    load_psw(env, mask, addr);
+    s390_cpu_set_psw(env, mask, addr);
 
     /* When a PER event is pending, the PER exception has to happen
        immediately after the SERVICE CALL one.  */
@@ -348,12 +348,12 @@ static void do_ext_interrupt(CPUS390XState *env)
 
     mask = be64_to_cpu(lowcore->external_new_psw.mask);
     addr = be64_to_cpu(lowcore->external_new_psw.addr);
-    lowcore->external_old_psw.mask = cpu_to_be64(get_psw_mask(env));
+    lowcore->external_old_psw.mask = cpu_to_be64(s390_cpu_get_psw_mask(env));
     lowcore->external_old_psw.addr = cpu_to_be64(env->psw.addr);
 
     cpu_unmap_lowcore(lowcore);
 
-    load_psw(env, mask, addr);
+    s390_cpu_set_psw(env, mask, addr);
 }
 
 static void do_io_interrupt(CPUS390XState *env)
@@ -373,7 +373,7 @@ static void do_io_interrupt(CPUS390XState *env)
     lowcore->subchannel_nr = cpu_to_be16(io->nr);
     lowcore->io_int_parm = cpu_to_be32(io->parm);
     lowcore->io_int_word = cpu_to_be32(io->word);
-    lowcore->io_old_psw.mask = cpu_to_be64(get_psw_mask(env));
+    lowcore->io_old_psw.mask = cpu_to_be64(s390_cpu_get_psw_mask(env));
     lowcore->io_old_psw.addr = cpu_to_be64(env->psw.addr);
     mask = be64_to_cpu(lowcore->io_new_psw.mask);
     addr = be64_to_cpu(lowcore->io_new_psw.addr);
@@ -381,7 +381,7 @@ static void do_io_interrupt(CPUS390XState *env)
     cpu_unmap_lowcore(lowcore);
     g_free(io);
 
-    load_psw(env, mask, addr);
+    s390_cpu_set_psw(env, mask, addr);
 }
 
 typedef struct MchkExtSaveArea {
@@ -457,14 +457,14 @@ static void do_mchk_interrupt(CPUS390XState *env)
     lowcore->clock_comp_save_area = cpu_to_be64(env->ckc >> 8);
 
     lowcore->mcic = cpu_to_be64(mcic);
-    lowcore->mcck_old_psw.mask = cpu_to_be64(get_psw_mask(env));
+    lowcore->mcck_old_psw.mask = cpu_to_be64(s390_cpu_get_psw_mask(env));
     lowcore->mcck_old_psw.addr = cpu_to_be64(env->psw.addr);
     mask = be64_to_cpu(lowcore->mcck_new_psw.mask);
     addr = be64_to_cpu(lowcore->mcck_new_psw.addr);
 
     cpu_unmap_lowcore(lowcore);
 
-    load_psw(env, mask, addr);
+    s390_cpu_set_psw(env, mask, addr);
 }
 
 void s390_cpu_do_interrupt(CPUState *cs)
@@ -592,9 +592,11 @@ void s390x_cpu_debug_excp_handler(CPUState *cs)
            and MVCS instrutions are not used.  */
         env->per_perc_atmid |= env->psw.mask & (PSW_MASK_ASC) >> 46;
 
-        /* Remove all watchpoints to re-execute the code.  A PER exception
-           will be triggered, it will call load_psw which will recompute
-           the watchpoints.  */
+        /*
+         * Remove all watchpoints to re-execute the code.  A PER exception
+         * will be triggered, it will call s390_cpu_set_psw which will
+         * recompute the watchpoints.
+         */
         cpu_watchpoint_remove_all(cs, BP_CPU);
         cpu_loop_exit_noexc(cs);
     }
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 7678994febe6..d311903b94ca 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -104,44 +104,6 @@ void s390_handle_wait(S390CPU *cpu)
     }
 }
 
-void load_psw(CPUS390XState *env, uint64_t mask, uint64_t addr)
-{
-    uint64_t old_mask = env->psw.mask;
-
-    env->psw.addr = addr;
-    env->psw.mask = mask;
-
-    /* KVM will handle all WAITs and trigger a WAIT exit on disabled_wait */
-    if (!tcg_enabled()) {
-        return;
-    }
-    env->cc_op = (mask >> 44) & 3;
-
-    if ((old_mask ^ mask) & PSW_MASK_PER) {
-        s390_cpu_recompute_watchpoints(env_cpu(env));
-    }
-
-    if (mask & PSW_MASK_WAIT) {
-        s390_handle_wait(env_archcpu(env));
-    }
-}
-
-uint64_t get_psw_mask(CPUS390XState *env)
-{
-    uint64_t r = env->psw.mask;
-
-    if (tcg_enabled()) {
-        env->cc_op = calc_cc(env, env->cc_op, env->cc_src, env->cc_dst,
-                             env->cc_vr);
-
-        r &= ~PSW_MASK_CC;
-        assert(!(env->cc_op & ~3));
-        r |= (uint64_t)env->cc_op << 44;
-    }
-
-    return r;
-}
-
 LowCore *cpu_map_lowcore(CPUS390XState *env)
 {
     LowCore *lowcore;
@@ -168,7 +130,7 @@ void do_restart_interrupt(CPUS390XState *env)
 
     lowcore = cpu_map_lowcore(env);
 
-    lowcore->restart_old_psw.mask = cpu_to_be64(get_psw_mask(env));
+    lowcore->restart_old_psw.mask = cpu_to_be64(s390_cpu_get_psw_mask(env));
     lowcore->restart_old_psw.addr = cpu_to_be64(env->psw.addr);
     mask = be64_to_cpu(lowcore->restart_new_psw.mask);
     addr = be64_to_cpu(lowcore->restart_new_psw.addr);
@@ -176,7 +138,7 @@ void do_restart_interrupt(CPUS390XState *env)
     cpu_unmap_lowcore(lowcore);
     env->pending_int &= ~INTERRUPT_RESTART;
 
-    load_psw(env, mask, addr);
+    s390_cpu_set_psw(env, mask, addr);
 }
 
 void s390_cpu_recompute_watchpoints(CPUState *cs)
@@ -266,7 +228,7 @@ int s390_store_status(S390CPU *cpu, hwaddr addr, bool store_arch)
         sa->grs[i] = cpu_to_be64(cpu->env.regs[i]);
     }
     sa->psw.addr = cpu_to_be64(cpu->env.psw.addr);
-    sa->psw.mask = cpu_to_be64(get_psw_mask(&cpu->env));
+    sa->psw.mask = cpu_to_be64(s390_cpu_get_psw_mask(&cpu->env));
     sa->prefix = cpu_to_be32(cpu->env.psa);
     sa->fpc = cpu_to_be32(cpu->env.fpc);
     sa->todpr = cpu_to_be32(cpu->env.todpr);
@@ -323,8 +285,53 @@ int s390_store_adtl_status(S390CPU *cpu, hwaddr addr, hwaddr len)
     cpu_physical_memory_unmap(sa, len, 1, len);
     return 0;
 }
+#else
+/* For user-only, tcg is always enabled. */
+#define tcg_enabled() true
 #endif /* CONFIG_USER_ONLY */
 
+void s390_cpu_set_psw(CPUS390XState *env, uint64_t mask, uint64_t addr)
+{
+#ifndef CONFIG_USER_ONLY
+    uint64_t old_mask = env->psw.mask;
+#endif
+
+    env->psw.addr = addr;
+    env->psw.mask = mask;
+
+    /* KVM will handle all WAITs and trigger a WAIT exit on disabled_wait */
+    if (!tcg_enabled()) {
+        return;
+    }
+    env->cc_op = (mask >> 44) & 3;
+
+#ifndef CONFIG_USER_ONLY
+    if ((old_mask ^ mask) & PSW_MASK_PER) {
+        s390_cpu_recompute_watchpoints(env_cpu(env));
+    }
+
+    if (mask & PSW_MASK_WAIT) {
+        s390_handle_wait(env_archcpu(env));
+    }
+#endif
+}
+
+uint64_t s390_cpu_get_psw_mask(CPUS390XState *env)
+{
+    uint64_t r = env->psw.mask;
+
+    if (tcg_enabled()) {
+        env->cc_op = calc_cc(env, env->cc_op, env->cc_src, env->cc_dst,
+                             env->cc_vr);
+
+        r &= ~PSW_MASK_CC;
+        assert(!(env->cc_op & ~3));
+        r |= (uint64_t)env->cc_op << 44;
+    }
+
+    return r;
+}
+
 void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     S390CPU *cpu = S390_CPU(cs);
diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index d62dfc4dc610..92562753765e 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -235,10 +235,6 @@ int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
 const char *cc_name(enum cc_op cc_op);
 uint32_t calc_cc(CPUS390XState *env, uint32_t cc_op, uint64_t src, uint64_t dst,
                  uint64_t vr);
-#ifndef CONFIG_USER_ONLY
-void load_psw(CPUS390XState *env, uint64_t mask, uint64_t addr);
-#endif /* CONFIG_USER_ONLY */
-
 
 /* cpu.c */
 #ifndef CONFIG_USER_ONLY
@@ -312,7 +308,6 @@ void s390_cpu_gdb_init(CPUState *cs);
 void s390_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 void do_restart_interrupt(CPUS390XState *env);
 #ifndef CONFIG_USER_ONLY
-uint64_t get_psw_mask(CPUS390XState *env);
 void s390_cpu_recompute_watchpoints(CPUState *cs);
 void s390x_tod_timer(void *opaque);
 void s390x_cpu_timer(void *opaque);
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index c604f177100f..c2d5cdf06133 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -235,7 +235,8 @@ static void sigp_restart(CPUState *cs, run_on_cpu_data arg)
         cpu_synchronize_state(cs);
         /*
          * Set OPERATING (and unhalting) before loading the restart PSW.
-         * load_psw() will then properly halt the CPU again if necessary (TCG).
+         * s390_cpu_set_psw() will then properly halt the CPU again if
+         * necessary (TCG).
          */
         s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
         do_restart_interrupt(&cpu->env);
-- 
2.31.1


