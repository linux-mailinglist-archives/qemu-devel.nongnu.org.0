Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88A057049A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 15:46:59 +0200 (CEST)
Received: from localhost ([::1]:60418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAtkY-0000L2-Pf
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 09:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oAtgt-0005Lm-Sg; Mon, 11 Jul 2022 09:43:11 -0400
Received: from [200.168.210.66] (port=20062 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oAtgr-0005Q5-SI; Mon, 11 Jul 2022 09:43:11 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 11 Jul 2022 10:43:03 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A59F2800172;
 Mon, 11 Jul 2022 10:43:03 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, farosas@linux.ibm.com
Subject: [RFC PATCH v2 1/2] target/ppc: Implement hashst and hashchk
Date: Mon, 11 Jul 2022 10:42:57 -0300
Message-Id: <20220711134258.63147-2-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711134258.63147-1-victor.colombo@eldorado.org.br>
References: <20220711134258.63147-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 11 Jul 2022 13:43:03.0944 (UTC)
 FILETIME=[25025880:01D8952C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
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

Implementation for instructions hashst and hashchk, which were added
in Power ISA 3.1B.

It was decided to implement the hash algorithm from ground up in this
patch exactly as described in Power ISA.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 linux-headers/asm-powerpc/kvm.h            |  2 +
 target/ppc/cpu.h                           |  1 +
 target/ppc/cpu_init.c                      |  4 ++
 target/ppc/excp_helper.c                   | 80 ++++++++++++++++++++++
 target/ppc/helper.h                        |  2 +
 target/ppc/insn32.decode                   |  8 +++
 target/ppc/translate.c                     |  5 ++
 target/ppc/translate/fixedpoint-impl.c.inc | 32 +++++++++
 8 files changed, 134 insertions(+)

diff --git a/linux-headers/asm-powerpc/kvm.h b/linux-headers/asm-powerpc/kvm.h
index 9f18fa090f..dd58d574bf 100644
--- a/linux-headers/asm-powerpc/kvm.h
+++ b/linux-headers/asm-powerpc/kvm.h
@@ -646,6 +646,8 @@ struct kvm_ppc_cpu_char {
 #define KVM_REG_PPC_SIER3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc3)
 #define KVM_REG_PPC_DAWR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc4)
 #define KVM_REG_PPC_DAWRX1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc5)
+/* FIXME: KVM hasn't exposed these registers yet */
+#define KVM_REG_PPC_HASHKEYR    (KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x00)
 
 /* Transactional Memory checkpointed state:
  * This is all GPRs, all VSX regs and a subset of SPRs
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 7aaff9dcc5..f3f98d7a01 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1677,6 +1677,7 @@ void ppc_compat_add_property(Object *obj, const char *name,
 #define SPR_BOOKE_GIVOR14     (0x1BD)
 #define SPR_TIR               (0x1BE)
 #define SPR_PTCR              (0x1D0)
+#define SPR_POWER_HASHKEYR    (0x1D4)
 #define SPR_BOOKE_SPEFSCR     (0x200)
 #define SPR_Exxx_BBEAR        (0x201)
 #define SPR_Exxx_BBTAR        (0x202)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 86ad28466a..db541c531a 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6490,6 +6490,10 @@ static void init_proc_POWER10(CPUPPCState *env)
                         spr_read_generic, spr_write_generic,
                         KVM_REG_PPC_PSSCR, 0);
 
+    spr_register_kvm(env, SPR_POWER_HASHKEYR, "HASHKEYR",
+        SPR_NOACCESS, SPR_NOACCESS, &spr_read_generic, &spr_write_generic,
+        KVM_REG_PPC_HASHKEYR, 0x0);
+
     /* env variables */
     env->dcache_line_size = 128;
     env->icache_line_size = 128;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index cb752b184a..34893bdf9f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2174,6 +2174,86 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
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
+
 #if !defined(CONFIG_USER_ONLY)
 
 #ifdef CONFIG_TCG
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ed0641a234..84447aa3a5 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -4,6 +4,8 @@ DEF_HELPER_FLAGS_4(tw, TCG_CALL_NO_WG, void, env, tl, tl, i32)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_4(td, TCG_CALL_NO_WG, void, env, tl, tl, i32)
 #endif
+DEF_HELPER_4(HASHST, void, env, tl, tl, tl)
+DEF_HELPER_4(HASHCHK, void, env, tl, tl, tl)
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(store_msr, void, env, tl)
 DEF_HELPER_1(rfi, void, env)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index f7653ef9d5..23e8f56f82 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -163,6 +163,9 @@
 @X_TSX          ...... ..... ra:5 rb:5 .......... .             &X rt=%x_rt_tsx
 @X_TSXP         ...... ..... ra:5 rb:5 .......... .             &X rt=%rt_tsxp
 
+%x_dw           0:1 21:5 !function=dw_compose_ea
+@X_DW           ...... ..... ra:5 rb:5 .......... .             &X rt=%x_dw
+
 &X_frtp_vrb     frtp vrb
 @X_frtp_vrb     ...... ....0 ..... vrb:5 .......... .           &X_frtp_vrb frtp=%x_frtp
 
@@ -314,6 +317,11 @@ CNTTZDM         011111 ..... ..... ..... 1000111011 -   @X
 PDEPD           011111 ..... ..... ..... 0010011100 -   @X
 PEXTD           011111 ..... ..... ..... 0010111100 -   @X
 
+# Fixed-Point Hash Instructions
+
+HASHST          011111 ..... ..... ..... 1011010010 .   @X_DW
+HASHCHK         011111 ..... ..... ..... 1011110010 .   @X_DW
+
 ## BCD Assist
 
 ADDG6S          011111 ..... ..... ..... - 001001010 -  @X
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 1d6daa4608..1a049564d6 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6578,6 +6578,11 @@ static int times_16(DisasContext *ctx, int x)
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
index cb0097bedb..f525144398 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -543,3 +543,35 @@ static bool trans_CBCDTD(DisasContext *ctx, arg_X_sa *a)
     gen_helper_CBCDTD(cpu_gpr[a->ra], cpu_gpr[a->rs]);
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
-- 
2.25.1


