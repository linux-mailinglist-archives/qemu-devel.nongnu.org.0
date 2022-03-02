Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE74E4CB0B3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:10:21 +0100 (CET)
Received: from localhost ([::1]:46386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWEm-0008Pk-Ob
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:10:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxk-0005l8-Iy
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:44 -0500
Received: from [2a00:1450:4864:20::42d] (port=38721
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxi-000888-TZ
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:44 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t11so4686790wrm.5
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rHPHxW6sljpCsakcbokrQfQC++We7xXTK+2WDhtOUL0=;
 b=N67SYiPlyhImI3JRyb1W6sykEJkiO7r6M9vyg7HHOiGw+KtnPUoEx4omG555LPI+su
 1DEk8+5F/KFIwiLFT8GDVeT3Ah+BUbtkKK2k6AaYdebQeMduVh4bZBcJxKnsefCIwVjp
 d3GrXCzLyDiX0Qb6p9CaTsP8NNfJLbpdmbnLWG0HJPffgdQ7dIQ8Xp9hH3rvjulvJ3pe
 UZ4ZvPH5ufEnVM+8QsfVLbpjaCKcaXnIy1othTGcd/L2y6OEHPSzMvCd6oSJWakSyedM
 5f3rDqHhiDwSjXjxbHzXzpejx3C8dm7Z3xeBjXbGhEfTgb2RmTYeJik13ssUc4XkHrGB
 mUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rHPHxW6sljpCsakcbokrQfQC++We7xXTK+2WDhtOUL0=;
 b=5OfSRBPRPrtuvXPWE9+H2fxF7r+RiKFeLIZy9P17G00BH09g5Nkj5zxhHOv1Ft0jU4
 jgRTrqNPTxLjQrEUGgT0zmMKjN7ZOL9+S12l3lOw+en6ux0YcZTeipG2p3vEFfQstM9q
 ymZYlowrW92O33F6SN7CpG/meudb5v1KMGs2M8GZodi1tqll5w8Bashlvb+VgCxABhcX
 tn/o+90cIDCEMcyjfT82TNXrGsGvdh0rmKDONx70o3XNWZ+TfxdvKAqhNpST3sBvfGP5
 p1RF6ATzM8JY78umvtQ33s9njHLfZcc1SWm65Ndeckn6EEkP6wsjTaC/SxC5kLGnlGtn
 0RLQ==
X-Gm-Message-State: AOAM532guJXHXD0AZFLk34/Gp5PDRgZ4kd0peQiutGH6L3YmRl+Tpdd4
 9x4EbmJna3ONqpzdNlsfhiV8/13rKWaHSA==
X-Google-Smtp-Source: ABdhPJwuefe3i/LgrN7LaE3xzwdwCsCW4+59GmIP3mcNRWLfel+N6QsLGRwxgDR3Vt/U3Nju9ivmig==
X-Received: by 2002:adf:fc89:0:b0:1ef:9517:c7d2 with SMTP id
 g9-20020adffc89000000b001ef9517c7d2mr15905625wrr.282.1646254361625; 
 Wed, 02 Mar 2022 12:52:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/26] target/arm: Fault on invalid TCR_ELx.TxSZ
Date: Wed,  2 Mar 2022 20:52:14 +0000
Message-Id: <20220302205230.2122390-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Without FEAT_LVA, the behaviour of programming an invalid value
is IMPLEMENTATION DEFINED.  With FEAT_LVA, programming an invalid
minimum value requires a Translation fault.

It is most self-consistent to choose to generate the fault always.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220301215958.157011-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h |  1 +
 target/arm/helper.c    | 32 ++++++++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3f05748ea47..ef6c25d8cb7 100644
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
index 7bf50fdd76f..dd4d95bda24 100644
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


