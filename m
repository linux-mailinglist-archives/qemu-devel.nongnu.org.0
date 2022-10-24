Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D961609AB1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:43:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompsr-0007Ts-UV; Mon, 24 Oct 2022 01:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprt-0006cG-FM
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:21 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprq-0002NY-QM
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:20 -0400
Received: by mail-pf1-x430.google.com with SMTP id g16so2677445pfr.12
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/GiKSj2DI/fM8k5gjQPIZReGKnYnqJ3VPV7yF0e0HWE=;
 b=QYO+VEO8fbfNr2JY9OFpe90J6FHqGZOGl65keY3OMjec7Kobfrj9EJx3+MVvU42wmt
 zPsX+fL9OELfTIuFyzptmt8Mlrvyt4KPfMHOMKZ308SIxh6Q82k3wWkpq8G1Qf5CNzSR
 3m4M81RESX9fbc9+vb0zoIt0QZs4pGeqylHDrQ3WDHawHNaiWo7rklKJ59a23u4boxhU
 oEvjFzdIWXh2zSixkHVsBFY2R9KJS/159ODxhHjg31FULWDPSrfE9Vdx75Z56rvunT90
 2GfPx3g2ApA8NDj/IcdGspTgckgXsRmzLVILKQWrsUL3ob2s6ncoz0W8JruZ2IvyI4Nz
 00SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/GiKSj2DI/fM8k5gjQPIZReGKnYnqJ3VPV7yF0e0HWE=;
 b=UaYhuNRQs10aok2dMY7Xs5bkRzeaSaF0eFa1xHQN93KS8qbM+WGfbJxge2DjGqSY78
 FEWa/1EHEwDiBsNyzj51HVhxWq6IV3861XjZVHu5ahf2uLFSHurbrds5D31pHpzXlBfp
 AxHEPti29gJw7triXTgadCVBEwzoxLzpf0F91cjPR2LIklDdUAT6IER2pdxNvfZSWf/p
 e2pVv1/VrHD2i0ph+byORSKUwnRHBKicQOXd30ScpdeuV2UQ9XgnNShqKVKtoXmPzvxe
 qKR5rd/F0MoQCkCP9/pO3io2Qcv/UpNwFKWavK4HlfT+6NeZe9zNEHQ4bS21FoAImamA
 UW+A==
X-Gm-Message-State: ACrzQf2OE55/FNGbfGz4Cc7dt8HgvSpOrqZa1/oR1s8xPMyhe1vAJpC6
 X3oPwKh7ZTCvZFLh5KnQAlNHF5N738FZZ/wP
X-Google-Smtp-Source: AMsMyM6kWo1UyB0ULwuDzAocZgnKYgfnmBwPsZBxAv/EsVlTWysc7HUivsBu4O7InMJfjKL5+UAP2A==
X-Received: by 2002:a63:3fce:0:b0:45a:2bab:6002 with SMTP id
 m197-20020a633fce000000b0045a2bab6002mr27214309pga.454.1666588757369; 
 Sun, 23 Oct 2022 22:19:17 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 07/14] target/arm: Remove loop from get_phys_addr_lpae
Date: Mon, 24 Oct 2022 15:18:44 +1000
Message-Id: <20221024051851.3074715-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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


