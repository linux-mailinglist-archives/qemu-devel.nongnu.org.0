Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989AA312906
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:45:41 +0100 (CET)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wYW-0001T9-JU
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wR9-00014n-P7
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:03 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wR7-0005hK-HG
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:03 -0500
Received: by mail-pj1-x1030.google.com with SMTP id t2so2758809pjq.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VvjDH0d9yENa4ecfbUN1MGRyNECdD1MomwyxKEWSk7s=;
 b=TGsb+7jckFxk/Zx7PDs+hYGpc4OWlLs8a4L/o7VlSjWo5Wwmt2bboljgZYmDbcZi/4
 9viipVBcTqRdd22xD0gSToSdPn9FCA7nJENvZ1a5kswHJthhCPxtPs2HNv/9tU4bc9Jg
 mSCFY/vuStgxWSSfGeeaZqibCaZdLkKAZm9YphK23mG4klgICr7dZqmoqiZm4shsBZCN
 Brcw6RuGwUP2HcZTdob7wve84ZX5rtmYT1j0L4VsMTLa4BODs+VzTFI2qwqP6tb33IND
 gSQaaIwdSDFPS+RIEiQCdqmJxZMAtCmhcgMJV2+uSeKq7riO6Z0oNzqY5HpdSEgZdicG
 FwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VvjDH0d9yENa4ecfbUN1MGRyNECdD1MomwyxKEWSk7s=;
 b=SqFTRudfxc/OWtvvjh7+CEcqD/RgLNKrI7bSD1vt6EJnU3mzYyED0ToPpRm06YrPXy
 hXSb2ukIOj3pTDgj9NtJfhs+pFDIDlIwOXvXbi5wRUnjRoK1CNKA2+lnKF7Ia/0nRJZP
 Uu6eYpH1gfssvZSd4Jh+xQqDH9bof8cQrBn5v2rtWPsASY9/6pdNOnNss8HK0v/mpFIX
 1VYXjJFtHHHFrr5Bja2rdjbwlDHIMEXTK2zywUB61ghdPo9CqNEK7mHgBu9DRecE0Xol
 xi6IEtJCoonVf2cm3R+MXxO5zRqSkbEklkJLdxzCeBcKW52oHJWulsb2Bvl8Xb+QbG7c
 JIHw==
X-Gm-Message-State: AOAM531pRAz1ib5+yp7Y/JHgHojvjB5nMAvoYyvFF6PSmOEePwH8bDZr
 Iemr4/8BBOiLHmT9ZXwmTYOe56i7lvuwWw==
X-Google-Smtp-Source: ABdhPJyU2N5m8mTr6EonR402FvHKqznszH9nRohGj/5AVrkKXsmb6SHUsd1xOWB29qZIHmf6CzR6Xg==
X-Received: by 2002:a17:90a:657:: with SMTP id
 q23mr15212296pje.192.1612751880053; 
 Sun, 07 Feb 2021 18:38:00 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:37:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/70] tcg/tci: Merge identical cases in generation
Date: Sun,  7 Feb 2021 18:36:46 -0800
Message-Id: <20210208023752.270606-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
cases that are identical between 32-bit and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 204 ++++++++++++++-------------------------
 1 file changed, 73 insertions(+), 131 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index feac4659cc..c79f9c32d8 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -380,6 +380,18 @@ static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+#if TCG_TARGET_REG_BITS == 64
+# define CASE_32_64(x) \
+        case glue(glue(INDEX_op_, x), _i64): \
+        case glue(glue(INDEX_op_, x), _i32):
+# define CASE_64(x) \
+        case glue(glue(INDEX_op_, x), _i64):
+#else
+# define CASE_32_64(x) \
+        case glue(glue(INDEX_op_, x), _i32):
+# define CASE_64(x)
+#endif
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
                        const int *const_args)
 {
@@ -391,6 +403,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_exit_tb:
         tcg_out64(s, args[0]);
         break;
+
     case INDEX_op_goto_tb:
         if (s->tb_jmp_insn_offset) {
             /* Direct jump method. */
@@ -404,15 +417,18 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         set_jmp_reset_offset(s, args[0]);
         break;
+
     case INDEX_op_br:
         tci_out_label(s, arg_label(args[0]));
         break;
-    case INDEX_op_setcond_i32:
+
+    CASE_32_64(setcond)
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
         tcg_out8(s, args[3]);   /* condition */
         break;
+
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_setcond2_i32:
         /* setcond2_i32 cond, t0, t1_low, t1_high, t2_low, t2_high */
@@ -423,60 +439,54 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_r(s, args[4]);
         tcg_out8(s, args[5]);   /* condition */
         break;
-#elif TCG_TARGET_REG_BITS == 64
-    case INDEX_op_setcond_i64:
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out8(s, args[3]);   /* condition */
-        break;
 #endif
-    case INDEX_op_ld8u_i32:
-    case INDEX_op_ld8s_i32:
-    case INDEX_op_ld16u_i32:
-    case INDEX_op_ld16s_i32:
+
+    CASE_32_64(ld8u)
+    CASE_32_64(ld8s)
+    CASE_32_64(ld16u)
+    CASE_32_64(ld16s)
     case INDEX_op_ld_i32:
-    case INDEX_op_st8_i32:
-    case INDEX_op_st16_i32:
+    CASE_64(ld32u)
+    CASE_64(ld32s)
+    CASE_64(ld)
+    CASE_32_64(st8)
+    CASE_32_64(st16)
     case INDEX_op_st_i32:
-    case INDEX_op_ld8u_i64:
-    case INDEX_op_ld8s_i64:
-    case INDEX_op_ld16u_i64:
-    case INDEX_op_ld16s_i64:
-    case INDEX_op_ld32u_i64:
-    case INDEX_op_ld32s_i64:
-    case INDEX_op_ld_i64:
-    case INDEX_op_st8_i64:
-    case INDEX_op_st16_i64:
-    case INDEX_op_st32_i64:
-    case INDEX_op_st_i64:
+    CASE_64(st32)
+    CASE_64(st)
         stack_bounds_check(args[1], args[2]);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_debug_assert(args[2] == (int32_t)args[2]);
         tcg_out32(s, args[2]);
         break;
-    case INDEX_op_add_i32:
-    case INDEX_op_sub_i32:
-    case INDEX_op_mul_i32:
-    case INDEX_op_and_i32:
-    case INDEX_op_andc_i32:     /* Optional (TCG_TARGET_HAS_andc_i32). */
-    case INDEX_op_eqv_i32:      /* Optional (TCG_TARGET_HAS_eqv_i32). */
-    case INDEX_op_nand_i32:     /* Optional (TCG_TARGET_HAS_nand_i32). */
-    case INDEX_op_nor_i32:      /* Optional (TCG_TARGET_HAS_nor_i32). */
-    case INDEX_op_or_i32:
-    case INDEX_op_orc_i32:      /* Optional (TCG_TARGET_HAS_orc_i32). */
-    case INDEX_op_xor_i32:
-    case INDEX_op_shl_i32:
-    case INDEX_op_shr_i32:
-    case INDEX_op_sar_i32:
-    case INDEX_op_rotl_i32:     /* Optional (TCG_TARGET_HAS_rot_i32). */
-    case INDEX_op_rotr_i32:     /* Optional (TCG_TARGET_HAS_rot_i32). */
+
+    CASE_32_64(add)
+    CASE_32_64(sub)
+    CASE_32_64(mul)
+    CASE_32_64(and)
+    CASE_32_64(or)
+    CASE_32_64(xor)
+    CASE_32_64(andc)     /* Optional (TCG_TARGET_HAS_andc_*). */
+    CASE_32_64(orc)      /* Optional (TCG_TARGET_HAS_orc_*). */
+    CASE_32_64(eqv)      /* Optional (TCG_TARGET_HAS_eqv_*). */
+    CASE_32_64(nand)     /* Optional (TCG_TARGET_HAS_nand_*). */
+    CASE_32_64(nor)      /* Optional (TCG_TARGET_HAS_nor_*). */
+    CASE_32_64(shl)
+    CASE_32_64(shr)
+    CASE_32_64(sar)
+    CASE_32_64(rotl)     /* Optional (TCG_TARGET_HAS_rot_*). */
+    CASE_32_64(rotr)     /* Optional (TCG_TARGET_HAS_rot_*). */
+    CASE_32_64(div)      /* Optional (TCG_TARGET_HAS_div_*). */
+    CASE_32_64(divu)     /* Optional (TCG_TARGET_HAS_div_*). */
+    CASE_32_64(rem)      /* Optional (TCG_TARGET_HAS_div_*). */
+    CASE_32_64(remu)     /* Optional (TCG_TARGET_HAS_div_*). */
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
         break;
-    case INDEX_op_deposit_i32:  /* Optional (TCG_TARGET_HAS_deposit_i32). */
+
+    CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
@@ -486,79 +496,30 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out8(s, args[4]);
         break;
 
-#if TCG_TARGET_REG_BITS == 64
-    case INDEX_op_add_i64:
-    case INDEX_op_sub_i64:
-    case INDEX_op_mul_i64:
-    case INDEX_op_and_i64:
-    case INDEX_op_andc_i64:     /* Optional (TCG_TARGET_HAS_andc_i64). */
-    case INDEX_op_eqv_i64:      /* Optional (TCG_TARGET_HAS_eqv_i64). */
-    case INDEX_op_nand_i64:     /* Optional (TCG_TARGET_HAS_nand_i64). */
-    case INDEX_op_nor_i64:      /* Optional (TCG_TARGET_HAS_nor_i64). */
-    case INDEX_op_or_i64:
-    case INDEX_op_orc_i64:      /* Optional (TCG_TARGET_HAS_orc_i64). */
-    case INDEX_op_xor_i64:
-    case INDEX_op_shl_i64:
-    case INDEX_op_shr_i64:
-    case INDEX_op_sar_i64:
-    case INDEX_op_rotl_i64:     /* Optional (TCG_TARGET_HAS_rot_i64). */
-    case INDEX_op_rotr_i64:     /* Optional (TCG_TARGET_HAS_rot_i64). */
-    case INDEX_op_div_i64:      /* Optional (TCG_TARGET_HAS_div_i64). */
-    case INDEX_op_divu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). */
-    case INDEX_op_rem_i64:      /* Optional (TCG_TARGET_HAS_div_i64). */
-    case INDEX_op_remu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). */
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        break;
-    case INDEX_op_deposit_i64:  /* Optional (TCG_TARGET_HAS_deposit_i64). */
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_debug_assert(args[3] <= UINT8_MAX);
-        tcg_out8(s, args[3]);
-        tcg_debug_assert(args[4] <= UINT8_MAX);
-        tcg_out8(s, args[4]);
-        break;
-    case INDEX_op_brcond_i64:
+    CASE_32_64(brcond)
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out8(s, args[2]);           /* condition */
         tci_out_label(s, arg_label(args[3]));
         break;
-    case INDEX_op_bswap16_i64:  /* Optional (TCG_TARGET_HAS_bswap16_i64). */
-    case INDEX_op_bswap32_i64:  /* Optional (TCG_TARGET_HAS_bswap32_i64). */
-    case INDEX_op_bswap64_i64:  /* Optional (TCG_TARGET_HAS_bswap64_i64). */
-    case INDEX_op_not_i64:      /* Optional (TCG_TARGET_HAS_not_i64). */
-    case INDEX_op_neg_i64:      /* Optional (TCG_TARGET_HAS_neg_i64). */
-    case INDEX_op_ext8s_i64:    /* Optional (TCG_TARGET_HAS_ext8s_i64). */
-    case INDEX_op_ext8u_i64:    /* Optional (TCG_TARGET_HAS_ext8u_i64). */
-    case INDEX_op_ext16s_i64:   /* Optional (TCG_TARGET_HAS_ext16s_i64). */
-    case INDEX_op_ext16u_i64:   /* Optional (TCG_TARGET_HAS_ext16u_i64). */
-    case INDEX_op_ext32s_i64:   /* Optional (TCG_TARGET_HAS_ext32s_i64). */
-    case INDEX_op_ext32u_i64:   /* Optional (TCG_TARGET_HAS_ext32u_i64). */
-    case INDEX_op_ext_i32_i64:
-    case INDEX_op_extu_i32_i64:
-#endif /* TCG_TARGET_REG_BITS == 64 */
-    case INDEX_op_neg_i32:      /* Optional (TCG_TARGET_HAS_neg_i32). */
-    case INDEX_op_not_i32:      /* Optional (TCG_TARGET_HAS_not_i32). */
-    case INDEX_op_ext8s_i32:    /* Optional (TCG_TARGET_HAS_ext8s_i32). */
-    case INDEX_op_ext16s_i32:   /* Optional (TCG_TARGET_HAS_ext16s_i32). */
-    case INDEX_op_ext8u_i32:    /* Optional (TCG_TARGET_HAS_ext8u_i32). */
-    case INDEX_op_ext16u_i32:   /* Optional (TCG_TARGET_HAS_ext16u_i32). */
-    case INDEX_op_bswap16_i32:  /* Optional (TCG_TARGET_HAS_bswap16_i32). */
-    case INDEX_op_bswap32_i32:  /* Optional (TCG_TARGET_HAS_bswap32_i32). */
+
+    CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
+    CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
+    CASE_32_64(ext8s)    /* Optional (TCG_TARGET_HAS_ext8s_*). */
+    CASE_32_64(ext8u)    /* Optional (TCG_TARGET_HAS_ext8u_*). */
+    CASE_32_64(ext16s)   /* Optional (TCG_TARGET_HAS_ext16s_*). */
+    CASE_32_64(ext16u)   /* Optional (TCG_TARGET_HAS_ext16u_*). */
+    CASE_64(ext32s)      /* Optional (TCG_TARGET_HAS_ext32s_i64). */
+    CASE_64(ext32u)      /* Optional (TCG_TARGET_HAS_ext32u_i64). */
+    CASE_64(ext_i32)
+    CASE_64(extu_i32)
+    CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
+    CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
+    CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         break;
-    case INDEX_op_div_i32:      /* Optional (TCG_TARGET_HAS_div_i32). */
-    case INDEX_op_divu_i32:     /* Optional (TCG_TARGET_HAS_div_i32). */
-    case INDEX_op_rem_i32:      /* Optional (TCG_TARGET_HAS_div_i32). */
-    case INDEX_op_remu_i32:     /* Optional (TCG_TARGET_HAS_div_i32). */
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        break;
+
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
@@ -584,31 +545,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_r(s, args[3]);
         break;
 #endif
-    case INDEX_op_brcond_i32:
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out8(s, args[2]);           /* condition */
-        tci_out_label(s, arg_label(args[3]));
-        break;
+
     case INDEX_op_qemu_ld_i32:
-        tcg_out_r(s, *args++);
-        tcg_out_r(s, *args++);
-        if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-            tcg_out_r(s, *args++);
-        }
-        tcg_out_i(s, *args++);
-        break;
-    case INDEX_op_qemu_ld_i64:
-        tcg_out_r(s, *args++);
-        if (TCG_TARGET_REG_BITS == 32) {
-            tcg_out_r(s, *args++);
-        }
-        tcg_out_r(s, *args++);
-        if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-            tcg_out_r(s, *args++);
-        }
-        tcg_out_i(s, *args++);
-        break;
     case INDEX_op_qemu_st_i32:
         tcg_out_r(s, *args++);
         tcg_out_r(s, *args++);
@@ -617,6 +555,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         tcg_out_i(s, *args++);
         break;
+
+    case INDEX_op_qemu_ld_i64:
     case INDEX_op_qemu_st_i64:
         tcg_out_r(s, *args++);
         if (TCG_TARGET_REG_BITS == 32) {
@@ -628,8 +568,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         tcg_out_i(s, *args++);
         break;
+
     case INDEX_op_mb:
         break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
-- 
2.25.1


