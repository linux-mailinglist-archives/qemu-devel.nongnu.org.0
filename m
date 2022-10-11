Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 895A25FAB3E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:39:06 +0200 (CEST)
Received: from localhost ([::1]:47112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi66j-0001wS-IO
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o7-0002f1-MI
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:51 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o5-000383-NH
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:51 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 d7-20020a17090a2a4700b0020d268b1f02so5317989pjg.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v5fZEsizLTBbzlQyMJApbEFH3hQ5MeBPh9aoDq+SKpQ=;
 b=ELe1O6vYoT5wzrbqk8Cda3tezsb+8nu4BJ3nJq4Xsoovmy7EdwnI35DSz/pFjpSN0R
 RhjfH8MQMxje0u+M2TVATCh6Ned/PmhDpD5bIEiyyh8onMf97E+iuqaHv25jWtIDE9Wk
 oNHNRCMoH+P/AG6FO4p50O9ZEkVaCDOS3Y1v+8zlx3FazFH5D8xjE9ZpV2elriZgFxiF
 jzoRnqM7v6erRRDDYiv+dEoRfKHmXIosyn+zhMrEgvUw3S8JRnnD7+q40cVJMFLluhtf
 pRvIwyfQnHrTItuhBBcwfg0obR9tH4cI6dBYPO6IFwuICQ55jf1XtaOVagpisNVzm0Tf
 7JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v5fZEsizLTBbzlQyMJApbEFH3hQ5MeBPh9aoDq+SKpQ=;
 b=C3US86ZEafZ4raAcESjhlN1zu2YeVy9B40qyzXVUnxokLIQ9RELSxYiNjvP5rv5/0R
 MhWujjCtV9ui9Ru1vD2+dXTxqBlCrxWVdA+RugdfaQ3wq2O2mhzsputJ4pksYwhdH7id
 M7U1rJaFEyxB+0teiK2SOWps+UH/iRmjyvZ7xbUPU5yGYnALxcAuzoOpOANCmSOZSFue
 lvIPtfhp0yot/QrbY51VOeuW04rUg1Pec4GymO5/THYd1t2pZDETJlf8fmUTH9gtf0o2
 RSr5K/60tEsQ4nvvlj7urbVQ9svc1l5TQ0Y7ItBp/TBCUa15B8GRaWfiL0pRUluvWLS/
 xgLA==
X-Gm-Message-State: ACrzQf2oECVE2NJ44xx5iIlqUN5r9dAA9X9cYrQbBUuAab5Ko9OE86QT
 gegWZgtRqGwX+sYCoyvhMT9XCxMrENEnWQ==
X-Google-Smtp-Source: AMsMyM5xCj+jj0VBi39+Setbvod8Mo3zkJHg68mNbin/P2WUDk3W/HzQ1bM94sUPUx9h2GLB8Okvaw==
X-Received: by 2002:a17:902:bb86:b0:17c:4cac:eea4 with SMTP id
 m6-20020a170902bb8600b0017c4caceea4mr21433133pls.141.1665458387502; 
 Mon, 10 Oct 2022 20:19:47 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 18/24] target/arm: Remove loop from get_phys_addr_lpae
Date: Mon, 10 Oct 2022 20:19:05 -0700
Message-Id: <20221011031911.2408754-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

The unconditional loop was used both to iterate over levels
and to control parsing of attributes.  Use an explicit goto
in both cases.

While this appears less clean for iterating over levels, we
will need to jump back into the middle of this loop for
atomic updates, which is even uglier.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 182 +++++++++++++++++++++++------------------------
 1 file changed, 91 insertions(+), 91 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d54e6ca938..9b767f8236 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1082,6 +1082,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     bool guarded = false;
+    uint64_t descriptor;
+    bool nstable;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -1274,99 +1276,97 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * bits at each step.
      */
     tableattrs = is_secure ? 0 : (1 << 4);
-    for (;;) {
-        uint64_t descriptor;
-        bool nstable;
 
-        descaddr |= (address >> (stride * (4 - level))) & indexmask;
-        descaddr &= ~7ULL;
-        nstable = extract32(tableattrs, 4, 1);
-        if (!nstable) {
-            /* Stage2_S -> Stage2 or Phys_S -> Phys_NS */
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
-
-        /*
-         * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [15:12]
-         * of descriptor.  For FEAT_LPA2 and effective DS, bits [51:50] of
-         * descaddr are in [9:8].  Otherwise, if descaddr is out of range,
-         * raise AddressSizeFault.
-         */
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
-        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
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
+ next_level:
+    descaddr |= (address >> (stride * (4 - level))) & indexmask;
+    descaddr &= ~7ULL;
+    nstable = extract32(tableattrs, 4, 1);
+    if (!nstable) {
+        /* Stage2_S -> Stage2 or Phys_S -> Phys_NS */
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
+    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
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


