Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C1350C032
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:14:55 +0200 (CEST)
Received: from localhost ([::1]:40226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhyk2-0001rz-5C
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyR8-0002Sf-9Y; Fri, 22 Apr 2022 14:55:22 -0400
Received: from [187.72.171.209] (port=52505 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyR6-0000CU-UP; Fri, 22 Apr 2022 14:55:22 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 22 Apr 2022 15:54:54 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 478D5800902;
 Fri, 22 Apr 2022 15:54:54 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 06/20] target/ppc: Substitute msr_ile macro with new M_MSR_ILE
 macro
Date: Fri, 22 Apr 2022 15:54:36 -0300
Message-Id: <20220422185450.107256-7-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Apr 2022 18:54:54.0499 (UTC)
 FILETIME=[74527730:01D8567A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 victor.colombo@eldorado.org.br, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e81f1f2d68..95c28c3c1b 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -353,6 +353,7 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+#define M_MSR_ILE (1ull << MSR_ILE)
 #define M_MSR_PR (1ull << MSR_PR)
 #define M_MSR_DS (1ull << MSR_DS)
 #define M_MSR_LE (1ull << MSR_LE)
@@ -476,7 +477,6 @@ typedef enum {
 #define msr_gs   ((env->msr >> MSR_GS)   & 1)
 #define msr_pow  ((env->msr >> MSR_POW)  & 1)
 #define msr_ce   ((env->msr >> MSR_CE)   & 1)
-#define msr_ile  ((env->msr >> MSR_ILE)  & 1)
 #define msr_ee   ((env->msr >> MSR_EE)   & 1)
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_me   ((env->msr >> MSR_ME)   & 1)
@@ -2677,7 +2677,7 @@ static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu, bool hv)
     } else if (pcc->lpcr_mask & LPCR_ILE) {
         ile = !!(env->spr[SPR_LPCR] & LPCR_ILE);
     } else {
-        ile = !!(msr_ile);
+        ile = !!(env->msr & M_MSR_ILE);
     }
 
     return ile;
-- 
2.25.1


