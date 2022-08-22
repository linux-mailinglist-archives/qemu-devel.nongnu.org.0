Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509EC59C4F6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:26:21 +0200 (CEST)
Received: from localhost ([::1]:35822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBBs-0006zr-8h
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9PA-0004to-F9
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:59 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ot-0001i0-Af
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:55 -0400
Received: by mail-pl1-x62b.google.com with SMTP id g8so6354456plq.11
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=AjfIQKU/myD5+QYQH5XxFY0Vc0OPmbgLDaWoxfP3y8A=;
 b=BSfrUysRXDtXKaltD3RZK88blSKhEuGYVURM07qbgl8axOLf6mZyPqqlXVYsbLvjHQ
 sdE6snePuY1mRbYhrERigGxMjJuoD2uM+cDa4ePnl3IWxpwFLigjD7P5nfXL92cRoIGZ
 etMRbSBf13Pw6Ox4jmqC7vKtWOO7sPrE/PxLpbrQ5/yXDuun8xajjq6PZ1hztqey/gLX
 HIZTeDaGtwthhsPwSxswJwnA+dNnhoYWN3sBPM/HvxKQYEG1e9oGhqjCc5KbC4JgreRQ
 1nrwCpw5aZw37XkLUKN99ZSaKwiDAllpOD92nSGaqjCF1ziySn9s6BD/9y6MbvQwH40u
 zLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AjfIQKU/myD5+QYQH5XxFY0Vc0OPmbgLDaWoxfP3y8A=;
 b=3G1KOFAL2etpKG93XpGFA1vdAnhwmK78btPlo5sMblwgo3ERlTOYIsLBQMNkjrwAxb
 c4N9lD1Jl3THHd4rqQ8qCN0zaJ00zxekmELVnypEGlYooVfQ6rbzvTbbBveu63wpjFps
 w03Bw1lum0i9wgDFTJbtGJP7FCQhythQXu9dQ8VXGNplJ//2LeZsFySpDWfEXK4y9xKp
 +30Qw198EkPj4VF3wOSE2ehieKI7NwMa3fsX6QhE3srJSW8YVn9FJt4utIEolTniMXOL
 OApR2gMCo/RTkGGtHNWypvQkcBzc0XRLFpU+dgrldsEQE9oqEbZKWPiGXEXpW3HWhlD/
 Nn1w==
X-Gm-Message-State: ACgBeo0YwMZL9BB4FbrG9QhLdnu3zgeV/ZljgvYSIwJsvAr5O/KpY8c3
 BpW7lHf9+BHv7aY3ddYyAOKLcc6XLuIu8A==
X-Google-Smtp-Source: AA6agR5pc65/g/jWu8i1wHryifRONHCmmAd7+u7FgUwl4ix6plRJ37BWWak1EEWwlT8PYg1ObUQh2w==
X-Received: by 2002:a17:90b:3c04:b0:1fb:2220:ad7f with SMTP id
 pb4-20020a17090b3c0400b001fb2220ad7fmr7390535pjb.182.1661182297673; 
 Mon, 22 Aug 2022 08:31:37 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 64/66] target/arm: Don't shift attrs in get_phys_addr_lpae
Date: Mon, 22 Aug 2022 08:27:39 -0700
Message-Id: <20220822152741.1617527-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Leave the upper and lower attributes in the place they originate
from in the descriptor.  Shifting them around is confusing, since
one cannot read the bit numbers out of the manual.  Also, new
attributes have been added which would alter the shifts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5f3841b466..068ff2025a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1021,7 +1021,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     hwaddr descaddr, indexmask, indexmask_grainsize;
     uint32_t tableattrs;
     target_ulong page_size;
-    uint32_t attrs;
+    uint64_t attrs;
     int32_t stride;
     int addrsize, inputsize, outputsize;
     uint64_t tcr = regime_tcr(env, mmu_idx);
@@ -1291,49 +1291,48 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     descaddr &= ~(page_size - 1);
     descaddr |= (address & (page_size - 1));
     /* Extract attributes from the descriptor */
-    attrs = extract64(descriptor, 2, 10)
-        | (extract64(descriptor, 52, 12) << 10);
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
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
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         ns = mmu_idx == ARMMMUIdx_Stage2;
-        xn = extract32(attrs, 11, 2);
+        xn = extract64(attrs, 54, 2);
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
 
@@ -1358,10 +1357,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
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
@@ -1376,7 +1375,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     if (param.ds) {
         result->cacheattrs.shareability = param.sh;
     } else {
-        result->cacheattrs.shareability = extract32(attrs, 6, 2);
+        result->cacheattrs.shareability = extract32(attrs, 8, 2);
     }
 
     result->f.phys_addr = descaddr;
-- 
2.34.1


