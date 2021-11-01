Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69E44419B5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:18:42 +0100 (CET)
Received: from localhost ([::1]:36626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUOo-0005UH-0C
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8c-0001Ko-OW; Mon, 01 Nov 2021 06:01:58 -0400
Received: from out28-194.mail.aliyun.com ([115.124.28.194]:42176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8Z-0001TZ-Ov; Mon, 01 Nov 2021 06:01:58 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07471776|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0814185-0.000652516-0.917929;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LlcGtUT_1635760905; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LlcGtUT_1635760905)
 by smtp.aliyun-inc.com(10.147.43.230);
 Mon, 01 Nov 2021 18:01:46 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 02/13] target/riscv: Extend pc for runtime pc write
Date: Mon,  1 Nov 2021 18:01:32 +0800
Message-Id: <20211101100143.44356-3-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.194; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-194.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, richard.henderson@linaro.org, bin.meng@windriver.com,
 Alistair.Francis@wdc.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In some cases, we must restore the guest PC to the address of the start of
the TB, such as when the instruction counter hit zero. So extend pc register
according to current xlen for these cases.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.c        | 20 +++++++++++++++++---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c |  2 +-
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d53125dbc..7eefd4f6a6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -319,7 +319,12 @@ static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    env->pc = value;
+
+    if (cpu_get_xl(env) == MXL_RV32) {
+        env->pc = (int32_t)value;
+    } else {
+        env->pc = value;
+    }
 }
 
 static void riscv_cpu_synchronize_from_tb(CPUState *cs,
@@ -327,7 +332,12 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    env->pc = tb->pc;
+
+    if (cpu_get_xl(env) == MXL_RV32) {
+        env->pc = (int32_t)tb->pc;
+    } else {
+        env->pc = tb->pc;
+    }
 }
 
 static bool riscv_cpu_has_work(CPUState *cs)
@@ -348,7 +358,11 @@ static bool riscv_cpu_has_work(CPUState *cs)
 void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
-    env->pc = data[0];
+   if (cpu_get_xl(env) == MXL_RV32) {
+        env->pc = (int32_t)data[0];
+    } else {
+        env->pc = data[0];
+    }
 }
 
 static void riscv_cpu_reset(DeviceState *dev)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0760c0af93..8befff0166 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -420,6 +420,8 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
 }
 #endif
 
+RISCVMXL cpu_get_xl(CPURISCVState *env);
+
 /*
  * A simplification for VLMAX
  * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f30ff672f8..7d0aee6769 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -35,7 +35,7 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #endif
 }
 
-static RISCVMXL cpu_get_xl(CPURISCVState *env)
+RISCVMXL cpu_get_xl(CPURISCVState *env)
 {
 #if defined(TARGET_RISCV32)
     return MXL_RV32;
-- 
2.25.1


