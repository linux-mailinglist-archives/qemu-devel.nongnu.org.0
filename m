Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555FD50BE78
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:20:23 +0200 (CEST)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwxB-0006r4-Mc
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwX4-00010e-Ml
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:24 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwX2-0007Ii-UD
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:22 -0400
Received: by mail-pl1-x62b.google.com with SMTP id u15so8712664ple.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WDgeHzUdOULYKlRg869VIeEkdCFXvvv6jSBdC5RVE7o=;
 b=r7A70/zum8KgBgOSJOCUgXo9DyqWXO3Fc+h+KoqSLOEp7Yd7KahkEM775u4PNwjZYP
 8yYqW3ae77SVoqq61Cmz6hI+G5fQl4dUUqpyk8XakX1x+AXB9YsY+nRZMwBS44WVVm3/
 IMafLFqTG6qHVXlOh0uFPnI9hxpf4gorFCz9MygE3rdunJjJUK5aAZ8T6043zrS48//m
 M3Qg64EYfJIvwhV8jXKw6IwAOBcia0AGsBxxZuxYrJ5xctsXzu/5jdWwV2HQHeiFIVzQ
 BMIzJJNakRIgIIgaLica887yO1xbKrOJX0rWmlISbOjcDamn8HO5vsxNEcxcml03CogB
 RZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WDgeHzUdOULYKlRg869VIeEkdCFXvvv6jSBdC5RVE7o=;
 b=XCfhFjXQvliXkX1w1WyMSX0IQJb1/1GmGpFLNNgZgNmBTMA8L+nQZSF1AkdIa+mkK/
 D1lvB6PV4Wzcs4e4W6hhnPex89zGkP99a8fp09SPsUdIs40jk7qMsUZTtebxBj6c+i7+
 Mq+oyxG0W0VbrS2sDTBp3Kwd8CLnTusqQSPghvjsy559M7fEH0BcRpbHzfXDXsl1bzOH
 c/jOisZ5KZGg0Zhz+gcsNgS5JZu0J5PMe25ppvv1Mw2bU6rHdHqOwdHRlNnXxDv0OpHJ
 lf3+FspmbAEH7Z5hS2lOqEu/Gv6Qc9DvfnrK4I8rWpFsHlKXMg+2U7dE9rrWYfhOJeIX
 EPlw==
X-Gm-Message-State: AOAM530tS6mubd5Cyci9KfG9Vlv3C+EO1lf/8dDxVd6PJXumubS6i6am
 0mqEJVJmmwCSWh50nE1EjVob1z4ozqRn1r5N
X-Google-Smtp-Source: ABdhPJyaUDscWmMekJi2x5DdstWB/fXliaRpE9kCNdQ1GSgxymB/ZMLDEKVqsrXZenGMCTmBLNATPw==
X-Received: by 2002:a17:902:6ac1:b0:158:a295:ba71 with SMTP id
 i1-20020a1709026ac100b00158a295ba71mr5502753plt.49.1650646398879; 
 Fri, 22 Apr 2022 09:53:18 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 21/68] target/nios2: Remove cpu_interrupts_enabled
Date: Fri, 22 Apr 2022 09:51:51 -0700
Message-Id: <20220422165238.1971496-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is unused.  The real computation of this value
is located in nios2_cpu_exec_interrupt.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-22-richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 7c48b3452f..6bd8367eb8 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -222,11 +222,6 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         bool probe, uintptr_t retaddr);
 #endif
 
-static inline int cpu_interrupts_enabled(CPUNios2State *env)
-{
-    return env->regs[CR_STATUS] & CR_STATUS_PIE;
-}
-
 typedef CPUNios2State CPUArchState;
 typedef Nios2CPU ArchCPU;
 
-- 
2.34.1


