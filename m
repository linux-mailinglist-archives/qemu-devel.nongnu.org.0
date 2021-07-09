Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC5B3C1E9B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:46:38 +0200 (CEST)
Received: from localhost ([::1]:51906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iPN-0003Rd-QE
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5o-0006D9-K4
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:27 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5d-0001TZ-ST
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:24 -0400
Received: by mail-pf1-x434.google.com with SMTP id a127so7568471pfa.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 21:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dOZ5v8S9L+KcISDEuXtshwNMh5i3cnKKIThbnOAdoo8=;
 b=Ypf9XI5QYgDVB/e03IkRtUr91a/prrD3pueB984lS/MrJzNrQHJNO5y0l1HcE3C3jT
 fa++gGaP6C1rzJlypFry4MJcHGqqilAAmZkxF46MzvtiOxTpWhltkbs32Hj8bPBB2u/w
 AgyS7XTPZYdAmRkP+QYHDFCDDL/HWCHC8UoR+bPF2jCZKM7++SyMH3Uvx/L0e8iniOOG
 firQpldxXo2tQPyfJbCpsdR4+hxIkjG4wR9Ki4W+ivNzSAl2E3OuUZC6Nwht6E10S6RS
 F2DiBAQ3bSd1O0RWcshIlrmCagqSU6InBPTjPcsknagD48K2201q2QBQyIDreFwQNYoO
 l7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dOZ5v8S9L+KcISDEuXtshwNMh5i3cnKKIThbnOAdoo8=;
 b=EcA4YCpMWhHFjJMMOeUvxrzaL2cueQmNoh7WEOhmRyGh1gizqrgOHo7hZqiYzhFXMg
 sAhB6di0HMXoCWFA5xp98Wrbu1yb/GSfN8EpNtvT21Yovzz/XYfWjR3tbtisMm8opikN
 Z5NMnFda2DrxbTUbMh1gllrSWIddmJ78YDr6UEHfamgoguDbhcAs7eU/y6QabvEc5FcG
 k2hdIWwx5X0RhraF/xkVM0kUhsluLYWACXFCocfah0Y9vKFe8X+W/L/V5hWhMniW1dE2
 R4JeO49uBFjKyuBLU7GQQGV657/3BkKnaTrTdfTVZdQCD2UuW0tmEVJ56NgpI8Dxybkp
 14dw==
X-Gm-Message-State: AOAM530EIQLpv/UgdkJTO4iuHesqj90NJ04hdZkQqgQBArwXLF9LLSeD
 Klgv0zN3TEMlKNlFr7yjFpca1DHA9nwY0A==
X-Google-Smtp-Source: ABdhPJxRV68D1b9W4XoIhN8oALytE+1lYDw8fjEmoGmOBOPgdRL8XrfmI4QmRqwWZp9l0ISJWEx/3A==
X-Received: by 2002:a65:41c7:: with SMTP id b7mr2517533pgq.81.1625804772055;
 Thu, 08 Jul 2021 21:26:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/17] target/riscv: Use gpr_{src,
 dst} in word division operations
Date: Thu,  8 Jul 2021 21:25:55 -0700
Message-Id: <20210709042608.883256-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allocate new temps to hold the source extensions, and
extend directly from the source registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 46 +++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a60b198623..7dedfd548b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -502,42 +502,40 @@ static void gen_mulw(TCGv ret, TCGv arg1, TCGv arg2)
 static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
                             void(*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
+    TCGv ext1 = tcg_temp_new();
+    TCGv ext2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
-    tcg_gen_ext32s_tl(source1, source1);
-    tcg_gen_ext32s_tl(source2, source2);
+    tcg_gen_ext32s_tl(ext1, src1);
+    tcg_gen_ext32s_tl(ext2, src2);
 
-    (*func)(source1, source1, source2);
+    (*func)(dest, ext1, ext2);
+    tcg_temp_free(ext1);
+    tcg_temp_free(ext2);
 
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    tcg_gen_ext32s_tl(dest, dest);
     return true;
 }
 
 static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
                             void(*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
+    TCGv ext1 = tcg_temp_new();
+    TCGv ext2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
-    tcg_gen_ext32u_tl(source1, source1);
-    tcg_gen_ext32u_tl(source2, source2);
+    tcg_gen_ext32u_tl(ext1, src1);
+    tcg_gen_ext32u_tl(ext2, src2);
 
-    (*func)(source1, source1, source2);
+    (*func)(dest, ext1, ext2);
+    tcg_temp_free(ext1);
+    tcg_temp_free(ext2);
 
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    tcg_gen_ext32s_tl(dest, dest);
     return true;
 }
 
-- 
2.25.1


