Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3225FA0B7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:57:06 +0200 (CEST)
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuDJ-0003wD-Rl
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl6-0006Ra-U0
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:57 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl5-0005Xa-F2
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:56 -0400
Received: by mail-wr1-x431.google.com with SMTP id a3so17363477wrt.0
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LdE7Yti6FxQSUdCITEyW9uuJhLKh/sdf2KHare74vR0=;
 b=aFQEuFHisonfMCGI5FQjrVwCx5akThnTiL3cOTUP6MDy+JwuaY9vxnbq7nYuljtg2g
 PgR1iQNV/lbwaVqbcV2oPzwgbgWVullEjVE16qqq1H/d+RcnwF+FdP65Hmnugyo6aBgV
 3entSGfjdvDpVY4Fi1zEgMabgppWAfoTelY2TvW+oL+6tscFlTzN4awbqOWZDq3dLc8i
 rj8VwKBbzsNmaQKmY/Ms64zL5mb4/32QjTwCUhxPHtF1P4Bw7rmkcJH5V/6yyCx7BW9y
 L0DiREGwBf3TNPmJiFEvI/EMqtLntnrs4rslqsBz6JCSEGofcyV7P5Q+giDWikP8r0Td
 aiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LdE7Yti6FxQSUdCITEyW9uuJhLKh/sdf2KHare74vR0=;
 b=yin5HEQw0gEDvGxkXAcvLig+xDo2VQ7ajEHd0HFjbedbypi0/xOVyZM4gGZMiRYhEq
 askGKFOAMc0ovh41hbPgAVnIm9r8XJnd6WKGks3Q4sl28/58q7D6peqyIJfuzCkaAjsr
 wTg6dcLfddymi2y5Xa0ijm9ZFaVD+GsHYE6V71o0qcwwQHmHiGqFS0gA/zukIUOTix4D
 eAHcC3f7FWZvjgx2WivKAIZPgWQtsvVMvBm/mXoI5WXnrPk5f8OVGjILOceooYdF/0dF
 QSwBz+BLmAokxmaJ/2A00vyxxdsB9RQ7oVV8FmecMNoJDxTOhRAXSZsEw7sUfgOM/BVV
 /8Lg==
X-Gm-Message-State: ACrzQf3cXkP1cE9/EOqtsvMRJto1VelOuzCTmo2rhPdRGt16DFw5FRIf
 Qo8ZEotJ3QIND13EJeEsy5lKJuyYwQb0LA==
X-Google-Smtp-Source: AMsMyM4zFsUvxN6nAPuwWYL3K/zmKhr9UOZ0/t0ouZ/7WVlIHr46D2+Z3ja/vCZ48buZHl9/3FX/rg==
X-Received: by 2002:a05:6000:186e:b0:22e:5dd3:e32a with SMTP id
 d14-20020a056000186e00b0022e5dd3e32amr11749231wri.167.1665412074389; 
 Mon, 10 Oct 2022 07:27:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/28] target/arm: Fix ATS12NSO* from S PL1
Date: Mon, 10 Oct 2022 15:27:23 +0100
Message-Id: <20221010142730.502083-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use arm_hcr_el2_eff_secstate instead of arm_hcr_el2_eff, so
that we use is_secure instead of the current security state.
These AT* operations have been broken since arm_hcr_el2_eff
gained a check for "el2 enabled" for Secure EL2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221001162318.153420-18-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b4fd4d3fac1..a589cec8e36 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -146,7 +146,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
         }
     }
 
-    hcr_el2 = arm_hcr_el2_eff(env);
+    hcr_el2 = arm_hcr_el2_eff_secstate(env, is_secure);
 
     switch (mmu_idx) {
     case ARMMMUIdx_Stage2:
@@ -230,7 +230,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             return ~0;
         }
 
-        hcr = arm_hcr_el2_eff(env);
+        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
         if ((hcr & HCR_PTW) && ptw_attrs_are_device(hcr, s2.cacheattrs)) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
@@ -2341,7 +2341,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             }
 
             /* Combine the S1 and S2 cache attributes. */
-            hcr = arm_hcr_el2_eff(env);
+            hcr = arm_hcr_el2_eff_secstate(env, is_secure);
             if (hcr & HCR_DC) {
                 /*
                  * HCR.DC forces the first stage attributes to
@@ -2473,7 +2473,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
         result->page_size = TARGET_PAGE_SIZE;
 
         /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
-        hcr = arm_hcr_el2_eff(env);
+        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
         result->cacheattrs.shareability = 0;
         result->cacheattrs.is_s2_format = false;
         if (hcr & HCR_DC) {
-- 
2.25.1


