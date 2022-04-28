Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AA1513747
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:49:16 +0200 (CEST)
Received: from localhost ([::1]:59282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5SF-0002vk-U9
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jb-0005FO-39
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:19 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JZ-0006Gg-EQ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:18 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e24so7060823wrc.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CRvv52+d+nyflDhF667gRsFCpbVgxiD8ZGOfFH1/xUg=;
 b=fHYJuQhq80HvKPL45UFWXVsm1uqW3v8S/TH+5/LJrNvD0QZSb0rS/Tnrnd8K5xts4Z
 EGFBh8mYEXa+vUJGXtO2sq3N/dWP1kKlpDLc66L3MSLhVHxDB0FDDsF4cxe/WXnFmhVG
 bHBJyyiWFYzFsOv7+zZyoWOHQZnj8ZZ72cgp7zVpN75YL/sTN8L4TQ0wb09wCT1l6ILX
 IPVR0lk33gw5nM98CzDYav7lnjXQsvdqGfvMw7bJv6AZwyeah0ufq5sAirj+97VO9apQ
 oWbnGpMQGJ05c5xVWr0JDrjnQl9TkGL84Z6V1N5n2P6mhbDdb7hQvoLLf7gk78KdCbMK
 HiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CRvv52+d+nyflDhF667gRsFCpbVgxiD8ZGOfFH1/xUg=;
 b=f2PuBtaNZ6IRSsIkYQImsKqM9UAoMunHojZuu7JMFxZAKFufCnvZHgNmqj7NRfcslO
 an/vKnlrKFgt18GX01GaWuYcgQfoCvKZZWiviQhy2af9iTLiDxjvfGm7GajjUwjTtFuG
 uLIIr0DA9eijsMS0rMqG6N8sc6pVI+vSSpox1HBdSuK3hXVK/HSXxBCw4Hc8wsxMC3Qa
 2/njcm8RB5DxFiAX4GgPGQu1I1n4/kLQEviEEBo3ldGysvI0vvaOEWbCt9qh88d5EdbR
 YVkLQ2je0XTm416WWD88Zo4PM3glNsG/COcIPJZb+wl8Ed8xKgcHNChgUnLXrLobmc/P
 JTNA==
X-Gm-Message-State: AOAM532woavwDEpVuTwAmlDA0kFG/6F0Q7MTRavjrHmEbXJLZ6eJs/gD
 +swDxCiYKP6wqPEanVdjDW1zOjBFQWQuNA==
X-Google-Smtp-Source: ABdhPJzT/BMLzLlvV9OTckIkG9YMhMc+W2KsKJsOaE1wTGRBHOGxeAV8myk2iUTIVldU8pti9aLb0g==
X-Received: by 2002:a05:6000:12d1:b0:20a:d901:3828 with SMTP id
 l17-20020a05600012d100b0020ad9013828mr17970454wrx.313.1651156816076; 
 Thu, 28 Apr 2022 07:40:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/54] target/arm: Use tcg_constant in disas_cond_select
Date: Thu, 28 Apr 2022 15:39:18 +0100
Message-Id: <20220428143958.2451229-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-15-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3de2b27cc7b..9b678cc5af6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5255,7 +5255,7 @@ static void disas_cond_select(DisasContext *s, uint32_t insn)
     tcg_rd = cpu_reg(s, rd);
 
     a64_test_cc(&c, cond);
-    zero = tcg_const_i64(0);
+    zero = tcg_constant_i64(0);
 
     if (rn == 31 && rm == 31 && (else_inc ^ else_inv)) {
         /* CSET & CSETM.  */
@@ -5276,7 +5276,6 @@ static void disas_cond_select(DisasContext *s, uint32_t insn)
         tcg_gen_movcond_i64(c.cond, tcg_rd, c.value, zero, t_true, t_false);
     }
 
-    tcg_temp_free_i64(zero);
     a64_free_cc(&c);
 
     if (!sf) {
-- 
2.25.1


