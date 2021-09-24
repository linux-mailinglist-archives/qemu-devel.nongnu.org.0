Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A6C41796B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:08:58 +0200 (CEST)
Received: from localhost ([::1]:47874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTogz-0000XW-FV
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY6-0002mt-Pl
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:46 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:44741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY4-00072J-Jw
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:46 -0400
Received: by mail-qt1-x82a.google.com with SMTP id r16so10014639qtw.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rvAlqQQaMJOEemK1f4c76TW1TW8p9KSzHxLmC3ERHiU=;
 b=fU77HVUZPzfIQjoQJUr0pIf9YHhi/E5OVVhAfXGjRwlE3gdqRrrn3ZOmnQeMffvmQA
 GNKV7kuuPMLbNbiGBZIGGkRuDsZ+mnRYndT4PDJ54zR4KppaXidApaBEsheLjJiRYwW0
 ZYXPiJsx/VkkFfNnkBoPMsbGo2b8MZHEDIamL8WstPH2bEro0GF7d/MyK1e23hQP8XHs
 fkMqDJJFbX0De/UAzI0ieSDWz2eG3c/LWiopYyl8/fPH3ifJLZS0WlfP3kAluJm23CIU
 eXBibC2Th8hhyv1iE+/6KTuI9v/ZIt0z1ZQPq9ZNn/iV14pbSePG9omWspN0V80P0aPt
 8VYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rvAlqQQaMJOEemK1f4c76TW1TW8p9KSzHxLmC3ERHiU=;
 b=3thep9HwZLL0+mwDx0zq2y7NFNTr8Ks9issXG5JAonPsn6AXcdCdEnrxnB/yXg70K8
 mPH6yMwr0v5iCJqq3AhDlSMTHq1LSGpafICKczZnofhBJfpmQrarYJCK2aZAvKs1AQaq
 3kfZvIZEzWpsR2imqX9x9c6sC+8u5+0SoG/o4Cog8ntzCwVYsl6lWlRpVoi4qfGfo0xC
 bTEwvHm/8LP3XoIyLLNh2hTpOguY2sT3ai0St/V9trheZJCBgX7MUfwuLbA9GUTyfg8A
 G5reEkLb+b5YZaIFtZ3BSKOr58tdOdCM5FBwFifrdk/4unzR3tXu+y1qd30zzsA0rVaf
 JhhQ==
X-Gm-Message-State: AOAM53349ZIuwMC2TeZBzIMf4LsM7cTq89QbEh3r3iXKNWSZEpZe/qQd
 AcnPzbKtsCzCxWOqxmfJpRtc13hs0poV2A==
X-Google-Smtp-Source: ABdhPJw1vNYQhZ6dwN0LwU6n+K3GOz+tnmPyT/sDCvKpfUOc0sf/t/Jo/eM1z5fJKNeZngWAMOltKg==
X-Received: by 2002:ac8:7143:: with SMTP id h3mr5378609qtp.242.1632502783131; 
 Fri, 24 Sep 2021 09:59:43 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/27] linux-user/ppc: Simplify encode_trampoline
Date: Fri, 24 Sep 2021 12:59:19 -0400
Message-Id: <20210924165926.752809-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sigret parameter is never 0, and even if it was the encoding
of the LI instruction would still work.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/signal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index e4d0dfa3bf..77f37b9f01 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -309,10 +309,8 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
 static void encode_trampoline(int sigret, uint32_t *tramp)
 {
     /* Set up the sigreturn trampoline: li r0,sigret; sc.  */
-    if (sigret) {
-        __put_user(0x38000000 | sigret, &tramp[0]);
-        __put_user(0x44000002, &tramp[1]);
-    }
+    __put_user(0x38000000 | sigret, &tramp[0]);
+    __put_user(0x44000002, &tramp[1]);
 }
 
 static void restore_user_regs(CPUPPCState *env,
-- 
2.25.1


