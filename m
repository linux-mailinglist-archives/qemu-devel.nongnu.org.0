Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F20151627B
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 09:27:58 +0200 (CEST)
Received: from localhost ([::1]:48126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3zp-0005rN-G1
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 03:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2XA-0001Ct-CW
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:54:17 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2X5-0001lr-Ss
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:54:14 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so1793393pjv.4
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=43XuEEQaBW24fA/OpN/C0G+r/QXfL2oSSQvbYI2NnFc=;
 b=Dp1EyG8Bw7vAGIJeggffnOJMdkd15qSMriDMrKVG2swELp/f/VtJVqsu4sj3DfWdAW
 0LiUDXc0esBLl+HTotaiGSUwwtljWb96m3JYuSv1ereA92F1H6s/X3A5Dv5DtNtkR4cR
 kKpjK1U4GbVu4IFVco/p15RLH9La9oqcpYXXZfsuQ8LdpfWcy/u2+1GqSHyeN4JxUd1b
 Fg3q5m7eeuF2Slfqqyug/GksT6n6EbOuL3Y/X7dw3s2QPQDR6k1S4aFWfhYPXYk7jwEx
 lFunEZCWl4sCpagPt9Kj68QQkm+3BSzR4STCufyOUJiuknFNJlozO0EUDWKEm8qcRzIp
 xAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=43XuEEQaBW24fA/OpN/C0G+r/QXfL2oSSQvbYI2NnFc=;
 b=ujRuF1MnmC8GF2Lq2FWCY8ZuSEmdqwt8vqQSNjfQbHjjCULfLRmqsJtAwUX2a+GJq5
 H4GYm/zKw8J3A48l/806EeXi7au+oRd3jizHUIWt2H8D3SHcG8/R5+U2QOfL2CoOINQg
 5RA00YIfbCEHmwlIVk/WtM1w2e4nlVjNduN/UXq2Sl7qJd6zaGvTJna+NlVy1PyxC0dV
 talPWDIXXQNA0L5PtKi2swuBHriLmYPOK7iLWXmSCe9xOE1deEti5rtzxOfLtn1EkVWP
 KbCW9GwXVoRWQVKXmJb6Jg3XpW/nfY2ikUFdNbxzzpcux2Fzt048eixIseAumXn79tJc
 1MxA==
X-Gm-Message-State: AOAM533tvTpruzGEZxuIAa8dOqP6hZJLCEI5UDobZ42m/cep4oII5IJc
 UrZ3oc1YZ94PNJDvCdBgfA9LJcQ24xSbYA==
X-Google-Smtp-Source: ABdhPJyr9it5k4sTI158z0pOnp4LAaYZJoffy6uQhDVxXqC9A6uCK/C3zlRZ4MbueU18RlSGhUkHGQ==
X-Received: by 2002:a17:90b:38c5:b0:1da:4d99:6951 with SMTP id
 nn5-20020a17090b38c500b001da4d996951mr7018770pjb.243.1651384450605; 
 Sat, 30 Apr 2022 22:54:10 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 u63-20020a626042000000b005082a7fd144sm2341507pfb.3.2022.04.30.22.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:54:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 42/45] target/arm: Enable FEAT_CSV3 for -cpu max
Date: Sat, 30 Apr 2022 22:50:24 -0700
Message-Id: <20220501055028.646596-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This extension concerns cache speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 9765ee3eaf..48522b8e1c 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -16,6 +16,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
+- FEAT_CSV3 (Cache speculation variant 3)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 07b44a62be..40f77defb5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -749,6 +749,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 762b961707..ea4eccddc3 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -74,6 +74,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
     cpu->isar.id_pfr2 = t;
 
-- 
2.34.1


