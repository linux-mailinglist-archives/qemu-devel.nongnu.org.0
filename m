Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C883C352D
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:35:08 +0200 (CEST)
Received: from localhost ([::1]:49528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F0V-0005SY-PL
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExO-00056c-93
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:54 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:43739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExM-0002Fp-Ld
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:54 -0400
Received: by mail-pf1-x42b.google.com with SMTP id a127so11671828pfa.10
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=966eOOQRBaspjRNs052m7zB6E/T5XsOP0DeM1nAzdlc=;
 b=sQuD/u1b5YzsFYuc2hKS4vTmW0o1CV+T3BOcAcu+4FEwArKTlf//ki+jy21+D6d9uO
 iB4yeOsL8s6PeZ/zOrB5RtIK3+wh54qBuCmAIZz8BIg7TvgUUsOJzmLuAo3mgDH1laHF
 5Zk/9t1At/QKwYIIxvW/1hlkYXQs+maAKYwlqdEP21hDYCZbmTi74u8deiQ59Wx/kbwn
 MSejRMPq5QjN4Nm8coMqKA5mVCmNGPdgCKiq6R30IGJdzs8/GEjK7pEg6HVx34sylDCv
 imPIbgLjy4LCOtNz889iNam60C1tFNAeJ29naHUwf4lfeJujW4gHJt7ZbyPKz5JFaZQN
 rmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=966eOOQRBaspjRNs052m7zB6E/T5XsOP0DeM1nAzdlc=;
 b=N9JzFEpX6+/M1xpqYNUjj/aFRZs7m/5Q6cS9ZipNBrCm+/scdayrjqioLVnkfqFXLf
 Huw4lNVmbC/kcKGAIPcjI5+X2K49Wh0hy16h68Dc7xP0gmOcgaqwsbcwGxcN7auKcPEe
 Thay5EJKADi2EoDHETiObSfKxM5as/fU03R2Y3VwWGA+453ozwMh11J26W5REO46q2kN
 oaE0re5eNrJ7D0m8oO0at1j/y/gvhdw9f78e7lwZJQJbKchyNo1LVDNR10g3hT+NmBDK
 /XSj5fQ6kzYAON16F7bTlTwrtGLXjcCt5bZ+9nR8DQO7Sk4R8z3EXjjvHSEm0T8W4Bm3
 fJCw==
X-Gm-Message-State: AOAM531FJQc0CvivIvTHI7Q+hgAshUpauFMUoftS5qlAGQjFYNlfwUfJ
 Uhry5EZjtnzgToBuCHy3anZXGU9xQX3jrw==
X-Google-Smtp-Source: ABdhPJxGwTXOUPROVJLWahxE/uye/VfbAFkkgVX5V9xZRQMcprtxGVpga+2DGAdzlJAt7ScngJgblw==
X-Received: by 2002:a63:b48:: with SMTP id a8mr33036940pgl.169.1625931111470; 
 Sat, 10 Jul 2021 08:31:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/41] target/alpha: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:11 -0700
Message-Id: <20210710153143.1320521-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
 target/alpha/translate.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index bb7b5ce994..833d3baa7b 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -440,12 +440,7 @@ static DisasJumpType gen_store_conditional(DisasContext *ctx, int ra, int rb,
 
 static bool use_goto_tb(DisasContext *ctx, uint64_t dest)
 {
-#ifndef CONFIG_USER_ONLY
-    /* Check for the dest on the same page as the start of the TB.  */
-    return ((ctx->base.tb->pc ^ dest) & TARGET_PAGE_MASK) == 0;
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&ctx->base, dest);
 }
 
 static DisasJumpType gen_bdirect(DisasContext *ctx, int ra, int32_t disp)
-- 
2.25.1


