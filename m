Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D49D609A98
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:35:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omptD-0007yA-On; Mon, 24 Oct 2022 01:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ompsC-0006sm-M8
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:43 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ompsA-0002TP-Oz
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:40 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so2460695pjc.3
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WUDIrJHIS5cE7phXWe1119p8UIq5Q+ilAQsTbi3H87M=;
 b=LjrA9yHAlxUnyXwYnoxeQ8nP4QKz/mgB2tnqmJvX2hb8R5jf4SJINLW68wjvinBTnE
 qONjMvjC6c9aLYJ+DLmA0oxom+tdU18KI9m2XCD0H1U10+k3BM36L6GpTKvHH41aenUl
 tu1r1jzthaG/Wy15koCjKUSb20wCKuS7Z2KVzlNvmsHf+yYTpowNkCUpXS2ttxqpuNi2
 ZUmb3bAEPL0LXReGCT+TVm3Og7kl/nzbZGpbBwp57qkeaqeTSJHoqOpNpJC7gCzuEcWH
 AwbjEl1FclqurMTIb+Epu+eQGGiGJiObJcW68aSqx3mIvl5XUHeIG9bgUO4H0fm9wljW
 B+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WUDIrJHIS5cE7phXWe1119p8UIq5Q+ilAQsTbi3H87M=;
 b=XRLIGhjmvFem+uExbVrZF5g08x5rdqpJ7i6PuG15gGuUzX6BoFc4ShR1/3DQRU46Kq
 pQ2PYU6NlJqhhYCTQWhkFESuMJlo9xbZBqpPSSjrn3VQuAq0LybUOldLlnZ8ESPoWWFI
 /+M+tpOd1/IQ1q/8w35HL21spDK/N6jmdi9Ce2PtKbDgSUbgHWIkNWvJX5CSTZqGRKFE
 fFcGWVR1SG7XOMRKqakacBNuVBR8jJzqGlFBSKT+/vj3ofBInKvJhFxwjLBEyhmXflwk
 JocNlHkF4v577RKr2wtCyex6XZf5j3mMHVqMd76etX+l8XBn7+Z2Cn3HGi8RZCKMSy56
 gWhA==
X-Gm-Message-State: ACrzQf36ZLHcBO7khPvFssGtXAoOPhd/L1vZXfhM66ii3LT7dMg0STER
 etQPS2usUuZKYbujywexrqZySiIaU4pJuhlT
X-Google-Smtp-Source: AMsMyM5bZT0p/adYBx2OrckrFiUJhQswuPtaF9KM0HQnzxffIJSAXXEg4WHoocjISamSatj/RgoJzA==
X-Received: by 2002:a17:902:7e0e:b0:17f:8edd:5f00 with SMTP id
 b14-20020a1709027e0e00b0017f8edd5f00mr32140107plm.96.1666588777246; 
 Sun, 23 Oct 2022 22:19:37 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Marc Zyngier <maz@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 14/14] target/arm: Use the max page size in a 2-stage ptw
Date: Mon, 24 Oct 2022 15:18:51 +1000
Message-Id: <20221024051851.3074715-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

We had only been reporting the stage2 page size.  This causes
problems if stage1 is using a larger page size (16k, 2M, etc),
but stage2 is using a smaller page size, because cputlb does
not set large_page_{addr,mask} properly.

Fix by using the max of the two page sizes.

Reported-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d87757a700..b80a5c68ae 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2589,7 +2589,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
                                    ARMMMUFaultInfo *fi)
 {
     hwaddr ipa;
-    int s1_prot;
+    int s1_prot, s1_lgpgsz;
     bool is_secure = ptw->in_secure;
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
@@ -2625,6 +2625,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
      * Save the stage1 results so that we may merge prot and cacheattrs later.
      */
     s1_prot = result->f.prot;
+    s1_lgpgsz = result->f.lg_page_size;
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
@@ -2639,6 +2640,14 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
         return ret;
     }
 
+    /*
+     * Use the maximum of the S1 & S2 page size, so that invalidation
+     * of pages > TARGET_PAGE_SIZE works correctly.
+     */
+    if (result->f.lg_page_size < s1_lgpgsz) {
+        result->f.lg_page_size = s1_lgpgsz;
+    }
+
     /* Combine the S1 and S2 cache attributes. */
     hcr = arm_hcr_el2_eff_secstate(env, is_secure);
     if (hcr & HCR_DC) {
-- 
2.34.1


