Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D86B37D3DE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:29:38 +0200 (CEST)
Received: from localhost ([::1]:39192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguY5-0006IV-05
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu2g-0006hE-1U; Wed, 12 May 2021 14:57:10 -0400
Received: from [201.28.113.2] (port=20812 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu2e-0007uU-Id; Wed, 12 May 2021 14:57:09 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:04 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id CA1B480139F;
 Wed, 12 May 2021 15:56:03 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 15/31] target/ppc: Tidy exception vs exit_tb
Date: Wed, 12 May 2021 15:54:25 -0300
Message-Id: <20210512185441.3619828-16-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:04.0172 (UTC)
 FILETIME=[7555F8C0:01D74760]
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

We do not need to emit an exit_tb after an exception,
as the latter will exit via longjmp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index bfda567ac0..9912686496 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4651,8 +4651,9 @@ static void gen_lookup_and_goto_ptr(DisasContext *ctx)
         } else if (sse & (CPU_SINGLE_STEP | CPU_BRANCH_STEP)) {
             uint32_t excp = gen_prep_dbgex(ctx);
             gen_exception(ctx, excp);
+        } else {
+            tcg_gen_exit_tb(NULL, 0);
         }
-        tcg_gen_exit_tb(NULL, 0);
     } else {
         tcg_gen_lookup_and_goto_ptr();
     }
-- 
2.25.1


