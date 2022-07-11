Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58639570619
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:48:44 +0200 (CEST)
Received: from localhost ([::1]:45872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuiJ-0004rB-EP
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvn-0006ld-Rt
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:35 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtve-0002tx-QA
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:35 -0400
Received: by mail-wr1-x429.google.com with SMTP id z12so7128287wrq.7
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZwtZ0mOyj+i0qaAFT/4uFTt0YWVAMrJV8kc5O+TbtwE=;
 b=QGTTcMZmkej+fjiCrxJvx4aYKpCuXmizgk0d9HxtBzDZhElvj0tWboQIz5hxRWexbw
 LzJJRUBfHnW9/KnOjzW16Nf113iN4gXahguzh8cGbguioUY3sAgo6p0zXOf6K4Zp8oBj
 66QVJI3MQeU5I4wwSDuuU5AWsUGUu4Oy0pCI2+pNiDWG7jCOv6M5RZ1NQNI195PNlsDp
 b/v8FEChoobpla6MlX/9krt8gqpwoMCzKZ8EVziT4qUBYZXBYoaXIg+0nDKRKS/lvI8Q
 M+VQikK07sLvKjiQJpJNbvwdz3DO2CJIrSqFUR8yZpLT4X6QC2CTLD0RBgeGyoocLtjF
 1e+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZwtZ0mOyj+i0qaAFT/4uFTt0YWVAMrJV8kc5O+TbtwE=;
 b=bMdUlkrcI4pGMlK9dpLl5w7EHCbeiHogjkzptZNBi4gyVonKqaU39TnxGP1YoVWBXE
 JQjxie4qMBQZsQzOaP0wIWx+6/ZlDTgGEqSR78/WPkhnE/yUTBHNnnEHubOzw7QVexJ1
 K8n6wnTN+f54doaTAJCOYioMAT37SqoMpvN9B9F2FQ+AbSV6Gj5M9Qg7QEiQRVmkuriL
 l588An51OstB5cAEogj4kecAFKfYYojVVaqYJFBd4ZHAGr14+Ezt62HABvbtCk40qOUV
 x0FjnDiA+Mgghy1wvuwAYIy1YahQoz/s/3/+y+EseJ++bwovbEvB3FsrO+yxOmOlnu3Q
 QySw==
X-Gm-Message-State: AJIora9EW4euasgFk2KmfzfkhoZF84GYiDkJaB89Ec8f/xhsHNJAPpom
 XNZNDNRA/Tz+dN6vSrOy3jT0GHBUtDLGSA==
X-Google-Smtp-Source: AGRyM1sXJAw2UE1gkyDfifrQwVNNz0gYlbxlaxn8QDJtTLC46pJgZSSJZlVC3UA+3H7Hh5yqCykdFg==
X-Received: by 2002:a5d:5983:0:b0:21d:a811:3b41 with SMTP id
 n3-20020a5d5983000000b0021da8113b41mr3757215wri.441.1657547899456; 
 Mon, 11 Jul 2022 06:58:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/45] target/arm: Enable SME for -cpu max
Date: Mon, 11 Jul 2022 14:57:37 +0100
Message-Id: <20220711135750.765803-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Note that SME remains effectively disabled for user-only,
because we do not yet set CPACR_EL1.SMEN.  This needs to
wait until the kernel ABI is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-33-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst |  4 ++++
 target/arm/cpu64.c            | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 83b44100659..8e494c8bea5 100644
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
index b4fd4b7ec87..78e27f778ac 100644
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
2.25.1


