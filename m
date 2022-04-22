Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5658E50BDF2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:06:54 +0200 (CEST)
Received: from localhost ([::1]:51556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwk9-0006UF-F6
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWh-0000Ua-UY
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:00 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWg-0007Ep-FI
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:59 -0400
Received: by mail-pf1-x436.google.com with SMTP id p8so8524474pfh.8
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oKKUu+zNBC8As9SImKOzVlpqPHOufT8qoTmRma0rBy0=;
 b=zmrNMlzkpLmfhJFbK/hcJ/twX4vvpVIXSqLhM7weG3iuHCHXDgtOYB7mIJ2KeSI73Q
 4/Ral5D4C34mTudSYwudJnmEfemHbeEIqa3UctHShWr1hrK81OIMKii7ZKEnLd6Wr1dg
 w9FQGxj/Tbi1qRwwpBxesydrdQZ+mkQwqux0V2+k5mAWsSl/ggKTQe/PNmQaJSrNo57I
 z1RdPTOw7r6mMFEIvxqvIcUYglk44B0sY1TpC1gCmJjuRgpOV7OjhpFD3BG3l631QJM4
 LijXMZkbGvpJ5v5jjEBOSsuMHPZsW0LYZDhexCZzVGLmiB890llExhkAXtVgK4yTZHLB
 fYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oKKUu+zNBC8As9SImKOzVlpqPHOufT8qoTmRma0rBy0=;
 b=iWv0QyWqY5PHRytsD3UfFhVHGr8VfRbwoDk0akET58qtE3Tbxm1SPmBGBPhPywuV4q
 T95LUlilP1kqqjr352agxJCr3JN4f8T13522tlyYAgjw8gCjQfCd0ZYOPfspYYNyzge4
 2ldwj7GnY9HCL61QDC8ujZWfyZMUfqM9qM0vFBgb+WPOf9Hr0Z/a+5fYD25FnBGOhK8Q
 W9xWuRfJf1tqPfRNPysMrqPuRdJJft5Cp5PfrI1UUeHfUcPhzFGdJrDBXvD1s0n/3GP4
 bO/eQpp9QjUPS0/RYcPuuGc31vk+k0mqwKItYVhvfnr0GG6cAroluod5TkqggjSJVZzv
 RAWA==
X-Gm-Message-State: AOAM530kRyDBE/JfDRdoW2jJpMVN85i13+DtVe7aABXQDLrrKVraaPxk
 l7B0GAy5hk0TZHTIwCzwQn7E3H45cG9AvFNM
X-Google-Smtp-Source: ABdhPJwwikfi8WyvLns4Fcn99xYT3s3K6tFqwCrdA8pn5ip1NfdBZ3D6vlvyjeaIZiju5hlghGTncQ==
X-Received: by 2002:a63:ff08:0:b0:3aa:594e:5735 with SMTP id
 k8-20020a63ff08000000b003aa594e5735mr4621241pgi.183.1650646377018; 
 Fri, 22 Apr 2022 09:52:57 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:52:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 09/68] target/nios2: Remove user-only nios2_cpu_do_interrupt
Date: Fri, 22 Apr 2022 09:51:39 -0700
Message-Id: <20220422165238.1971496-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Since 78271684719, this function is unused for user-only,
when the TCGCPUOps.do_interrupt hook itself became system-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220421151735.31996-10-richard.henderson@linaro.org>
---
 target/nios2/helper.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index e5c98650e1..678fd96c4e 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -30,14 +30,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 
-void nios2_cpu_do_interrupt(CPUState *cs)
-{
-    Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUNios2State *env = &cpu->env;
-    cs->exception_index = -1;
-    env->regs[R_EA] = env->regs[R_PC] + 4;
-}
-
 void nios2_cpu_record_sigsegv(CPUState *cs, vaddr addr,
                               MMUAccessType access_type,
                               bool maperr, uintptr_t retaddr)
-- 
2.34.1


