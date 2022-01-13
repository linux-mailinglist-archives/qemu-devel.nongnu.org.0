Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC35C48D6D0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 12:44:57 +0100 (CET)
Received: from localhost ([::1]:48522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7yXI-0005bc-Vn
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 06:44:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1n7yTJ-00032e-Bg; Thu, 13 Jan 2022 06:40:49 -0500
Received: from out28-100.mail.aliyun.com ([115.124.28.100]:47838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1n7yTF-00030C-HJ; Thu, 13 Jan 2022 06:40:47 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07576766|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.193991-0.000184048-0.805825;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=8; SR=0; TI=SMTPD_---.Mb0JPfc_1642074039; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Mb0JPfc_1642074039)
 by smtp.aliyun-inc.com(10.147.42.253);
 Thu, 13 Jan 2022 19:40:40 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 01/22] target/riscv: Adjust pmpcfg access with mxl
Date: Thu, 13 Jan 2022 19:39:43 +0800
Message-Id: <20220113114004.286796-2-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
References: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.100; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-100.mail.aliyun.com
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
 richard.henderson@linaro.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/csr.c | 19 +++++++++++++++++++
 target/riscv/pmp.c | 12 ++++--------
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index adb3d4381d..e7578f3e0f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1493,9 +1493,23 @@ static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static bool check_pmp_reg_index(CPURISCVState *env, uint32_t reg_index)
+{
+    /* TODO: RV128 restriction check */
+    if ((reg_index & 1) && (riscv_cpu_mxl(env) == MXL_RV64)) {
+        return false;
+    }
+    return true;
+}
+
 static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
+    uint32_t reg_index = csrno - CSR_PMPCFG0;
+
+    if (!check_pmp_reg_index(env, reg_index)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
     *val = pmpcfg_csr_read(env, csrno - CSR_PMPCFG0);
     return RISCV_EXCP_NONE;
 }
@@ -1503,6 +1517,11 @@ static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
 static RISCVException write_pmpcfg(CPURISCVState *env, int csrno,
                                    target_ulong val)
 {
+    uint32_t reg_index = csrno - CSR_PMPCFG0;
+
+    if (!check_pmp_reg_index(env, reg_index)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
     pmpcfg_csr_write(env, csrno - CSR_PMPCFG0, val);
     return RISCV_EXCP_NONE;
 }
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 54abf42583..81b61bb65c 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -463,16 +463,11 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
 {
     int i;
     uint8_t cfg_val;
+    int pmpcfg_nums = 2 << riscv_cpu_mxl(env);
 
     trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
 
-    if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "ignoring pmpcfg write - incorrect address\n");
-        return;
-    }
-
-    for (i = 0; i < sizeof(target_ulong); i++) {
+    for (i = 0; i < pmpcfg_nums; i++) {
         cfg_val = (val >> 8 * i)  & 0xff;
         pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
     }
@@ -490,8 +485,9 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
     int i;
     target_ulong cfg_val = 0;
     target_ulong val = 0;
+    int pmpcfg_nums = 2 << riscv_cpu_mxl(env);
 
-    for (i = 0; i < sizeof(target_ulong); i++) {
+    for (i = 0; i < pmpcfg_nums; i++) {
         val = pmp_read_cfg(env, (reg_index * 4) + i);
         cfg_val |= (val << (i * 8));
     }
-- 
2.25.1


