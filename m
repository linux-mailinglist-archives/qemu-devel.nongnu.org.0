Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1125611345
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:44:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPcV-0000au-6G; Fri, 28 Oct 2022 09:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPap-0008NR-DE
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:15 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPan-0007sb-6u
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:15 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso3856640wmq.1
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 06:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f817YirkWneNN5KplXBoKaZNTFIFGbGtAEQGYOkl7aY=;
 b=tlHhT//84UJ1yKYfoSHL3eBKZiIhUZINZujf7a5lhZMepJW2TkO5uzSaEkWvsOmcPD
 yF7wpkjEY9oznH3YTUmzn0vZPohFtTdb7mh7vGH39etigZipzpxE6ly8J5GocOkpMR3R
 c6I9SzTyh/pU9/IrLC0I4lPCotd8b7lvq4HYP5nnEMia1YUobTWoSV/392Fr6KJ5VW2g
 2iZWEEfB/IsxKPIBid0CLR/sg40xTp5aXI2Pc/zEBuIfe9rktnXo5OU8hXuvtLf/8hJW
 mr+PINaXFjRCXwX2lZfPXrbkrzhrc3XhOlhjeQ/YCLxj0KWXQ27GPvBLhudRI0utOAFq
 q4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f817YirkWneNN5KplXBoKaZNTFIFGbGtAEQGYOkl7aY=;
 b=NqtBjVNINuXdRDX7Q104xihn83iZ8SJ5gwhvHl9/xswdjOwye1AYbNk0+MBYwxr5js
 BpUFP3IIWflWFKLjxlixM9n2iNxBBq4m5KgYxJguuMm/Cj2IKi5I9VtkO8GCi2lI5uXa
 nD3WZShxflJjdC7QCXDKAnK64TGMLqBju+YxZzCORXIkfP/aSYMUgJHU/AS+LCogXhWq
 W1+bCixq4El2TgRlvfzdqj2wuu8f/XkptaDB36hGSFw/kGAYasVva8hAPlGBiP3gK3o5
 wZt4w8MwDudrHWNfU4iGxlmarCXixj6YrnngUPEKv1dIdl5QK+DRFyDBBzW8b+PPh3tj
 OWVQ==
X-Gm-Message-State: ACrzQf0W5AoCh+wwDU57/GZegNLl4E1G1o39fbbl559SOzLSA63d53XV
 JWH/7bKCimzw7jKqAn5PW1wwRQMk2GKfpg==
X-Google-Smtp-Source: AMsMyM7Fq5Av4HpjJ2PfsV671J7f9ybpSx9trzBQ4Yxg6gQKRqFSf4AsXIIyxXdVw/HxUaHsE/sqAg==
X-Received: by 2002:a05:600c:1d28:b0:3c6:f57d:9783 with SMTP id
 l40-20020a05600c1d2800b003c6f57d9783mr9534972wms.121.1666964411821; 
 Fri, 28 Oct 2022 06:40:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4110000000b002365cd93d05sm3572858wrp.102.2022.10.28.06.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 06:40:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/7] target/arm: Implement HCR_EL2.TICAB,TOCU traps
Date: Fri, 28 Oct 2022 14:40:00 +0100
Message-Id: <20221028134002.730598-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028134002.730598-1-peter.maydell@linaro.org>
References: <20221028134002.730598-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For FEAT_EVT, the HCR_EL2.TICAB bit allows trapping of the ICIALLUIS
and IC IALLUIS cache maintenance instructions.

The HCR_EL2.TOCU bit traps all the other cache maintenance
instructions that operate to the point of unification:
 AArch64 IC IVAU, IC IALLU, DC CVAU
 AArch32 ICIMVAU, ICIALLU, DCCMVAU

The two trap bits between them cover all of the cache maintenance
instructions which must also check the HCR_TPU flag.  Turn the old
aa64_cacheop_pou_access() function into a helper function which takes
the set of HCR_EL2 flags to check as an argument, and call it from
new access_ticab() and access_tocu() functions as appropriate for
each cache op.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5baa06a0cec..1ff91f6daf7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4270,9 +4270,7 @@ static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
-static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
-                                              const ARMCPRegInfo *ri,
-                                              bool isread)
+static CPAccessResult do_cacheop_pou_access(CPUARMState *env, uint64_t hcrflags)
 {
     /* Cache invalidate/clean to Point of Unification... */
     switch (arm_current_el(env)) {
@@ -4283,8 +4281,8 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
         }
         /* fall through */
     case 1:
-        /* ... EL1 must trap to EL2 if HCR_EL2.TPU is set.  */
-        if (arm_hcr_el2_eff(env) & HCR_TPU) {
+        /* ... EL1 must trap to EL2 if relevant HCR_EL2 flags are set.  */
+        if (arm_hcr_el2_eff(env) & hcrflags) {
             return CP_ACCESS_TRAP_EL2;
         }
         break;
@@ -4292,6 +4290,18 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_ticab(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   bool isread)
+{
+    return do_cacheop_pou_access(env, HCR_TICAB | HCR_TPU);
+}
+
+static CPAccessResult access_tocu(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    return do_cacheop_pou_access(env, HCR_TOCU | HCR_TPU);
+}
+
 /* See: D4.7.2 TLB maintenance requirements and the TLB maintenance instructions
  * Page D4-1736 (DDI0487A.b)
  */
@@ -4932,15 +4942,15 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "IC_IALLUIS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_pou_access },
+      .accessfn = access_ticab },
     { .name = "IC_IALLU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_pou_access },
+      .accessfn = access_tocu },
     { .name = "IC_IVAU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 5, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_pou_access },
+      .accessfn = access_tocu },
     { .name = "DC_IVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 1,
       .access = PL1_W, .accessfn = aa64_cacheop_poc_access,
@@ -4958,7 +4968,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "DC_CVAU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 11, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_pou_access },
+      .accessfn = access_tocu },
     { .name = "DC_CIVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
@@ -5135,13 +5145,13 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .writefn = tlbiipas2is_hyp_write },
     /* 32 bit cache operations */
     { .name = "ICIALLUIS", .cp = 15, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
-      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_ticab },
     { .name = "BPIALLUIS", .cp = 15, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 6,
       .type = ARM_CP_NOP, .access = PL1_W },
     { .name = "ICIALLU", .cp = 15, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 0,
-      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tocu },
     { .name = "ICIMVAU", .cp = 15, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tocu },
     { .name = "BPIALL", .cp = 15, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 6,
       .type = ARM_CP_NOP, .access = PL1_W },
     { .name = "BPIMVA", .cp = 15, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 7,
@@ -5155,7 +5165,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "DCCSW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DCCMVAU", .cp = 15, .opc1 = 0, .crn = 7, .crm = 11, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tocu },
     { .name = "DCCIMVAC", .cp = 15, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 1,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_poc_access },
     { .name = "DCCISW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
-- 
2.25.1


