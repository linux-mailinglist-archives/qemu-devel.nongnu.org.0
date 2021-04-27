Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBC336CAAF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:56:50 +0200 (CEST)
Received: from localhost ([::1]:33820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRx3-0007sG-TY
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbROO-0003a2-EI; Tue, 27 Apr 2021 13:21:00 -0400
Received: from [201.28.113.2] (port=30160 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbROM-0003hI-VJ; Tue, 27 Apr 2021 13:21:00 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 27 Apr 2021 14:16:54 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id AAB148013BA;
 Tue, 27 Apr 2021 14:16:54 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 15/15] target/ppc: Check cpu flags for prefixed insn support
Date: Tue, 27 Apr 2021 14:16:49 -0300
Message-Id: <20210427171649.364699-16-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427171649.364699-1-luis.pires@eldorado.org.br>
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Apr 2021 17:16:54.0876 (UTC)
 FILETIME=[1F1531C0:01D73B89]
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org,
 Luis Pires <luis.pires@eldorado.org.br>, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prefixed instructions were introduced in Power ISA 3.1

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 target/ppc/translate.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 7422ea4e13..f4802a4f08 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7837,7 +7837,11 @@ static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
 
 static bool is_prefix_insn(DisasContext *ctx, uint32_t insn)
 {
-    /* TODO: Check ctx->insns_flags* for whether prefixes are supported. */
+    if (!(ctx->insns_flags2 & PPC2_ISA310)) {
+        /* Prefixed instructions are not supported */
+        return false;
+    }
+
     return opc1(insn) == 1;
 }
 
-- 
2.25.1


