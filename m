Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934173979B5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:04:59 +0200 (CEST)
Received: from localhost ([::1]:54810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8l8-0004QG-1l
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lo8j6-0003Yq-23; Tue, 01 Jun 2021 14:02:52 -0400
Received: from [201.28.113.2] (port=45669 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lo8j4-0000D7-1t; Tue, 01 Jun 2021 14:02:51 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 1 Jun 2021 15:02:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 5A80580148B;
 Tue,  1 Jun 2021 15:02:44 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: fix single-step exception regression
Date: Tue,  1 Jun 2021 15:02:37 -0300
Message-Id: <20210601180237.296402-1-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Jun 2021 18:02:44.0528 (UTC)
 FILETIME=[52760B00:01D75710]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: richard.henderson@linaro.org, groug@kaod.org,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 6086c75 (target/ppc: Replace POWERPC_EXCP_BRANCH with
DISAS_NORETURN) broke the generation of exceptions when
CPU_SINGLE_STEP or CPU_BRANCH_STEP were set, due to nip always being
reset to the address of the current instruction.
This fix leaves nip untouched when generating the exception.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reported-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index ea200f9637..0dd04696a6 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4646,8 +4646,7 @@ static void gen_lookup_and_goto_ptr(DisasContext *ctx)
         if (sse & GDBSTUB_SINGLE_STEP) {
             gen_debug_exception(ctx);
         } else if (sse & (CPU_SINGLE_STEP | CPU_BRANCH_STEP)) {
-            uint32_t excp = gen_prep_dbgex(ctx);
-            gen_exception(ctx, excp);
+            gen_helper_raise_exception(cpu_env, tcg_constant_i32(gen_prep_dbgex(ctx)));
         } else {
             tcg_gen_exit_tb(NULL, 0);
         }
@@ -9128,7 +9127,11 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         }
         /* else CPU_SINGLE_STEP... */
         if (nip <= 0x100 || nip > 0xf00) {
-            gen_exception(ctx, gen_prep_dbgex(ctx));
+            if (is_jmp == DISAS_EXIT || is_jmp == DISAS_CHAIN) {
+                /* We have not updated nip yet, so do it now */
+                gen_update_nip(ctx, nip);
+            }
+            gen_helper_raise_exception(cpu_env, tcg_constant_i32(gen_prep_dbgex(ctx)));
             return;
         }
     }
-- 
2.25.1


