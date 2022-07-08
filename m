Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D1956BD0D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:51:53 +0200 (CEST)
Received: from localhost ([::1]:57226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qGl-0003Za-Rs
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjS-0004Oc-9H
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:26 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjP-0002S4-Ot
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:25 -0400
Received: by mail-pf1-x42e.google.com with SMTP id d10so9996589pfd.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vrb9+6VIoq7Bg5bHZHKrK2kLLIpATDy32zLGrACiZHA=;
 b=JsNuTco92PWee4YPTOxZ0ukqtXHhyzxdktd4+4b/Kd1wSsVzI2bo3/L2cz4Y1l8D5k
 JG1tRPfWDPYsh7IKTRnXKVADszStX9kZxLyRAfIxT13YmKT3RIwbyDoQ21UXw+VoYDd1
 MTLHstHmZrolixbWN1FI114M3lSzZLbYFIKStnfWeFzpQzcSfnXupGHUWn48oTfHvkDV
 KvUuue/nBQHHXXspVe6hNyy1ty044KC+wCF3iPe4sj56KdUTOOZhe6VCbu7iC+5pYSBC
 JIDwsRh7RsSgdqph+qudtiN1TgQW7ZQ5AgQiDzyQWVOffDQ+imRE6eAV8uxA9vbRt9b8
 23ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vrb9+6VIoq7Bg5bHZHKrK2kLLIpATDy32zLGrACiZHA=;
 b=EetKJyUP0yYCP4XPMK4IhkgtL9XMFzsAkU/lHtyr5wN0YK3TH/KtsD+rO+Gvc+/dN6
 PipyOeagCrrRhN0ndFz3/r/qpD/bDRJyBHgDk5uFkPmRpsuEJLD8Or9vNWTx0lERcMB+
 iq2m3HwkwflwVBNXICxiIcBwWIPnwlbYyKzHP5fT3iClwwr6ftNrmnhsHWgZkAXAyFNW
 khjiqpG6xvDMkuhAeHbanU1uVyy5kKaRgTA0MDrLULr/tH0JEk55d4+nx/z7B8nwvbHQ
 Pe6IkMolxFPJ4+tfMG8FRaXziHCxOety8wJbuHTmLuOWR6FjL2ZsuTBRyZq7/Ec4YJ0x
 9uKg==
X-Gm-Message-State: AJIora97xMxGDJbZ/HMr0loBjRpsUE9b+bWk0f+bD+FoNqTiHpkboypr
 bbKZgmxTSAdzgC7aji/UYYoyTTKGxhF1JbyU
X-Google-Smtp-Source: AGRyM1vA0vxevD+ZLRkTxqkGxnBMkDbcLmde48n8iOxBauRr3XWPuhRji4UjYf/i37XTvcLMDOn9DA==
X-Received: by 2002:a05:6a00:1688:b0:517:cf7b:9293 with SMTP id
 k8-20020a056a00168800b00517cf7b9293mr4523126pfc.7.1657293442649; 
 Fri, 08 Jul 2022 08:17:22 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 32/45] target/arm: Enable SME for -cpu max
Date: Fri,  8 Jul 2022 20:45:27 +0530
Message-Id: <20220708151540.18136-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Note that SME remains effectively disabled for user-only,
because we do not yet set CPACR_EL1.SMEN.  This needs to
wait until the kernel ABI is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst |  4 ++++
 target/arm/cpu64.c            | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 83b4410065..8e494c8bea 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -65,6 +65,10 @@ the following architecture extensions:
 - FEAT_SHA512 (Advanced SIMD SHA512 instructions)
 - FEAT_SM3 (Advanced SIMD SM3 instructions)
 - FEAT_SM4 (Advanced SIMD SM4 instructions)
+- FEAT_SME (Scalable Matrix Extension)
+- FEAT_SME_FA64 (Full A64 instruction set in Streaming SVE mode)
+- FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
+- FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SPECRES (Speculation restriction instructions)
 - FEAT_SSBS (Speculative Store Bypass Safe)
 - FEAT_TLBIOS (TLB invalidate instructions in Outer Shareable domain)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index b4fd4b7ec8..78e27f778a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1024,6 +1024,7 @@ static void aarch64_max_initfn(Object *obj)
      */
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
     t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
+    t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr1 = t;
 
@@ -1074,6 +1075,16 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
+    t = cpu->isar.id_aa64smfr0;
+    t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, F16F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, I8I32, 0xf);  /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
+    cpu->isar.id_aa64smfr0 = t;
+
     /* Replicate the same data to the 32-bit id registers.  */
     aa32_max_features(cpu);
 
-- 
2.34.1


