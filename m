Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD53649349A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 06:46:44 +0100 (CET)
Received: from localhost ([::1]:39306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA3nv-0000qw-Bb
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 00:46:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3Ud-0005P4-EG; Wed, 19 Jan 2022 00:26:48 -0500
Received: from out28-76.mail.aliyun.com ([115.124.28.76]:41798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3Ub-0002Bl-H0; Wed, 19 Jan 2022 00:26:47 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08862134|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.00809396-0.000703759-0.991202;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.MfCCb-m_1642569999; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfCCb-m_1642569999)
 by smtp.aliyun-inc.com(10.147.41.120);
 Wed, 19 Jan 2022 13:26:40 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 16/22] target/riscv: Adjust vsetvl according to XLEN
Date: Wed, 19 Jan 2022 13:18:18 +0800
Message-Id: <20220119051824.17494-17-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.76; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-76.mail.aliyun.com
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
 target/riscv/cpu.h           | 5 +++++
 target/riscv/vector_helper.c | 7 +++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6c740b92c1..fe58ccaeae 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -491,6 +491,11 @@ static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
 }
 #endif
 
+static inline int riscv_cpu_xlen(CPURISCVState *env)
+{
+    return 16 << env->xl;
+}
+
 /*
  * Encode LMUL to lmul as follows:
  *     LMUL    vlmul    lmul
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a9484c22ea..8b7c9ec890 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -36,8 +36,11 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     uint64_t lmul = FIELD_EX64(s2, VTYPE, VLMUL);
     uint16_t sew = 8 << FIELD_EX64(s2, VTYPE, VSEW);
     uint8_t ediv = FIELD_EX64(s2, VTYPE, VEDIV);
-    bool vill = FIELD_EX64(s2, VTYPE, VILL);
-    target_ulong reserved = FIELD_EX64(s2, VTYPE, RESERVED);
+    int xlen = riscv_cpu_xlen(env);
+    bool vill = (s2 >> (xlen - 1)) & 0x1;
+    target_ulong reserved = s2 &
+                            MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
+                                            xlen - 1 - R_VTYPE_RESERVED_SHIFT);
 
     if (lmul & 4) {
         /* Fractional LMUL. */
-- 
2.25.1


