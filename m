Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1EC39936C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 21:20:52 +0200 (CEST)
Received: from localhost ([::1]:53436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loWQ7-0002tC-7J
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 15:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1loWO1-0001cY-1O; Wed, 02 Jun 2021 15:18:41 -0400
Received: from [201.28.113.2] (port=47763 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1loWNy-0005w0-M7; Wed, 02 Jun 2021 15:18:40 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 2 Jun 2021 16:18:34 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 211DF80148C;
 Wed,  2 Jun 2021 16:18:34 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] target/ppc: fix address translation bug for hash table
 mmus
Date: Wed,  2 Jun 2021 16:18:22 -0300
Message-Id: <20210602191822.90182-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 02 Jun 2021 19:18:34.0280 (UTC)
 FILETIME=[14BCDA80:01D757E4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210518201146.794854-1-richard.henderson@linaro.org>

This commit attempts to implement a first draft of a solution to the
first bug mentioned by Richard Henderson in this e-mail
https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06247.html
The second bug was not touched, which is basically implementing the
solution C

To sumarize the first bug here, from my understanding, when an address
translation is asked of a 64bit mmu that uses hashtables, the code
attempts to check some permission bits, but checks them from the wrong
location.

The solution implemented here is more complex than necessary on
purpose, to make it more readable (and make sure I understand what is
going on). If that would really fix the problem, I'll move to
implementing an actual solution, and to all affected functions.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/mmu-hash64.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index c1b98a97e9..63f10f1be7 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -887,6 +887,14 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     int exec_prot, pp_prot, amr_prot, prot;
     int need_prot;
     hwaddr raddr;
+    unsigned immu_idx, dmmu_idx;
+    immu_idx = (env->hflags >> HFLAGS_IMMU_IDX) & 7;
+    dmmu_idx = (env->hflags >> HFLAGS_DMMU_IDX) & 7;
+    const short HV = 1, IR = 2, DR = 3;
+    bool MSR[3];
+    MSR[HV] = dmmu_idx & 2,
+    MSR[IR] = immu_idx & 4,
+    MSR[DR] = dmmu_idx & 4;
 
     /*
      * Note on LPCR usage: 970 uses HID4, but our special variant of
@@ -897,7 +905,7 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
      */
 
     /* 1. Handle real mode accesses */
-    if (access_type == MMU_INST_FETCH ? !msr_ir : !msr_dr) {
+    if (access_type == MMU_INST_FETCH ? !MSR[IR] : !MSR[DR]) {
         /*
          * Translation is supposedly "off", but in real mode the top 4
          * effective address bits are (mostly) ignored
@@ -909,7 +917,7 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
              * In virtual hypervisor mode, there's nothing to do:
              *   EA == GPA == qemu guest address
              */
-        } else if (msr_hv || !env->has_hv_mode) {
+        } else if (MSR[HV] || !env->has_hv_mode) {
             /* In HV mode, add HRMOR if top EA bit is clear */
             if (!(eaddr >> 63)) {
                 raddr |= env->spr[SPR_HRMOR];
-- 
2.17.1


