Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EEA564670
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:34:21 +0200 (CEST)
Received: from localhost ([::1]:54682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vzg-0003K7-9K
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzl-0001jp-Og
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:23 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzk-0006q6-83
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:21 -0400
Received: by mail-pl1-x62b.google.com with SMTP id m2so6039017plx.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=liHUuzibAUDh7PNtlnTFX/CxPtgHbz6rTpMJQG/D23M=;
 b=FefgVOYLqXZTUaTmrcUc52wm19fTpHiPmdmOmtkb5XLFts1M71Mx6iD/3/nYnjrTjg
 KFT+Ws5DEk39v4yrGfz+kvXDcsrnDRKGqBwZCXA0FfW7eYrfVmJIpXG88X8ctf4fyyWn
 IoVxGBs8IeQR+7SOFW00yXtABMoN6YAXVHu7BGGlXZkkV5jsytYTyD0Aunr5nTMj7fVh
 6TPh22TVDE2iQv0AkiKP5bXKzV2i5OSfX1t9jm+eAre0NcWTL93iIhcUDxnipbv8fsiu
 /c3EWLNiiEAHLGg3GiAHOBVSJmsa7jzM9ASw6EXJav0MRKeLdHSGLqJVDlf4URdTSz6T
 o/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=liHUuzibAUDh7PNtlnTFX/CxPtgHbz6rTpMJQG/D23M=;
 b=tt4835p43F2LaNMoYKPm20fXnByP5rEmU7rLcyblZVjnIpdjBeNAnFR7a944MNxw1F
 qajc60pz/YMVieINCQKcx2OJn6ABOUAXQVUMnyg/gP0hpYkKBCgi5tYxwe3605O56RPT
 XemlrCZNtV0Zuygcc9GwCtdVsn0t0q1ym6rNtKGHuECCt07cPSsK9dC3iLq2OapLaHc0
 VIBCXZsAHgiij5m0/k1rcZy3CbnwBmmPC9IwQJycDb10VwsuWXYK5r/EPcGRpf68uUVY
 U6XMiQSF6HlcYvIyadUdbHjsNrNTGuIykvOa7meLP21TFwx2LqN8QsZN3lvp7pRK5h8U
 +IKw==
X-Gm-Message-State: AJIora94HeZ6tUUA/vtdGuiRsELEmcf/AoqIdZMz40v5Is3iwHUjtL40
 iPCIY5iouPw/LXGHCOJjpSR7KwZvkHMTF0/B
X-Google-Smtp-Source: AGRyM1sgKOeX5/YWp+W5z2h7LHkRDaNs895EbAnuNCQta8VGiATZIe5vmOdAiV26ffEG3/zNwbL6oQ==
X-Received: by 2002:a17:90b:1651:b0:1ec:f358:3dbd with SMTP id
 il17-20020a17090b165100b001ecf3583dbdmr29206163pjb.157.1656837019037; 
 Sun, 03 Jul 2022 01:30:19 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 57/62] target/arm: Add ARMFault_UnsuppAtomicUpdate
Date: Sun,  3 Jul 2022 13:54:14 +0530
Message-Id: <20220703082419.770989-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

This fault type is to be used with FEAT_HAFDBS when
the guest enables hw updates, but places the tables
in memory where atomic updates are unsupported.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f2a421972e..b1a5219aa3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -344,6 +344,7 @@ typedef enum ARMFaultType {
     ARMFault_AsyncExternal,
     ARMFault_Debug,
     ARMFault_TLBConflict,
+    ARMFault_UnsuppAtomicUpdate,
     ARMFault_Lockdown,
     ARMFault_Exclusive,
     ARMFault_ICacheMaint,
@@ -530,6 +531,9 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_TLBConflict:
         fsc = 0x30;
         break;
+    case ARMFault_UnsuppAtomicUpdate:
+        fsc = 0x31;
+        break;
     case ARMFault_Lockdown:
         fsc = 0x34;
         break;
-- 
2.34.1


