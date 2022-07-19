Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5968157A612
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:07:01 +0200 (CEST)
Received: from localhost ([::1]:39764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrca-0000ih-Fg
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWF-0005ti-6B
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:27 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:41788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWD-0006AB-Ht
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:26 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 w6-20020a056830410600b0061c99652493so7068366ott.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jY3a70HYN9nK0tMErtaVJBwYrjq2ULedvsEhArnyW7M=;
 b=jcMMx26Z6g048x9DYHHLU5R5s+rrtmzAQ+ohWrHs9d8jwJcLYB8newzWwxkDrgoPzI
 Rrp6mxQ5ztNFlf5e4uETt82VlGYqfYF5Y4neFcyZ2TRPe/fy0avbG2US95gJ4amu1bFT
 6RxaSG8puIP/e/keCrElvI+K1W7zMaT+qY81bK56mByVPsz6hl1eCmJtKwIj3rVwxR43
 pRNPyKmXxaD7dOGNvijMC1jhowAcBNULgeZ0ieQwW4AxMOFW0ueSI9Px9ApjuxXuYBXp
 ixfER6H9e0uWWvf7sDAemMhUiv4TnHf/7Ldy50ner+6YBxinVM9xY1XUXFZuEN1HJyFu
 9rfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jY3a70HYN9nK0tMErtaVJBwYrjq2ULedvsEhArnyW7M=;
 b=q1qFqLZJ26Xwr7l0xmYAxrje4K7vJfC4rZ6BXj3pHrpcBUpONM/JbEwyZkjJLkMzAU
 SJCypbk5eI7MDCAbfgUiv9omY8iyHBOHNi+Vn/5rg48Pl4cEV1ywemmj7OxJRxzXAghC
 1JWlg3Il3yHRhEvprHEJII8LdnefZ3FU9jWcDKJN4R80TGmo1AZJj4B6+AvKVf/Lypf6
 Qj4Q4rRDSF2fFbqI0i1bWCqeFdjxmaTSoPwxciAXCgKBFQOoKm1+A+KOYvxk/Nb0G05k
 PuvdU2mCH/fMeQGrbumxhslDt5PQyR1qbThi67UkvJJt92e2IZ0Mshze+p7G0pc4IUeG
 aGFw==
X-Gm-Message-State: AJIora9IlC6FdGK14LFYwqwKqiOr6hPZfUyZyPEU7yAe53W+YCd7pA/q
 Wa7VuK/9eJDn3lXojvqrw8+eGXqaU4+bZVjd
X-Google-Smtp-Source: AGRyM1snNN8aSW5vk9lDO62X8x49c4C1aqiWyDrezd00NJfA71e7bnCWCr5+RLHnefhaAz1H65ZdGQ==
X-Received: by 2002:a05:6830:4a5:b0:61c:b012:faa0 with SMTP id
 l5-20020a05683004a500b0061cb012faa0mr2896294otd.46.1658253624893; 
 Tue, 19 Jul 2022 11:00:24 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:00:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 04/21] target/loongarch/cpu: Fix coverity errors about
 excp_names
Date: Tue, 19 Jul 2022 23:29:43 +0530
Message-Id: <20220719180000.378186-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Fix out-of-bounds errors when access excp_names[] array. the valid
boundary size of excp_names should be 0 to ARRAY_SIZE(excp_names)-1.
However, the general code do not consider the max boundary.

Fix coverity CID: 1489758

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220715060740.1500628-4-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 5573468a7d..0d49ce68e4 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -140,7 +140,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
 
     if (cs->exception_index != EXCCODE_INT) {
         if (cs->exception_index < 0 ||
-            cs->exception_index > ARRAY_SIZE(excp_names)) {
+            cs->exception_index >= ARRAY_SIZE(excp_names)) {
             name = "unknown";
         } else {
             name = excp_names[cs->exception_index];
@@ -190,8 +190,8 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
         cause = cs->exception_index;
         break;
     default:
-        qemu_log("Error: exception(%d) '%s' has not been supported\n",
-                 cs->exception_index, excp_names[cs->exception_index]);
+        qemu_log("Error: exception(%d) has not been supported\n",
+                 cs->exception_index);
         abort();
     }
 
-- 
2.34.1


