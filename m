Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75014D3A9F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 20:50:28 +0100 (CET)
Received: from localhost ([::1]:48514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS2KJ-00032a-93
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 14:50:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nS2Fm-0001ra-0z; Wed, 09 Mar 2022 14:45:46 -0500
Received: from [187.72.171.209] (port=57926 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nS2Fg-0001KP-CF; Wed, 09 Mar 2022 14:45:43 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 9 Mar 2022 16:28:24 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id CE28E8002D2;
 Wed,  9 Mar 2022 16:28:23 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH] target/ppc: fix ISI fault cause for Radix MMU
Date: Wed,  9 Mar 2022 16:27:56 -0300
Message-Id: <20220309192756.145283-1-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 09 Mar 2022 19:28:24.0246 (UTC)
 FILETIME=[D80C8560:01D833EB]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: groug@kaod.org, danielhb413@gmail.com,
 Leandro Lupori <leandro.lupori@eldorado.org.br>, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix Instruction Storage Interrupt (ISI) fault cause for Radix MMU,
when caused by missing PAGE_EXEC permission, to be
SRR1_NOEXEC_GUARD instead of DSISR_PROTFAULT.
This matches POWER9 hardware behavior.

Fixes: d5fee0bbe68 ("target/ppc: Implement ISA V3.00 radix page fault handler")
Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 target/ppc/mmu-radix64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 67c38f065b..5414fd63c1 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -204,7 +204,8 @@ static bool ppc_radix64_check_prot(PowerPCCPU *cpu, MMUAccessType access_type,
     /* Check if requested access type is allowed */
     need_prot = prot_for_access_type(access_type);
     if (need_prot & ~*prot) { /* Page Protected for that Access */
-        *fault_cause |= DSISR_PROTFAULT;
+        *fault_cause |= access_type == MMU_INST_FETCH ? SRR1_NOEXEC_GUARD :
+                                                        DSISR_PROTFAULT;
         return true;
     }
 
-- 
2.25.1


