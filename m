Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAB61DCA79
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 11:51:23 +0200 (CEST)
Received: from localhost ([::1]:36802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbhrG-0006pD-UV
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 05:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbhqP-0005oq-GX; Thu, 21 May 2020 05:50:29 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:34497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbhqN-0004EF-JT; Thu, 21 May 2020 05:50:29 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06436283|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.155258-0.000218274-0.844524;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03306; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.HbbmpWD_1590054623; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HbbmpWD_1590054623)
 by smtp.aliyun-inc.com(10.147.41.143);
 Thu, 21 May 2020 17:50:23 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 03/62] target/riscv: support vector extension csr
Date: Thu, 21 May 2020 17:43:14 +0800
Message-Id: <20200521094413.10425-4-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 05:19:14
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: richard.henderson@linaro.org, wxy194768@alibaba-inc.com,
 wenmeng_zhang@c-sky.com, alistair.francis@wdc.com, palmer@dabbelt.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The v0.7.1 specification does not define vector status within mstatus.
A future revision will define the privileged portion of the vector status.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h | 15 +++++++++
 target/riscv/csr.c      | 75 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7f64ee1174..8117e8b5a7 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -29,6 +29,14 @@
 #define FSR_NXA             (FPEXC_NX << FSR_AEXC_SHIFT)
 #define FSR_AEXC            (FSR_NVA | FSR_OFA | FSR_UFA | FSR_DZA | FSR_NXA)
 
+/* Vector Fixed-Point round model */
+#define FSR_VXRM_SHIFT      9
+#define FSR_VXRM            (0x3 << FSR_VXRM_SHIFT)
+
+/* Vector Fixed-Point saturation flag */
+#define FSR_VXSAT_SHIFT     8
+#define FSR_VXSAT           (0x1 << FSR_VXSAT_SHIFT)
+
 /* Control and Status Registers */
 
 /* User Trap Setup */
@@ -48,6 +56,13 @@
 #define CSR_FRM             0x002
 #define CSR_FCSR            0x003
 
+/* User Vector CSRs */
+#define CSR_VSTART          0x008
+#define CSR_VXSAT           0x009
+#define CSR_VXRM            0x00a
+#define CSR_VL              0xc20
+#define CSR_VTYPE           0xc21
+
 /* User Timers and Counters */
 #define CSR_CYCLE           0xc00
 #define CSR_TIME            0xc01
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 11d184cd16..d71c49dfff 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -46,6 +46,10 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 static int fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
+    /* loose check condition for fcsr in vector extension */
+    if ((csrno == CSR_FCSR) && (env->misa & RVV)) {
+        return 0;
+    }
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -1;
     }
@@ -53,6 +57,14 @@ static int fs(CPURISCVState *env, int csrno)
     return 0;
 }
 
+static int vs(CPURISCVState *env, int csrno)
+{
+    if (env->misa & RVV) {
+        return 0;
+    }
+    return -1;
+}
+
 static int ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -174,6 +186,10 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 #endif
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
+    if (vs(env, csrno) >= 0) {
+        *val |= (env->vxrm << FSR_VXRM_SHIFT)
+                | (env->vxsat << FSR_VXSAT_SHIFT);
+    }
     return 0;
 }
 
@@ -186,10 +202,62 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
     env->mstatus |= MSTATUS_FS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
+    if (vs(env, csrno) >= 0) {
+        env->vxrm = (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
+        env->vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
+    }
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
     return 0;
 }
 
+static int read_vtype(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vtype;
+    return 0;
+}
+
+static int read_vl(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vl;
+    return 0;
+}
+
+static int read_vxrm(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vxrm;
+    return 0;
+}
+
+static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vxrm = val;
+    return 0;
+}
+
+static int read_vxsat(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vxsat;
+    return 0;
+}
+
+static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vxsat = val;
+    return 0;
+}
+
+static int read_vstart(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vstart;
+    return 0;
+}
+
+static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vstart = val;
+    return 0;
+}
+
 /* User Timers and Counters */
 static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -1269,7 +1337,12 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_FFLAGS] =              { fs,   read_fflags,      write_fflags      },
     [CSR_FRM] =                 { fs,   read_frm,         write_frm         },
     [CSR_FCSR] =                { fs,   read_fcsr,        write_fcsr        },
-
+    /* Vector CSRs */
+    [CSR_VSTART] =              { vs,   read_vstart,      write_vstart      },
+    [CSR_VXSAT] =               { vs,   read_vxsat,       write_vxsat       },
+    [CSR_VXRM] =                { vs,   read_vxrm,        write_vxrm        },
+    [CSR_VL] =                  { vs,   read_vl                             },
+    [CSR_VTYPE] =               { vs,   read_vtype                          },
     /* User Timers and Counters */
     [CSR_CYCLE] =               { ctr,  read_instret                        },
     [CSR_INSTRET] =             { ctr,  read_instret                        },
-- 
2.23.0


