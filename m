Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9226B4C21
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 17:07:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pafEG-00031f-ES; Fri, 10 Mar 2023 11:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pafE0-0002p2-Rh
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:04:08 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pafDx-0006c2-NN
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:04:08 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pafDk-00H4ad-Sk; Fri, 10 Mar 2023 16:03:52 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org
Subject: [PATCH 14/45] target/riscv: Add vandn.[vv, vx] decoding,
 translation and execution support
Date: Fri, 10 Mar 2023 16:03:15 +0000
Message-Id: <20230310160346.1193597-15-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310160346.1193597-1-lawrence.hunter@codethink.co.uk>
References: <20230310160346.1193597-1-lawrence.hunter@codethink.co.uk>
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

From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>

Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
---
 accel/tcg/tcg-runtime-gvec.c               | 11 +++++++
 accel/tcg/tcg-runtime.h                    |  1 +
 target/riscv/helper.h                      |  9 ++++++
 target/riscv/insn32.decode                 |  2 ++
 target/riscv/insn_trans/trans_rvzvkb.c.inc | 34 ++++++++++++++++++++++
 target/riscv/vcrypto_helper.c              | 19 ++++++++++++
 6 files changed, 76 insertions(+)

diff --git a/accel/tcg/tcg-runtime-gvec.c b/accel/tcg/tcg-runtime-gvec.c
index ac7d28c251..322dcc0687 100644
--- a/accel/tcg/tcg-runtime-gvec.c
+++ b/accel/tcg/tcg-runtime-gvec.c
@@ -550,6 +550,17 @@ void HELPER(gvec_ands)(void *d, void *a, uint64_t b, uint32_t desc)
     clear_high(d, oprsz, desc);
 }
 
+void HELPER(gvec_andsc)(void *d, void *a, uint64_t b, uint32_t desc)
+{
+    intptr_t oprsz = simd_oprsz(desc);
+    intptr_t i;
+
+    for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
+        *(uint64_t *)(d + i) = *(uint64_t *)(a + i) & ~b;
+    }
+    clear_high(d, oprsz, desc);
+}
+
 void HELPER(gvec_xors)(void *d, void *a, uint64_t b, uint32_t desc)
 {
     intptr_t oprsz = simd_oprsz(desc);
diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index e141a6ab24..d086200483 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -217,6 +217,7 @@ DEF_HELPER_FLAGS_4(gvec_nor, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_eqv, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_ands, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(gvec_andsc, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(gvec_xors, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(gvec_ors, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b4baa22692..1bc10ca5be 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1177,3 +1177,12 @@ DEF_HELPER_5(vbrev8_v_b, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vbrev8_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vbrev8_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vbrev8_v_d, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_6(vandn_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vandn_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vandn_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vandn_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vandn_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vandn_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vandn_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vandn_vx_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index bdefcd3fa2..bbf128e4dc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -923,3 +923,5 @@ vror_vx         010100 . ..... ..... 100 ..... 1010111 @r_vm
 vror_vi         01010. . ..... ..... 011 ..... 1010111 @r2_zimm6
 vbrev8_v        010010 . ..... 01000 010 ..... 1010111 @r2_vm
 vrev8_v         010010 . ..... 01001 010 ..... 1010111 @r2_vm
+vandn_vv        000001 . ..... ..... 000 ..... 1010111 @r_vm
+vandn_vx        000001 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvzvkb.c.inc b/target/riscv/insn_trans/trans_rvzvkb.c.inc
index 77ba8bc713..a9a820ec0a 100644
--- a/target/riscv/insn_trans/trans_rvzvkb.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkb.c.inc
@@ -146,6 +146,40 @@ GEN_OPIVV_GVEC_TRANS_CHECK(vror_vv, rotrv, zvkb_vv_check)
 GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vror_vx, rotrs, zvkb_vx_check)
 GEN_OPIVI_GVEC_TRANS_CHECK(vror_vi, IMM_ZIMM6, vror_vx, rotri, zvkb_vx_check)
 
+
+static void tcg_gen_gvec_andsc(unsigned vece, uint32_t dofs, uint32_t aofs,
+                               TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
+{
+    static GVecGen2s g = {
+        .fni8 = tcg_gen_andc_i64,
+        .fniv = tcg_gen_andc_vec,
+        .fno = gen_helper_gvec_andsc,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+    };
+
+    g.vece = vece;
+
+    tcg_gen_dup_i64(vece, c, c);
+    tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, c, &g);
+}
+
+#define GEN_OPIVX_GVEC_TRANS_CHECK(NAME, SUF, CHECK)                 \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)               \
+{                                                                    \
+    if (CHECK(s, a)) {                                               \
+        static gen_helper_opivx * const fns[4] = {                   \
+            gen_helper_##NAME##_b, gen_helper_##NAME##_h,            \
+            gen_helper_##NAME##_w, gen_helper_##NAME##_d,            \
+        };                                                           \
+        return do_opivx_gvec(s, a, tcg_gen_gvec_##SUF, fns[s->sew]); \
+    }                                                                \
+    return false;                                                    \
+}
+
+/* vandn.v[vx] */
+GEN_OPIVV_GVEC_TRANS_CHECK(vandn_vv, andc, zvkb_vv_check)
+GEN_OPIVX_GVEC_TRANS_CHECK(vandn_vx, andsc, zvkb_vx_check)
+
 #define GEN_OPIV_TRANS(NAME, CHECK)                                    \
 static bool trans_##NAME(DisasContext *s, arg_rmr * a)                 \
 {                                                                      \
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index ecf21c50f8..7d2a355418 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -125,3 +125,22 @@ GEN_VEXT_V(vrev8_v_b, 1)
 GEN_VEXT_V(vrev8_v_h, 2)
 GEN_VEXT_V(vrev8_v_w, 4)
 GEN_VEXT_V(vrev8_v_d, 8)
+
+#define DO_ANDN(a, b) ((a) & ~(b))
+RVVCALL(OPIVV2, vandn_vv_b, OP_UUU_B, H1, H1, H1, DO_ANDN)
+RVVCALL(OPIVV2, vandn_vv_h, OP_UUU_H, H2, H2, H2, DO_ANDN)
+RVVCALL(OPIVV2, vandn_vv_w, OP_UUU_W, H4, H4, H4, DO_ANDN)
+RVVCALL(OPIVV2, vandn_vv_d, OP_UUU_D, H8, H8, H8, DO_ANDN)
+GEN_VEXT_VV(vandn_vv_b, 1)
+GEN_VEXT_VV(vandn_vv_h, 2)
+GEN_VEXT_VV(vandn_vv_w, 4)
+GEN_VEXT_VV(vandn_vv_d, 8)
+
+RVVCALL(OPIVX2, vandn_vx_b, OP_UUU_B, H1, H1, DO_ANDN)
+RVVCALL(OPIVX2, vandn_vx_h, OP_UUU_H, H2, H2, DO_ANDN)
+RVVCALL(OPIVX2, vandn_vx_w, OP_UUU_W, H4, H4, DO_ANDN)
+RVVCALL(OPIVX2, vandn_vx_d, OP_UUU_D, H8, H8, DO_ANDN)
+GEN_VEXT_VX(vandn_vx_b, 1)
+GEN_VEXT_VX(vandn_vx_h, 2)
+GEN_VEXT_VX(vandn_vx_w, 4)
+GEN_VEXT_VX(vandn_vx_d, 8)
-- 
2.39.2


