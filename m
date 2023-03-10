Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A496B39E5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:15:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paYnw-0007kD-Pc; Fri, 10 Mar 2023 04:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1paYns-0007iA-GH
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:12:44 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1paYnn-0002Z8-QY
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:12:42 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1paYna-00GpVx-Rs; Fri, 10 Mar 2023 09:12:26 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 William Salmon <will.salmon@codethink.co.uk>
Subject: [PATCH 12/45] target/riscv: Add vbrev8.v decoding,
 translation and execution support
Date: Fri, 10 Mar 2023 09:11:42 +0000
Message-Id: <20230310091215.931644-13-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310091215.931644-1-lawrence.hunter@codethink.co.uk>
References: <20230310091215.931644-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: William Salmon <will.salmon@codethink.co.uk>

Signed-off-by: William Salmon <will.salmon@codethink.co.uk>
---
 target/riscv/helper.h                      |  5 +++
 target/riscv/insn32.decode                 |  1 +
 target/riscv/insn_trans/trans_rvzvkb.c.inc | 38 ++++++++++++++++++++++
 target/riscv/vcrypto_helper.c              | 21 ++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 841cb43f04..625f9872d0 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1168,3 +1168,8 @@ DEF_HELPER_6(vrol_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrol_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrol_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrol_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_5(vbrev8_v_b, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vbrev8_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vbrev8_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vbrev8_v_d, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c557c063df..87473a77c0 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -921,3 +921,4 @@ vrol_vx         010101 . ..... ..... 100 ..... 1010111 @r_vm
 vror_vv         010100 . ..... ..... 000 ..... 1010111 @r_vm
 vror_vx         010100 . ..... ..... 100 ..... 1010111 @r_vm
 vror_vi         01010. . ..... ..... 011 ..... 1010111 @r2_zimm6
+vbrev8_v        010010 . ..... 01000 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvzvkb.c.inc b/target/riscv/insn_trans/trans_rvzvkb.c.inc
index f71383e482..7cd114ae71 100644
--- a/target/riscv/insn_trans/trans_rvzvkb.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkb.c.inc
@@ -145,3 +145,41 @@ GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vrol_vx, rotls, zvkb_vx_check)
 GEN_OPIVV_GVEC_TRANS_CHECK(vror_vv, rotrv, zvkb_vv_check)
 GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vror_vx, rotrs, zvkb_vx_check)
 GEN_OPIVI_GVEC_TRANS_CHECK(vror_vi, IMM_ZIMM6, vror_vx, rotri, zvkb_vx_check)
+
+#define GEN_OPIV_TRANS(NAME, CHECK)                                    \
+static bool trans_##NAME(DisasContext *s, arg_rmr * a)                 \
+{                                                                      \
+    if (CHECK(s, a)) {                                                 \
+        uint32_t data = 0;                                             \
+        static gen_helper_gvec_3_ptr * const fns[4] = {                \
+            gen_helper_##NAME##_b, gen_helper_##NAME##_h,              \
+            gen_helper_##NAME##_w, gen_helper_##NAME##_d,              \
+        };                                                             \
+        TCGLabel *over = gen_new_label();                              \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);     \
+                                                                       \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                     \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                 \
+        data = FIELD_DP32(data, VDATA, VTA, s->vta);                   \
+        data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s); \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);                   \
+        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),         \
+                           vreg_ofs(s, a->rs2), cpu_env,               \
+                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, \
+                           data, fns[s->sew]);                         \
+        mark_vs_dirty(s);                                              \
+        gen_set_label(over);                                           \
+        return true;                                                   \
+    }                                                                  \
+    return false;                                                      \
+}
+
+static bool vxrev8_check(DisasContext *s, arg_rmr *a)
+{
+    return s->cfg_ptr->ext_zvkb == true &&
+           require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ss(s, a->rd, a->rs2, a->vm);
+}
+
+GEN_OPIV_TRANS(vbrev8_v, vxrev8_check)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 30ed9b1270..5d2a995de6 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -93,3 +93,24 @@ GEN_VEXT_VX(vrol_vx_b, 1)
 GEN_VEXT_VX(vrol_vx_h, 2)
 GEN_VEXT_VX(vrol_vx_w, 4)
 GEN_VEXT_VX(vrol_vx_d, 8)
+
+static uint64_t brev8(uint64_t val)
+{
+    val = ((val & 0x5555555555555555ull) << 1)
+        | ((val & 0xAAAAAAAAAAAAAAAAull) >> 1);
+    val = ((val & 0x3333333333333333ull) << 2)
+        | ((val & 0xCCCCCCCCCCCCCCCCull) >> 2);
+    val = ((val & 0x0F0F0F0F0F0F0F0Full) << 4)
+        | ((val & 0xF0F0F0F0F0F0F0F0ull) >> 4);
+
+    return val;
+}
+
+RVVCALL(OPIVV1, vbrev8_v_b, OP_UU_B, H1, H1, brev8)
+RVVCALL(OPIVV1, vbrev8_v_h, OP_UU_H, H2, H2, brev8)
+RVVCALL(OPIVV1, vbrev8_v_w, OP_UU_W, H4, H4, brev8)
+RVVCALL(OPIVV1, vbrev8_v_d, OP_UU_D, H8, H8, brev8)
+GEN_VEXT_V(vbrev8_v_b, 1)
+GEN_VEXT_V(vbrev8_v_h, 2)
+GEN_VEXT_V(vbrev8_v_w, 4)
+GEN_VEXT_V(vbrev8_v_d, 8)
-- 
2.39.2


