Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816B8606B68
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:44:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleGs-00081j-Cz
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:44:14 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleA0-0007on-Ja
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9s-0007Hi-Ae
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:37:00 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9o-00011s-So
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:59 -0400
Received: by mail-pg1-x52b.google.com with SMTP id bh13so872865pgb.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CAqlLEmc1/qSiJ628jszYxvmjlF1IdNnj+tj3JK4HDk=;
 b=hlK/7bu1Gx27WzqSDJHV3EHULhHiFyL3ecrfEfQK8QiddotXo1yWmDu9XKFRBdTeKb
 pJo0m9K2znfVgYScRO3HpTT3wF3BH1J/1n9Kr91IBpt67JVlqI6bg44SY4bOB13tMFbD
 FxDL7KMe3s7Lez/aDmZEEiZypqtVSsXC8bUOyTJ2twmgznQKQfd2AWWBJNmM4/h4lH0L
 kaztO+gpNCmVYd/mVsKIMjKtqPgPVy8knrgdER4LyqukLfoin0EjXAOehOuAiWtKvaKe
 zFBS41Mm+pRam7VqcE4kNS6zKKmI6TABldz0we+9uU4fWTlOf2W/ykm0Y1tdPWkkPlWI
 tGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CAqlLEmc1/qSiJ628jszYxvmjlF1IdNnj+tj3JK4HDk=;
 b=lfz6RTy79iGDV/FF+t76gaY60+lJ9322uAYTqyfsj6hDoZMdaUIInmB1zs8AOCZtyQ
 ZSuiGyatRhTxlp+cmEUO+2R1X07WiKbQtt59Bxju+cS9H/fQnZoesUaMD/WgdAZCcyQa
 8SQ9UDrUsrIECo7Cu7G6ysZWBLhIW9iqUaVn/8O6LBQFO4xoq3pVfrkRYmkJWsxlZdtl
 y2Zf7OvhuGljiZTOC2+W9nlMCzGi9zTiqPHkIW7re1WDDqhMzYGhMNyC56d2hqmNL1Yr
 YODi1M12tUlKL5UGtOXiWOvESsKO+Sg5p/6PMRYrtOvLxLCbnN4BZZSj2ftxSz+xlBVE
 85FA==
X-Gm-Message-State: ACrzQf1VJmrJKRAlZ8H4WtECnkaS4uga69DaFlc4StqnqAB8SopCCJLD
 NFQs5gcyZ6VYTzRz2+RwnsNLw/pujp1InO5v
X-Google-Smtp-Source: AMsMyM5MzA9+DocHKW9WBhlNakgFkvC2M2+qjs2hlEXtCV69vzKDSzs7/qxfE9SIJpalTVc1AmlfJw==
X-Received: by 2002:a63:4c23:0:b0:45f:eab4:4f47 with SMTP id
 z35-20020a634c23000000b0045feab44f47mr13538754pga.532.1666305416020; 
 Thu, 20 Oct 2022 15:36:56 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 09/14] target/arm: Don't shift attrs in get_phys_addr_lpae
Date: Fri, 21 Oct 2022 08:35:43 +1000
Message-Id: <20221020223548.2310496-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
index cd16b42c96..6820c2f4bc 100644
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


