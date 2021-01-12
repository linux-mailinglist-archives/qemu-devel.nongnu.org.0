Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43802F369C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:08:26 +0100 (CET)
Received: from localhost ([::1]:51912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzN9d-0002jy-VU
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzb-0001WI-4k
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:03 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzZ-0006yA-JP
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:02 -0500
Received: by mail-wm1-x330.google.com with SMTP id y187so2789945wmd.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YmJipAg+O6Dy+TutSAvdqlDacqJcXiWHQ54CqTsqao8=;
 b=CRxqQL3x7XK4ekrrdgQXXHxEAyh9F1JjY/H582hFmo/Z1ZyjoiG4Q2hlUKnEfLDImy
 Fw2Ugf7+4v/tBBNvsKlPTmdDoxUEF2gyrEFh0RPMVPDEb6jY8a4ZNqxuu8bZMatS6twA
 9RBNgICpu7pky2hxIysLU7x8y/09RwjJfb4aPLOhmTxtWMREz31qnOuAlgCXrwXsccmD
 evT9jt4JBK6r4A3T/T1quKevTdqJ/VpGiqsP699DkjpmvJNQqhTorKbK73vMEoRsZRZH
 65yp2tIZ/+u1xyVkewK3EzaWLiWKx8kCjksWGHnriFDYK4BklQ7fonec7BxFAXuE05/w
 dkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YmJipAg+O6Dy+TutSAvdqlDacqJcXiWHQ54CqTsqao8=;
 b=EqcfigY4Ef86xXiKlImKZgfQOvidjeMHa3KSPb0GAUPX4gdQC6JKJr7ZlOK54lfWl+
 vXd/tP0kJRln8HFzRAMRzgO9MkRN/N00cR9rCoPFKZ5TzsJzevFM0s7Pztoe75aV8tb6
 g8n7+5UUfr+ulh3PQeGhXBKzo7isYeWYtrUHfc79LSt4sAu+NBJgUd+RbhQyR5E2GjIE
 V5YonYWJfT3yOLTjmux2o7YKN/+KplZxM4lmfG5YmMnfhma4Us8Zua/fkmhUNLl4msvn
 CIn39Kz1t9mHjNy1MRt+reH3EAzwb6WMzgjtviULB15LT3NjtQYBiY6sEVvI43Nl6NI7
 dHkQ==
X-Gm-Message-State: AOAM530uTC81V0K217p8r6JMiSkpe1qRz92lcxv80DCKoSIuWpkTm8Q4
 XLQE7axQIlUTm/8AOK1LapWmzz7UEzdDiQ==
X-Google-Smtp-Source: ABdhPJyCqIQ4llshMkSbhVOhn6etMsNElWU8xeZhMNjEpaigQrmL7l9mpx834/iJeowlIr4CVztNPg==
X-Received: by 2002:a1c:a706:: with SMTP id q6mr185127wme.7.1610470680003;
 Tue, 12 Jan 2021 08:58:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.57.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:57:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/21] target/arm: add aarch64 ID register fields to cpu.h
Date: Tue, 12 Jan 2021 16:57:36 +0000
Message-Id: <20210112165750.30475-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leif Lindholm <leif@nuviainc.com>

Add entries present in ARM DDI 0487F.c (August 2020).

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Message-id: 20210108185154.8108-6-leif@nuviainc.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9c1872f2686..d8fb8c845ca 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1902,6 +1902,9 @@ FIELD(ID_AA64ISAR1, GPI, 28, 4)
 FIELD(ID_AA64ISAR1, FRINTTS, 32, 4)
 FIELD(ID_AA64ISAR1, SB, 36, 4)
 FIELD(ID_AA64ISAR1, SPECRES, 40, 4)
+FIELD(ID_AA64ISAR1, BF16, 44, 4)
+FIELD(ID_AA64ISAR1, DGH, 48, 4)
+FIELD(ID_AA64ISAR1, I8MM, 52, 4)
 
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
@@ -1912,11 +1915,18 @@ FIELD(ID_AA64PFR0, ADVSIMD, 20, 4)
 FIELD(ID_AA64PFR0, GIC, 24, 4)
 FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
+FIELD(ID_AA64PFR0, SEL2, 36, 4)
+FIELD(ID_AA64PFR0, MPAM, 40, 4)
+FIELD(ID_AA64PFR0, AMU, 44, 4)
+FIELD(ID_AA64PFR0, DIT, 48, 4)
+FIELD(ID_AA64PFR0, CSV2, 56, 4)
+FIELD(ID_AA64PFR0, CSV3, 60, 4)
 
 FIELD(ID_AA64PFR1, BT, 0, 4)
 FIELD(ID_AA64PFR1, SSBS, 4, 4)
 FIELD(ID_AA64PFR1, MTE, 8, 4)
 FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
+FIELD(ID_AA64PFR1, MPAM_FRAC, 16, 4)
 
 FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
 FIELD(ID_AA64MMFR0, ASIDBITS, 4, 4)
@@ -1930,6 +1940,8 @@ FIELD(ID_AA64MMFR0, TGRAN16_2, 32, 4)
 FIELD(ID_AA64MMFR0, TGRAN64_2, 36, 4)
 FIELD(ID_AA64MMFR0, TGRAN4_2, 40, 4)
 FIELD(ID_AA64MMFR0, EXS, 44, 4)
+FIELD(ID_AA64MMFR0, FGT, 56, 4)
+FIELD(ID_AA64MMFR0, ECV, 60, 4)
 
 FIELD(ID_AA64MMFR1, HAFDBS, 0, 4)
 FIELD(ID_AA64MMFR1, VMIDBITS, 4, 4)
@@ -1939,6 +1951,8 @@ FIELD(ID_AA64MMFR1, LO, 16, 4)
 FIELD(ID_AA64MMFR1, PAN, 20, 4)
 FIELD(ID_AA64MMFR1, SPECSEI, 24, 4)
 FIELD(ID_AA64MMFR1, XNX, 28, 4)
+FIELD(ID_AA64MMFR1, TWED, 32, 4)
+FIELD(ID_AA64MMFR1, ETS, 36, 4)
 
 FIELD(ID_AA64MMFR2, CNP, 0, 4)
 FIELD(ID_AA64MMFR2, UAO, 4, 4)
@@ -1965,6 +1979,7 @@ FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
 FIELD(ID_AA64DFR0, PMSVER, 32, 4)
 FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
+FIELD(ID_AA64DFR0, MTPMU, 48, 4)
 
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
-- 
2.20.1


