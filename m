Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B84B1BAB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:54:46 +0100 (CET)
Received: from localhost ([::1]:59490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIL91-0007ns-VN
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:54:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKn6-00044T-DU
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:06 -0500
Received: from [2607:f8b0:4864:20::42a] (port=40596
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKn3-0007Ms-U1
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:04 -0500
Received: by mail-pf1-x42a.google.com with SMTP id a39so12643212pfx.7
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HVufiE0vyQLswkYAsBYJ6cSo8sjE6jK0Xc+XAd3WqGM=;
 b=ei6z05ZJigIZJpryKfvzJKNzAcWpxvt4QBh1A3x3JphlQetx/R1qRDHgbkjmWkC+qD
 gfYyCHRMUELWpwPN92EYJOjYKXqklvN3WyycZ7wyH8Nw6mH8ZOWkesn2rZ4wM0XlrefC
 ZDP2a9P46riaZRwDZwYu/1c68FQBJNN01Vv0pD3P8l8mxM3m+/t92jL7PMACsSrIvQFx
 9sVMaEMe5WRUoISRB/Ofiq8Ng/DoKCngvI/UHosIfYesnMLXyagjNkcvi/2kvHGZlzbf
 5D+PZ0chhlt1vyBg5cUP7skXdGluuzYWu7A3KWRwHPyMDcM4KrEmPwZOB/LdnqXilCwX
 27Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HVufiE0vyQLswkYAsBYJ6cSo8sjE6jK0Xc+XAd3WqGM=;
 b=5en+Vd5QkpTQIvhZ/Q/ExEUqF/CiaQGdxxvDlZw/beySa9+1ZrrqI6EHds97Xc2ukG
 5S1eVZonqYsW699ozwMZAY47b/jD1nuDumsM1lGj+RvJBWY5x8fcKNCZBgZBDuUNWI5l
 RGPHVsZKYTuS0Oq+QYPKeAbEqMD2m9AGHmY+EYlu04UYgHdUluqCkwgiGh71EiQINoqU
 /Gh/e3vB/ffwNEvl8e1nj703+Sc7JnflQHOlPPp+oNQvy1U5Ta3EbUSA6+ASowW3eng5
 DXKEVuiBmaoDhJOLyi47JIZtLp0i5Tjd2/W6co5aGfZCtj+N28SjnaylmAxloKoVUxKi
 79BA==
X-Gm-Message-State: AOAM533H8LCONgXS8IuOmsbFlf7l5q7aMpbADzqEkZN+jwT1RkHa3l/W
 DX+pIuwphnVIBWVaYRz3AUrxtAwbw8eMjSl1
X-Google-Smtp-Source: ABdhPJy+Dm2t4YS+jvuoHxZswGGCVtxi+qh4n3SbEPKuoisq+Ob5mjW3LYm3NreSRvmKUScnrsBaXQ==
X-Received: by 2002:a63:5641:: with SMTP id g1mr8285634pgm.579.1644543120621; 
 Thu, 10 Feb 2022 17:32:00 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/34] tcg/i386: Support raising sigbus for user-only
Date: Fri, 11 Feb 2022 12:30:35 +1100
Message-Id: <20220211013059.17994-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
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
index 4dab09f265..faa15eecab 100644
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


