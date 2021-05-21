Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0D38CF16
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 22:30:44 +0200 (CEST)
Received: from localhost ([::1]:37526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkBn8-0005zx-5U
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 16:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lkBcg-0007ZE-0f; Fri, 21 May 2021 16:19:54 -0400
Received: from [201.28.113.2] (port=30260 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lkBce-0001dV-J9; Fri, 21 May 2021 16:19:53 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 21 May 2021 17:18:19 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id BCD7A80141F;
 Fri, 21 May 2021 17:18:19 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/9] target/ppc: created tcg-stub.c file
Date: Fri, 21 May 2021 17:17:58 -0300
Message-Id: <20210521201759.85475-9-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 21 May 2021 20:18:19.0901 (UTC)
 FILETIME=[70FA32D0:01D74E7E]
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
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Created a file with stubs needed to compile disabling TCG. *_ppc_opcodes
were created to make cpu_init.c have a few less ifdefs, since they are
not needed. coftmmu_resize_hpt_* have to be created because the compiler
can't automatically know they aren't used, but they should never be
reached.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/meson.build |  4 ++++
 target/ppc/tcg-stub.c  | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 target/ppc/tcg-stub.c

diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index d1aa7d5d39..848e625302 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -28,6 +28,10 @@ ppc_softmmu_ss.add(files(
   'mmu_helper.c',
   'monitor.c',
 ))
+ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_false: files(
+  'tcg-stub.c'
+))
+
 ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
   'compat.c',
   'mmu-book3s-v3.c',
diff --git a/target/ppc/tcg-stub.c b/target/ppc/tcg-stub.c
new file mode 100644
index 0000000000..6d99834274
--- /dev/null
+++ b/target/ppc/tcg-stub.c
@@ -0,0 +1,25 @@
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internal.h"
+#include "hw/ppc/spapr.h"
+
+void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp)
+{}
+
+void destroy_ppc_opcodes(PowerPCCPU *cpu)
+{}
+
+target_ulong softmmu_resize_hpt_prepare(PowerPCCPU *cpu,
+                                        SpaprMachineState *spapr,
+                                        target_ulong shift)
+{
+    g_assert_not_reached();
+}
+
+target_ulong softmmu_resize_hpt_commit(PowerPCCPU *cpu,
+                                       SpaprMachineState *spapr,
+                                       target_ulong flags,
+                                       target_ulong shift)
+{
+    g_assert_not_reached();
+}
-- 
2.17.1


