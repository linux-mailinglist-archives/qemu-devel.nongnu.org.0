Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EC03B2E04
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:41:33 +0200 (CEST)
Received: from localhost ([::1]:49506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNjg-00014k-I9
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNEa-0007Ad-31; Thu, 24 Jun 2021 07:09:24 -0400
Received: from mail142-29.mail.alibaba.com ([198.11.142.29]:16622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNEW-0004o2-UL; Thu, 24 Jun 2021 07:09:23 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436283|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.524607-0.00375863-0.471634;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXK1QJp_1624532949; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXK1QJp_1624532949)
 by smtp.aliyun-inc.com(10.147.42.197);
 Thu, 24 Jun 2021 19:09:09 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 25/37] target/riscv: Non-SIMD Q31 saturation ALU
 Instructions
Date: Thu, 24 Jun 2021 18:55:09 +0800
Message-Id: <20210624105521.3964-26-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=198.11.142.29; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-29.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q31 saturation is to limit the result to the range
[INT32_MIN, INT32_MAX].

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  15 ++
 target/riscv/insn32.decode              |  16 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  17 ++
 target/riscv/packed_helper.c            | 214 ++++++++++++++++++++++++
 4 files changed, 262 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6ce22a186e..b3485f95a2 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1369,3 +1369,18 @@ DEF_HELPER_3(khmbt, tl, env, tl, tl)
 DEF_HELPER_3(khmtt, tl, env, tl, tl)
 DEF_HELPER_3(ukaddh, tl, env, tl, tl)
 DEF_HELPER_3(uksubh, tl, env, tl, tl)
+
+DEF_HELPER_3(kaddw, tl, env, tl, tl)
+DEF_HELPER_3(ukaddw, tl, env, tl, tl)
+DEF_HELPER_3(ksubw, tl, env, tl, tl)
+DEF_HELPER_3(uksubw, tl, env, tl, tl)
+DEF_HELPER_3(kdmbb, tl, env, tl, tl)
+DEF_HELPER_3(kdmbt, tl, env, tl, tl)
+DEF_HELPER_3(kdmtt, tl, env, tl, tl)
+DEF_HELPER_3(kslraw, tl, env, tl, tl)
+DEF_HELPER_3(kslraw_u, tl, env, tl, tl)
+DEF_HELPER_3(ksllw, tl, env, tl, tl)
+DEF_HELPER_4(kdmabb, tl, env, tl, tl, tl)
+DEF_HELPER_4(kdmabt, tl, env, tl, tl, tl)
+DEF_HELPER_4(kdmatt, tl, env, tl, tl, tl)
+DEF_HELPER_2(kabsw, tl, env, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f465851f03..a25294baab 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -972,3 +972,19 @@ khmbt      0001110  ..... ..... 001 ..... 1110111 @r
 khmtt      0010110  ..... ..... 001 ..... 1110111 @r
 ukaddh     0001010  ..... ..... 001 ..... 1110111 @r
 uksubh     0001011  ..... ..... 001 ..... 1110111 @r
+
+kaddw      0000000  ..... ..... 001 ..... 1110111 @r
+ukaddw     0001000  ..... ..... 001 ..... 1110111 @r
+ksubw      0000001  ..... ..... 001 ..... 1110111 @r
+uksubw     0001001  ..... ..... 001 ..... 1110111 @r
+kdmbb      0000101  ..... ..... 001 ..... 1110111 @r
+kdmbt      0001101  ..... ..... 001 ..... 1110111 @r
+kdmtt      0010101  ..... ..... 001 ..... 1110111 @r
+kslraw     0110111  ..... ..... 001 ..... 1110111 @r
+kslraw_u   0111111  ..... ..... 001 ..... 1110111 @r
+ksllw      0010011  ..... ..... 001 ..... 1110111 @r
+kslliw     0011011  ..... ..... 001 ..... 1110111 @sh5
+kdmabb     1101001  ..... ..... 001 ..... 1110111 @r
+kdmabt     1110001  ..... ..... 001 ..... 1110111 @r
+kdmatt     1111001  ..... ..... 001 ..... 1110111 @r
+kabsw      1010110  10100 ..... 000 ..... 1110111 @r2
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 48eb190bc6..d2c7ab1440 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -681,3 +681,20 @@ GEN_RVP_R_OOL(khmbt);
 GEN_RVP_R_OOL(khmtt);
 GEN_RVP_R_OOL(ukaddh);
 GEN_RVP_R_OOL(uksubh);
+
+/* Non-SIMD Q31 saturation ALU Instructions */
+GEN_RVP_R_OOL(kaddw);
+GEN_RVP_R_OOL(ukaddw);
+GEN_RVP_R_OOL(ksubw);
+GEN_RVP_R_OOL(uksubw);
+GEN_RVP_R_OOL(kdmbb);
+GEN_RVP_R_OOL(kdmbt);
+GEN_RVP_R_OOL(kdmtt);
+GEN_RVP_R_OOL(kslraw);
+GEN_RVP_R_OOL(kslraw_u);
+GEN_RVP_R_OOL(ksllw);
+GEN_RVP_SHIFTI(kslliw, NULL, gen_helper_ksllw);
+GEN_RVP_R_ACC_OOL(kdmabb);
+GEN_RVP_R_ACC_OOL(kdmabt);
+GEN_RVP_R_ACC_OOL(kdmatt);
+GEN_RVP_R2_OOL(kabsw);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 171f88face..89d203730d 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -2604,3 +2604,217 @@ static inline void do_uksubh(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(uksubh, 2, 4);
+
+/* Q31 saturation Instructions */
+static inline void do_kaddw(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int32_t *a = va, *b = vb;
+
+    *d = sadd32(env, 0, a[H4(i)], b[H4(i)]);
+}
+
+RVPR(kaddw, 2, 4);
+
+static inline void do_ukaddw(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    uint32_t *a = va, *b = vb;
+
+    *d = (int32_t)saddu32(env, 0, a[H4(i)], b[H4(i)]);
+}
+
+RVPR(ukaddw, 2, 4);
+
+static inline void do_ksubw(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int32_t *a = va, *b = vb;
+
+    *d = ssub32(env, 0, a[H4(i)], b[H4(i)]);
+}
+
+RVPR(ksubw, 2, 4);
+
+static inline void do_uksubw(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    uint32_t *a = va, *b = vb;
+
+    *d = (int32_t)ssubu32(env, 0, a[H4(i)], b[H4(i)]);
+}
+
+RVPR(uksubw, 2, 4);
+
+static inline void do_kdmbb(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int16_t *a = va, *b = vb;
+
+    if (a[H2(i)] == INT16_MIN && b[H2(i)] == INT16_MIN) {
+        *d = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        *d = (int64_t)a[H2(i)] * b[H2(i)] << 1;
+    }
+}
+
+RVPR(kdmbb, 4, 2);
+
+static inline void do_kdmbt(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int16_t *a = va, *b = vb;
+
+    if (a[H2(i)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        *d = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        *d = (int64_t)a[H2(i)] * b[H2(i + 1)] << 1;
+    }
+}
+
+RVPR(kdmbt, 4, 2);
+
+static inline void do_kdmtt(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int16_t *a = va, *b = vb;
+
+    if (a[H2(i + 1)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        *d = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        *d = (int64_t)a[H2(i + 1)] * b[H2(i + 1)] << 1;
+    }
+}
+
+RVPR(kdmtt, 4, 2);
+
+static inline void do_kslraw(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int32_t *a = va;
+    int32_t shift = sextract32((*(uint32_t *)vb), 0, 6);
+
+    if (shift >= 0) {
+        *d = (int32_t)sat64(env, (int64_t)a[H4(i)] << shift, 31);
+    } else {
+        shift = -shift;
+        shift = (shift == 32) ? 31 : shift;
+        *d = a[H4(i)] >> shift;
+    }
+}
+
+RVPR(kslraw, 2, 4);
+
+static inline void do_kslraw_u(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int32_t *a = va;
+    int32_t shift = sextract32((*(uint32_t *)vb), 0, 6);
+
+    if (shift >= 0) {
+        *d = (int32_t)sat64(env, (int64_t)a[H4(i)] << shift, 31);
+    } else {
+        shift = -shift;
+        shift = (shift == 32) ? 31 : shift;
+        *d = vssra32(env, 0, a[H4(i)], shift);
+    }
+}
+
+RVPR(kslraw_u, 2, 4);
+
+static inline void do_ksllw(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int32_t *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x1f;
+
+    *d = (int32_t)sat64(env, (int64_t)a[H4(i)] << shift, 31);
+}
+
+RVPR(ksllw, 2, 4);
+
+static inline void do_kdmabb(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+
+{
+    target_long *d = vd;
+    int16_t *a = va, *b = vb;
+    int32_t *c = vc, m0;
+
+    if (a[H2(i)] == INT16_MIN && b[H2(i)] == INT16_MIN) {
+        m0 = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        m0 = (int32_t)a[H2(i)] * b[H2(i)] << 1;
+    }
+    *d = sadd32(env, 0, c[H4(i)], m0);
+}
+
+RVPR_ACC(kdmabb, 4, 2);
+
+static inline void do_kdmabt(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+
+{
+    target_long *d = vd;
+    int16_t *a = va, *b = vb;
+    int32_t *c = vc, m0;
+
+    if (a[H2(i)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        m0 = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        m0 = (int32_t)a[H2(i)] * b[H2(i + 1)] << 1;
+    }
+    *d = sadd32(env, 0, c[H4(i)], m0);
+}
+
+RVPR_ACC(kdmabt, 4, 2);
+
+static inline void do_kdmatt(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+
+{
+    target_long *d = vd;
+    int16_t *a = va, *b = vb;
+    int32_t *c = vc, m0;
+
+    if (a[H2(i + 1)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        m0 = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        m0 = (int32_t)a[H2(i + 1)] * b[H2(i + 1)] << 1;
+    }
+    *d = sadd32(env, 0, c[H4(i)], m0);
+}
+
+RVPR_ACC(kdmatt, 4, 2);
+
+static inline void do_kabsw(CPURISCVState *env, void *vd, void *va, uint8_t i)
+
+{
+    target_long *d = vd;
+    int32_t *a = va;
+
+    if (a[H4(i)] == INT32_MIN) {
+        *d = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        *d = (int32_t)abs(a[H4(i)]);
+    }
+}
+
+RVPR2(kabsw, 2, 4);
-- 
2.17.1


