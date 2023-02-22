Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129F969ECE5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexW-0007iV-9M; Tue, 21 Feb 2023 21:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexQ-0007b5-Cy
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:34:12 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexO-0001ic-9Q
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:34:12 -0500
Received: by mail-pl1-x634.google.com with SMTP id h14so7359574plf.10
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
 b=zso61bsFfah/MWT18NzTF8AtAjKsks4Cy/ph/tOiuBaHnIsiuTMfL5WUCUkzGw197O
 AU12Noq9Gk+EddplGG2EKL4PxO2XGm33hnyig73x57Rf2WYR7II8HvgvdfIxGq1F0hvu
 HJo0N3OMq9CVRT0wYmD/Y2VPFAGsLIW6MQsIP7Vhf2LLZ7sQJza/J2Fr7PCwZwQJNN/o
 zluuikVoSg47bYg3Amolmamt4K0fHji+DfDRkeKrCc+SWh+iRVZwEEcqu9kAdTy85tCP
 Hu1sZjgzbzr9X2sf84JKxAExnpv1jk2fFq9KuH4HBFZXjic8BfwG0VpuS7sC0DcwL5es
 6fGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
 b=rwZsVhAAxumSmiFvB6sqkgx9SckCFgQAPwpnZy+6eIWOmJbT9IYGlG32Cgq34OwDQR
 Ah4X69HZzoBOn01H+cxZte4SV9Yb/VcwKB/enqa5N34325iY6xm2vLYhuyGb29PEIV0w
 TPGtli+CHlwX4I+BT65LckxCvd9tz0Lz5ae2f3XmSVtPeKh/9iKo67u3/aat2xhb/0lr
 jgRLt0f/wa2SRm5bQuZ5lvTCVy6mPRCdteGctWVdD8rPiKfpd5EKrNFB1MRRIxPHoufg
 uH+9mp1czr5sCmjdZFuIbQQjbtoiNe2531jjHNw4gi4gpd9tZPad87hNYmxfajwq6I5z
 hYEw==
X-Gm-Message-State: AO0yUKXJ8MEli/SrjAoKINqjsCXeWj2tgu9hy/iyO9VGFDBqaHaCjPBy
 cReCvc0n3WnvitOfIiW1WkJFyqjuo+ZHPluc+d0=
X-Google-Smtp-Source: AK7set/H/Z7/geyaZqHx19OYK7JmcWtcp8/w8mI1+53aQ3rA0PpCkw3XR8QBtPET8eNw2y60V5tYdQ==
X-Received: by 2002:a17:902:6bcb:b0:19a:ae81:b09b with SMTP id
 m11-20020a1709026bcb00b0019aae81b09bmr7346310plt.11.1677033248751; 
 Tue, 21 Feb 2023 18:34:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:34:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 21/25] target/arm: Add GPC syndrome
Date: Tue, 21 Feb 2023 16:33:32 -1000
Message-Id: <20230222023336.915045-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The function takes the fields as filled in by
the Arm ARM pseudocode for TakeGPCException.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index d27d1bc31f..62254d0e51 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -50,6 +50,7 @@ enum arm_exception_class {
     EC_SVEACCESSTRAP          = 0x19,
     EC_ERETTRAP               = 0x1a,
     EC_SMETRAP                = 0x1d,
+    EC_GPC                    = 0x1e,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
     EC_PCALIGNMENT            = 0x22,
@@ -247,6 +248,15 @@ static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
         (cv << 24) | (cond << 20) | rm;
 }
 
+static inline uint32_t syn_gpc(int s2ptw, int ind, int gpcsc,
+                               int cm, int s1ptw, int wnr, int fsc)
+{
+    /* TODO: FEAT_NV2 adds VNCR */
+    return (EC_GPC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (s2ptw << 21)
+            | (ind << 20) | (gpcsc << 14) | (cm << 8) | (s1ptw << 7)
+            | (wnr << 6) | fsc;
+}
+
 static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
 {
     return (EC_INSNABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-- 
2.34.1


