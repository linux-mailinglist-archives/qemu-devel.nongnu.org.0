Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E02F3B2DFE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:36:26 +0200 (CEST)
Received: from localhost ([::1]:38076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNej-0001fa-CM
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNIu-0007Ol-Pb; Thu, 24 Jun 2021 07:13:52 -0400
Received: from out29-99.mail.aliyun.com ([115.124.29.99]:43033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNIr-0006Hm-Bs; Thu, 24 Jun 2021 07:13:52 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07813078|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.580536-0.00943863-0.410025;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXKdJbJ_1624533223; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKdJbJ_1624533223)
 by smtp.aliyun-inc.com(10.147.42.253);
 Thu, 24 Jun 2021 19:13:43 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 34/37] target/riscv: RV64 Only 32-bit Parallel Multiply &
 Add Instructions
Date: Thu, 24 Jun 2021 18:55:18 +0800
Message-Id: <20210624105521.3964-35-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.29.99; envelope-from=zhiwei_liu@c-sky.com;
 helo=out29-99.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Two 32x32 results written directly to destation register or
as operands added to a 64-bit register.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  12 ++
 target/riscv/insn32.decode              |  12 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  13 ++
 target/riscv/packed_helper.c            | 182 ++++++++++++++++++++++++
 4 files changed, 219 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 05f8f31367..aa80095e1d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1460,3 +1460,15 @@ DEF_HELPER_3(smtt32, i64, env, i64, i64)
 DEF_HELPER_4(kmabb32, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmabt32, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmatt32, tl, env, tl, tl, tl)
+
+DEF_HELPER_3(kmda32, i64, env, i64, i64)
+DEF_HELPER_3(kmxda32, i64, env, i64, i64)
+DEF_HELPER_4(kmaxda32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmads32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmadrs32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmaxds32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmsda32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmsxda32, tl, env, tl, tl, tl)
+DEF_HELPER_3(smds32, i64, env, i64, i64)
+DEF_HELPER_3(smdrs32, i64, env, i64, i64)
+DEF_HELPER_3(smxds32, i64, env, i64, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index dec714a064..b9eeb57ca7 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1083,3 +1083,15 @@ smtt32     0010100  ..... ..... 010 ..... 1110111 @r
 kmabb32    0101101  ..... ..... 010 ..... 1110111 @r
 kmabt32    0110101  ..... ..... 010 ..... 1110111 @r
 kmatt32    0111101  ..... ..... 010 ..... 1110111 @r
+
+kmda32     0011100  ..... ..... 010 ..... 1110111 @r
+kmxda32    0011101  ..... ..... 010 ..... 1110111 @r
+kmaxda32   0100101  ..... ..... 010 ..... 1110111 @r
+kmads32    0101110  ..... ..... 010 ..... 1110111 @r
+kmadrs32   0110110  ..... ..... 010 ..... 1110111 @r
+kmaxds32   0111110  ..... ..... 010 ..... 1110111 @r
+kmsda32    0100110  ..... ..... 010 ..... 1110111 @r
+kmsxda32   0100111  ..... ..... 010 ..... 1110111 @r
+smds32     0101100  ..... ..... 010 ..... 1110111 @r
+smdrs32    0110100  ..... ..... 010 ..... 1110111 @r
+smxds32    0111100  ..... ..... 010 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 2de81abbb8..48bcf37e36 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1131,3 +1131,16 @@ GEN_RVP64_R_OOL(smtt32);
 GEN_RVP64_R_ACC_OOL(kmabb32);
 GEN_RVP64_R_ACC_OOL(kmabt32);
 GEN_RVP64_R_ACC_OOL(kmatt32);
+
+/* (RV64 Only) 32-bit Parallel Multiply & Add Instructions */
+GEN_RVP64_R_OOL(kmda32);
+GEN_RVP64_R_OOL(kmxda32);
+GEN_RVP64_R_ACC_OOL(kmaxda32);
+GEN_RVP64_R_ACC_OOL(kmads32);
+GEN_RVP64_R_ACC_OOL(kmadrs32);
+GEN_RVP64_R_ACC_OOL(kmaxds32);
+GEN_RVP64_R_ACC_OOL(kmsda32);
+GEN_RVP64_R_ACC_OOL(kmsxda32);
+GEN_RVP64_R_OOL(smds32);
+GEN_RVP64_R_OOL(smdrs32);
+GEN_RVP64_R_OOL(smxds32);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 3c05c748c4..834e7dbebb 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3613,3 +3613,185 @@ static inline void do_kmatt32(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR_ACC(kmatt32, 1, 8);
+
+/* (RV64 Only) 32-bit Parallel Multiply & Add Instructions */
+static inline void do_kmda32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va, *b = vb;
+    if (a[H4(i)] == INT32_MIN && b[H4(i)] == INT32_MIN &&
+        a[H4(i + 1)] == INT32_MIN && b[H4(i + 1)] == INT32_MIN) {
+        *d = INT64_MAX;
+        env->vxsat = 0x1;
+    } else {
+        *d = (int64_t)a[H4(i)] * b[H4(i)] +
+             (int64_t)a[H4(i + 1)] * b[H4(i + 1)];
+    }
+}
+
+RVPR64_64_64(kmda32, 1, 8);
+
+static inline void do_kmxda32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va, *b = vb;
+    if (a[H4(i)] == INT32_MIN && b[H4(i)] == INT32_MIN &&
+        a[H4(i + 1)] == INT32_MIN && b[H4(i + 1)] == INT32_MIN) {
+        *d = INT64_MAX;
+        env->vxsat = 0x1;
+    } else {
+        *d = (int64_t)a[H4(i)] * b[H4(i + 1)] +
+             (int64_t)a[H4(i + 1)] * b[H4(i)];
+    }
+}
+
+RVPR64_64_64(kmxda32, 1, 8);
+
+static inline void do_kmaxda32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    int64_t p1, p2;
+    p1 = (int64_t)a[H4(i)] * b[H4(i + 1)];
+    p2 = (int64_t)a[H4(i + 1)] * b[H4(i)];
+
+    if (a[H4(i)] == INT32_MIN && a[H4(i + 1)] == INT32_MIN &&
+        b[H4(i)] == INT32_MIN && b[H4(i + 1)] == INT32_MIN) {
+        if (*d < 0) {
+            *d = (INT64_MAX + *c) + 1ll;
+        } else {
+            env->vxsat = 0x1;
+            *d = INT64_MAX;
+        }
+    } else {
+        *d = sadd64(env, 0, p1 + p2, *c);
+    }
+}
+
+RVPR_ACC(kmaxda32, 1, 8);
+
+static inline void do_kmads32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    int64_t t0, t1;
+    t1 = (int64_t)a[H4(i + 1)] * b[H4(i + 1)];
+    t0 = (int64_t)a[H4(i)] * b[H4(i)];
+
+    *d = sadd64(env, 0, t1 - t0, *c);
+}
+
+RVPR_ACC(kmads32, 1, 8);
+
+static inline void do_kmadrs32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    int64_t t0, t1;
+    t1 = (int64_t)a[H4(i + 1)] * b[H4(i + 1)];
+    t0 = (int64_t)a[H4(i)] * b[H4(i)];
+
+    *d = sadd64(env, 0, t0 - t1, *c);
+}
+
+RVPR_ACC(kmadrs32, 1, 8);
+
+static inline void do_kmaxds32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    int64_t t01, t10;
+    t01 = (int64_t)a[H4(i)] * b[H4(i + 1)];
+    t10 = (int64_t)a[H4(i + 1)] * b[H4(i)];
+
+    *d = sadd64(env, 0, t10 - t01, *c);
+}
+
+RVPR_ACC(kmaxds32, 1, 8);
+
+static inline void do_kmsda32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    int64_t t0, t1;
+    t0 = (int64_t)a[H4(i)] * b[H4(i)];
+    t1 = (int64_t)a[H4(i + 1)] * b[H4(i + 1)];
+
+    if (a[H4(i)] == INT32_MIN && a[H4(i + 1)] == INT32_MIN &&
+        b[H4(i)] == INT32_MIN && b[H4(i + 1)] == INT32_MIN) {
+        if (*c < 0) {
+            env->vxsat = 0x1;
+            *d = INT64_MIN;
+        } else {
+            *d = *c - 1ll - INT64_MAX;
+        }
+    } else {
+        *d = ssub64(env, 0, *c, t0 + t1);
+    }
+}
+
+RVPR_ACC(kmsda32, 1, 8);
+
+static inline void do_kmsxda32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    int64_t t01, t10;
+    t10 = (int64_t)a[H4(i + 1)] * b[H4(i)];
+    t01 = (int64_t)a[H4(i)] * b[H4(i + 1)];
+
+    if (a[H4(i)] == INT32_MIN && a[H4(i + 1)] == INT32_MIN &&
+        b[H4(i)] == INT32_MIN && b[H4(i + 1)] == INT32_MIN) {
+        if (*c < 0) {
+            env->vxsat = 0x1;
+            *d = INT64_MIN;
+        } else {
+            *d = *c - 1ll - INT64_MAX;
+        }
+    } else {
+        *d = ssub64(env, 0, *c, t10 + t01);
+    }
+}
+
+RVPR_ACC(kmsxda32, 1, 8);
+
+static inline void do_smds32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va, *b = vb;
+    *d = (int64_t)a[H4(i + 1)] * b[H4(i + 1)] -
+         (int64_t)a[H4(i)] * b[H4(i)];
+}
+
+RVPR64_64_64(smds32, 1, 8);
+
+static inline void do_smdrs32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va, *b = vb;
+    *d = (int64_t)a[H4(i)] * b[H4(i)] -
+         (int64_t)a[H4(i + 1)] * b[H4(i + 1)];
+}
+
+RVPR64_64_64(smdrs32, 1, 8);
+
+static inline void do_smxds32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va, *b = vb;
+    *d = (int64_t)a[H4(i + 1)] * b[H4(i)] -
+         (int64_t)a[H4(i)] * b[H4(i + 1)];
+}
+
+RVPR64_64_64(smxds32, 1, 8);
-- 
2.17.1


