Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56A337BFC5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:20:48 +0200 (CEST)
Received: from localhost ([::1]:58244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgpjD-0000C3-Q6
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpZJ-0006Lz-T6; Wed, 12 May 2021 10:10:34 -0400
Received: from [201.28.113.2] (port=32758 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpZI-0000Pm-EB; Wed, 12 May 2021 10:10:33 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 11:08:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 79F678013D0;
 Wed, 12 May 2021 11:08:39 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/11] target/ppc: created tcg-stub.c file
Date: Wed, 12 May 2021 11:08:12 -0300
Message-Id: <20210512140813.112884-11-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 12 May 2021 14:08:39.0649 (UTC)
 FILETIME=[4ECC9510:01D74738]
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
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Created a file with stubs needed to compile disabling TCG.

We're not sure about keeping the softmmu stubs in this file. if there is
a better place to put them, please let us know.

The other 3 functions have been stubbed because we didn't know what to
do with them. Making the file compile in the !TCG case would create an
ifdef hell, but extracting the functions meant moving many others as
well, and there weren't any good places to put them.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/tcg-stub.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 target/ppc/tcg-stub.c

diff --git a/target/ppc/tcg-stub.c b/target/ppc/tcg-stub.c
new file mode 100644
index 0000000000..67099e2676
--- /dev/null
+++ b/target/ppc/tcg-stub.c
@@ -0,0 +1,33 @@
+
+#include "qemu/osdep.h"
+#include "exec/hwaddr.h"
+#include "cpu.h"
+#include "hw/ppc/spapr.h"
+
+hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+{
+    return 0;
+}
+
+void dump_mmu(CPUPPCState *env)
+{
+}
+
+void ppc_tlb_invalidate_all(CPUPPCState *env)
+{
+}
+
+target_ulong softmmu_resize_hpt_prepare(PowerPCCPU *cpu,
+                                        SpaprMachineState *spapr,
+                                        target_ulong shift)
+{
+    g_assert_not_reached();
+}
+
+target_ulong softmmu_resize_hpt_commit(PowerPCCPU* cpu,
+                                       SpaprMachineState *spapr,
+                                       target_ulong flags,
+                                       target_ulong shift)
+{
+    g_assert_not_reached();
+}
-- 
2.17.1


