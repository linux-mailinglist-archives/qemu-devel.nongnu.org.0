Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37641472C22
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 13:15:43 +0100 (CET)
Received: from localhost ([::1]:48748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwkF4-00016n-9A
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 07:15:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1mwkAa-00076p-Gl; Mon, 13 Dec 2021 07:11:05 -0500
Received: from [201.28.113.2] (port=36754 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1mwkAZ-0008FP-7A; Mon, 13 Dec 2021 07:11:04 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 13 Dec 2021 09:10:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 8FCCC800A5A;
 Mon, 13 Dec 2021 09:10:43 -0300 (-03)
From: Victor Colombo <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 3/4] target/ppc: fix xscvqpdp register access
Date: Mon, 13 Dec 2021 09:09:57 -0300
Message-Id: <20211213120958.24443-4-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213120958.24443-1-victor.colombo@eldorado.org.br>
References: <20211213120958.24443-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Dec 2021 12:10:43.0954 (UTC)
 FILETIME=[742B7520:01D7F01A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 victor.colombo@eldorado.org.br, clg@kaod.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

This instruction has VRT and VRB fields instead of T/TX and B/BX.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate/vsx-impl.c.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index e2447750dd..ab5cb21f13 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -913,8 +913,9 @@ static void gen_xscvqpdp(DisasContext *ctx)
         return;
     }
     opc = tcg_const_i32(ctx->opcode);
-    xt = gen_vsr_ptr(xT(ctx->opcode));
-    xb = gen_vsr_ptr(xB(ctx->opcode));
+
+    xt = gen_vsr_ptr(rD(ctx->opcode) + 32);
+    xb = gen_vsr_ptr(rB(ctx->opcode) + 32);
     gen_helper_xscvqpdp(cpu_env, opc, xt, xb);
     tcg_temp_free_i32(opc);
     tcg_temp_free_ptr(xt);
-- 
2.25.1


