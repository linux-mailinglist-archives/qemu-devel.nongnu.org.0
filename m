Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE952FC9B1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 05:02:16 +0100 (CET)
Received: from localhost ([::1]:33948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l24hD-0007WD-HP
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 23:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l24Xw-0008FR-IQ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:52:40 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l24Xu-0005Ht-F2
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:52:40 -0500
Received: by mail-pl1-x62c.google.com with SMTP id be12so11779445plb.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 19:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o2wc2wyezuQoPYYxuVH/MBOY6X9RlqIQrKqpYwiz9uQ=;
 b=MxaEFblAIXaMKNBOBA3kU9YOQuTeEG62XMhX9sTP2DFlT6dJMzld47VC+BNrpk3ZH4
 IwtZxUAwcgH2+0XUb71mEw045lQcrbZOZ6oON1vrQkjh3o3ekntBiJa22JCIYbeT28gC
 Sz9oxsKB9a0Fejc8rvDi2QpoFCE3cL5qxKHCzCN97SWJ43OOqLnLzC8bTvyvtMJCKj/g
 VOokSj4wsB15Mcp6PTIty9xZMU0lOtYAnzQCidi5kBzuN8CTqkIr3wECqthFuu95Rdba
 ml2kcQqmg6py83okYYBUOqV2nj0KjD4F/aRtaJ+X08joS2oEbEH1sxszAFOlYRBNFfcj
 Lw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o2wc2wyezuQoPYYxuVH/MBOY6X9RlqIQrKqpYwiz9uQ=;
 b=glZ9aeLAQy5eHnffjGLhM2sQeT+KSAooOcn/3A7gn72DhAzRfepQaumUeRMV2pe265
 A0iX0RLC9+xpaEhcb9uUwMz3DjXNu95lLnshOCiMYWt4le+8qXNkCXRz/RKEBmYgTY6D
 jCzF7GbAb4qo6VNvBhrGhNCb9leG9Y4nQUq1yGw/o5cPAntmN0J8XfcJdNqauVVG+Kz/
 501Pp9aaPJGaIRTY/j0b158Y1N3KPtyErCQWXH7/yNMoQlJvrvrM9FKKzOHyHKQlcReN
 l4A//+I12WabHCMKW88IqiIUm1tUzDb//YJ5ZFCj4zUMIJ0qmeyyaFxL3pbkIYWniELY
 iS2g==
X-Gm-Message-State: AOAM531fX7xy1Trwpz0eff/r0hls01G/QMdxLGKUX5OBetWG6RPIhv6s
 8QAh/3mN0wh0WDItKt0YZZX5DuuIW6AZ3g==
X-Google-Smtp-Source: ABdhPJwK2AjdJjBnbs7cq1OPBXOBcZsO5XBnswRyWHVq9KbhoRcr5tZKK9MduVXvGQmKv0dD3DsJbg==
X-Received: by 2002:a17:90a:f2d2:: with SMTP id
 gt18mr3341814pjb.102.1611114756564; 
 Tue, 19 Jan 2021 19:52:36 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id j13sm509445pfr.214.2021.01.19.19.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 19:52:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Implement ID_PFR2
Date: Tue, 19 Jan 2021 17:52:33 -1000
Message-Id: <20210120035233.948436-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was defined at some point before ARMv8.4, and will
shortly be used by new processor descriptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

I've pulled this out of a largely defunct 2019 branch.  This will
be required for the cortex-a76.  Aside from simplistic isar changes,
this is unchanged from its April 2019 review, so I did keep the r-b.


r~
---
 target/arm/cpu.h    | 1 +
 target/arm/helper.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df0d677833..d080239863 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -922,6 +922,7 @@ struct ARMCPU {
         uint32_t id_mmfr4;
         uint32_t id_pfr0;
         uint32_t id_pfr1;
+        uint32_t id_pfr2;
         uint32_t mvfr0;
         uint32_t mvfr1;
         uint32_t mvfr2;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 10102aab3c..677a4aa79e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7671,11 +7671,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = 0 },
-            { .name = "MVFR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_PFR2", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 4,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_pfr2 },
             { .name = "MVFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
-- 
2.25.1


