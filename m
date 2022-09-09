Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFD35B3BC4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 17:25:15 +0200 (CEST)
Received: from localhost ([::1]:50030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWfsY-0007Sn-A3
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 11:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leon@is.currently.online>)
 id 1oWfr0-0005qJ-Ra; Fri, 09 Sep 2022 11:23:38 -0400
Received: from netc0.host.rs.currently.online ([2a03:4000:58:d86::1]:40566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leon@is.currently.online>)
 id 1oWfqy-0004MY-8f; Fri, 09 Sep 2022 11:23:38 -0400
Received: from carbon.srv.schuermann.io (unknown [IPv6:fdcb:20e8:f36d:3::1])
 by netc0.host.rs.currently.online (Postfix) with ESMTPS id 9E89AD53E;
 Fri,  9 Sep 2022 15:23:30 +0000 (UTC)
From: leon@is.currently.online
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=is.currently.online;
 s=carbon; t=1662737006;
 bh=tlHMcmrxUrnakNduA9obJk326m5R3LxkWfNJ9SWxqPo=;
 h=From:To:Cc:Subject:Date;
 b=cGNWi8pM1wwWg2ae4kUomE7OLZG2yMoKNlLfIj5F6iCDUQwLLSw5X8S921kgSg/vo
 hBrnn73aPw1KrSWCpIuW+geZfSapUvZYdrFJgXhSRWW4my++7piGPSvY19Kad32jX+
 s3LBNY/yYnSfGPakR2sRVPn9okcr7HdIyk/nSXyk=
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Leon Schuermann <leon@is.currently.online>
Subject: [PATCH] target/riscv/pmp: fix non-translated page size address checks
 w/ MPU
Date: Fri,  9 Sep 2022 11:22:59 -0400
Message-Id: <20220909152258.2568942-1-leon@is.currently.online>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a03:4000:58:d86::1;
 envelope-from=leon@is.currently.online; helo=netc0.host.rs.currently.online
X-Spam_score_int: 25
X-Spam_score: 2.5
X-Spam_bar: ++
X-Spam_report: (2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FROM_SUSPICIOUS_NTLD=0.5, FROM_SUSPICIOUS_NTLD_FP=1.999,
 PDS_OTHER_BAD_TLD=1.999, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Leon Schuermann <leon@is.currently.online>

This commit fixes PMP address access checks with non page-aligned PMP
regions on harts with MPU enabled. Without this change, the presence
of an MPU in the virtual CPU model would influence the PMP address
check behavior when an access size was unknown (`size == 0`),
regardless of whether virtual memory has actually been enabled by the
guest.

The RISC-V Privileged Spec Version 20211203[1] states in 4.3.1
Addressing and Memory Protection that "[...]  [w]hen Sv32 virtual
memory mode is selected in the MODE field of the satp register,
supervisor virtual addresses are translated into supervisor physical
addresses via a two-level page table. The 20-bit VPN is translated
into a 22-bit physical page number (PPN), while the 12-bit page offset
is untranslated. The resulting supervisor-level physical addresses are
then checked using any physical memory protection structures (Sections
3.7), before being directly converted to machine-level physical
addresses. [...]" and "[...] [w]hen the value of satp.MODE is Bare,
the 32-bit virtual address is translated (unmodified) into a 32-bit
physical address [...]". Other modes such as Sv39, Sv48 and Sv57 are
said to behave similar in this regard.

From this specification it can be inferred that any access made when
virtual memory is disabled, which is the case when satp.MODE is set to
"Bare" (0), should behave identically with respect to PMP checks as if
no MPU were present in the system at all. The current implementation,
however, degrades any PMP address checks of unknown access size (which
seems to be the case for instruction fetches at least) to be of
page-granularity, just based on the fact that the hart has MPU support
enabled. This causes systems that rely on 4-byte aligned PMP regions
to incur access faults, which are not occurring with the MPU disabled,
independent of any runtime guest configuration.

While there possibly are other unhandled edge cases in which
page-granularity access checks might not be appropriate, this commit
appears to be a strict improvement over the current implementation's
behavior. It has been tested using Tock OS, but not with other
systems (e.g., Linux) yet.

[1]: https://github.com/riscv/riscv-isa-manual/releases/download/Priv-v1.12/riscv-privileged-20211203.pdf

Signed-off-by: Leon Schuermann <leon@is.currently.online>
---

This patch is a resubmission to include all maintainers of the
modified files and main QEMU mailing list, as determined through the
`get_maintainer.pl` script.

Also, one particular example of an additional edge case not handled
through this patch might be a hart operating in M-mode. Given that
virtual memory through {Sv32,Sv39,Sv48,Sv57} is only supported for
S-mode and U-mode respectively, enabling virtual memory in the satp
CSR should not have any effect on the behavior of memory accesses
w.r.t. PMP checks for harts operating in M-mode.

I'm going to defer adding this additional check, as I'd appreciate some
feedback as to whether my reasoning is correct here at all first.

Thanks!

-Leon

---
 target/riscv/pmp.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index ea2b67d947..48f64a4aef 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -300,6 +300,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     int i = 0;
     int ret = -1;
     int pmp_size = 0;
+    uint64_t satp_mode;
     target_ulong s = 0;
     target_ulong e = 0;
 
@@ -310,10 +311,17 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     }
 
     if (size == 0) {
-        if (riscv_feature(env, RISCV_FEATURE_MMU)) {
+        if (riscv_cpu_mxl(env) == MXL_RV32) {
+            satp_mode = SATP32_MODE;
+        } else {
+            satp_mode = SATP64_MODE;
+        }
+
+        if (riscv_feature(env, RISCV_FEATURE_MMU)
+            && get_field(env->satp, satp_mode)) {
             /*
-             * If size is unknown (0), assume that all bytes
-             * from addr to the end of the page will be accessed.
+             * If size is unknown (0) and virtual memory is enabled, assume that
+             * all bytes from addr to the end of the page will be accessed.
              */
             pmp_size = -(addr | TARGET_PAGE_MASK);
         } else {

base-commit: 61fd710b8da8aedcea9b4f197283dc38638e4b60
-- 
2.36.0


