Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF9945D5C4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 08:51:13 +0100 (CET)
Received: from localhost ([::1]:56482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq9XE-0000gB-MZ
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 02:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9Pa-00038o-Ns; Thu, 25 Nov 2021 02:43:18 -0500
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:45933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9PZ-0001ON-2n; Thu, 25 Nov 2021 02:43:18 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07917368|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.385045-0.000545751-0.61441;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=7; SR=0; TI=SMTPD_---.LyzDYQT_1637826188; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LyzDYQT_1637826188)
 by smtp.aliyun-inc.com(10.147.41.158);
 Thu, 25 Nov 2021 15:43:09 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 06/22] target/riscv: Extend pc for runtime pc write
Date: Thu, 25 Nov 2021 15:39:35 +0800
Message-Id: <20211125073951.57678-7-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.97; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-97.mail.aliyun.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>, bin.meng@windriver.com,
 richard.henderson@linaro.org, palmer@dabbelt.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In some cases, we must restore the guest PC to the address of the start of
the TB, such as when the instruction counter hits zero. So extend pc register
according to current xlen for these cases.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5c757ce33a..3e394d08e4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -319,7 +319,12 @@ static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    env->pc = value;
+
+    if (env->xl == MXL_RV32) {
+        env->pc = (int32_t)value;
+    } else {
+        env->pc = value;
+    }
 }
 
 static void riscv_cpu_synchronize_from_tb(CPUState *cs,
@@ -327,7 +332,13 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    env->pc = tb->pc;
+    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
+
+    if (xl == MXL_RV32) {
+        env->pc = (int32_t)tb->pc;
+    } else {
+        env->pc = tb->pc;
+    }
 }
 
 static bool riscv_cpu_has_work(CPUState *cs)
@@ -348,7 +359,12 @@ static bool riscv_cpu_has_work(CPUState *cs)
 void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
-    env->pc = data[0];
+    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
+    if (xl == MXL_RV32) {
+        env->pc = (int32_t)data[0];
+    } else {
+        env->pc = data[0];
+    }
 }
 
 static void riscv_cpu_reset(DeviceState *dev)
-- 
2.25.1


