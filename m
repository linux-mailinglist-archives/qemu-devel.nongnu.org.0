Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3DA3EB60C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 15:24:02 +0200 (CEST)
Received: from localhost ([::1]:41572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEXAH-0007Fi-6N
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 09:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4k-00060I-M4
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:18:20 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4h-00019r-Ut
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:18:18 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so3462235wml.3
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 06:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d3Hr9Wc4dvCtUGT2UQ15hAVNCLMUJmbjebAXeIh4mmY=;
 b=ClGrxmKMPx+hiwBVmMIfXS7TrxU2IMbo3zfqELLr2OTzFWBrFM1sV5mVlzW1nXLpKN
 1QOFdsyzqEEdSfUuelUFKzWInIgEkyKA9vHK9XnewPZ89yrOVftYZKoA17jecTbMCgrh
 7nH4hUo3J+y+teJTfiEC64AwKeUT/mGx7DMSDFhWCMsJYGGDbFIaSV4YGAwPmbW14Wns
 S+3DCvjHOlDQqjiATBI/OfHq1QXdT84F+Jwewzko1DeVWGrsFwXy3FjGrVu3t0+hDdJR
 Lwp0HVeV0aHix7WyKC2aaYg8tZ8Awx2n9+O1Gy+Lw4lYKTXLwoc0cBBPij2ptLUdQ12T
 J9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d3Hr9Wc4dvCtUGT2UQ15hAVNCLMUJmbjebAXeIh4mmY=;
 b=FNisVOfREZnEUW1iUPMDt/83qPIww9w2PpJcHkuB3MLJbkQOYDM+RPB8byb67uvUZv
 ifJDYcWS5phYH/APsg2cn7p6RYB7bgmIqfr8Ag3WYEdgosu2YrSRCBf4EZSq83xYRDJD
 1u1NUB0oaDLeqoy2txNGJ0zgknJ+jopRzs0ZfaYBXSSHxmheV2r/R7iWregk+qI82LGW
 +BdF2600OTRdQuJM/G26EyS/LkYBt/9NJqZPkPk6yOiqnolGjTp/yddGDdG9EqUj0KpP
 hyzOhI4CAzD91E1PQhTiWR/dLu3bHb2HCmwHJ1TCmw2cV/Rj8BGRI5v6HSmUcwm2fT5M
 3PVw==
X-Gm-Message-State: AOAM5308aFJ1Ri2JqIcUuvPHw4L70wOEB2usu5pSMgApc0kNWiyF9Y20
 Y/0rbLrky8YBGiBnXpyyo9JZ1Q==
X-Google-Smtp-Source: ABdhPJw7HtFJTNglFbgpjAnEk1eBHEm8U3AXhWfaU+EGX9yDpK6MSWUW5grjb14i3pocfMmqRrZL7w==
X-Received: by 2002:a7b:ca45:: with SMTP id m5mr2624732wml.158.1628860694702; 
 Fri, 13 Aug 2021 06:18:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q75sm1585705wme.40.2021.08.13.06.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:18:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 4/7] linux-user: Zero out target_siginfo_t in
 force_sig()
Date: Fri, 13 Aug 2021 14:18:06 +0100
Message-Id: <20210813131809.28655-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813131809.28655-1-peter.maydell@linaro.org>
References: <20210813131809.28655-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The target_siginfo_t we populate in force_sig() will eventually
get copied onto the target's stack. Zero it out so that any extra
padding in the sifields union is consistently zero when the guest
sees it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index a8faea6f090..fd3c6a3e60d 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -636,7 +636,7 @@ void force_sig(int sig)
 {
     CPUState *cpu = thread_cpu;
     CPUArchState *env = cpu->env_ptr;
-    target_siginfo_t info;
+    target_siginfo_t info = {};
 
     info.si_signo = sig;
     info.si_errno = 0;
-- 
2.20.1


