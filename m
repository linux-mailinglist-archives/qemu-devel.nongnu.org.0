Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF95C48D6FB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 12:56:44 +0100 (CET)
Received: from localhost ([::1]:43756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7yii-0005lZ-1a
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 06:56:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1n7yWj-0006vU-K8; Thu, 13 Jan 2022 06:44:21 -0500
Received: from out28-124.mail.aliyun.com ([115.124.28.124]:33231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1n7yWg-0003PQ-MH; Thu, 13 Jan 2022 06:44:21 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436366|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0231685-0.000144035-0.976687;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.Mb1b6fQ_1642074253; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Mb1b6fQ_1642074253)
 by smtp.aliyun-inc.com(10.147.44.118);
 Thu, 13 Jan 2022 19:44:14 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 08/22] target/riscv: Use gdb xml according to max mxlen
Date: Thu, 13 Jan 2022 19:39:50 +0800
Message-Id: <20220113114004.286796-9-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
References: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.124; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-124.mail.aliyun.com
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

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c     |  8 ++---
 target/riscv/gdbstub.c | 71 +++++++++++++++++++++++++++++++-----------
 2 files changed, 55 insertions(+), 24 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index db16aaf7c9..a21287253a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -446,6 +446,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPU *cpu = RISCV_CPU(dev);
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
+    CPUClass *cc = CPU_CLASS(mcc);
     int priv_version = 0;
     Error *local_err = NULL;
 
@@ -496,11 +497,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     switch (env->misa_mxl_max) {
 #ifdef TARGET_RISCV64
     case MXL_RV64:
+        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
         break;
     case MXL_RV128:
         break;
 #endif
     case MXL_RV32:
+        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
         break;
     default:
         g_assert_not_reached();
@@ -772,11 +775,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
     cc->gdb_write_register = riscv_cpu_gdb_write_register;
     cc->gdb_num_core_regs = 33;
-#if defined(TARGET_RISCV32)
-    cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
-#elif defined(TARGET_RISCV64)
-    cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
-#endif
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index a5429b92d4..f531a74c2f 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -50,11 +50,23 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
+    target_ulong tmp;
 
     if (n < 32) {
-        return gdb_get_regl(mem_buf, env->gpr[n]);
+        tmp = env->gpr[n];
     } else if (n == 32) {
-        return gdb_get_regl(mem_buf, env->pc);
+        tmp = env->pc;
+    } else {
+        return 0;
+    }
+
+    switch (env->misa_mxl_max) {
+    case MXL_RV32:
+        return gdb_get_reg32(mem_buf, tmp);
+    case MXL_RV64:
+        return gdb_get_reg64(mem_buf, tmp);
+    default:
+        g_assert_not_reached();
     }
     return 0;
 }
@@ -63,18 +75,32 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-
-    if (n == 0) {
-        /* discard writes to x0 */
-        return sizeof(target_ulong);
-    } else if (n < 32) {
-        env->gpr[n] = ldtul_p(mem_buf);
-        return sizeof(target_ulong);
+    int length = 0;
+    target_ulong tmp;
+
+    switch (env->misa_mxl_max) {
+    case MXL_RV32:
+        tmp = (int32_t)ldl_p(mem_buf);
+        length = 4;
+        break;
+    case MXL_RV64:
+        if (env->xl < MXL_RV64) {
+            tmp = (int32_t)ldq_p(mem_buf);
+        } else {
+            tmp = ldq_p(mem_buf);
+        }
+        length = 8;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (n > 0 && n < 32) {
+        env->gpr[n] = tmp;
     } else if (n == 32) {
-        env->pc = ldtul_p(mem_buf);
-        return sizeof(target_ulong);
+        env->pc = tmp;
     }
-    return 0;
+
+    return length;
 }
 
 static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
@@ -387,13 +413,20 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                                               cs->gdb_num_regs),
                                  "riscv-vector.xml", 0);
     }
-#if defined(TARGET_RISCV32)
-    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
-                             1, "riscv-32bit-virtual.xml", 0);
-#elif defined(TARGET_RISCV64)
-    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
-                             1, "riscv-64bit-virtual.xml", 0);
-#endif
+    switch (env->misa_mxl_max) {
+    case MXL_RV32:
+        gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
+                                 riscv_gdb_set_virtual,
+                                 1, "riscv-32bit-virtual.xml", 0);
+        break;
+    case MXL_RV64:
+        gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
+                                 riscv_gdb_set_virtual,
+                                 1, "riscv-64bit-virtual.xml", 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
 
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
                              riscv_gen_dynamic_csr_xml(cs, cs->gdb_num_regs),
-- 
2.25.1


