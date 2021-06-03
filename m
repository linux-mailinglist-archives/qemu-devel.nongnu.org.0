Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598C5399C98
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:30:13 +0200 (CEST)
Received: from localhost ([::1]:38728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loik0-0006id-EH
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid4-0006Ut-A3; Thu, 03 Jun 2021 04:23:02 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42595 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid2-00006L-5t; Thu, 03 Jun 2021 04:23:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5m0qqhz9sj1; Thu,  3 Jun 2021 18:22:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708556;
 bh=uFqM6+kztxtnCKgW0x7sUJWlL/TgvWROgw3xHW39HYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FqhM9Zg30BvCfJ7bZHljVmEu6BPdhW2vm1/HY1YcdfLX4kWfPmUf1WZvzTQqWVx80
 CV6DaOG2tEhw6hU48p4VCTpqDFIbRi93Uq8/8cdoiWP0uEjKKx3VQgNArPh6Re25vh
 3S8NKEM3QGCzgiqE2pR+Y1q0idjXmPmqXUAbEgQ4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 14/42] target/ppc: created tcg-stub.c file
Date: Thu,  3 Jun 2021 18:22:03 +1000
Message-Id: <20210603082231.601214-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Created a file with stubs needed to compile disabling TCG. *_ppc_opcodes
were created to make cpu_init.c have a few less ifdefs, since they are
not needed. softmmu_resize_hpt_* have to be created because the compiler
can't automatically know they aren't used, but they should never be
reached.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210525115355.8254-4-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/meson.build |  4 ++++
 target/ppc/tcg-stub.c  | 45 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
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
index 0000000000..aadcf59d26
--- /dev/null
+++ b/target/ppc/tcg-stub.c
@@ -0,0 +1,45 @@
+/*
+ *  PowerPC CPU initialization for qemu.
+ *
+ *  Copyright (C) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internal.h"
+#include "hw/ppc/spapr.h"
+
+void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp)
+{
+}
+
+void destroy_ppc_opcodes(PowerPCCPU *cpu)
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
+target_ulong softmmu_resize_hpt_commit(PowerPCCPU *cpu,
+                                       SpaprMachineState *spapr,
+                                       target_ulong flags,
+                                       target_ulong shift)
+{
+    g_assert_not_reached();
+}
-- 
2.31.1


