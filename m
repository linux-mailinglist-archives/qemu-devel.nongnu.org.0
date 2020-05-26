Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F351F1DCC02
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 13:22:02 +0200 (CEST)
Received: from localhost ([::1]:57722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbjH0-0002av-31
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 07:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbjG4-0001wI-3X; Thu, 21 May 2020 07:21:04 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:51708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbjG3-0005Kr-18; Thu, 21 May 2020 07:21:03 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06465977|-1; BR=01201311R291ec; CH=green;
 DM=|OVERLOAD|false|; DS=SPAM|spam_blackmail|0.892561-9.6942e-05-0.107342;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16378; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.HbdypZm_1590060057; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HbdypZm_1590060057)
 by smtp.aliyun-inc.com(10.147.41.231);
 Thu, 21 May 2020 19:20:58 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 48/62] target/riscv: vector single-width floating-point
 reduction instructions
Date: Thu, 21 May 2020 17:43:59 +0800
Message-Id: <20200521094413.10425-49-zhiwei_liu@c-sky.com>
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

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 10 +++++++
 target/riscv/insn32.decode              |  4 +++
 target/riscv/insn_trans/trans_rvv.inc.c |  5 ++++
 target/riscv/vector_helper.c            | 39 +++++++++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index ce31577ea9..17fd02c323 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1073,3 +1073,13 @@ DEF_HELPER_6(vwredsumu_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vwredsum_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vwredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_6(vfredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredsum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredmax_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredmax_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredmax_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredmin_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredmin_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredmin_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b69d804fda..0592075167 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -539,6 +539,10 @@ vredmaxu_vs     000110 . ..... ..... 010 ..... 1010111 @r_vm
 vredmax_vs      000111 . ..... ..... 010 ..... 1010111 @r_vm
 vwredsumu_vs    110000 . ..... ..... 000 ..... 1010111 @r_vm
 vwredsum_vs     110001 . ..... ..... 000 ..... 1010111 @r_vm
+# Vector ordered and unordered reduction sum
+vfredsum_vs     0000-1 . ..... ..... 001 ..... 1010111 @r_vm
+vfredmin_vs     000101 . ..... ..... 001 ..... 1010111 @r_vm
+vfredmax_vs     000111 . ..... ..... 001 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 8d75b3ca84..d74054ff04 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2337,3 +2337,8 @@ GEN_OPIVV_TRANS(vredxor_vs, reduction_check)
 /* Vector Widening Integer Reduction Instructions */
 GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_check)
 GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_check)
+
+/* Vector Single-Width Floating-Point Reduction Instructions */
+GEN_OPFVV_TRANS(vfredsum_vs, reduction_check)
+GEN_OPFVV_TRANS(vfredmax_vs, reduction_check)
+GEN_OPFVV_TRANS(vfredmin_vs, reduction_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 5035e0bb0e..f37b65288a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4416,3 +4416,42 @@ GEN_VEXT_RED(vwredsum_vs_w, int64_t, int32_t, H8, H4, DO_ADD, clearq)
 GEN_VEXT_RED(vwredsumu_vs_b, uint16_t, uint8_t, H2, H1, DO_ADD, clearh)
 GEN_VEXT_RED(vwredsumu_vs_h, uint32_t, uint16_t, H4, H2, DO_ADD, clearl)
 GEN_VEXT_RED(vwredsumu_vs_w, uint64_t, uint32_t, H8, H4, DO_ADD, clearq)
+
+/* Vector Single-Width Floating-Point Reduction Instructions */
+#define GEN_VEXT_FRED(NAME, TD, TS2, HD, HS2, OP, CLEAR_FN)\
+void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
+                  void *vs2, CPURISCVState *env,           \
+                  uint32_t desc)                           \
+{                                                          \
+    uint32_t mlen = vext_mlen(desc);                       \
+    uint32_t vm = vext_vm(desc);                           \
+    uint32_t vl = env->vl;                                 \
+    uint32_t i;                                            \
+    uint32_t tot = env_archcpu(env)->cfg.vlen / 8;         \
+    TD s1 =  *((TD *)vs1 + HD(0));                         \
+                                                           \
+    for (i = 0; i < vl; i++) {                             \
+        TS2 s2 = *((TS2 *)vs2 + HS2(i));                   \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {         \
+            continue;                                      \
+        }                                                  \
+        s1 = OP(s1, (TD)s2, &env->fp_status);              \
+    }                                                      \
+    *((TD *)vd + HD(0)) = s1;                              \
+    CLEAR_FN(vd, 1, sizeof(TD), tot);                      \
+}
+
+/* Unordered sum */
+GEN_VEXT_FRED(vfredsum_vs_h, uint16_t, uint16_t, H2, H2, float16_add, clearh)
+GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add, clearl)
+GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add, clearq)
+
+/* Maximum value */
+GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maxnum, clearh)
+GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maxnum, clearl)
+GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maxnum, clearq)
+
+/* Minimum value */
+GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minnum, clearh)
+GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minnum, clearl)
+GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minnum, clearq)
-- 
2.23.0


