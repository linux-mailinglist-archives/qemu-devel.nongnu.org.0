Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353D63AF962
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:31:05 +0200 (CEST)
Received: from localhost ([::1]:37746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTNg-0001RK-8U
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTCB-0001Fb-FM
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:11 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC8-00062q-LC
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:11 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso736232pjx.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=48z68ulW8GGIpMYTx1SRl+BJDLbN2VvaGGeLWdHXQ9E=;
 b=ik9OLGwxhyWb7jtxZOih9jWRXRamr6sJrXfok3YGTAGuAks3ctMThGyJLyAoAyvn/E
 s4DhG7Z6OI5kJQ36HXO6ww3mamXv+uplBn3Rfo+p4KHRrtVk6gzvWXkNKhQwt+12gtFN
 DfHgSava8r1Hl4JMKzzBTCYleDzJ0TsYTdmp1ctKJyP97lSmKdzCGMbdlTy88feQQXOn
 ovup/pdgtO0YHmDyz2Tld6gonwdI5vXYu7VCciMRwOgYJ7lCi43cUlXMsq/cEA5+Fm+H
 D05i+ripmj7Xc319Rpf9VAho/zJvGLA2jS9oXD0LuSR9jNHr5Y9G0QUvIMt8SNhtef+s
 yC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=48z68ulW8GGIpMYTx1SRl+BJDLbN2VvaGGeLWdHXQ9E=;
 b=Y5+vNMYStdXSeQUUEHpr0TEhajU3hSXsKcZt4yoqhnkl/rp2okVaIFkrt/jIEardkh
 PIUlqa/1xryvc7nIso4+tPJvWr5Md/gAkfv7ksYxQYodssYR/Wz9oNx4JjjTEphsy4As
 eus6Ejp2QVdt9J5GOUaJKOxvLwL2DAvxrzruJrmAYQXNmHzuXb8h5vGnqQaInhjiokGf
 4iISu3iGVAyr1nw56ekM4e82fpauWanmRsXc8sbDZncKoToOoV6XPcnX9AqWREUeu1Vi
 SR8Et45PXWDVIQrPzLvOmu9Ur19VYtykROi4Jnst/3AHvKgKSAGzCQXgKW5oMJPvkWY1
 DwhA==
X-Gm-Message-State: AOAM5339+jHUzd/psAVN7cEBn2Md049O3fnYr6s8XDgL1oBKZYjx/fNU
 blJ5ybohVWxm6G5In7n0pV4UEdXk2QAFGA==
X-Google-Smtp-Source: ABdhPJydnbMWPJEj1uQcWLfEi4c3HGaIbRxtPmRwvNVzK1Y5j0Qez0e1LSTz4X6XlXVFAHPl4q7j4w==
X-Received: by 2002:a17:902:8207:b029:124:4f60:740e with SMTP id
 x7-20020a1709028207b02901244f60740emr8568522pln.56.1624317547387; 
 Mon, 21 Jun 2021 16:19:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:19:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/29] target/mips: Fix gen_mxu_s32ldd_s32lddr
Date: Mon, 21 Jun 2021 16:18:46 -0700
Message-Id: <20210621231849.1871164-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


