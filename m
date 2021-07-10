Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E348F3C3554
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:49:09 +0200 (CEST)
Received: from localhost ([::1]:47556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FE4-0008Qq-Vd
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExX-0005hc-LL
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:03 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExV-0002M3-Ah
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:03 -0400
Received: by mail-pl1-x629.google.com with SMTP id c15so6622166pls.13
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ecRVVJ3PnvHarcdzmtFHD+/SxpG+hJSwypTpiV6o5c4=;
 b=z0w78xErV9Q5ye6dE/JYPJiEaGxka+dq2yUQJT6vX0Xrt9b7+zn9mArFpQZQXID4vq
 oxlE4fz3ZvbRzPNWCJjDtd+NeiewumKKTHQUF2wDBYFnvUfDdKByZvD+KaM4YlK+kZ39
 Eoz1+T8Mhqr614JGrYt61tSXhvADyIUxoc++BpVOsuIApmPqANd0VgyD+ZknKjtHgnb9
 bPYk8BoXdgz3UEnyUAewGS9WHmTHplnHsdaJjvgso8K/YugGI9aUEzQ7c2C8huzhGiui
 W5QYJ7NrLRRVB1JGKv8j641SQOiPmCBOYPfUra6MiCDBJdt9GqnoLiuZbdnvFxA7TMIJ
 f9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ecRVVJ3PnvHarcdzmtFHD+/SxpG+hJSwypTpiV6o5c4=;
 b=XPr5Ds3APvH8ejQyB6fpwAi228foLwI5nJ9xP02VYqRM3uz1hmXtOO4TWJPQvtdjOO
 0cxp36e5t2BSsMVSi2a7/38ZkNQ8AgM9hwp5C00RchkKevIy/tu8z/bx3H61J3gxXneV
 ogwlTaR2Bv4dDmT2UFp4cYM2YXTCpTY/C9wInTvnCTLUpFlBA48wZj4/svEx1tNkOFLH
 +qGTuN7uudWBRZTbw3u9YQVxygO32lzewkVj+LKkQLkkIb+AwjKrL80SsmzFWtGMNbxa
 OHW45ZcSReLz8f1OMe8drSKb0zCApR+7eKXoP6T1GzOABE20toaAQ25nS/xNASoDYJNg
 +26g==
X-Gm-Message-State: AOAM533hjLXydmal65ibAD9+TJ+RJaCi64uxKOHbWtzUlfvsqOG6BmZ5
 Ppz6Qyv5dp0gPT4sUAXVOe985NFNDfwwIw==
X-Google-Smtp-Source: ABdhPJwUbdvzEU4yI5eKHwsTqVqSORyLijJtYpOD6Pxdqf/CmcP/QmZPWLjPUcDb3LHcmXCVKsswWA==
X-Received: by 2002:a17:902:ff13:b029:129:9a0b:c2dc with SMTP id
 f19-20020a170902ff13b02901299a0bc2dcmr24846099plj.45.1625931120100; 
 Sat, 10 Jul 2021 08:32:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/41] target/nios2: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:24 -0700
Message-Id: <20210710153143.1320521-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 930f3d3395..17742cebc7 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -150,24 +150,11 @@ static void t_gen_helper_raise_exception(DisasContext *dc,
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
-static bool use_goto_tb(DisasContext *dc, uint32_t dest)
-{
-    if (unlikely(dc->base.singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (dc->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
 {
     const TranslationBlock *tb = dc->base.tb;
 
-    if (use_goto_tb(dc, dest)) {
+    if (translator_use_goto_tb(&dc->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_R[R_PC], dest);
         tcg_gen_exit_tb(tb, n);
-- 
2.25.1


