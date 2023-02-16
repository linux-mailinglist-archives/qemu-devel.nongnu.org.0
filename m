Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2328F699ADC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:12:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnD-0007yi-Uh; Thu, 16 Feb 2023 12:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnC-0007yE-Bk
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:34 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnA-0007pa-QH
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:34 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r28so2068948wra.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yZdYj4xUNtAS17eIdljWMHqlEpUmYI5NCeKfPxqq7Ng=;
 b=TpgL2bJzG0Xs6ICWEja2+3fWDhXFyvR1Z5kz0tjgZdqGtKZlk2An/ZixyeGF3lInRs
 LA+p+89oTkgkkTGmBKs9oGX67ymOHf+G8F/Mxwksabr9OG+jag/Je942fVHYuptA6wRN
 PnOaeNf/I8YE0XPXsx/ApxcLgwDN3qeg+1twlxmxcWZlC9X3pD4YoN0SOpZxqagsjmar
 8XdUQNqctCt8w86nLVQuVZKCBW1i247qIf6aMhcA65zrZ7jWNKSHChXruoFOpLB/q4rp
 YxMt5KT5TXdx70JQgU5LxAX1Ap48NvmLeWOBuowk0Tkbq5VXPYBeuFetFj96Bi5D3s2l
 eTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZdYj4xUNtAS17eIdljWMHqlEpUmYI5NCeKfPxqq7Ng=;
 b=UTL2XWNDMR9lIzRKz5z45JPXyNccHGIj5oN+riG+Z3pK5+MTCyMQTOjXW5YNNzN7W9
 UyOF3KNQiTh4WnoCTPELhkKkAQgjBTtAu8Po8rTMrpuh2LdH073lxKivQ6xK5PIounRc
 KHlASCwW2ZZXiJn9ACYq+ae3CW5PG1NzXySUHDmGzaDrL2fO/uIV6+OUzNL3KR3zhqHf
 XEGupbmSBYzpSf2kkKiURcs/VPz0neIYtWV2vPsHELDZRkscZ27P5ohEVN2VT+tirFcm
 WTQtvV651jb9Q26/Ik+jJz0Xp9TuPT/KHtdb7dzXhP+WLgot5bOTmIwovjH3i+CRvdJT
 34Eg==
X-Gm-Message-State: AO0yUKUBNH42eCtcazyqPuq7skEplXsYB0hxAN+gjrY46YBYeZWUx/Ia
 jLppZSktnbki8q6XIXEHo165gOre00btK7oF
X-Google-Smtp-Source: AK7set+ZOcpSt6WQFTdlh8Y+W2B2sWr4DnEwjjuTEC5TOLUflqBNKffbte9QYu8+z8QW4bs+R1uifg==
X-Received: by 2002:adf:e19c:0:b0:2c5:617f:e348 with SMTP id
 az28-20020adfe19c000000b002c5617fe348mr2301065wrb.25.1676567491508; 
 Thu, 16 Feb 2023 09:11:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/30] target/arm: Restrict CPUARMState::gicv3state to sysemu
Date: Thu, 16 Feb 2023 17:11:00 +0000
Message-Id: <20230216171123.2518285-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230206223502.25122-8-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1c1e0334f01..002082eb5b6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -769,9 +769,10 @@ typedef struct CPUArchState {
 
     void *nvic;
     const struct arm_boot_info *boot_info;
+#if !defined(CONFIG_USER_ONLY)
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
-#if defined(CONFIG_USER_ONLY)
+#else /* CONFIG_USER_ONLY */
     /* For usermode syscall translation.  */
     bool eabi;
 #endif /* CONFIG_USER_ONLY */
-- 
2.34.1


