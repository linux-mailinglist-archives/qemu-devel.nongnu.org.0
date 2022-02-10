Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECC74B0467
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:19:31 +0100 (CET)
Received: from localhost ([::1]:47336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI0vb-0008Hi-1L
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:19:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hb-000496-VZ
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:05:04 -0500
Received: from [2607:f8b0:4864:20::102c] (port=32853
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0ha-00049y-10
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:05:03 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 k60-20020a17090a4cc200b001b932781f3eso962050pjh.0
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 20:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kHg4U9LRhzSdYYvCz2waEIRzlEfsFRMNDs65CPCnE5Y=;
 b=myMuzfW7WSHlmizCJsJixj3xK4uhQduOaVVLpApRtj4cxI+AFGwvDJR/rdVyrW9Xte
 2sBaFQi8BAWhXFOIqqy7Kiv0MZOA7XGoUSM/J5AOfq6Os5Y1Jl72QS8dJCOlIm0LOXGD
 qN7dZt5HkEiLXXi68oC/c6ketEtW9pKpE2TDkNn3uVaa8TLtRaDKmGZEKWqnT7f2qdWD
 WZ48u/LMYXy7Gi+JpEoFWpX5q8GpJul2EaDXx662PWy4QEVXVeYKmwH8RUwy5RtXvIuz
 g9PylGgq3n40qjW6TDpqdCsVszhLlx/Q+4CPK4fYy/vOEKoE79YsNII/i/jIXx/UYvxn
 EuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kHg4U9LRhzSdYYvCz2waEIRzlEfsFRMNDs65CPCnE5Y=;
 b=rseqk/KGmF5xN/oUw6bjeA59c5/+cnAMte+y0YPc511xLUeeQ6QZDlyAoEtnZg/OiK
 abqisIvjEBwoP49zkwVXu4UqKfZ9/TPgtsGdFJTBM6vVPhi4yT7mRM6Dd3aQb3zvN1gv
 uLZ2113qQ0RKWpL/8iqcb26W5YlrtH95TrrES9m8V8tagcRuLkU+LyHOCklWW1SaB1Wv
 vzTRlvjVIT8QQNIvEnfOvlGRPrQpZvQmbSf7W5E5ASLy/quAsixehQeCm+1fWtigYgsT
 MXnmmKmy+enKmqon8E17UJvxHCR48iBJN7RFCa2HbH20hT9jFOkSdMJPQ5dz5ssCPqYK
 UTwg==
X-Gm-Message-State: AOAM533Ia8SiNvUjy6pSib+S3NwiCTcsjO7SKfBNEGnsB2IbA3MnlKCr
 j+4HFUSIlkEf84bIgrJAz/gZfOtK2SeWonJu
X-Google-Smtp-Source: ABdhPJzcTo/TsjDbUlLvDWFORay22S2J2hwd9zT61Fz1FDO42Q6BWq1Tn11iC0n7IZndTuIdIVw4tA==
X-Received: by 2002:a17:902:da86:: with SMTP id
 j6mr5779356plx.95.1644465900677; 
 Wed, 09 Feb 2022 20:05:00 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:05:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/15] target/arm: Implement FEAT_LPA
Date: Thu, 10 Feb 2022 15:04:18 +1100
Message-Id: <20220210040423.95120-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This feature widens physical addresses (and intermediate physical
addresses for 2-stage translation) from 48 to 52 bits, when using
64k pages.  The only thing left at this point is to handle the
extra bits in the TTBR and in the table descriptors.

Note that PAR_EL1 and HPFAR_EL2 are nominally extended, but we don't
mask out the high bits when writing to those registers, so no changes
are required there.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h |  2 +-
 target/arm/cpu64.c     |  2 +-
 target/arm/helper.c    | 19 ++++++++++++++++---
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 5f9c288b1a..b59d505761 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -10,7 +10,7 @@
 
 #ifdef TARGET_AARCH64
 # define TARGET_LONG_BITS             64
-# define TARGET_PHYS_ADDR_SPACE_BITS  48
+# define TARGET_PHYS_ADDR_SPACE_BITS  52
 # define TARGET_VIRT_ADDR_SPACE_BITS  52
 #else
 # define TARGET_LONG_BITS             32
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d80a7eafac..707ae7767f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -765,7 +765,7 @@ static void aarch64_max_initfn(Object *obj)
         cpu->isar.id_aa64pfr1 = t;
 
         t = cpu->isar.id_aa64mmfr0;
-        t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
+        t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
         cpu->isar.id_aa64mmfr0 = t;
 
         t = cpu->isar.id_aa64mmfr1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 62935b06d0..9b1b1b2611 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11171,6 +11171,7 @@ static const uint8_t pamax_map[] = {
     [3] = 42,
     [4] = 44,
     [5] = 48,
+    [6] = 52,
 };
 
 /* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
@@ -11562,11 +11563,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     descaddr = extract64(ttbr, 0, 48);
 
     /*
-     * If the base address is out of range, raise AddressSizeFault.
+     * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [5:2] of TTBR.
+     *
+     * Otherwise, if the base address is out of range, raise AddressSizeFault.
      * In the pseudocode, this is !IsZero(baseregister<47:outputsize>),
      * but we've just cleared the bits above 47, so simplify the test.
      */
-    if (descaddr >> outputsize) {
+    if (outputsize > 48) {
+        descaddr |= extract64(ttbr, 2, 4) << 48;
+    } else if (descaddr >> outputsize) {
         level = 0;
         fault_type = ARMFault_AddressSize;
         goto do_fault;
@@ -11618,7 +11623,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         }
 
         descaddr = descriptor & descaddrmask;
-        if (descaddr >> outputsize) {
+
+        /*
+         * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [15:12]
+         * of descriptor.  Otherwise, if descaddr is out of range, raise
+         * AddressSizeFault.
+         */
+        if (outputsize > 48) {
+            descaddr |= extract64(descriptor, 12, 4) << 48;
+        } else if (descaddr >> outputsize) {
             fault_type = ARMFault_AddressSize;
             goto do_fault;
         }
-- 
2.25.1


