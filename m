Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF11D479C73
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:55:48 +0100 (CET)
Received: from localhost ([::1]:43582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfo4-0004oC-2f
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:55:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbm-0000y2-Ho
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:06 -0500
Received: from [2607:f8b0:4864:20::636] (port=34491
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbk-0003Ur-Th
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:06 -0500
Received: by mail-pl1-x636.google.com with SMTP id x15so4371842plg.1
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=My4hA1ygdO+oZr4YTamroxkNdNl0FZ1DhEZu3fZGnqk=;
 b=OlCUk6IP03wUu89B15+vnUdj1EFBI2grEqbhFyDCjfHBY73m3UE04MTU01D44BCz+/
 4rQzw7m09grg3m6FJRudt0CyN7waaXdy6vB7ms+mjAOGo/Uurmcxc6N4Rn9DqS10YUUM
 a8fvCItWYGVb2QBS/x+fvb2v/6lKTHaeQcXmSWWjrWG81l0Jb2pdkQBXbC4Kx4g0P3Jb
 r8yFQ2tuBsK8vdV7Cc5XK9L9lW9s3QG9QFWWi9SfsedtXV00rYAkiNZlGvrZoicSKXZw
 mwHLfOoWbIoYEXX0vWxQhn4sk2IKCWojgEAng3SdQrcMg3UPuFa00qLQ7J4OFe4ULyTD
 GVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=My4hA1ygdO+oZr4YTamroxkNdNl0FZ1DhEZu3fZGnqk=;
 b=slXsW1SPZABx8WlxS+inF7IaAB3Jl/VOvJ6JWOqeGgBmQ1XbX93wTvOuXE1e/FHqxq
 ZtWgEESBRZ3uWZssA6tPH3/xlGQPOqV6o+rAEFKXNN0vzKyiEHFF4sVzAdILjvEE0RPh
 4Sx04FaT7kBK3VbRACHESorbteKkynZkbH0xC0F988qHdsaEH5tzbyab6gQSHLXEf0XY
 c+eQ13JBAKAKGJ+ycYw0Yknkqm6E0HGU9gfYL6Gk4j1iVoOhmvetIlwR5NuVeVkCph1A
 ka7uhfM7yf2hblGnGA7E/94F1tg5SB7Z1KTZ/qOw+bpPwoXoGRb/Uqtf/zFZWrTzarHK
 YGzA==
X-Gm-Message-State: AOAM533nEvPExJthM229JDBqEBV2g9ogA0lkNmNSvTTcT7elIs5fM5SV
 Hk6zgcxEtXlpYAWbuiu9ZcMvVb2cdO0Kyg==
X-Google-Smtp-Source: ABdhPJzG5HpefEevMBWcYUMfXW1nW9nrKA/dfYkjIJa+jiuOmL1ZLvczZ1UjdXmjaEvMZ2eLgC06tw==
X-Received: by 2002:a17:90a:4dcc:: with SMTP id
 r12mr18977877pjl.13.1639856583698; 
 Sat, 18 Dec 2021 11:43:03 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.43.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:43:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/20] tcg/i386: Implement more logical operations for avx512
Date: Sat, 18 Dec 2021 11:42:49 -0800
Message-Id: <20211218194250.247633-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The general ternary logic operation can implement
NOT, ORC, NAND, NOR, EQV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     | 10 +++++-----
 tcg/i386/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 841b1febab..433a632d6a 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -188,11 +188,11 @@ extern bool have_movbe;
 #define TCG_TARGET_HAS_v256             have_avx2
 
 #define TCG_TARGET_HAS_andc_vec         1
-#define TCG_TARGET_HAS_orc_vec          0
-#define TCG_TARGET_HAS_nand_vec         0
-#define TCG_TARGET_HAS_nor_vec          0
-#define TCG_TARGET_HAS_eqv_vec          0
-#define TCG_TARGET_HAS_not_vec          0
+#define TCG_TARGET_HAS_orc_vec          have_avx512vl
+#define TCG_TARGET_HAS_nand_vec         have_avx512vl
+#define TCG_TARGET_HAS_nor_vec          have_avx512vl
+#define TCG_TARGET_HAS_eqv_vec          have_avx512vl
+#define TCG_TARGET_HAS_not_vec          have_avx512vl
 #define TCG_TARGET_HAS_neg_vec          0
 #define TCG_TARGET_HAS_abs_vec          1
 #define TCG_TARGET_HAS_roti_vec         have_avx512vl
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index f982b6e615..86c66f9522 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -447,6 +447,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VPSRLVW     (0x10 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSRLVD     (0x45 | P_EXT38 | P_DATA16)
 #define OPC_VPSRLVQ     (0x45 | P_EXT38 | P_DATA16 | P_VEXW)
+#define OPC_VPTERNLOGQ  (0x25 | P_EXT3A | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VZEROUPPER  (0x77 | P_EXT)
 #define OPC_XCHG_ax_r32	(0x90)
 
@@ -3004,6 +3005,29 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         insn = vpshldi_insn[vece];
         sub = args[3];
         goto gen_simd_imm8;
+
+    case INDEX_op_not_vec:
+        insn = OPC_VPTERNLOGQ;
+        a2 = a1;
+        sub = 0x33; /* !B */
+        goto gen_simd_imm8;
+    case INDEX_op_nor_vec:
+        insn = OPC_VPTERNLOGQ;
+        sub = 0x11; /* norCB */
+        goto gen_simd_imm8;
+    case INDEX_op_nand_vec:
+        insn = OPC_VPTERNLOGQ;
+        sub = 0x77; /* nandCB */
+        goto gen_simd_imm8;
+    case INDEX_op_eqv_vec:
+        insn = OPC_VPTERNLOGQ;
+        sub = 0x99; /* xnorCB */
+        goto gen_simd_imm8;
+    case INDEX_op_orc_vec:
+        insn = OPC_VPTERNLOGQ;
+        sub = 0xdd; /* orB!C */
+        goto gen_simd_imm8;
+
     gen_simd_imm8:
         tcg_debug_assert(insn != OPC_UD2);
         if (type == TCG_TYPE_V256) {
@@ -3224,6 +3248,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_or_vec:
     case INDEX_op_xor_vec:
     case INDEX_op_andc_vec:
+    case INDEX_op_orc_vec:
+    case INDEX_op_nand_vec:
+    case INDEX_op_nor_vec:
+    case INDEX_op_eqv_vec:
     case INDEX_op_ssadd_vec:
     case INDEX_op_usadd_vec:
     case INDEX_op_sssub_vec:
@@ -3256,6 +3284,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_abs_vec:
     case INDEX_op_dup_vec:
+    case INDEX_op_not_vec:
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
@@ -3284,6 +3313,11 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_or_vec:
     case INDEX_op_xor_vec:
     case INDEX_op_andc_vec:
+    case INDEX_op_orc_vec:
+    case INDEX_op_nand_vec:
+    case INDEX_op_nor_vec:
+    case INDEX_op_eqv_vec:
+    case INDEX_op_not_vec:
         return 1;
     case INDEX_op_cmp_vec:
     case INDEX_op_cmpsel_vec:
-- 
2.25.1


