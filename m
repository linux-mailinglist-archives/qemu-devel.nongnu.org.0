Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41AA60D1FF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:53:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMyo-0006Ok-DF; Tue, 25 Oct 2022 12:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyf-0006CV-Vc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:34 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyN-0001ct-LW
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:23 -0400
Received: by mail-wm1-x32c.google.com with SMTP id y10so8521591wma.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LwhUM2f4rGKe/Yiu4bKIyuH2Jgq3WPwiKOal14pJUNg=;
 b=hjp+Lm+JYYB0Sb5ah1xzULH0SVE0wBm26sDGuchgWyIea8JuX6r6qYEOjKwIXmJnfY
 fIC4Xtmxii0slvA7GFgFQuch9S0j7ix3lPn0NimdYwg+RNic/DdfHS/tGq5UlT1EnIC1
 ihqMujfe+2M1oOtP/LXCQEB6XyVnqAvcRJMruKAayWPmLTObzJEOeIk0c01ed+dEbxq1
 qpas2VoyI3XKd76GhPl/R7I1BZ04MCUG3q036On6B6/Y47Kt0XPfwLNHB73eseAAOQID
 mNzmPC86Pq+4twuCsWAv1njl1y95YinhcwgiXD5chzVmz3FbTnaPv4iQc9uKJ2Vm2Gg4
 z9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LwhUM2f4rGKe/Yiu4bKIyuH2Jgq3WPwiKOal14pJUNg=;
 b=z5/qGMWMKE8x5hLSXezbnOE7GQdHUkPaeqTLyg4nU7x0sc3LCRc/piDx1sMl1rQ2yE
 2fJ+yxSwlWCavaYRfDFSaKJdSd/DxiJ/e4CIWSXX5Rh2o8nEXvzuvQzRLryI9E6M/vzX
 7wPRoar7oFWJnb3oQzM3j8cBWSRKW64nfgJozR+1Ek3sXG1dDWz+VnkkCt4TAz3Wakid
 v6MFYyYgyLbf9lDmz6W67vUVFFmKEpuFUfW8Tfp6RF74qzopMCER0uw2pAreu/fIRFpm
 qLugc7h0d9QsS4JiypMRa38a26NGx1WxjFJnVyJCIibgNi0sWQlWigDMcq/wVBTclkFG
 x1Uw==
X-Gm-Message-State: ACrzQf3CDZe0/aaNSEdGUw2uX46eMldif0RZ7A8vqa1rPfViRb8LCUnj
 860n9vSF1jSV/9+allvMpp+EI7/PI4VZaA==
X-Google-Smtp-Source: AMsMyM5F2JybaR5cnyunT1m0n9LB8c4BI96ATBH+vWnaTTLRoxrQBU2rczS+tSwAVVsYHb4w3fmTDA==
X-Received: by 2002:a05:600c:3584:b0:3c6:f234:852b with SMTP id
 p4-20020a05600c358400b003c6f234852bmr34013872wmq.10.1666716014331; 
 Tue, 25 Oct 2022 09:40:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/30] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Date: Tue, 25 Oct 2022 17:39:38 +0100
Message-Id: <20221025163952.4131046-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Both GP and DBM are in the upper attribute block.
Extend the computation of attrs to include them,
then simplify the setting of guarded.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20221024051851.3074715-11-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 691110f70c0..79a0ef45c79 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1058,7 +1058,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
-    bool guarded = false;
     uint64_t descriptor;
     bool nstable;
 
@@ -1324,7 +1323,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr &= ~(hwaddr)(page_size - 1);
     descaddr |= (address & (page_size - 1));
     /* Extract attributes from the descriptor */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
 
     if (regime_is_stage2(mmu_idx)) {
         /* Stage 2 table descriptors do not include any attribute fields */
@@ -1332,7 +1331,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     }
     /* Merge in attributes from table descriptors */
     attrs |= nstable << 5; /* NS */
-    guarded = extract64(descriptor, 50, 1);  /* GP */
     if (param.hpd) {
         /* HPD disables all the table attributes except NSTable.  */
         goto skip_attrs;
@@ -1385,7 +1383,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
     if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        result->f.guarded = guarded;
+        result->f.guarded = extract64(attrs, 50, 1); /* GP */
     }
 
     if (regime_is_stage2(mmu_idx)) {
-- 
2.25.1


