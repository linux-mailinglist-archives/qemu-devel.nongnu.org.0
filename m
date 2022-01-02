Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149F3482C13
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jan 2022 17:26:10 +0100 (CET)
Received: from localhost ([::1]:34316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n43gP-0004SQ-2E
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 11:26:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n43PM-0006z1-2p
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 11:08:32 -0500
Received: from goliath.siemens.de ([192.35.17.28]:42543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n43PJ-0004Di-Rm
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 11:08:31 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 202G8Qwu028211
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 2 Jan 2022 17:08:26 +0100
Received: from fedora.vmnet8.md1wgtfc ([144.145.220.57])
 by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 202G82UT030977;
 Sun, 2 Jan 2022 17:08:26 +0100
From: Konrad Schwarz <konrad.schwarz@siemens.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/5] RISC-V: larger and more consistent register set for
 'info registers'
Date: Sun,  2 Jan 2022 17:06:08 +0100
Message-Id: <85d02ac883c7cf40fbd54e8747783937e0370eaa.1641137349.git.konrad.schwarz@siemens.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1641137349.git.konrad.schwarz@siemens.com>
References: <cover.1641137349.git.konrad.schwarz@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.35.17.28;
 envelope-from=konrad.schwarz@siemens.com; helo=goliath.siemens.de
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=unavailable autolearn_force=no
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

Display more CSRs in the 'info registers' command
and group them according to function.

The number of CSRs in RISC-V is so large to make it impractical
for all CSRs to be displayed by 'info registers'.
The code uses conditional compilation directives around register
groups; advanced users can enable/disable register
groups as required.

Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
---
 target/riscv/cpu.c | 327 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 303 insertions(+), 24 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f812998123..eb9518fc16 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -3,6 +3,7 @@
  *
  * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
  * Copyright (c) 2017-2018 SiFive, Inc.
+ * Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -244,40 +245,318 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #ifndef CONFIG_USER_ONLY
     {
         static const int dump_csrs[] = {
+
+#  if 0
+            CSR_USTATUS,
+            CSR_UIE,
+            CSR_UTVEC,
+
+/* User Trap Handling */
+            CSR_USCRATCH,
+            CSR_UEPC,
+            CSR_UCAUSE,
+            CSR_UTVAL,
+            CSR_UIP,
+#  endif
+
+/* User Floating-Point CSRs */
+            CSR_FFLAGS,
+            CSR_FRM,
+            CSR_FCSR,
+
+/* User Vector CSRs */
+            CSR_VSTART,
+            CSR_VXSAT,
+            CSR_VXRM,
+            CSR_VL,
+            CSR_VTYPE,
+
+#  if      0
+/* User Timers and Counters */
+            CSR_CYCLE,
+            CSR_TIME,
+            CSR_INSTRET,
+            CSR_HPMCOUNTER3,
+            CSR_HPMCOUNTER4,
+            CSR_HPMCOUNTER5,
+            CSR_HPMCOUNTER6,
+            CSR_HPMCOUNTER7,
+            CSR_HPMCOUNTER8,
+            CSR_HPMCOUNTER9,
+            CSR_HPMCOUNTER10,
+            CSR_HPMCOUNTER11,
+            CSR_HPMCOUNTER12,
+            CSR_HPMCOUNTER13,
+            CSR_HPMCOUNTER14,
+            CSR_HPMCOUNTER15,
+            CSR_HPMCOUNTER16,
+            CSR_HPMCOUNTER17,
+            CSR_HPMCOUNTER18,
+            CSR_HPMCOUNTER19,
+            CSR_HPMCOUNTER20,
+            CSR_HPMCOUNTER21,
+            CSR_HPMCOUNTER22,
+            CSR_HPMCOUNTER23,
+            CSR_HPMCOUNTER24,
+            CSR_HPMCOUNTER25,
+            CSR_HPMCOUNTER26,
+            CSR_HPMCOUNTER27,
+            CSR_HPMCOUNTER28,
+            CSR_HPMCOUNTER29,
+            CSR_HPMCOUNTER30,
+            CSR_HPMCOUNTER31,
+            CSR_CYCLEH,
+            CSR_TIMEH,
+            CSR_INSTRETH,
+            CSR_HPMCOUNTER3H,
+            CSR_HPMCOUNTER4H,
+            CSR_HPMCOUNTER5H,
+            CSR_HPMCOUNTER6H,
+            CSR_HPMCOUNTER7H,
+            CSR_HPMCOUNTER8H,
+            CSR_HPMCOUNTER9H,
+            CSR_HPMCOUNTER10H,
+            CSR_HPMCOUNTER11H,
+            CSR_HPMCOUNTER12H,
+            CSR_HPMCOUNTER13H,
+            CSR_HPMCOUNTER14H,
+            CSR_HPMCOUNTER15H,
+            CSR_HPMCOUNTER16H,
+            CSR_HPMCOUNTER17H,
+            CSR_HPMCOUNTER18H,
+            CSR_HPMCOUNTER19H,
+            CSR_HPMCOUNTER20H,
+            CSR_HPMCOUNTER21H,
+            CSR_HPMCOUNTER22H,
+            CSR_HPMCOUNTER23H,
+            CSR_HPMCOUNTER24H,
+            CSR_HPMCOUNTER25H,
+            CSR_HPMCOUNTER26H,
+            CSR_HPMCOUNTER27H,
+            CSR_HPMCOUNTER28H,
+            CSR_HPMCOUNTER29H,
+            CSR_HPMCOUNTER30H,
+            CSR_HPMCOUNTER31H,
+#  endif
+
+#  if      0
+/* Machine Timers and Counters */
+            CSR_MCYCLE,
+            CSR_MINSTRET,
+            CSR_MCYCLEH,
+            CSR_MINSTRETH,
+#  endif
+
+/* Machine Information Registers */
+            CSR_MVENDORID,
+            CSR_MARCHID,
+            CSR_MIMPID,
             CSR_MHARTID,
+
+/* Machine Trap Setup */
             CSR_MSTATUS,
-            CSR_MSTATUSH,
-            CSR_HSTATUS,
-            CSR_VSSTATUS,
-            CSR_MIP,
-            CSR_MIE,
-            CSR_MIDELEG,
-            CSR_HIDELEG,
+            CSR_MISA,
             CSR_MEDELEG,
-            CSR_HEDELEG,
+            CSR_MIDELEG,
+            CSR_MIE,
             CSR_MTVEC,
-            CSR_STVEC,
-            CSR_VSTVEC,
+            CSR_MCOUNTEREN,
+
+#  if defined TARGET_RISCV32
+/* 32-bit only */
+            CSR_MSTATUSH,
+#  endif
+
+/* Machine Trap Handling */
+            CSR_MSCRATCH,
             CSR_MEPC,
-            CSR_SEPC,
-            CSR_VSEPC,
             CSR_MCAUSE,
-            CSR_SCAUSE,
-            CSR_VSCAUSE,
             CSR_MTVAL,
+            CSR_MIP,
+
+/* Supervisor Trap Setup */
+            CSR_SSTATUS,
+            CSR_SEDELEG,
+            CSR_SIDELEG,
+            CSR_SIE,
+            CSR_STVEC,
+            CSR_SCOUNTEREN,
+
+/* Supervisor Trap Handling */
+            CSR_SSCRATCH,
+            CSR_SEPC,
+            CSR_SCAUSE,
             CSR_STVAL,
+            CSR_SIP,
+
+/* Supervisor Protection and Translation */
+            CSR_SPTBR,
+            CSR_SATP,
+
+/* Hpervisor CSRs */
+            CSR_HSTATUS,
+            CSR_HEDELEG,
+            CSR_HIDELEG,
+            CSR_HIE,
+            CSR_HCOUNTEREN,
+            CSR_HGEIE,
             CSR_HTVAL,
+            CSR_HVIP,
+            CSR_HIP,
+            CSR_HTINST,
+            CSR_HGEIP,
+            CSR_HGATP,
+            CSR_HTIMEDELTA,
+            CSR_HTIMEDELTAH,
+
+/* Virtual CSRs */
+            CSR_VSSTATUS,
+            CSR_VSIE,
+            CSR_VSTVEC,
+            CSR_VSSCRATCH,
+            CSR_VSEPC,
+            CSR_VSCAUSE,
+            CSR_VSTVAL,
+            CSR_VSIP,
+            CSR_VSATP,
+
+            CSR_MTINST,
             CSR_MTVAL2,
-            CSR_MSCRATCH,
-            CSR_SSCRATCH,
-            CSR_SATP,
-            CSR_MMTE,
-            CSR_UPMBASE,
-            CSR_UPMMASK,
-            CSR_SPMBASE,
-            CSR_SPMMASK,
-            CSR_MPMBASE,
-            CSR_MPMMASK,
+
+#  if      0
+/* Enhanced Physical Memory Protection (ePMP) */
+            CSR_MSECCFG,
+            CSR_MSECCFGH,
+#  endif
+#  if      0
+/* Physical Memory Protection */
+            CSR_PMPCFG0,
+            CSR_PMPCFG1,
+            CSR_PMPCFG2,
+            CSR_PMPCFG3,
+            CSR_PMPADDR0,
+            CSR_PMPADDR1,
+            CSR_PMPADDR2,
+            CSR_PMPADDR3,
+            CSR_PMPADDR4,
+            CSR_PMPADDR5,
+            CSR_PMPADDR6,
+            CSR_PMPADDR7,
+            CSR_PMPADDR8,
+            CSR_PMPADDR9,
+            CSR_PMPADDR10,
+            CSR_PMPADDR11,
+            CSR_PMPADDR12,
+            CSR_PMPADDR13,
+            CSR_PMPADDR14,
+            CSR_PMPADDR15,
+#  endif
+
+#  if      0
+/* Debug/Trace Registers (shared with Debug Mode) */
+            CSR_TSELECT,
+            CSR_TDATA1,
+            CSR_TDATA2,
+            CSR_TDATA3,
+#  endif
+
+#  if      0
+/* Debug Mode Registers */
+            CSR_DCSR,
+            CSR_DPC,
+            CSR_DSCRATCH,
+#  endif
+
+#  if      0
+/* Performance Counters */
+            CSR_MHPMCOUNTER3,
+            CSR_MHPMCOUNTER4,
+            CSR_MHPMCOUNTER5,
+            CSR_MHPMCOUNTER6,
+            CSR_MHPMCOUNTER7,
+            CSR_MHPMCOUNTER8,
+            CSR_MHPMCOUNTER9,
+            CSR_MHPMCOUNTER10,
+            CSR_MHPMCOUNTER11,
+            CSR_MHPMCOUNTER12,
+            CSR_MHPMCOUNTER13,
+            CSR_MHPMCOUNTER14,
+            CSR_MHPMCOUNTER15,
+            CSR_MHPMCOUNTER16,
+            CSR_MHPMCOUNTER17,
+            CSR_MHPMCOUNTER18,
+            CSR_MHPMCOUNTER19,
+            CSR_MHPMCOUNTER20,
+            CSR_MHPMCOUNTER21,
+            CSR_MHPMCOUNTER22,
+            CSR_MHPMCOUNTER23,
+            CSR_MHPMCOUNTER24,
+            CSR_MHPMCOUNTER25,
+            CSR_MHPMCOUNTER26,
+            CSR_MHPMCOUNTER27,
+            CSR_MHPMCOUNTER28,
+            CSR_MHPMCOUNTER29,
+            CSR_MHPMCOUNTER30,
+            CSR_MHPMCOUNTER31,
+            CSR_MHPMEVENT3,
+            CSR_MHPMEVENT4,
+            CSR_MHPMEVENT5,
+            CSR_MHPMEVENT6,
+            CSR_MHPMEVENT7,
+            CSR_MHPMEVENT8,
+            CSR_MHPMEVENT9,
+            CSR_MHPMEVENT10,
+            CSR_MHPMEVENT11,
+            CSR_MHPMEVENT12,
+            CSR_MHPMEVENT13,
+            CSR_MHPMEVENT14,
+            CSR_MHPMEVENT15,
+            CSR_MHPMEVENT16,
+            CSR_MHPMEVENT17,
+            CSR_MHPMEVENT18,
+            CSR_MHPMEVENT19,
+            CSR_MHPMEVENT20,
+            CSR_MHPMEVENT21,
+            CSR_MHPMEVENT22,
+            CSR_MHPMEVENT23,
+            CSR_MHPMEVENT24,
+            CSR_MHPMEVENT25,
+            CSR_MHPMEVENT26,
+            CSR_MHPMEVENT27,
+            CSR_MHPMEVENT28,
+            CSR_MHPMEVENT29,
+            CSR_MHPMEVENT30,
+            CSR_MHPMEVENT31,
+            CSR_MHPMCOUNTER3H,
+            CSR_MHPMCOUNTER4H,
+            CSR_MHPMCOUNTER5H,
+            CSR_MHPMCOUNTER6H,
+            CSR_MHPMCOUNTER7H,
+            CSR_MHPMCOUNTER8H,
+            CSR_MHPMCOUNTER9H,
+            CSR_MHPMCOUNTER10H,
+            CSR_MHPMCOUNTER11H,
+            CSR_MHPMCOUNTER12H,
+            CSR_MHPMCOUNTER13H,
+            CSR_MHPMCOUNTER14H,
+            CSR_MHPMCOUNTER15H,
+            CSR_MHPMCOUNTER16H,
+            CSR_MHPMCOUNTER17H,
+            CSR_MHPMCOUNTER18H,
+            CSR_MHPMCOUNTER19H,
+            CSR_MHPMCOUNTER20H,
+            CSR_MHPMCOUNTER21H,
+            CSR_MHPMCOUNTER22H,
+            CSR_MHPMCOUNTER23H,
+            CSR_MHPMCOUNTER24H,
+            CSR_MHPMCOUNTER25H,
+            CSR_MHPMCOUNTER26H,
+            CSR_MHPMCOUNTER27H,
+            CSR_MHPMCOUNTER28H,
+            CSR_MHPMCOUNTER29H,
+            CSR_MHPMCOUNTER30H,
+            CSR_MHPMCOUNTER31H,
+#  endif
         };
 
         for (int i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
-- 
Konrad Schwarz


