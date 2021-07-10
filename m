Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FA03C3555
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:49:10 +0200 (CEST)
Received: from localhost ([::1]:47622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FE5-0008TH-7M
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExY-0005k0-9L
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:04 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExW-0002NP-QV
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:03 -0400
Received: by mail-pl1-x62f.google.com with SMTP id p17so6110008plf.12
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4qenbk3bz7QNKjCkCTPORT5jxhyyeVTLVG8BsPWvMRw=;
 b=hVZllncHPTcFQVtMLmh0BqjVoqPTxIg/jC89WTQzH0JNgRr8We6d+Orz/aJzNXUqsl
 iNgYH/3/rHUvmrKuh5d6KbxYq/AeCLtrHx/HifBTKzxVVgqqJXH57c7e2Sn+A2FC9c+/
 oeMFHCZj7GaiI4jVJVXmNT4+7Ezl6JAyG3QaugvfKyxSGTKH2U2wdqRTEqjXI8QyiOtF
 lbBgkTPYnGGGetTwASS3+jgm3EhsMAjo7xvcbe/R/v5rR1UUVDRX5iChqd/sNAAvRU5l
 VRBE32zWeoIPJtVpf8kRLKHfmOUG7QpM/jQFs95fI1TFQ2S8hF1qrBqtn1wlhe2jTM30
 JQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4qenbk3bz7QNKjCkCTPORT5jxhyyeVTLVG8BsPWvMRw=;
 b=GL9rUSQXj1s9NcC3ee7gr4z1kQKOxkRP9ilJnd7GIAv28nSfeHrcH+9w9pLXNT03ys
 qFn2bXHIiWXF0FCoS9YAuHweAovdeTpzbNi1PRGJSQjz+w0mbd/Zf1apWqbTZgxDGM93
 XaHbW0YHqStFHWSKRtC+qiJwj/ubSDjVHglavUlcQYEHayzCK1Kh76ljzMIbQRiQZbdx
 MQbCYGBESStXWtnV2JXIPgJGSJuccm8d0JkvmRPtrOmm81m3wmm6yD622hEj1jrJoGap
 /LFBNUQAVBQzywsUgTpPC2HvIwWNKD1aiOGntiRG6NchW3yIYWpdjFTZ+Kwrcarmq52M
 tjBA==
X-Gm-Message-State: AOAM530ENpnMm7e+aLQV7nF+g5xIZ095vexqZvqt9eH+cDnuvRDOW63S
 TT43LnD1NfaxJnP8GjnbsoF3WNl720Ip3g==
X-Google-Smtp-Source: ABdhPJzpDuQiP+hC5Mt40ggIu7LGOkFwux8XQd7UPJn6a8kHuw8MQ5GC035PrcpG/wzsSkd3ttC1yg==
X-Received: by 2002:a17:90b:338d:: with SMTP id
 ke13mr1248954pjb.151.1625931121524; 
 Sat, 10 Jul 2021 08:32:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/41] target/ppc: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:26 -0700
Message-Id: <20210710153143.1320521-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 07d79acc08..0ad601793c 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4301,15 +4301,7 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
 
 static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
-    if (unlikely(ctx->singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&ctx->base, dest);
 }
 
 static void gen_lookup_and_goto_ptr(DisasContext *ctx)
-- 
2.25.1


