Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A844268D21
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 16:15:59 +0200 (CEST)
Received: from localhost ([::1]:53664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHpGw-0006ox-9f
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 10:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kHp88-00023K-0J
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 10:06:52 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kHp86-0007XZ-DC
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 10:06:51 -0400
Received: by mail-wm1-x334.google.com with SMTP id a9so200193wmm.2
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 07:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sQjyHYblqUK5pKnBXUKXJ7oRaJ4PY+n7hD6rVfgknOM=;
 b=ZQH6L5M4b3AzFRCsNeYgZMnBBfWwKLAoc2ZO5uwASkOZ10WHvT3+AFlXQkpG8dHz+X
 Tqmviq9JNa3r7RHlzzow4EzAxhEZwDd7YDhjzvGwLxgZwD4jEO0YPNalfa+bkKaRrUt5
 hi+w4zSR3jbwRFlU0ChiJiZalpK4IPsV6siKE2NB7csXZbPC7iu7cYckpSyeXx1K2kTb
 JekLxS05uPzyYzro3/jF69e/0igSKMLAxmrvqUrkC+d61VPSRF0u1I8DrT0OphcNPb3a
 1znSNIfQBbnxCtcRfrqhzer6VmAnEND7J7KbcmhFOaogg5l//ykfzABU34LIbE7fsSGX
 sQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sQjyHYblqUK5pKnBXUKXJ7oRaJ4PY+n7hD6rVfgknOM=;
 b=IlUbqa1yR1zXyf2EuiS3EiteQ5v3btJd6BvnlOHkitGRQGE+BZRIX/WgKJZ6Deeo2/
 BYGXKU/ERfpgMtrDk2ahKmjJ7PWN6+eWexCJNj2NoMyS2QF34o8Lw9ucIAp0WqMEFEyl
 tbmpWfotwIt1WYhXb54QIqKmNWuIug2hFcCApHvXOZn0u1flQVIDnSFBOAuobfjr+d8y
 /AiIja/H0M0H7sDjCoghmSek2jfxpvlNXZTJKXYu/6vR2HLJjgdbTFszLjiJx+5lOg2j
 HRerg5U55KsWTknIr9t85BhzEFAVmAa/edJRJZYAiwHj4wf9501sviFcc/xboAMNCAIM
 +7HA==
X-Gm-Message-State: AOAM533PHi7mgX0YE+dH8T/TU2li0aI3TQnJAf5TpSA2rF+7U6FWGdSQ
 I5LLClkN9JlwhrxEhzEwyKypEIDr/K+4vRab
X-Google-Smtp-Source: ABdhPJzhbRfz11fhIKjB0uG2vrN/OXptZEcV1+dFKJFEtXfSUrOMplHOZVgM+1UJ7yuaaCxpQR4vJQ==
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr15150060wmg.0.1600092408843; 
 Mon, 14 Sep 2020 07:06:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x16sm20834041wrq.62.2020.09.14.07.06.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 07:06:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/36] hw/timer/armv7m_systick: assert that board code set
 system_clock_scale
Date: Mon, 14 Sep 2020 15:06:10 +0100
Message-Id: <20200914140641.21369-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200914140641.21369-1-peter.maydell@linaro.org>
References: <20200914140641.21369-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

It is the responsibility of board code for an armv7m system to set
system_clock_scale appropriately for the CPU speed of the core.
If it forgets to do this, then QEMU will hang if the guest tries
to use the systick timer in the "tick at the CPU clock frequency" mode.

We forgot that in a couple of our boards (see commits ce4f70e81ed23c93f,
e7e5a9595ab1136). Add an assertion in the systick reset method so
we don't let any new boards in with the same bug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20200825160847.18091-1-peter.maydell@linaro.org
---
 hw/timer/armv7m_systick.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 74c58bcf245..a8cec7eb56b 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -202,6 +202,14 @@ static void systick_reset(DeviceState *dev)
 {
     SysTickState *s = SYSTICK(dev);
 
+    /*
+     * Forgetting to set system_clock_scale is always a board code
+     * bug. We can't check this earlier because for some boards
+     * (like stellaris) it is not yet configured at the point where
+     * the systick device is realized.
+     */
+    assert(system_clock_scale != 0);
+
     s->control = 0;
     s->reload = 0;
     s->tick = 0;
-- 
2.20.1


