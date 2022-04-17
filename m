Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3235048DC
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:21:00 +0200 (CEST)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9W7-0007jf-VN
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xN-0001St-Ks
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:05 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:46641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xJ-0003Qf-6t
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:05 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 h15-20020a17090a054f00b001cb7cd2b11dso12207611pjf.5
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5StdWYGeCOlRyUwqJZ4tniRcd6lDfQV+KGHmy0NGmEs=;
 b=sGMHhfGMu4AyH73jaartkjimFmwe4BN4cvzK6EbMrQ//YXEMVxgtrLRSO92nv27n+W
 nIP4MeZwQBCnqgnRznep81tFU1LqaYLPQ6BlNW8AGUhuxer7gts8xDnK4YLbLF/hshIm
 mIYMDQt7kr+ubwmoXAF3sC1ucKSS3azskLCYdEX/Y0rLdsEgkKCqHJorVgpgHaBHeHVJ
 e4hoL6U0Q96IojvRIs4ijxOVg7v+ByAaPib/59YCwS8NBJTwl9UtON8SENQjhdTu6Rpx
 uSb/kdmcgEA5JcYxOz/Lw7zyLGdUTbFCxXWzelpBV+KPxCpen56l4JZsL2d67A5YCmgs
 z8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5StdWYGeCOlRyUwqJZ4tniRcd6lDfQV+KGHmy0NGmEs=;
 b=JJdpQgtt3WWmgjB2+SZA+yEVCflWVSS3T9VQYOvsGab3fT0VjQGFm3KQh7Q/9ghea9
 8D4aXr5t2V1RXW7hMbENG4Q05dOjIbAloXpz+4qU+78RgIu8/rcQK/EdcpXi5CkITwjW
 URZSflA3WS8qasm5Y9c4mmSiQoeqEfST3kF4itd5zVsWqS8f+KqHWAuCM61sdVZgfGah
 VB5P1QGpUkIX5d8rIMbs9NSzBu3vLUNAPElSPBv4VGvsL1Us52P8bFAUVnnNvBcpMqbu
 15au+PZl5Yi9bvYHv3lgMMg/eQiFOqvwpuEjHUIW1OUzo52pbU+y5Z0lWiK1oimrqMXs
 iguA==
X-Gm-Message-State: AOAM530mF0kagvLPBDI4V//Jez3KAdXncmX8E2qMQJJGClBObjrsosMy
 Y/dkaKcrqr0ivaymEjIZPzBDSMhaILwTFA==
X-Google-Smtp-Source: ABdhPJwPNQTz+nD2fp2ihVFe0K66kkgT2/Lj9KrE2L3IdIKXpqQx8W9xELdEMfErB63Z7xRI39LIUg==
X-Received: by 2002:a17:902:cec3:b0:158:d5b4:2572 with SMTP id
 d3-20020a170902cec300b00158d5b42572mr7955297plg.52.1650217499754; 
 Sun, 17 Apr 2022 10:44:59 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 35/60] target/arm: Handle cpreg registration for missing EL
Date: Sun, 17 Apr 2022 10:44:01 -0700
Message-Id: <20220417174426.711829-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

More gracefully handle cpregs when EL2 and/or EL3 are missing.
If the reg is entirely inaccessible, do not register it at all.
If the reg is for EL2, and EL3 is present but EL2 is not,
squash to ARM_CP_CONST.

This will simplify cpreg registration for conditional arm features.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 109 ++++++++++++++++++++++++++++++++------------
 1 file changed, 79 insertions(+), 30 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 562ea5c418..d9837b5bd2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8519,13 +8519,14 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
+    CPUARMState *env = &cpu->env;
     uint32_t key;
     ARMCPRegInfo *r2;
     bool is64 = r->type & ARM_CP_64BIT;
     bool ns = secstate & ARM_CP_SECSTATE_NS;
     int cp = r->cp;
-    bool isbanked;
     size_t name_len;
+    bool make_const;
 
     switch (state) {
     case ARM_CP_STATE_AA32:
@@ -8560,6 +8561,24 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         }
     }
 
+    /*
+     * Eliminate registers that are not present because the EL is missing.
+     * Doing this here makes it easier to put all registers for a given
+     * feature into the same ARMCPRegInfo array and define them all at once.
+     */
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        /* An EL2 register without EL2 but with EL3 is (usually) RES0. */
+        int min_el = ctz32(r->access) / 2;
+        make_const = min_el == 2 && !arm_feature(env, ARM_FEATURE_EL2);
+    } else {
+        CPAccessRights max_el = (arm_feature(env, ARM_FEATURE_EL2)
+                                 ? PL2_RW : PL1_RW);
+        if ((r->access & max_el) == 0) {
+            return;
+        }
+        make_const = false;
+    }
+
     /* Combine cpreg and name into one allocation. */
     name_len = strlen(name) + 1;
     r2 = g_malloc(sizeof(*r2) + name_len);
@@ -8580,44 +8599,74 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         r2->opaque = opaque;
     }
 
-    isbanked = r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1];
-    if (isbanked) {
+    if (make_const) {
+        /* This should not have been a very special register to begin. */
+        int old_special = r2->type & ARM_CP_SPECIAL_MASK;
+        assert(old_special == 0 || old_special == ARM_CP_CONST);
         /*
-         * Register is banked (using both entries in array).
-         * Overwriting fieldoffset as the array is only used to define
-         * banked registers but later only fieldoffset is used.
+         * Set the special function to CONST, retaining the flags.
+         * This is important for e.g. ARM_CP_SVE so that we still
+         * take the SVE trap if CPTR_EL3.EZ == 0.
          */
-        r2->fieldoffset = r->bank_fieldoffsets[ns];
-    }
-    if (state == ARM_CP_STATE_AA32) {
+        r2->type |= ARM_CP_CONST;
+        /*
+         * Usually, these registers become RES0, but there are a few
+         * special cases like VPIDR_EL2 which have a constant non-zero
+         * value with writes ignored.  So leave resetvalue as is.
+         *
+         * ARM_CP_SPECIAL_MASK has precedence, so removing the callbacks
+         * and offsets are not strictly necessary, but is potentially
+         * less confusing to debug later.
+         */
+        r2->readfn = NULL;
+        r2->writefn = NULL;
+        r2->raw_readfn = NULL;
+        r2->raw_writefn = NULL;
+        r2->resetfn = NULL;
+        r2->fieldoffset = 0;
+        r2->bank_fieldoffsets[0] = 0;
+        r2->bank_fieldoffsets[1] = 0;
+    } else {
+        bool isbanked = r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1];
+
         if (isbanked) {
             /*
-             * If the register is banked then we don't need to migrate or
-             * reset the 32-bit instance in certain cases:
-             *
-             * 1) If the register has both 32-bit and 64-bit instances then we
-             *    can count on the 64-bit instance taking care of the
-             *    non-secure bank.
-             * 2) If ARMv8 is enabled then we can count on a 64-bit version
-             *    taking care of the secure bank.  This requires that separate
-             *    32 and 64-bit definitions are provided.
+             * Register is banked (using both entries in array).
+             * Overwriting fieldoffset as the array is only used to define
+             * banked registers but later only fieldoffset is used.
              */
-            if ((r->state == ARM_CP_STATE_BOTH && ns) ||
-                (arm_feature(&cpu->env, ARM_FEATURE_V8) && !ns)) {
+            r2->fieldoffset = r->bank_fieldoffsets[ns];
+        }
+        if (state == ARM_CP_STATE_AA32) {
+            if (isbanked) {
+                /*
+                 * If the register is banked then we don't need to migrate or
+                 * reset the 32-bit instance in certain cases:
+                 *
+                 * 1) If the register has both 32-bit and 64-bit instances
+                 *    then we can count on the 64-bit instance taking care
+                 *    of the non-secure bank.
+                 * 2) If ARMv8 is enabled then we can count on a 64-bit
+                 *    version taking care of the secure bank.  This requires
+                 *    that separate 32 and 64-bit definitions are provided.
+                 */
+                if ((r->state == ARM_CP_STATE_BOTH && ns) ||
+                    (arm_feature(env, ARM_FEATURE_V8) && !ns)) {
+                    r2->type |= ARM_CP_ALIAS;
+                }
+            } else if ((secstate != r->secure) && !ns) {
+                /*
+                 * The register is not banked so we only want to allow
+                 * migration of the non-secure instance.
+                 */
                 r2->type |= ARM_CP_ALIAS;
             }
-        } else if ((secstate != r->secure) && !ns) {
-            /*
-             * The register is not banked so we only want to allow migration
-             * of the non-secure instance.
-             */
-            r2->type |= ARM_CP_ALIAS;
-        }
 
-        if (r->state == ARM_CP_STATE_BOTH && r->fieldoffset) {
+            if (r->state == ARM_CP_STATE_BOTH && r->fieldoffset) {
 #ifdef HOST_WORDS_BIGENDIAN
-            r2->fieldoffset += sizeof(uint32_t);
+                r2->fieldoffset += sizeof(uint32_t);
 #endif
+            }
         }
     }
 
@@ -8628,7 +8677,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * multiple times. Special registers (ie NOP/WFI) are
      * never migratable and not even raw-accessible.
      */
-    if (r->type & ARM_CP_SPECIAL_MASK) {
+    if (r2->type & ARM_CP_SPECIAL_MASK) {
         r2->type |= ARM_CP_NO_RAW;
     }
     if ((r->crm == CP_ANY && crm != 0) ||
-- 
2.25.1


