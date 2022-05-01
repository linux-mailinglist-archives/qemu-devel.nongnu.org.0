Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0AB516253
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:59:05 +0200 (CEST)
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3Xs-0007C2-E0
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2UC-00077O-Ch
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:13 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U8-0001Su-FA
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:12 -0400
Received: by mail-pj1-x1029.google.com with SMTP id o69so8976300pjo.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GY2odDA192T0ClkUF75+bPEfdCFgpsNoLihYttz/3zY=;
 b=gM+/p6GPe69vxR/Q8J/FwQDrVSqGyVzkIQ+2D5My/lgBUBneEIV3nqs1D0dO12nk/7
 mpYriYU2QTMMeoORugqyStoFX+KJVJtLATWT/g/VLfq7TG15G1iuOHy1VFf3xPfbZegA
 vJtiftjz00PZnOPb7etULLYqE5uzA19pRlzc+csNpmIASlwDZv8/y3rkC1+J65+RGdzb
 1efEc62aEYwevxqNlv4ob4fIf7TddzUfkb6nr7vh5KqUrqDF4nuAWuYERhe1Rf3S7tyA
 1VE96WirY7r5wN13OoekKa1gWflJMGlil2XIeR8gmPJeJXVK0fm0ICPHVB6mJ12CoP1N
 zOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GY2odDA192T0ClkUF75+bPEfdCFgpsNoLihYttz/3zY=;
 b=piSUP9CpDXiM7ZosTA8qpWB/FKUTg0LbCKWesuFTBfjDx5WdeLvqrhthKj+i3V+EZ5
 g7grkU3cs/jeeiuY99UoIX/rVvKl01srG/xNRwrKqgI+btUBGDNxa+S0zSLQQ6G6vh48
 V9RrSEV6i3qKqYU7gxbOfF6Hx38FuLz6T7RLToN5lzkulVaTuh6D7QpatN2q2YRHgU5r
 b9GwDoxz83O8ru+vCD7q+gIu33TG0bYB8cmSx/TQN6Ekak8Ujlgcth2WbG7vadeyTRyc
 C5r72NWHHuLZWXh97JOP1RsreKiavTNBsdKqoPCZH4HO0yVoRdAQcUCJaKxXMRr4jI7L
 PjEQ==
X-Gm-Message-State: AOAM533pfyqd7wV425Ossot5rh/7y8dnYpJPFWJ7b0N2fyBCKfAPmcPI
 VTZ0fE1MR0JzE4Fbg6jQWdkd0SL/FMfHiQ==
X-Google-Smtp-Source: ABdhPJy5UV7Z0F6zzBFYEFJw6QzUBnJcJT3c1Mg3EJFyquM/sT4SnP1eySpEgrcHhU9KcGoQML5hjA==
X-Received: by 2002:a17:902:e38c:b0:15b:40ca:37c8 with SMTP id
 g12-20020a170902e38c00b0015b40ca37c8mr6271854ple.23.1651384267065; 
 Sat, 30 Apr 2022 22:51:07 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:51:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 39/45] target/arm: Enable FEAT_IESB for -cpu max
Date: Sat, 30 Apr 2022 22:50:21 -0700
Message-Id: <20220501055028.646596-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

This feature is AArch64 only, and applies to physical SErrors,
which QEMU does not implement, thus the feature is a nop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8110408000..b200012d89 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -25,6 +25,7 @@ the following architecture extensions:
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
+- FEAT_IESB (Implicit error synchronization event)
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
 - FEAT_LPA (Large Physical Address space)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 35881c74b2..10410619f9 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -781,6 +781,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64mmfr2;
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
+    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
-- 
2.34.1


