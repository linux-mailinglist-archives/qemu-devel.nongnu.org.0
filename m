Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E065374C12
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:44:33 +0200 (CEST)
Received: from localhost ([::1]:52742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leRBw-000229-0h
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsA-0007Zn-LI
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:06 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQs5-0000W7-UP
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257041; x=1651793041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lTWmHLSJ/1zeLY+vPzxAeYV0kg5U5ryvxxKuI70GuU4=;
 b=B4Kua7asawtsv2btzaa/nL3c60i8VqCV4Yjesdyy6yynll5yN8iiiFvp
 meSjxoJuk0Abtw28ROzPkyIdT/4B92REoYUsR+RReoH6+gF1iInXnwoSj
 g0swLIYPz8huqKHeVR3CAY/7Vj1LdhQfRWwEPnqMH+GrkKE8juru3vHtl
 +MxYfIQn1rzT9WI+Y72U67Khr+DLFytTdxdWZh2laN0nn9azqtWy4l3/N
 1695yQEICs08+sg5Fmb4aXS0fzBC/O9Cl7YSPF+3FQu6imymYSZUvKkP6
 NdwzbJgcuC2AnM3akAchzr42mQJfmNZooHykEWi9oBC5AHO+YT6B2gIZu w==;
IronPort-SDR: 6OuiwLOWblQqwqlMyl4rtLXJ68IvFxY6zu4yiMYEJNTw4UGMseSyip634jHOzv9DkDN5XcQNa4
 vBsexLhNcBw+5TluKAhymPb6CviHJi/3GnifISztScXPzAmYcUY4xg/kobye598+e1iB3zRMPr
 YFmpL5PTU2uNVdTUCizU530+nUKqrr/qCziXGasn4iOvt7DrB55k9uiI35u6eCu6bsgabskRLD
 rdhH+AFkmh3n0v/NbfCdQTMMv3vsOqfzgE/j+O+kiHpFOc/BC6LfI9TxOfSzI/+gBkyrYneNLz
 +oQ=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585897"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:00 +0800
IronPort-SDR: 3n30lTmTGw7q3Ri0/+g+17P9xlICql8/jO/p7P1SoVmve7SmxrINz3PFb7g8c5pAYg72c493zc
 fmyRKV1t5iHe0xWjo/ZTcPRWcCKgjYBaSKxj0wRvcOFYDaq+wqMuvZRdiJaiJHzroabKE81zaE
 u34qda3bBAI2bgsqb2tlEUT03qwODcXT/Yj5ZtSJrl+DzXtkVqKIxqbyXicNyEeIbyxZ5+dkWg
 SgDEWpIPleTLnrwzRWb6P0xA5FJPNXJmtAQwTD3iPdbR1py2+coLB71p4LXzOVfrmcqtE5Qwn2
 S0K9/jWf2Ym4hS9Drc6eK61v
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:41 -0700
IronPort-SDR: Jsv+rrN0nA1wVNGuOWH3BxVZfDsIh9PBkOc4YOmfa5WMQDjacu3xrdQcRbDHCYTXwRKZb5XrFc
 g/EOjCD86oDwJwVYblYA99LQF7XecVBgXaEaPZEmFKU3Fs8lS6cpBYZaBGUZBRWBHRwwm2eCWr
 BbEBVjvTQ+O8SouFgZHqEvObTMkuMQE7ZA6zdxtelLQ3a7knHiwPTorEGbh0mY4VKpihLjB7aF
 MSk2BB1MHETGvmlWp1oENIa4W6T/DQixx4rIL5nnuv/UcX489tUhXx5cS+g+dqLh6xFb+RanNX
 kzo=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:23:58 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 13/42] target/riscv: Use RISCVException enum for CSR access
Date: Thu,  6 May 2021 09:22:43 +1000
Message-Id: <20210505232312.4175486-14-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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


