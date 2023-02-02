Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39096688080
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:51:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNaqz-0005SU-Ms; Thu, 02 Feb 2023 09:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYva-0007HR-D2
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:58 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYvV-0000gA-U4
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:56 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pNYvI-004Q6t-HZ; Thu, 02 Feb 2023 12:42:41 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org
Subject: [PATCH 21/39] target/riscv: Add vaeskf1.vi decoding,
 translation and execution support
Date: Thu,  2 Feb 2023 12:42:12 +0000
Message-Id: <20230202124230.295997-22-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
References: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URI_NOVOWEL=0.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 02 Feb 2023 09:46:14 -0500
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
 target/riscv/helper.h                       |  1 +
 target/riscv/insn32.decode                  |  1 +
 target/riscv/insn_trans/trans_rvzvkns.c.inc | 45 +++++++++++++++++++++
 target/riscv/vcrypto_helper.c               | 42 +++++++++++++++++++
 4 files changed, 89 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 85981f2cad..2ac02dde01 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1190,3 +1190,4 @@ DEF_HELPER_4(vaesem_vs, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesdm_vv, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesdm_vs, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesz_vs, void, ptr, ptr, env, i32)
+DEF_HELPER_5(vaeskf1_vi, void, ptr, ptr, i32, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index cc91ca8794..325e2401c8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -919,3 +919,4 @@ vaesem_vs       101001 1 ..... 00010 010 ..... 1110111 @r2_vm_1
 vaesdm_vv       101000 1 ..... 00000 010 ..... 1110111 @r2_vm_1
 vaesdm_vs       101001 1 ..... 00000 010 ..... 1110111 @r2_vm_1
 vaesz_vs        101001 1 ..... 00111 010 ..... 1110111 @r2_vm_1
+vaeskf1_vi      100010 1 ..... ..... 010 ..... 1110111 @r_vm_1
diff --git a/target/riscv/insn_trans/trans_rvzvkns.c.inc b/target/riscv/insn_trans/trans_rvzvkns.c.inc
index fd79b384ac..27ff4f097c 100644
--- a/target/riscv/insn_trans/trans_rvzvkns.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkns.c.inc
@@ -63,3 +63,48 @@ GEN_V_UNMASKED_TRANS(vaesdm_vs, vaes_check_vs)
 GEN_V_UNMASKED_TRANS(vaesz_vs, vaes_check_vs)
 GEN_V_UNMASKED_TRANS(vaesem_vv, vaes_check_vv)
 GEN_V_UNMASKED_TRANS(vaesem_vs, vaes_check_vs)
+
+#define GEN_VI_UNMASKED_TRANS(NAME, CHECK)                                \
+static bool trans_##NAME(DisasContext *s, arg_##NAME * a)                 \
+{                                                                         \
+    if (CHECK(s, a)) {                                                    \
+        TCGv_ptr rd_v, rs2_v;                                             \
+        TCGv_i32 uimm_v, desc;                                            \
+        uint32_t data = 0;                                                \
+                                                                          \
+        TCGLabel *over = gen_new_label();                                 \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);                 \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);        \
+                                                                          \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                        \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                    \
+        data = FIELD_DP32(data, VDATA, VTA, s->vta);                      \
+        data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);    \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);                      \
+                                                                          \
+        rd_v = tcg_temp_new_ptr();                                        \
+        rs2_v = tcg_temp_new_ptr();                                       \
+        uimm_v = tcg_constant_i32(a->rs1);                                \
+        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,           \
+                                          s->cfg_ptr->vlen / 8, data));   \
+        tcg_gen_addi_ptr(rd_v, cpu_env, vreg_ofs(s, a->rd));              \
+        tcg_gen_addi_ptr(rs2_v, cpu_env, vreg_ofs(s, a->rs2));            \
+        gen_helper_##NAME(rd_v, rs2_v, uimm_v, cpu_env, desc);            \
+        tcg_temp_free_ptr(rd_v);                                          \
+        tcg_temp_free_ptr(rs2_v);                                         \
+        mark_vs_dirty(s);                                                 \
+        gen_set_label(over);                                              \
+        return true;                                                      \
+    }                                                                     \
+    return false;                                                         \
+}
+
+static bool vaeskf1_check(DisasContext *s, arg_vaeskf1_vi * a)
+{
+    return s->cfg_ptr->ext_zvkns == true && vext_check_isa_ill(s) &&
+           s->vstart % 4 == 0 && s->sew == MO_32 &&
+           require_align(a->rd, s->lmul) && require_align(a->rs2, s->lmul) &&
+           a->rs1 >= 1 && a->rs1 <= 10;
+}
+
+GEN_VI_UNMASKED_TRANS(vaeskf1_vi, vaeskf1_check)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 883739f4ac..13ceb705cd 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -363,3 +363,45 @@ GEN_ZVKNS_HELPER_VS(vaesdm_vs, aes_inv_shift_bytes(round_state);
                     aes_inv_mix_cols(round_state);)
 GEN_ZVKNS_HELPER_VS(vaesz_vs,
                     xor_round_key(round_state, (uint8_t *)round_key);)
+
+void HELPER(vaeskf1_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
+                        CPURISCVState *env, uint32_t desc)
+{
+    uint32_t *vd = vd_vptr;
+    uint32_t *vs2 = vs2_vptr;
+    uint32_t vl = env->vl;
+    uint32_t total_elems = vext_get_total_elems(env, desc, 4);
+    uint32_t vta = vext_vta(desc);
+    if (vl % 4 != 0) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
+    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
+        uint32_t rk[8];
+        static const uint32_t rcon[] = {
+                0x01000000, 0x02000000, 0x04000000, 0x08000000, 0x10000000,
+                0x20000000, 0x40000000, 0x80000000, 0x1B000000, 0x36000000,
+        };
+
+        rk[0] = bswap32(vs2[i * 4 + H4(0)]);
+        rk[1] = bswap32(vs2[i * 4 + H4(1)]);
+        rk[2] = bswap32(vs2[i * 4 + H4(2)]);
+        rk[3] = bswap32(vs2[i * 4 + H4(3)]);
+
+        rk[4] = rk[0] ^ (AES_Te4[(rk[3] >> 16) & 0xff] & 0xff000000) ^
+                (AES_Te4[(rk[3] >> 8) & 0xff] & 0x00ff0000) ^
+                (AES_Te4[(rk[3] >> 0) & 0xff] & 0x0000ff00) ^
+                (AES_Te4[(rk[3] >> 24) & 0xff] & 0x000000ff) ^ rcon[uimm - 1];
+        rk[5] = rk[1] ^ rk[4];
+        rk[6] = rk[2] ^ rk[5];
+        rk[7] = rk[3] ^ rk[6];
+
+        vd[i * 4 + H4(0)] = bswap32(rk[4]);
+        vd[i * 4 + H4(1)] = bswap32(rk[5]);
+        vd[i * 4 + H4(2)] = bswap32(rk[6]);
+        vd[i * 4 + H4(3)] = bswap32(rk[7]);
+    }
+    env->vstart = 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);
+}
-- 
2.39.1


