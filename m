Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96275F1D92
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:26:58 +0200 (CEST)
Received: from localhost ([::1]:41442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefKL-0004Nr-OJ
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefH4-0006Um-00
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:34 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:44922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefH2-0006E9-E3
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:33 -0400
Received: by mail-qk1-x72e.google.com with SMTP id y2so4533095qkl.11
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4KPhpY52J+00g3rHXmwrM1G3yOLaxgKqSa5cCKMMs9A=;
 b=u9Wvim0cMQjf9esrozY6ssOA+U9vwHLZPGfHv57i3jsrfPtwL84T1AueH/E+xQNZXH
 6tPsMJfuMJybXISYCK/c7WHNA9KBSO/OBhQ30qQfc8VBobhjwn/975FVMS0odocg1voq
 H+jJVFO0UNb1UO1MQNkTL+V3fgxlDy0ucMC2eVqh7sdX/JoR2fSHdLbYDD20YYMc/dqL
 DHb9qSu+aO7tFYh5wHHHB2ByehveodQSbl9cvW8iaYhYiFX5XTXlh2pmI7Y8jcnlpNvh
 C0SJRzl705cqqmFUJ98k4hz6P9vmO1vDFTx2ap+xFUs1F9/AbYYZ8V6JTcPmmeVlxyI4
 KR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4KPhpY52J+00g3rHXmwrM1G3yOLaxgKqSa5cCKMMs9A=;
 b=DQFIeklWAwT38sI3caXOX5MeER9UxwGgaG7z/0jUfENG3pyMMZ6jMIrBQ/5H0vnfrs
 diZvNY+9FrJjKG9Rem46qUD5mBxm3nK//Q90QAEoOFfURdcI1A5MyjZEaqbh4eNhrfEg
 8Rs1aCG0oUmUCc05F5LoskL8GOXsXzxFQ7Xm22Au/8Qm1Vd1vbEmIhKFI1Ygac7qGq/L
 OYRK4AlxHgYMm4MFZbHT5uV7JOvX8LSFMP5j4Ebdoz3Q1X1qKRn1toVQxjuAZssMhlZO
 fbH88W/OZlwG3WyyA7Il/ZBm8ZinjhYzS3DXUhRml7KsnrWjAhq8C3QfdIxEaS4CdWQl
 W8Ng==
X-Gm-Message-State: ACrzQf0vDcFzT3evRcRnOjDwBsj/jQrvf5MmZN8TnAQhprckI+1RNDb9
 ts9X99R2gftx1C7HIsbkWJnQs4z2WK3fMQ==
X-Google-Smtp-Source: AMsMyM7d3KMroM72iCxdgS6nrHqJ36NM5Ekdtq8wyEbcR2mXq+pdpEPoUG5QSctM/P2shDib+EpW4Q==
X-Received: by 2002:a37:c443:0:b0:6ce:191a:bb60 with SMTP id
 h3-20020a37c443000000b006ce191abb60mr9577433qkm.53.1664641410360; 
 Sat, 01 Oct 2022 09:23:30 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 03/42] target/arm: Fix S2 disabled check in S1_ptw_translate
Date: Sat,  1 Oct 2022 09:22:39 -0700
Message-Id: <20221001162318.153420-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Pass the correct stage2 mmu_idx to regime_translation_disabled,
which we computed afterward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Move earlier in the patch set.
---
 target/arm/ptw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b7c999ffce..5192418c0e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -200,10 +200,10 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                                hwaddr addr, bool *is_secure,
                                ARMMMUFaultInfo *fi)
 {
+    ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
-        ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
-                                          : ARMMMUIdx_Stage2;
+        !regime_translation_disabled(env, s2_mmu_idx)) {
         GetPhysAddrResult s2 = {};
         int ret;
 
-- 
2.34.1


