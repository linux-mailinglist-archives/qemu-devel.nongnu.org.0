Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3326399CB2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:37:39 +0200 (CEST)
Received: from localhost ([::1]:37378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loirC-0007po-NV
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidB-0006ki-D4; Thu, 03 Jun 2021 04:23:09 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:51001 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid8-0000BU-EE; Thu, 03 Jun 2021 04:23:08 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5n5rxcz9t14; Thu,  3 Jun 2021 18:22:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708557;
 bh=7gpSKua6ShnAvfMf7w3znTQF2svPo9ULykKtrRLeDCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V2t3TO4cH6QEZKXUoHOxGYXQxf7I3j/ti2SusMezJY5bjDRMyYIHvxuljvNh8NMQH
 QhDpm12qS1+BUL1VMJ+KkN1LSe50ehB5m6X+8zy6V4DNb+JtH1DoXoeJA6Co+Qu//e
 gHPEEmiDKhT9g/sZ7/nO/zVsf+QIJJDEbs8MZmkk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 23/42] target/ppc: removed all mentions to PPC_DUMP_CPU
Date: Thu,  3 Jun 2021 18:22:12 +1000
Message-Id: <20210603082231.601214-24-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

This feature will no longer be useful as ppc moves to using decodetree
for TCG. And building with it enabled is no longer possible, due to
changes in opc_handler_t. Since the last commit that mentions it
happened in 2014, I think it is safe to remove it.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210531145629.21300-5-bruno.larsen@eldorado.org.br>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c  | 205 -----------------------------------------
 target/ppc/internal.h  |   2 -
 target/ppc/translate.c | 105 ---------------------
 3 files changed, 312 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 74a397ad6c..d0411e7302 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -8541,45 +8541,6 @@ static void init_ppc_proc(PowerPCCPU *cpu)
     }
 }
 
-#if defined(PPC_DUMP_CPU)
-static void dump_ppc_sprs(CPUPPCState *env)
-{
-    ppc_spr_t *spr;
-#if !defined(CONFIG_USER_ONLY)
-    uint32_t sr, sw;
-#endif
-    uint32_t ur, uw;
-    int i, j, n;
-
-    printf("Special purpose registers:\n");
-    for (i = 0; i < 32; i++) {
-        for (j = 0; j < 32; j++) {
-            n = (i << 5) | j;
-            spr = &env->spr_cb[n];
-            uw = spr->uea_write != NULL && spr->uea_write != SPR_NOACCESS;
-            ur = spr->uea_read != NULL && spr->uea_read != SPR_NOACCESS;
-#if !defined(CONFIG_USER_ONLY)
-            sw = spr->oea_write != NULL && spr->oea_write != SPR_NOACCESS;
-            sr = spr->oea_read != NULL && spr->oea_read != SPR_NOACCESS;
-            if (sw || sr || uw || ur) {
-                printf("SPR: %4d (%03x) %-8s s%c%c u%c%c\n",
-                       (i << 5) | j, (i << 5) | j, spr->name,
-                       sw ? 'w' : '-', sr ? 'r' : '-',
-                       uw ? 'w' : '-', ur ? 'r' : '-');
-            }
-#else
-            if (uw || ur) {
-                printf("SPR: %4d (%03x) %-8s u%c%c\n",
-                       (i << 5) | j, (i << 5) | j, spr->name,
-                       uw ? 'w' : '-', ur ? 'r' : '-');
-            }
-#endif
-        }
-    }
-    fflush(stdout);
-    fflush(stderr);
-}
-#endif
 
 static void ppc_cpu_realize(DeviceState *dev, Error **errp)
 {
@@ -8616,172 +8577,6 @@ static void ppc_cpu_realize(DeviceState *dev, Error **errp)
 
     pcc->parent_realize(dev, errp);
 
-#if defined(PPC_DUMP_CPU)
-    {
-        CPUPPCState *env = &cpu->env;
-        const char *mmu_model, *excp_model, *bus_model;
-        switch (env->mmu_model) {
-        case POWERPC_MMU_32B:
-            mmu_model = "PowerPC 32";
-            break;
-        case POWERPC_MMU_SOFT_6xx:
-            mmu_model = "PowerPC 6xx/7xx with software driven TLBs";
-            break;
-        case POWERPC_MMU_SOFT_74xx:
-            mmu_model = "PowerPC 74xx with software driven TLBs";
-            break;
-        case POWERPC_MMU_SOFT_4xx:
-            mmu_model = "PowerPC 4xx with software driven TLBs";
-            break;
-        case POWERPC_MMU_SOFT_4xx_Z:
-            mmu_model = "PowerPC 4xx with software driven TLBs "
-                "and zones protections";
-            break;
-        case POWERPC_MMU_REAL:
-            mmu_model = "PowerPC real mode only";
-            break;
-        case POWERPC_MMU_MPC8xx:
-            mmu_model = "PowerPC MPC8xx";
-            break;
-        case POWERPC_MMU_BOOKE:
-            mmu_model = "PowerPC BookE";
-            break;
-        case POWERPC_MMU_BOOKE206:
-            mmu_model = "PowerPC BookE 2.06";
-            break;
-        case POWERPC_MMU_601:
-            mmu_model = "PowerPC 601";
-            break;
-#if defined(TARGET_PPC64)
-        case POWERPC_MMU_64B:
-            mmu_model = "PowerPC 64";
-            break;
-#endif
-        default:
-            mmu_model = "Unknown or invalid";
-            break;
-        }
-        switch (env->excp_model) {
-        case POWERPC_EXCP_STD:
-            excp_model = "PowerPC";
-            break;
-        case POWERPC_EXCP_40x:
-            excp_model = "PowerPC 40x";
-            break;
-        case POWERPC_EXCP_601:
-            excp_model = "PowerPC 601";
-            break;
-        case POWERPC_EXCP_602:
-            excp_model = "PowerPC 602";
-            break;
-        case POWERPC_EXCP_603:
-            excp_model = "PowerPC 603";
-            break;
-        case POWERPC_EXCP_603E:
-            excp_model = "PowerPC 603e";
-            break;
-        case POWERPC_EXCP_604:
-            excp_model = "PowerPC 604";
-            break;
-        case POWERPC_EXCP_7x0:
-            excp_model = "PowerPC 740/750";
-            break;
-        case POWERPC_EXCP_7x5:
-            excp_model = "PowerPC 745/755";
-            break;
-        case POWERPC_EXCP_74xx:
-            excp_model = "PowerPC 74xx";
-            break;
-        case POWERPC_EXCP_BOOKE:
-            excp_model = "PowerPC BookE";
-            break;
-#if defined(TARGET_PPC64)
-        case POWERPC_EXCP_970:
-            excp_model = "PowerPC 970";
-            break;
-#endif
-        default:
-            excp_model = "Unknown or invalid";
-            break;
-        }
-        switch (env->bus_model) {
-        case PPC_FLAGS_INPUT_6xx:
-            bus_model = "PowerPC 6xx";
-            break;
-        case PPC_FLAGS_INPUT_BookE:
-            bus_model = "PowerPC BookE";
-            break;
-        case PPC_FLAGS_INPUT_405:
-            bus_model = "PowerPC 405";
-            break;
-        case PPC_FLAGS_INPUT_401:
-            bus_model = "PowerPC 401/403";
-            break;
-        case PPC_FLAGS_INPUT_RCPU:
-            bus_model = "RCPU / MPC8xx";
-            break;
-#if defined(TARGET_PPC64)
-        case PPC_FLAGS_INPUT_970:
-            bus_model = "PowerPC 970";
-            break;
-#endif
-        default:
-            bus_model = "Unknown or invalid";
-            break;
-        }
-        printf("PowerPC %-12s : PVR %08x MSR %016" PRIx64 "\n"
-               "    MMU model        : %s\n",
-               object_class_get_name(OBJECT_CLASS(pcc)),
-               pcc->pvr, pcc->msr_mask, mmu_model);
-#if !defined(CONFIG_USER_ONLY)
-        if (env->tlb.tlb6) {
-            printf("                       %d %s TLB in %d ways\n",
-                   env->nb_tlb, env->id_tlbs ? "splitted" : "merged",
-                   env->nb_ways);
-        }
-#endif
-        printf("    Exceptions model : %s\n"
-               "    Bus model        : %s\n",
-               excp_model, bus_model);
-        printf("    MSR features     :\n");
-        if (env->flags & POWERPC_FLAG_SPE) {
-            printf("                        signal processing engine enable"
-                   "\n");
-        } else if (env->flags & POWERPC_FLAG_VRE) {
-            printf("                        vector processor enable\n");
-        }
-        if (env->flags & POWERPC_FLAG_TGPR) {
-            printf("                        temporary GPRs\n");
-        } else if (env->flags & POWERPC_FLAG_CE) {
-            printf("                        critical input enable\n");
-        }
-        if (env->flags & POWERPC_FLAG_SE) {
-            printf("                        single-step trace mode\n");
-        } else if (env->flags & POWERPC_FLAG_DWE) {
-            printf("                        debug wait enable\n");
-        } else if (env->flags & POWERPC_FLAG_UBLE) {
-            printf("                        user BTB lock enable\n");
-        }
-        if (env->flags & POWERPC_FLAG_BE) {
-            printf("                        branch-step trace mode\n");
-        } else if (env->flags & POWERPC_FLAG_DE) {
-            printf("                        debug interrupt enable\n");
-        }
-        if (env->flags & POWERPC_FLAG_PX) {
-            printf("                        inclusive protection\n");
-        } else if (env->flags & POWERPC_FLAG_PMM) {
-            printf("                        performance monitor mark\n");
-        }
-        if (env->flags == POWERPC_FLAG_NONE) {
-            printf("                        none\n");
-        }
-        printf("    Time-base/decrementer clock source: %s\n",
-               env->flags & POWERPC_FLAG_RTC_CLK ? "RTC clock" : "bus clock");
-        dump_ppc_insns(env);
-        dump_ppc_sprs(env);
-        fflush(stdout);
-    }
-#endif
     return;
 
 unrealize:
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 2b4b06eb76..f1fd3c8d04 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -218,8 +218,6 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 
 /* translate.c */
 
-/* #define PPC_DUMP_CPU */
-
 int ppc_fixup_cpu(PowerPCCPU *cpu);
 void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp);
 void destroy_ppc_opcodes(PowerPCCPU *cpu);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 4b66563998..e16a2721e2 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -216,9 +216,6 @@ struct opc_handler_t {
     uint64_t type2;
     /* handler */
     void (*handler)(DisasContext *ctx);
-#if defined(PPC_DUMP_CPU)
-    const char *oname;
-#endif
 };
 
 /* SPR load/store helpers */
@@ -8463,10 +8460,6 @@ static int register_direct_insn(opc_handler_t **ppc_opcodes,
     if (insert_in_table(ppc_opcodes, idx, handler) < 0) {
         printf("*** ERROR: opcode %02x already assigned in main "
                "opcode table\n", idx);
-#if defined(PPC_DUMP_CPU)
-        printf("           Registered handler '%s' - new handler '%s'\n",
-               ppc_opcodes[idx]->oname, handler->oname);
-#endif
         return -1;
     }
 
@@ -8487,10 +8480,6 @@ static int register_ind_in_table(opc_handler_t **table,
         if (!is_indirect_opcode(table[idx1])) {
             printf("*** ERROR: idx %02x already assigned to a direct "
                    "opcode\n", idx1);
-#if defined(PPC_DUMP_CPU)
-            printf("           Registered handler '%s' - new handler '%s'\n",
-                   ind_table(table[idx1])[idx2]->oname, handler->oname);
-#endif
             return -1;
         }
     }
@@ -8498,10 +8487,6 @@ static int register_ind_in_table(opc_handler_t **table,
         insert_in_table(ind_table(table[idx1]), idx2, handler) < 0) {
         printf("*** ERROR: opcode %02x already assigned in "
                "opcode table %02x\n", idx2, idx1);
-#if defined(PPC_DUMP_CPU)
-        printf("           Registered handler '%s' - new handler '%s'\n",
-               ind_table(table[idx1])[idx2]->oname, handler->oname);
-#endif
         return -1;
     }
 
@@ -8683,96 +8668,6 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu)
     }
 }
 
-#if defined(PPC_DUMP_CPU)
-static void dump_ppc_insns(CPUPPCState *env)
-{
-    opc_handler_t **table, *handler;
-    const char *p, *q;
-    uint8_t opc1, opc2, opc3, opc4;
-
-    printf("Instructions set:\n");
-    /* opc1 is 6 bits long */
-    for (opc1 = 0x00; opc1 < PPC_CPU_OPCODES_LEN; opc1++) {
-        table = env->opcodes;
-        handler = table[opc1];
-        if (is_indirect_opcode(handler)) {
-            /* opc2 is 5 bits long */
-            for (opc2 = 0; opc2 < PPC_CPU_INDIRECT_OPCODES_LEN; opc2++) {
-                table = env->opcodes;
-                handler = env->opcodes[opc1];
-                table = ind_table(handler);
-                handler = table[opc2];
-                if (is_indirect_opcode(handler)) {
-                    table = ind_table(handler);
-                    /* opc3 is 5 bits long */
-                    for (opc3 = 0; opc3 < PPC_CPU_INDIRECT_OPCODES_LEN;
-                            opc3++) {
-                        handler = table[opc3];
-                        if (is_indirect_opcode(handler)) {
-                            table = ind_table(handler);
-                            /* opc4 is 5 bits long */
-                            for (opc4 = 0; opc4 < PPC_CPU_INDIRECT_OPCODES_LEN;
-                                 opc4++) {
-                                handler = table[opc4];
-                                if (handler->handler != &gen_invalid) {
-                                    printf("INSN: %02x %02x %02x %02x -- "
-                                           "(%02d %04d %02d) : %s\n",
-                                           opc1, opc2, opc3, opc4,
-                                           opc1, (opc3 << 5) | opc2, opc4,
-                                           handler->oname);
-                                }
-                            }
-                        } else {
-                            if (handler->handler != &gen_invalid) {
-                                /* Special hack to properly dump SPE insns */
-                                p = strchr(handler->oname, '_');
-                                if (p == NULL) {
-                                    printf("INSN: %02x %02x %02x (%02d %04d) : "
-                                           "%s\n",
-                                           opc1, opc2, opc3, opc1,
-                                           (opc3 << 5) | opc2,
-                                           handler->oname);
-                                } else {
-                                    q = "speundef";
-                                    if ((p - handler->oname) != strlen(q)
-                                        || (memcmp(handler->oname, q, strlen(q))
-                                            != 0)) {
-                                        /* First instruction */
-                                        printf("INSN: %02x %02x %02x"
-                                               "(%02d %04d) : %.*s\n",
-                                               opc1, opc2 << 1, opc3, opc1,
-                                               (opc3 << 6) | (opc2 << 1),
-                                               (int)(p - handler->oname),
-                                               handler->oname);
-                                    }
-                                    if (strcmp(p + 1, q) != 0) {
-                                        /* Second instruction */
-                                        printf("INSN: %02x %02x %02x "
-                                               "(%02d %04d) : %s\n", opc1,
-                                               (opc2 << 1) | 1, opc3, opc1,
-                                               (opc3 << 6) | (opc2 << 1) | 1,
-                                               p + 1);
-                                    }
-                                }
-                            }
-                        }
-                    }
-                } else {
-                    if (handler->handler != &gen_invalid) {
-                        printf("INSN: %02x %02x -- (%02d %04d) : %s\n",
-                               opc1, opc2, opc1, opc2, handler->oname);
-                    }
-                }
-            }
-        } else {
-            if (handler->handler != &gen_invalid) {
-                printf("INSN: %02x -- -- (%02d ----) : %s\n",
-                       opc1, opc1, handler->oname);
-            }
-        }
-    }
-}
-#endif
 int ppc_fixup_cpu(PowerPCCPU *cpu)
 {
     CPUPPCState *env = &cpu->env;
-- 
2.31.1


