Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BACC63B8886
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:35:21 +0200 (CEST)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyf3Q-000814-P3
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0m-00059F-0F
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:36 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0h-0001yi-J3
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:35 -0400
Received: by mail-pj1-x102e.google.com with SMTP id n11so2386475pjo.1
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dZt3Z++y99AGLIT8n4FaOlYOmeXV3kfGnWJ9nKg5oaU=;
 b=JYk3+ZtR6XsxKQCbh/W8aBJ1epmQJmi9sO/7xeK8d2ouVZsM7svTwDJs+9sLXDHRS5
 kg8Fs+y+UVYca8Mju6KEQCz+3ABSQAMVV8nEBprIohchh0fLFaDQokyQDgw4tM0trRwn
 Xxt4BRr3mkbpdVHC71V8xBBcvRpYvK6wBMbc0n49bI5Q0pQnBrhgTWC68lc7i1Ka+Rgi
 Zq2v/eDhtx/Fx95kQW/iQE/rVq3O5FomNSfCffutZp1BaxO/lY6+Hu5R68m+ZnQVtrQp
 rdsX5+GyicuRX5WUHSBfgWrKQMgxBtbGU04ZCUlMODKLzVU3N5WaiuSnfLNkq6tha2Se
 dmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dZt3Z++y99AGLIT8n4FaOlYOmeXV3kfGnWJ9nKg5oaU=;
 b=Mxm0/a5gZKXkVDKerh3UjEQ8OVX9qrr5PngV6Pmdb8A1v9Yt2kBdWvRf1XqsfJMr4C
 JQnAXH/ULsAGKwl985azt1PS3Q/KWSNvLMnVSzU4Y3elZNfzKraeYinLS5LcZEjxIXud
 hJ37PTI+mRv7etWtkXlnAL04Eyr/KSS5C2hjMcXlHrVekiS/WtS07puz/hDq8tp7cqpz
 AxwZBxzpzoLaF2qU9XqUcHDHlcDEFrkbjfSV47/5UJjxfyiWNRn2oB7aenf89XBAOI8Y
 6AOrhPiHS0t4QKknBlQi2+dTu2r7aDSP4LFFsx2daH/oTgTZAsF5ieVcOhwMn6xUFBOU
 D2/Q==
X-Gm-Message-State: AOAM532hFKbJxmxdnJUEICjNagCh3on7zK1D8PKxCFvKASGq4do1KcIp
 x5ABrmBoNoewUpDNnI6zJ8p1BAsAh/C7Lg==
X-Google-Smtp-Source: ABdhPJyXZhV758pTJtES1ZkTBbgRig+6zkgvpk8MUXd0c/df3Vs1tV58FfPY0VesmBiFa7LCcKl8UQ==
X-Received: by 2002:a17:90b:30c2:: with SMTP id
 hi2mr5518631pjb.130.1625077950413; 
 Wed, 30 Jun 2021 11:32:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/28] target/alpha: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:02 -0700
Message-Id: <20210630183226.3290849-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 8fa00a79d1..de769f7633 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -441,12 +441,7 @@ static DisasJumpType gen_store_conditional(DisasContext *ctx, int ra, int rb,
 
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


