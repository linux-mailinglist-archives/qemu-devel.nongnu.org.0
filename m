Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8A25048FF
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:43:45 +0200 (CEST)
Received: from localhost ([::1]:48894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9s8-00081H-MI
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90S-0004bf-Cw
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:16 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90Q-00044Y-O1
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:16 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 h15-20020a17090a054f00b001cb7cd2b11dso12211090pjf.5
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PxOmMqRSvIQcvxQ1QLjNH0K+vq0MOnh5ihTSPnn1yGI=;
 b=cmxHgcJskDgWgdaJMnoFeuogHnTiZyMzSg7LyYwHUv64jnpgY1o3IEXeaQlx8uK+9L
 F5g25XWhDk4s/7iWO2PvAiVE7XnfAbTMnHDLhlwjJ9qBx1qUxdNw21JuMT51GK78OzfG
 zQsHagG0olVq/xzIiVlZTCP1voYRyesAk+igpjpk+GS3T5EV8nr30rPpSQlviA0UyiA/
 S5GAe7aeoIXZfKrIv39JEDCmkzTrbJeonG8geBryiRxPHJngNnuS5EZ5Ku4gLTp8o52G
 m6TvfYe/o2ReOaRtMgvsLaqtah6O7pRw4uDaQBwQ9N9zWS0I9HbaGLJK6XKPcS0YUhBA
 DSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PxOmMqRSvIQcvxQ1QLjNH0K+vq0MOnh5ihTSPnn1yGI=;
 b=gnirp25lxy1eK/FZ7ZOQCY9Rpn1romizu6GtG90wbG9/7tzPw72+3/jJsvchvbKiEX
 8eS+1WmI1g1fvHpWG2w/kPZ+G/w3Te7Uo9ypsZiuUp57MFAy/Gm5LWfLiKflb+L4H46M
 A3dLjugBw9ICvtZWgq7uUAgmC/BvyDGSwG1za/tgmD1fAwXbhkHRiAf1zn3NqLhtKAE7
 2LUmVH1jTfmayaj6wESlpVeL9gk7+PaupqKIVYBxudJhVXedW9VFqE09N9OJf+n1ypRt
 6LBq1VKmTtqzloOvafI/p4KkB8Ym1F4bj3at1RXWREvL1YDwleFJC1A7FIIBFiIetmcs
 ZEMA==
X-Gm-Message-State: AOAM530GxnBCzB68F01rmaOzF8Hyk3P0TI0Pi8ARvSuILuihZYnMUgT5
 CRvRt2jLk0g5aauwz74nnbL1FvB+QmQO0A==
X-Google-Smtp-Source: ABdhPJwKNUc2vaTymq5LNNxwth+EKjmY/wBlqZKl+f2wy2oHX9yHJRzvm5QsKbb0UFV8mdzkqm44Vw==
X-Received: by 2002:a17:90b:4d0d:b0:1ce:ef5d:f1ef with SMTP id
 mw13-20020a17090b4d0d00b001ceef5df1efmr14266570pjb.91.1650217693490; 
 Sun, 17 Apr 2022 10:48:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 50/60] target/arm: Enable SCR and HCR bits for RAS
Date: Sun, 17 Apr 2022 10:44:16 -0700
Message-Id: <20220417174426.711829-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
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
index 655beba3d6..f6468fed43 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1756,6 +1756,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         valid_mask &= ~SCR_NET;
 
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= SCR_TLOR;
         }
@@ -1770,6 +1773,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
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
2.25.1


