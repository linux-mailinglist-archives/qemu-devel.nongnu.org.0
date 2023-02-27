Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842CC6A4F12
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 23:59:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmSB-0001Q0-VX; Mon, 27 Feb 2023 17:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmSA-0001PD-LA
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:58:42 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmS8-0008VL-5A
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:58:42 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 k21-20020a17090aaa1500b002376652e160so7811332pjq.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 14:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J33WqVqAxFla+dpmD2MbLyNB18FeHqj+AFmY8xo8oOg=;
 b=Q9Ddh4nAqUVNIP3p/merUIIeqsHyMC0zpe6gxHTvWWr2TRkPXf/W0fQF6n6bnhN14x
 UuohiUN5eRTOL05z8hKraKpy6Tu1jlASLyT+aifFtUtaWCXejSbmZ1OGa8efZNFDtDTN
 vgmyIebL/NWQG2v3G+Ab1m26wtrcEGJw1w/P8Qp9Ngbaqq0cBj53WFCLtHbgjCol9FSf
 VAgtXymBGNuub9b+a+L6bkEA7LRqJz8YQIZ53+FjeTHm+gxjNLrhWVS5CU4ihjVDl8Yj
 5wK1sHe7Sd04b2jNJtPafLUMVMUgjPwyiJ63AqTXy+bRrXdtiAM4f3I1ApPhHwSbXIne
 vzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J33WqVqAxFla+dpmD2MbLyNB18FeHqj+AFmY8xo8oOg=;
 b=527tgDKxRSGur0sP/g+aEOyeJgenyiwWszIcyohjo9udYhB6CXJ2ahvtShPZl1pngZ
 sYW5k9gdI5TYYU41+K3IbhBOqI7vgiJ04n8oFko/DIH9VYr0K8BOhRNTAIM2Lc6i1+CL
 nXVl0vNvoM2W04WVuVG7Fvn9qR3hjwTTlqPt3sjQzziqfMBMOY91KyWk8ybrgspQdXCU
 Werzzykhn35DmpE7HFMNWXv/ODe1FTR0zQE8Skrmbl40XCd61MlvDOchXMM6pMwheBmt
 duF0al86UTqGryF6ZMyTr5P+7CyKHPWdlVtP1YDl14tohWbV8bku6Wz73gM1EYz5V4Mf
 8V3w==
X-Gm-Message-State: AO0yUKVoNjnQBEJqUq4VlcU3UQoesEHu+1uYRL+QXfCY55jDMXxTZG1Z
 9PxoYFZRtziLSoKc1qy5Cm/RLIeMBgBa3EhsDxg=
X-Google-Smtp-Source: AK7set+atZxqKultIk7M+pjqQqfqad/wJEH1S1dy3lCqcHRjvAfyhFI9i62lKDjnO6uES2Pb3hLwgQ==
X-Received: by 2002:a05:6a20:c323:b0:c7:1da3:e3a with SMTP id
 dk35-20020a056a20c32300b000c71da30e3amr924967pzb.16.1677538718760; 
 Mon, 27 Feb 2023 14:58:38 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a6566c2000000b00503000f0492sm4441050pgw.14.2023.02.27.14.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 14:58:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 2/4] target/arm: Stub arm_hcr_el2_eff for m-profile
Date: Mon, 27 Feb 2023 12:58:30 -1000
Message-Id: <20230227225832.816605-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227225832.816605-1-richard.henderson@linaro.org>
References: <20230227225832.816605-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

M-profile doesn't have HCR_EL2.  While we could test features
before each call, zero is a generally safe return value to
disable the code in the caller.  This test is required to
avoid an assert in arm_is_secure_below_el3.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 14af7ba095..bd12efd392 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5788,6 +5788,9 @@ uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure)
 
 uint64_t arm_hcr_el2_eff(CPUARMState *env)
 {
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return 0;
+    }
     return arm_hcr_el2_eff_secstate(env, arm_is_secure_below_el3(env));
 }
 
-- 
2.34.1


