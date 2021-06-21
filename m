Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF8F3AF945
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:25:38 +0200 (CEST)
Received: from localhost ([::1]:47786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTIO-00069H-EN
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC0-0000cZ-Kt
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:00 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTBv-0005tU-FH
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:00 -0400
Received: by mail-pg1-x529.google.com with SMTP id e22so9217332pgv.10
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=13Q3k7x622C0VwURZHkyf+R7o121K1QECu/gh8+RjTk=;
 b=OYCLN7BkdIz1CcsmByB8bu1vvWt5gdOWc39g0EdagBIiH+ZZY22gdxRy88JVeYq+Fr
 rNC5zKgbnlH7+CgUkwY63Uxay1holAk00GMAJmbDAyblxyXLFveiobZTAwGcsmM6wC9N
 cpmhmWCRvgkkHJI38r5h1wY/9wFjw4YhwecvUO/XgbHc1kB47Vy1bZ8Y1mSGUWmOzmrV
 6QJqgSfxmjVfYIW8TgwD1SvIXM7xVLtDQe5hmWCiEEY5gWNY5RNc0ahYw66gpgQF29eU
 Az6E3vOwDicxGIPhyQvY2NPEoTz9vcr382gmSkwaM1cPdfWX8CtHuoIcUxQdbr8u7NJD
 Rt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=13Q3k7x622C0VwURZHkyf+R7o121K1QECu/gh8+RjTk=;
 b=AKqJBAL0AZNDUnJtL7/GJG4LuOETRAVrUPwqPYUS7nAAbydMW2x8JTTYixFM1pLNbe
 HzulT0jYVonOgEteOa350ULGPctvHfVJypDE9TpjSvEk6YCKBTd1Ym/jC1kaHTCi63RI
 Z71Fzm9pgGVNft8B/c8Bjn4I1W854Tkgk/p0d3oJS2lNMnn5Bv3z07ozKR8tN810Zayy
 9faEh0V8XZWUQABSyzD8LVF+IvRzyi2HFvnYhAzuzBiCLans4zisoTOoZtWwD99bx0In
 3iuZyr1ujRAzRzaQOoEguhgstw592w3mHU5MOzrnYr44j5nHFSXapoRj4n5MboSOhEFp
 d1nA==
X-Gm-Message-State: AOAM5338QhmN3VI0TXh0MKg5zSzPvfRDYqoKIC7ye87uksDWPIR42dLo
 3czEKeah6q0UxdYPeQwT0Szk7uFQKSfftg==
X-Google-Smtp-Source: ABdhPJzDr2AzjFyT1MOIzJ6RenQ1LXSe9GY2ogFowY0pN5tSTgNC6LyEkRZe9ifzV7Wfgw9shIgukQ==
X-Received: by 2002:a62:3344:0:b029:28c:6f0f:cb90 with SMTP id
 z65-20020a6233440000b029028c6f0fcb90mr592074pfz.58.1624317534092; 
 Mon, 21 Jun 2021 16:18:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:18:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/29] tcg/aarch64: Support bswap flags
Date: Mon, 21 Jun 2021 16:18:24 -0700
Message-Id: <20210621231849.1871164-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 8619e54fca..72aa7e0e74 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2177,12 +2177,24 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_rev(s, TCG_TYPE_I64, MO_64, a0, a1);
         break;
     case INDEX_op_bswap32_i64:
+        tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a0);
+        }
+        break;
     case INDEX_op_bswap32_i32:
         tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
         break;
     case INDEX_op_bswap16_i64:
     case INDEX_op_bswap16_i32:
         tcg_out_rev(s, TCG_TYPE_I32, MO_16, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            /* Output must be sign-extended. */
+            tcg_out_sxt(s, ext, MO_16, a0, a0);
+        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            /* Output must be zero-extended, but input isn't. */
+            tcg_out_uxt(s, MO_16, a0, a0);
+        }
         break;
 
     case INDEX_op_ext8s_i64:
-- 
2.25.1


