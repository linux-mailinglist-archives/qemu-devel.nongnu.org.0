Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEF24B044D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:14:01 +0100 (CET)
Received: from localhost ([::1]:60714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI0qG-0006hv-VJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hK-0003vm-5F
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:04:46 -0500
Received: from [2607:f8b0:4864:20::432] (port=34383
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hI-000471-9q
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:04:45 -0500
Received: by mail-pf1-x432.google.com with SMTP id n23so8041439pfo.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 20:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M9yoHlP5X1aUjQ5+XqVVCuvodgZ7D3QrARDveNRnzPE=;
 b=vf+owxysXq1AM8pznsPiJhfGf5bzg13BCYLoIW72rwX1LVmWb6NA8lfNEOVK8S8LfU
 hBq4Q6BEi+wzv+dYGJ+gAnYw12glXMpkRhrp/W4BqQllWoCzgj29AyU0H/ShS0OKJ9La
 d+2hqdHAwFq4bIqK6jeKpW5ZYOMsaOzPEVm8oIQpjF1i40DNInxKTxnIr4IJsxjB1von
 vCNJwPdHfU/AFWfF/ufjNOE1ps18kLYH99FY6YOnTFrHieAxoapVux2nHeehYem5GmG9
 FYCChhUaHgRniVdzSp6AN5zuntC91PBvEWDp9UkdhIyyynPmXuLau562rN9thkPi+CGe
 UUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M9yoHlP5X1aUjQ5+XqVVCuvodgZ7D3QrARDveNRnzPE=;
 b=fCX/jig1OpXovcX19jzSaAXb17J7OWZBbjkq67DQlU+fsDvJPiCv3C8JjddrL/A8Yq
 VXg7g/nl+Cdb8+9I+S4qloJLMMN4PpVXH6NJ92dtL+XX32kjECqH4YfgdPuQeyWTtvBY
 6pC2pZfXLeun3pA6H96xFuU/bfjJ1ffEz1v798rr1kWntWalMcLC3pkKEC89zDwTCL9C
 DCKJVf2btmDgqUzkDU6im0rV/ieISOnODZLr1Do+bDZBP2pJfWUeo+ceoUPUkcl1DE8a
 JMlyqnwzpj+qLaCjpugEfIvWrcNTqNE8biKf/GT4PVraG/PHhhfu30g1SG34ggA8m34B
 lyLA==
X-Gm-Message-State: AOAM5310bai82Z4c4QkxSBFxpNpUd3q3Mn3uZ/mjxHgfebw5dzgAM1DV
 KvtiKU69bG6uqJWLzM0OSoUCVe5ER9siqexY
X-Google-Smtp-Source: ABdhPJxwuJRTtkamHJ5ua8gbfdP8Ie6ONFkd9QPWjTYg24XnoQwfY1gtqxwHZwRIfQeCeMIEV2ZtFg==
X-Received: by 2002:a05:6a00:98e:: with SMTP id
 u14mr5590601pfg.12.1644465881227; 
 Wed, 09 Feb 2022 20:04:41 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:04:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/15] target/arm: Fault on invalid TCR_ELx.TxSZ
Date: Thu, 10 Feb 2022 15:04:11 +1100
Message-Id: <20220210040423.95120-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Without FEAT_LVA, the behaviour of programming an invalid value
is IMPLEMENTATION DEFINED.  With FEAT_LVA, programming an invalid
minimum value requires a Translation fault.

It is most self-consistent to choose to generate the fault always.

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
index b5f80988c9..14cc866d8d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11188,8 +11188,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    bool epd, hpd, using16k, using64k;
-    int select, tsz, tbi, max_tsz;
+    bool epd, hpd, using16k, using64k, tsz_oob;
+    int select, tsz, tbi, max_tsz, min_tsz;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -11230,9 +11230,17 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
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
@@ -11249,6 +11257,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .hpd = hpd,
         .using16k = using16k,
         .using64k = using64k,
+        .tsz_oob = tsz_oob,
     };
 }
 
@@ -11372,6 +11381,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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


