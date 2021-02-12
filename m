Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA3A31A27E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 17:20:45 +0100 (CET)
Received: from localhost ([::1]:48820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAbBU-0003fq-C5
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 11:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAb8Q-0001Me-3M; Fri, 12 Feb 2021 11:17:35 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:59570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAb8N-0001Xd-N7; Fri, 12 Feb 2021 11:17:33 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0849681|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.0260123-0.00166463-0.972323;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHdljU_1613146627; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHdljU_1613146627)
 by smtp.aliyun-inc.com(10.147.42.135);
 Sat, 13 Feb 2021 00:17:08 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 36/38] target/riscv: RV64 Only Non-SIMD 32-bit Shift
 Instructions
Date: Fri, 12 Feb 2021 23:02:54 +0800
Message-Id: <20210212150256.885-37-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210212150256.885-1-zhiwei_liu@c-sky.com>
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32-64.decode           |  2 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  3 +++
 target/riscv/packed_helper.c            | 13 +++++++++++++
 4 files changed, 20 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 85290a2b05..d3dd1fb248 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1469,4 +1469,6 @@ DEF_HELPER_4(kmsxda32, tl, env, tl, tl, tl)
 DEF_HELPER_3(smds32, tl, env, tl, tl)
 DEF_HELPER_3(smdrs32, tl, env, tl, tl)
 DEF_HELPER_3(smxds32, tl, env, tl, tl)
+
+DEF_HELPER_3(sraiw_u, tl, env, tl, tl)
 #endif
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index ccdd965963..32066d3ac2 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -164,3 +164,5 @@ kmsxda32   0100111  ..... ..... 010 ..... 1111111 @r
 smds32     0101100  ..... ..... 010 ..... 1111111 @r
 smdrs32    0110100  ..... ..... 010 ..... 1111111 @r
 smxds32    0111100  ..... ..... 010 ..... 1111111 @r
+
+sraiw_u    0011010  ..... ..... 001 ..... 1111111 @sh5
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index d2000bcfb5..57827d2e15 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1212,4 +1212,7 @@ GEN_RVP_R_ACC_OOL(kmsxda32);
 GEN_RVP_R_OOL(smds32);
 GEN_RVP_R_OOL(smdrs32);
 GEN_RVP_R_OOL(smxds32);
+
+/* (RV64 Only) Non-SIMD 32-bit Shift Instructions */
+GEN_RVP_SHIFTI(sraiw_u, sraiw_u, NULL);
 #endif
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index bd24d5145a..69a7788e99 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3805,4 +3805,17 @@ static inline void do_smxds32(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(smxds32, 1, sizeof(target_ulong));
+
+/* (RV64 Only) Non-SIMD 32-bit Shift Instructions */
+static inline void do_sraiw_u(CPURISCVState *env, void *vd, void *va,
+                         void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va;
+    uint8_t shift = *(uint8_t *)vb;
+
+    *d = vssra32(env, 0, a[H4(i)], shift);
+}
+
+RVPR(sraiw_u, 1, sizeof(target_ulong));
 #endif
-- 
2.17.1


