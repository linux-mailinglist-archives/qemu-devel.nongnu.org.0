Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC3A46DEEC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 00:14:40 +0100 (CET)
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv690-0008Mf-0q
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 18:14:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv66V-0005DE-2L
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 18:12:03 -0500
Received: from [2607:f8b0:4864:20::1032] (port=42789
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv66T-0004nu-Ky
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 18:12:02 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so3373654pjb.1
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 15:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eXPzA23R6/mCA8LiCwN5fF4QHA07i/kRSJFbv5jfL1Q=;
 b=F/8o/wLQeaecWx8RfLD+pdlx9Dw3/VgqLDr/EJB3WMo0NPjvBXhJbkDG1F/9TaYB7i
 +61+UhRoOrm4yaLttntd2lki51EqzD594hJPy4zmZVdTjTpbb/ZHptMjEhAlcD0PdRId
 XfHPkA5EnGsO/Rylx6Z4ap7x4Kgv5zLCO8J0onoei8fu/51E3vjhTU7yEnhGJg6Xi09i
 veyvE9XEkUNFn61yavn1kbZ2Da8pMaRNEv1hmZeErbZc/egSMNQWtgHwwvf96/cUTKhR
 24ktlK9u3IBBQsealB1uMiWQeYsYJsB6cIuHJKuH9r6MjpSEt9eAlXMdHsmTQYizBBF+
 umHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eXPzA23R6/mCA8LiCwN5fF4QHA07i/kRSJFbv5jfL1Q=;
 b=HwbCVwxA190bG3jbRColvhE0OAWPcIQlxGF00o5d7jI2BG479IjMgzp3zXfvPGEgVW
 M423rlCI8x9vhcRnB6117YiIosz3JkpUC3p9tjX1+FS2x+AoG1c1TjxDP++DG6wtjghZ
 zKM789WMrQSqE1r0NN5JHI/bkYm1HohqrgbOXhsRMXcSdp+GPXrubg6KHOCObkg+SpSD
 MAEJ7UThfiCfggJw2qTuqbJOd72g4/6sP3/7FZcn8h3XCYZKTZErm2g0ySqwoK3Ky6O9
 S39QRlF5umPElwkcQVWGl8ezZ0SsqoOVygAQWIUPtL3UTKvGDh8nIj92OTuYFpfcSu47
 rX/Q==
X-Gm-Message-State: AOAM533pckDkcm7mUb1VHOT5Tj96+4ies9hU5/HQgEtqxPvjQmO+QxRS
 XCNe+e40s1Rip4yw0i36De+pv7h/l1IQ4w==
X-Google-Smtp-Source: ABdhPJztwIdCt1oKZwKukvck0D53+7zyLaj2HefbXqcMRFZKJxLwYr5FjXpVG2HCGrQjzkF5akOKnw==
X-Received: by 2002:a17:902:a605:b0:143:d289:f3fb with SMTP id
 u5-20020a170902a60500b00143d289f3fbmr63139108plq.41.1639005120089; 
 Wed, 08 Dec 2021 15:12:00 -0800 (PST)
Received: from localhost.localdomain
 (45-19-222-18.lightspeed.sntcca.sbcglobal.net. [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id k15sm3301062pgn.91.2021.12.08.15.11.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 15:11:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] target/arm: Implement FEAT_LPA
Date: Wed,  8 Dec 2021 15:11:53 -0800
Message-Id: <20211208231154.392029-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208231154.392029-1-richard.henderson@linaro.org>
References: <20211208231154.392029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index f44ee643ef..3bb79ca744 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -739,7 +739,7 @@ static void aarch64_max_initfn(Object *obj)
         cpu->isar.id_aa64pfr1 = t;
 
         t = cpu->isar.id_aa64mmfr0;
-        t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
+        t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
         cpu->isar.id_aa64mmfr0 = t;
 
         t = cpu->isar.id_aa64mmfr1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6a59975028..e39c1f5b3a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11095,6 +11095,7 @@ static const uint8_t pamax_map[] = {
     [3] = 42,
     [4] = 44,
     [5] = 48,
+    [6] = 52,
 };
 
 /* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
@@ -11472,11 +11473,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
@@ -11526,7 +11531,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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


