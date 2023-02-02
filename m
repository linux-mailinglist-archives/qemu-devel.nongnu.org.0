Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07805688086
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:51:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNarz-00078d-8a; Thu, 02 Feb 2023 09:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNZ24-0002aF-FB
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:49:46 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNZ22-0003KZ-E0
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:49:40 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pNYvN-004Q6t-Ln; Thu, 02 Feb 2023 12:42:46 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH 38/39] target/riscv: Add Zvksed support
Date: Thu,  2 Feb 2023 12:42:29 +0000
Message-Id: <20230202124230.295997-39-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
References: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
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

From: Max Chou <max.chou@sifive.com>

    - add vsm4k, vsm4r instructions

Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
[lawrence.hunter@codethink.co.uk: Moved SM4 functions from
crypto_helper.c to vcrypto_helper.c]
[nazar.kazakov@codethink.co.uk: Added alignment checks, refactored code to
use macros, and minor style changes]
---
 target/riscv/crypto_helper.c                 |   1 +
 target/riscv/helper.h                        |   4 +
 target/riscv/insn32.decode                   |   5 +
 target/riscv/insn_trans/trans_rvzvksed.c.inc |  35 +++++
 target/riscv/translate.c                     |   1 +
 target/riscv/vcrypto_helper.c                | 139 +++++++++++++++++++
 6 files changed, 185 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzvksed.c.inc

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 2ef30281b1..760ce22570 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -23,6 +23,7 @@
 #include "exec/helper-proto.h"
 #include "crypto/aes.h"
 #include "crypto/sm4.h"
+#include "vector_internals.h"
 
 #define AES_XTIME(a) \
     ((a << 1) ^ ((a & 0x80) ? 0x1b : 0))
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6272294d50..07fad2568c 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1201,3 +1201,7 @@ DEF_HELPER_5(vsm3me_vv, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vsm3c_vi, void, ptr, ptr, i32, env, i32)
 
 DEF_HELPER_5(vghmac_vv, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_5(vsm4k_vi, void, ptr, ptr, i32, env, i32)
+DEF_HELPER_4(vsm4r_vv, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vsm4r_vs, void, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ff044f8288..3e83884f43 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -933,3 +933,8 @@ vsm3c_vi        101011 1 ..... ..... 010 ..... 1110111 @r_vm_1
 
 # *** RV64 Zvkg vector crypto extension ***
 vghmac_vv       101100 1 ..... ..... 010 ..... 1110111 @r_vm_1
+
+# *** RV64 Zvksed Standart Extension ***
+vsm4k_vi        100001 1 ..... ..... 010 ..... 1110111 @r_vm_1
+vsm4r_vv        101000 1 ..... 10000 010 ..... 1110111 @r2_vm_1
+vsm4r_vs        101001 1 ..... 10000 010 ..... 1110111 @r2_vm_1
diff --git a/target/riscv/insn_trans/trans_rvzvksed.c.inc b/target/riscv/insn_trans/trans_rvzvksed.c.inc
new file mode 100644
index 0000000000..a30e0862e0
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzvksed.c.inc
@@ -0,0 +1,35 @@
+#define ZVKSED_EGS 4
+
+static bool zvksed_check(DisasContext *s)
+{
+    return s->cfg_ptr->ext_zvksed == true && vext_check_isa_ill(s) &&
+           s->vstart % ZVKSED_EGS == 0 && s->sew == MO_32;
+}
+
+static bool vsm4k_vi_check(DisasContext *s, arg_rmrr *a)
+{
+    return zvksed_check(s) &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs2, s->lmul) &&
+           a->rs1 >= 0 && a->rs1 <= 7;
+}
+
+GEN_VI_UNMASKED_TRANS(vsm4k_vi, vsm4k_vi_check)
+
+static bool vsm4r_vv_check(DisasContext *s, arg_rmr *a)
+{
+    return zvksed_check(s) &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs2, s->lmul);
+}
+
+GEN_V_UNMASKED_TRANS(vsm4r_vv, vsm4r_vv_check)
+
+static bool vsm4r_vs_check(DisasContext *s, arg_rmr *a)
+{
+    return zvksed_check(s) &&
+           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
+           require_align(a->rd, s->lmul);
+}
+
+GEN_V_UNMASKED_TRANS(vsm4r_vs, vsm4r_vs_check)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0bc1c9db65..2ffb1827c5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1068,6 +1068,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvzvknh.c.inc"
 #include "insn_trans/trans_rvzvksh.c.inc"
 #include "insn_trans/trans_rvzvkg.c.inc"
+#include "insn_trans/trans_rvzvksed.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 #include "insn_trans/trans_svinval.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index a309ac3f03..fd9fc3c6d7 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -4,6 +4,7 @@
 #include "qemu/bswap.h"
 #include "cpu.h"
 #include "crypto/aes.h"
+#include "crypto/sm4.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
@@ -872,3 +873,141 @@ void HELPER(vghmac_vv)(void *vd_vptr, void *vs1_vptr, void *vs2_vptr,
     vext_set_elems_1s(vd, vta, env->vl * 4, total_elems * 4);
     env->vstart = 0;
 }
+
+void HELPER(vsm4k_vi)(void *vd, void *vs2, uint32_t uimm5,
+                      CPURISCVState *env, uint32_t desc)
+{
+    const uint32_t egs = 4;
+    uint32_t rnd = uimm5;
+    uint32_t group_start = env->vstart / egs;
+    uint32_t group_end = env->vl / egs;
+    uint32_t esz = sizeof(uint32_t);
+    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
+
+    if (env->vl % egs != 0) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
+    for (uint32_t i = group_start; i < group_end; ++i) {
+        uint32_t vstart = i * egs;
+        uint32_t vend = (i + 1) * egs;
+        uint32_t rk[4] = {0};
+        uint32_t tmp[8] = {0};
+
+        for (uint32_t j = vstart; j < vend; ++j) {
+            rk[j - vstart] = *((uint32_t *)vs2 + H4(j));
+        }
+
+        for (uint32_t j = 0; j < egs; ++j) {
+            tmp[j] = rk[j];
+        }
+
+        for (uint32_t j = 0; j < egs; ++j) {
+            uint32_t b, s;
+            b = tmp[j + 1] ^ tmp[j + 2] ^ tmp[j + 3] ^ sm4_ck[rnd * 4 + j];
+
+            s = SM4_SBOXWORD(b);
+
+            tmp[j + 4] = tmp[j] ^ (s ^ rol32(s, 13) ^ rol32(s, 23));
+        }
+
+        for (uint32_t j = vstart; j < vend; ++j) {
+            *((uint32_t *)vd + H4(j)) = tmp[egs + (j - vstart)];
+        }
+    }
+
+    env->vstart = 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vext_vta(desc), env->vl * esz, total_elems * esz);
+}
+
+static void do_sm4_round(uint32_t *rk, uint32_t *buf)
+{
+    const uint32_t egs = 4;
+    uint32_t s, b;
+
+    for (uint32_t j = egs; j < egs * 2; ++j) {
+        b = buf[j - 3] ^ buf[j - 2] ^ buf[j - 1] ^ rk[j - 4];
+
+        s = SM4_SBOXWORD(b);
+
+        buf[j] = buf[j - 4] ^ (s ^ rol32(s, 2) ^ rol32(s, 10) ^
+                rol32(s, 18) ^ rol32(s, 24));
+    }
+}
+
+void HELPER(vsm4r_vv)(void *vd, void *vs2, CPURISCVState *env, uint32_t desc)
+{
+    const uint32_t egs = 4;
+    uint32_t group_start = env->vstart / egs;
+    uint32_t group_end = env->vl / egs;
+    uint32_t esz = sizeof(uint32_t);
+    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
+
+    if (env->vl % egs != 0) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
+    for (uint32_t i = group_start; i < group_end; ++i) {
+        uint32_t vstart = i * egs;
+        uint32_t vend = (i + 1) * egs;
+        uint32_t rk[4] = {0};
+        uint32_t tmp[8] = {0};
+
+        for (uint32_t j = vstart; j < vend; ++j) {
+            rk[j - vstart] = *((uint32_t *)vs2 + H4(j));
+        }
+
+        for (uint32_t j = vstart; j < vend; ++j) {
+            tmp[j - vstart] = *((uint32_t *)vd + H4(j));
+        }
+
+        do_sm4_round(rk, tmp);
+
+        for (uint32_t j = vstart; j < vend; ++j) {
+            *((uint32_t *)vd + H4(j)) = tmp[egs + (j - vstart)];
+        }
+    }
+
+    env->vstart = 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vext_vta(desc), env->vl * esz, total_elems * esz);
+}
+
+void HELPER(vsm4r_vs)(void *vd, void *vs2, CPURISCVState *env, uint32_t desc)
+{
+    const uint32_t egs = 4;
+    uint32_t group_start = env->vstart / egs;
+    uint32_t group_end = env->vl / egs;
+    uint32_t esz = sizeof(uint32_t);
+    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
+
+    if (env->vl % egs != 0) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
+    for (uint32_t i = group_start; i < group_end; ++i) {
+        uint32_t vstart = i * egs;
+        uint32_t vend = (i + 1) * egs;
+        uint32_t rk[4] = {0};
+        uint32_t tmp[8] = {0};
+
+        for (uint32_t j = 0; j < egs; ++j) {
+            rk[j] = *((uint32_t *)vs2 + H4(j));
+        }
+
+        for (uint32_t j = vstart; j < vend; ++j) {
+            tmp[j - vstart] = *((uint32_t *)vd + H4(j));
+        }
+
+        do_sm4_round(rk, tmp);
+
+        for (uint32_t j = vstart; j < vend; ++j) {
+            *((uint32_t *)vd + H4(j)) = tmp[egs + (j - vstart)];
+        }
+    }
+
+    env->vstart = 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vext_vta(desc), env->vl * esz, total_elems * esz);
+}
-- 
2.39.1


