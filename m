Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CDD37A4A9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:35:55 +0200 (CEST)
Received: from localhost ([::1]:40258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPk3-0001Hv-0d
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVh-0000Fh-BO
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:05 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVV-0006V6-Fi
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728453; x=1652264453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lTWmHLSJ/1zeLY+vPzxAeYV0kg5U5ryvxxKuI70GuU4=;
 b=fzqrnPl7KWmkn420hD5Lgu8mmmAVoju0mrYCpvGWiLpW9/WaHW4DaY3O
 TrXp1yKjMrSMjgPK6IhoX6TsxVmdwjWPMxlr6JV69N2+ZXuJeMeD61ETj
 fSR8K3AzRHLE0xfFE5Y4kWhfcpXlwJGcjPkmfuxcYQskafriw9QE8dEEP
 gAZjzEUp6h6jlE+Gc+3xCCw5J7RqabJ1mHFYcYnOQ7BaGnPPIvBNOeAis
 TLgzq6n27avf9HQQwhpnwHBCOPu2OMKNjicV6tRFTkIM3Sq0YmTeve4Yu
 3uAvA0+deQAfa7TH/MevpEUQWkAaw1ruPyhM7DViZ46P6gaNj+M6vQU/4 w==;
IronPort-SDR: 0ct/gPSCei1CLSjbacEGUMrz/zOgjQ0A4Pd8cOboBF1JbXRpdQmODp7Qn1sZCUdEaiYq823Gm6
 6ClmsFaQP4p0vM1GtK1WsUkUUeTBIrXgoypRRZ8xY8TfXV+CQ7zn107fc9PP4AX2doGY8TskBn
 WPWPy2ehzcyyISzC59BFfqwFxSLwhjcNkCfXFfrLaBektSXoHe7AuIfzgHlu5fytsf3pDExvmY
 dshHHw084DmHaY8Igj8UhUI5sD8iCagPS7XQ7ikTjgud1somH8UOG4K/nEQB6342XSEbuMoKru
 Z/8=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735386"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:43 +0800
IronPort-SDR: LyUyb7y2XvuPvvzP2BIZRwBUx6R8JdJ8GbvHw0WFbUhYp0jLJEBum2YMEqMRamfSIRo4K6Z3Fu
 H6rkCLItaG6pV0FmepabS6mdZKRV5lKPwJDqs49wInKbPXIPK5Be0E9fcF3dpfkHzJyQJS+07O
 atGCpitIxftSVJz9UsXcgdiIpvjYrXFkyFv7aditoEFKUxYaH8EQY6ixbvfki/BbeY4vMhBj+U
 QrZ9yh93DCdlp+4KfrCySSB9lKjf1z5G3AIr75KSDiMQ+JIfMF6Nwl19AEtZDt34zvccnLCUhz
 sWrv+KzqaqvygTuRyjqzFvwe
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:43 -0700
IronPort-SDR: KrdjlYgkwjpxZUmi0ZA4E7gkvwgGixTvHxFgTR1XoCo6fy8wwLdubl2BawhdMpmPWeBORUurhm
 0AdDvRRZw+FDNGcqDf5NhJPoQSMj07kFo8yaHBBGxuwbq6VmfB89E/CBb1FQVddrZzignMSdJl
 YNALZJWTCmEW2n/44Ixgri2BTiVqLlMYzFyjTxDKCsBc0ADYajHNG318vBZptJ1u42RGmiRrpR
 qFqN0pPUJV5CDh8FQ2qbYI9/k+dsVHL2EPUxEUCp0QMVMBoXEaJzKOpQCy6BxmZ7jskUeW83Ym
 Y7I=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:42 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 13/42] target/riscv: Use RISCVException enum for CSR access
Date: Tue, 11 May 2021 20:19:22 +1000
Message-Id: <20210511101951.165287-14-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 302b208f40373557fa11b351b5c9f43039ca8ea3.1617290165.git.alistair.francis@wdc.com
---
 target/riscv/cpu.h       | 11 +++++++----
 target/riscv/csr.c       | 37 ++++++++++++++++++-------------------
 target/riscv/gdbstub.c   |  8 ++++----
 target/riscv/op_helper.c | 18 +++++++++---------
 4 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a7b8876ea0..842d3ab810 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -454,10 +454,13 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     *pflags = flags;
 }
 
-int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                target_ulong new_value, target_ulong write_mask);
-int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                      target_ulong new_value, target_ulong write_mask);
+RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
+                           target_ulong *ret_value,
+                           target_ulong new_value, target_ulong write_mask);
+RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
+                                 target_ulong *ret_value,
+                                 target_ulong new_value,
+                                 target_ulong write_mask);
 
 static inline void riscv_csr_write(CPURISCVState *env, int csrno,
                                    target_ulong val)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f67eaf4042..f0a74f0eb8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1382,10 +1382,11 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
  * csrrc  <->  riscv_csrrw(env, csrno, ret_value, 0, value);
  */
 
-int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                target_ulong new_value, target_ulong write_mask)
+RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
+                           target_ulong *ret_value,
+                           target_ulong new_value, target_ulong write_mask)
 {
-    int ret;
+    RISCVException ret;
     target_ulong old_value;
     RISCVCPU *cpu = env_archcpu(env);
 
@@ -1407,41 +1408,37 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
 
     if ((write_mask && read_only) ||
         (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
 
     /* ensure the CSR extension is enabled. */
     if (!cpu->cfg.ext_icsr) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     /* check predicate */
     if (!csr_ops[csrno].predicate) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
     ret = csr_ops[csrno].predicate(env, csrno);
     if (ret != RISCV_EXCP_NONE) {
-        return -ret;
+        return ret;
     }
 
     /* execute combined read/write operation if it exists */
     if (csr_ops[csrno].op) {
-        ret = csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
-        if (ret != RISCV_EXCP_NONE) {
-            return -ret;
-        }
-        return 0;
+        return csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
     }
 
     /* if no accessor exists then return failure */
     if (!csr_ops[csrno].read) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
     /* read old value */
     ret = csr_ops[csrno].read(env, csrno, &old_value);
     if (ret != RISCV_EXCP_NONE) {
-        return -ret;
+        return ret;
     }
 
     /* write value if writable and write mask set, otherwise drop writes */
@@ -1450,7 +1447,7 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
         if (csr_ops[csrno].write) {
             ret = csr_ops[csrno].write(env, csrno, new_value);
             if (ret != RISCV_EXCP_NONE) {
-                return -ret;
+                return ret;
             }
         }
     }
@@ -1460,17 +1457,19 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
         *ret_value = old_value;
     }
 
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
 /*
  * Debugger support.  If not in user mode, set env->debugger before the
  * riscv_csrrw call and clear it after the call.
  */
-int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                target_ulong new_value, target_ulong write_mask)
+RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
+                                 target_ulong *ret_value,
+                                 target_ulong new_value,
+                                 target_ulong write_mask)
 {
-    int ret;
+    RISCVException ret;
 #if !defined(CONFIG_USER_ONLY)
     env->debugger = true;
 #endif
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 5f96b7ea2a..ca78682cf4 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -71,7 +71,7 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
          */
         result = riscv_csrrw_debug(env, n - 32, &val,
                                    0, 0);
-        if (result == 0) {
+        if (result == RISCV_EXCP_NONE) {
             return gdb_get_regl(buf, val);
         }
     }
@@ -94,7 +94,7 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
          */
         result = riscv_csrrw_debug(env, n - 32, NULL,
                                    val, -1);
-        if (result == 0) {
+        if (result == RISCV_EXCP_NONE) {
             return sizeof(target_ulong);
         }
     }
@@ -108,7 +108,7 @@ static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
         int result;
 
         result = riscv_csrrw_debug(env, n, &val, 0, 0);
-        if (result == 0) {
+        if (result == RISCV_EXCP_NONE) {
             return gdb_get_regl(buf, val);
         }
     }
@@ -122,7 +122,7 @@ static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
         int result;
 
         result = riscv_csrrw_debug(env, n, NULL, val, -1);
-        if (result == 0) {
+        if (result == RISCV_EXCP_NONE) {
             return sizeof(target_ulong);
         }
     }
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index f0bbd73ca5..170b494227 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -41,10 +41,10 @@ target_ulong helper_csrrw(CPURISCVState *env, target_ulong src,
         target_ulong csr)
 {
     target_ulong val = 0;
-    int ret = riscv_csrrw(env, csr, &val, src, -1);
+    RISCVException ret = riscv_csrrw(env, csr, &val, src, -1);
 
-    if (ret < 0) {
-        riscv_raise_exception(env, -ret, GETPC());
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
     }
     return val;
 }
@@ -53,10 +53,10 @@ target_ulong helper_csrrs(CPURISCVState *env, target_ulong src,
         target_ulong csr, target_ulong rs1_pass)
 {
     target_ulong val = 0;
-    int ret = riscv_csrrw(env, csr, &val, -1, rs1_pass ? src : 0);
+    RISCVException ret = riscv_csrrw(env, csr, &val, -1, rs1_pass ? src : 0);
 
-    if (ret < 0) {
-        riscv_raise_exception(env, -ret, GETPC());
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
     }
     return val;
 }
@@ -65,10 +65,10 @@ target_ulong helper_csrrc(CPURISCVState *env, target_ulong src,
         target_ulong csr, target_ulong rs1_pass)
 {
     target_ulong val = 0;
-    int ret = riscv_csrrw(env, csr, &val, 0, rs1_pass ? src : 0);
+    RISCVException ret = riscv_csrrw(env, csr, &val, 0, rs1_pass ? src : 0);
 
-    if (ret < 0) {
-        riscv_raise_exception(env, -ret, GETPC());
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
     }
     return val;
 }
-- 
2.31.1


