Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DC64C982B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:10:18 +0100 (CET)
Received: from localhost ([::1]:50508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAhE-00074q-U8
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:10:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXf-0001L2-G2
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:24 -0500
Received: from [2607:f8b0:4864:20::1035] (port=41898
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXc-00052q-4Q
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:21 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so95823pjb.0
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DRWkLoJkIekxooE0yM1xnliLnzzt/ozTUB9sEE/E5Ow=;
 b=IryxSYgzvytR7FRsQVNzuNYlY/deavUtGw1IYXrAIs20xnEu3XANK+/DImGGSb8W3b
 5O8+e0c38RaC/Z7gkYERy5kO90B3bmgp6SE2NlFttHkF8sD9w2tabO6EJW4Fa6FZvkJg
 CDl/nPR4KmNCoCKIrEPlBodxlrJ6lf2e9l74gGFoilatyqYraLMbJxmO6XG/f0Ecv65a
 JSJYOWhGePz9g6JN4bRGdmqMGysSNCLUx/OxDhmFczyw8NMF1DKAAd0ho33sY2nsxbHa
 dWzTA42YCknlw3/Py1kVV5zbhffpl+ZrX/YMP0ikNFnU4BFuCS8+eNos0+qktwqf31AT
 RU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DRWkLoJkIekxooE0yM1xnliLnzzt/ozTUB9sEE/E5Ow=;
 b=gd1a1oyFcTpU+krqHQoYxVvw1wA8otDNhlb6eHWO6nh3vFXsGlJOfyUOy4ys9nOxxU
 i2K3rxqBqkgrN5ffZCTQzuu+Czia68vzjOptFfGOK4j8uKln3X5OEtOpQAk/lCG4znV1
 Ff0vZ2zkUuCIVOGJIGmSMbjBhJ3zKSmr9WoB7FDWw3AdkurteY2aqaz6oKM0eN9syAfm
 Qcl9icYFXtrZhJihvcfdTBKKd/qCmE2yiP5n2WEugohW/tEqVF6RtSRD4CKduYwjMs6J
 VINW3b8Asv20YUICykPfwRTlVxr5apWU7wAa4CVd6AkFzaM3B76DrkBAq6G9fPYz4gqV
 o29Q==
X-Gm-Message-State: AOAM5308xcuMX0lQSxZMsu47800M1X2RK1wdVhBb+H0Q5qJtYZZUZJ57
 HKHjl2/krbm9fC5TrnmjeHaFXCTWRsPqKw==
X-Google-Smtp-Source: ABdhPJwUF0u8CwMIDf7E4gEL+acX5Ww/fu7EsQuetQQ1iTTTUordjRBKChjcrU6aQiSy0W/HtyOuPQ==
X-Received: by 2002:a17:90a:de96:b0:1be:e427:8745 with SMTP id
 n22-20020a17090ade9600b001bee4278745mr3782373pjv.175.1646172018732; 
 Tue, 01 Mar 2022 14:00:18 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/18] target/arm: Implement FEAT_LPA
Date: Tue,  1 Mar 2022 11:59:50 -1000
Message-Id: <20220301215958.157011-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu-param.h        |  2 +-
 target/arm/cpu64.c            |  2 +-
 target/arm/helper.c           | 19 ++++++++++++++++---
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index f3eabddfb5..0053ddce20 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -24,6 +24,7 @@ the following architecture extensions:
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
+- FEAT_LPA (Large Physical Address space)
 - FEAT_LRCPC (Load-acquire RCpc instructions)
 - FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
 - FEAT_LSE (Large System Extensions)
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
index 1de31ffb40..d88662cef6 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -795,7 +795,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64pfr1 = t;
 
     t = cpu->isar.id_aa64mmfr0;
-    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
+    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 28b4347213..950f56599e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11173,6 +11173,7 @@ static const uint8_t pamax_map[] = {
     [3] = 42,
     [4] = 44,
     [5] = 48,
+    [6] = 52,
 };
 
 /* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
@@ -11564,11 +11565,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
@@ -11620,7 +11625,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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


