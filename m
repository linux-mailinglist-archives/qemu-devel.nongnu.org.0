Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82528688058
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:47:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNar2-0005T8-Tk; Thu, 02 Feb 2023 09:46:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYvW-00079G-Kw
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:54 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYvU-0000fl-Le
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:54 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pNYvG-004Q6t-Gk; Thu, 02 Feb 2023 12:42:39 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Subject: [PATCH 13/39] target/riscv: Add vaesef.vs decoding,
 translation and execution support
Date: Thu,  2 Feb 2023 12:42:04 +0000
Message-Id: <20230202124230.295997-14-lawrence.hunter@codethink.co.uk>
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

Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
---
 target/riscv/helper.h                       |  1 +
 target/riscv/insn32.decode                  |  1 +
 target/riscv/insn_trans/trans_rvzvkns.c.inc | 16 +++++++++
 target/riscv/vcrypto_helper.c               | 38 +++++++++++++++++++++
 4 files changed, 56 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index bdfa63302e..42349837ef 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1182,3 +1182,4 @@ DEF_HELPER_6(vandn_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vandn_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 
 DEF_HELPER_4(vaesef_vv, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vaesef_vs, void, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index fdaab9a189..0d65c2ea27 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -911,3 +911,4 @@ vandn_vx        000001 . ..... ..... 100 ..... 1010111 @r_vm
 
 # *** RV64 Zvkns vector crypto extension ***
 vaesef_vv       101000 1 ..... 00011 010 ..... 1110111 @r2_vm_1
+vaesef_vs       101001 1 ..... 00011 010 ..... 1110111 @r2_vm_1
diff --git a/target/riscv/insn_trans/trans_rvzvkns.c.inc b/target/riscv/insn_trans/trans_rvzvkns.c.inc
index 16e2c58001..2317af02a9 100644
--- a/target/riscv/insn_trans/trans_rvzvkns.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkns.c.inc
@@ -37,4 +37,20 @@ static bool vaes_check_vv(DisasContext *s, arg_rmr *a)
            require_align(a->rd, s->lmul) && require_align(a->rs2, s->lmul) &&
            s->vstart % 4 == 0 && s->sew == MO_32;
 }
+
+static bool vaes_check_overlap(DisasContext *s, int vd, int vs2)
+{
+    int8_t op_size = s->lmul <= 0 ? 1 : 1 << s->lmul;
+    return !is_overlapped(vd, op_size, vs2, op_size);
+}
+
+static bool vaes_check_vs(DisasContext *s, arg_rmr *a)
+{
+    return vaes_check_overlap(s, a->rd, a->rs2) &&
+           s->cfg_ptr->ext_zvkns == true && vext_check_isa_ill(s) &&
+           require_align(a->rd, s->lmul) && s->vstart % 4 == 0 &&
+           s->sew == MO_32;
+}
+
 GEN_V_UNMASKED_TRANS(vaesef_vv, vaes_check_vv)
+GEN_V_UNMASKED_TRANS(vaesef_vs, vaes_check_vs)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 59d7d32a05..f59e090c03 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -226,6 +226,44 @@ void HELPER(NAME)(void *vd_vptr, void *vs2_vptr, CPURISCVState *env,      \
     vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);                  \
 }
 
+#define GEN_ZVKNS_HELPER_VS(NAME, ...)                                    \
+void HELPER(NAME)(void *vd_vptr, void *vs2_vptr, CPURISCVState *env,      \
+                  uint32_t desc)                                          \
+{                                                                         \
+    uint64_t *vd = vd_vptr;                                               \
+    uint64_t *vs2 = vs2_vptr;                                             \
+    uint32_t vl = env->vl;                                                \
+    uint32_t total_elems = vext_get_total_elems(env, desc, 4);            \
+    uint32_t vta = vext_vta(desc);                                        \
+    if (env->vl % 4 != 0) {                                               \
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());     \
+    }                                                                     \
+    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {            \
+        uint64_t round_key[2] = {                                         \
+            cpu_to_le64(vs2[0]),                                          \
+            cpu_to_le64(vs2[1]),                                          \
+        };                                                                \
+        uint8_t round_state[4][4];                                        \
+        cpu_to_le64s(vd + i * 2 + 0);                                     \
+        cpu_to_le64s(vd + i * 2 + 1);                                     \
+        for (int j = 0; j < 16; j++) {                                    \
+            round_state[j / 4][j % 4] = ((uint8_t *)(vd + i * 2))[j];     \
+        }                                                                 \
+        __VA_ARGS__;                                                      \
+        for (int j = 0; j < 16; j++) {                                    \
+            ((uint8_t *)(vd + i * 2))[j] = round_state[j / 4][j % 4];     \
+        }                                                                 \
+        le64_to_cpus(vd + i * 2 + 0);                                     \
+        le64_to_cpus(vd + i * 2 + 1);                                     \
+    }                                                                     \
+    env->vstart = 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);                  \
+}
+
 GEN_ZVKNS_HELPER_VV(vaesef_vv, aes_sub_bytes(round_state);
                     aes_shift_bytes(round_state);
                     xor_round_key(round_state, (uint8_t *)round_key);)
+GEN_ZVKNS_HELPER_VS(vaesef_vs, aes_sub_bytes(round_state);
+                    aes_shift_bytes(round_state);
+                    xor_round_key(round_state, (uint8_t *)round_key);)
-- 
2.39.1


