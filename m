Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20436880BF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:54:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNaqx-0005QD-3h; Thu, 02 Feb 2023 09:46:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYva-0007HP-A2
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:58 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYvW-0000gb-PK
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:57 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pNYvJ-004Q6t-GU; Thu, 02 Feb 2023 12:42:42 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org
Subject: [PATCH 25/39] target/riscv: Add vsha2ms.vv decoding,
 translation and execution support
Date: Thu,  2 Feb 2023 12:42:16 +0000
Message-Id: <20230202124230.295997-26-lawrence.hunter@codethink.co.uk>
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

From: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>

Co-authored-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Signed-off-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
---
 target/riscv/helper.h                       |  2 +
 target/riscv/insn32.decode                  |  3 +
 target/riscv/insn_trans/trans_rvzvknh.c.inc | 45 ++++++++++++
 target/riscv/translate.c                    |  1 +
 target/riscv/vcrypto_helper.c               | 80 +++++++++++++++++++++
 5 files changed, 131 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzvknh.c.inc

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 312f59bb38..6e7777c879 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1192,3 +1192,5 @@ DEF_HELPER_4(vaesdm_vs, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesz_vs, void, ptr, ptr, env, i32)
 DEF_HELPER_5(vaeskf1_vi, void, ptr, ptr, i32, env, i32)
 DEF_HELPER_5(vaeskf2_vi, void, ptr, ptr, i32, env, i32)
+
+DEF_HELPER_5(vsha2ms_vv, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1eed0a6b26..57fbd63d91 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -921,3 +921,6 @@ vaesdm_vs       101001 1 ..... 00000 010 ..... 1110111 @r2_vm_1
 vaesz_vs        101001 1 ..... 00111 010 ..... 1110111 @r2_vm_1
 vaeskf1_vi      100010 1 ..... ..... 010 ..... 1110111 @r_vm_1
 vaeskf2_vi      101010 1 ..... ..... 010 ..... 1110111 @r_vm_1
+
+# *** RV64 Zvknh vector crypto extension ***
+vsha2ms_vv      101101 1 ..... ..... 010 ..... 1110111 @r_vm_1
diff --git a/target/riscv/insn_trans/trans_rvzvknh.c.inc b/target/riscv/insn_trans/trans_rvzvknh.c.inc
new file mode 100644
index 0000000000..ff30400100
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzvknh.c.inc
@@ -0,0 +1,45 @@
+#define GEN_VV_UNMASKED_TRANS(NAME, CHECK)                             \
+static bool trans_##NAME(DisasContext *s, arg_rmrr * a)                \
+{                                                                      \
+    if (CHECK(s, a)) {                                                 \
+        uint32_t data = 0;                                             \
+        TCGLabel *over = gen_new_label();                              \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);              \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);     \
+                                                                       \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                     \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                 \
+        data = FIELD_DP32(data, VDATA, VTA, s->vta);                   \
+        data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s); \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);                   \
+                                                                       \
+        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                         \
+                           vreg_ofs(s, a->rs1),                        \
+                           vreg_ofs(s, a->rs2), cpu_env,               \
+                           s->cfg_ptr->vlen / 8,                       \
+                           s->cfg_ptr->vlen / 8, data,                 \
+                           gen_helper_##NAME);                         \
+                                                                       \
+        mark_vs_dirty(s);                                              \
+        gen_set_label(over);                                           \
+        return true;                                                   \
+    }                                                                  \
+    return false;                                                      \
+}
+
+static bool vsha_check_sew(DisasContext *s)
+{
+    return (s->cfg_ptr->ext_zvknha == true && s->sew == MO_32) ||
+           (s->cfg_ptr->ext_zvknhb == true &&
+               (s->sew == MO_32 || s->sew == MO_64));
+}
+
+static bool vsha_check(DisasContext *s, arg_rmrr *a)
+{
+    return opivv_check(s, a) &&
+           vsha_check_sew(s) &&
+           s->vstart % 4 == 0 &&
+           s->lmul >= 0;
+}
+
+GEN_VV_UNMASKED_TRANS(vsha2ms_vv, vsha_check)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8d39743de2..924a89de9f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1065,6 +1065,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_rvzvkb.c.inc"
 #include "insn_trans/trans_rvzvkns.c.inc"
+#include "insn_trans/trans_rvzvknh.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 #include "insn_trans/trans_svinval.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 50207b4ff0..af596cce09 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -461,3 +461,83 @@ void HELPER(vaeskf2_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
     /* set tail elements to 1s */
     vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);
 }
+
+static inline uint32_t sig0_sha256(uint32_t x)
+{
+    return ror32(x, 7) ^ ror32(x, 18) ^ (x >> 3);
+}
+
+static inline uint32_t sig1_sha256(uint32_t x)
+{
+    return ror32(x, 17) ^ ror32(x, 19) ^ (x >> 10);
+}
+
+static inline uint64_t sig0_sha512(uint64_t x)
+{
+    return ror64(x, 1) ^ ror64(x, 8) ^ (x >> 7);
+}
+
+static inline uint64_t sig1_sha512(uint64_t x)
+{
+    return ror64(x, 19) ^ ror64(x, 61) ^ (x >> 6);
+}
+
+static inline void vsha2ms_e32(uint32_t *vd, uint32_t *vs1, uint32_t *vs2)
+{
+    uint32_t res[4];
+    res[0] = sig1_sha256(vs2[H4(2)]) + vs1[H4(1)] + sig0_sha256(vd[H4(1)]) +
+        vd[H4(0)];
+    res[1] = sig1_sha256(vs2[H4(3)]) + vs1[H4(2)] + sig0_sha256(vd[H4(2)]) +
+        vd[H4(1)];
+    res[2] = sig1_sha256(res[0]) + vs1[H4(3)] + sig0_sha256(vd[H4(3)]) +
+        vd[H4(2)];
+    res[3] = sig1_sha256(res[1]) + vs2[H4(0)] + sig0_sha256(vs1[H4(0)]) +
+        vd[H4(3)];
+    vd[H4(3)] = res[3];
+    vd[H4(2)] = res[2];
+    vd[H4(1)] = res[1];
+    vd[H4(0)] = res[0];
+}
+
+static inline void vsha2ms_e64(uint64_t *vd, uint64_t *vs1, uint64_t *vs2)
+{
+    uint64_t res[4];
+    res[0] = sig1_sha512(vs2[2]) + vs1[1] + sig0_sha512(vd[1]) + vd[0];
+    res[1] = sig1_sha512(vs2[3]) + vs1[2] + sig0_sha512(vd[2]) + vd[1];
+    res[2] = sig1_sha512(res[0]) + vs1[3] + sig0_sha512(vd[3]) + vd[2];
+    res[3] = sig1_sha512(res[1]) + vs2[0] + sig0_sha512(vs1[0]) + vd[3];
+    vd[3] = res[3];
+    vd[2] = res[2];
+    vd[1] = res[1];
+    vd[0] = res[0];
+}
+
+void HELPER(vsha2ms_vv)(void *vd, void *vs1, void *vs2, CPURISCVState *env,
+                        uint32_t desc)
+{
+    uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
+    uint32_t esz = 0;
+    uint32_t total_elems;
+    uint32_t vta = vext_vta(desc);
+
+    if (env->vl % 4 != 0) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
+    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
+        if (sew == MO_32) {
+            esz = 4;
+            vsha2ms_e32(((uint32_t *)vd) + i * 4, ((uint32_t *)vs1) + i * 4,
+                        ((uint32_t *)vs2) + i * 4);
+        } else {
+            /* If not 32 then SEW should be 64 */
+            esz = 8;
+            vsha2ms_e64(((uint64_t *)vd) + i * 4, ((uint64_t *)vs1) + i * 4,
+                        ((uint64_t *)vs2) + i * 4);
+        }
+    }
+    /* set tail elements to 1s */
+    total_elems = vext_get_total_elems(env, desc, esz);
+    vext_set_elems_1s(vd, vta, env->vl * esz, total_elems * esz);
+    env->vstart = 0;
+}
-- 
2.39.1


