Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB1B3C17B4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:05:19 +0200 (CEST)
Received: from localhost ([::1]:45306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XSg-0001zt-FY
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5I-0001t9-8Y
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:08 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:42816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5D-0008Dl-Ek
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:07 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 p17-20020a17090b0111b02901723ab8d11fso4177394pjz.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q7Ia+ie6XOcjpcC/dD6Ub5PbrcGQ/yV9nqv+RZL1T9E=;
 b=Zb5N1ghy0UoyUxGnwRPMVaSwvwp99uQaAF3Bv90d5GZ1oZi+2/4hWKCuXjNymS/Srf
 /ZFmkEDftVqcl29c6Z8HTG0HtOVCs47G81NQ7EmYaDsXlyq5r4aE6lir5sB9OKr0dryv
 +to+F6bis6u2wcozoqEC3c8+Gk8NRLf+LRCl6hMaBJLT80ohsBjBWGgNBOC3kLZfNHkA
 HKamPsPWgIUPe2uDGG7SEYipIYOUCjT1P61P20kABzY2gkNZlBkMYXxAVWdc6Jaw7iGC
 m6A/yph+Cy2K+qlR7fEwHJIU4FTk6RgbLdrNcEEtZOCLqkX2GPLJ9lqfrrvI5M/5kF3t
 nqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q7Ia+ie6XOcjpcC/dD6Ub5PbrcGQ/yV9nqv+RZL1T9E=;
 b=bOPij3LqsURRzlzsawjhFU0+Scw7g+UKPUB56TYMG8fA+H1U3h/V91gBqMU0ltU/9P
 hGcgC0HeyW+/g7sPcbs996YJkEyK8zXZq6jBwfQojRO1H/9LTfssbqebOF9bHyiOIIts
 5GZAEP6hu+Ku9LV3WF8JO5ALc5lgQQNAjovBL0p4WqnbQlb16KJtN4hUkMkIjgdZgT2c
 NBAiUOzsyK1KJMcFdK0p24oIx3WPUj0MOjKFPHBSlFIemm01n/TATOXMxY7UVQdVLNA1
 FfEIpcLdo7Rf0gorlB6DjR4l5RoX/uJOw+V6R8fAAthDofDvItjb5EL8RN79cwedIkfb
 4DaQ==
X-Gm-Message-State: AOAM531SVoBJK3PuBSrJIcXpHKUnEgImOyIfUMhOjpINcrhWzPO1eVBv
 7HtuECwuGXqR1W4PQPduW+KEnqHjqLGIDA==
X-Google-Smtp-Source: ABdhPJyoSF+0qVFMA8BSWW2EXJ8hl2cJLi5bXxaAFVVWHbtjCom3v6dOSlZCCFdD6NoA5GJL9Hr17g==
X-Received: by 2002:a17:90a:2e14:: with SMTP id
 q20mr5703605pjd.188.1625762462159; 
 Thu, 08 Jul 2021 09:41:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:41:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/28] target/riscv: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:42 -0700
Message-Id: <20210708164050.711967-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 62a7d7e4c7..deda0c8a44 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -168,29 +168,11 @@ static void gen_exception_inst_addr_mis(DisasContext *ctx)
     generate_exception_mtval(ctx, RISCV_EXCP_INST_ADDR_MIS);
 }
 
-static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
-{
-    if (unlikely(ctx->base.singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
-    if (use_goto_tb(ctx, dest)) {
-        /* chaining is only allowed when the jump is to the same page */
+    if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_pc, dest);
-
-        /* No need to check for single stepping here as use_goto_tb() will
-         * return false in case of single stepping.
-         */
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
-- 
2.25.1


