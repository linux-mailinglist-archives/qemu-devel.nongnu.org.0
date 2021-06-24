Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5113B2DB6
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:20:35 +0200 (CEST)
Received: from localhost ([::1]:39876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNPO-0006BQ-TI
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNAc-00089z-FW; Thu, 24 Jun 2021 07:05:18 -0400
Received: from out28-51.mail.aliyun.com ([115.124.28.51]:38599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNAY-00027Z-UA; Thu, 24 Jun 2021 07:05:18 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0760933|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.547673-7.80372e-05-0.452249;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXJySTa_1624532705; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXJySTa_1624532705)
 by smtp.aliyun-inc.com(10.147.40.26); Thu, 24 Jun 2021 19:05:05 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 17/37] target/riscv: Signed 16-bit Multiply 32-bit
 Add/Subtract Instructions
Date: Thu, 24 Jun 2021 18:55:01 +0800
Message-Id: <20210624105521.3964-18-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.51; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-51.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Always contain a signed 16x16 multiply and the 32-bit result can be
written to the destination register or as an operand for an add/subtract
operation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  19 ++
 target/riscv/insn32.decode              |  19 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  20 ++
 target/riscv/packed_helper.c            | 268 ++++++++++++++++++++++++
 4 files changed, 326 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 854f48d385..5aac6ba578 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1297,3 +1297,22 @@ DEF_HELPER_4(kmmawb2, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmmawb2_u, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmmawt2, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmmawt2_u, tl, env, tl, tl, tl)
+
+DEF_HELPER_3(smbb16, tl, env, tl, tl)
+DEF_HELPER_3(smbt16, tl, env, tl, tl)
+DEF_HELPER_3(smtt16, tl, env, tl, tl)
+DEF_HELPER_3(kmda, tl, env, tl, tl)
+DEF_HELPER_3(kmxda, tl, env, tl, tl)
+DEF_HELPER_3(smds, tl, env, tl, tl)
+DEF_HELPER_3(smdrs, tl, env, tl, tl)
+DEF_HELPER_3(smxds, tl, env, tl, tl)
+DEF_HELPER_4(kmabb, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmabt, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmatt, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmada, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmaxda, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmads, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmadrs, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmaxds, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmsda, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmsxda, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e5a8f663dc..f590880750 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -900,3 +900,22 @@ kmmawb2    1100111  ..... ..... 001 ..... 1110111 @r
 kmmawb2_u  1101111  ..... ..... 001 ..... 1110111 @r
 kmmawt2    1110111  ..... ..... 001 ..... 1110111 @r
 kmmawt2_u  1111111  ..... ..... 001 ..... 1110111 @r
+
+smbb16     0000100  ..... ..... 001 ..... 1110111 @r
+smbt16     0001100  ..... ..... 001 ..... 1110111 @r
+smtt16     0010100  ..... ..... 001 ..... 1110111 @r
+kmda       0011100  ..... ..... 001 ..... 1110111 @r
+kmxda      0011101  ..... ..... 001 ..... 1110111 @r
+smds       0101100  ..... ..... 001 ..... 1110111 @r
+smdrs      0110100  ..... ..... 001 ..... 1110111 @r
+smxds      0111100  ..... ..... 001 ..... 1110111 @r
+kmabb      0101101  ..... ..... 001 ..... 1110111 @r
+kmabt      0110101  ..... ..... 001 ..... 1110111 @r
+kmatt      0111101  ..... ..... 001 ..... 1110111 @r
+kmada      0100100  ..... ..... 001 ..... 1110111 @r
+kmaxda     0100101  ..... ..... 001 ..... 1110111 @r
+kmads      0101110  ..... ..... 001 ..... 1110111 @r
+kmadrs     0110110  ..... ..... 001 ..... 1110111 @r
+kmaxds     0111110  ..... ..... 001 ..... 1110111 @r
+kmsda      0100110  ..... ..... 001 ..... 1110111 @r
+kmsxda     0100111  ..... ..... 001 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index af490a5ef0..308fc223db 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -431,3 +431,23 @@ GEN_RVP_R_ACC_OOL(kmmawb2);
 GEN_RVP_R_ACC_OOL(kmmawb2_u);
 GEN_RVP_R_ACC_OOL(kmmawt2);
 GEN_RVP_R_ACC_OOL(kmmawt2_u);
+
+/* Signed 16-bit Multiply with 32-bit Add/Subtract Instructions */
+GEN_RVP_R_OOL(smbb16);
+GEN_RVP_R_OOL(smbt16);
+GEN_RVP_R_OOL(smtt16);
+GEN_RVP_R_OOL(kmda);
+GEN_RVP_R_OOL(kmxda);
+GEN_RVP_R_OOL(smds);
+GEN_RVP_R_OOL(smdrs);
+GEN_RVP_R_OOL(smxds);
+GEN_RVP_R_ACC_OOL(kmabb);
+GEN_RVP_R_ACC_OOL(kmabt);
+GEN_RVP_R_ACC_OOL(kmatt);
+GEN_RVP_R_ACC_OOL(kmada);
+GEN_RVP_R_ACC_OOL(kmaxda);
+GEN_RVP_R_ACC_OOL(kmads);
+GEN_RVP_R_ACC_OOL(kmadrs);
+GEN_RVP_R_ACC_OOL(kmaxds);
+GEN_RVP_R_ACC_OOL(kmsda);
+GEN_RVP_R_ACC_OOL(kmsxda);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 868a1a71ba..88509fd118 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -1676,3 +1676,271 @@ static inline void do_kmmawt2_u(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR_ACC(kmmawt2_u, 1, 4);
+
+/* Signed 16-bit Multiply with 32-bit Add/Subtract Instruction */
+static inline void do_smbb16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = (int32_t)a[H2(2 * i)] * b[H2(2 * i)];
+}
+
+RVPR(smbb16, 1, 4);
+
+static inline void do_smbt16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = (int32_t)a[H2(2 * i)] * b[H2(2 * i + 1)];
+}
+
+RVPR(smbt16, 1, 4);
+
+static inline void do_smtt16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)];
+}
+
+RVPR(smtt16, 1, 4);
+
+static inline void do_kmda(CPURISCVState *env, void *vd, void *va,
+                           void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    if (a[H2(2 * i)] == INT16_MIN && a[H2(2 * i + 1)] == INT16_MIN &&
+        b[H2(2 * i)] == INT16_MIN && a[H2(2 * i + 1)] == INT16_MIN) {
+        d[H4(i)] = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        d[H4(i)] = (int32_t)a[H2(2 * i)] * b[H2(2 * i)] +
+                   (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)];
+    }
+}
+
+RVPR(kmda, 1, 4);
+
+static inline void do_kmxda(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    if (a[H2(2 * i)] == INT16_MIN && a[H2(2 * i + 1)] == INT16_MIN &&
+        b[H2(2 * i)] == INT16_MIN && a[H2(2 * i + 1)] == INT16_MIN) {
+        d[H4(i)] = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        d[H4(i)] = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i)] +
+                   (int32_t)a[H2(2 * i)] * b[H2(2 * i + 1)];
+    }
+}
+
+RVPR(kmxda, 1, 4);
+
+static inline void do_smds(CPURISCVState *env, void *vd, void *va,
+                           void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)] -
+               (int32_t)a[H2(2 * i)] * b[H2(2 * i)];
+}
+
+RVPR(smds, 1, 4);
+
+static inline void do_smdrs(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = (int32_t)a[H2(2 * i)] * b[H2(2 * i)] -
+               (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)];
+}
+
+RVPR(smdrs, 1, 4);
+
+static inline void do_smxds(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i)] -
+               (int32_t)a[H2(2 * i)] * b[H2(2 * i + 1)];
+}
+
+RVPR(smxds, 1, 4);
+
+static inline void do_kmabb(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = sadd32(env, 0, (int32_t)a[H2(2 * i)] * b[H2(2 * i)], c[H4(i)]);
+}
+
+RVPR_ACC(kmabb, 1, 4);
+
+static inline void do_kmabt(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = sadd32(env, 0, (int32_t)a[H2(2 * i)] * b[H2(2 * i + 1)],
+                      c[H4(i)]);
+}
+
+RVPR_ACC(kmabt, 1, 4);
+
+static inline void do_kmatt(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = sadd32(env, 0, (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)],
+                      c[H4(i)]);
+}
+
+RVPR_ACC(kmatt, 1, 4);
+
+static inline void do_kmada(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    int32_t p1, p2;
+    p1 = (int32_t)a[H2(2 * i)] * b[H2(2 * i)];
+    p2 = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)];
+
+    if (a[H2(i)] == INT16_MIN && a[H2(i + 1)] == INT16_MIN &&
+        b[H2(i)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        if (c[H4(i)] < 0) {
+            d[H4(i)] = INT32_MAX + c[H4(i)] + 1ll;
+        } else {
+            env->vxsat = 0x1;
+            d[H4(i)] = INT32_MAX;
+        }
+    } else {
+        d[H4(i)] = sadd32(env, 0, p1 + p2, c[H4(i)]);
+    }
+}
+
+RVPR_ACC(kmada, 1, 4);
+
+static inline void do_kmaxda(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    int32_t p1, p2;
+    p1 = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i)];
+    p2 = (int32_t)a[H2(2 * i)] * b[H2(2 * i + 1)];
+
+    if (a[H2(2 * i)] == INT16_MIN && a[H2(2 * i + 1)] == INT16_MIN &&
+        b[H2(2 * i)] == INT16_MIN && b[H2(2 * i + 1)] == INT16_MIN) {
+        if (c[H4(i)] < 0) {
+            d[H4(i)] = INT32_MAX + c[H4(i)] + 1ll;
+        } else {
+            env->vxsat = 0x1;
+            d[H4(i)] = INT32_MAX;
+        }
+    } else {
+        d[H4(i)] = sadd32(env, 0, p1 + p2, c[H4(i)]);
+    }
+}
+
+RVPR_ACC(kmaxda, 1, 4);
+
+static inline void do_kmads(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    int32_t p1, p2;
+    p1 =   (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)];
+    p2 =   (int32_t)a[H2(2 * i)] * b[H2(2 * i)];
+
+    d[H4(i)] = sadd32(env, 0, p1 - p2, c[H4(i)]);
+}
+
+RVPR_ACC(kmads, 1, 4);
+
+static inline void do_kmadrs(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void * vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    int32_t p1, p2;
+    p1 = (int32_t)a[H2(2 * i)] * b[H2(2 * i)];
+    p2 = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)];
+
+    d[H4(i)] = sadd32(env, 0, p1 - p2, c[H4(i)]);
+}
+
+RVPR_ACC(kmadrs, 1, 4);
+
+static inline void do_kmaxds(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    int32_t p1, p2;
+    p1 = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i)];
+    p2 = (int32_t)a[H2(2 * i)] * b[H2(2 * i + 1)];
+
+    d[H4(i)] = sadd32(env, 0, p1 - p2, c[H4(i)]);
+}
+
+RVPR_ACC(kmaxds, 1, 4);
+
+static inline void do_kmsda(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    int32_t p1, p2;
+    p1 = (int32_t)a[H2(2 * i)] * b[H2(2 * i)];
+    p2 = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)];
+
+    if (a[H2(i)] == INT16_MIN && a[H2(i + 1)] == INT16_MIN &&
+        b[H2(i)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        if (c[H4(i)] < 0) {
+            env->vxsat = 0x1;
+            d[H4(i)] = INT32_MIN;
+        } else {
+            d[H4(i)] = c[H4(i)] - 1ll - INT32_MAX;
+        }
+    } else {
+        d[H4(i)] = ssub32(env, 0, c[H4(i)], p1 + p2);
+    }
+}
+
+RVPR_ACC(kmsda, 1, 4);
+
+static inline void do_kmsxda(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void * vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    int32_t p1, p2;
+    p1 = (int32_t)a[H2(2 * i)] * b[H2(2 * i + 1)];
+    p2 = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i)];
+
+    if (a[H2(i)] == INT16_MIN && a[H2(i + 1)] == INT16_MIN &&
+        b[H2(i)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        if (d[H4(i)] < 0) {
+            env->vxsat = 0x1;
+            d[H4(i)] = INT32_MIN;
+        } else {
+            d[H4(i)] = c[H4(i)] - 1ll - INT32_MAX;
+        }
+    } else {
+        d[H4(i)] = ssub32(env, 0, c[H4(i)], p1 + p2);
+    }
+}
+
+RVPR_ACC(kmsxda, 1, 4);
-- 
2.17.1


