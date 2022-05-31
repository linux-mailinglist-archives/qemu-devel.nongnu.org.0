Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C0A539009
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 13:47:55 +0200 (CEST)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0Lp-0008JW-SN
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 07:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0HB-0006Oi-Hz
 for qemu-devel@nongnu.org; Tue, 31 May 2022 07:43:09 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:41893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0H8-0006XR-Po
 for qemu-devel@nongnu.org; Tue, 31 May 2022 07:43:04 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso1052090wmp.0
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 04:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cNL+HPsxLGvedzt9IvX4iZGG5fGms7OwfjLou6Y4NNI=;
 b=Kft7PTh29RX49ExqUccUif8VayupKUbii3utrixoAWI6dsOyfgPzCU+sur6voj9jOU
 mLn3IU7F04+AkgkvJoU9grt2zWYdZMzGTDMq/UBVeI4PwWgrYNmn/7+CTjlDPuQ13Lmc
 MCNR2wlsaaiwEqqPnBflg6JTrmZ2tEqPyLcEJnHVXaXwdcZF8DAOEFRNDey1jpPoGd7d
 tlG9n7stl2YLxlQhWW5cmX3urMFdNlT440kRJ7YMnbaV8BPFlb704wh5UeCm3otfLgbD
 eGtjU6zZh1gi7b3tLq+EiwFsLHkhPogq7orYM7U7IpoQ6NRGRBPbCSvbOtrBy58ooHUY
 G0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cNL+HPsxLGvedzt9IvX4iZGG5fGms7OwfjLou6Y4NNI=;
 b=b0GK8jIC1gbTeq3Qn2uYWXovxmmLElj2TgiJiCs/ekC4uaHDdinxxybO57pxpphefK
 1tRziA/Uuqoe7ri5N79D5tBHwGGg/bZQXTg62E6b77lshHwsLUqAUCsDwLPE6AGCGacT
 VX98zUmuOYAaIcmloCHucL8c7AGhK2HVGOfbcWK+HdMizwv9bDgatCKzWLE70n50Duem
 scLMjWszQV24fPjJOENlh94nVsR9Z0LFGuwaEqvHKL+W1qqtb8F3aH28wEPPJ49Ozot/
 pAA1PR627Hq4zD8u2SFEK11+6ZnffB9eyeXPRVYR/oD8Fd0D4FTk1b4Mu1xVrR6mYNdp
 9Adg==
X-Gm-Message-State: AOAM530rFtHQJtTX3NjoAxnqXzbkHUAyy/+eoTcPm+jLnwP1mVO+SQxE
 uD8YhUahjyJbHIeXug8wqexDAg==
X-Google-Smtp-Source: ABdhPJwgH5j652U5Su+wuSGuLECRdVQHOs6JWd52YO4/vjj1FPZMMQ1318lypDx8qUPn4qLCGl9iew==
X-Received: by 2002:a05:600c:104a:b0:397:3385:898a with SMTP id
 10-20020a05600c104a00b003973385898amr23268991wmx.7.1653997380932; 
 Tue, 31 May 2022 04:43:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a05600c221100b003973d425a7fsm2224309wml.41.2022.05.31.04.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 04:43:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Declare support for FEAT_RASv1p1
Date: Tue, 31 May 2022 12:42:58 +0100
Message-Id: <20220531114258.855804-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

The architectural feature RASv1p1 introduces the following new
features:
 * new registers ERXPFGCDN_EL1, ERXPFGCTL_EL1 and ERXPFGF_EL1
 * new bits in the fine-grained trap registers that control traps
   for these new registers
 * new trap bits HCR_EL2.FIEN and SCR_EL3.FIEN that control traps
   for ERXPFGCDN_EL1, ERXPFGCTL_EL1, ERXPFGP_EL1
 * a larger number of the ERXMISC<n>_EL1 registers
 * the format of ERR<n>STATUS registers changes

The architecture permits that if ERRIDR_EL1.NUM is 0 (as it is for
QEMU) then all these new registers may UNDEF, and the HCR_EL2.FIEN
and SCR_EL3.FIEN bits may be RES0.  We don't have any ERR<n>STATUS
registers (again, because ERRIDR_EL1.NUM is 0).  QEMU does not yet
implement the fine-grained-trap extension.  So there is nothing we
need to implement to be compliant with the feature spec.  Make the
'max' CPU report the feature in its ID registers, and document it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 49cc3e8340e..81467f02ce9 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -52,6 +52,7 @@ the following architecture extensions:
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
 - FEAT_RAS (Reliability, availability, and serviceability)
+- FEAT_RASv1p1 (RAS Extension v1.1)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
 - FEAT_RNG (Random number generator)
 - FEAT_S2FWB (Stage 2 forced Write-Back)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3ff9219ca3b..bd1c62a3428 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -916,6 +916,7 @@ static void aarch64_max_initfn(Object *obj)
      * we do for EL2 with the virtualization=on property.
      */
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
+    t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 1);  /* FEAT_RASv1p1 */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr1 = t;
 
-- 
2.25.1


