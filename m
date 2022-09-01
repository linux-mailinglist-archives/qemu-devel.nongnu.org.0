Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701EC5A98D9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 15:31:10 +0200 (CEST)
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTkHg-00076H-2Y
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 09:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oTk6h-0007Zb-Sk; Thu, 01 Sep 2022 09:19:43 -0400
Received: from [200.168.210.66] (port=59496 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oTk6g-0002b5-9k; Thu, 01 Sep 2022 09:19:43 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 1 Sep 2022 10:18:16 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 828E88002C5;
 Thu,  1 Sep 2022 10:18:16 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [PATCH 07/19] target/ppc: Zero second doubleword of VSR registers for
 FPR insns
Date: Thu,  1 Sep 2022 10:17:44 -0300
Message-Id: <20220901131756.26060-8-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Sep 2022 13:18:16.0963 (UTC)
 FILETIME=[4C2E0D30:01D8BE05]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FPR register are mapped to the first doubleword of the VSR registers.
Since PowerISA v3.1, the second doubleword of the target register
must be zeroed for FP instructions.

This patch does it by writting 0 to the second dw everytime the
first dw is being written using set_fpr.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/translate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 388337f81b..a0fa419a1f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6443,6 +6443,14 @@ static inline void get_fpr(TCGv_i64 dst, int regno)
 static inline void set_fpr(int regno, TCGv_i64 src)
 {
     tcg_gen_st_i64(src, cpu_env, fpr_offset(regno));
+    /*
+     * Before PowerISA v3.1 the result of doubleword 1 of the VSR
+     * corresponding to the target FPR was undefined. However,
+     * most (if not all) real hardware were setting the result to 0.
+     * Starting at ISA v3.1, the result for doubleword 1 is now defined
+     * to be 0.
+     */
+    tcg_gen_st_i64(tcg_constant_i64(0), cpu_env, vsr64_offset(regno, false));
 }
 
 static inline void get_avr64(TCGv_i64 dst, int regno, bool high)
-- 
2.25.1


