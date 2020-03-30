Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D47919826B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 19:33:26 +0200 (CEST)
Received: from localhost ([::1]:53906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIyHt-0007BB-AJ
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 13:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIyGM-0005Kk-3A
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 13:31:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIyGK-0006NM-Hs
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 13:31:50 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:41093)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jIyGJ-0006De-GV; Mon, 30 Mar 2020 13:31:48 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1080747|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.0456766-0.00102193-0.953301;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03278; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.H7lv6iE_1585589499; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H7lv6iE_1585589499)
 by smtp.aliyun-inc.com(10.147.40.233);
 Tue, 31 Mar 2020 01:31:39 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v7 57/61] target/riscv: floating-point scalar move instructions
Date: Mon, 30 Mar 2020 23:36:29 +0800
Message-Id: <20200330153633.15298-58-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200330153633.15298-1-zhiwei_liu@c-sky.com>
References: <20200330153633.15298-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
Cc: guoren@linux.alibaba.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com, wenmeng_zhang@c-sky.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn32.decode              |  2 +
 target/riscv/insn_trans/trans_rvv.inc.c | 54 +++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0741a25540..79f9b37b29 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -563,6 +563,8 @@ viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
+vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
+vfmv_s_f        001101 1 00000 ..... 101 ..... 1010111 @r2
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 61c46e4c1c..dff61acca8 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2724,3 +2724,57 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
     }
     return false;
 }
+
+/* Floating-Point Scalar Move Instructions */
+static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
+{
+    if (!s->vill && has_ext(s, RVF) &&
+        (s->mstatus_fs != 0) && (s->sew != 0)) {
+        unsigned int ofs = (8 << s->sew);
+        unsigned int len = 64 - ofs;
+        TCGv_i64 t_nan;
+
+        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0);
+        /* NaN-box f[rd] as necessary for SEW */
+        if (len) {
+            t_nan = tcg_const_i64(UINT64_MAX);
+            tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
+                                t_nan, ofs, len);
+            tcg_temp_free_i64(t_nan);
+        }
+
+        mark_fs_dirty(s);
+        return true;
+    }
+    return false;
+}
+
+/* vfmv.s.f vd, rs1 # vd[0] = rs1 (vs2=0) */
+static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
+{
+    if (!s->vill && has_ext(s, RVF) && (s->sew != 0)) {
+        TCGv_i64 t1;
+        /* The instructions ignore LMUL and vector register group. */
+        uint32_t vlmax = s->vlen >> 3;
+
+        /* if vl == 0, skip vector register write back */
+        TCGLabel *over = gen_new_label();
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+        /* zeroed all elements */
+        tcg_gen_gvec_dup64i(vreg_ofs(s, a->rd), vlmax, vlmax, 0);
+
+        /* NaN-box f[rs1] as necessary for SEW */
+        t1 = tcg_temp_new_i64();
+        if (s->sew == MO_64 && !has_ext(s, RVD)) {
+            tcg_gen_ori_i64(t1, cpu_fpr[a->rs1], 0xffffffff00000000ULL);
+        } else {
+            tcg_gen_mov_i64(t1, cpu_fpr[a->rs1]);
+        }
+        vec_element_storei(s, a->rd, 0, t1);
+        tcg_temp_free_i64(t1);
+        gen_set_label(over);
+        return true;
+    }
+    return false;
+}
-- 
2.23.0


