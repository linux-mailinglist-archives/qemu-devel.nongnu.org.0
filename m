Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A63932A8D9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:08:20 +0100 (CET)
Received: from localhost ([::1]:58384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9RT-0000mO-GU
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HN-0002ZU-TM
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:53 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HL-0007YG-Rs
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:53 -0500
Received: by mail-pg1-x529.google.com with SMTP id h4so14313054pgf.13
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3oEIKQLfBmHUmZruF1WOanf+8RYMbOoh2V8q7ZF9vas=;
 b=NA5IY7WjuHn+kN+KBip6z9d02qYrtcUvCCIqgRwXcQ82kcKLZVEA3/8bJwNee3XjJN
 WBiDC4soeyvQLvK+hHqjK4HlokSZW6rmUAzL1frSNR141WCDpN2rf//2Z1EyBALKf8Qr
 O1Ne7HX6PiuN2RiQhqgewvwTrs8KICptDN8hjqWyIs/STfqP30Gm4Q3r8xZllQ0Qjdpa
 S0+uaZBMqRY0xulE2K4H8bSrrMKGF3C6H/Kf1s0Mn4G8ujxuYh5qQcCEk8mFu0T1N/8S
 vY2klQJUMUWmOkLn7SeAlgI2pk9+YobFCq5IpV6lr3tWYDJAHCmISbL6qHlm+H3rIV7q
 u1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3oEIKQLfBmHUmZruF1WOanf+8RYMbOoh2V8q7ZF9vas=;
 b=XM3A4P/YrFsLosXJcvUkbwYjD0IbS0MLgrisgJSp1Hb8TV8cIRwp1J5W8b5ZnKorLF
 F5eD4Mebi2R/GFXnsFL3rsK/ftb77znXinlBC/pDDwTcZM1X0Zy+aFCfsasfPXb/jDkz
 jzm0BQ0ACGjpN0zByqhIY3AXC8NKqsih9zWChoAAP5wi5osnr5cHEQ93825afBegWlyo
 h+nCUcRJ/0VgJqVoGm4Ps1gOgIEy/A4Suk96SI+SpR9fBZveGeAEf1xFsYiB4xb8jtVL
 yAYrU4oVtm5ZXMwrsyb9Uy6N2zonfHS04owpe695lZrQP6QK1dtx9diNJ+8/WPTBawbr
 sdDg==
X-Gm-Message-State: AOAM532P6UQ7sjs3Vq+vlwXo9JU7FM39oZOgc2E/3SWxc0YLIg8kExyC
 5TroCtgllq6hjJmK/pE0C9DlRtD2L60x6g==
X-Google-Smtp-Source: ABdhPJxD3awSbGJiJPQHpIAxjeJmQUrDUvV/ZyOFhD/HmaUtql6wkp0CVkatOGRdsMqVjLzlRQ7L+Q==
X-Received: by 2002:aa7:86d9:0:b029:1ee:c1e0:63f8 with SMTP id
 h25-20020aa786d90000b02901eec1e063f8mr2017398pfo.55.1614707870532; 
 Tue, 02 Mar 2021 09:57:50 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/27] tcg/tci: Merge identical cases in generation
 (arithmetic opcodes)
Date: Tue,  2 Mar 2021 09:57:21 -0800
Message-Id: <20210302175741.1079851-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
cases that are identical between 32-bit and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210217202036.1724901-5-richard.henderson@linaro.org>
[PMD: Split patch as 1/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210218232840.1760806-2-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 85 +++++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 48 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index feac4659cc..ea42775cb0 100644
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
@@ -456,22 +469,27 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
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
@@ -487,30 +505,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
 #if TCG_TARGET_REG_BITS == 64
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
     case INDEX_op_deposit_i64:  /* Optional (TCG_TARGET_HAS_deposit_i64). */
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
@@ -551,14 +545,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
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
@@ -628,8 +615,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
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


