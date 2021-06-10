Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE963A2660
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:15:29 +0200 (CEST)
Received: from localhost ([::1]:42658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrFqa-0002Pz-3p
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFgw-000600-HJ; Thu, 10 Jun 2021 04:05:30 -0400
Received: from out28-172.mail.aliyun.com ([115.124.28.172]:34638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFgt-0000tY-LR; Thu, 10 Jun 2021 04:05:30 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07439879|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.393761-0.0133688-0.59287;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=7; SR=0; TI=SMTPD_---.KQN-o2N_1623312320; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQN-o2N_1623312320)
 by smtp.aliyun-inc.com(10.147.41.120);
 Thu, 10 Jun 2021 16:05:20 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 12/37] target/riscv: SIMD 8-bit Miscellaneous Instructions
Date: Thu, 10 Jun 2021 15:58:43 +0800
Message-Id: <20210610075908.3305506-13-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.172; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-172.mail.aliyun.com
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
Cc: palmer@dabbelt.com, richard.henderson@linaro.org, bin.meng@windriver.com,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instructions include signed or unsigned minimum, maximum,
clip value, absolute value, and leading zero, leading one
count instructions.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  12 +++
 target/riscv/insn32.decode              |  12 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  13 +++
 target/riscv/packed_helper.c            | 115 ++++++++++++++++++++++++
 4 files changed, 152 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 88035aafad..240df8b766 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1243,3 +1243,15 @@ DEF_HELPER_2(kabs16, tl, env, tl)
 DEF_HELPER_2(clrs16, tl, env, tl)
 DEF_HELPER_2(clz16, tl, env, tl)
 DEF_HELPER_2(clo16, tl, env, tl)
+
+DEF_HELPER_3(smin8, tl, env, tl, tl)
+DEF_HELPER_3(umin8, tl, env, tl, tl)
+DEF_HELPER_3(smax8, tl, env, tl, tl)
+DEF_HELPER_3(umax8, tl, env, tl, tl)
+DEF_HELPER_3(sclip8, tl, env, tl, tl)
+DEF_HELPER_3(uclip8, tl, env, tl, tl)
+DEF_HELPER_2(kabs8, tl, env, tl)
+DEF_HELPER_2(clrs8, tl, env, tl)
+DEF_HELPER_2(clz8, tl, env, tl)
+DEF_HELPER_2(clo8, tl, env, tl)
+DEF_HELPER_2(swap8, tl, env, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 847c796874..4c34f0f4f4 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -846,3 +846,15 @@ kabs16     1010110  10001 ..... 000 ..... 1110111 @r2
 clrs16     1010111  01000 ..... 000 ..... 1110111 @r2
 clz16      1010111  01001 ..... 000 ..... 1110111 @r2
 clo16      1010111  01011 ..... 000 ..... 1110111 @r2
+
+smin8      1000100  ..... ..... 000 ..... 1110111 @r
+umin8      1001100  ..... ..... 000 ..... 1110111 @r
+smax8      1000101  ..... ..... 000 ..... 1110111 @r
+umax8      1001101  ..... ..... 000 ..... 1110111 @r
+sclip8     1000110  00... ..... 000 ..... 1110111 @sh3
+uclip8     1000110  10... ..... 000 ..... 1110111 @sh3
+kabs8      1010110  10000 ..... 000 ..... 1110111 @r2
+clrs8      1010111  00000 ..... 000 ..... 1110111 @r2
+clz8       1010111  00001 ..... 000 ..... 1110111 @r2
+clo8       1010111  00011 ..... 000 ..... 1110111 @r2
+swap8      1010110  11000 ..... 000 ..... 1110111 @r2
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 3e6307cdc3..c5ec530fd7 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -335,3 +335,16 @@ GEN_RVP_R2_OOL(kabs16);
 GEN_RVP_R2_OOL(clrs16);
 GEN_RVP_R2_OOL(clz16);
 GEN_RVP_R2_OOL(clo16);
+
+/* SIMD 8-bit Miscellaneous Instructions */
+GEN_RVP_R_OOL(smin8);
+GEN_RVP_R_OOL(umin8);
+GEN_RVP_R_OOL(smax8);
+GEN_RVP_R_OOL(umax8);
+GEN_RVP_SHIFTI(sclip8, NULL, gen_helper_sclip8);
+GEN_RVP_SHIFTI(uclip8, NULL, gen_helper_uclip8);
+GEN_RVP_R2_OOL(kabs8);
+GEN_RVP_R2_OOL(clrs8);
+GEN_RVP_R2_OOL(clz8);
+GEN_RVP_R2_OOL(clo8);
+GEN_RVP_R2_OOL(swap8);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index e4a9463135..3d3d2bf3e4 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -1078,3 +1078,118 @@ static inline void do_clo16(CPURISCVState *env, void *vd, void *va, uint8_t i)
 }
 
 RVPR2(clo16, 1, 2);
+
+/* SIMD 8-bit Miscellaneous Instructions */
+static inline void do_smin8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] < b[i]) ? a[i] : b[i];
+}
+
+RVPR(smin8, 1, 1);
+
+static inline void do_umin8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] < b[i]) ? a[i] : b[i];
+}
+
+RVPR(umin8, 1, 1);
+
+static inline void do_smax8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] > b[i]) ? a[i] : b[i];
+}
+
+RVPR(smax8, 1, 1);
+
+static inline void do_umax8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] > b[i]) ? a[i] : b[i];
+}
+
+RVPR(umax8, 1, 1);
+
+static inline void do_sclip8(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x7;
+
+    d[i] = sat64(env, a[i], shift);
+}
+
+RVPR(sclip8, 1, 1);
+
+static inline void do_uclip8(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x7;
+
+    if (a[i] < 0) {
+        d[i] = 0;
+        env->vxsat = 0x1;
+    } else {
+        d[i] = satu64(env, a[i], shift);
+    }
+}
+
+RVPR(uclip8, 1, 1);
+
+static inline void do_kabs8(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+
+    if (a[i] == INT8_MIN) {
+        d[i] = INT8_MAX;
+        env->vxsat = 0x1;
+    } else {
+        d[i] = abs(a[i]);
+    }
+}
+
+RVPR2(kabs8, 1, 1);
+
+static inline void do_clrs8(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    d[i] = clrsb32(a[i]) - 24;
+}
+
+RVPR2(clrs8, 1, 1);
+
+static inline void do_clz8(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    d[i] = (a[i] < 0) ? 0 : (clz32(a[i]) - 24);
+}
+
+RVPR2(clz8, 1, 1);
+
+static inline void do_clo8(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    d[i] = (a[i] >= 0) ? 0 : (clo32(a[i]) - 24);
+}
+
+RVPR2(clo8, 1, 1);
+
+static inline void do_swap8(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    d[H1(i)] = a[H1(i + 1)];
+    d[H1(i + 1)] = a[H1(i)];
+}
+
+RVPR2(swap8, 2, 1);
-- 
2.25.1


