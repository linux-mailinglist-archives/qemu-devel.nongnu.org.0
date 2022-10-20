Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DC6606BAE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:53:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleQ8-0002db-8f
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:53:48 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ole9u-0007MW-F8
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9l-0006op-Bx
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:53 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9j-00012R-CD
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:53 -0400
Received: by mail-pj1-x102d.google.com with SMTP id ez6so767845pjb.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/GiKSj2DI/fM8k5gjQPIZReGKnYnqJ3VPV7yF0e0HWE=;
 b=DKK3gWdF+U1NMsoHizqjrnyvKi5MXXBEUCBLJjVOtuIwfMXwLZu1b3MtQdTYjWbqVB
 zGpqu2RutpjjF5jSgJluCsrhVudnM3QBXlQUYPkr51pPcn3fxlF77MCZ/jAdmrlcGTgu
 6EBKDkSouqW0h6OaRUzVzq2M0IMZbgcfyVnr/yxs6/vZ1u/O22FSTSUqf6xyXGkESQDE
 f8GzAG8oSllQXvMpz6IE+8UIUejXjB9GprymkN26hg8YnL9AS3znYkg5gUmGk+FANDr6
 aX3/iol0e7F8fYFm0VR4qdC9zGsgjcADVifwo+g2EUP9pALvcTJHiJTWq1Hsai/NNeLd
 DvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/GiKSj2DI/fM8k5gjQPIZReGKnYnqJ3VPV7yF0e0HWE=;
 b=bPOk3N3b4ecm/UvKNab/hPXDGIFRvYYO8C3oYmB0WRFFwCBzObAtpjKdmagTbOiWeh
 Vt/lJ4BQ7U+lqGJoLv/iscB0dGu5Sj9uZYUz176M1mRhvZ7Ato2ZLo00WRmG04kXLO+9
 x/pldD03pBM0FRU2Rq4fFMjlADFyUAe5ATrbyoF0rueZ6Ev7FU+yzM80klU2YQ2pogdh
 uRWFVYLoCdyUmdqcmoFqDeKl+jNKv5npywl2rCpMEI+duJMHdUF0SOe6Ixa/J9BfeE7N
 jpXKSqRMTkbSBD3/mSlGNB2HmbqylRbAeYpuoUEI1zUd4vzo7xQ7EcgdHwvoN3aNdVb6
 FOEw==
X-Gm-Message-State: ACrzQf1QvnMozgJGSpu41zVtUYwVAnpoazgvJO4Q2Y7Ygv0Tdol6Mw2j
 SNLkjbBp8o5W1XMu9o+X8EoBAmiwUphoLxdL
X-Google-Smtp-Source: AMsMyM4/pwYpR+Zh0q4DvOrPa4V6zBCRbmpG2AwMm2p7enFCsRi5thRnXtuIcNmpOzhCBWgsVrVvGQ==
X-Received: by 2002:a17:902:9f97:b0:184:983f:11c5 with SMTP id
 g23-20020a1709029f9700b00184983f11c5mr16062093plq.89.1666305409460; 
 Thu, 20 Oct 2022 15:36:49 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 07/14] target/arm: Remove loop from get_phys_addr_lpae
Date: Fri, 21 Oct 2022 08:35:41 +1000
Message-Id: <20221020223548.2310496-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The unconditional loop was used both to iterate over levels
and to control parsing of attributes.  Use an explicit goto
in both cases.

While this appears less clean for iterating over levels, we
will need to jump back into the middle of this loop for
atomic updates, which is even uglier.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 192 +++++++++++++++++++++++------------------------
 1 file changed, 96 insertions(+), 96 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 36524b35ef..615471699e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1080,6 +1080,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     bool guarded = false;
+    uint64_t descriptor;
+    bool nstable;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -1272,106 +1274,104 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * bits at each step.
      */
     tableattrs = is_secure ? 0 : (1 << 4);
-    for (;;) {
-        uint64_t descriptor;
-        bool nstable;
-
-        descaddr |= (address >> (stride * (4 - level))) & indexmask;
-        descaddr &= ~7ULL;
-        nstable = extract32(tableattrs, 4, 1);
-        if (!nstable) {
-            /*
-             * Stage2_S -> Stage2 or Phys_S -> Phys_NS
-             * Assert that the non-secure idx are even, and relative order.
-             */
-            QEMU_BUILD_BUG_ON((ARMMMUIdx_Phys_NS & 1) != 0);
-            QEMU_BUILD_BUG_ON((ARMMMUIdx_Stage2 & 1) != 0);
-            QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS + 1 != ARMMMUIdx_Phys_S);
-            QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2 + 1 != ARMMMUIdx_Stage2_S);
-            ptw->in_ptw_idx &= ~1;
-            ptw->in_secure = false;
-        }
-        if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
-            goto do_fault;
-        }
-        descriptor = arm_ldq_ptw(env, ptw, fi);
-        if (fi->type != ARMFault_None) {
-            goto do_fault;
-        }
-
-        if (!(descriptor & 1) ||
-            (!(descriptor & 2) && (level == 3))) {
-            /* Invalid, or the Reserved level 3 encoding */
-            goto do_fault;
-        }
-
-        descaddr = descriptor & descaddrmask;
 
+ next_level:
+    descaddr |= (address >> (stride * (4 - level))) & indexmask;
+    descaddr &= ~7ULL;
+    nstable = extract32(tableattrs, 4, 1);
+    if (!nstable) {
         /*
-         * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [15:12]
-         * of descriptor.  For FEAT_LPA2 and effective DS, bits [51:50] of
-         * descaddr are in [9:8].  Otherwise, if descaddr is out of range,
-         * raise AddressSizeFault.
+         * Stage2_S -> Stage2 or Phys_S -> Phys_NS
+         * Assert that the non-secure idx are even, and relative order.
          */
-        if (outputsize > 48) {
-            if (param.ds) {
-                descaddr |= extract64(descriptor, 8, 2) << 50;
-            } else {
-                descaddr |= extract64(descriptor, 12, 4) << 48;
-            }
-        } else if (descaddr >> outputsize) {
-            fault_type = ARMFault_AddressSize;
-            goto do_fault;
-        }
-
-        if ((descriptor & 2) && (level < 3)) {
-            /*
-             * Table entry. The top five bits are attributes which may
-             * propagate down through lower levels of the table (and
-             * which are all arranged so that 0 means "no effect", so
-             * we can gather them up by ORing in the bits at each level).
-             */
-            tableattrs |= extract64(descriptor, 59, 5);
-            level++;
-            indexmask = indexmask_grainsize;
-            continue;
-        }
-        /*
-         * Block entry at level 1 or 2, or page entry at level 3.
-         * These are basically the same thing, although the number
-         * of bits we pull in from the vaddr varies. Note that although
-         * descaddrmask masks enough of the low bits of the descriptor
-         * to give a correct page or table address, the address field
-         * in a block descriptor is smaller; so we need to explicitly
-         * clear the lower bits here before ORing in the low vaddr bits.
-         */
-        page_size = (1ULL << ((stride * (4 - level)) + 3));
-        descaddr &= ~(hwaddr)(page_size - 1);
-        descaddr |= (address & (page_size - 1));
-        /* Extract attributes from the descriptor */
-        attrs = extract64(descriptor, 2, 10)
-            | (extract64(descriptor, 52, 12) << 10);
-
-        if (regime_is_stage2(mmu_idx)) {
-            /* Stage 2 table descriptors do not include any attribute fields */
-            break;
-        }
-        /* Merge in attributes from table descriptors */
-        attrs |= nstable << 3; /* NS */
-        guarded = extract64(descriptor, 50, 1);  /* GP */
-        if (param.hpd) {
-            /* HPD disables all the table attributes except NSTable.  */
-            break;
-        }
-        attrs |= extract32(tableattrs, 0, 2) << 11;     /* XN, PXN */
-        /*
-         * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
-         * means "force PL1 access only", which means forcing AP[1] to 0.
-         */
-        attrs &= ~(extract32(tableattrs, 2, 1) << 4);   /* !APT[0] => AP[1] */
-        attrs |= extract32(tableattrs, 3, 1) << 5;      /* APT[1] => AP[2] */
-        break;
+        QEMU_BUILD_BUG_ON((ARMMMUIdx_Phys_NS & 1) != 0);
+        QEMU_BUILD_BUG_ON((ARMMMUIdx_Stage2 & 1) != 0);
+        QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS + 1 != ARMMMUIdx_Phys_S);
+        QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2 + 1 != ARMMMUIdx_Stage2_S);
+        ptw->in_ptw_idx &= ~1;
+        ptw->in_secure = false;
     }
+    if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
+        goto do_fault;
+    }
+    descriptor = arm_ldq_ptw(env, ptw, fi);
+    if (fi->type != ARMFault_None) {
+        goto do_fault;
+    }
+
+    if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
+        /* Invalid, or the Reserved level 3 encoding */
+        goto do_fault;
+    }
+
+    descaddr = descriptor & descaddrmask;
+
+    /*
+     * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [15:12]
+     * of descriptor.  For FEAT_LPA2 and effective DS, bits [51:50] of
+     * descaddr are in [9:8].  Otherwise, if descaddr is out of range,
+     * raise AddressSizeFault.
+     */
+    if (outputsize > 48) {
+        if (param.ds) {
+            descaddr |= extract64(descriptor, 8, 2) << 50;
+        } else {
+            descaddr |= extract64(descriptor, 12, 4) << 48;
+        }
+    } else if (descaddr >> outputsize) {
+        fault_type = ARMFault_AddressSize;
+        goto do_fault;
+    }
+
+    if ((descriptor & 2) && (level < 3)) {
+        /*
+         * Table entry. The top five bits are attributes which may
+         * propagate down through lower levels of the table (and
+         * which are all arranged so that 0 means "no effect", so
+         * we can gather them up by ORing in the bits at each level).
+         */
+        tableattrs |= extract64(descriptor, 59, 5);
+        level++;
+        indexmask = indexmask_grainsize;
+        goto next_level;
+    }
+
+    /*
+     * Block entry at level 1 or 2, or page entry at level 3.
+     * These are basically the same thing, although the number
+     * of bits we pull in from the vaddr varies. Note that although
+     * descaddrmask masks enough of the low bits of the descriptor
+     * to give a correct page or table address, the address field
+     * in a block descriptor is smaller; so we need to explicitly
+     * clear the lower bits here before ORing in the low vaddr bits.
+     */
+    page_size = (1ULL << ((stride * (4 - level)) + 3));
+    descaddr &= ~(hwaddr)(page_size - 1);
+    descaddr |= (address & (page_size - 1));
+    /* Extract attributes from the descriptor */
+    attrs = extract64(descriptor, 2, 10)
+        | (extract64(descriptor, 52, 12) << 10);
+
+    if (regime_is_stage2(mmu_idx)) {
+        /* Stage 2 table descriptors do not include any attribute fields */
+        goto skip_attrs;
+    }
+    /* Merge in attributes from table descriptors */
+    attrs |= nstable << 3; /* NS */
+    guarded = extract64(descriptor, 50, 1);  /* GP */
+    if (param.hpd) {
+        /* HPD disables all the table attributes except NSTable.  */
+        goto skip_attrs;
+    }
+    attrs |= extract32(tableattrs, 0, 2) << 11;     /* XN, PXN */
+    /*
+     * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
+     * means "force PL1 access only", which means forcing AP[1] to 0.
+     */
+    attrs &= ~(extract32(tableattrs, 2, 1) << 4);   /* !APT[0] => AP[1] */
+    attrs |= extract32(tableattrs, 3, 1) << 5;      /* APT[1] => AP[2] */
+ skip_attrs:
+
     /*
      * Here descaddr is the final physical address, and attributes
      * are all in attrs.
-- 
2.34.1


