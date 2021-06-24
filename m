Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9793B2DA4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:18:57 +0200 (CEST)
Received: from localhost ([::1]:33504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNNo-0001iy-9h
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN4A-0003ug-8m; Thu, 24 Jun 2021 06:58:38 -0400
Received: from out28-146.mail.aliyun.com ([115.124.28.146]:39779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN47-0005LU-MQ; Thu, 24 Jun 2021 06:58:37 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07491319|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.510898-0.0177799-0.471322;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXK-di6_1624532309; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXK-di6_1624532309)
 by smtp.aliyun-inc.com(10.147.41.158);
 Thu, 24 Jun 2021 18:58:29 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 04/37] target/riscv: 8-bit Addition & Subtraction
 Instruction
Date: Thu, 24 Jun 2021 18:54:48 +0800
Message-Id: <20210624105521.3964-5-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.146; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-146.mail.aliyun.com
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

Include 5 groups: Wrap-around (dropping overflow), Signed Halving,
Unsigned Halving, Signed Saturation, and Unsigned Saturation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/helper.h                   |  9 +++
 target/riscv/insn32.decode              | 11 ++++
 target/riscv/insn_trans/trans_rvp.c.inc | 13 +++++
 target/riscv/packed_helper.c            | 73 +++++++++++++++++++++++++
 4 files changed, 106 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b6a71ade33..629ff13402 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1179,3 +1179,12 @@ DEF_HELPER_3(rstsa16, tl, env, tl, tl)
 DEF_HELPER_3(urstsa16, tl, env, tl, tl)
 DEF_HELPER_3(kstsa16, tl, env, tl, tl)
 DEF_HELPER_3(ukstsa16, tl, env, tl, tl)
+
+DEF_HELPER_3(radd8, tl, env, tl, tl)
+DEF_HELPER_3(uradd8, tl, env, tl, tl)
+DEF_HELPER_3(kadd8, tl, env, tl, tl)
+DEF_HELPER_3(ukadd8, tl, env, tl, tl)
+DEF_HELPER_3(rsub8, tl, env, tl, tl)
+DEF_HELPER_3(ursub8, tl, env, tl, tl)
+DEF_HELPER_3(ksub8, tl, env, tl, tl)
+DEF_HELPER_3(uksub8, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 57f72fabf6..13e1222296 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -764,3 +764,14 @@ rstsa16    1011011  ..... ..... 010 ..... 1110111 @r
 urstsa16   1101011  ..... ..... 010 ..... 1110111 @r
 kstsa16    1100011  ..... ..... 010 ..... 1110111 @r
 ukstsa16   1110011  ..... ..... 010 ..... 1110111 @r
+
+add8       0100100  ..... ..... 000 ..... 1110111 @r
+radd8      0000100  ..... ..... 000 ..... 1110111 @r
+uradd8     0010100  ..... ..... 000 ..... 1110111 @r
+kadd8      0001100  ..... ..... 000 ..... 1110111 @r
+ukadd8     0011100  ..... ..... 000 ..... 1110111 @r
+sub8       0100101  ..... ..... 000 ..... 1110111 @r
+rsub8      0000101  ..... ..... 000 ..... 1110111 @r
+ursub8     0010101  ..... ..... 000 ..... 1110111 @r
+ksub8      0001101  ..... ..... 000 ..... 1110111 @r
+uksub8     0011101  ..... ..... 000 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 43f395657a..80bec35ac9 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -115,3 +115,16 @@ GEN_RVP_R_OOL(rstsa16);
 GEN_RVP_R_OOL(urstsa16);
 GEN_RVP_R_OOL(kstsa16);
 GEN_RVP_R_OOL(ukstsa16);
+
+/* 8-bit Addition & Subtraction Instructions */
+GEN_RVP_R_INLINE(add8, tcg_gen_vec_add8_tl, tcg_gen_add_tl);
+GEN_RVP_R_INLINE(sub8, tcg_gen_vec_sub8_tl, tcg_gen_sub_tl);
+
+GEN_RVP_R_OOL(radd8);
+GEN_RVP_R_OOL(uradd8);
+GEN_RVP_R_OOL(kadd8);
+GEN_RVP_R_OOL(ukadd8);
+GEN_RVP_R_OOL(rsub8);
+GEN_RVP_R_OOL(ursub8);
+GEN_RVP_R_OOL(ksub8);
+GEN_RVP_R_OOL(uksub8);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index b84abaaf25..62db072204 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -352,3 +352,76 @@ static inline void do_ukstsa16(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(ukstsa16, 2, 2);
+
+/* 8-bit Addition & Subtraction Instructions */
+static inline void do_radd8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+    d[i] = hadd32(a[i], b[i]);
+}
+
+RVPR(radd8, 1, 1);
+
+static inline void do_uradd8(CPURISCVState *env, void *vd, void *va,
+                                  void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+    d[i] = haddu32(a[i], b[i]);
+}
+
+RVPR(uradd8, 1, 1);
+
+static inline void do_kadd8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+    d[i] = sadd8(env, 0, a[i], b[i]);
+}
+
+RVPR(kadd8, 1, 1);
+
+static inline void do_ukadd8(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+    d[i] = saddu8(env, 0, a[i], b[i]);
+}
+
+RVPR(ukadd8, 1, 1);
+
+static inline void do_rsub8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+    d[i] = hsub32(a[i], b[i]);
+}
+
+RVPR(rsub8, 1, 1);
+
+static inline void do_ursub8(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+    d[i] = hsubu64(a[i], b[i]);
+}
+
+RVPR(ursub8, 1, 1);
+
+static inline void do_ksub8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+    d[i] = ssub8(env, 0, a[i], b[i]);
+}
+
+RVPR(ksub8, 1, 1);
+
+static inline void do_uksub8(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+    d[i] = ssubu8(env, 0, a[i], b[i]);
+}
+
+RVPR(uksub8, 1, 1);
-- 
2.17.1


