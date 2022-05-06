Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CDE51DF1B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:27:52 +0200 (CEST)
Received: from localhost ([::1]:52924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2g7-000850-VZ
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IX-00069P-FW
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:25 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:37095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IU-0003sM-BJ
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:25 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-ed8a3962f8so7984224fac.4
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ffCp2E5F/+S85cFm2jKC10BX2N+sZzcIlrVCqyHFbrg=;
 b=lkC6u9JmRmRhufAqL9fOvsaTmRzCYHXRHJ2J6OinN+iTNAklnfQp4ADrfCu83QdxxP
 HD/SA/puFPFeqZuU/uyAXJuA5kpaazM+WZdqQGkq9zO/lm9PfM0VFWHoWNjUsxBaBzQ8
 7daejCVgZwUXCtq2gplPBDowkA4y5ByXqYOFz2W+WIi6+m6WmVd8Q2DebJJIYb5W57eG
 fYu/LgRnnP+NpQuy8B3hrTMR0+VGOwmPTXL7hXZNfPhRx9ty5oEO6XkSuvLOjag2Rf0X
 GOVkqLh+Z5OUmct3urBNJrp5ImXMNVNQir4wGfBFDBnSitGkgQ5lv7NxqVkiP2fdy8kM
 1cSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ffCp2E5F/+S85cFm2jKC10BX2N+sZzcIlrVCqyHFbrg=;
 b=dHaHNtwswdRb0ULnMmPxRkMn4zzSegUDIoMthCJp0koq6Nfkm+2/94Brxh+a1Zz8ao
 JaKwi/r3PiBQS2CF4pPNm4MQ3o2rqgQGAxxtwmXsOlH5F59zmdl2wX52NeRkxP3m/Jol
 bxVBJ20xIxI/Ye3whx+kLAtrMM19WhOhtBYgRq71f1xaqyRPO9h3s0PKaheMvPlJ7yN9
 8muCXO03Z0kuuJff8sxK1sUCWtKcKR7RXr5P6y6/CTDjV+foeN/KJv6aVnb/Ru7eawks
 3bD7vAus4PUuAxOUv3zDCvjptFUEkjq9QZRuDGUL6Qp79MYdtgY7NvJCsDCOvm3O4Eoe
 jo6w==
X-Gm-Message-State: AOAM533bsEviOPpTz7nwVaqCuXPSUdf/BA4CDXT/bTYM1GypafRuhUzk
 NyluwP4fwMtNyvYht23hrixT7odTKD/j8JM+
X-Google-Smtp-Source: ABdhPJw/WhEnRy2g8O06Ze+Don6hAdJ6EMXA7afv3L6LouVCHALAMJw93b/JFbBkXxBddl7Pa2p/Gw==
X-Received: by 2002:a05:6870:961c:b0:df:27ec:ed7f with SMTP id
 d28-20020a056870961c00b000df27eced7fmr1849133oaq.275.1651860201704; 
 Fri, 06 May 2022 11:03:21 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 22/24] target/arm: Enable FEAT_DGH for -cpu max
Date: Fri,  6 May 2022 13:02:40 -0500
Message-Id: <20220506180242.216785-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
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

This extension concerns not merging memory access, which TCG does
not implement.  Thus we can trivially enable this feature.
Add a comment to handle_hint for the DGH instruction, but no code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/translate-a64.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 48522b8e1c..8ed466bf68 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -17,6 +17,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
 - FEAT_CSV3 (Cache speculation variant 3)
+- FEAT_DGH (Data gathering hint)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 40f77defb5..f55121060d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -738,6 +738,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);       /* FEAT_SB */
     t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);  /* FEAT_SPECRES */
     t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);     /* FEAT_BF16 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
     t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
     cpu->isar.id_aa64isar1 = t;
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5a02e076b7..6a27234a5c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1427,6 +1427,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
         break;
     case 0b00100: /* SEV */
     case 0b00101: /* SEVL */
+    case 0b00110: /* DGH */
         /* we treat all as NOP at least for now */
         break;
     case 0b00111: /* XPACLRI */
-- 
2.34.1


