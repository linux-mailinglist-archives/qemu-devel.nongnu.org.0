Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF94A315B2D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:32:01 +0100 (CET)
Received: from localhost ([::1]:50614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dQG-0006DD-VJ
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyq-00042O-MR
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:40 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyG-000892-JN
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:33 -0500
Received: by mail-pf1-x435.google.com with SMTP id k13so82431pfh.13
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zutLObbbmGj+vDYG6xd0xYNbblW6KsHhsY9sXf6gyMM=;
 b=vH8NruvdlOxmRJYFiunIM2UFiiXpRbXRKuoqN2CmlgtPGk/tVy8XTBWKFYR28ix3kd
 Vx8PUj85zcXYYmOE+jdUgGt4IZ5Md6MRIElm3QYv6KMXspSBnX3GzPma9W0p+baMuvV9
 G1cfc5l3l8rzHJn+Nw5x/53mCyY57Rewsoc4dcHGT0GFWubosc5L8oaz6CNEnHBUqP+p
 Iv2GfuEAWN7bJBknDNuqIMBln7tWoqipjfhoX1M5FcYesdQlGgwIUXGZlfB3uKUs0HFq
 g3HNXjJnWQp8nu2G/jZ5PfMvOiXaCY3r1ebTMHcycHACSbY9rU7euMZjiLS6stfmfeLd
 9iKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zutLObbbmGj+vDYG6xd0xYNbblW6KsHhsY9sXf6gyMM=;
 b=dqr+JnCN6fJ/st6kHaUFXdGcYcqDBktPtQYaKWSFLMjevmZrT9Fn8ynO5fRaJ3uOqO
 vK4rccCJEGRfR/caJtqEVpnbA/2dGTuPpEU0NkcIQbTMT69YiBjLqjR2WJ8BzATK1b8D
 3ijOGsgCnIMWFPOZHaYIc+GClJFq/8snDUh9qEOrAZQH51LapeRsAVqqtmSP4SsZ3pEE
 /QC/bRge0TY6pOUSIWWQh9HY8oo8DhIIxywk1HuheNgL/ZzsmB0+pB1hKrswnsvMfzNa
 +WU3nCFr4NOJnZOBTQsUpkZ3E6Tb4HYDT1UGXrNfaKsygwm/zGcSx0blyieDGLpv1FTY
 SXoQ==
X-Gm-Message-State: AOAM530xEa/nG2/KklGhYaDy/HQUU58UlHFPQSnBjX8Il4REK5OJXSrv
 OmzVOepcmSABZTCwu+0xajr5BOVSLstTOQ==
X-Google-Smtp-Source: ABdhPJwKRQiwszLyyIwfI3FNYsSKeS/jhljPhgo+poVzjIy8ggX/ea4urZaRxo5KdCeZ2KnJf3pL3A==
X-Received: by 2002:a63:c54c:: with SMTP id g12mr387887pgd.449.1612915382048; 
 Tue, 09 Feb 2021 16:03:02 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:03:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 30/31] target/arm: Enable MTE for user-only
Date: Tue,  9 Feb 2021 16:02:22 -0800
Message-Id: <20210210000223.884088-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 761f0c61bd..929de1071b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -209,6 +209,21 @@ static void arm_cpu_reset(DeviceState *dev)
          * Note that this must match useronly_clean_ptr.
          */
         env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+
+        /* Enable MTE */
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            /* Enable tag access, but leave TCF0 as No Effect (0). */
+            env->cp15.sctlr_el[1] |= SCTLR_ATA0;
+            /*
+             * Exclude all tags, so that tag 0 is always used.
+             * This corresponds to Linux current->thread.gcr_incl = 0.
+             *
+             * Set RRND, so that helper_irg() will generate a seed later.
+             * Here in cpu_reset(), the crypto subsystem has not yet been
+             * initialized.
+             */
+            env->cp15.gcr_el1 = 0x1ffff;
+        }
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.25.1


