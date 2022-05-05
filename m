Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF43651C952
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:37:31 +0200 (CEST)
Received: from localhost ([::1]:55672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhI2-0007UD-U3
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYc-0002zK-IO
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:34 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:42851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYY-0004Uh-8O
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:34 -0400
Received: by mail-oi1-x230.google.com with SMTP id w194so4040332oie.9
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QgQ5KSLzutwoLc046w/8oKdisj0tzJaMrdZLKPhobI8=;
 b=ODboB47elzHbFGhqcg3AWVleBGCY8jjgBT2XBluDCsb4CY5egSXZAeNdoADIEghqIL
 27MGi7uN1bBPtJ4xTnR+ZkyqptQ5F7Li/wUQgfJ4JS00c9rRKzu1nMLU4nzEB28Bd+5m
 g+ta7mK9ddGHEy6vJHxJImHMnNJVIPFhMMsMPUkXh7LP7Bw+smN+p6XPJBdin6LB0akK
 22uSiMKA2vdpjtMF20GaorvVm4Dv0pT5unWL7KgTLTvVW5IcpMwZpjk5p391yMd+qKaY
 0Ak0ZrYnLQwaqVtHOzwaRX1O5aHDWrk8JvEehMeIS5jpme+Cvhycp3Ye4Krby4cD2nyR
 tC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QgQ5KSLzutwoLc046w/8oKdisj0tzJaMrdZLKPhobI8=;
 b=ZQaB5gNUK4TTf9+UP+24B1Gk951AuCwqipGKiLzSWmfYKP2PbkngbavqULd7fMhloX
 631iL75km8ahpgs5cp1SZe9DA2WXgqjSmqv6MSoMnjQVEroXNrheK7s6z3RmcQJNMcuB
 UoLbsnAiGvpuOFYk5uoXpOQAVR/39xA8t67RDYHnJKJuXKLFnSerLP9GLP83imuZvQLd
 sOvOLtFUJCshUbhhCnOngiqIuEuwdnSmxtDFPCDzVJGrj8qurDaiU6EEQ3Ob+bsX4pKn
 lLw1kRczEvd6sHMIRUTZWdqrWFTwHSbwT5m7MK9KaSGbKFRy5ilGJNWc9ZstAovIcGOW
 YrKw==
X-Gm-Message-State: AOAM5313WSg36vEvQFqOKIRv/LMbsJpfblzvhbNmLYrf9NtYsZ+noNJw
 iAb0pUETivbERtgPUAcNpaYsdpTTIIGlrFGp
X-Google-Smtp-Source: ABdhPJwFj45ZRNLCBsoNHyJJyzguriVKZBVmI69d7yrUqn+n32qp0jp6Vl9LvCK8carERlD4dVA8wA==
X-Received: by 2002:a05:6808:124f:b0:321:855d:5b19 with SMTP id
 o15-20020a056808124f00b00321855d5b19mr3304292oiv.30.1651776629041; 
 Thu, 05 May 2022 11:50:29 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 14/24] target/arm: Enable SCR and HCR bits for RAS
Date: Thu,  5 May 2022 13:49:56 -0500
Message-Id: <20220505185006.200555-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Enable writes to the TERR and TEA bits when RAS is enabled.
These bits are otherwise RES0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37c5e42bc0..b6faebf4a7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1755,6 +1755,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         valid_mask &= ~SCR_NET;
 
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= SCR_TLOR;
         }
@@ -1769,6 +1772,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
+        if (cpu_isar_feature(aa32_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
@@ -5126,6 +5132,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_vh, cpu)) {
             valid_mask |= HCR_E2H;
         }
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= HCR_TERR | HCR_TEA;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= HCR_TLOR;
         }
-- 
2.34.1


