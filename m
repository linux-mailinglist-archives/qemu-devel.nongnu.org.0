Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5656B2DAED2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:22:55 +0100 (CET)
Received: from localhost ([::1]:41080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBE6-0004zf-D2
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4Q-0001Sb-PX
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:12:58 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4M-00078M-76
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:12:54 -0500
Received: by mail-wm1-x32f.google.com with SMTP id k10so17010715wmi.3
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cV37AyuORR0cd6TAg8TEpeOVqKh0IrbO2oTQtbw3vqA=;
 b=NlmkWISd/OHV5re3yEMDxBJ9ZKTCPHrV3FuUw1zArhT3wX9E52/+P/Ep9TIH1lb0lv
 7x7v1V64Bb1XKZAIpe6MBMfNESlgRJsZ/IT/5Q5wp2asH3Pcs+5bZo+PpKBGHCVYjs8P
 OJTZSHG3Z201sTUoJgGTLidEOXIjLyOHb4uZaPuQB0QwGSrXVZGSJlc0NVK19j+PWxJl
 U98PBE83m7Ly6Gsp/XQy4tMq5KtYypTBtcrPTWdam/U887Z5yOLwxAk+AKUYBoE6Ut9A
 H3uP1IfEfcIImQ666MkrqjOLU2EMQjeCJATfSyJFTxFsKnZm8582XrShqGRmITMc4WqN
 a+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cV37AyuORR0cd6TAg8TEpeOVqKh0IrbO2oTQtbw3vqA=;
 b=QjsUsn506ykStNCDgqMeIa+BlcPINIIjipOpEjd1qXP8EdU1ybSUuIJs+ZluxUOsBC
 yJsGSUniz0y9rbLGsmrJQggrsdsyDvlSVL6Hlv1U8ra5ZUXOIWyj7QYDOGdEncaJpNP/
 VscGVre9BFz6ptE7wEBHJfHRe0GJ0c9Tz4Pvc8PXHstvxd9kEBrGr0GQ7Zpk0G30AJFE
 XzihmmgqxzHK4alGKr5EAG/T15Yx3nm2if5qcNUHrcgnUHKPv6fEmpUI3e30D8Jqj90K
 40mz5ilWVMvL9z7Lbg+mf8HuzJR15Q++8cJvTDLqKWnufGBJVstusxlrVJS1LuXhEQ8S
 crig==
X-Gm-Message-State: AOAM532KDCPruIowShk1/NC/SASNKyQ8IBJZPvj1OaHI2nHVYn6NLSRl
 HmshUgiDDpEc3VgdFWcbWsmGFYzLMFod+Q==
X-Google-Smtp-Source: ABdhPJzs3Lmh4WriffN4IYM9lgzUHQJbofkElMGJL55TdiTNmey+yUAuwBrO87jvfsGMKeZrVwD3Lw==
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr33362122wmh.29.1608041568203; 
 Tue, 15 Dec 2020 06:12:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/20] target/nios2: Use deposit32() to update ipending register
Date: Tue, 15 Dec 2020 14:12:24 +0000
Message-Id: <20201215141237.17868-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

In nios2_cpu_set_irq(), use deposit32() rather than raw shift-and-mask
operations to set the appropriate bit in the ipending register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201129174022.26530-4-peter.maydell@linaro.org
---
 target/nios2/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 52ebda89ca7..58688e1623a 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -71,8 +71,7 @@ static void nios2_cpu_set_irq(void *opaque, int irq, int level)
     CPUNios2State *env = &cpu->env;
     CPUState *cs = CPU(cpu);
 
-    env->regs[CR_IPENDING] &= ~(1 << irq);
-    env->regs[CR_IPENDING] |= !!level << irq;
+    env->regs[CR_IPENDING] = deposit32(env->regs[CR_IPENDING], irq, 1, !!level);
 
     env->irq_pending = env->regs[CR_IPENDING] & env->regs[CR_IENABLE];
 
-- 
2.20.1


