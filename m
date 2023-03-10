Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF786B4C28
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 17:08:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pafDu-0002io-Ie; Fri, 10 Mar 2023 11:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pafDp-0002dc-9p
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:03:57 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pafDn-0006ax-1X
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:03:56 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pafDi-00H4ad-Dp; Fri, 10 Mar 2023 16:03:50 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Subject: [PATCH 05/45] target/riscv: Add vclmul.vx decoding,
 translation and execution support
Date: Fri, 10 Mar 2023 16:03:06 +0000
Message-Id: <20230310160346.1193597-6-lawrence.hunter@codethink.co.uk>
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

Co-authored-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
---
 target/riscv/helper.h                      |  1 +
 target/riscv/insn32.decode                 |  1 +
 target/riscv/insn_trans/trans_rvzvkb.c.inc | 48 ++++++++++++++++++++++
 target/riscv/vcrypto_helper.c              |  2 +
 4 files changed, 52 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 33060c3e2f..352921ead6 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1145,3 +1145,4 @@ DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 
 /* Vector crypto functions */
 DEF_HELPER_6(vclmul_vv, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vclmul_vx, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 03a0057d71..6b8466424d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -911,3 +911,4 @@ czero_nez   0000111  ..... ..... 111 ..... 0110011 @r
 
 # *** RV64 Zvkb vector crypto extension ***
 vclmul_vv       001100 . ..... ..... 010 ..... 1010111 @r_vm
+vclmul_vx       001100 . ..... ..... 110 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvzvkb.c.inc b/target/riscv/insn_trans/trans_rvzvkb.c.inc
index 7cd920e76d..76efade1b6 100644
--- a/target/riscv/insn_trans/trans_rvzvkb.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkb.c.inc
@@ -38,3 +38,51 @@ static bool vclmul_vv_check(DisasContext *s, arg_rmrr *a)
 }
 
 GEN_VV_MASKED_TRANS(vclmul_vv, vclmul_vv_check)
+
+#define GEN_VX_MASKED_TRANS(NAME, CHECK)                                \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                  \
+{                                                                       \
+    if (CHECK(s, a)) {                                                  \
+        TCGv_ptr rd_v, v0_v, rs2_v;                                     \
+        TCGv rs1;                                                       \
+        TCGv_i32 desc;                                                  \
+        uint32_t data = 0;                                              \
+                                                                        \
+        TCGLabel *over = gen_new_label();                               \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);      \
+                                                                        \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                      \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                  \
+        data = FIELD_DP32(data, VDATA, VTA, s->vta);                    \
+        data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);  \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);                    \
+                                                                        \
+        rd_v = tcg_temp_new_ptr();                                      \
+        v0_v = tcg_temp_new_ptr();                                      \
+        rs1 = get_gpr(s, a->rs1, EXT_ZERO);                             \
+        rs2_v = tcg_temp_new_ptr();                                     \
+        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,         \
+                                          s->cfg_ptr->vlen / 8, data)); \
+        tcg_gen_addi_ptr(rd_v, cpu_env, vreg_ofs(s, a->rd));            \
+        tcg_gen_addi_ptr(v0_v, cpu_env, vreg_ofs(s, 0));                \
+        tcg_gen_addi_ptr(rs2_v, cpu_env, vreg_ofs(s, a->rs2));          \
+        gen_helper_##NAME(rd_v, v0_v, rs1, rs2_v, cpu_env, desc);       \
+                                                                        \
+        mark_vs_dirty(s);                                               \
+        gen_set_label(over);                                            \
+        return true;                                                    \
+    }                                                                   \
+    return false;                                                       \
+}
+
+static bool zvkb_vx_check(DisasContext *s, arg_rmrr *a)
+{
+    return opivx_check(s, a) && s->cfg_ptr->ext_zvkb == true;
+}
+
+static bool vclmul_vx_check(DisasContext *s, arg_rmrr *a)
+{
+    return zvkb_vx_check(s, a) && s->sew == MO_64;
+}
+
+GEN_VX_MASKED_TRANS(vclmul_vx, vclmul_vx_check)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index b4983886bd..749a9cb30b 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -40,3 +40,5 @@ static uint64_t clmul64(uint64_t y, uint64_t x)
 
 RVVCALL(OPIVV2, vclmul_vv, OP_UUU_D, H8, H8, H8, clmul64)
 GEN_VEXT_VV(vclmul_vv, 8)
+RVVCALL(OPIVX2, vclmul_vx, OP_UUU_D, H8, H8, clmul64)
+GEN_VEXT_VX(vclmul_vx, 8)
-- 
2.39.2


