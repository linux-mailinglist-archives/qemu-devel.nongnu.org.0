Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5FB3A6EDA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:22:51 +0200 (CEST)
Received: from localhost ([::1]:53918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssAc-0000JQ-Uo
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lss4w-0001xW-QG; Mon, 14 Jun 2021 15:16:58 -0400
Received: from [201.28.113.2] (port=35932 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lss4v-0003Sz-BH; Mon, 14 Jun 2021 15:16:58 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 14 Jun 2021 16:16:52 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 67C82800D1A;
 Mon, 14 Jun 2021 16:16:52 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/2] target/ppc: make gdb able to translate priviledged
 addresses
Date: Mon, 14 Jun 2021 16:16:30 -0300
Message-Id: <20210614191630.101304-2-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 14 Jun 2021 19:16:52.0586 (UTC)
 FILETIME=[D51494A0:01D76151]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.42,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This patch changes ppc_cpu_get_phys_page_debug so that it is now
able to translate both, priviledged and real mode addresses
independently of whether the CPU executing it has those permissions

This was mentioned by Fabiano as something that would be very useful to
help with debugging, but could possibly constitute a security issue if
that debug function can be called in some way by prodution code. the
solution was implemented such that it would be trivial to wrap it around
ifdefs for building only with --enable-debug, for instance, but we are
not sure this is the best approach, hence why it is an RFC.

Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/mmu_helper.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 9dcdf88597..41c727c690 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2947,6 +2947,29 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
                   cpu_mmu_index(&cpu->env, true), false)) {
         return raddr & TARGET_PAGE_MASK;
     }
+
+    /*
+     * This is a fallback, in case we're asking for priviledged memory to
+     * be printed, but the PCU is not executing in a priviledged manner.
+     *
+     * The code could be considered a security vulnerability if
+     * this function can be called in a scenario that does not involve
+     * debugging.
+     * Given the name and how useful using real addresses may be for
+     * actually debugging, however, we decided to include it anyway and
+     * discuss how to best avoid the possible security concerns.
+     * The current plan is that, if there is a chance this code is called in
+     * a production environment, we can surround it with ifdefs so that it
+     * is only compiled with --enable-debug
+     */
+        /* attempt to translate first with virtual addresses */
+    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 1, false) ||
+        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 1, false) ||
+        /* if didn't work, attempt to translate with real addresses */
+        ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 3, false) ||
+        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 3, false)) {
+        return raddr & TARGET_PAGE_MASK;
+    }
     return -1;
 }
 
-- 
2.17.1


