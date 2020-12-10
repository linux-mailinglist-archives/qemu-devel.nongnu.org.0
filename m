Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFDF2D5A0D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:11:21 +0100 (CET)
Received: from localhost ([::1]:58782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKn2-0007H5-JH
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR7-0001dw-KF
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:41 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQy-00078i-AW
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:41 -0500
Received: by mail-wr1-x441.google.com with SMTP id l9so5136780wrt.13
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zv1NQU40j5VwFZuuid1MavRZS4TwKL2icboeKXibbVo=;
 b=B9TZwJb+BdVvUkuGv2QfccQ/1nE8ODeeG6UR2h1fdtJdN/mO4V8JzdnfiHzqe3CS5I
 j7UYetmQi98dTIT8Nw2IuUFw3PYloVq2bkEWFAw3eJZ2t/JOiZCPV+C0e2GdpMBOL8lQ
 IriB8bFwoe1Gq1IzTel8dHgdHMjFXzTd23sMO7yk/HEyaFkpoRvENt0xyhUddfLzpiSE
 qSt1mrfbAovTs2bwy7e7lJFqguwGeYd84CTxYtjk9T9ovCtGLscSr+ZWq69zUx6wJpqF
 Ck/NQbHNjmSWu9rn0ZMtXgkpFhWgorQoaYuM6g11eFScwRAJ4knBAMYkd3PhdZlXB5+g
 oJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zv1NQU40j5VwFZuuid1MavRZS4TwKL2icboeKXibbVo=;
 b=qsSwgpLXjCJzXL1p0fhYV5ocoyoDcSoYhqGRuHoEZdwKp3kd9odxbcWHjD+SzCJTvC
 09QK6JA5RUfW0SpsogK2lKBpvZys+utRpUh8bboFbXJx4OMDF/1B3lFmexNl/e4XkH+F
 w36jRAEf2FyVpKwuga3Nyzwi/eGmrK6wf6m0/zVP2P/OVQ2ONeX6r9Mj1Sg10V41cRpg
 wBYmk4y41ImA8v9ozGhiyvaxu55TRQp5vrpKA3eM5ulsQzoO8ZYPvW7f59u62mEIBCJe
 l8Lvzp3Drn4bp1yoAUPtpJ9BmlceGx4G01qrCPkIKAo+tUFH/SygX0g9SwZOXwiXpSQs
 bqUw==
X-Gm-Message-State: AOAM533hWD0/mrGKFRiv8yyhSlcOasND42VXShL+qXno8dCN8IvUTt2X
 OcxRLQNopE99uJfC3xun/u0YlCCwHn6XCA==
X-Google-Smtp-Source: ABdhPJzXT5iHubrfZL4KsGnZj7sHAT28bzgbBwQJDD1GE6tzF6MYHcTmEf4FIRhPGstjHJzDOliQNw==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr8172163wrt.66.1607600910632;
 Thu, 10 Dec 2020 03:48:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/36] target/arm: Implement v8.1M REVIDR register
Date: Thu, 10 Dec 2020 11:47:48 +0000
Message-Id: <20201210114756.16501-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
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

In v8.1M a REVIDR register is defined, which is at address 0xe00ecfc
and is a read-only IMPDEF register providing implementation specific
minor revision information, like the v8A REVIDR_EL1. Implement this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-19-peter.maydell@linaro.org
---
 hw/intc/armv7m_nvic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index be3bc1f1f45..effc4a784ca 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1025,6 +1025,11 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         }
         return val;
     }
+    case 0xcfc:
+        if (!arm_feature(&cpu->env, ARM_FEATURE_V8_1M)) {
+            goto bad_offset;
+        }
+        return cpu->revidr;
     case 0xd00: /* CPUID Base.  */
         return cpu->midr;
     case 0xd04: /* Interrupt Control State (ICSR) */
-- 
2.20.1


