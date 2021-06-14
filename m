Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A063A5EE1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:07:46 +0200 (CEST)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiZN-0003gI-Rp
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi70-0002cv-5C
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:26 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6s-0003dO-Bv
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:25 -0400
Received: by mail-pf1-x42d.google.com with SMTP id z26so10014636pfj.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TjMHnJXoUnjhGFE1iA2UhvGhUmi66dGkfV7HJSIAp70=;
 b=yuFyrMFqG83oKNU44BBMjHzz5MtkKdKVejfaZK+VAYise1c7PiWJnImMwp3Irjui+u
 gtkUHvAdAws0hbUmoV1zUcyhDrPszZJ2N4gk8WOKPY3luw+Evjq7JvRZ3d6zl9ceR0LU
 DevtJu2nTKlYDz+2WITyv63dYvg+Ucsaw/inuO8VRwrBPDPBoJ58pm+unGX4qwNzBxL/
 vROOrDjRVO4XjDl5JO5pJevb6Q5oqTnOC2JlqWY4WEqD3SJv9aXUb7+Ukr6zLXkSyiU/
 fSzEqC6h+ePm5TmjPnHBPh3m6o6eRYBjl0uG68HXYPOm/PB9K1XvaWIvnlMXEVc0bTQT
 B+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TjMHnJXoUnjhGFE1iA2UhvGhUmi66dGkfV7HJSIAp70=;
 b=f4Ct/UYE8INlRduItMZFk8ByfImmKDI0bxOS7s8QfqtW1qBR6deDzWdKa6Abq42QDA
 5c2nadHYVFhoVE6jJ2MPpszzCn4RFan9EzzwbgVCJf93zGtYJ8h0Z8OfOoswsiRUL2eW
 PaWVzYJO9zxRDNcsj8FQ4BocQmhJOfbGyykGkmx9vww2wJRcl0+RBLRaAeIbL2pKZ6DE
 G35atjfeBxAajfYacmNK1CWf65WXffAEmAPHfeBHbE/E/G9pum9ArtsraRsOu4+2pqgB
 Lj6/eBrEtDBJeDNVNM/dJ6aknU3ULmjgu4QIgNnn8ElwAk0LOLkBQBd6eVlyVyScyrkN
 gZlg==
X-Gm-Message-State: AOAM532HiLBEbN75HIZv2097S/wB2pGpgznZUOwVPhcFGO5OppMUUoHZ
 9CE0virAbRr7e8m+wTvc90krVbZHVFdQvw==
X-Google-Smtp-Source: ABdhPJz5clVas3VnbwAuC1bcnjOF2eSKi5n05XPyY+FMo11Duxt7b5xSuPrQH1s+EsyfPv7fTKG45w==
X-Received: by 2002:a63:6284:: with SMTP id
 w126mr16056140pgb.284.1623659896329; 
 Mon, 14 Jun 2021 01:38:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/28] target/mips: Fix gen_mxu_s32ldd_s32lddr
Date: Mon, 14 Jun 2021 01:37:57 -0700
Message-Id: <20210614083800.1166166-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There were two bugs here: (1) the required endianness was
not present in the MemOp, and (2) we were not providing a
zero-extended input to the bswap as semantics required.

The best fix is to fold the bswap into the memory operation,
producing the desired result directly.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/mxu_translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index c12cf78df7..f4356432c7 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -857,12 +857,8 @@ static void gen_mxu_s32ldd_s32lddr(DisasContext *ctx)
         tcg_gen_ori_tl(t1, t1, 0xFFFFF000);
     }
     tcg_gen_add_tl(t1, t0, t1);
-    tcg_gen_qemu_ld_tl(t1, t1, ctx->mem_idx, MO_SL);
+    tcg_gen_qemu_ld_tl(t1, t1, ctx->mem_idx, MO_TESL ^ (sel * MO_BSWAP));
 
-    if (sel == 1) {
-        /* S32LDDR */
-        tcg_gen_bswap32_tl(t1, t1, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-    }
     gen_store_mxu_gpr(t1, XRa);
 
     tcg_temp_free(t0);
-- 
2.25.1


