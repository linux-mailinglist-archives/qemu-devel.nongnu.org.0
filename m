Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1186099C7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:26:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omptF-00087J-RL; Mon, 24 Oct 2022 01:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omps8-0006rK-Ef
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:39 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprw-0002Os-Dd
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:36 -0400
Received: by mail-pl1-x62d.google.com with SMTP id d24so7589257pls.4
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5O6PpkAZ96UkPrcZ1NBYigHKXmNVYdvvRThaoFMyO3o=;
 b=a3ka5AeCtPXpyHHO1XJP+Xs35zsvC764YXj1oqUoIXmeH1fF1nxfeK7hkK/0f072Em
 M0wa1jqhgt53gM3xFa7qn/zQ0At5c5cDspftFNSl39Ml2Ew+s4RRkpDZ+HOQdBTc47Zt
 WxgEOWDmhISmYECkOoaEOUX6MhvRuePLan27qs8ICcnBc0yaX5SqwdqytGJ9vdjAu1IV
 LaJvme5V2MfVIVqBxtLeeFWWxlsfqIUljirVK2kwQghbDHgHXXTOHPOAVy0qiWqirY1d
 cvQiC1u06/onNssyXRQoa7i+rnzIZFGjXN/VKTFKlAVOMiRPr29OY0P9iCJA8qYleK6z
 6fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5O6PpkAZ96UkPrcZ1NBYigHKXmNVYdvvRThaoFMyO3o=;
 b=njwPBOATFCbbkpyikR76AqcYgv/YEP33mHcQECHFWUWlwbrqFWVvAMKq0cuKSLLgLw
 Viqr88LehZbH/NXfb3GoHS4ACJI4fYzLbg4qle1JppEBfIyKh8XGaQ6hOrq3INwgA0io
 mq8oX0INA0WcAM2zSjWJP2hGB4D2ny8eqoRyX0oPiuqGbMaRUDe63s7Abz4xVLstZuSy
 L/aYFkFInqf46dlb26fn57Iq3ssl0ZLNta1EGnAowA4QyfBl7Mx0gj0EzqYL91IpCHT6
 pNtNdKU4nZFmAEJPY5oYa/PT5ca0AzZfajEA8ClAGxWX3W5G8QVFlHiVw4fNbTtAHduB
 b80w==
X-Gm-Message-State: ACrzQf2pW+qmzeCNN2GfIuqtVCHzTa0xr90oHjDINuN+dnr98Iilonkv
 N7aYtE3pPEOTe1hovx7lLDd+Prtrq/pBCY2R
X-Google-Smtp-Source: AMsMyM61isjymFdqBEUtPExs1U1AbZLeU2dbdi/KE+u6ME7+aURak0MwbzZyN//E2abcU5ifx6Lc2Q==
X-Received: by 2002:a17:903:22cb:b0:186:a8ae:d0ff with SMTP id
 y11-20020a17090322cb00b00186a8aed0ffmr3610864plg.71.1666588763061; 
 Sun, 23 Oct 2022 22:19:23 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 09/14] target/arm: Don't shift attrs in get_phys_addr_lpae
Date: Mon, 24 Oct 2022 15:18:46 +1000
Message-Id: <20221024051851.3074715-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Leave the upper and lower attributes in the place they originate
from in the descriptor.  Shifting them around is confusing, since
one cannot read the bit numbers out of the manual.  Also, new
attributes have been added which would alter the shifts.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index cd16b42c96..cc7751218c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1069,7 +1069,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     hwaddr descaddr, indexmask, indexmask_grainsize;
     uint32_t tableattrs;
     target_ulong page_size;
-    uint32_t attrs;
+    uint64_t attrs;
     int32_t stride;
     int addrsize, inputsize, outputsize;
     uint64_t tcr = regime_tcr(env, mmu_idx);
@@ -1343,49 +1343,48 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr &= ~(hwaddr)(page_size - 1);
     descaddr |= (address & (page_size - 1));
     /* Extract attributes from the descriptor */
-    attrs = extract64(descriptor, 2, 10)
-        | (extract64(descriptor, 52, 12) << 10);
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));
 
     if (regime_is_stage2(mmu_idx)) {
         /* Stage 2 table descriptors do not include any attribute fields */
         goto skip_attrs;
     }
     /* Merge in attributes from table descriptors */
-    attrs |= nstable << 3; /* NS */
+    attrs |= nstable << 5; /* NS */
     guarded = extract64(descriptor, 50, 1);  /* GP */
     if (param.hpd) {
         /* HPD disables all the table attributes except NSTable.  */
         goto skip_attrs;
     }
-    attrs |= extract32(tableattrs, 0, 2) << 11;     /* XN, PXN */
+    attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
     /*
      * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
      * means "force PL1 access only", which means forcing AP[1] to 0.
      */
-    attrs &= ~(extract32(tableattrs, 2, 1) << 4);   /* !APT[0] => AP[1] */
-    attrs |= extract32(tableattrs, 3, 1) << 5;      /* APT[1] => AP[2] */
+    attrs &= ~(extract64(tableattrs, 2, 1) << 6);   /* !APT[0] => AP[1] */
+    attrs |= extract32(tableattrs, 3, 1) << 7;      /* APT[1] => AP[2] */
  skip_attrs:
 
     /*
      * Here descaddr is the final physical address, and attributes
      * are all in attrs.
      */
-    if ((attrs & (1 << 8)) == 0) {
+    if ((attrs & (1 << 10)) == 0) {
         /* Access flag */
         fi->type = ARMFault_AccessFlag;
         goto do_fault;
     }
 
-    ap = extract32(attrs, 4, 2);
+    ap = extract32(attrs, 6, 2);
 
     if (regime_is_stage2(mmu_idx)) {
         ns = mmu_idx == ARMMMUIdx_Stage2;
-        xn = extract32(attrs, 11, 2);
+        xn = extract64(attrs, 53, 2);
         result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
-        ns = extract32(attrs, 3, 1);
-        xn = extract32(attrs, 12, 1);
-        pxn = extract32(attrs, 11, 1);
+        ns = extract32(attrs, 5, 1);
+        xn = extract64(attrs, 54, 1);
+        pxn = extract64(attrs, 53, 1);
         result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
@@ -1410,10 +1409,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     if (regime_is_stage2(mmu_idx)) {
         result->cacheattrs.is_s2_format = true;
-        result->cacheattrs.attrs = extract32(attrs, 0, 4);
+        result->cacheattrs.attrs = extract32(attrs, 2, 4);
     } else {
         /* Index into MAIR registers for cache attributes */
-        uint8_t attrindx = extract32(attrs, 0, 3);
+        uint8_t attrindx = extract32(attrs, 2, 3);
         uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
         assert(attrindx <= 7);
         result->cacheattrs.is_s2_format = false;
@@ -1428,7 +1427,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     if (param.ds) {
         result->cacheattrs.shareability = param.sh;
     } else {
-        result->cacheattrs.shareability = extract32(attrs, 6, 2);
+        result->cacheattrs.shareability = extract32(attrs, 8, 2);
     }
 
     result->f.phys_addr = descaddr;
-- 
2.34.1


