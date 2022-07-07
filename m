Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C7256A239
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:42:32 +0200 (CEST)
Received: from localhost ([::1]:54298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Qpz-0006Yk-Vi
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbj-0007oY-8p
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbg-0006wK-L8
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id ay25so887495wmb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Q8zqQ1jLT026hK29SZnc/xlsYzLhDKLie9j0fsOrVZc=;
 b=pKhgTxirbtX9Zf8EO3EFmnqo7iWHYWgqog7eG1ibDoTq4Id2g0PNgYvNcHWArKc5em
 w5sbsh3XunX7iO/+SS1g7ucXcgX/F5wLbWbL/v3rFUEYcqRv6O+zvRhrnrxrJi93kjjf
 CpPF099PWrdY8mb/rxTr2xPTihZXw5+5111YAy0uYJJvnK7+rs1W1sBWaeXgNyYG434j
 rtJRjmtTW+Fst11+f3ue+w8NbDe44FmJWrXTOiQaF62iuaTMP9xt+ULk47xVq5cuG8Va
 Tsa0llVE9oXEjGcdDAL/hT+2nW6or/y1pSGctkF05zKbbRU+3BlVehJZHZ4kRaMTwJyc
 xzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q8zqQ1jLT026hK29SZnc/xlsYzLhDKLie9j0fsOrVZc=;
 b=fAhsMRhA5pTgjULeQdRnjbck+6wKImOr/MfowEP5/OAEvv9bGFLjyUzrvNro4T9S1h
 XqDOb7D4kh1ikLMK2jDsWRhayDeXgC+jX36OJ+HkVMvtnyWbUFfpjqF/hfXeQ/Q5JgzB
 /7Iwi1tbUdUuMaMlzUi6bQH9XazqoTH/w1SlIR+FMH7DqVtYdB+m1AdP2qo4HQW2E/b/
 IAC1O98ghmp3X4si76FtH4UqOVo4FQbkdMkEBGM7gPXFI+V+38u+3d85w9zg/ypiBMkZ
 7hGcWAqP3YJX9lTUdcOtfO8TspOWvKPDO8V7dOduNWJHX40cuW/TY7ANYI7cu4uUYyNx
 7gZw==
X-Gm-Message-State: AJIora+DFz1Y996E7hKh1Kkth07lc+TSKPLRLdINN7ZUMKzg/65ugt5J
 4dZ+jPF3Hmz/SQYg6JLr5kIbbOHenzo3WA==
X-Google-Smtp-Source: AGRyM1tAC/AlBB038N/BiFQZlhtmIkaHqGYyWtEseqKKa+l5N7fIY5x09ZZLUVt5uMsYeZhR2KWWRg==
X-Received: by 2002:a7b:c381:0:b0:3a2:aef9:8df4 with SMTP id
 s1-20020a7bc381000000b003a2aef98df4mr4340864wmj.7.1657196863185; 
 Thu, 07 Jul 2022 05:27:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003a0375c4f73sm29177618wmq.44.2022.07.07.05.27.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 05:27:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] target/arm: Suppress debug exceptions when OS Lock set
Date: Thu,  7 Jul 2022 13:27:31 +0100
Message-Id: <20220707122734.288929-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707122734.288929-1-peter.maydell@linaro.org>
References: <20220707122734.288929-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "OS Lock" in the Arm debug architecture is a way for software
to suppress debug exceptions while it is trying to power down
a CPU and save the state of the breakpoint and watchpoint
registers. In QEMU we implemented the support for writing
the OS Lock bit via OSLAR_EL1 and reading it via OSLSR_EL1,
but didn't implement the actual behaviour.

The required behaviour with the OS Lock set is:
 * debug exceptions (apart from BKPT insns) are suppressed
 * some MDSCR_EL1 bits allow write access to the corresponding
   EDSCR external debug status register that they shadow
   (we can ignore this because we don't implement external debug)
 * similarly with the OSECCR_EL1 which shadows the EDECCR
   (but we don't implement OSECCR_EL1 anyway)

Implement the missing behaviour of suppressing debug
exceptions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220630194116.3438513-4-peter.maydell@linaro.org
---
 target/arm/debug_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 9a78c1db966..691b9b74c4a 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -142,6 +142,9 @@ static bool aa32_generate_debug_exceptions(CPUARMState *env)
  */
 bool arm_generate_debug_exceptions(CPUARMState *env)
 {
+    if (env->cp15.oslsr_el1 & 1) {
+        return false;
+    }
     if (is_a64(env)) {
         return aa64_generate_debug_exceptions(env);
     } else {
-- 
2.25.1


