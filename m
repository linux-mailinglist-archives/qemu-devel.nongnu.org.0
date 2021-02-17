Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A71731E021
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:23:47 +0100 (CET)
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTMQ-0008EE-6a
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTK9-0006eM-Mf
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:21:28 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTK5-0006tk-3m
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:21:25 -0500
Received: by mail-pj1-x102d.google.com with SMTP id cl8so2149361pjb.0
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VvjDH0d9yENa4ecfbUN1MGRyNECdD1MomwyxKEWSk7s=;
 b=I3lzKJEizV7zMgZ8OZSkX86X/huDEzrhil1Ku6/t7uU6JxKaSQS1LbnwS+oWmHLqs7
 u1Dy5V+QYoDMQzsk2Og37cgqZASYVXYmwStXSp+KreEVidFKpWB3C1tHhlDlAUXEor5M
 YP1uj+3aZBQxIpZSK2hcIRe4TNirFw1FBkjVGdPD6DR9tuMobUA7vcFFL+ct3x054QLG
 A0drYczodo8ffWWLisZO0pfdWmzTHLfb0vz68ZtYswiOOeWXwrbXNK/UVPsaEIe0vBXj
 veE2qIHcNMxP+5IyAKYHtpZksIgHTUJ6NzLpuNfkNJb1UgPyJDi9H+TAVWi/BqcVstBS
 A26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VvjDH0d9yENa4ecfbUN1MGRyNECdD1MomwyxKEWSk7s=;
 b=AjOTdHXTdPIMecQTcDPQ8YE8e6dTpdW0mZRGmKPpQZrzh7tILCg6+dMXVWA6Aq/UUX
 ECZ8Vt4+clf8ew8+GQMEc5sPHCcC45D6zg8FbUsVcFyBIqFkTTEUJarW2ghSHbUCPDg5
 YAw3sozV4HrPavm+cW5FGKnAhUU+83S0Q4X3omTbINSwdQK5BKFPVJb4Xi+5c1xLEr5I
 GhU690L/muZ8Q9g6m7/IVRVIvVk6b/rJ0nRc3jaZQRuapfCobwsq7kFK52MPkSHb5QSI
 WXOmNQCDv0pTNbTUX+aq9E1XSRPmMz/5gG8qeCz58PjbpA9EE4UGy2+CaNx4/swKK95B
 Ql0g==
X-Gm-Message-State: AOAM530Rfj1HzdmNVjra41mPJpTZCCl/k0GO8iB4rXJ+Ir0/azRRebPd
 A5GAQ/BbwIMQYJQ/IAb/uvm0S51+iEdTlw==
X-Google-Smtp-Source: ABdhPJy+JAhkyBOukJi4GMDGlQHQqiR5AMj2z2fQrdr5HmKH3moJDaoU5Ibg0rrubp+1zBZYo7O+ZA==
X-Received: by 2002:a17:902:ec82:b029:e3:751d:cedf with SMTP id
 x2-20020a170902ec82b02900e3751dcedfmr742195plg.66.1613593278154; 
 Wed, 17 Feb 2021 12:21:18 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:21:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/71] tcg/tci: Merge identical cases in generation
Date: Wed, 17 Feb 2021 12:19:29 -0800
Message-Id: <20210217202036.1724901-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
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


