Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A355F399D3F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:55:21 +0200 (CEST)
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loj8K-0008VC-OX
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loieB-00009Q-Ia; Thu, 03 Jun 2021 04:24:11 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53203 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loie9-0000jJ-RS; Thu, 03 Jun 2021 04:24:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5s72zvz9t5m; Thu,  3 Jun 2021 18:22:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708561;
 bh=7vWR8zZvrNOrqImaR0WsJsiIz7OipXljRRHJ26P6Et4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YXYqQSa3eWC7vrWK1JurUyjPlgoKmH8AtJKgpN1oK42WTS4dxMbs0tjvfjHtBlyQH
 LxRmSaVlXpnYOkGP9HAxAdUg9uPyHz80PDWDB/N8rk/2zqq9ThbFrtNpwb4uIMl4MC
 /3Fcxcy9Dl0Bs4wwRPl1JRO9QY4PrMcT5SiOtGj4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 42/42] target/ppc: fix single-step exception regression
Date: Thu,  3 Jun 2021 18:22:31 +1000
Message-Id: <20210603082231.601214-43-david@gibson.dropbear.id.au>
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
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Commit 6086c75 (target/ppc: Replace POWERPC_EXCP_BRANCH with
DISAS_NORETURN) broke the generation of exceptions when
CPU_SINGLE_STEP or CPU_BRANCH_STEP were set, due to nip always being
reset to the address of the current instruction.
This fix leaves nip untouched when generating the exception.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reported-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210602125103.332793-1-luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 95e4d9b815..f65d1e81ea 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4320,8 +4320,7 @@ static void gen_lookup_and_goto_ptr(DisasContext *ctx)
         if (sse & GDBSTUB_SINGLE_STEP) {
             gen_debug_exception(ctx);
         } else if (sse & (CPU_SINGLE_STEP | CPU_BRANCH_STEP)) {
-            uint32_t excp = gen_prep_dbgex(ctx);
-            gen_exception(ctx, excp);
+            gen_helper_raise_exception(cpu_env, tcg_constant_i32(gen_prep_dbgex(ctx)));
         } else {
             tcg_gen_exit_tb(NULL, 0);
         }
@@ -8672,7 +8671,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         }
         /* else CPU_SINGLE_STEP... */
         if (nip <= 0x100 || nip > 0xf00) {
-            gen_exception(ctx, gen_prep_dbgex(ctx));
+            gen_helper_raise_exception(cpu_env, tcg_constant_i32(gen_prep_dbgex(ctx)));
             return;
         }
     }
-- 
2.31.1


