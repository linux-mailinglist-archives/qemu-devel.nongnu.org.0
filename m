Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D5B51B03E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:17:38 +0200 (CEST)
Received: from localhost ([::1]:32836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMNN-0004Vb-9Q
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmMEB-0001eb-OI; Wed, 04 May 2022 17:08:07 -0400
Received: from [187.72.171.209] (port=62190 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmMEA-0007Ne-AT; Wed, 04 May 2022 17:08:07 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 4 May 2022 18:07:48 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 38535800066;
 Wed,  4 May 2022 18:07:48 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br
Subject: [PATCH v4 05/22] target/ppc: Remove msr_ds macro
Date: Wed,  4 May 2022 18:05:24 -0300
Message-Id: <20220504210541.115256-6-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
References: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 May 2022 21:07:48.0618 (UTC)
 FILETIME=[023976A0:01D85FFB]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

msr_ds macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h        | 2 +-
 target/ppc/mmu_common.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c561d664de..5abc612fe0 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -355,6 +355,7 @@ typedef enum {
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
 FIELD(MSR, PR, MSR_PR, 1)
+FIELD(MSR, DS, MSR_DS, 1)
 FIELD(MSR, LE, MSR_LE, 1)
 
 /* PMU bits */
@@ -486,7 +487,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_ep   ((env->msr >> MSR_EP)   & 1)
 #define msr_ir   ((env->msr >> MSR_IR)   & 1)
 #define msr_dr   ((env->msr >> MSR_DR)   & 1)
-#define msr_ds   ((env->msr >> MSR_DS)   & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
 #define DBCR0_ICMP (1 << 27)
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 6ef8b1c00d..7e77b9b84a 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -768,7 +768,7 @@ static bool mmubooke206_get_as(CPUPPCState *env,
         *pr_out = !!(epidr & EPID_EPR);
         return true;
     } else {
-        *as_out = msr_ds;
+        *as_out = FIELD_EX64(env->msr, MSR, DS);
         *pr_out = FIELD_EX64(env->msr, MSR, PR);
         return false;
     }
-- 
2.25.1


