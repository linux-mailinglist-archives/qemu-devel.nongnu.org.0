Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5326545610
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:58:50 +0200 (CEST)
Received: from localhost ([::1]:48316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPEv-0001CI-3H
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmE-0003b1-Sn
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:10 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmD-0008Rz-FT
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:10 -0400
Received: by mail-pg1-x52d.google.com with SMTP id c14so22823379pgu.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=teH34tLGM/uhEwiASP92UVNlQhKQkgbQt9R4Fk9V4dg=;
 b=bPty2NdEKHE35lMWD9se1mbyIEhUyWDa41JV5I9vM+dO5NKupJHsRxU2yNOEmbpusF
 EhZH0IfJCEUbyWNtSawlrwWu0rOy4YOUY78TDw9bh83kRMmtPSXkvmf08lK6DexJ6x8t
 pLNdd70S6FB+fFuUxyVqm5/O4NL4oEaThtfC8nVg6Qavq80sofJ8xKiMem5rMkaW3gm4
 4soP62tFYNXXUMjjeufpByn78MxyvnvXqN2gE3Rgpq5ewWj50xiM8R3IypFxZUAKw8ZX
 6/vkHD+Li+hPTNsnbA+Et37QW0nPIjT0mmBbJJ9cO7Q47pnDiQCMoojlEv5tasoREMqn
 uhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=teH34tLGM/uhEwiASP92UVNlQhKQkgbQt9R4Fk9V4dg=;
 b=mLYGmQ7MVmmnezfzCmbbJbW/RsONAOffVhtwNvIxphcGNIGDXiVNtJhsrBaAtYMCS4
 J3CfPNAy/SF9QsLbRscKQcPka5+cL8CwQT8oqteuzZ5fAx9id203vrZ7WurN/wq+5WQE
 7dKKhdMRlsDrXSOjqWtLxVCVMhXC1boIDocwutqrkuSjc/63Jj2MesLH1FflyjtcZTe8
 dwBQmcNQrOBV8B0sWggi/GgvhU9KuUZDP6bsWsehsNhC1cj7zAiNYjdeQGizn6RlZ4zh
 nYdYWWvyHfibBjh/RCTFaGj9oZyt3M1y1/S3TnYoM1Z4Kwj8BcysaeDwozpBixTlP7og
 0eOQ==
X-Gm-Message-State: AOAM531ZZw3ef/rjdRYUoZDj/tosMb4nwEpJwT99IL6hLwNthClJtVgt
 DPOeTH5GJQO4kXiSNyN4ZW5vSSABeZr0JQ==
X-Google-Smtp-Source: ABdhPJw6N1IFNJLccqnNYitKiF4theAKORM3WfKUB/dioazAf2Qa+lpzSoFhpWIMNgz2rgzGd8Tg0w==
X-Received: by 2002:a63:2a16:0:b0:3fe:192a:2d3 with SMTP id
 q22-20020a632a16000000b003fe192a02d3mr11525941pgq.39.1654806548002; 
 Thu, 09 Jun 2022 13:29:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 06/23] target/arm: Use is_a64 in
 arm_generate_debug_exceptions
Date: Thu,  9 Jun 2022 13:28:44 -0700
Message-Id: <20220609202901.1177572-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Use the accessor rather than the raw structure member.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 20a0e4261a..a18a09a0c3 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -99,7 +99,7 @@ static bool aa32_generate_debug_exceptions(CPUARMState *env)
  */
 bool arm_generate_debug_exceptions(CPUARMState *env)
 {
-    if (env->aarch64) {
+    if (is_a64(env)) {
         return aa64_generate_debug_exceptions(env);
     } else {
         return aa32_generate_debug_exceptions(env);
-- 
2.34.1


