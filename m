Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBBA5BF190
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:58:58 +0200 (CEST)
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oan8j-00013s-2H
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8M-0001Mt-H5; Tue, 20 Sep 2022 15:42:24 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:40617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8K-0001pV-KL; Tue, 20 Sep 2022 15:42:18 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1278a61bd57so5818205fac.7; 
 Tue, 20 Sep 2022 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=dHqQbHV2aJSXUplozUQWG4Zfecbc5vmJABWjMeTGles=;
 b=dSHSdHz6DYNNcgI+S6EC3tX4TqZzdPqyUGGXTs8BGP08d9f7ElTjwU2wQeeXgIwZQV
 tXWKDbrnzM2ETqAMmKPTv81MNPi5XSmUVl1yC2iJAsyB1dgTckDqxvPPUntp9EXkVgK3
 K6f9qyGX0041uQCgspeGylZMYlvnfCP5dB+bJQ0W4B7t5tIt96QOZyA9e1EndVv/XArP
 AVxyz0/BZvxFTupPdjsQ4MgJlmUet6+1lJuaytR3l8LqATXhbzqCnapIL1pWUxN91ik4
 VQZf5Pm5E2xNV2wGD1xuh17ug9BsOBa2SoOozsRmq6RYtaUDGn0N7j4VeOWtcOkeUrRT
 eOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dHqQbHV2aJSXUplozUQWG4Zfecbc5vmJABWjMeTGles=;
 b=owMErHIJU92GQc1m3U5jjZHj2qT8ZQKNVYHuj4o0LAqMAjUNa1pEgdss8ULA+/GZ9q
 +ZPL8oPlEvn83g/VX7u+1JMcqt0kg0ZRo8gaov+Tx9pNXTZO6XDPV/LgNyD+qG8X75KJ
 t6jFXhvBc0H1i0r8Yj2+o5ZAninUjqmHztW0LuI4FZJfmrHEnWnpIjonG+5koB+JT9ZZ
 fRDe1NsYAuG/dUga+gI8sNeTrkcCxFqYPVeUkxEMfHcZ8+TZ76sxcHUYi0aCbR+tjz6i
 R8FkA0wvCxbUkVL4A6LeDb4thjsFytD17r/PgPh5ctXWdL8XFPgfuYjBjdZylT8KYK+q
 ez3w==
X-Gm-Message-State: ACrzQf3WuFrLGbUod/ygrrVUaCDqgeC7nVcQIyOQ3smubthXvybapqkq
 oiXHFhED3oPNgn3yQ9GNa9lZW6xVD60=
X-Google-Smtp-Source: AMsMyM5mIh5p+4kVPrwZBMcn+1cluYxUBoBL8WtDEkqu7MFILctjGGSK2BYECGuHFqDNUy6DtaOf0Q==
X-Received: by 2002:a05:6870:f228:b0:12c:c6b8:51a with SMTP id
 t40-20020a056870f22800b0012cc6b8051amr3054848oao.119.1663702934776; 
 Tue, 20 Sep 2022 12:42:14 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:14 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 02/17] target/ppc: Implement hashst and hashchk
Date: Tue, 20 Sep 2022 16:41:47 -0300
Message-Id: <20220920194202.82615-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Implementation for instructions hashst and hashchk, which were added
in Power ISA 3.1B.

It was decided to implement the hash algorithm from ground up in this
patch exactly as described in Power ISA.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Lucas Mateus Castro <lucas.araujo@eldorado.org.br>
Message-Id: <20220715205439.161110-3-victor.colombo@eldorado.org.br>
[danielhb: fix block comment in excp_helper.c]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c                   | 81 ++++++++++++++++++++++
 target/ppc/helper.h                        |  2 +
 target/ppc/insn32.decode                   |  8 +++
 target/ppc/translate.c                     |  5 ++
 target/ppc/translate/fixedpoint-impl.c.inc | 32 +++++++++
 5 files changed, 128 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7550aafed6..7a16991f3d 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2173,6 +2173,87 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
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
+#include "qemu/guest-random.h"
+
+#define HELPER_HASH(op, key, store)                                           \
+void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong ra,          \
+                 target_ulong rb)                                             \
+{                                                                             \
+    uint64_t calculated_hash = hash_digest(ra, rb, key), loaded_hash;         \
+                                                                              \
+    if (store) {                                                              \
+        cpu_stq_data_ra(env, ea, calculated_hash, GETPC());                   \
+    } else {                                                                  \
+        loaded_hash = cpu_ldq_data_ra(env, ea, GETPC());                      \
+        if (loaded_hash != calculated_hash) {                                 \
+            raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,                 \
+                POWERPC_EXCP_TRAP, GETPC());                                  \
+        }                                                                     \
+    }                                                                         \
+}
+
+HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
+HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
+
 #if !defined(CONFIG_USER_ONLY)
 
 #ifdef CONFIG_TCG
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 159b352f6e..5817af632b 100644
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
index eb41efc100..544514565c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -172,6 +172,9 @@
 @X_TSX          ...... ..... ra:5 rb:5 .......... .             &X rt=%x_rt_tsx
 @X_TSXP         ...... ..... ra:5 rb:5 .......... .             &X rt=%rt_tsxp
 
+%x_dw           0:1 21:5 !function=dw_compose_ea
+@X_DW           ...... ..... ra:5 rb:5 .......... .             &X rt=%x_dw
+
 &X_frtp_vrb     frtp vrb
 @X_frtp_vrb     ...... ....0 ..... vrb:5 .......... .           &X_frtp_vrb frtp=%x_frtp
 
@@ -323,6 +326,11 @@ CNTTZDM         011111 ..... ..... ..... 1000111011 -   @X
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
index 000b1e518d..29939bd923 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6473,6 +6473,11 @@ static int times_16(DisasContext *ctx, int x)
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
index db14d3bebc..41c06de8a2 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -540,3 +540,35 @@ static bool trans_CBCDTD(DisasContext *ctx, arg_X_sa *a)
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
2.37.3


