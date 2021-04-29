Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40C736EE42
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 18:38:38 +0200 (CEST)
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc9gT-0001qs-E9
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 12:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lc9QD-0003oC-Jy; Thu, 29 Apr 2021 12:21:49 -0400
Received: from [201.28.113.2] (port=29626 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lc9QA-0003ag-9r; Thu, 29 Apr 2021 12:21:49 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 29 Apr 2021 13:21:38 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id AEBDA8013C2;
 Thu, 29 Apr 2021 13:21:38 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] target/ppc: move opcode table logic to translate.c
Date: Thu, 29 Apr 2021 13:21:24 -0300
Message-Id: <20210429162130.2412-2-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 29 Apr 2021 16:21:38.0853 (UTC)
 FILETIME=[BB67BD50:01D73D13]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

code motion to remove opcode callback table from
translate_init.c.inc to translate.c in preparation to remove
the #include <translate_init.c.inc> from translate.c. Also created
destroy_ppc_opcodes and removed that logic from ppc_cpu_unrealize

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/internal.h           |   8 +
 target/ppc/translate.c          | 394 ++++++++++++++++++++++++++++++++
 target/ppc/translate_init.c.inc | 391 +------------------------------
 3 files changed, 403 insertions(+), 390 deletions(-)

diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index c401658e8d..184ba6d6b3 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -216,6 +216,14 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                  MMUAccessType access_type,
                                  int mmu_idx, uintptr_t retaddr);
 
+/* translate.c */
+
+/* #define PPC_DUMP_CPU */
+
+int ppc_fixup_cpu(PowerPCCPU *cpu);
+void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp);
+void destroy_ppc_opcodes(PowerPCCPU *cpu);
+
 /* gdbstub.c */
 void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
 gchar *ppc_gdb_arch_name(CPUState *cs);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 0984ce637b..b319d409c6 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7825,6 +7825,400 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #undef RFPL
 }
 
+/*****************************************************************************/
+/* Opcode types */
+enum {
+    PPC_DIRECT   = 0, /* Opcode routine        */
+    PPC_INDIRECT = 1, /* Indirect opcode table */
+};
+
+#define PPC_OPCODE_MASK 0x3
+
+static inline int is_indirect_opcode(void *handler)
+{
+    return ((uintptr_t)handler & PPC_OPCODE_MASK) == PPC_INDIRECT;
+}
+
+static inline opc_handler_t **ind_table(void *handler)
+{
+    return (opc_handler_t **)((uintptr_t)handler & ~PPC_OPCODE_MASK);
+}
+
+/* Instruction table creation */
+/* Opcodes tables creation */
+static void fill_new_table(opc_handler_t **table, int len)
+{
+    int i;
+
+    for (i = 0; i < len; i++) {
+        table[i] = &invalid_handler;
+    }
+}
+
+static int create_new_table(opc_handler_t **table, unsigned char idx)
+{
+    opc_handler_t **tmp;
+
+    tmp = g_new(opc_handler_t *, PPC_CPU_INDIRECT_OPCODES_LEN);
+    fill_new_table(tmp, PPC_CPU_INDIRECT_OPCODES_LEN);
+    table[idx] = (opc_handler_t *)((uintptr_t)tmp | PPC_INDIRECT);
+
+    return 0;
+}
+
+static int insert_in_table(opc_handler_t **table, unsigned char idx,
+                            opc_handler_t *handler)
+{
+    if (table[idx] != &invalid_handler) {
+        return -1;
+    }
+    table[idx] = handler;
+
+    return 0;
+}
+
+static int register_direct_insn(opc_handler_t **ppc_opcodes,
+                                unsigned char idx, opc_handler_t *handler)
+{
+    if (insert_in_table(ppc_opcodes, idx, handler) < 0) {
+        printf("*** ERROR: opcode %02x already assigned in main "
+               "opcode table\n", idx);
+#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
+        printf("           Registered handler '%s' - new handler '%s'\n",
+               ppc_opcodes[idx]->oname, handler->oname);
+#endif
+        return -1;
+    }
+
+    return 0;
+}
+
+static int register_ind_in_table(opc_handler_t **table,
+                                 unsigned char idx1, unsigned char idx2,
+                                 opc_handler_t *handler)
+{
+    if (table[idx1] == &invalid_handler) {
+        if (create_new_table(table, idx1) < 0) {
+            printf("*** ERROR: unable to create indirect table "
+                   "idx=%02x\n", idx1);
+            return -1;
+        }
+    } else {
+        if (!is_indirect_opcode(table[idx1])) {
+            printf("*** ERROR: idx %02x already assigned to a direct "
+                   "opcode\n", idx1);
+#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
+            printf("           Registered handler '%s' - new handler '%s'\n",
+                   ind_table(table[idx1])[idx2]->oname, handler->oname);
+#endif
+            return -1;
+        }
+    }
+    if (handler != NULL &&
+        insert_in_table(ind_table(table[idx1]), idx2, handler) < 0) {
+        printf("*** ERROR: opcode %02x already assigned in "
+               "opcode table %02x\n", idx2, idx1);
+#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
+        printf("           Registered handler '%s' - new handler '%s'\n",
+               ind_table(table[idx1])[idx2]->oname, handler->oname);
+#endif
+        return -1;
+    }
+
+    return 0;
+}
+
+static int register_ind_insn(opc_handler_t **ppc_opcodes,
+                             unsigned char idx1, unsigned char idx2,
+                             opc_handler_t *handler)
+{
+    return register_ind_in_table(ppc_opcodes, idx1, idx2, handler);
+}
+
+static int register_dblind_insn(opc_handler_t **ppc_opcodes,
+                                unsigned char idx1, unsigned char idx2,
+                                unsigned char idx3, opc_handler_t *handler)
+{
+    if (register_ind_in_table(ppc_opcodes, idx1, idx2, NULL) < 0) {
+        printf("*** ERROR: unable to join indirect table idx "
+               "[%02x-%02x]\n", idx1, idx2);
+        return -1;
+    }
+    if (register_ind_in_table(ind_table(ppc_opcodes[idx1]), idx2, idx3,
+                              handler) < 0) {
+        printf("*** ERROR: unable to insert opcode "
+               "[%02x-%02x-%02x]\n", idx1, idx2, idx3);
+        return -1;
+    }
+
+    return 0;
+}
+
+static int register_trplind_insn(opc_handler_t **ppc_opcodes,
+                                 unsigned char idx1, unsigned char idx2,
+                                 unsigned char idx3, unsigned char idx4,
+                                 opc_handler_t *handler)
+{
+    opc_handler_t **table;
+
+    if (register_ind_in_table(ppc_opcodes, idx1, idx2, NULL) < 0) {
+        printf("*** ERROR: unable to join indirect table idx "
+               "[%02x-%02x]\n", idx1, idx2);
+        return -1;
+    }
+    table = ind_table(ppc_opcodes[idx1]);
+    if (register_ind_in_table(table, idx2, idx3, NULL) < 0) {
+        printf("*** ERROR: unable to join 2nd-level indirect table idx "
+               "[%02x-%02x-%02x]\n", idx1, idx2, idx3);
+        return -1;
+    }
+    table = ind_table(table[idx2]);
+    if (register_ind_in_table(table, idx3, idx4, handler) < 0) {
+        printf("*** ERROR: unable to insert opcode "
+               "[%02x-%02x-%02x-%02x]\n", idx1, idx2, idx3, idx4);
+        return -1;
+    }
+    return 0;
+}
+static int register_insn(opc_handler_t **ppc_opcodes, opcode_t *insn)
+{
+    if (insn->opc2 != 0xFF) {
+        if (insn->opc3 != 0xFF) {
+            if (insn->opc4 != 0xFF) {
+                if (register_trplind_insn(ppc_opcodes, insn->opc1, insn->opc2,
+                                          insn->opc3, insn->opc4,
+                                          &insn->handler) < 0) {
+                    return -1;
+                }
+            } else {
+                if (register_dblind_insn(ppc_opcodes, insn->opc1, insn->opc2,
+                                         insn->opc3, &insn->handler) < 0) {
+                    return -1;
+                }
+            }
+        } else {
+            if (register_ind_insn(ppc_opcodes, insn->opc1,
+                                  insn->opc2, &insn->handler) < 0) {
+                return -1;
+            }
+        }
+    } else {
+        if (register_direct_insn(ppc_opcodes, insn->opc1, &insn->handler) < 0) {
+            return -1;
+        }
+    }
+
+    return 0;
+}
+
+static int test_opcode_table(opc_handler_t **table, int len)
+{
+    int i, count, tmp;
+
+    for (i = 0, count = 0; i < len; i++) {
+        /* Consistency fixup */
+        if (table[i] == NULL) {
+            table[i] = &invalid_handler;
+        }
+        if (table[i] != &invalid_handler) {
+            if (is_indirect_opcode(table[i])) {
+                tmp = test_opcode_table(ind_table(table[i]),
+                    PPC_CPU_INDIRECT_OPCODES_LEN);
+                if (tmp == 0) {
+                    free(table[i]);
+                    table[i] = &invalid_handler;
+                } else {
+                    count++;
+                }
+            } else {
+                count++;
+            }
+        }
+    }
+
+    return count;
+}
+
+static void fix_opcode_tables(opc_handler_t **ppc_opcodes)
+{
+    if (test_opcode_table(ppc_opcodes, PPC_CPU_OPCODES_LEN) == 0) {
+        printf("*** WARNING: no opcode defined !\n");
+    }
+}
+
+/*****************************************************************************/
+void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp)
+{
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    opcode_t *opc;
+
+    fill_new_table(cpu->opcodes, PPC_CPU_OPCODES_LEN);
+    for (opc = opcodes; opc < &opcodes[ARRAY_SIZE(opcodes)]; opc++) {
+        if (((opc->handler.type & pcc->insns_flags) != 0) ||
+            ((opc->handler.type2 & pcc->insns_flags2) != 0)) {
+            if (register_insn(cpu->opcodes, opc) < 0) {
+                error_setg(errp, "ERROR initializing PowerPC instruction "
+                           "0x%02x 0x%02x 0x%02x", opc->opc1, opc->opc2,
+                           opc->opc3);
+                return;
+            }
+        }
+    }
+    fix_opcode_tables(cpu->opcodes);
+    fflush(stdout);
+    fflush(stderr);
+}
+
+void destroy_ppc_opcodes(PowerPCCPU *cpu)
+{
+    opc_handler_t **table, **table_2;
+    int i, j, k;
+
+    for (i = 0; i < PPC_CPU_OPCODES_LEN; i++) {
+        if (cpu->opcodes[i] == &invalid_handler) {
+            continue;
+        }
+        if (is_indirect_opcode(cpu->opcodes[i])) {
+            table = ind_table(cpu->opcodes[i]);
+            for (j = 0; j < PPC_CPU_INDIRECT_OPCODES_LEN; j++) {
+                if (table[j] == &invalid_handler) {
+                    continue;
+                }
+                if (is_indirect_opcode(table[j])) {
+                    table_2 = ind_table(table[j]);
+                    for (k = 0; k < PPC_CPU_INDIRECT_OPCODES_LEN; k++) {
+                        if (table_2[k] != &invalid_handler &&
+                            is_indirect_opcode(table_2[k])) {
+                            g_free((opc_handler_t *)((uintptr_t)table_2[k] &
+                                                     ~PPC_INDIRECT));
+                        }
+                    }
+                    g_free((opc_handler_t *)((uintptr_t)table[j] &
+                                             ~PPC_INDIRECT));
+                }
+            }
+            g_free((opc_handler_t *)((uintptr_t)cpu->opcodes[i] &
+                ~PPC_INDIRECT));
+        }
+    }
+}
+
+#if defined(PPC_DUMP_CPU)
+static void dump_ppc_insns(CPUPPCState *env)
+{
+    opc_handler_t **table, *handler;
+    const char *p, *q;
+    uint8_t opc1, opc2, opc3, opc4;
+
+    printf("Instructions set:\n");
+    /* opc1 is 6 bits long */
+    for (opc1 = 0x00; opc1 < PPC_CPU_OPCODES_LEN; opc1++) {
+        table = env->opcodes;
+        handler = table[opc1];
+        if (is_indirect_opcode(handler)) {
+            /* opc2 is 5 bits long */
+            for (opc2 = 0; opc2 < PPC_CPU_INDIRECT_OPCODES_LEN; opc2++) {
+                table = env->opcodes;
+                handler = env->opcodes[opc1];
+                table = ind_table(handler);
+                handler = table[opc2];
+                if (is_indirect_opcode(handler)) {
+                    table = ind_table(handler);
+                    /* opc3 is 5 bits long */
+                    for (opc3 = 0; opc3 < PPC_CPU_INDIRECT_OPCODES_LEN;
+                            opc3++) {
+                        handler = table[opc3];
+                        if (is_indirect_opcode(handler)) {
+                            table = ind_table(handler);
+                            /* opc4 is 5 bits long */
+                            for (opc4 = 0; opc4 < PPC_CPU_INDIRECT_OPCODES_LEN;
+                                 opc4++) {
+                                handler = table[opc4];
+                                if (handler->handler != &gen_invalid) {
+                                    printf("INSN: %02x %02x %02x %02x -- "
+                                           "(%02d %04d %02d) : %s\n",
+                                           opc1, opc2, opc3, opc4,
+                                           opc1, (opc3 << 5) | opc2, opc4,
+                                           handler->oname);
+                                }
+                            }
+                        } else {
+                            if (handler->handler != &gen_invalid) {
+                                /* Special hack to properly dump SPE insns */
+                                p = strchr(handler->oname, '_');
+                                if (p == NULL) {
+                                    printf("INSN: %02x %02x %02x (%02d %04d) : "
+                                           "%s\n",
+                                           opc1, opc2, opc3, opc1,
+                                           (opc3 << 5) | opc2,
+                                           handler->oname);
+                                } else {
+                                    q = "speundef";
+                                    if ((p - handler->oname) != strlen(q)
+                                        || (memcmp(handler->oname, q, strlen(q))
+                                            != 0)) {
+                                        /* First instruction */
+                                        printf("INSN: %02x %02x %02x"
+                                               "(%02d %04d) : %.*s\n",
+                                               opc1, opc2 << 1, opc3, opc1,
+                                               (opc3 << 6) | (opc2 << 1),
+                                               (int)(p - handler->oname),
+                                               handler->oname);
+                                    }
+                                    if (strcmp(p + 1, q) != 0) {
+                                        /* Second instruction */
+                                        printf("INSN: %02x %02x %02x "
+                                               "(%02d %04d) : %s\n", opc1,
+                                               (opc2 << 1) | 1, opc3, opc1,
+                                               (opc3 << 6) | (opc2 << 1) | 1,
+                                               p + 1);
+                                    }
+                                }
+                            }
+                        }
+                    }
+                } else {
+                    if (handler->handler != &gen_invalid) {
+                        printf("INSN: %02x %02x -- (%02d %04d) : %s\n",
+                               opc1, opc2, opc1, opc2, handler->oname);
+                    }
+                }
+            }
+        } else {
+            if (handler->handler != &gen_invalid) {
+                printf("INSN: %02x -- -- (%02d ----) : %s\n",
+                       opc1, opc1, handler->oname);
+            }
+        }
+    }
+}
+#endif
+int ppc_fixup_cpu(PowerPCCPU *cpu)
+{
+    CPUPPCState *env = &cpu->env;
+
+    /*
+     * TCG doesn't (yet) emulate some groups of instructions that are
+     * implemented on some otherwise supported CPUs (e.g. VSX and
+     * decimal floating point instructions on POWER7).  We remove
+     * unsupported instruction groups from the cpu state's instruction
+     * masks and hope the guest can cope.  For at least the pseries
+     * machine, the unavailability of these instructions can be
+     * advertised to the guest via the device tree.
+     */
+    if ((env->insns_flags & ~PPC_TCG_INSNS)
+        || (env->insns_flags2 & ~PPC_TCG_INSNS2)) {
+        warn_report("Disabling some instructions which are not "
+                    "emulated by TCG (0x%" PRIx64 ", 0x%" PRIx64 ")",
+                    env->insns_flags & ~PPC_TCG_INSNS,
+                    env->insns_flags2 & ~PPC_TCG_INSNS2);
+    }
+    env->insns_flags &= PPC_TCG_INSNS;
+    env->insns_flags2 &= PPC_TCG_INSNS2;
+    return 0;
+}
+
+
 void ppc_cpu_dump_statistics(CPUState *cs, int flags)
 {
 #if defined(DO_PPC_STATISTICS)
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 80fef0b90d..6235eb7536 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -42,7 +42,6 @@
 #include "fpu/softfloat.h"
 #include "qapi/qapi-commands-machine-target.h"
 
-/* #define PPC_DUMP_CPU */
 /* #define PPC_DEBUG_SPR */
 /* #define PPC_DUMP_SPR_ACCESSES */
 /* #define USE_APPLE_GDB */
@@ -9560,366 +9559,6 @@ static void dump_ppc_sprs(CPUPPCState *env)
 }
 #endif
 
-/*****************************************************************************/
-
-/* Opcode types */
-enum {
-    PPC_DIRECT   = 0, /* Opcode routine        */
-    PPC_INDIRECT = 1, /* Indirect opcode table */
-};
-
-#define PPC_OPCODE_MASK 0x3
-
-static inline int is_indirect_opcode(void *handler)
-{
-    return ((uintptr_t)handler & PPC_OPCODE_MASK) == PPC_INDIRECT;
-}
-
-static inline opc_handler_t **ind_table(void *handler)
-{
-    return (opc_handler_t **)((uintptr_t)handler & ~PPC_OPCODE_MASK);
-}
-
-/* Instruction table creation */
-/* Opcodes tables creation */
-static void fill_new_table(opc_handler_t **table, int len)
-{
-    int i;
-
-    for (i = 0; i < len; i++) {
-        table[i] = &invalid_handler;
-    }
-}
-
-static int create_new_table(opc_handler_t **table, unsigned char idx)
-{
-    opc_handler_t **tmp;
-
-    tmp = g_new(opc_handler_t *, PPC_CPU_INDIRECT_OPCODES_LEN);
-    fill_new_table(tmp, PPC_CPU_INDIRECT_OPCODES_LEN);
-    table[idx] = (opc_handler_t *)((uintptr_t)tmp | PPC_INDIRECT);
-
-    return 0;
-}
-
-static int insert_in_table(opc_handler_t **table, unsigned char idx,
-                            opc_handler_t *handler)
-{
-    if (table[idx] != &invalid_handler) {
-        return -1;
-    }
-    table[idx] = handler;
-
-    return 0;
-}
-
-static int register_direct_insn(opc_handler_t **ppc_opcodes,
-                                unsigned char idx, opc_handler_t *handler)
-{
-    if (insert_in_table(ppc_opcodes, idx, handler) < 0) {
-        printf("*** ERROR: opcode %02x already assigned in main "
-               "opcode table\n", idx);
-#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
-        printf("           Registered handler '%s' - new handler '%s'\n",
-               ppc_opcodes[idx]->oname, handler->oname);
-#endif
-        return -1;
-    }
-
-    return 0;
-}
-
-static int register_ind_in_table(opc_handler_t **table,
-                                 unsigned char idx1, unsigned char idx2,
-                                 opc_handler_t *handler)
-{
-    if (table[idx1] == &invalid_handler) {
-        if (create_new_table(table, idx1) < 0) {
-            printf("*** ERROR: unable to create indirect table "
-                   "idx=%02x\n", idx1);
-            return -1;
-        }
-    } else {
-        if (!is_indirect_opcode(table[idx1])) {
-            printf("*** ERROR: idx %02x already assigned to a direct "
-                   "opcode\n", idx1);
-#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
-            printf("           Registered handler '%s' - new handler '%s'\n",
-                   ind_table(table[idx1])[idx2]->oname, handler->oname);
-#endif
-            return -1;
-        }
-    }
-    if (handler != NULL &&
-        insert_in_table(ind_table(table[idx1]), idx2, handler) < 0) {
-        printf("*** ERROR: opcode %02x already assigned in "
-               "opcode table %02x\n", idx2, idx1);
-#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
-        printf("           Registered handler '%s' - new handler '%s'\n",
-               ind_table(table[idx1])[idx2]->oname, handler->oname);
-#endif
-        return -1;
-    }
-
-    return 0;
-}
-
-static int register_ind_insn(opc_handler_t **ppc_opcodes,
-                             unsigned char idx1, unsigned char idx2,
-                             opc_handler_t *handler)
-{
-    return register_ind_in_table(ppc_opcodes, idx1, idx2, handler);
-}
-
-static int register_dblind_insn(opc_handler_t **ppc_opcodes,
-                                unsigned char idx1, unsigned char idx2,
-                                unsigned char idx3, opc_handler_t *handler)
-{
-    if (register_ind_in_table(ppc_opcodes, idx1, idx2, NULL) < 0) {
-        printf("*** ERROR: unable to join indirect table idx "
-               "[%02x-%02x]\n", idx1, idx2);
-        return -1;
-    }
-    if (register_ind_in_table(ind_table(ppc_opcodes[idx1]), idx2, idx3,
-                              handler) < 0) {
-        printf("*** ERROR: unable to insert opcode "
-               "[%02x-%02x-%02x]\n", idx1, idx2, idx3);
-        return -1;
-    }
-
-    return 0;
-}
-
-static int register_trplind_insn(opc_handler_t **ppc_opcodes,
-                                 unsigned char idx1, unsigned char idx2,
-                                 unsigned char idx3, unsigned char idx4,
-                                 opc_handler_t *handler)
-{
-    opc_handler_t **table;
-
-    if (register_ind_in_table(ppc_opcodes, idx1, idx2, NULL) < 0) {
-        printf("*** ERROR: unable to join indirect table idx "
-               "[%02x-%02x]\n", idx1, idx2);
-        return -1;
-    }
-    table = ind_table(ppc_opcodes[idx1]);
-    if (register_ind_in_table(table, idx2, idx3, NULL) < 0) {
-        printf("*** ERROR: unable to join 2nd-level indirect table idx "
-               "[%02x-%02x-%02x]\n", idx1, idx2, idx3);
-        return -1;
-    }
-    table = ind_table(table[idx2]);
-    if (register_ind_in_table(table, idx3, idx4, handler) < 0) {
-        printf("*** ERROR: unable to insert opcode "
-               "[%02x-%02x-%02x-%02x]\n", idx1, idx2, idx3, idx4);
-        return -1;
-    }
-    return 0;
-}
-static int register_insn(opc_handler_t **ppc_opcodes, opcode_t *insn)
-{
-    if (insn->opc2 != 0xFF) {
-        if (insn->opc3 != 0xFF) {
-            if (insn->opc4 != 0xFF) {
-                if (register_trplind_insn(ppc_opcodes, insn->opc1, insn->opc2,
-                                          insn->opc3, insn->opc4,
-                                          &insn->handler) < 0) {
-                    return -1;
-                }
-            } else {
-                if (register_dblind_insn(ppc_opcodes, insn->opc1, insn->opc2,
-                                         insn->opc3, &insn->handler) < 0) {
-                    return -1;
-                }
-            }
-        } else {
-            if (register_ind_insn(ppc_opcodes, insn->opc1,
-                                  insn->opc2, &insn->handler) < 0) {
-                return -1;
-            }
-        }
-    } else {
-        if (register_direct_insn(ppc_opcodes, insn->opc1, &insn->handler) < 0) {
-            return -1;
-        }
-    }
-
-    return 0;
-}
-
-static int test_opcode_table(opc_handler_t **table, int len)
-{
-    int i, count, tmp;
-
-    for (i = 0, count = 0; i < len; i++) {
-        /* Consistency fixup */
-        if (table[i] == NULL) {
-            table[i] = &invalid_handler;
-        }
-        if (table[i] != &invalid_handler) {
-            if (is_indirect_opcode(table[i])) {
-                tmp = test_opcode_table(ind_table(table[i]),
-                    PPC_CPU_INDIRECT_OPCODES_LEN);
-                if (tmp == 0) {
-                    free(table[i]);
-                    table[i] = &invalid_handler;
-                } else {
-                    count++;
-                }
-            } else {
-                count++;
-            }
-        }
-    }
-
-    return count;
-}
-
-static void fix_opcode_tables(opc_handler_t **ppc_opcodes)
-{
-    if (test_opcode_table(ppc_opcodes, PPC_CPU_OPCODES_LEN) == 0) {
-        printf("*** WARNING: no opcode defined !\n");
-    }
-}
-
-/*****************************************************************************/
-static void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp)
-{
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
-    opcode_t *opc;
-
-    fill_new_table(cpu->opcodes, PPC_CPU_OPCODES_LEN);
-    for (opc = opcodes; opc < &opcodes[ARRAY_SIZE(opcodes)]; opc++) {
-        if (((opc->handler.type & pcc->insns_flags) != 0) ||
-            ((opc->handler.type2 & pcc->insns_flags2) != 0)) {
-            if (register_insn(cpu->opcodes, opc) < 0) {
-                error_setg(errp, "ERROR initializing PowerPC instruction "
-                           "0x%02x 0x%02x 0x%02x", opc->opc1, opc->opc2,
-                           opc->opc3);
-                return;
-            }
-        }
-    }
-    fix_opcode_tables(cpu->opcodes);
-    fflush(stdout);
-    fflush(stderr);
-}
-
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
-static int ppc_fixup_cpu(PowerPCCPU *cpu)
-{
-    CPUPPCState *env = &cpu->env;
-
-    /*
-     * TCG doesn't (yet) emulate some groups of instructions that are
-     * implemented on some otherwise supported CPUs (e.g. VSX and
-     * decimal floating point instructions on POWER7).  We remove
-     * unsupported instruction groups from the cpu state's instruction
-     * masks and hope the guest can cope.  For at least the pseries
-     * machine, the unavailability of these instructions can be
-     * advertised to the guest via the device tree.
-     */
-    if ((env->insns_flags & ~PPC_TCG_INSNS)
-        || (env->insns_flags2 & ~PPC_TCG_INSNS2)) {
-        warn_report("Disabling some instructions which are not "
-                    "emulated by TCG (0x%" PRIx64 ", 0x%" PRIx64 ")",
-                    env->insns_flags & ~PPC_TCG_INSNS,
-                    env->insns_flags2 & ~PPC_TCG_INSNS2);
-    }
-    env->insns_flags &= PPC_TCG_INSNS;
-    env->insns_flags2 &= PPC_TCG_INSNS2;
-    return 0;
-}
-
 static void ppc_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -10131,40 +9770,12 @@ static void ppc_cpu_unrealize(DeviceState *dev)
 {
     PowerPCCPU *cpu = POWERPC_CPU(dev);
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
-    opc_handler_t **table, **table_2;
-    int i, j, k;
 
     pcc->parent_unrealize(dev);
 
     cpu_remove_sync(CPU(cpu));
 
-    for (i = 0; i < PPC_CPU_OPCODES_LEN; i++) {
-        if (cpu->opcodes[i] == &invalid_handler) {
-            continue;
-        }
-        if (is_indirect_opcode(cpu->opcodes[i])) {
-            table = ind_table(cpu->opcodes[i]);
-            for (j = 0; j < PPC_CPU_INDIRECT_OPCODES_LEN; j++) {
-                if (table[j] == &invalid_handler) {
-                    continue;
-                }
-                if (is_indirect_opcode(table[j])) {
-                    table_2 = ind_table(table[j]);
-                    for (k = 0; k < PPC_CPU_INDIRECT_OPCODES_LEN; k++) {
-                        if (table_2[k] != &invalid_handler &&
-                            is_indirect_opcode(table_2[k])) {
-                            g_free((opc_handler_t *)((uintptr_t)table_2[k] &
-                                                     ~PPC_INDIRECT));
-                        }
-                    }
-                    g_free((opc_handler_t *)((uintptr_t)table[j] &
-                                             ~PPC_INDIRECT));
-                }
-            }
-            g_free((opc_handler_t *)((uintptr_t)cpu->opcodes[i] &
-                ~PPC_INDIRECT));
-        }
-    }
+    destroy_ppc_opcodes(cpu);
 }
 
 static gint ppc_cpu_compare_class_pvr(gconstpointer a, gconstpointer b)
-- 
2.17.1


