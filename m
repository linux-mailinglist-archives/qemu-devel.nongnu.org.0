Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF4C53D597
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:49:12 +0200 (CEST)
Received: from localhost ([::1]:55552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLip-0005TG-15
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3W-0008JL-U2
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:30 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3V-0008VM-3y
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:30 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso13505793pjl.3
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6KKo07UAnM87DaMoH4z3hFQneciCBNYbYQZeTrJ63eA=;
 b=JvM1wUMfOld2jZAq7MIwZrb9A/eGZ68mHqo14HneYJdq5h7IkUSwDhfNflFiFUUyC/
 DxkQtuBldVsPz868s73MEHZvpZT8qGlBER8kVbobzRCq6A/ijrOsPxhe+m6Qf7yPwVLO
 aUjDCeuUn6bciWaQtwJ8xEbOR4xWgkEHqPBCdXXDfdMoJlFz9uuDg2Qw5quvx9Uylhjf
 QMxzLQUZWGybT38EILAV6aIo3lWcGLVeGQ8V/YzGEG6UPFzCY3bT5iQb/oG/zu84bP6E
 6CaORFgp1on+PJ/7DlFQD9kxeWLWUKH2Ltb4CiIKIEyN9cPcUU4YenvOvK5tNuxAkpQx
 TIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6KKo07UAnM87DaMoH4z3hFQneciCBNYbYQZeTrJ63eA=;
 b=QQ0zKsX5opfwQqHTh3MDy4g3r2zACnbA3FvBbENWdNJyGs4NiAUyABF3g3clf1x7Gh
 SIyn6H3yFq3nRpUXg6uFVv7WwIr2cHrmUcDOVV1SaRrBYjeH5Hm2VA0Xj6PeCTkdFPNv
 KUP4w89M1qwAUPTSIAq4dy0NjhPcmh8U5CDt9vW3HsSrDW4iNCQIUwlmTiNkW68U2Lt9
 4oF7WLODzcwB4avxdNzIQtvMhyB4mdDz8US1dCekSgmT29m50YmUeGodt73cRAVjqEqu
 m2VgkxpWusD9t2T8Wa1+uTi0MEu9LEQNRSzdeg+KrJMvGJtdHidEcS9+MIU87sKxoV/2
 U3RA==
X-Gm-Message-State: AOAM5326Wb2nvQuKI5c/1Dqzq/WnzyePZknYHUdUEyE1Ul5fkVtO2lE1
 EGm3tM4oQf2xFm5blzO4rBcbOItMeaPaNA==
X-Google-Smtp-Source: ABdhPJwiG7we0tFckdCvMY5uqeh50yEOX/9qpuCSZp/hLvBCY7DBlOeQ7j+oNbDxa1vF+VLkPLjkWg==
X-Received: by 2002:a17:90a:ba15:b0:1e2:e76c:f725 with SMTP id
 s21-20020a17090aba1500b001e2e76cf725mr14161949pjr.7.1654315588232; 
 Fri, 03 Jun 2022 21:06:28 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 21/28] target/arm: Move aa32_va_parameters to ptw.c
Date: Fri,  3 Jun 2022 21:06:00 -0700
Message-Id: <20220604040607.269301-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  3 ---
 target/arm/helper.c | 64 ---------------------------------------------
 target/arm/ptw.c    | 64 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 67 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index a71161b01b..9314fb4d23 100644
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
index 5dfe1f9cc0..02e65c9e98 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10735,70 +10735,6 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
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
index 525272e99a..427813ea56 100644
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
2.34.1


