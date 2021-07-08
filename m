Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0187F3C17FD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:20:43 +0200 (CEST)
Received: from localhost ([::1]:44644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Xha-0005el-2A
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5F-0001kF-Nb
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:05 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5A-0008Bz-0V
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:05 -0400
Received: by mail-pf1-x431.google.com with SMTP id a127so5942820pfa.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64UVSl51I4z0fyHgb4qnEQ+WKR28E3IW7CiGNqO5dw0=;
 b=refHm6/Lncq1hb+OoeTj4BwZzP5tPqqBuGQGXdZGmRIcVY516yNej55VEkVvGR9mUu
 GO1Nm65zPxtTD4aERgOdj2ECBt+ZDr/KmxIUzxnXgS62KFf1Id4er3kAgI0t3dqu75Kk
 JOfg/z7RvD6rmZP6P8H33Zk+5e9F5e0Es2RaptMWYe31JyjRvwlvxF5f3T9P4sxbPKmu
 qkPRhfIpNy+hFptjnIZV+urhSw9BXdE5K3Sb2VKSzwKCTLngk4rnT0g30oeqbA5FcgtD
 cwBHcWqS1o7RA1VlxqgewybV711lum4MSz59AzJiCxujtBxS7okAxlvmO7EB0/vai9We
 o0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64UVSl51I4z0fyHgb4qnEQ+WKR28E3IW7CiGNqO5dw0=;
 b=lmUnsGUasRzCLckOwH5TXfv3RBMkIvdXl6nOjNq9IU0rkID3j+nGByNAI/fDQMIWLD
 BHsAr9T1dKwM4uY7srwSRs31GiPV1L5chYDlaooaoTUO7RiMrW0WQKIVQQSpanIOfXLa
 D5wTMpomh3DwKn1UueM2XXwy9qsgSxV6rcMo2gyDti8+zWYWh7YgvP+BCLq3yngTuM9h
 CIp8Rboj0Vli3ElMcrAj1Jd/DHqJTBwaQ+bHQxTxzbAZvXJcq2LnpnltUYjakGHbZyze
 VtaZO6Ub3damxox/5iyaBllv2/9all10zaJgNVDNxjgVzaRt4uB0YgfwghzYIJszaWYQ
 JJOA==
X-Gm-Message-State: AOAM533lV/0H8sZdJyg3+WRlgl/R+jS5LShCY3V0EARCAo6nbzKcgE6v
 JLCY5L3qbKLlrqzmNPA0vRhd38M5J6l+0w==
X-Google-Smtp-Source: ABdhPJzrJQRIwfglNvy984blDkUq+TReoXj4OvVjpEwlNh1DsSEhIkoOdfKFhcYDGTSQK1kw2GyXvQ==
X-Received: by 2002:a63:5d52:: with SMTP id o18mr33090675pgm.440.1625762457240; 
 Thu, 08 Jul 2021 09:40:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/28] target/hppa: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:33 -0700
Message-Id: <20210708164050.711967-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
index 64af1e0d5c..952cfe09a6 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -817,10 +817,7 @@ static bool gen_illegal(DisasContext *ctx)
 
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


