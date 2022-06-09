Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE4654476D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:29:38 +0200 (CEST)
Received: from localhost ([::1]:45976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzETx-0000cg-CN
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7O-0001Z0-C6
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:21 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7J-00063a-3z
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:16 -0400
Received: by mail-wr1-x433.google.com with SMTP id h5so31518410wrb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NDy5L1j1NFeCwxkRreoifiteCmt9uSlmxDgPX55fTNU=;
 b=rn1tLAMCWtRlYx+ukNHwDCZj515mfgswJ40a7U18/L+lO0lftUle6LtLJeyoL/RR0U
 RD6fk/Zm9bLDbnBO0SJrf4oNqdRMTWGVuqPjxxWUDrXcf18+rGC76tauOmVJ9qoxL/z+
 NJozbTPGz3tExs0djCv+dhNvWukoUPtLIaYGqaG3g85gqbV8ITy3roqwoKTO/axTWtM4
 1v3+j1zlAo0EZbXcgWmtPpG3mZ1fAwvb94GZj3fdFF/Pw66G0yQWV6rX8NxIsCCMBGXc
 x7KzeEnGwSJR0cCmw1TDKcrZd2Wyv/Sz79GkKx6DFIhAjX/CLJ18Taz4eXwCG+2KfLVF
 mwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NDy5L1j1NFeCwxkRreoifiteCmt9uSlmxDgPX55fTNU=;
 b=WhLQMpp7OIQHBXsMowJqVTSIO7QcY5dx+I+GuW+lwEEnIeTXHcnqab4J5AP4GaI932
 7S2iXKOlbBn59uyFs40KAqWZAU2MjIRDY7hd0Lb1eN9iZYxJGFU5EA+Dkh5hxWR3meoj
 R6EhNqaAF2atUNBJmpCJKuVBzyPKczlvM520bqKWkWVcNu0fj+mJ44ZfwcHgfybkM7i3
 oaQxm/+zW5gAK9qH8lEQ+Ov/q3e16Ya+bAAbtjK/Hol5NuarvSS1kwybzCS1IpSI4BGL
 YC9XCiB7KZj2DtxtYkwqULB1sjAi8wpj+5/TPpogKVK57OBVngj9v1FcYh4LFaBob2r1
 SodQ==
X-Gm-Message-State: AOAM532dr2dVZwx7VrKHUczcnH8slD8ALASykhDSD/wiSom4VY6K/yku
 qkLPUThqEqUDCl1Fjbv+LkYMKlee3jUhhg==
X-Google-Smtp-Source: ABdhPJw2cm5vmwzhLab6HGqMUR3tpPm+LGIbL3V9Psip9Bd2IgmrtJSU+GjPiQllWwe/KcgDKdLTBw==
X-Received: by 2002:adf:eccd:0:b0:212:fbbc:79de with SMTP id
 s13-20020adfeccd000000b00212fbbc79demr35774935wro.520.1654765571489; 
 Thu, 09 Jun 2022 02:06:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/55] target/arm: Move aa32_va_parameters to ptw.c
Date: Thu,  9 Jun 2022 10:05:10 +0100
Message-Id: <20220609090537.1971756-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-22-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  3 ---
 target/arm/helper.c | 64 ---------------------------------------------
 target/arm/ptw.c    | 64 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 67 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index a71161b01bd..9314fb4d23c 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -25,8 +25,5 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
-ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
-                                   ARMMMUIdx mmu_idx);
-
 #endif /* !CONFIG_USER_ONLY */
 #endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2526f4c6c4a..f61f1da61e4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10771,70 +10771,6 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 }
 
 #ifndef CONFIG_USER_ONLY
-ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
-                                   ARMMMUIdx mmu_idx)
-{
-    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    uint32_t el = regime_el(env, mmu_idx);
-    int select, tsz;
-    bool epd, hpd;
-
-    assert(mmu_idx != ARMMMUIdx_Stage2_S);
-
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        /* VTCR */
-        bool sext = extract32(tcr, 4, 1);
-        bool sign = extract32(tcr, 3, 1);
-
-        /*
-         * If the sign-extend bit is not the same as t0sz[3], the result
-         * is unpredictable. Flag this as a guest error.
-         */
-        if (sign != sext) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "AArch32: VTCR.S / VTCR.T0SZ[3] mismatch\n");
-        }
-        tsz = sextract32(tcr, 0, 4) + 8;
-        select = 0;
-        hpd = false;
-        epd = false;
-    } else if (el == 2) {
-        /* HTCR */
-        tsz = extract32(tcr, 0, 3);
-        select = 0;
-        hpd = extract64(tcr, 24, 1);
-        epd = false;
-    } else {
-        int t0sz = extract32(tcr, 0, 3);
-        int t1sz = extract32(tcr, 16, 3);
-
-        if (t1sz == 0) {
-            select = va > (0xffffffffu >> t0sz);
-        } else {
-            /* Note that we will detect errors later.  */
-            select = va >= ~(0xffffffffu >> t1sz);
-        }
-        if (!select) {
-            tsz = t0sz;
-            epd = extract32(tcr, 7, 1);
-            hpd = extract64(tcr, 41, 1);
-        } else {
-            tsz = t1sz;
-            epd = extract32(tcr, 23, 1);
-            hpd = extract64(tcr, 42, 1);
-        }
-        /* For aarch32, hpd0 is not enabled without t2e as well.  */
-        hpd &= extract32(tcr, 6, 1);
-    }
-
-    return (ARMVAParameters) {
-        .tsz = tsz,
-        .select = select,
-        .epd = epd,
-        .hpd = hpd,
-    };
-}
-
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
                                          MemTxAttrs *attrs)
 {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 525272e99af..427813ea563 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -615,6 +615,70 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     return prot_rw | PAGE_EXEC;
 }
 
+static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
+                                          ARMMMUIdx mmu_idx)
+{
+    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+    uint32_t el = regime_el(env, mmu_idx);
+    int select, tsz;
+    bool epd, hpd;
+
+    assert(mmu_idx != ARMMMUIdx_Stage2_S);
+
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        /* VTCR */
+        bool sext = extract32(tcr, 4, 1);
+        bool sign = extract32(tcr, 3, 1);
+
+        /*
+         * If the sign-extend bit is not the same as t0sz[3], the result
+         * is unpredictable. Flag this as a guest error.
+         */
+        if (sign != sext) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "AArch32: VTCR.S / VTCR.T0SZ[3] mismatch\n");
+        }
+        tsz = sextract32(tcr, 0, 4) + 8;
+        select = 0;
+        hpd = false;
+        epd = false;
+    } else if (el == 2) {
+        /* HTCR */
+        tsz = extract32(tcr, 0, 3);
+        select = 0;
+        hpd = extract64(tcr, 24, 1);
+        epd = false;
+    } else {
+        int t0sz = extract32(tcr, 0, 3);
+        int t1sz = extract32(tcr, 16, 3);
+
+        if (t1sz == 0) {
+            select = va > (0xffffffffu >> t0sz);
+        } else {
+            /* Note that we will detect errors later.  */
+            select = va >= ~(0xffffffffu >> t1sz);
+        }
+        if (!select) {
+            tsz = t0sz;
+            epd = extract32(tcr, 7, 1);
+            hpd = extract64(tcr, 41, 1);
+        } else {
+            tsz = t1sz;
+            epd = extract32(tcr, 23, 1);
+            hpd = extract64(tcr, 42, 1);
+        }
+        /* For aarch32, hpd0 is not enabled without t2e as well.  */
+        hpd &= extract32(tcr, 6, 1);
+    }
+
+    return (ARMVAParameters) {
+        .tsz = tsz,
+        .select = select,
+        .epd = epd,
+        .hpd = hpd,
+    };
+}
+
 /*
  * check_s2_mmu_setup
  * @cpu:        ARMCPU
-- 
2.25.1


