Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA804386BD0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 22:58:59 +0200 (CEST)
Received: from localhost ([::1]:35934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1likKI-0001ck-Mp
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 16:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likEu-0005S8-R4; Mon, 17 May 2021 16:53:24 -0400
Received: from [201.28.113.2] (port=46491 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likEt-0001mN-0I; Mon, 17 May 2021 16:53:24 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 17 May 2021 17:50:32 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id C902680139F;
 Mon, 17 May 2021 17:50:31 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 10/23] target/ppc: Move page crossing check to
 ppc_tr_translate_insn
Date: Mon, 17 May 2021 17:50:12 -0300
Message-Id: <20210517205025.3777947-11-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2021 20:50:32.0300 (UTC)
 FILETIME=[471FE2C0:01D74B5E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

With prefixed instructions, the number of instructions
remaining until the page crossing is no longer constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index dc0f5fafc2..b1873d2dcc 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -9060,9 +9060,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     if (ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP)) {
         ctx->base.max_insns = 1;
-    } else {
-        int bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
-        ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
     }
 }
 
@@ -9117,6 +9114,11 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     handler->count++;
 #endif
 
+    /* End the TB when crossing a page boundary. */
+    if (ctx->base.is_jmp == DISAS_NEXT && !(pc & ~TARGET_PAGE_MASK)) {
+        ctx->base.is_jmp = DISAS_TOO_MANY;
+    }
+
     translator_loop_temp_check(&ctx->base);
 }
 
-- 
2.25.1


