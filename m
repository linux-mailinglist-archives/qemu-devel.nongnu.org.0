Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3831B69ECF8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:38:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexM-0007PL-B8; Tue, 21 Feb 2023 21:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUewz-0007DM-Ck
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:45 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUewx-0001Xg-Ro
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:45 -0500
Received: by mail-pl1-x62c.google.com with SMTP id ko13so7848259plb.13
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LyJ1TFoD8DKR6NPPurEInLjBprHxsrJkr+brbjdIpWE=;
 b=KoYka+m3MnB3Dh407pkL/LSp1/Yj40RAX6G8yCRm/DMOmXJXvS0Bo+ObKisZUrmQqM
 651KugXF3JOFzOnuXCp52oAU23Vcl5BD6z0tjx9iuOy7blx+igbxbvOu4BlbaGP74lMY
 bV0WYRtkN6Kv27c7sR8eH6/Cr8f4hSvH5aquKMX8j3TvXtUEnQ45zsG7bvk7iFzoXplO
 RIk85Rf3ok1sTkx0iPDnGkwjzW1HCWCnHEoHrkOMFJjbTrmQTyY+6uZw95vHvvaIkdMR
 /CqFPy3kWSWgSzwuClyzHlWj7IQTp7bVRlBXfHS9bIiQ8IIL0bFh1W2zaarEWKQnWTo8
 83TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LyJ1TFoD8DKR6NPPurEInLjBprHxsrJkr+brbjdIpWE=;
 b=oEY5xIVf/lKEgLiJn+CtMgMo2XQpPsRoNJYlDWts/SnQwIQi5XY9an/cU10hYIsqt3
 lGb+ep2U5sdL6IQKRH0KQzD+ZZZdFhn7UEKMj0fvTU4Lw/rhSIS5yYTQSc6T6tV0Rjp2
 g3wkMJSIFfOzUWhflrmYJ0mKS6VM1/lefVdW8RWdNNpTZ3LxZD3Mg38Lkyi3HawFuuxU
 Nvk5ghZu7nsg6C3mDW0bFRvssLjDnX5AoepRsf+W8orGRiI45in88ZErCe8ti+Gwz0ae
 YCG40b8xeeRNId0I8CKIeh7+sxleWP5hr8iYgukMyzX22sS5pBBeR8PCWbdA8Pix5N7S
 Wj2w==
X-Gm-Message-State: AO0yUKXO+t7hG5zZ5ZZHCDoe/bH+r2vo2U7z9YMb1Nt86WQ6acqqcIeN
 AmeEnJQpuL6Qt+n51jcc0OCFC/D8bRfaxzmycv0=
X-Google-Smtp-Source: AK7set8+Uu0Mb+UMQmpNtl4S/TumEjebIttJrniVHnMSfrI+cuOSkkQbXYe1BhDoUnwmrYzvOTYJWg==
X-Received: by 2002:a17:902:f60e:b0:19a:aaac:f4d1 with SMTP id
 n14-20020a170902f60e00b0019aaaacf4d1mr6007893plg.13.1677033222242; 
 Tue, 21 Feb 2023 18:33:42 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 02/25] target/arm: Stub arm_hcr_el2_eff for m-profile
Date: Tue, 21 Feb 2023 16:33:13 -1000
Message-Id: <20230222023336.915045-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 07d4100365..37d9267fb4 100644
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


