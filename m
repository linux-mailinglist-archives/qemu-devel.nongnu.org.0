Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3C7555242
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 19:22:53 +0200 (CEST)
Received: from localhost ([::1]:33954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4441-0004pF-UM
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 13:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o441g-0003tB-LZ; Wed, 22 Jun 2022 13:20:24 -0400
Received: from [187.72.171.209] (port=48553 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o441e-0007kU-43; Wed, 22 Jun 2022 13:20:24 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 22 Jun 2022 14:20:14 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B410B8000AD;
 Wed, 22 Jun 2022 14:20:13 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, farosas@linux.ibm.com
Subject: [RFC PATCH] target/ppc: Implement hashst(p) and hashchk(p)
 instructions
Date: Wed, 22 Jun 2022 14:19:43 -0300
Message-Id: <20220622171943.90786-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Jun 2022 17:20:14.0009 (UTC)
 FILETIME=[55AF3A90:01D8865C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implementation for instructions hashst, hashchk, and its privileged
versions.

It was decided to implement the hash algorithm from ground up in this
patch exactly as described in Power ISA.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>

---

RFC because I need some feedback on if the approach of implementing
the algorithm is a good idea. Also, it seems that the kernel/kvm are
not implementing the necessary registers?

What do you think about the choice to implement the hash algorithm
from the ground up, following the SIMON-like algorithm presented in
Power ISA? IIUC, this algorithm is not the same as the original[1].
Other options would be to use other algorithm already implemented
in QEMU, or even make this instruction a nop for all Power versions.

Based-on: ppc-next, with 
    <20220620210540.112153-1-leandro.lupori@eldorado.org.br> and
    <20220615192006.3075821-1-lucas.coutinho@eldorado.org.br>
    applied on top. The relevant patches are:
    [PATCH 01/11] target/ppc: receive DisasContext explicitly in GEN_PRIV
    [PATCH 02/11] target/ppc: add macros to check privilege level

[1] https://eprint.iacr.org/2013/404.pdf
---
 linux-headers/asm-powerpc/kvm.h            |  3 +
 target/ppc/cpu.h                           |  2 +
 target/ppc/cpu_init.c                      |  7 ++
 target/ppc/excp_helper.c                   | 82 ++++++++++++++++++++++
 target/ppc/helper.h                        |  4 ++
 target/ppc/insn32.decode                   | 10 +++
 target/ppc/translate.c                     |  5 ++
 target/ppc/translate/fixedpoint-impl.c.inc | 34 +++++++++
 8 files changed, 147 insertions(+)

diff --git a/linux-headers/asm-powerpc/kvm.h b/linux-headers/asm-powerpc/kvm.h
index 9f18fa090f..4ae4718143 100644
--- a/linux-headers/asm-powerpc/kvm.h
+++ b/linux-headers/asm-powerpc/kvm.h
@@ -646,6 +646,9 @@ struct kvm_ppc_cpu_char {
 #define KVM_REG_PPC_SIER3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc3)
 #define KVM_REG_PPC_DAWR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc4)
 #define KVM_REG_PPC_DAWRX1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc5)
+/* FIXME: KVM hasn't exposed these registers yet */
+#define KVM_REG_PPC_HASHKEYR    (KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x00)
+#define KVM_REG_PPC_HASHPKEYR   (KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x00)
 
 /* Transactional Memory checkpointed state:
  * This is all GPRs, all VSX regs and a subset of SPRs
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 6d78078f37..d982b779ca 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1665,6 +1665,8 @@ void ppc_compat_add_property(Object *obj, const char *name,
 #define SPR_BOOKE_GIVOR14     (0x1BD)
 #define SPR_TIR               (0x1BE)
 #define SPR_PTCR              (0x1D0)
+#define SPR_POWER_HASHKEYR    (0x1D4)
+#define SPR_POWER_HASHPKEYR   (0x1D5)
 #define SPR_BOOKE_SPEFSCR     (0x200)
 #define SPR_Exxx_BBEAR        (0x201)
 #define SPR_Exxx_BBTAR        (0x202)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index b802bbb641..3ec9e4a27f 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6484,6 +6484,13 @@ static void init_proc_POWER10(CPUPPCState *env)
                         spr_read_generic, spr_write_generic,
                         KVM_REG_PPC_PSSCR, 0);
 
+    spr_register_kvm(env, SPR_POWER_HASHKEYR, "HASHPKEYR",
+        SPR_NOACCESS, SPR_NOACCESS, &spr_read_generic, &spr_write_generic,
+        KVM_REG_PPC_HASHKEYR, 0x0);
+    spr_register_kvm(env, SPR_POWER_HASHPKEYR, "HASHPKEYR",
+        SPR_NOACCESS, SPR_NOACCESS, &spr_read_generic, &spr_write_generic,
+        KVM_REG_PPC_HASHPKEYR, 0x0);
+
     /* env variables */
     env->dcache_line_size = 128;
     env->icache_line_size = 128;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index cb752b184a..0998e8374e 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2174,6 +2174,88 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
 #endif
 #endif
 
+static uint32_t helper_SIMON_LIKE_32_64(uint32_t x, uint64_t key, uint32_t lane)
+{
+    const uint16_t c = 0xfffc;
+    const uint64_t z0 = 0xfa2561cdf44ac398ULL;
+    uint16_t z = 0, temp;
+    uint16_t k[32], eff_k[32], xleft[33], xright[33], fxleft[32];
+
+    for (int i = 3; i >= 0; i--) {
+        k[i] = key & 0xffff;
+        key >>= 16;
+    }
+    xleft[0] = x & 0xffff;
+    xright[0] = (x >> 16) & 0xffff;
+
+    for (int i = 0; i < 28; i++) {
+        z = (z0 >> (63 - i)) & 1;
+        temp = ror16(k[i + 3], 3) ^ k[i + 1];
+        k[i + 4] = c ^ z ^ k[i] ^ temp ^ ror16(temp, 1);
+    }
+
+    for (int i = 0; i < 8; i++) {
+        eff_k[4 * i + 0] = k[4 * i + ((0 + lane) % 4)];
+        eff_k[4 * i + 1] = k[4 * i + ((1 + lane) % 4)];
+        eff_k[4 * i + 2] = k[4 * i + ((2 + lane) % 4)];
+        eff_k[4 * i + 3] = k[4 * i + ((3 + lane) % 4)];
+    }
+
+    for (int i = 0; i < 32; i++) {
+        fxleft[i] = (rol16(xleft[i], 1) &
+            rol16(xleft[i], 8)) ^ rol16(xleft[i], 2);
+        xleft[i + 1] = xright[i] ^ fxleft[i] ^ eff_k[i];
+        xright[i + 1] = xleft[i];
+    }
+
+    return (((uint32_t)xright[32]) << 16) | xleft[32];
+}
+
+static uint64_t hash_digest(uint64_t ra, uint64_t rb, uint64_t key)
+{
+    uint64_t stage0_h = 0ULL, stage0_l = 0ULL;
+    uint64_t stage1_h, stage1_l;
+
+    for (int i = 0; i < 4; i++) {
+        stage0_h |= ror64(rb & 0xff, 8 * (2 * i + 1));
+        stage0_h |= ((ra >> 32) & 0xff) << (8 * 2 * i);
+        stage0_l |= ror64((rb >> 32) & 0xff, 8 * (2 * i + 1));
+        stage0_l |= (ra & 0xff) << (8 * 2 * i);
+        rb >>= 8;
+        ra >>= 8;
+    }
+
+    stage1_h = (uint64_t)helper_SIMON_LIKE_32_64(stage0_h >> 32, key, 0) << 32;
+    stage1_h |= helper_SIMON_LIKE_32_64(stage0_h, key, 1);
+    stage1_l = (uint64_t)helper_SIMON_LIKE_32_64(stage0_l >> 32, key, 2) << 32;
+    stage1_l |= helper_SIMON_LIKE_32_64(stage0_l, key, 3);
+
+    return stage1_h ^ stage1_l;
+}
+
+#define HELPER_HASH(op, key, store)                                           \
+void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong ra,          \
+                 target_ulong rb)                                             \
+{                                                                             \
+    uint64_t chash = hash_digest(ra, rb, key), lhash;                         \
+                                                                              \
+    if (store) {                                                              \
+        cpu_stq_data_ra(env, ea, chash, GETPC());                             \
+    } else {                                                                  \
+        lhash = cpu_ldq_data_ra(env, ea, GETPC());                            \
+        if (lhash != chash) {                                                 \
+            /* hashes don't match, trap */                                    \
+            raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,                 \
+                POWERPC_EXCP_TRAP, GETPC());                                  \
+        }                                                                     \
+    }                                                                         \
+}
+
+HELPER_HASH(HASHST, env->spr[SPR_POWER_HASHKEYR], true)
+HELPER_HASH(HASHCHK, env->spr[SPR_POWER_HASHKEYR], false)
+HELPER_HASH(HASHSTP, env->spr[SPR_POWER_HASHPKEYR], true)
+HELPER_HASH(HASHCHKP, env->spr[SPR_POWER_HASHPKEYR], false)
+
 #if !defined(CONFIG_USER_ONLY)
 
 #ifdef CONFIG_TCG
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 4287f41880..c7ff3eb169 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -4,6 +4,10 @@ DEF_HELPER_FLAGS_4(tw, TCG_CALL_NO_WG, void, env, tl, tl, i32)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_4(td, TCG_CALL_NO_WG, void, env, tl, tl, i32)
 #endif
+DEF_HELPER_4(HASHST, void, env, tl, tl, tl)
+DEF_HELPER_4(HASHCHK, void, env, tl, tl, tl)
+DEF_HELPER_4(HASHSTP, void, env, tl, tl, tl)
+DEF_HELPER_4(HASHCHKP, void, env, tl, tl, tl)
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(store_msr, void, env, tl)
 DEF_HELPER_1(rfi, void, env)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index b36a093828..e0fc9ecb7f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -157,6 +157,9 @@
 @X_TSX          ...... ..... ra:5 rb:5 .......... .             &X rt=%x_rt_tsx
 @X_TSXP         ...... ..... ra:5 rb:5 .......... .             &X rt=%rt_tsxp
 
+%x_dw           0:1 21:5 !function=dw_compose_ea
+@X_DW           ...... ..... ra:5 rb:5 .......... .             &X rt=%x_dw
+
 &X_frtp_vrb     frtp vrb
 @X_frtp_vrb     ...... ....0 ..... vrb:5 .......... .           &X_frtp_vrb frtp=%x_frtp
 
@@ -308,6 +311,13 @@ CNTTZDM         011111 ..... ..... ..... 1000111011 -   @X
 PDEPD           011111 ..... ..... ..... 0010011100 -   @X
 PEXTD           011111 ..... ..... ..... 0010111100 -   @X
 
+# Fixed-Point Hash Instructions
+
+HASHST          011111 ..... ..... ..... 1011010010 .   @X_DW
+HASHCHK         011111 ..... ..... ..... 1011110010 .   @X_DW
+HASHSTP         011111 ..... ..... ..... 1010010010 .   @X_DW
+HASHCHKP        011111 ..... ..... ..... 1010110010 .   @X_DW
+
 ### Float-Point Load Instructions
 
 LFS             110000 ..... ..... ................     @D
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index a918575fa9..c870bbedad 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6410,6 +6410,11 @@ static int times_16(DisasContext *ctx, int x)
     return x * 16;
 }
 
+static int64_t dw_compose_ea(DisasContext *ctx, int x)
+{
+    return deposit64(0xfffffffffffffe00, 3, 6, x);
+}
+
 /*
  * Helpers for trans_* functions to check for specific insns flags.
  * Use token pasting to ensure that we use the proper flag with the
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 77d449c3cd..d0a8269ea6 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -489,3 +489,37 @@ static bool trans_PEXTD(DisasContext *ctx, arg_X *a)
 #endif
     return true;
 }
+
+static bool do_hash(DisasContext *ctx, arg_X *a, bool priv,
+    void (*helper)(TCGv_ptr, TCGv, TCGv, TCGv))
+{
+    TCGv ea;
+
+    if (!(ctx->insns_flags2 & PPC2_ISA310)) {
+        /* if version is before v3.1, this operation is a nop */
+        return true;
+    }
+
+    if (priv) {
+        /* if instruction is privileged but the context is in user space */
+        REQUIRE_SV(ctx);
+    }
+
+    if (unlikely(a->ra == 0)) {
+        /* if RA=0, the instruction form is invalid */
+        gen_invalid(ctx);
+        return true;
+    }
+
+    ea = do_ea_calc(ctx, a->ra, tcg_constant_tl(a->rt));
+    helper(cpu_env, ea, cpu_gpr[a->ra], cpu_gpr[a->rb]);
+
+    tcg_temp_free(ea);
+
+    return true;
+}
+
+TRANS(HASHST, do_hash, false, gen_helper_HASHST)
+TRANS(HASHCHK, do_hash, false, gen_helper_HASHCHK)
+TRANS(HASHSTP, do_hash, true, gen_helper_HASHSTP)
+TRANS(HASHCHKP, do_hash, true, gen_helper_HASHCHKP)
-- 
2.25.1


