Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AB142B353
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:22:16 +0200 (CEST)
Received: from localhost ([::1]:57818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUqN-0007ED-Au
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL3-0005RH-U7
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:53 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL1-00017Z-Vx
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:53 -0400
Received: by mail-pf1-x42e.google.com with SMTP id t184so303597pfd.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDlNcMPX+4x4RTjp0DsPf/CfOh4YFwKmpEmxN1K7ZOw=;
 b=gFsk20Yd22EB1KZRzc91J8vkqLm7ukchjhiTFVEGgoivBGtFHX6+Meq8a+sEzTPskC
 g2EU7cKVSsFofdhAObbss4jLD2ZnCRys1e70Q8OrjCYWxi3GCoX0vxcsXgzlvHsBQkRu
 AzQzDE7vJtlHSx6xdwhrvwphr1eHxbHIWvK5a3cMkpW7T84W5oriIJQVUi9UobB3j17n
 gXrfBHwGxxmgX+m5eWYtOYaFWXfXncdXbjr5CT088DqPMsz+64ByMGBMM6tzPaobgllf
 FjyAW9Xg10ldXrGpwNQhxb5Oym18xmUawH/CnWnSaj3E7/Ai/4LNLvvMLGp9ClVr/Uw4
 FG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDlNcMPX+4x4RTjp0DsPf/CfOh4YFwKmpEmxN1K7ZOw=;
 b=C2FYAPQXwrR0Q0hwz3piqoUmJKseJAtPIPzpifxg0OlSzA4PrMAvGafpiX0PfKna11
 4907BXVIDFKE9rnxZCOrjsLWF56HO/OdehfXD7oLZiMIU7hYxiZXV/pGHE+a/K60zkAI
 gQGjaLHa+ASmrN/hKM69ANJOUYNzitxFeO6XJYKuYqTYbV48HB7EiLdRT3q5gXOIa/n4
 2CTK0BUtk69ZQn0OZT6gcMrs2uHN12J0b237QkmSQUNSB0m2UqIWRBIhhf23sZIAHWIa
 YBbqa++9JqvXEa/GSr8nGLFCkRpZVyY+LjWtHarsgP1W1qN41+L7Avaxl5bPV7NNiD4d
 SF+Q==
X-Gm-Message-State: AOAM5303pZ3Rz26Dnvh7gk2gd0VNDw9kus3DkpJRhN6ce3fW2/OFovhn
 kH1+mVamqpECx4LygqZdKSiuuBvgo7UwwQ==
X-Google-Smtp-Source: ABdhPJwiOEa9noGoMqTwWNIdh56TMMCsKASHmP78e2C0Hadk4L5owq240oM2/telFBnhExN4JBeQKA==
X-Received: by 2002:a05:6a00:a10:b0:412:448c:89c7 with SMTP id
 p16-20020a056a000a1000b00412448c89c7mr35048801pfh.83.1634093390598; 
 Tue, 12 Oct 2021 19:49:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y20sm12579610pfp.68.2021.10.12.19.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:49:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 42/48] tcg/i386: Support raising sigbus for user-only
Date: Tue, 12 Oct 2021 19:46:01 -0700
Message-Id: <20211013024607.731881-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |   2 -
 tcg/i386/tcg-target.c.inc | 103 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 98 insertions(+), 7 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index b00a6da293..3b2c9437a0 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -232,9 +232,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP  have_movbe
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #endif
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 84b109bb84..e073868d8f 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 
+#include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 
 #ifdef CONFIG_DEBUG_TCG
@@ -421,8 +422,9 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VZEROUPPER  (0x77 | P_EXT)
 #define OPC_XCHG_ax_r32	(0x90)
 
-#define OPC_GRP3_Ev	(0xf7)
-#define OPC_GRP5	(0xff)
+#define OPC_GRP3_Eb     (0xf6)
+#define OPC_GRP3_Ev     (0xf7)
+#define OPC_GRP5        (0xff)
 #define OPC_GRP14       (0x73 | P_EXT | P_DATA16)
 
 /* Group 1 opcode extensions for 0x80-0x83.
@@ -444,6 +446,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define SHIFT_SAR 7
 
 /* Group 3 opcode extensions for 0xf6, 0xf7.  To be used with OPC_GRP3.  */
+#define EXT3_TESTi 0
 #define EXT3_NOT   2
 #define EXT3_NEG   3
 #define EXT3_MUL   4
@@ -1606,8 +1609,6 @@ static void tcg_out_nopn(TCGContext *s, int n)
 }
 
 #if defined(CONFIG_SOFTMMU)
-#include "../tcg-ldst.c.inc"
-
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     int mmu_idx, uintptr_t ra)
  */
@@ -1916,7 +1917,84 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_jmp(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
     return true;
 }
-#elif TCG_TARGET_REG_BITS == 32
+#else
+
+static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
+                                   TCGReg addrhi, unsigned a_bits)
+{
+    unsigned a_mask = (1 << a_bits) - 1;
+    TCGLabelQemuLdst *label;
+
+    /*
+     * We are expecting a_bits to max out at 7, so we can usually use testb.
+     * For i686, we have to use testl for %esi/%edi.
+     */
+    if (a_mask <= 0xff && (TCG_TARGET_REG_BITS == 64 || addrlo < 4)) {
+        tcg_out_modrm(s, OPC_GRP3_Eb | P_REXB_RM, EXT3_TESTi, addrlo);
+        tcg_out8(s, a_mask);
+    } else {
+        tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_TESTi, addrlo);
+        tcg_out32(s, a_mask);
+    }
+
+    /* jne slow_path */
+    tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
+
+    label = new_ldst_label(s);
+    label->is_ld = is_ld;
+    label->addrlo_reg = addrlo;
+    label->addrhi_reg = addrhi;
+    label->raddr = tcg_splitwx_to_rx(s->code_ptr + 4);
+    label->label_ptr[0] = s->code_ptr;
+
+    s->code_ptr += 4;
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    /* resolve label address */
+    tcg_patch32(l->label_ptr[0], s->code_ptr - l->label_ptr[0] - 4);
+
+    if (TCG_TARGET_REG_BITS == 32) {
+        int ofs = 0;
+
+        tcg_out_st(s, TCG_TYPE_PTR, TCG_AREG0, TCG_REG_ESP, ofs);
+        ofs += 4;
+
+        tcg_out_st(s, TCG_TYPE_I32, l->addrlo_reg, TCG_REG_ESP, ofs);
+        ofs += 4;
+        if (TARGET_LONG_BITS == 64) {
+            tcg_out_st(s, TCG_TYPE_I32, l->addrhi_reg, TCG_REG_ESP, ofs);
+            ofs += 4;
+        }
+
+        tcg_out_pushi(s, (uintptr_t)l->raddr);
+    } else {
+        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
+                    l->addrlo_reg);
+        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
+
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RAX, (uintptr_t)l->raddr);
+        tcg_out_push(s, TCG_REG_RAX);
+    }
+
+    /* "Tail call" to the helper, with the return address back inline. */
+    tcg_out_jmp(s, (const void *)(l->is_ld ? helper_unaligned_ld
+                                  : helper_unaligned_st));
+    return true;
+}
+
+static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    return tcg_out_fail_alignment(s, l);
+}
+
+static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    return tcg_out_fail_alignment(s, l);
+}
+
+#if TCG_TARGET_REG_BITS == 32
 # define x86_guest_base_seg     0
 # define x86_guest_base_index   -1
 # define x86_guest_base_offset  guest_base
@@ -1950,6 +2028,7 @@ static inline int setup_guest_base_seg(void)
     return 0;
 }
 # endif
+#endif
 #endif /* SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
@@ -2059,6 +2138,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 #if defined(CONFIG_SOFTMMU)
     int mem_index;
     tcg_insn_unit *label_ptr[2];
+#else
+    unsigned a_bits;
 #endif
 
     datalo = *args++;
@@ -2081,6 +2162,11 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
     add_qemu_ldst_label(s, true, is64, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
+    }
+
     tcg_out_qemu_ld_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg,
                            is64, opc);
@@ -2148,6 +2234,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 #if defined(CONFIG_SOFTMMU)
     int mem_index;
     tcg_insn_unit *label_ptr[2];
+#else
+    unsigned a_bits;
 #endif
 
     datalo = *args++;
@@ -2170,6 +2258,11 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     add_qemu_ldst_label(s, false, is64, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
+    }
+
     tcg_out_qemu_st_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg, opc);
 #endif
-- 
2.25.1


