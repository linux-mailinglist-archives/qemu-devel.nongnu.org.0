Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867D3440350
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:36:52 +0200 (CEST)
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXgJ-0006TS-Jo
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mgXUy-00066Q-AT; Fri, 29 Oct 2021 15:25:08 -0400
Received: from [201.28.113.2] (port=13933 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mgXUw-0008Cv-PZ; Fri, 29 Oct 2021 15:25:08 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 16:24:20 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 0A70C800BA7;
 Fri, 29 Oct 2021 16:24:20 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 03/15] target/ppc: Introduce REQUIRE_FPU
Date: Fri, 29 Oct 2021 16:24:05 -0300
Message-Id: <20211029192417.400707-4-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029192417.400707-1-luis.pires@eldorado.org.br>
References: <20211029192417.400707-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 19:24:20.0367 (UTC)
 FILETIME=[929249F0:01D7CCFA]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 Fernando Valle <fernando.valle@eldorado.org.br>, richard.henderson@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fernando Valle <fernando.valle@eldorado.org.br>

Signed-off-by: Fernando Valle <fernando.valle@eldorado.org.br>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c2fafebd1c..48a484eef6 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7477,6 +7477,14 @@ static int times_4(DisasContext *ctx, int x)
         }                                               \
     } while (0)
 
+#define REQUIRE_FPU(ctx)                                \
+    do {                                                \
+        if (unlikely(!(ctx)->fpu_enabled)) {            \
+            gen_exception((ctx), POWERPC_EXCP_FPU);     \
+            return true;                                \
+        }                                               \
+    } while (0)
+
 /*
  * Helpers for implementing sets of trans_* functions.
  * Defer the implementation of NAME to FUNC, with optional extra arguments.
-- 
2.25.1


