Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B8E482C12
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jan 2022 17:26:10 +0100 (CET)
Received: from localhost ([::1]:34358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n43gO-0004Tx-SF
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 11:26:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n43PK-0006we-Iv
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 11:08:30 -0500
Received: from david.siemens.de ([192.35.17.14]:35033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n43PI-0004Dg-S4
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 11:08:30 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 202G8QDw006137
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 2 Jan 2022 17:08:27 +0100
Received: from fedora.vmnet8.md1wgtfc ([144.145.220.57])
 by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 202G82UU030977;
 Sun, 2 Jan 2022 17:08:26 +0100
From: Konrad Schwarz <konrad.schwarz@siemens.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/5] RISC-V: monitor's print register functionality
Date: Sun,  2 Jan 2022 17:06:09 +0100
Message-Id: <21df652bd597a70406cdd59fdf50c5c65b30a572.1641137349.git.konrad.schwarz@siemens.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1641137349.git.konrad.schwarz@siemens.com>
References: <cover.1641137349.git.konrad.schwarz@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.35.17.14;
 envelope-from=konrad.schwarz@siemens.com; helo=david.siemens.de
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 02 Jan 2022 11:21:56 -0500
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
Cc: Konrad Schwarz <konrad.schwarz@siemens.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable the print (p) command to display both
general-purpose and Contral and Status (CSR) registers.

General purpose registers can be named using the xN form
or their ABI names (zero, ra, sp, a0, s1, t2).

Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
---
 target/riscv/monitor.c | 69 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 7efb4b62c1..3f74ea9934 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -2,6 +2,7 @@
  * QEMU monitor for RISC-V
  *
  * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
+ * Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com
  *
  * RISC-V specific monitor commands implementation
  *
@@ -234,3 +235,71 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
 
     mem_info_svxx(mon, env);
 }
+
+static const MonitorDef monitor_defs[] = {
+# define MONITORDEF_RISCV_GPR(NO, ALIAS)\
+    { "x" #NO #ALIAS, offsetof(CPURISCVState, gpr[NO]) },
+
+    MONITORDEF_RISCV_GPR(0, |zero)
+    MONITORDEF_RISCV_GPR(1, |ra)
+    MONITORDEF_RISCV_GPR(2, |sp)
+    MONITORDEF_RISCV_GPR(3, |gp)
+    MONITORDEF_RISCV_GPR(4, |tp)
+    MONITORDEF_RISCV_GPR(5, |t0)
+    MONITORDEF_RISCV_GPR(6, |t1)
+    MONITORDEF_RISCV_GPR(7, |t2)
+    MONITORDEF_RISCV_GPR(8, |s0|fp)
+    MONITORDEF_RISCV_GPR(9, |s1)
+    MONITORDEF_RISCV_GPR(10, |a0)
+    MONITORDEF_RISCV_GPR(11, |a1)
+    MONITORDEF_RISCV_GPR(12, |a2)
+    MONITORDEF_RISCV_GPR(13, |a3)
+    MONITORDEF_RISCV_GPR(14, |a4)
+    MONITORDEF_RISCV_GPR(15, |a5)
+    MONITORDEF_RISCV_GPR(16, |a6)
+    MONITORDEF_RISCV_GPR(17, |a7)
+    MONITORDEF_RISCV_GPR(18, |s2)
+    MONITORDEF_RISCV_GPR(19, |s3)
+    MONITORDEF_RISCV_GPR(20, |s4)
+    MONITORDEF_RISCV_GPR(21, |s5)
+    MONITORDEF_RISCV_GPR(22, |s6)
+    MONITORDEF_RISCV_GPR(23, |s7)
+    MONITORDEF_RISCV_GPR(24, |s8)
+    MONITORDEF_RISCV_GPR(25, |s9)
+    MONITORDEF_RISCV_GPR(26, |s10)
+    MONITORDEF_RISCV_GPR(27, |s11)
+    MONITORDEF_RISCV_GPR(28, |t3)
+    MONITORDEF_RISCV_GPR(29, |t4)
+    MONITORDEF_RISCV_GPR(30, |t5)
+    MONITORDEF_RISCV_GPR(31, |t6)
+
+    { },
+};
+
+const MonitorDef *target_monitor_defs(void)
+{
+    return monitor_defs;
+}
+
+int target_get_monitor_def(CPUState *cs, const char *name, uint64_t *pval)
+{
+
+    target_ulong ret_value;
+    CPURISCVState *const env = &RISCV_CPU (cs)->env;
+    riscv_csr_operations *op;
+    for (op = csr_ops; 1[&csr_ops] > op; ++op) {
+        if (!op->name) {
+            continue;
+        }
+        if (!strcmp(name, op->name)) {
+            if (RISCV_EXCP_NONE != riscv_csrrw_debug(env, op - csr_ops,
+                                 &ret_value,
+                                 0 /* new_value */,
+                                 0 /* write_mask */))
+                return -1;
+            *pval = ret_value;
+            return 0;
+        }
+    }
+    return -1;
+}
-- 
Konrad Schwarz


