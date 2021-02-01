Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A39830A7AB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:32:21 +0100 (CET)
Received: from localhost ([::1]:38178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6YNQ-00061N-HZ
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:32:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6YLd-0004MM-VS
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:30:30 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6YLW-0003dP-73
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:30:29 -0500
Received: by mail-wr1-x432.google.com with SMTP id v15so16405359wrx.4
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 04:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YY2dYLpzPEZmUMsd2DlotMogla3jfIXn2uLwFzQxh4I=;
 b=Ke/wabyfdY9Op8KEqeGTif09hpEOu4FJrjF8lF4qstEFGR+lZd85j1sV00YcqdiavD
 Bj/YsJgcNUoKsrynIOZgAdWAYISf3JH4LriNRowp2+jsEGwxZ4KyXGKwQkc2bCZGJ4m5
 mXaViPNaSWmv+vLc2kNe+sH90qp0piioN9kyzZPoawi3BZEhDzppIDcIH6QlQuTQ5NsH
 3Y8kSTBAEAG88YBAFP+1mU7eVjXDM4dSjrHtqLkEGS+AHOuI0tlTaycvP9ydYAV30iDZ
 yGXHsnZzNeE2xaNU3n8/2sK4F6QHWYgiErrxaoa2ym70ZNM2J3+A5grdrlmrnCTBIcYm
 J1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YY2dYLpzPEZmUMsd2DlotMogla3jfIXn2uLwFzQxh4I=;
 b=fJ0uZI+2FhQUdgXO6n1htCLSQ3q65tZ7pP2MalOCLqjwS4kD00T7oK0D+qmsIEk3gy
 JheOYP98vc/Ct2eneGEZaVjyXsd3oqSGooajBt44JDSUXVLGYQMP5RbIp26Xt3hi0Omf
 VK2eIwFwJ/NwPEaHuBBa2aTghnjOEtBMmCyAU82na3vfwv2/KXQSMqHFzWZlD1kfpUIb
 Vm3T83XFB1Mqzr/hdC9g1XgCG/MXhMdt2MXjtzOGOLimOQgY+XRXnTnc/pS5Y2BIujuE
 WZ91j6TQtPVtwNnxt7qa1USVB1BDsq71rGOgj8wHowZTl5s/a18XwAUtO9xMbskCY71O
 1Jvw==
X-Gm-Message-State: AOAM530xgAQMMy47jbJAvoSQUw7KaoXfh4bOZzZCOrbXTqMaiOnuiwSZ
 Sf2JDny2RYVjfQ6dYJjA/vPySw==
X-Google-Smtp-Source: ABdhPJwuIwfxofd+MhKT7IpFQmPtDR1elUHBzPnPuc+EFIdZM80Z0jyRujStgpciLksdvCKbbyQp1w==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr17792852wrw.150.1612182620832; 
 Mon, 01 Feb 2021 04:30:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm20466278wmj.32.2021.02.01.04.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 04:30:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC 4/4] hw/timer/npcm7xx_timer: Use new clock_ns_to_ticks()
Date: Mon,  1 Feb 2021 12:30:13 +0000
Message-Id: <20210201123013.32308-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210201123013.32308-1-peter.maydell@linaro.org>
References: <20210201123013.32308-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Luc Michel <luc@lmichel.fr>, Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new clock_ns_to_ticks() function in npcm7xx_timer
where appropriate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/npcm7xx_timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
index 36e2c07db26..fc48d494151 100644
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


