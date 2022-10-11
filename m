Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46115FAB69
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:48:36 +0200 (CEST)
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi6Fv-0005K5-Pp
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5oZ-0003Dd-Sc
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:20:24 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5oM-0003Lk-BN
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:20:19 -0400
Received: by mail-pj1-x1036.google.com with SMTP id h12so5625002pjk.0
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+7jRVgDoKz3lej+ZaMULQKKS6huX/14P3OCNEftnZ1M=;
 b=j4bYr2XKuchTNZKteEefZpZt0QG45dJnXRNntSMEGb7Q5dbpJAOqHoUvnNJw4LkK7N
 VNCYqqQYVPYk95epRH9U4/Ixa2cc4yGg6xJMHGlvXzRIcNWlaVoXeydcMutHYyt4cmnO
 CNGVBqVjPcmoavwgFjG8FIfaa2uZVYu9FfFMsM9VnC+TOq9zaCYz0PNC340Kuu2LctOU
 UCEfHXcJgkqPysLi5lfHbyL17y2G2aIKffpIfLaA4ShbROtthk0vxiUQBl7W21vzqIW3
 kEEiwkVd1cs3mHptz3oYsDSTa6w8AvoqgGs3FEiWDojv6bUPKadSDDtZpDEOPp9BrGXl
 sLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+7jRVgDoKz3lej+ZaMULQKKS6huX/14P3OCNEftnZ1M=;
 b=MwP64wZgT2V/VEJMFOJSANVQijlLnxhsPU1RBYCnbk/70YqkUeCniXZBXzinkm2SNy
 +/d0iQFMdfWVOrG1HfoYBFgMiFD86rE/vMGBxEwRE1ZmYOj8uJ29D/eABl7vVWCIBZHU
 7wWdMpxqQXlC81MaE83v/aAjBwN85fjosEMCLhGJKX9f2qxOYVNIh6gLl34/wuLzTW/S
 2V8sKtdSUQ3rFeHpCyXgSa+659sqgE+XDxMgMOvQnEv2OdZt3TBYV1842zo6jp41KjVs
 DShpw8bWdHnQyubHZ3S9noFsplL7E6RgMv464gaZJiIq8cYzSiFYJpOteG4AwC79ssbU
 30DA==
X-Gm-Message-State: ACrzQf0nxScF9qHt4cI0Q+sFGO18zRqzROsz4L7GmbYL/bbycEDOsgdh
 fyQaD+XPDWt09AEUamahQjZBL3MkXFUtQw==
X-Google-Smtp-Source: AMsMyM6kUR2aM6FOC/fY2FAAm1euKjJ/06Tpz0PyfKmJ98EZLAGUMnPs7ZiWfiFlRMQr94avOo9KHQ==
X-Received: by 2002:a17:902:ab1d:b0:180:4030:757d with SMTP id
 ik29-20020a170902ab1d00b001804030757dmr18384506plb.155.1665458402989; 
 Mon, 10 Oct 2022 20:20:02 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:20:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Marc Zyngier <maz@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 24/24] target/arm: Use the max page size in a 2-stage ptw
Date: Mon, 10 Oct 2022 20:19:11 -0700
Message-Id: <20221011031911.2408754-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 0dbbb7d4d4..b8934765ec 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2584,7 +2584,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
                                    ARMMMUFaultInfo *fi)
 {
     hwaddr ipa;
-    int s1_prot;
+    int s1_prot, s1_lgpgsz;
     bool is_secure = ptw->in_secure;
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
@@ -2620,6 +2620,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
      * Save the stage1 results so that we may merge prot and cacheattrs later.
      */
     s1_prot = result->f.prot;
+    s1_lgpgsz = result->f.lg_page_size;
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
@@ -2634,6 +2635,14 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
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


