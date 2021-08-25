Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1153D3F7393
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:44:40 +0200 (CEST)
Received: from localhost ([::1]:44670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqOd-0002j4-0P
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG1-0002qk-5S
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:45 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqFz-0005Hw-Bb
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:44 -0400
Received: by mail-wm1-x32f.google.com with SMTP id g135so5368693wme.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lutAo5Z1ewFuThzfMPVLqlhd9Ml/H60A8yYUE67fuT0=;
 b=mm9tNkR9OIqyJPFUrZnvmil8drl/kr+K0iJQ1KY1Yh0uO3mMqhed4zoNvc/WtRWCiZ
 uw/bx1hrZsjjvNui9DXdsT/UToTp+YmZXrn2IzIG9JYHWCb9WcJZxM1KJGwipkRGhG9O
 KqLKd1w0r+Q9jsDvlY8QHWPch22RdP7LqYNpxrQwHxxGeWReKRHFg2xlSkz2rteDGKPd
 rJAUtIa/bjPHhdyhvFYSx5ugPIt4jmFdfNl7/muiMBIcttjpEoj32+RMo4ZIgC73rg8T
 +9Z3Jw0V58N1W7JTLzJYfgWWeqdL+s5VqUlxyQPWgCvkvrzxc6JAUItVrIKhoQCBGglL
 DJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lutAo5Z1ewFuThzfMPVLqlhd9Ml/H60A8yYUE67fuT0=;
 b=RI+T3nLeWAa8LXZMr9rcCHcyOviw/MKuE2DVVPvvHSDS/Xm45CkdY3vCN18/vUEHdE
 fHpWVl/dtLbHrtJBN1bgUAqf8cUiGcVvcwY6gS9HI2gSFNGEqdSuijqOsqWmRTVHsgz7
 rnaFpXikAVND16q3y5UducqkjWZJSRT2grCtuPkPZO5MKOhb/ZPInTiDBVx/6qo1qecC
 wV3GN11rQklqWnHAkONKnGFL4mr/8SOEgSzblw9DH+v0qddd7u/5zSs+XUbYrVuKrO/f
 bTOSvtXqc99pd7wXo3G+gQyhSn5FGN2hN+PGiCs6B/pgCpoxfkD1LSD11xiIEWQHIlGh
 XQdA==
X-Gm-Message-State: AOAM531X0E8vSdZjPdQydOtR9lhacOsQc4uEFvmR3WLE6zIUmMISQWij
 bLsK4v8yqE+pBmFfVYGdpFsPwvl0qtZgQw==
X-Google-Smtp-Source: ABdhPJyoqpRoUAA3lhHKCv7Kbsc+t1sHDAcpx8uzZ1/n4TC9taB6MhmR2rmfKYUzuaHCUmyz5f38og==
X-Received: by 2002:a1c:2285:: with SMTP id i127mr2892743wmi.64.1629887742017; 
 Wed, 25 Aug 2021 03:35:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/44] target/arm: Fix calculation of LTP mask when LR is 0
Date: Wed, 25 Aug 2021 11:34:58 +0100
Message-Id: <20210825103534.6936-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In mve_element_mask(), we calculate a mask for tail predication which
should have a number of 1 bits based on the value of LR.  However,
our MAKE_64BIT_MASK() macro has undefined behaviour when passed a
zero length.  Special case this to give the all-zeroes mask we
require.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 1a4b2ef8075..bc67b86e700 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -64,7 +64,8 @@ static uint16_t mve_element_mask(CPUARMState *env)
          */
         int masklen = env->regs[14] << env->v7m.ltpsize;
         assert(masklen <= 16);
-        mask &= MAKE_64BIT_MASK(0, masklen);
+        uint16_t ltpmask = masklen ? MAKE_64BIT_MASK(0, masklen) : 0;
+        mask &= ltpmask;
     }
 
     if ((env->condexec_bits & 0xf) == 0) {
-- 
2.20.1


