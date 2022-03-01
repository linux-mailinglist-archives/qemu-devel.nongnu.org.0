Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857194C9833
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:14:25 +0100 (CET)
Received: from localhost ([::1]:32842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAlE-0005sE-IV
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:14:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXY-0001Hb-Sy
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:16 -0500
Received: from [2607:f8b0:4864:20::102f] (port=38906
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXW-0004xE-B8
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:16 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so3041953pjb.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8FniAxzNq9R5C3PUa8crK2rtgbWJQ/YT25+L7bxil2U=;
 b=xH/MpwwsEx7tCCiXBux6CW1bncqLIT+/ndlXh6/VUdnO9JDYCi49WGBcxCb4Ff9cg9
 cGQVTbgkSMc0iGGhcaS67Z9aFwS049ZkYHV00jdjYMFHGgM3QSQRhWEGsWlYWvg/MIcj
 4KMNYt0VjSomcKespNRQxGPBwMdYR0veGZsk9DhkvLyigPTL3HRLVJDwt7uAIT6Axb9C
 VHg/4VbbbjKV+oEDi22MbAYs7hB4ND1bf82TXZtVPzOB8WRen0bdEEHJWKdAo65tQvcD
 IVNaNOlXPn9UUza3tSVBfiwaTgLDqty63Dg5D1oz/n/ecayciiC7eztu7JTiDrOpLQ/k
 I2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8FniAxzNq9R5C3PUa8crK2rtgbWJQ/YT25+L7bxil2U=;
 b=VMhMjvpvq4sMwS1h709vSMcOMGgm6LC+95rtp3rmQKtnInfkVmzquxRkvpWZo0wqUf
 Kbtu0oBzUkwfhENjJfpa1sLVMagSBMxw4mQtgM84uDTUUVR9Ydsn2aiRjFlUw3KPWQgG
 x26R91AM0gYR3xEV5rcnRzPS4BKSYaoclRCKKk4xnidtmcKCXpI5GLqCGHw+Bi2k8uMY
 1mGXrSERLsACHCNo6Igs7jDo8lHDCr0DKMcvq0IT2j33z+9uh9UeFNcd0wQUuAq+KbYI
 FgyF7vNhS6I+0XoiyJ0U6AZnj5VIHmerVTF7EvTnJB36mifrBREcE3ESJEGgqF/LnS2p
 xxgw==
X-Gm-Message-State: AOAM532skKqvaC+9tsZwJYMm4mbyENTT5zaAQvvAepaj97/zYiZoJuxs
 QNHgJ/GV4SWHW9VPF1vZ7U1exKOAdy+hzQ==
X-Google-Smtp-Source: ABdhPJz1hB3YNJDKth1KuNTqtMV+kDRRoc9OVW6y+XDQNOPf/xXqE7rjPLWiYrT5ekrgRLO3vvv8QQ==
X-Received: by 2002:a17:903:24f:b0:14f:73fa:2b30 with SMTP id
 j15-20020a170903024f00b0014f73fa2b30mr27698588plh.174.1646172007947; 
 Tue, 01 Mar 2022 14:00:07 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/18] target/arm: Fault on invalid TCR_ELx.TxSZ
Date: Tue,  1 Mar 2022 11:59:43 -1000
Message-Id: <20220301215958.157011-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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


