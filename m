Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F33612D2B0F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:32:44 +0100 (CET)
Received: from localhost ([::1]:52418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmcAd-0006xm-Vz
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1a-0007S4-E8
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:23:22 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1Z-0005nE-0F
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:23:22 -0500
Received: by mail-pg1-x532.google.com with SMTP id e2so3711667pgi.5
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 04:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJyK9Dku6QtLgbsw5adpDcTstA66S59krX4mFmun8KU=;
 b=J5VJH565XkS9uzlkCcwXEGZoYvCD71vyT6mmtn0IvTtRMCVkgOhS4NO1QCRcqpeZ74
 1bv8JO2DWzF75K4KAxs1SpHMKofdTwMkNwHWdxusGyW0RRdwqhhBqhBSKZ98+7Kcsfed
 zhBk6DA/HJ+A4xwX/shsfmsueJ52e2ENHYDO007n1e1AHeMOyjpPQLqaPg1LZD4Uje1t
 Gn198lPqMYZ2aA5hXtMN1ZX5KlNfpSs0cwi5pWxOB8vMcp8byg/cxFNBSQkYSBe3e7/G
 UT2tW65MCAExD6FMFn2YTCqn2BlAGkH3GQpwbcNiHuQns1Ur65VQajzj1mtryThaFM6z
 uoiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJyK9Dku6QtLgbsw5adpDcTstA66S59krX4mFmun8KU=;
 b=af2RjJ9k3Bcn/0Q0iWkkKom21YTGLUooEkUPAZIL1yWdBy4/HmOmiD/Ylopr9lH+Rg
 XwgH3dQMQBop4Y9SuHp24ojdqOl5+agBm/Fy3pn0WQnym/xgue0cyyQv9kJPcLs74rGA
 U9CUPxcaVu+BRfKhuhZXVXvr4AryJFECdkZpQyPPLGJQXw+fFQKhygdlxWvFXneGAh8B
 Yt96U7TMYKL2y/GIXBMGCDof4sOav5RjRe9ppVIzstdyimF4w9DGN+Ws/j4zRAuvKa0t
 czoVy62lfThQ5U76z2lZuF6pOmdl9QGKl7B/EZ1lPGqAwc01MUwEf/s4bYbqWzmSBkmV
 4VEQ==
X-Gm-Message-State: AOAM531VXnq7cBcUHrMjI2AdSdceiqFyynbrYQ0+bPF8mTFi45ZCwvxx
 0yipXF3uSyvq7rEIefrGcK0qTg==
X-Google-Smtp-Source: ABdhPJw7egUgXbAJ5yuH8V4j3QhHXvLgN7s7lfZ1hcwQjX5B3cONUfNuKLb/slEcMhTYKVr7erQpmA==
X-Received: by 2002:a17:90b:4b0a:: with SMTP id
 lx10mr4102627pjb.128.1607430199842; 
 Tue, 08 Dec 2020 04:23:19 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b2sm3472377pff.79.2020.12.08.04.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 04:23:19 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 4/5] target/arm: add aarch64 ID register fields to cpu.h
Date: Tue,  8 Dec 2020 12:23:05 +0000
Message-Id: <20201208122306.8933-5-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208122306.8933-1-leif@nuviainc.com>
References: <20201208122306.8933-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=leif@nuviainc.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add entries present in ARM DDI 0487F.c (August 2020).

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5e9e8061f7..2a12a5ce92 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1863,6 +1863,9 @@ FIELD(ID_AA64ISAR1, GPI, 28, 4)
 FIELD(ID_AA64ISAR1, FRINTTS, 32, 4)
 FIELD(ID_AA64ISAR1, SB, 36, 4)
 FIELD(ID_AA64ISAR1, SPECRES, 40, 4)
+FIELD(ID_AA64ISAR1, BF16, 44, 4)
+FIELD(ID_AA64ISAR1, DGH, 48, 4)
+FIELD(ID_AA64ISAR1, I8MM, 52, 4)
 
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
@@ -1873,11 +1876,18 @@ FIELD(ID_AA64PFR0, ADVSIMD, 20, 4)
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
@@ -1891,6 +1901,8 @@ FIELD(ID_AA64MMFR0, TGRAN16_2, 32, 4)
 FIELD(ID_AA64MMFR0, TGRAN64_2, 36, 4)
 FIELD(ID_AA64MMFR0, TGRAN4_2, 40, 4)
 FIELD(ID_AA64MMFR0, EXS, 44, 4)
+FIELD(ID_AA64MMFR0, FGT, 56, 4)
+FIELD(ID_AA64MMFR0, ECV, 60, 4)
 
 FIELD(ID_AA64MMFR1, HAFDBS, 0, 4)
 FIELD(ID_AA64MMFR1, VMIDBITS, 4, 4)
@@ -1900,6 +1912,8 @@ FIELD(ID_AA64MMFR1, LO, 16, 4)
 FIELD(ID_AA64MMFR1, PAN, 20, 4)
 FIELD(ID_AA64MMFR1, SPECSEI, 24, 4)
 FIELD(ID_AA64MMFR1, XNX, 28, 4)
+FIELD(ID_AA64MMFR1, TWED, 32, 4)
+FIELD(ID_AA64MMFR1, ETS, 36, 4)
 
 FIELD(ID_AA64MMFR2, CNP, 0, 4)
 FIELD(ID_AA64MMFR2, UAO, 4, 4)
@@ -1926,6 +1940,7 @@ FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
 FIELD(ID_AA64DFR0, PMSVER, 32, 4)
 FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
+FIELD(ID_AA64DFR0, MTPMU, 48, 4)
 
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
-- 
2.20.1


