Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7684760C8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:33:34 +0100 (CET)
Received: from localhost ([::1]:55800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZ5p-0007lY-QG
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:33:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXio-0005jv-0O; Wed, 15 Dec 2021 12:05:44 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62260
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXie-0004uA-Ui; Wed, 15 Dec 2021 12:05:38 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfa3u012385; 
 Wed, 15 Dec 2021 17:05:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cygmvx15a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:01 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BFGgR1W015186;
 Wed, 15 Dec 2021 17:05:00 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cygmvx14m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:59 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3xJM024500;
 Wed, 15 Dec 2021 17:04:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3cy78h790n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:58 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BFGuuwQ48496928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 16:56:56 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6D6611C04A;
 Wed, 15 Dec 2021 17:04:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8486311C052;
 Wed, 15 Dec 2021 17:04:55 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:55 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A7CAD220247;
 Wed, 15 Dec 2021 18:04:54 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 087/102] target/ppc: enable PMU instruction count
Date: Wed, 15 Dec 2021 18:03:42 +0100
Message-Id: <20211215170357.321643-75-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Pei4tvGdiRwfj2W9bJiTa3iUNiVjXDXk
X-Proofpoint-ORIG-GUID: 5_jTBbbFAk-0cH7K2uXyTVDFwXoLzXtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1034 lowpriorityscore=0 malwarescore=0
 mlxlogscore=471 mlxscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

The PMU is already counting cycles by calculating time elapsed in
nanoseconds. Counting instructions is a different matter and requires
another approach.

This patch adds the capability of counting completed instructions (Perf
event PM_INST_CMPL) by counting the amount of instructions translated in
each translation block right before exiting it.

A new pmu_count_insns() helper in translation.c was added to do that.
After verifying that the PMU is counting instructions, call
helper_insns_inc(). This new helper from power8-pmu.c will add the
instructions to the relevant counters. It'll also be responsible for
triggering counter negative overflows as it is already being done with
cycles.

To verify whether the PMU is counting instructions or now, a new hflags
named 'HFLAGS_INSN_CNT' is introduced. This flag will match the internal
state of the PMU. We're be using this flag to avoid calling
helper_insn_inc() when we do not have a valid instruction event being
sampled.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20211201151734.654994-7-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h                 |  1 +
 target/ppc/helper.h              |  1 +
 target/ppc/power8-pmu.h          |  1 +
 target/ppc/helper_regs.c         |  7 ++++
 target/ppc/power8-pmu.c          | 67 +++++++++++++++++++++++++++++++-
 target/ppc/translate.c           | 64 ++++++++++++++++++++++++++++++
 target/ppc/power8-pmu-regs.c.inc |  6 +++
 7 files changed, 146 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index cf637f0f6dfb..313b16f39273 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -655,6 +655,7 @@ enum {
     HFLAGS_PR =3D 14,  /* MSR_PR */
     HFLAGS_PMCC0 =3D 15,  /* MMCR0 PMCC bit 0 */
     HFLAGS_PMCC1 =3D 16,  /* MMCR0 PMCC bit 1 */
+    HFLAGS_INSN_CNT =3D 17, /* PMU instruction count enabled */
     HFLAGS_VSX =3D 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR =3D 25,  /* MSR_VR if cpu has VRE */
=20
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 77c85e1292fa..13d8305a08bf 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -24,6 +24,7 @@ DEF_HELPER_2(store_mmcr0, void, env, tl)
 DEF_HELPER_2(store_mmcr1, void, env, tl)
 DEF_HELPER_3(store_pmc, void, env, i32, i64)
 DEF_HELPER_2(read_pmc, tl, env, i32)
+DEF_HELPER_2(insns_inc, void, env, i32)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
index 49a813a443d7..3ee4b4cda5a9 100644
--- a/target/ppc/power8-pmu.h
+++ b/target/ppc/power8-pmu.h
@@ -21,5 +21,6 @@
 #include "qemu/main-loop.h"
=20
 void cpu_ppc_pmu_init(CPUPPCState *env);
+bool pmu_insn_cnt_enabled(CPUPPCState *env);
=20
 #endif
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 99562edd5741..b8479288426b 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -23,6 +23,7 @@
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
 #include "helper_regs.h"
+#include "power8-pmu.h"
=20
 /* Swap temporary saved registers with GPRs */
 void hreg_swap_gpr_tgpr(CPUPPCState *env)
@@ -121,6 +122,12 @@ static uint32_t hreg_compute_hflags_value(CPUPPCStat=
e *env)
         hflags |=3D 1 << HFLAGS_HV;
     }
=20
+#if defined(TARGET_PPC64)
+    if (pmu_insn_cnt_enabled(env)) {
+        hflags |=3D 1 << HFLAGS_INSN_CNT;
+    }
+#endif
+
     /*
      * This is our encoding for server processors. The architecture
      * specifies that there is no such thing as userspace with
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 399234a2fce8..e163ba564012 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -112,6 +112,54 @@ static PMUEventType pmc_get_event(CPUPPCState *env, =
int sprn)
     return evt_type;
 }
=20
+bool pmu_insn_cnt_enabled(CPUPPCState *env)
+{
+    int sprn;
+
+    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC5; sprn++) {
+        if (pmc_get_event(env, sprn) =3D=3D PMU_EVENT_INSTRUCTIONS) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
+static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
+{
+    bool overflow_triggered =3D false;
+    int sprn;
+
+    /* PMC6 never counts instructions */
+    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC5; sprn++) {
+        if (pmc_get_event(env, sprn) !=3D PMU_EVENT_INSTRUCTIONS) {
+            continue;
+        }
+
+        env->spr[sprn] +=3D num_insns;
+
+        if (env->spr[sprn] >=3D PMC_COUNTER_NEGATIVE_VAL &&
+            pmc_has_overflow_enabled(env, sprn)) {
+
+            overflow_triggered =3D true;
+
+            /*
+             * The real PMU will always trigger a counter overflow with
+             * PMC_COUNTER_NEGATIVE_VAL. We don't have an easy way to
+             * do that since we're counting block of instructions at
+             * the end of each translation block, and we're probably
+             * passing this value at this point.
+             *
+             * Let's write PMC_COUNTER_NEGATIVE_VAL to the overflowed
+             * counter to simulate what the real hardware would do.
+             */
+            env->spr[sprn] =3D PMC_COUNTER_NEGATIVE_VAL;
+        }
+    }
+
+    return overflow_triggered;
+}
+
 static void pmu_update_cycles(CPUPPCState *env)
 {
     uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -195,7 +243,7 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulon=
g value)
=20
     env->spr[SPR_POWER_MMCR0] =3D value;
=20
-    /* MMCR0 writes can change HFLAGS_PMCCCLEAR */
+    /* MMCR0 writes can change HFLAGS_PMCCCLEAR and HFLAGS_INSN_CNT */
     hreg_compute_hflags(env);
=20
     /* Update cycle overflow timers with the current MMCR0 state */
@@ -207,6 +255,9 @@ void helper_store_mmcr1(CPUPPCState *env, uint64_t va=
lue)
     pmu_update_cycles(env);
=20
     env->spr[SPR_POWER_MMCR1] =3D value;
+
+    /* MMCR1 writes can change HFLAGS_INSN_CNT */
+    hreg_compute_hflags(env);
 }
=20
 target_ulong helper_read_pmc(CPUPPCState *env, uint32_t sprn)
@@ -237,6 +288,20 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
     return;
 }
=20
+/* This helper assumes that the PMC is running. */
+void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
+{
+    bool overflow_triggered;
+    PowerPCCPU *cpu;
+
+    overflow_triggered =3D pmu_increment_insns(env, num_insns);
+
+    if (overflow_triggered) {
+        cpu =3D env_archcpu(env);
+        fire_PMC_interrupt(cpu);
+    }
+}
+
 static void cpu_ppc_pmu_timer_cb(void *opaque)
 {
     PowerPCCPU *cpu =3D opaque;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b3f3b408db18..633b907058e4 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -177,6 +177,7 @@ struct DisasContext {
     bool hr;
     bool mmcr0_pmcc0;
     bool mmcr0_pmcc1;
+    bool pmu_insn_cnt;
     ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
     int singlestep_enabled;
     uint32_t flags;
@@ -4170,6 +4171,49 @@ static inline void gen_update_cfar(DisasContext *c=
tx, target_ulong nip)
 #endif
 }
=20
+#if defined(TARGET_PPC64)
+static void pmu_count_insns(DisasContext *ctx)
+{
+    /*
+     * Do not bother calling the helper if the PMU isn't counting
+     * instructions.
+     */
+    if (!ctx->pmu_insn_cnt) {
+        return;
+    }
+
+ #if !defined(CONFIG_USER_ONLY)
+    /*
+     * The PMU insns_inc() helper stops the internal PMU timer if a
+     * counter overflows happens. In that case, if the guest is
+     * running with icount and we do not handle it beforehand,
+     * the helper can trigger a 'bad icount read'.
+     */
+    gen_icount_io_start(ctx);
+
+    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns))=
;
+#else
+    /*
+     * User mode can read (but not write) PMC5 and start/stop
+     * the PMU via MMCR0_FC. In this case just increment
+     * PMC5 with base.num_insns.
+     */
+    TCGv t0 =3D tcg_temp_new();
+
+    gen_load_spr(t0, SPR_POWER_PMC5);
+    tcg_gen_addi_tl(t0, t0, ctx->base.num_insns);
+    gen_store_spr(SPR_POWER_PMC5, t0);
+
+    tcg_temp_free(t0);
+#endif /* #if !defined(CONFIG_USER_ONLY) */
+}
+#else
+static void pmu_count_insns(DisasContext *ctx)
+{
+    return;
+}
+#endif /* #if defined(TARGET_PPC64) */
+
 static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
     return translator_use_goto_tb(&ctx->base, dest);
@@ -4180,6 +4224,14 @@ static void gen_lookup_and_goto_ptr(DisasContext *=
ctx)
     if (unlikely(ctx->singlestep_enabled)) {
         gen_debug_exception(ctx);
     } else {
+        /*
+         * tcg_gen_lookup_and_goto_ptr will exit the TB if
+         * CF_NO_GOTO_PTR is set. Count insns now.
+         */
+        if (ctx->base.tb->flags & CF_NO_GOTO_PTR) {
+            pmu_count_insns(ctx);
+        }
+
         tcg_gen_lookup_and_goto_ptr();
     }
 }
@@ -4191,6 +4243,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, t=
arget_ulong dest)
         dest =3D (uint32_t) dest;
     }
     if (use_goto_tb(ctx, dest)) {
+        pmu_count_insns(ctx);
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_nip, dest & ~3);
         tcg_gen_exit_tb(ctx->base.tb, n);
@@ -8432,6 +8485,7 @@ static void ppc_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->hr =3D (hflags >> HFLAGS_HR) & 1;
     ctx->mmcr0_pmcc0 =3D (hflags >> HFLAGS_PMCC0) & 1;
     ctx->mmcr0_pmcc1 =3D (hflags >> HFLAGS_PMCC1) & 1;
+    ctx->pmu_insn_cnt =3D (hflags >> HFLAGS_INSN_CNT) & 1;
=20
     ctx->singlestep_enabled =3D 0;
     if ((hflags >> HFLAGS_SE) & 1) {
@@ -8538,6 +8592,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase=
, CPUState *cs)
     switch (is_jmp) {
     case DISAS_TOO_MANY:
         if (use_goto_tb(ctx, nip)) {
+            pmu_count_insns(ctx);
             tcg_gen_goto_tb(0);
             gen_update_nip(ctx, nip);
             tcg_gen_exit_tb(ctx->base.tb, 0);
@@ -8548,6 +8603,14 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbas=
e, CPUState *cs)
         gen_update_nip(ctx, nip);
         /* fall through */
     case DISAS_CHAIN:
+        /*
+         * tcg_gen_lookup_and_goto_ptr will exit the TB if
+         * CF_NO_GOTO_PTR is set. Count insns now.
+         */
+        if (ctx->base.tb->flags & CF_NO_GOTO_PTR) {
+            pmu_count_insns(ctx);
+        }
+
         tcg_gen_lookup_and_goto_ptr();
         break;
=20
@@ -8555,6 +8618,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase=
, CPUState *cs)
         gen_update_nip(ctx, nip);
         /* fall through */
     case DISAS_EXIT:
+        pmu_count_insns(ctx);
         tcg_gen_exit_tb(NULL, 0);
         break;
=20
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-reg=
s.c.inc
index 25b13ad56434..2bab6cece709 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -113,6 +113,12 @@ static void write_MMCR0_common(DisasContext *ctx, TC=
Gv val)
      */
     gen_icount_io_start(ctx);
     gen_helper_store_mmcr0(cpu_env, val);
+
+    /*
+     * End the translation block because MMCR0 writes can change
+     * ctx->pmu_insn_cnt.
+     */
+    ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
 }
=20
 void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
--=20
2.31.1


