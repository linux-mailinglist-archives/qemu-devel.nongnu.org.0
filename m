Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123EA56462B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:11:31 +0200 (CEST)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vda-0006gS-5P
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzv-00022N-RY
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:31 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzu-0006rl-5H
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:31 -0400
Received: by mail-pl1-x631.google.com with SMTP id n10so6071936plp.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uovclcElFK8esJs/B2OhNg1BfUsYuubY5g8vgEBIfkE=;
 b=XSBPt1Jka/gIDvOXy2FJF0zJxAZPdwmtgxCfhY3R2U8YecrmDk47APM7sGSC4QTN5C
 +LdGciLvx79Rh96WBy4V43qaPpyCpqxLQnqKSFUv3M7OekV6+eIuIGblAXP8uo49Xgc1
 7ZBL0QxukiVm5OQQlZKaGa+Qa0JTTRWB+Qy0S+HTdpObAvp+ijwpXbA5IGRLsCk0Merc
 PiepVRBfhNJhno+x60ga1brQMj26Ym9Ddx11D2BNt5MniAQleBCMWOJhydZxVW/nImw7
 zPlvHywMld8ipxqBpDKc/gdZ/tyVPnCZvZ/BBKiU7/528SCj+/0VROBS3Ds+7TxCNmvx
 QC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uovclcElFK8esJs/B2OhNg1BfUsYuubY5g8vgEBIfkE=;
 b=nJAc9ABLysluafHn9uzTKP58rqFSs8lVtlN7yhV7+aRIUe640Dfjv4/B2PTbUFtY3b
 zYpY7Hv/m3gtwADONaHtCJml4MTUlVMEAFefKTqCgJBNPGrcESOJW/A0wss2YogdWlCZ
 d2bXNJOF4h+aw/ZGGQ48G5/vGZNUVj5SI8TiND/TXP3lZXrnsjPt8WZjZOxeA+cRobPP
 vPjv7G/zduwYZTQuXMLDjsHAn4mdRzlT1m7xJbmriUmCmISUWOGn9KCMITisrDkH3D3b
 xcEkA+a1a4JPMSEdnuwy1PLVlznF4hiQZ20baB6yRrwTLkDdru8g9+gAsa2EVkT6dt1P
 kUzg==
X-Gm-Message-State: AJIora9sm0OHPpxx5uiuHZeDsX+/GVSDuUjBkHgbLvTrMGdGnN81BYI4
 QTj4OIxFfArLfewejxTzCKqnhj0q8bFb7xYy
X-Google-Smtp-Source: AGRyM1smhmJxlD+WoYkRkX0MTdK71o/vSdvh4gtjOsiGAFUkfGwTb+ArSf58rIAoYlM/sIX+2lnYaQ==
X-Received: by 2002:a17:90b:4c41:b0:1ed:24b2:8454 with SMTP id
 np1-20020a17090b4c4100b001ed24b28454mr27757253pjb.223.1656837027901; 
 Sun, 03 Jul 2022 01:30:27 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 60/62] target/arm: Don't shift attrs in get_phys_addr_lpae
Date: Sun,  3 Jul 2022 13:54:17 +0530
Message-Id: <20220703082419.770989-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Leave the upper and lower attributes in the place they originate
from in the descriptor.  Shifting them around is confusing, since
one cannot read the bit numbers out of the manual.  Also, new
attributes have been added which would alter the shifts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 678ad2ac0c..e7569ece33 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1018,7 +1018,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     hwaddr descaddr, indexmask, indexmask_grainsize;
     uint32_t tableattrs;
     target_ulong page_size;
-    uint32_t attrs;
+    uint64_t attrs;
     int32_t stride;
     int addrsize, inputsize, outputsize;
     TCR *tcr = regime_tcr(env, mmu_idx);
@@ -1288,49 +1288,48 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
         result->prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
-        ns = extract32(attrs, 3, 1);
-        xn = extract32(attrs, 12, 1);
-        pxn = extract32(attrs, 11, 1);
+        ns = extract32(attrs, 5, 1);
+        xn = extract64(attrs, 54, 1);
+        pxn = extract64(attrs, 53, 1);
         result->prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
@@ -1354,10 +1353,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
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
@@ -1372,7 +1371,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     if (param.ds) {
         result->cacheattrs.shareability = param.sh;
     } else {
-        result->cacheattrs.shareability = extract32(attrs, 6, 2);
+        result->cacheattrs.shareability = extract32(attrs, 8, 2);
     }
 
     result->phys = descaddr;
-- 
2.34.1


