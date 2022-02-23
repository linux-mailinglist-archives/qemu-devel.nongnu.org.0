Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3874C1EB8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:41:12 +0100 (CET)
Received: from localhost ([::1]:53582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0Jr-0005Zg-8d
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:41:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Ap-0006gp-6k
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:51 -0500
Received: from [2607:f8b0:4864:20::42e] (port=35508
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0An-0001D4-2K
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:50 -0500
Received: by mail-pf1-x42e.google.com with SMTP id l19so217071pfu.2
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+DAMlpqsE9DmBwY1s+cP0r+gi8rLuchADVNtgdDMW7U=;
 b=gOBGPyjn86roSjbkFP/FeauGD6Wio1CL1j62VVkw5N+cd1nPvuU+a8gbscsbUsdlcp
 bpeaNJtqMh52Kvz0Vw2Swi/5geIG5SOfKnfn7xcvHkYUAyeZK3sc72N/0MYOj59FgN3C
 n0P3neo5bnMiobjkcQle4cgJ9d7WMCt0fwqnpLHAJi2yKrNg2aXfZCvdMq5KxUFBrku/
 6hIPZSOMA43MbhRSntvkJFN1i70RyftJoRZ8ALXnFBsgR4XeKJu1SJljuUgs5/Cb+C1k
 xD7eeGXz5Hst/U0vPQgo4jx8mD5ie3lZdmyh0DQzxtXzXdi8X2SAhNgbaez48KUX2Ufp
 2lGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+DAMlpqsE9DmBwY1s+cP0r+gi8rLuchADVNtgdDMW7U=;
 b=FpvZIQ0fpfl8CK8Gs+ZRfpdZE8zx1kBVrwxDP98xwag5zt8iSQ7papS3X9REyPuqZE
 FYt3ehC0d40TNso7gQpOQjwrFVJg0TkvUefI5HYSsNBG9RQl3Q9dWlin9Wug+alGH9iE
 EJPYdozVotDFKLpzXm4kQVkeerNicEkvFdGMj2rR3qkDk2UFLsAGSs2fnAKgSGeU0ezY
 pTkL1ebAHCikrrbqjHFCbuAQQxJJpUJhbcL+hqkw7DuhLmBDTWCbOpUzMzRbtUyqf5RZ
 IuZnAWdsEajTCuRy8jNFOXjHi93TmxJ8ZdL+Xhnt1v2GLeVVgVH8f0kegGOCUsqVLFLQ
 luiQ==
X-Gm-Message-State: AOAM531fBjPVRQ2zBIYKRdufck86yWErEn5jF7ir8zuUnCJQNijt1YGq
 3D+sSDfciNuhfqIOUiHohIM0bJkzHkJcMQ==
X-Google-Smtp-Source: ABdhPJwCIpRZ3UJPxNOtTx/4M2JERi08FovPiaBmDhPCwz1w+KDdwVp+6JVw+jmw5wwaAk3sUwejvQ==
X-Received: by 2002:a63:e747:0:b0:372:c757:c569 with SMTP id
 j7-20020a63e747000000b00372c757c569mr1401082pgk.516.1645655507689; 
 Wed, 23 Feb 2022 14:31:47 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/17] target/arm: Move arm_pamax out of line
Date: Wed, 23 Feb 2022 12:31:24 -1000
Message-Id: <20220223223137.114264-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly share parts of this function with other portions
of address translation.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 19 +------------------
 target/arm/helper.c    | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index ef6c25d8cb..fefd1fb8d8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -243,24 +243,7 @@ static inline void update_spsel(CPUARMState *env, uint32_t imm)
  * Returns the implementation defined bit-width of physical addresses.
  * The ARMv8 reference manuals refer to this as PAMax().
  */
-static inline unsigned int arm_pamax(ARMCPU *cpu)
-{
-    static const unsigned int pamax_map[] = {
-        [0] = 32,
-        [1] = 36,
-        [2] = 40,
-        [3] = 42,
-        [4] = 44,
-        [5] = 48,
-    };
-    unsigned int parange =
-        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
-
-    /* id_aa64mmfr0 is a read-only register so values outside of the
-     * supported mappings can be considered an implementation error.  */
-    assert(parange < ARRAY_SIZE(pamax_map));
-    return pamax_map[parange];
-}
+unsigned int arm_pamax(ARMCPU *cpu);
 
 /* Return true if extended addresses are enabled.
  * This is always the case if our translation regime is 64 bit,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index dd4d95bda2..71e575f352 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11152,6 +11152,28 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
+/* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
+unsigned int arm_pamax(ARMCPU *cpu)
+{
+    static const unsigned int pamax_map[] = {
+        [0] = 32,
+        [1] = 36,
+        [2] = 40,
+        [3] = 42,
+        [4] = 44,
+        [5] = 48,
+    };
+    unsigned int parange =
+        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+
+    /*
+     * id_aa64mmfr0 is a read-only register so values outside of the
+     * supported mappings can be considered an implementation error.
+     */
+    assert(parange < ARRAY_SIZE(pamax_map));
+    return pamax_map[parange];
+}
+
 static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
-- 
2.25.1


