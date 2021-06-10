Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEABA3A266C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:18:31 +0200 (CEST)
Received: from localhost ([::1]:52190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrFtW-0000WR-RC
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFkr-0002uQ-5D; Thu, 10 Jun 2021 04:09:33 -0400
Received: from out28-77.mail.aliyun.com ([115.124.28.77]:38064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFkn-00032Y-Di; Thu, 10 Jun 2021 04:09:32 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1146224|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.533591-0.0146714-0.451738;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KQMfKN9_1623312564; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQMfKN9_1623312564)
 by smtp.aliyun-inc.com(10.147.43.230);
 Thu, 10 Jun 2021 16:09:24 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 20/37] target/riscv: 8-bit Multiply with 32-bit Add
 Instructions
Date: Thu, 10 Jun 2021 15:58:51 +0800
Message-Id: <20210610075908.3305506-21-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.77; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-77.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: palmer@dabbelt.com, richard.henderson@linaro.org, bin.meng@windriver.com,
 Alistair.Francis@wdc.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Four "signed or unsigned 8 x signed or unsigned 8" with 32-bit addition
(32 = 32 + 8x8 + 8x8 + 8x8 + 8x8).

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  4 +++
 target/riscv/insn32.decode              |  4 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  5 +++
 target/riscv/packed_helper.c            | 44 +++++++++++++++++++++++++
 4 files changed, 57 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 35c8c61b00..a0e3131512 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1326,3 +1326,7 @@ DEF_HELPER_2(clz32, tl, env, tl)
 DEF_HELPER_2(clo32, tl, env, tl)
 DEF_HELPER_3(pbsad, tl, env, tl, tl)
 DEF_HELPER_4(pbsada, tl, env, tl, tl, tl)
+
+DEF_HELPER_4(smaqa, tl, env, tl, tl, tl)
+DEF_HELPER_4(umaqa, tl, env, tl, tl, tl)
+DEF_HELPER_4(smaqa_su, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ce8bdee34b..96288370a6 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -929,3 +929,7 @@ clz32      1010111  11001 ..... 000 ..... 1110111 @r2
 clo32      1010111  11011 ..... 000 ..... 1110111 @r2
 pbsad      1111110  ..... ..... 000 ..... 1110111 @r
 pbsada     1111111  ..... ..... 000 ..... 1110111 @r
+
+smaqa      1100100  ..... ..... 000 ..... 1110111 @r
+umaqa      1100110  ..... ..... 000 ..... 1110111 @r
+smaqa_su   1100101  ..... ..... 000 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 43e7e5a75d..1a10f13318 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -511,3 +511,8 @@ GEN_RVP_R2_OOL(clz32);
 GEN_RVP_R2_OOL(clo32);
 GEN_RVP_R_OOL(pbsad);
 GEN_RVP_R_ACC_OOL(pbsada);
+
+/* 8-bit Multiply with 32-bit Add Instructions */
+GEN_RVP_R_ACC_OOL(smaqa);
+GEN_RVP_R_ACC_OOL(umaqa);
+GEN_RVP_R_ACC_OOL(smaqa_su);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 1f2b90c394..02178d6e61 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -2044,3 +2044,47 @@ static inline void do_pbsada(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR_ACC(pbsada, 1, 1);
+
+/* 8-bit Multiply with 32-bit Add Instructions */
+static inline void do_smaqa(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int8_t *a = va, *b = vb;
+    int32_t *d = vd, *c = vc;
+
+    d[H4(i)] = c[H4(i)] + a[H1(i * 4)] * b[H1(i * 4)] +
+               a[H1(i * 4 + 1)] * b[H1(i * 4 + 1)] +
+               a[H1(i * 4 + 2)] * b[H1(i * 4 + 2)] +
+               a[H1(i * 4 + 3)] * b[H1(i * 4 + 3)];
+}
+
+RVPR_ACC(smaqa, 1, 4);
+
+static inline void do_umaqa(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    uint8_t *a = va, *b = vb;
+    uint32_t *d = vd, *c = vc;
+
+    d[H4(i)] = c[H4(i)] + a[H1(i * 4)] * b[H1(i * 4)] +
+               a[H1(i * 4 + 1)] * b[H1(i * 4 + 1)] +
+               a[H1(i * 4 + 2)] * b[H1(i * 4 + 2)] +
+               a[H1(i * 4 + 3)] * b[H1(i * 4 + 3)];
+}
+
+RVPR_ACC(umaqa, 1, 4);
+
+static inline void do_smaqa_su(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+{
+    int8_t *a = va;
+    uint8_t *b = vb;
+    int32_t *d = vd, *c = vc;
+
+    d[H4(i)] = c[H4(i)] + a[H1(i * 4)] * b[H1(i * 4)] +
+               a[H1(i * 4 + 1)] * b[H1(i * 4 + 1)] +
+               a[H1(i * 4 + 2)] * b[H1(i * 4 + 2)] +
+               a[H1(i * 4 + 3)] * b[H1(i * 4 + 3)];
+}
+
+RVPR_ACC(smaqa_su, 1, 4);
-- 
2.25.1


