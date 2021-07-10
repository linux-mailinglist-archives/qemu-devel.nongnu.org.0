Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF23C354D
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:43:49 +0200 (CEST)
Received: from localhost ([::1]:55652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F8u-0002m1-Bw
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExS-0005Or-Qz
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:58 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExR-0002JK-6M
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:58 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 d9-20020a17090ae289b0290172f971883bso9383767pjz.1
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZglPt3N3rss3fI4UqwR7t9q8pcVs9CWbKgZQEubMq5c=;
 b=VF2E9FFCb8GFoOsU8hlNnbmXVtj9nyJ7DzkhHu6VGfVpCwlc88g90F5cL7H9No09OG
 RKj/Gg5UiHnRTkG0UH1Yo2bb/eat1RPt6+u7VB7CJzdCzcYWTV3l4pywx9anzxkA6qbj
 cqUisAWWmQZT8Sz+NWfnLv/PYBxS+04r+bVdmuWchJYwyZwW4Aq16ptJJ+6X0gGvsDAi
 kLhJ97p/3faxi79Q9S8uT1R9Wmr6v9Km/tL0YuGP0QeBy6nmblRA8F6dIuPKqJTA+Nz4
 NwyQ6LVnY+wZY0beDdQE/69kDiHCztmYCmwQopzV3A2sx9i8PCEmU9pCa4MeVy12m3j3
 NWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZglPt3N3rss3fI4UqwR7t9q8pcVs9CWbKgZQEubMq5c=;
 b=QuT9VgxUMueA5TSC3aJEUXi0h21WlV8EldFXRZDtoG5yE5T3czWXT0KkYKS9O0N9d0
 wS3n6V9R9ekIZKqRSup1Zpxyhvcrmayl9Bf3ICmu5qxgeALVggj9dcysVKldg/C1Sq4i
 a+vxp4c+lmGp1p7rtni16tHFUzbQn9wrNRE12ICKziP+RxdmNdT7MxNqTHq/ZNb4pvFh
 +7XrfNp13ad3uKQNye2+67sXd34Lw5rFgP0JZ+l+Cq76rmHnJeNZ49bkwmXLty255xam
 bQjxigAtQq2LqUOSdxiDCJL89PZDx63vpoCCUY7ew2NOa9MfM3ezC3mE/WL9JmAona7R
 0yGA==
X-Gm-Message-State: AOAM530FZgfAwGWEMM+m0vDqDWpVpaDs2uw3Y7YLVWO1bq5DSH8ArgVN
 k/gGPHkouBbTSaT3IuUCbANLI8Z1IpeKZA==
X-Google-Smtp-Source: ABdhPJxz05CsnotTBnWWrYdjqaRKZR1PK50AZxVnVWAWt/bmwGkVtqs6aLri85kxPSA3N+t567RfUQ==
X-Received: by 2002:a17:90a:bd06:: with SMTP id
 y6mr44234358pjr.6.1625931115853; 
 Sat, 10 Jul 2021 08:31:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/41] target/hppa: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:18 -0700
Message-Id: <20210710153143.1320521-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
 target/hppa/translate.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 424ec3252e..835120c038 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -816,10 +816,7 @@ static bool gen_illegal(DisasContext *ctx)
 
 static bool use_goto_tb(DisasContext *ctx, target_ureg dest)
 {
-    /* Suppress goto_tb for page crossing, IO, or single-steping.  */
-    return !(((ctx->base.pc_first ^ dest) & TARGET_PAGE_MASK)
-             || (tb_cflags(ctx->base.tb) & CF_LAST_IO)
-             || ctx->base.singlestep_enabled);
+    return translator_use_goto_tb(&ctx->base, dest);
 }
 
 /* If the next insn is to be nullified, and it's on the same page,
-- 
2.25.1


