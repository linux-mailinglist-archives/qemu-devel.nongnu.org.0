Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6963C3F15FD
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 11:16:55 +0200 (CEST)
Received: from localhost ([::1]:34612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGeAQ-0000PX-FD
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 05:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzM-0006K8-J5
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:28 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzK-0000HY-OJ
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:28 -0400
Received: by mail-pf1-x432.google.com with SMTP id t42so2307581pfg.12
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 02:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gHsQub6dgXk5izfZm4KxXE3aZtQVWz9lmDcpviRGa+c=;
 b=wc3A+W/cQVuGQQWYoReaH6MuuPJ1gg6OIvxiI7d9BYlGvPZi4gzRXQo24FUgAj2Zv8
 4EfC7FMCxScLfCD8ROhAhrNmkeAHN0XhRvT8H5CYAB0+Wtj7JRY5P1ysG+S0cOaFbP2+
 FZXpx/Yjr2Y8/YwD+xlMWIxxt7SAXqyhKQtzwaLYmXRWHDD7tkkvUZAY0Avphfm730YA
 wkOrtcgWywRH5Il5AzLcihWYwO51ayZom/hgcI1iNW7IoDpF/epZpNFSQ+jzCSBcRAI8
 Q6lszIJeH5JHja0lER6kyR2BlYdT8AujNzdtFdEL19pfeiwerFAaVTUWrJbxQMvyLwTQ
 tiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gHsQub6dgXk5izfZm4KxXE3aZtQVWz9lmDcpviRGa+c=;
 b=h+mFcRXPLrVVpC+nczJA9BUSSxFoiqdcbBCZqxXHIIH2VrYN6l8s/aYlch0hYE808g
 xAMyR7f9xf7q4/bj6BHrxA3WtRRlbGBaV4Hl6loXbBVW60GsDu/Gw+OJNtYqaVEjQwsr
 tTWE86NnPsMknpG0P9C7CMiDuYx68rCTZ9I+VeE0GvZbxv+u4NK/OKXhRzS7ylIQz1oy
 JxiozWeVoofL8VN35Xz6cQDQOqaUHYKKFGYLkoBlEDRsqP88GB5UXGEm7H/FpTjNPA/g
 9rv9svTCGKC0g82VKWI3bhgXPNM7UzLvIRvXUCsqk79e91+esakdkzlfVSTF8vHpTA5m
 GQqw==
X-Gm-Message-State: AOAM53296EB01DLSIvI9DZFEc11Vvsnvmb9747pnabdSqNp++eEzArbx
 4kERSiNuIypPWlxccCp8ppwUZCB001apgQ==
X-Google-Smtp-Source: ABdhPJyK2f8mitfYFqTvgLtWlpcsM2P+6ud7BnW24mei6n2OCOoHAtvXbzHkuR8gD9w38tguaDntsQ==
X-Received: by 2002:a05:6a00:23ca:b0:3e1:2d8:33f3 with SMTP id
 g10-20020a056a0023ca00b003e102d833f3mr13924264pfc.42.1629363925450; 
 Thu, 19 Aug 2021 02:05:25 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j13sm2944707pgp.29.2021.08.19.02.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:05:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/21] target/riscv: Add gen_greviw
Date: Wed, 18 Aug 2021 23:04:53 -1000
Message-Id: <20210819090502.428068-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819090502.428068-1-richard.henderson@linaro.org>
References: <20210819090502.428068-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replicate the bswap special case from gen_grevi for
the word-sized operation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index b97c3ca5da..af7694ed29 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -568,12 +568,24 @@ static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
     return gen_shift(ctx, a, EXT_ZERO, gen_helper_grev);
 }
 
+static void gen_greviw(TCGv dest, TCGv src, target_long shamt)
+{
+#if TARGET_LONG_BITS == 64
+    if (shamt == 32 - 8) {
+        /* rev4, byte swaps */
+        tcg_gen_bswap32_i64(dest, src, TCG_BSWAP_IZ | TCG_BSWAP_OS);
+        return;
+    }
+#endif
+    gen_helper_grev(dest, src, tcg_constant_tl(shamt));
+}
+
 static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
     ctx->w = true;
-    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_grev);
+    return gen_shift_imm_fn(ctx, a, EXT_ZERO, gen_greviw);
 }
 
 static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
-- 
2.25.1


