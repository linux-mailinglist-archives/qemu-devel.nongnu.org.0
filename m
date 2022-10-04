Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C675F4A4F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:29:24 +0200 (CEST)
Received: from localhost ([::1]:54442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofoXb-0000Q8-VX
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyU-0002DR-Eg
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:53:07 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:35346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyR-0000J2-Uj
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:53:06 -0400
Received: by mail-pg1-x529.google.com with SMTP id j71so7399473pge.2
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DJ375f2f0/rpFxGusvoYB185jN+EVbOYzd0NkFA5EM0=;
 b=ZEsEgFjw4OVDPVJd6e/SCBU8fq5ZSkSOe5fpOQQa0JyHteqOlAB0Qg3SH1Ysnt2GEC
 gRZcCk3oMznYA0zh9CcUd/whi2wJKtj9ZKRFnGqyTfBl6S/t+tFdr2WAopKPS4Khluf5
 YJ4vS+VfdnRewZ/Npibdk5PbOMgdviBTo0YQ3Ix93XWSd0zlBLXgVL6CkUXARP8CNpx0
 DVw+gNNpnMXcahh6ctSli+iMBEH8Ev4yeX4D3ly76rwb7y2sq/Ewd5RvsuL227Z4qXKT
 CKje+d+0rUbAZeFiRaGHJvFW+aZktqyzyHGZdIx16l3bGgBxgWzlSc53u2h7iy5bIudh
 ZX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DJ375f2f0/rpFxGusvoYB185jN+EVbOYzd0NkFA5EM0=;
 b=cCGP5JHowjrarARcmNW4mzGnIW4sDCY9wQhwrlPi9o+ixldVjG6sKEit/W+DB53IpQ
 x5P1eaq81qxhzGKwshBpWg3uFKLfeJ6EE0lj3dldh8tNFY+IIW2JgGBCaLvQvHUKrQgb
 PcZiRX2Wbidq/UuT1TvI+XK3/ZcgpU7E1UYe8dZ7/GdpRaoDWXCCl6dvInC/Pgawx0yN
 4nljZU8ZWZXKRDqyPHQxWWtcYa55aCNRquProI49lK3ci8gdEhF0r3ZKswly/U+/OoGe
 0+mFRfYRUcNL4two/tOhShP/7Ll/9uBHtWTGe5+zldzvOkyYtieIhq60112cbP4SxeGz
 RrTg==
X-Gm-Message-State: ACrzQf2Come4uJPr9WZvhH/9GZTorOAhFcOy+iM16d4jt6TMjlCJGo4q
 SZmw2us4YxcZqz0TX8ZAw0ie+UwpGlEvdw==
X-Google-Smtp-Source: AMsMyM4Omh/DAsXxLFKSq+cDkkCMDAlku5C75tdBP6LL7npHzpQfysX8R6MPJnTuqfvUsJNWS1F3Ow==
X-Received: by 2002:a65:6e0d:0:b0:42d:707c:94ee with SMTP id
 bd13-20020a656e0d000000b0042d707c94eemr24001410pgb.260.1664913182471; 
 Tue, 04 Oct 2022 12:53:02 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:53:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 19/20] tcg/ppc: Optimize 26-bit jumps
Date: Tue,  4 Oct 2022 12:52:40 -0700
Message-Id: <20221004195241.46491-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

PowerPC64 processors handle direct branches better than indirect
ones, resulting in less stalled cycles and branch misses.

However, PPC's tb_target_set_jmp_target() was only using direct
branches for 16-bit jumps, while PowerPC64's unconditional branch
instructions are able to handle displacements of up to 26 bits.
To take advantage of this, now jumps whose displacements fit in
between 17 and 26 bits are also converted to direct branches.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
[rth: Expanded some commentary.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 119 +++++++++++++++++++++++++++++----------
 1 file changed, 88 insertions(+), 31 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 1cbd047ab3..e3dba47697 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1847,44 +1847,101 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
     tcg_out32(s, insn);
 }
 
+static inline uint64_t make_pair(tcg_insn_unit i1, tcg_insn_unit i2)
+{
+    if (HOST_BIG_ENDIAN) {
+        return (uint64_t)i1 << 32 | i2;
+    }
+    return (uint64_t)i2 << 32 | i1;
+}
+
+static inline void ppc64_replace2(uintptr_t rx, uintptr_t rw,
+                                  tcg_insn_unit i0, tcg_insn_unit i1)
+{
+#if TCG_TARGET_REG_BITS == 64
+    qatomic_set((uint64_t *)rw, make_pair(i0, i1));
+    flush_idcache_range(rx, rw, 8);
+#else
+    qemu_build_not_reached();
+#endif
+}
+
+static inline void ppc64_replace4(uintptr_t rx, uintptr_t rw,
+                                  tcg_insn_unit i0, tcg_insn_unit i1,
+                                  tcg_insn_unit i2, tcg_insn_unit i3)
+{
+    uint64_t p[2];
+
+    p[!HOST_BIG_ENDIAN] = make_pair(i0, i1);
+    p[HOST_BIG_ENDIAN] = make_pair(i2, i3);
+
+    /*
+     * There's no convenient way to get the compiler to allocate a pair
+     * of registers at an even index, so copy into r6/r7 and clobber.
+     */
+    asm("mr  %%r6, %1\n\t"
+        "mr  %%r7, %2\n\t"
+        "stq %%r6, %0"
+        : "=Q"(*(__int128 *)rw) : "r"(p[0]), "r"(p[1]) : "r6", "r7");
+    flush_idcache_range(rx, rw, 16);
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
                               uintptr_t jmp_rw, uintptr_t addr)
 {
-    if (TCG_TARGET_REG_BITS == 64) {
-        tcg_insn_unit i1, i2;
-        intptr_t tb_diff = addr - tc_ptr;
-        intptr_t br_diff = addr - (jmp_rx + 4);
-        uint64_t pair;
+    tcg_insn_unit i0, i1, i2, i3;
+    intptr_t tb_diff = addr - tc_ptr;
+    intptr_t br_diff = addr - (jmp_rx + 4);
+    intptr_t lo, hi;
 
-        /* This does not exercise the range of the branch, but we do
-           still need to be able to load the new value of TCG_REG_TB.
-           But this does still happen quite often.  */
-        if (tb_diff == (int16_t)tb_diff) {
-            i1 = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, tb_diff);
-            i2 = B | (br_diff & 0x3fffffc);
-        } else {
-            intptr_t lo = (int16_t)tb_diff;
-            intptr_t hi = (int32_t)(tb_diff - lo);
-            assert(tb_diff == hi + lo);
-            i1 = ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, hi >> 16);
-            i2 = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, lo);
-        }
-#if HOST_BIG_ENDIAN
-        pair = (uint64_t)i1 << 32 | i2;
-#else
-        pair = (uint64_t)i2 << 32 | i1;
-#endif
-
-        /* As per the enclosing if, this is ppc64.  Avoid the _Static_assert
-           within qatomic_set that would fail to build a ppc32 host.  */
-        qatomic_set__nocheck((uint64_t *)jmp_rw, pair);
-        flush_idcache_range(jmp_rx, jmp_rw, 8);
-    } else {
+    if (TCG_TARGET_REG_BITS == 32) {
         intptr_t diff = addr - jmp_rx;
         tcg_debug_assert(in_range_b(diff));
         qatomic_set((uint32_t *)jmp_rw, B | (diff & 0x3fffffc));
         flush_idcache_range(jmp_rx, jmp_rw, 4);
+        return;
     }
+
+    /*
+     * For 16-bit displacements, we can use a single add + branch.
+     * This happens quite often.
+     */
+    if (tb_diff == (int16_t)tb_diff) {
+        i0 = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, tb_diff);
+        i1 = B | (br_diff & 0x3fffffc);
+        ppc64_replace2(jmp_rx, jmp_rw, i0, i1);
+        return;
+    }
+
+    lo = (int16_t)tb_diff;
+    hi = (int32_t)(tb_diff - lo);
+    assert(tb_diff == hi + lo);
+    i0 = ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, hi >> 16);
+    i1 = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, lo);
+
+    /*
+     * Without stq from 2.07, we can only update two insns,
+     * and those must be the ones that load the target address.
+     */
+    if (!have_isa_2_07) {
+        ppc64_replace2(jmp_rx, jmp_rw, i0, i1);
+        return;
+    }
+
+    /*
+     * For 26-bit displacements, we can use a direct branch.
+     * Otherwise we still need the indirect branch, which we
+     * must restore after a potential direct branch write.
+     */
+    br_diff -= 4;
+    if (in_range_b(br_diff)) {
+        i2 = B | (br_diff & 0x3fffffc);
+        i3 = NOP;
+    } else {
+        i2 = MTSPR | RS(TCG_REG_TB) | CTR;
+        i3 = BCCTR | BO_ALWAYS;
+    }
+    ppc64_replace4(jmp_rx, jmp_rw, i0, i1, i2, i3);
 }
 
 static void tcg_out_call_int(TCGContext *s, int lk,
@@ -2574,8 +2631,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if (s->tb_jmp_insn_offset) {
             /* Direct jump. */
             if (TCG_TARGET_REG_BITS == 64) {
-                /* Ensure the next insns are 8-byte aligned. */
-                if ((uintptr_t)s->code_ptr & 7) {
+                /* Ensure the next insns are 8 or 16-byte aligned. */
+                while ((uintptr_t)s->code_ptr & (have_isa_2_07 ? 15 : 7)) {
                     tcg_out32(s, NOP);
                 }
                 s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
-- 
2.34.1


