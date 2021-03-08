Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98A73314F7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:37:00 +0100 (CET)
Received: from localhost ([::1]:51730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJoR-0002As-Un
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkT-0006Mk-8Q
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:32:53 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkR-00070d-2r
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:32:52 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso4290540wma.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3IXWDv9it3T5h+dZUQqPibuGbPDef4QkIUdMz6Itq4E=;
 b=Fn6PelT8e9Q0e+bU/50Rp1aHMIJLtgfHfYNGS31fG+R0Y0fNLqFWgZ2+CgEtAEDZvd
 58mqF/kH1xlJDusn9NIaQGHVDqYW1uagEMZ7mk6X9hNEW6IpgGdtxgrIlTyMJMw6zAvC
 zZRoQqCU3prYEIM9+rr+TUp6tOGXMV59iGN3KDSi6UxCX4KjSf3Q8R/AhRbQoL0FNNao
 GXXpBbRg4/3+UO/taW3myNU4MmqY9kouKjG8KqQx9GBoszMgR90/SlytvPxUY/RNhLyt
 dB0SqvvtYcUtzV4yI+fAPx9Mx+1AUh3kcSds1FeIZRz1iRkMU+53pNVR12pAvz0usidN
 /gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3IXWDv9it3T5h+dZUQqPibuGbPDef4QkIUdMz6Itq4E=;
 b=B0K7g8iIsOl3aiuEWn0BY7oyv+STBDYx/nNPZ7WabBKxoe1aKhN1txKcSiJ6I8bg+9
 Mc25cOagxvmwpFu5WuG7+TWl7kIws9mV/4EC7zQNeFm0W77I9oOQtHmNBJlTAZzdSifR
 hZM0wWq8CT8TfOGUxSdPMuj/cbi6ChyTLpVKFNY1LZ2qAG/8kz6DDN/NFDrJXUnlnEdJ
 co3NASzzvRs5NSMFlU2stMe9K2Sa9FL6xHFvlcqb/v1MBrOEDiJJ4oIJt5p65R1/Vntt
 K0jU7G36HJgsokqTH6+0uBjmGtvVSCFV8hTy0nrFlyV91WzJFOnMOwMCf9HzZNWCmTS/
 dnRw==
X-Gm-Message-State: AOAM530E//5ZP6dpAK83luX5lmDfdezgMbYBrG654+ZJzEnn3ATVyaBb
 bxV/BrG51k7sQbXyo+/Pb6zyYZAn9JIRmw==
X-Google-Smtp-Source: ABdhPJw6WjmTrIGD7K/bXeOIjCkzPxHSofW0/uXGll/jM3p6h+o2WvVq+3knPzFQrH2lI/w+jdfrCg==
X-Received: by 2002:a1c:a306:: with SMTP id m6mr22447411wme.13.1615224769666; 
 Mon, 08 Mar 2021 09:32:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/54] hw/timer/npcm7xx_timer: Use new clock_ns_to_ticks()
Date: Mon,  8 Mar 2021 17:31:54 +0000
Message-Id: <20210308173244.20710-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Use the new clock_ns_to_ticks() function in npcm7xx_timer where
appropriate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210219144617.4782-5-peter.maydell@linaro.org
---
 hw/timer/npcm7xx_timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
index 4efdf135b82..32f5e021f85 100644
--- a/hw/timer/npcm7xx_timer.c
+++ b/hw/timer/npcm7xx_timer.c
@@ -138,8 +138,8 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
 /* Convert a time interval in nanoseconds to a timer cycle count. */
 static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
 {
-    return ns / clock_ticks_to_ns(t->ctrl->clock,
-                                  npcm7xx_tcsr_prescaler(t->tcsr));
+    return clock_ns_to_ticks(t->ctrl->clock, ns) /
+        npcm7xx_tcsr_prescaler(t->tcsr);
 }
 
 static uint32_t npcm7xx_watchdog_timer_prescaler(const NPCM7xxWatchdogTimer *t)
-- 
2.20.1


