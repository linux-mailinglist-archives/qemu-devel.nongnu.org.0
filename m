Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E990493491
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 06:41:08 +0100 (CET)
Received: from localhost ([::1]:32964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA3iV-0004qN-08
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 00:41:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3UI-0005KT-Mc; Wed, 19 Jan 2022 00:26:31 -0500
Received: from out28-194.mail.aliyun.com ([115.124.28.194]:48580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3UE-00023J-Dn; Wed, 19 Jan 2022 00:26:26 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0743664|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0405165-0.00021043-0.959273;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.MfCknl2_1642569969; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfCknl2_1642569969)
 by smtp.aliyun-inc.com(10.147.40.233);
 Wed, 19 Jan 2022 13:26:09 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 15/22] target/riscv: Split out the vill from vtype
Date: Wed, 19 Jan 2022 13:18:17 +0800
Message-Id: <20220119051824.17494-16-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.194; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-194.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: guoren@linux.alibaba.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, palmer@dabbelt.com,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need not specially process vtype when XLEN changes.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h           |  1 +
 target/riscv/cpu_helper.c    |  3 +--
 target/riscv/csr.c           | 13 ++++++++++++-
 target/riscv/machine.c       |  5 +++--
 target/riscv/vector_helper.c |  3 ++-
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 89621e1996..6c740b92c1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -125,6 +125,7 @@ struct CPURISCVState {
     target_ulong vl;
     target_ulong vstart;
     target_ulong vtype;
+    bool vill;
 
     target_ulong pc;
     target_ulong load_res;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 502aee84ab..327a2c4f1d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -60,8 +60,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         uint32_t maxsz = vlmax << sew;
         bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
                            (maxsz >= 8);
-        flags = FIELD_DP32(flags, TB_FLAGS, VILL,
-                    FIELD_EX64(env->vtype, VTYPE, VILL));
+        flags = FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
         flags = FIELD_DP32(flags, TB_FLAGS, SEW, sew);
         flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
                     FIELD_EX64(env->vtype, VTYPE, VLMUL));
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 292f7e1624..b11d92b51b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -283,7 +283,18 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
 static RISCVException read_vtype(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
-    *val = env->vtype;
+    uint64_t vill;
+    switch (env->xl) {
+    case MXL_RV32:
+        vill = (uint32_t)env->vill << 31;
+        break;
+    case MXL_RV64:
+        vill = (uint64_t)env->vill << 63;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    *val = (target_ulong)vill | env->vtype;
     return RISCV_EXCP_NONE;
 }
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index a4b7859c2a..740e11fcff 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -124,8 +124,8 @@ static bool vector_needed(void *opaque)
 
 static const VMStateDescription vmstate_vector = {
     .name = "cpu/vector",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .needed = vector_needed,
     .fields = (VMStateField[]) {
             VMSTATE_UINT64_ARRAY(env.vreg, RISCVCPU, 32 * RV_VLEN_MAX / 64),
@@ -134,6 +134,7 @@ static const VMStateDescription vmstate_vector = {
             VMSTATE_UINTTL(env.vl, RISCVCPU),
             VMSTATE_UINTTL(env.vstart, RISCVCPU),
             VMSTATE_UINTTL(env.vtype, RISCVCPU),
+            VMSTATE_BOOL(env.vill, RISCVCPU),
             VMSTATE_END_OF_LIST()
         }
 };
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ad505ec9b2..a9484c22ea 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -52,7 +52,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
         || (ediv != 0)
         || (reserved != 0)) {
         /* only set vill bit. */
-        env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
+        env->vill = 1;
+        env->vtype = 0;
         env->vl = 0;
         env->vstart = 0;
         return 0;
-- 
2.25.1


