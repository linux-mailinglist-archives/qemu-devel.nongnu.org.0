Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571E94C1EB4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:40:30 +0100 (CET)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0JB-00045O-4Y
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:40:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0An-0006Yu-9g
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:49 -0500
Received: from [2607:f8b0:4864:20::1034] (port=45641
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Al-0001CT-6M
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:48 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 bx9-20020a17090af48900b001bc64ee7d3cso326854pjb.4
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8FniAxzNq9R5C3PUa8crK2rtgbWJQ/YT25+L7bxil2U=;
 b=mMRtQwqR+JIHKhxGCA+TZ6Lh4RIplVAtW7d2GOe2aabcU2ObhZz8nFysChL+X81uYZ
 HWxG1Bf7IW7vFrk3yTQm6igrjA8s2+t2b8iGEUjJ9Ndrh1UktS2JBDucZreqGrtciHF9
 t077h2otJGdRO0C6HLeXi2car4sGQKJ7xY1xjENA9oSzNqV6mSxFq9s2imG1OJ+cMTdN
 OOyL2vNQ61SK9HcsHkabx0zrh1OmdoL8s1c8mYP0Ec5oFmefRJ1YcA6leHt8A8lzXdep
 AV4rUJbjhlbxtlkYAbpPEXV2fCzAEYI4W7CWLqaO4q3JXrYG7E3xI/9iA/M/gpzZdyxc
 LmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8FniAxzNq9R5C3PUa8crK2rtgbWJQ/YT25+L7bxil2U=;
 b=dsisbiiQgZr02+i8BXajPD7UAfDAfMvC9a8kUI9lCOfDJHGkoYvdHHWJcm7nwmx8di
 oaVsPsJfvPv13+D+4hckeH08Hnxl9WOnWHCLy+3j40XNRSyPc6iOS0Jn0M/U0Pn42l3d
 NpnrglGX9A9JvQ0OB4HtRLi8Z1P6DDF+ZD2SDLhMHUtvdnFM30s2L/PK1igW26CVB5Qu
 PRMBf1lxSq+JYd52wX8mRoOq3Zf8wZuIjk74zbJpJ0bzIkkPt+YzYXId7JYSHt864CTY
 EMp8X1XMJTeNy/bDQv1aw9CyhjNSd6UEnDsBQgMi5Pt82BZh+bHytDi++eboX9JWoaZw
 rJCQ==
X-Gm-Message-State: AOAM532FXzazjYxthyspgo9+MH5R/ldb1QNbByXezznjXo5zjzO7Zagf
 zvV/e9+5tYio1yPE2zFudeOgjou7oOpcxQ==
X-Google-Smtp-Source: ABdhPJyYcA4ug90zs8VD1oXohXbp67GE+oYX9HyhG2qVKKg6rllJgm7PYlttiAJuvsNHPOUAcSuipw==
X-Received: by 2002:a17:902:dcc9:b0:14f:edff:7df3 with SMTP id
 t9-20020a170902dcc900b0014fedff7df3mr1704151pll.154.1645655504906; 
 Wed, 23 Feb 2022 14:31:44 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/17] target/arm: Fault on invalid TCR_ELx.TxSZ
Date: Wed, 23 Feb 2022 12:31:23 -1000
Message-Id: <20220223223137.114264-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Without FEAT_LVA, the behaviour of programming an invalid value
is IMPLEMENTATION DEFINED.  With FEAT_LVA, programming an invalid
minimum value requires a Translation fault.

It is most self-consistent to choose to generate the fault always.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Continue to bound in aa64_va_parameters, so that PAuth gets
    something it can use, but provide a flag for get_phys_addr_lpae
    to raise a fault.
---
 target/arm/internals.h |  1 +
 target/arm/helper.c    | 32 ++++++++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3f05748ea4..ef6c25d8cb 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1055,6 +1055,7 @@ typedef struct ARMVAParameters {
     bool hpd        : 1;
     bool using16k   : 1;
     bool using64k   : 1;
+    bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7bf50fdd76..dd4d95bda2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11190,8 +11190,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    bool epd, hpd, using16k, using64k;
-    int select, tsz, tbi, max_tsz;
+    bool epd, hpd, using16k, using64k, tsz_oob;
+    int select, tsz, tbi, max_tsz, min_tsz;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -11232,9 +11232,17 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     } else {
         max_tsz = 39;
     }
+    min_tsz = 16;  /* TODO: ARMv8.2-LVA  */
 
-    tsz = MIN(tsz, max_tsz);
-    tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
+    if (tsz > max_tsz) {
+        tsz = max_tsz;
+        tsz_oob = true;
+    } else if (tsz < min_tsz) {
+        tsz = min_tsz;
+        tsz_oob = true;
+    } else {
+        tsz_oob = false;
+    }
 
     /* Present TBI as a composite with TBID.  */
     tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
@@ -11251,6 +11259,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .hpd = hpd,
         .using16k = using16k,
         .using64k = using64k,
+        .tsz_oob = tsz_oob,
     };
 }
 
@@ -11374,6 +11383,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
         level = 0;
+
+        /*
+         * If TxSZ is programmed to a value larger than the maximum,
+         * or smaller than the effective minimum, it is IMPLEMENTATION
+         * DEFINED whether we behave as if the field were programmed
+         * within bounds, or if a level 0 Translation fault is generated.
+         *
+         * With FEAT_LVA, fault on less than minimum becomes required,
+         * so our choice is to always raise the fault.
+         */
+        if (param.tsz_oob) {
+            fault_type = ARMFault_Translation;
+            goto do_fault;
+        }
+
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
     } else {
-- 
2.25.1


