Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5967839218E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:37:06 +0200 (CEST)
Received: from localhost ([::1]:34554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0H3-0002FT-ES
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lm02c-0007cS-SF; Wed, 26 May 2021 16:22:10 -0400
Received: from [201.28.113.2] (port=2123 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lm02b-00019i-BG; Wed, 26 May 2021 16:22:10 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 26 May 2021 17:21:07 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 9D29B8013E1;
 Wed, 26 May 2021 17:21:07 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] target/ppc: removed mentions to DO_PPC_STATISTICS
Date: Wed, 26 May 2021 17:21:02 -0300
Message-Id: <20210526202104.127910-4-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 26 May 2021 20:21:07.0775 (UTC)
 FILETIME=[A91A7CF0:01D7526C]
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Removed the commented out definition and all ifdefs relating to
PPC_DUMP_STATISTICS, as it's hardly ever used.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/translate.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index fc9fd790ca..0525e1939f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -47,7 +47,6 @@
 
 /* Include definitions for instructions classes and implementations flags */
 /* #define PPC_DEBUG_DISAS */
-/* #define DO_PPC_STATISTICS */
 
 #ifdef PPC_DEBUG_DISAS
 #  define LOG_DISAS(...) qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__)
@@ -217,12 +216,9 @@ struct opc_handler_t {
     uint64_t type2;
     /* handler */
     void (*handler)(DisasContext *ctx);
-#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
+#if defined(PPC_DUMP_CPU)
     const char *oname;
 #endif
-#if defined(DO_PPC_STATISTICS)
-    uint64_t count;
-#endif
 };
 
 /* SPR load/store helpers */
@@ -8546,7 +8542,7 @@ static int register_direct_insn(opc_handler_t **ppc_opcodes,
     if (insert_in_table(ppc_opcodes, idx, handler) < 0) {
         printf("*** ERROR: opcode %02x already assigned in main "
                "opcode table\n", idx);
-#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
+#if defined(PPC_DUMP_CPU)
         printf("           Registered handler '%s' - new handler '%s'\n",
                ppc_opcodes[idx]->oname, handler->oname);
 #endif
@@ -8570,7 +8566,7 @@ static int register_ind_in_table(opc_handler_t **table,
         if (!is_indirect_opcode(table[idx1])) {
             printf("*** ERROR: idx %02x already assigned to a direct "
                    "opcode\n", idx1);
-#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
+#if defined(PPC_DUMP_CPU)
             printf("           Registered handler '%s' - new handler '%s'\n",
                    ind_table(table[idx1])[idx2]->oname, handler->oname);
 #endif
@@ -8581,7 +8577,7 @@ static int register_ind_in_table(opc_handler_t **table,
         insert_in_table(ind_table(table[idx1]), idx2, handler) < 0) {
         printf("*** ERROR: opcode %02x already assigned in "
                "opcode table %02x\n", idx2, idx1);
-#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
+#if defined(PPC_DUMP_CPU)
         printf("           Registered handler '%s' - new handler '%s'\n",
                ind_table(table[idx1])[idx2]->oname, handler->oname);
 #endif
@@ -9036,10 +9032,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         gen_invalid(ctx);
     }
 
-#if defined(DO_PPC_STATISTICS)
-    handler->count++;
-#endif
-
     translator_loop_temp_check(&ctx->base);
 }
 
-- 
2.17.1


