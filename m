Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A31731F324
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:36:25 +0100 (CET)
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsqO-00073S-3F
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsj4-0007Vb-Lf
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:28:51 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsj2-000314-SE
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:28:50 -0500
Received: by mail-wm1-x32f.google.com with SMTP id w4so5136555wmi.4
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UbCbe7JoTiE4HG47VRxDttCSYMBJO1p5W411N64P0j4=;
 b=Re1FCiuZ3bw2BDoIcGme+ztzLmAzncc6+EjeJLU8uUzBOntQpMhbGHNGd0x7Sn1jZg
 OXYJdZd9p/+rb4ZdhgHDcsJ4CDu4aHK2qgrohGbx++jv99LUe17RiKaIbpzV3iTozZUn
 kAY2Ii3VGdp1vk8ZzFbGgELZVfUwBB3AlNLB2+/gsE45lspbWr4GpESn9qOzIq+DE9Uj
 jufFAlo0ylG1v5CyMB+irv3z3ydKATHf4pQrSyjJZBggC7iOVnqdQlan+2P4a0ukQLk1
 /7jsKbFZ4KqF0FCmqO5ORztaqfQqMUztHRQUbhFHd7SXs3gJECnoEKdj6KGjXNlY+408
 yY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UbCbe7JoTiE4HG47VRxDttCSYMBJO1p5W411N64P0j4=;
 b=gsp5g6RmegAm5autsbXSJQbGNhQH/3JXO9kDrpttsS4TtjdMmhIi6wgGrl8LPX+VlP
 qbPmeQzNc/5Ran9Xi1Pi9mtefSKMyUGgUvUc7kNly8LceO2wI+PFrU2nqy37BstMIkKW
 1fdM9JHa3nDZ3R9IinRhC6Kpnq3J0Y9C8SWuMMXq3jflXiwyTd9k80cVPMILOgDr7W4J
 zyrtnkUey/GZBvO6TpvugIJyJg9iKKyvmUf5YKrv/60kaiTAQPzkuZo4IxNxlTYRZcoM
 nZM1qlp4lp0cvA0kGYhYh5a7dvOiq3Dv61I6c2/qyB88LPJQV+T1QjGGr/z6cEwst9zC
 ng6g==
X-Gm-Message-State: AOAM533jwbkaPsdpUqhVVr5CXf3p10JlerLQQ3VxY4ppCZS9Hr18YKQ0
 dHIAoSmY/o+KMRkRL2Hnw8b2Puf3OrM=
X-Google-Smtp-Source: ABdhPJyO/HK0xsGFRG1uFXcyspZMEX83aFUtKw2rtcAQ05VM6FJtHgBeuj5eLNtma2xpQYiQ9m0GfQ==
X-Received: by 2002:a05:600c:3546:: with SMTP id
 i6mr5655798wmq.24.1613690926940; 
 Thu, 18 Feb 2021 15:28:46 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j40sm8918938wmp.47.2021.02.18.15.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 15:28:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 1/5] tcg/tci: Merge identical cases in generation (arithmetic
 opcodes)
Date: Fri, 19 Feb 2021 00:28:36 +0100
Message-Id: <20210218232840.1760806-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210218232840.1760806-1-f4bug@amsat.org>
References: <20210218232840.1760806-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
cases that are identical between 32-bit and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210217202036.1724901-5-richard.henderson@linaro.org>
[PMD: Split patch as 1/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/tci/tcg-target.c.inc | 85 +++++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 48 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index feac4659cc8..ea42775cb03 100644
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
2.26.2


