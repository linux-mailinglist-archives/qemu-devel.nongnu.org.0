Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CCB5449BD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:07:54 +0200 (CEST)
Received: from localhost ([::1]:59350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzG12-0006mH-4r
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7o-0001rX-50
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:44 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7i-0006BK-O3
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:43 -0400
Received: by mail-wm1-x331.google.com with SMTP id z9so5330625wmf.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZDzwoFqQkyUODGOZytKyrO2zzhN95wbOXNg0vdTc5XQ=;
 b=MObO/wfYFRd9V8SBfrCe3zeKzYWbPisVcnsfpRig3h/RGW2oxZ5pibjqvHuZEw5POB
 L7/KfM2jso5mszakTB80q3fPOPbyb8ZNuWiJ1mT63JqkAvIsZMp7/oJcq5VhMQVSupuj
 SVpGUs2WmKlrzSeodFPYvbFrjgKgEP6YIEhtDDutU05xRdzApX+boWSoDcSWbn2f8I+w
 bugYye20JucZiKZqfUrdK4NPxAnCWguYbAINx77iYjpx/r9ck+F9BUVkpGh2SxxSUx2B
 27DQf3ObZ1TxkeBIvzwQHXaw7cixqriVOsEK7wi/OuJ0EfPX/v+n0uyGbyOfuMn9RmQO
 pQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZDzwoFqQkyUODGOZytKyrO2zzhN95wbOXNg0vdTc5XQ=;
 b=k89JxNRW/le4Jhe5f+Q5oXqceypxD5YJEW08XssPsIX0piLi7kDbDvpTthLUSHtIoW
 TIyegCx8oADD0TOjY/o8zPnd2nXDAwk9vwX0A3jUjOtoceFd+GKAk7/HTtwEc15fLUA6
 vdtiFyVPriJgmbeHwlpR2E1ZHeh1YjuM//cD/VHfeUW9Zcu2ZFxu+4O1z41e//k41vqb
 6Bib1F4Ia9gIG5RJFJWNBcE8lTfq+k+bwqyGXCCeBjtoL05pCYBX+qcUivSHy5Ju9nVP
 viRifefHwEVW1PaNnFQ4biIEtZIEo86BhcYlbKknYItALS67v/Iez4f1PXQ8hxMYJVF+
 m+7Q==
X-Gm-Message-State: AOAM530aVCtAQsLJYSGYV7w0y83F4AG0EFI4cX2yLQQXwd/qWeGRB6pO
 +D5agPbUtlqFd6WIpMQdxt91iknH+PDsrA==
X-Google-Smtp-Source: ABdhPJy2nU75B6bitV2nDgfouvimkdJLozQsFceW8B92tpuv8AKk9pVQJsLNIhH8Ffp+Q5EajWXsPQ==
X-Received: by 2002:a05:600c:1ca5:b0:39b:a66b:7805 with SMTP id
 k37-20020a05600c1ca500b0039ba66b7805mr2143187wms.87.1654765596499; 
 Thu, 09 Jun 2022 02:06:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 54/55] target/arm: Add isar_feature_aa64_sme
Date: Thu,  9 Jun 2022 10:05:36 +0100
Message-Id: <20220609090537.1971756-55-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This will be used for implementing FEAT_SME.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-20-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e45b5cb7fe1..2e6153c5409 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4048,6 +4048,11 @@ static inline bool isar_feature_aa64_mte(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) >= 2;
 }
 
+static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SME) != 0;
+}
+
 static inline bool isar_feature_aa64_pmu_8_1(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 4 &&
-- 
2.25.1


