Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA594641F4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 00:07:01 +0100 (CET)
Received: from localhost ([::1]:47572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msCDE-0000Qb-PM
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 18:07:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1msC8X-00013G-MH; Tue, 30 Nov 2021 18:02:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1msC8V-0000LC-2N; Tue, 30 Nov 2021 18:02:09 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AUMlITg030267; 
 Tue, 30 Nov 2021 23:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=kXJ5ZAzqPEekhlh7dNKsDQKV07uwzdfqxwcyuIani2c=;
 b=NB7G007eAVQAD8tB+PmfND9aID1Lr+PE3EF3oACvRtJN5SgwR0Gs/cx45XxMjAESv3Zs
 6MZCSESCjLZTTpidf6Y87jGFpsIym2Exqd4MfdbBaavQyWsBI9zBH/yz2cFaDPrZXijy
 iA18E/FLzu+NOo8BFpBcShAIefXMhnDBRS6KvpXAk5puitcvHPH2GGrIGKDkGYvNmjAz
 B45FBtbIa9k+H3VLHrHgeduasUxxFLc9qOdYU2AkRAAVLDUS3X9L90PaRmEAZN4cO0Zy
 SfpSImRnw6dsbSx9MeyFTNMc0cXD8Qr16gKs6qAZHRAaq4beGTo0RaN3X6TlnrNSc5B6 qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnw2cr9ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:45 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AUN07mb027986;
 Tue, 30 Nov 2021 23:01:44 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnw2cr9an-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:44 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AUMmbon001061;
 Tue, 30 Nov 2021 23:01:43 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 3ckcac1cp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:43 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AUN1ft333751676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 23:01:41 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D99ABE051;
 Tue, 30 Nov 2021 23:01:41 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0718BBE054;
 Tue, 30 Nov 2021 23:01:39 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.34.87])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Nov 2021 23:01:38 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 3/4] target/ppc: Remove the software TLB model of 7450
 CPUs
Date: Tue, 30 Nov 2021 20:01:22 -0300
Message-Id: <20211130230123.781844-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130230123.781844-1-farosas@linux.ibm.com>
References: <20211130230123.781844-1-farosas@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RS92_UH6AD9huebeTLaOC4DoEcctn8jN
X-Proofpoint-ORIG-GUID: 9qF3DT9nfmaWpz3QPujs55HyYcaYabu7
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0 clxscore=1015
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111300112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, clg@kaod.org,
 openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Applies to 7441, 7445, 7450, 7451, 7455, 7457, 7447, 7447a and 7448)

The QEMU-side software TLB implementation for the 7450 family of CPUs
is being removed due to lack of known users in the real world. The
last users in the code were removed by the two previous commits.

A brief history:

The feature was added in QEMU by commit 7dbe11acd8 ("Handle all MMU
models in switches...") with the mention that Linux was not able to
handle the TLB miss interrupts and the MMU model would be kept
disabled.

At some point later, commit 8ca3f6c382 ("Allow selection of all
defined PowerPC 74xx (aka G4) CPUs.") enabled the model for the 7450
family without further justification.

We have since the year 2011 [1] been unable to run OpenBIOS in the
7450s and have not heard of any other software that is used with those
CPUs in QEMU. Attempts were made to find a guest OS that implemented
the TLB miss handlers and none were found among Linux 5.15, FreeBSD 13,
MacOS9, MacOSX and MorphOS 3.15.

All CPUs that registered this feature were moved to an MMU model that
replaces the software TLB with a QEMU hardware TLB
implementation. They can now run the same software as the 7400 CPUs,
including the OSes mentioned above.

References:

- https://bugs.launchpad.net/qemu/+bug/812398
  https://gitlab.com/qemu-project/qemu/-/issues/86

- https://lists.nongnu.org/archive/html/qemu-ppc/2021-11/msg00289.html
  message id: 20211119134431.406753-1-farosas@linux.ibm.com

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu-qom.h     |  6 +++++-
 target/ppc/cpu.h         |  4 +---
 target/ppc/cpu_init.c    | 26 --------------------------
 target/ppc/excp_helper.c | 29 -----------------------------
 target/ppc/helper.h      |  2 --
 target/ppc/mmu_common.c  | 19 -------------------
 target/ppc/mmu_helper.c  | 31 -------------------------------
 target/ppc/translate.c   | 26 --------------------------
 8 files changed, 6 insertions(+), 137 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 5800fa324e..ef9e324474 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -45,7 +45,11 @@ enum powerpc_mmu_t {
     POWERPC_MMU_32B        = 0x00000001,
     /* PowerPC 6xx MMU with software TLB                       */
     POWERPC_MMU_SOFT_6xx   = 0x00000002,
-    /* PowerPC 74xx MMU with software TLB                      */
+    /*
+     * PowerPC 74xx MMU with software TLB (this has been
+     * disabled, see git history for more information.
+     * keywords: tlbld tlbli TLBMISS PTEHI PTELO)
+     */
     POWERPC_MMU_SOFT_74xx  = 0x00000003,
     /* PowerPC 4xx MMU with software TLB                       */
     POWERPC_MMU_SOFT_4xx   = 0x00000004,
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e946da5f3a..432d609094 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2138,8 +2138,6 @@ enum {
     PPC_SEGMENT        = 0x0000020000000000ULL,
     /*   PowerPC 6xx TLB management instructions                             */
     PPC_6xx_TLB        = 0x0000040000000000ULL,
-    /* PowerPC 74xx TLB management instructions                              */
-    PPC_74xx_TLB       = 0x0000080000000000ULL,
     /*   PowerPC 40x TLB management instructions                             */
     PPC_40x_TLB        = 0x0000100000000000ULL,
     /*   segment register access instructions for PowerPC 64 "bridge"        */
@@ -2196,7 +2194,7 @@ enum {
                         | PPC_CACHE_DCBZ \
                         | PPC_CACHE_DCBA | PPC_CACHE_LOCK \
                         | PPC_EXTERN | PPC_SEGMENT | PPC_6xx_TLB \
-                        | PPC_74xx_TLB | PPC_40x_TLB | PPC_SEGMENT_64B \
+                        | PPC_40x_TLB | PPC_SEGMENT_64B \
                         | PPC_SLBI | PPC_WRTEE | PPC_40x_EXCP \
                         | PPC_405_MAC | PPC_440_SPEC | PPC_BOOKE \
                         | PPC_MFAPIDI | PPC_TLBIVA | PPC_TLBIVAX \
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 962acf295f..ed0e2136d9 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -945,31 +945,6 @@ static void register_l3_ctrl(CPUPPCState *env)
                  0x00000000);
 }
 
-static void register_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->nb_tlb = nb_tlbs;
-    env->nb_ways = nb_ways;
-    env->id_tlbs = 1;
-    env->tlb_type = TLB_6XX;
-    /* XXX : not implemented */
-    spr_register(env, SPR_PTEHI, "PTEHI",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_PTELO, "PTELO",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_TLBMISS, "TLBMISS",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-#endif
-}
-
 static void register_usprg3_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_USPRG3, "USPRG3",
@@ -9238,7 +9213,6 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     case POWERPC_MMU_32B:
     case POWERPC_MMU_601:
     case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
 #if defined(TARGET_PPC64)
     case POWERPC_MMU_64B:
     case POWERPC_MMU_2_03:
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 17607adbe4..f1da0e119d 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -714,35 +714,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             /* Set way using a LRU mechanism */
             msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
             break;
-        case POWERPC_EXCP_74xx:
-#if defined(DEBUG_SOFTWARE_TLB)
-            if (qemu_log_enabled()) {
-                const char *es;
-                target_ulong *miss, *cmp;
-                int en;
-
-                if (excp == POWERPC_EXCP_IFTLB) {
-                    es = "I";
-                    en = 'I';
-                    miss = &env->spr[SPR_TLBMISS];
-                    cmp = &env->spr[SPR_PTEHI];
-                } else {
-                    if (excp == POWERPC_EXCP_DLTLB) {
-                        es = "DL";
-                    } else {
-                        es = "DS";
-                    }
-                    en = 'D';
-                    miss = &env->spr[SPR_TLBMISS];
-                    cmp = &env->spr[SPR_PTEHI];
-                }
-                qemu_log("74xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
-                         TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
-                         env->error_code);
-            }
-#endif
-            msr |= env->error_code; /* key bit */
-            break;
         default:
             cpu_abort(cs, "Invalid TLB miss exception\n");
             break;
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 627811cefc..b955b07fc3 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -614,8 +614,6 @@ DEF_HELPER_2(booke_set_eplc, void, env, tl)
 DEF_HELPER_2(booke_set_epsc, void, env, tl)
 DEF_HELPER_2(6xx_tlbd, void, env, tl)
 DEF_HELPER_2(6xx_tlbi, void, env, tl)
-DEF_HELPER_2(74xx_tlbd, void, env, tl)
-DEF_HELPER_2(74xx_tlbi, void, env, tl)
 DEF_HELPER_FLAGS_1(tlbia, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(tlbie, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(tlbiva, TCG_CALL_NO_RWG, void, env, tl)
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 754509e556..86795b2814 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -1147,7 +1147,6 @@ void dump_mmu(CPUPPCState *env)
         mmubooke206_dump_mmu(env);
         break;
     case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
         mmu6xx_dump_mmu(env);
         break;
 #if defined(TARGET_PPC64)
@@ -1181,7 +1180,6 @@ static int check_physical(CPUPPCState *env, mmu_ctx_t *ctx, target_ulong eaddr,
     ret = 0;
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
     case POWERPC_MMU_SOFT_4xx:
     case POWERPC_MMU_REAL:
     case POWERPC_MMU_BOOKE:
@@ -1234,7 +1232,6 @@ int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
 
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
         if (real_mode) {
             ret = check_physical(env, ctx, eaddr, access_type);
         } else {
@@ -1383,9 +1380,6 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
                     env->spr[SPR_IMISS] = eaddr;
                     env->spr[SPR_ICMP] = 0x80000000 | ctx.ptem;
                     goto tlb_miss;
-                case POWERPC_MMU_SOFT_74xx:
-                    cs->exception_index = POWERPC_EXCP_IFTLB;
-                    goto tlb_miss_74xx;
                 case POWERPC_MMU_SOFT_4xx:
                 case POWERPC_MMU_SOFT_4xx_Z:
                     cs->exception_index = POWERPC_EXCP_ITLB;
@@ -1454,19 +1448,6 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
                     env->spr[SPR_HASH2] = ppc_hash32_hpt_base(cpu) +
                         get_pteg_offset32(cpu, ctx.hash[1]);
                     break;
-                case POWERPC_MMU_SOFT_74xx:
-                    if (access_type == MMU_DATA_STORE) {
-                        cs->exception_index = POWERPC_EXCP_DSTLB;
-                    } else {
-                        cs->exception_index = POWERPC_EXCP_DLTLB;
-                    }
-                tlb_miss_74xx:
-                    /* Implement LRU algorithm */
-                    env->error_code = ctx.key << 19;
-                    env->spr[SPR_TLBMISS] = (eaddr & ~((target_ulong)0x3)) |
-                        ((env->last_way + 1) & (env->nb_ways - 1));
-                    env->spr[SPR_PTEHI] = 0x80000000 | ctx.ptem;
-                    break;
                 case POWERPC_MMU_SOFT_4xx:
                 case POWERPC_MMU_SOFT_4xx_Z:
                     cs->exception_index = POWERPC_EXCP_DTLB;
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index e0c4950dda..f992131c1a 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -385,7 +385,6 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
 #endif /* defined(TARGET_PPC64) */
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
         ppc6xx_tlb_invalidate_all(env);
         break;
     case POWERPC_MMU_SOFT_4xx:
@@ -434,7 +433,6 @@ void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
 #endif /* defined(TARGET_PPC64) */
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
         ppc6xx_tlb_invalidate_virt(env, addr, 0);
         if (env->id_tlbs == 1) {
             ppc6xx_tlb_invalidate_virt(env, addr, 1);
@@ -571,35 +569,6 @@ void helper_6xx_tlbi(CPUPPCState *env, target_ulong EPN)
     do_6xx_tlb(env, EPN, 1);
 }
 
-/* PowerPC 74xx software TLB load instructions helpers */
-static void do_74xx_tlb(CPUPPCState *env, target_ulong new_EPN, int is_code)
-{
-    target_ulong RPN, CMP, EPN;
-    int way;
-
-    RPN = env->spr[SPR_PTELO];
-    CMP = env->spr[SPR_PTEHI];
-    EPN = env->spr[SPR_TLBMISS] & ~0x3;
-    way = env->spr[SPR_TLBMISS] & 0x3;
-    (void)EPN; /* avoid a compiler warning */
-    LOG_SWTLB("%s: EPN " TARGET_FMT_lx " " TARGET_FMT_lx " PTE0 " TARGET_FMT_lx
-              " PTE1 " TARGET_FMT_lx " way %d\n", __func__, new_EPN, EPN, CMP,
-              RPN, way);
-    /* Store this TLB */
-    ppc6xx_tlb_store(env, (uint32_t)(new_EPN & TARGET_PAGE_MASK),
-                     way, is_code, CMP, RPN);
-}
-
-void helper_74xx_tlbd(CPUPPCState *env, target_ulong EPN)
-{
-    do_74xx_tlb(env, EPN, 0);
-}
-
-void helper_74xx_tlbi(CPUPPCState *env, target_ulong EPN)
-{
-    do_74xx_tlb(env, EPN, 1);
-}
-
 /*****************************************************************************/
 /* PowerPC 601 specific instructions (POWER bridge) */
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 9960df6e18..b3f3b408db 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6252,30 +6252,6 @@ static void gen_tlbli_6xx(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
-/* 74xx TLB management */
-
-/* tlbld */
-static void gen_tlbld_74xx(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
-#else
-    CHK_SV;
-    gen_helper_74xx_tlbd(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
-/* tlbli */
-static void gen_tlbli_74xx(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
-#else
-    CHK_SV;
-    gen_helper_74xx_tlbi(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 /* POWER instructions not in PowerPC 601 */
 
 /* clf */
@@ -7735,8 +7711,6 @@ GEN_HANDLER(esa, 0x1F, 0x14, 0x12, 0x03FFF801, PPC_602_SPEC),
 GEN_HANDLER(mfrom, 0x1F, 0x09, 0x08, 0x03E0F801, PPC_602_SPEC),
 GEN_HANDLER2(tlbld_6xx, "tlbld", 0x1F, 0x12, 0x1E, 0x03FF0001, PPC_6xx_TLB),
 GEN_HANDLER2(tlbli_6xx, "tlbli", 0x1F, 0x12, 0x1F, 0x03FF0001, PPC_6xx_TLB),
-GEN_HANDLER2(tlbld_74xx, "tlbld", 0x1F, 0x12, 0x1E, 0x03FF0001, PPC_74xx_TLB),
-GEN_HANDLER2(tlbli_74xx, "tlbli", 0x1F, 0x12, 0x1F, 0x03FF0001, PPC_74xx_TLB),
 GEN_HANDLER(clf, 0x1F, 0x16, 0x03, 0x03E00000, PPC_POWER),
 GEN_HANDLER(cli, 0x1F, 0x16, 0x0F, 0x03E00000, PPC_POWER),
 GEN_HANDLER(dclst, 0x1F, 0x16, 0x13, 0x03E00000, PPC_POWER),
-- 
2.33.1


