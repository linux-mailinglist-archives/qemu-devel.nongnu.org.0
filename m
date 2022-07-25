Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF255803F0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 20:20:08 +0200 (CEST)
Received: from localhost ([::1]:57216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG2gZ-0000AD-8n
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 14:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bo-0004mf-4S
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:15:14 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:45637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bk-0005pt-S5
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:15:11 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 g5-20020a17090a290500b001f2ea602563so258017pjd.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 11:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yEs9SFwgwTuqEnbJkZEUd2ZZZGNmQAbrUyEKBuLlY20=;
 b=E9cUo9c644yNmMSr8+ErgCNlM4ry7ody/uDbFBVCPIaRMhDwEb55p1mrNlIW7Me/Oa
 Zm0dumNVZiFVjjtIc4eeUAp4ytDK0OJmxcVez2CQkkBznkT1RZelCvOJNtWpJe7bu1En
 7TrDIWNhc2g/ttqD15MxHCGfX7Jaci8et8Z7H6HY72Ufi5mElEHxv35ValEb5v/sNcCk
 pFzycWRnmQys6TxPbw/O4azt5G9GoP8yd1jt/UGRxCiBISmxTRStGA6TFS0B6vsUzVYI
 tKZtvdNpwpbcF3m6i8MtRB25yGJh5nZYG1nReMGzbwDCRodBPEZWk9YRMm0k1hAZwzfs
 RFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yEs9SFwgwTuqEnbJkZEUd2ZZZGNmQAbrUyEKBuLlY20=;
 b=X82fjRPV5sIFsMrN7PU3lJYV3TpKgK0p7EH3spkYg6s0umv+K+YwOThNVTt6Sk77p0
 wfcBOew4hFi35VO5yOmhCglGYBxCYhNBrB+PQYTm1boNghf+IkIV6xOsBFFmB1R5lejS
 ZNddyOPbE8/K1308v7u+MyRNtd2OeVtWte/SPoTX61heXSCUKtujhK9XhFQCfpLfWQzM
 u18gDGxNjis66VCtBeGbrST/7xAI5Jlf2dx3n7zjFM1X/vV+v1mTRrcTp772TdClqBM4
 2mgAdX5DBelf9rndgj1dNoCtbhmopKUee4s79yYV9lzeuMWu9i3iK5w8XWgGoXfj96QG
 kRhQ==
X-Gm-Message-State: AJIora/N903ejGN6dULZK3pQHh6NC4dCeXHbd+EfA+hz5J+5pepzTBIb
 UxPKXDw/zJNT97s1aNEvxoDRosZN60PV2w==
X-Google-Smtp-Source: AGRyM1t1EeXFP82sHeS0NNW3bt4zUwHIV6PzN7zF4u05SIsDnfCairGyBT46aBTGJG16Y/3g9UqSYg==
X-Received: by 2002:a17:902:7c0d:b0:16d:500b:1255 with SMTP id
 x13-20020a1709027c0d00b0016d500b1255mr12369828pll.98.1658772906915; 
 Mon, 25 Jul 2022 11:15:06 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:30c1:2484:a853:233d])
 by smtp.gmail.com with ESMTPSA id
 bg5-20020a1709028e8500b0016d8d277c02sm1125004plb.25.2022.07.25.11.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 11:15:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH 1/3] target/arm: Create kvm_arm_svm_supported
Date: Mon, 25 Jul 2022 11:14:55 -0700
Message-Id: <20220725181457.41083-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725181457.41083-1-richard.henderson@linaro.org>
References: <20220725181457.41083-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Indication for support for SVE will not depend on whether we
perform the query on the main kvm_state or the temp vcpu.
Mirror kvm_arm_pauth_supported.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index d16d4ea250..36ff20c9e3 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -496,6 +496,11 @@ static bool kvm_arm_pauth_supported(void)
             kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
 }
 
+static bool kvm_arm_svm_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
+}
+
 bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 {
     /* Identify the feature bits corresponding to the host CPU, and
@@ -675,7 +680,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         }
     }
 
-    sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
+    sve_supported = kvm_arm_svm_supported();
 
     /* Add feature bits that can't appear until after VCPU init. */
     if (sve_supported) {
-- 
2.34.1


