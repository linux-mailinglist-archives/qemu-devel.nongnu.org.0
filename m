Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A89331FB52
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:51:21 +0100 (CET)
Received: from localhost ([::1]:35814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD77o-0005NO-Cl
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:51:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73B-0001xG-84
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:33 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD732-0003MN-UW
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:32 -0500
Received: by mail-wm1-x32b.google.com with SMTP id x4so7881199wmi.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Kt9byFk/LgRYLWsesWus/pJj6/v7OG/s7CQX0jHU3wU=;
 b=hJ6ps3LKNijg+I0wue8Ayb2mLLZeqy8OQH9zmRxB7NdxxjfPhQ3iFy2aOiamQ3WjlK
 UMbxk/Fmd+YSFN1kFlF2ulQYKycOD87SqI7S+japvxE60Qz3H/M3MD3peOoj72Bj+ktR
 irhG3MRXVCYh0DLq/GPCv229HphRqySikowwTrI+arExZuo3rp+zhuIAvAcGf0m8o3Za
 8tPMD6pmKeT5syD0bSEUc1FUTZPQjo87ub4VFunKgKgOn2TkZWZu24y5UUhLKC9enlpO
 0u+n1wa4mKxpkzBvaD1h9ZGyuOEJw1Jux9G4CxT1kOxoF4LoHAzi/Y3jDyhasK5HljHV
 a8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kt9byFk/LgRYLWsesWus/pJj6/v7OG/s7CQX0jHU3wU=;
 b=WtPob9L/hdDhW7j8v7xO+zaSZLbjglhVt6Ny75Oebe17ruo4AR96wzeNl48jaQJ49N
 adnwmCZUVthusGDY0MOSBNKSi1HjOATHxPzIUDRPLGxDmAQ5HfPrnGZRddYWRTiYEAGQ
 EduEvLblYMjZRVk8LizVTMBNeDBHphwU/Xh0VEPVBNVP8BvWG7EXSmUd0+gvcbLf1fN1
 m3GUfEZyUPEI1Y0Wbp6ZMHm6z/37pNiIATzb+/VCOU5xo/FsTA+7ZIwAqyO2JV4qQ/XS
 uUjshYdYs/DDTaQULSW0dRqWUfLLE7vKLOptirqqRVu7kY9JKjQcZWVcIJbihZhW4Nre
 6BgQ==
X-Gm-Message-State: AOAM530WY6aAqOd0fPXd8ANc9HuWw3SAOimMSH3GLfDJ9bgwciKJk5G+
 jFGQhPyOqs9p0A6DOloTKjfkiBY4iyQzvQ==
X-Google-Smtp-Source: ABdhPJwBjR12sI7Q879d2ix1KipFxrMeoLwHBepUdlCTQUsixYE3Bgbzp0m6FGfpxR1yhM6lkQb63Q==
X-Received: by 2002:a05:600c:c3:: with SMTP id u3mr4286341wmm.64.1613745983415; 
 Fri, 19 Feb 2021 06:46:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/44] hw/timer/npcm7xx_timer: Use new clock_ns_to_ticks()
Date: Fri, 19 Feb 2021 14:45:37 +0000
Message-Id: <20210219144617.4782-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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


