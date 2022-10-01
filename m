Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D069D5F1E28
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 19:08:23 +0200 (CEST)
Received: from localhost ([::1]:45192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefyQ-0006iZ-VO
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 13:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefLW-0008F9-5U
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:28:10 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:44972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefLU-00074s-I9
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:28:09 -0400
Received: by mail-qt1-x82a.google.com with SMTP id f26so4337870qto.11
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=iKmDVfGqOt9FVdwkjo2E3YIFL8ZFEk46sXJgTciBX1Q=;
 b=WeqX6DrD6GjetwekiLJvwL2oQP0X/CVIfAeIX/AnA4utc/2GL/R0RCSwNliLrrcvhv
 hCByEvsiGkFAHaNu5IDG1nfB5l55FH9AMan7bhHkh6Mg88lTvao2C2fHq9ONAgQ7wKRr
 VleA79+9N+DWDXtLAV1GkpwKFPmGbiWKVbyLQpSh/y0eLG5DiRu36JRvDcbmvqXOFR3i
 NXYfiekrT/0zYEvpVvMTIuD+t457LHe/qtLzDakmBlJToC6DjHHnGG1vwAnRh2/R8ksH
 eRXY1uHO/kPIt+OAaOAgfMQNWg+EbT+QwfR5kdCT46DSU6mmiirSf9JvwYnyhO0bDwwS
 vFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iKmDVfGqOt9FVdwkjo2E3YIFL8ZFEk46sXJgTciBX1Q=;
 b=ve2g1JxUe2/UPwKTKp91Y4bCk+M3vN5wrZ14tfNJUwu+SXSTcegQ2w4txr++Uev6Ji
 dl9qu2MoxVaGO7rf6OfMFuKnju70z5FwJCLBU/runkjlTQYyjGqu9H4d552b7aXo/9F+
 EsYHwbVCO5UGq/RQpYWkSSfU/6YmYXvszQvsTGvU4fjywhoyPeSppgp3gMhVy7Vi762R
 M+04tDTI3Va6jgRFbzyGKZ8L6ACRGbYUv8Z37JIQUM7a/9gPF59zmzWQspbpAlI5qncU
 A6DGlUHRMLc5xxci+GLvOhQcf2aWb4/I2Wkg23rCJ65u4HuZVkdJShVAfcC0ww3ECoQe
 vcrA==
X-Gm-Message-State: ACrzQf3vGf7hzAgt9IlFjFgKpoYveVg/5xz0LbM+xs1HuSSIrG/m3J5Q
 wQ1LazF/CRTPbmFVxqN17IqWLbzEl253Og==
X-Google-Smtp-Source: AMsMyM7u4ymHwfOHhyhZQdJKNntM4ObsrFfNAktErztb3ICTxYWT/zMabg6McHFPvAaphxUfHibhew==
X-Received: by 2002:ac8:5909:0:b0:35b:ce5c:ed73 with SMTP id
 9-20020ac85909000000b0035bce5ced73mr10918232qty.635.1664641687726; 
 Sat, 01 Oct 2022 09:28:07 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05620a249300b006b5e296452csm6403305qkn.54.2022.10.01.09.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:28:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v3 42/42] target/arm: Use the max page size in a 2-stage ptw
Date: Sat,  1 Oct 2022 09:23:18 -0700
Message-Id: <20221001162318.153420-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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

We had only been reporting the stage2 page size.  This causes
problems if stage1 is using a larger page size (16k, 2M, etc),
but stage2 is using a smaller page size, because cputlb does
not set large_page_{addr,mask} properly.

Fix by using the max of the two page sizes.

Reported-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 14ab56d1b5..985a5703c3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2550,7 +2550,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
                                    ARMMMUFaultInfo *fi)
 {
     hwaddr ipa;
-    int s1_prot;
+    int s1_prot, s1_lgpgsz;
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
     ARMMMUIdx s2_mmu_idx, s2_ptw_idx;
@@ -2592,6 +2592,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
      * Save the stage1 results so that we may merge prot and cacheattrs later.
      */
     s1_prot = result->f.prot;
+    s1_lgpgsz = result->f.lg_page_size;
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
@@ -2607,6 +2608,14 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
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


