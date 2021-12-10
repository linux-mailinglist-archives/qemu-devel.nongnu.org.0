Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10704703D0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:26:47 +0100 (CET)
Received: from localhost ([::1]:55846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvhnK-0002Tm-W4
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:26:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1mvgvm-0003sx-MC; Fri, 10 Dec 2021 09:31:26 -0500
Received: from [201.28.113.2] (port=64946 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1mvgvk-0001mA-9m; Fri, 10 Dec 2021 09:31:26 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 10 Dec 2021 11:13:53 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6D83F800EC2;
 Fri, 10 Dec 2021 11:13:53 -0300 (-03)
From: Victor Colombo <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 3/4] target/ppc: fix xscvqpdp register access
Date: Fri, 10 Dec 2021 11:13:46 -0300
Message-Id: <20211210141347.38603-4-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210141347.38603-1-victor.colombo@eldorado.org.br>
References: <20211210141347.38603-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Dec 2021 14:13:53.0739 (UTC)
 FILETIME=[2995E9B0:01D7EDD0]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Dec 2021 10:20:17 -0500
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
Cc: groug@kaod.org, danielhb413@gmail.com, matheus.ferst@eldorado.org.br,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

This instruction has VRT and VRB fields instead of T/TX and B/BX.

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


