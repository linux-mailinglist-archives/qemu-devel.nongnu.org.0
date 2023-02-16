Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC40699AF1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:14:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnB-0007tI-4h; Thu, 16 Feb 2023 12:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShn8-0007rm-OY
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:30 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShn6-0007oJ-NK
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:30 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 g6-20020a05600c310600b003e1f6dff952so4757115wmo.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r4krdA8Qnd36kyIKBvwPSIAkaJ6bsOagP1i8kYOboYQ=;
 b=cDC8VgDV15bWBWwuZR39Fy8LG6LECXQ85Cvv3BW9G8Wvk37Cz+sRBiHUYMadSkmSyn
 56aJm6u0nXui+WQa+KbaATWzdcI1P0KNCWssnM24xYNNlc6UVzSmBgFl78ljiPjBlsLI
 kA4pWG2t07agzTAdDJ5AC0HZn9chCX0WF7RWgZnhfbgq7P9h+EwPBdibg4VzvkpxwEoO
 Miqu2g3xwwptpLlLMnGYW5EiOYTncH4qrNXXFjeZl/v6ZI2j/J0edThgbHhVo1yCGdxX
 ZJcLXX26M2RbDW8kwMQiXIGLodApsT3g4ZgUrRVMM6kRd2ikEx9WcnNbjSa1ohbyNhC6
 X+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r4krdA8Qnd36kyIKBvwPSIAkaJ6bsOagP1i8kYOboYQ=;
 b=EF3kGjGqLSTFwBGhbqhYJXUm7KCbyeZBFxAKOKrLIEPK+QTNrhBdiMuBCFsKOggd7m
 /DIFpTs5nw1SnJGRmPsQVoZwPSIih7c67h9xzCLUgW/X9DXCsk6wNFlEdysYPgE+W9nz
 wfiecQS/gp0hrs8ptv0Ak39Txkyd9AfRHQl1a328P3tIXX/qjsx+7KN0s+Ge+xKOfgB+
 1WcfuLebJcvYQiRNBqdbMgL6uD46QOE1hFX7jYaXU8zOGqovk9fMBnaf2OQx6t6QTc2L
 AVC31/GCEPco2HpAOlgaXQ5Z9apVFbyyzZZb2/d5eC/liwF0MpI1QVJHG0L99XeleEUO
 marQ==
X-Gm-Message-State: AO0yUKUZCtiixnGUFaevRUHQvYp6pioJFOU433w7xFboZMnocwrtMaqT
 9UQFbR9ck/99gG6OXWbMRTtfdxroDhQAhUMG
X-Google-Smtp-Source: AK7set8YfyqnRoJzcAX4emzdtHk2Qm0A/w7pFS5A2sO899ZRgHwJ5CS7WTJbWvOdsZGnJiUv+xdKBw==
X-Received: by 2002:a05:600c:4b1b:b0:3df:fbd5:690 with SMTP id
 i27-20020a05600c4b1b00b003dffbd50690mr4950191wmp.17.1676567487300; 
 Thu, 16 Feb 2023 09:11:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/30] target/arm: Simplify arm_v7m_mmu_idx_for_secstate() for
 user emulation
Date: Thu, 16 Feb 2023 17:10:55 +0000
Message-Id: <20230216171123.2518285-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230206223502.25122-3-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index e7e746ea182..76239c9abe9 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -150,7 +150,12 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     return 0;
 }
 
-#else
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
+{
+    return ARMMMUIdx_MUser;
+}
+
+#else /* !CONFIG_USER_ONLY */
 
 /*
  * What kind of stack write are we doing? This affects how exceptions
@@ -2854,8 +2859,6 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     return tt_resp;
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
                               bool secstate, bool priv, bool negpri)
 {
@@ -2892,3 +2895,5 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 
     return arm_v7m_mmu_idx_for_secstate_and_priv(env, secstate, priv);
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.34.1


