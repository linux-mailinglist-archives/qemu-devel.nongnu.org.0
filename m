Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD36700A9F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:46:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxi-0007FK-4I; Fri, 12 May 2023 10:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxe-00078s-4D
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxN-0004kK-J1
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:33 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f42711865eso41131645e9.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902476; x=1686494476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F0QOGVZAMk1HDBJjf1QtYWjsE8LxD2Kt5Aw9i/wccVs=;
 b=e7Qb+rhigALwzcgzgZYFBQIjyO/pBcHh5qdGWR1C58pO5LTJv31OQTIV15N4rzZHwL
 VWDMD726soFoVF0IQKKMGZH6rJ99hZgiYqeifE6mV5K6mxo/PS4ArtlGGJ1M2rTGAFtp
 74ngztRX5Ao13zy7nqdUdBb5bmVuH3PWTFEvrioA4RJbYK7nrgVCSewdy6MfwMDA0S43
 ie3K0rkMmXNwduyeEHD7aQ4Ha1nNxgx5TeWL+DSVEqi4Q0aUz98sCSwdJtOGp0S1gHRP
 Drsm5UGQiY40aGBPfb5dzoXjGi7xFSz1cT5ad3sc0NyISh7L7JzK1iMzww//V+oSyoky
 lRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902476; x=1686494476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F0QOGVZAMk1HDBJjf1QtYWjsE8LxD2Kt5Aw9i/wccVs=;
 b=UCjLoLq+DdvhItP8LQrMTOF/zpj7X9NgEqa7nM0m73Mv+DFlqa8PeTWTkq3Vku0MuF
 SWs1qoEMrwOa9f52ixmME0PFF7RTineqPQfbYelNFXtukDYgZeIi4ndj/ZSoXFDjCKkM
 ttAB9blNZNVuZJ+NyE35n/WpnBb1FBTWYqW50Na27mOAJTav2Rac406Bo8NjxHTYa3+6
 J+izFjSJ+7uexX8PBrHKCVdD8pC/K32c7SYm11dRS0r+e+5zIFBqD58aewHHmcbvAuVS
 1laWT13fpXq/6kcsn0J8yphOq3zsSlBaOQFKVmofWnlfo/23/5SqSIOhq/l2+xxz478G
 78fQ==
X-Gm-Message-State: AC+VfDyZGAmUg3dv+fEYG6B+nB7S7tV/a7wk/RcP09MgSLR8QvH6kKlW
 DJKvP0n7t83riCTjLqCLAzNhkw==
X-Google-Smtp-Source: ACHHUZ7ocunhUQvJ7KqZxb/6SNCscAzRncwhRfKQe0TgSpRCjq7XpECftWIGlbP3OeaFjOYtBpvjZw==
X-Received: by 2002:a1c:7917:0:b0:3f4:2bb3:a5ba with SMTP id
 l23-20020a1c7917000000b003f42bb3a5bamr8931976wme.3.1683902476010; 
 Fri, 12 May 2023 07:41:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 16/20] target/arm: Convert conditional branch insns to
 decodetree
Date: Fri, 12 May 2023 15:41:02 +0100
Message-Id: <20230512144106.3608981-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Convert the immediate conditional branch insn B.cond to
decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  2 ++
 target/arm/tcg/translate-a64.c | 30 ++++++------------------------
 2 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 68dc820ece0..8514235a723 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -128,3 +128,5 @@ CBZ             . 011010 . ................... ..... @cbz
 @tbz            . ...... nz:1 ..... .............. rt:5 &tbz  imm=%imm14 bitpos=%imm31_19
 
 TBZ             . 011011 . ..... .............. ..... @tbz
+
+B_cond          0101010 0 ................... 0 cond:4 imm=%imm19
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index bd59d0616e3..724dca8c579 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1371,36 +1371,21 @@ static bool trans_TBZ(DisasContext *s, arg_tbz *a)
     return true;
 }
 
-/* Conditional branch (immediate)
- *  31           25  24  23                  5   4  3    0
- * +---------------+----+---------------------+----+------+
- * | 0 1 0 1 0 1 0 | o1 |         imm19       | o0 | cond |
- * +---------------+----+---------------------+----+------+
- */
-static void disas_cond_b_imm(DisasContext *s, uint32_t insn)
+static bool trans_B_cond(DisasContext *s, arg_B_cond *a)
 {
-    unsigned int cond;
-    int64_t diff;
-
-    if ((insn & (1 << 4)) || (insn & (1 << 24))) {
-        unallocated_encoding(s);
-        return;
-    }
-    diff = sextract32(insn, 5, 19) * 4;
-    cond = extract32(insn, 0, 4);
-
     reset_btype(s);
-    if (cond < 0x0e) {
+    if (a->cond < 0x0e) {
         /* genuinely conditional branches */
         DisasLabel match = gen_disas_label(s);
-        arm_gen_test_cc(cond, match.label);
+        arm_gen_test_cc(a->cond, match.label);
         gen_goto_tb(s, 0, 4);
         set_disas_label(s, match);
-        gen_goto_tb(s, 1, diff);
+        gen_goto_tb(s, 1, a->imm);
     } else {
         /* 0xe and 0xf are both "always" conditions */
-        gen_goto_tb(s, 0, diff);
+        gen_goto_tb(s, 0, a->imm);
     }
+    return true;
 }
 
 /* HINT instruction group, including various allocated HINTs */
@@ -2385,9 +2370,6 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
 static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 25, 7)) {
-    case 0x2a: /* Conditional branch (immediate) */
-        disas_cond_b_imm(s, insn);
-        break;
     case 0x6a: /* Exception generation / System */
         if (insn & (1 << 24)) {
             if (extract32(insn, 22, 2) == 0) {
-- 
2.34.1


