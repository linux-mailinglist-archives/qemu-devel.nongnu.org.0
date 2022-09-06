Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B345AEB72
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:25:50 +0200 (CEST)
Received: from localhost ([::1]:55136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZWO-0007BR-NF
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVY8P-0001fx-8b; Tue, 06 Sep 2022 08:56:58 -0400
Received: from [200.168.210.66] (port=14617 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVY8N-0002Pq-6s; Tue, 06 Sep 2022 08:56:56 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 6 Sep 2022 09:55:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 795C38002BE;
 Tue,  6 Sep 2022 09:55:36 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [PATCH v2 3/8] target/ppc: Zero second doubleword in DFP instructions
Date: Tue,  6 Sep 2022 09:55:18 -0300
Message-Id: <20220906125523.38765-4-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906125523.38765-1-victor.colombo@eldorado.org.br>
References: <20220906125523.38765-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Sep 2022 12:55:36.0976 (UTC)
 FILETIME=[F5A14100:01D8C1EF]
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

Starting at PowerISA v3.1, the second doubleword of the registers
used to store results in DFP instructions are supposed to be zeroed.

From the ISA, chapter 7.2.1.1 Floating-Point Registers:
"""
Chapter 4. Floating-Point Facility provides 32 64-bit
FPRs. Chapter 5. Decimal Floating-Point also employs
FPRs in decimal floating-point (DFP) operations. When
VSX is implemented, the 32 FPRs are mapped to
doubleword 0 of VSRs 0-31. (...)
All instructions that operate on an FPR are redefined
to operate on doubleword element 0 of the
corresponding VSR. (...)
and the contents of doubleword element 1 of the
VSR corresponding to the target FPR or FPR pair for these
instructions are set to 0.
"""

Before, the result stored at doubleword 1 was said to be undefined.

With that, this patch changes the DFP facility to zero doubleword 1
when using set_dfp64 and set_dfp128. This fixes the behavior for ISA
3.1 while keeping the behavior correct for previous ones.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/dfp_helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 5ba74b2124..be7aa5357a 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -42,13 +42,16 @@ static void get_dfp128(ppc_vsr_t *dst, ppc_fprp_t *dfp)
 
 static void set_dfp64(ppc_fprp_t *dfp, ppc_vsr_t *src)
 {
-    dfp->VsrD(0) = src->VsrD(1);
+    dfp[0].VsrD(0) = src->VsrD(1);
+    dfp[0].VsrD(1) = 0ULL;
 }
 
 static void set_dfp128(ppc_fprp_t *dfp, ppc_vsr_t *src)
 {
     dfp[0].VsrD(0) = src->VsrD(0);
     dfp[1].VsrD(0) = src->VsrD(1);
+    dfp[0].VsrD(1) = 0ULL;
+    dfp[1].VsrD(1) = 0ULL;
 }
 
 static void set_dfp128_to_avr(ppc_avr_t *dst, ppc_vsr_t *src)
-- 
2.25.1


