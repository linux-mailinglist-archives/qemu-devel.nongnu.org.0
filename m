Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E11A3A26FB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:27:19 +0200 (CEST)
Received: from localhost ([::1]:52942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrG22-00039k-9Z
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFrJ-0005sz-4N; Thu, 10 Jun 2021 04:16:13 -0400
Received: from mail142-6.mail.alibaba.com ([198.11.142.6]:31847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFrG-0007Fv-JA; Thu, 10 Jun 2021 04:16:12 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1034445|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.55777-0.0156208-0.426609;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047205; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KQNS7wG_1623312960; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQNS7wG_1623312960)
 by smtp.aliyun-inc.com(10.147.41.143);
 Thu, 10 Jun 2021 16:16:01 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 33/37] target/riscv: RV64 Only 32-bit Multiply & Add
 Instructions
Date: Thu, 10 Jun 2021 15:59:04 +0800
Message-Id: <20210610075908.3305506-34-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.6; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-6.mail.alibaba.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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

32x32 multiplication result is added to a third register with Q63 saturation

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  4 ++++
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvp.c.inc |  5 ++++
 target/riscv/packed_helper.c            | 31 +++++++++++++++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 0fa48955d8..05f8f31367 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1456,3 +1456,7 @@ DEF_HELPER_4(kdmatt16, tl, env, tl, tl, tl)
 
 DEF_HELPER_3(smbt32, i64, env, i64, i64)
 DEF_HELPER_3(smtt32, i64, env, i64, i64)
+
+DEF_HELPER_4(kmabb32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmabt32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmatt32, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d06075c062..dec714a064 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1079,3 +1079,7 @@ kdmatt16   1111100  ..... ..... 001 ..... 1110111 @r
 
 smbt32     0001100  ..... ..... 010 ..... 1110111 @r
 smtt32     0010100  ..... ..... 010 ..... 1110111 @r
+
+kmabb32    0101101  ..... ..... 010 ..... 1110111 @r
+kmabt32    0110101  ..... ..... 010 ..... 1110111 @r
+kmatt32    0111101  ..... ..... 010 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index a88ce7a5c4..2de81abbb8 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1126,3 +1126,8 @@ GEN_RVP64_R_ACC_OOL(kdmatt16);
 /* (RV64 Only) 32-bit Multiply Instructions */
 GEN_RVP64_R_OOL(smbt32);
 GEN_RVP64_R_OOL(smtt32);
+
+/* (RV64 Only) 32-bit Multiply & Add Instructions */
+GEN_RVP64_R_ACC_OOL(kmabb32);
+GEN_RVP64_R_ACC_OOL(kmabt32);
+GEN_RVP64_R_ACC_OOL(kmatt32);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index eb086b775f..3c05c748c4 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3582,3 +3582,34 @@ static inline void do_smtt32(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR64_64_64(smtt32, 1, 8);
+
+/* (RV64 Only) 32-bit Multiply & Add Instructions */
+static inline void do_kmabb32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    *d = sadd64(env, 0, (int64_t)a[H4(2 * i)] * b[H4(2 * i)], *c);
+}
+
+RVPR_ACC(kmabb32, 1, 8);
+
+static inline void do_kmabt32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    *d = sadd64(env, 0, (int64_t)a[H4(2 * i)] * b[H4(2 * i + 1)], *c);
+}
+
+RVPR_ACC(kmabt32, 1, 8);
+
+static inline void do_kmatt32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    *d = sadd64(env, 0, (int64_t)a[H4(2 * i + 1)] * b[H4(2 * i + 1)], *c);
+}
+
+RVPR_ACC(kmatt32, 1, 8);
-- 
2.25.1


