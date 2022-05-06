Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CFE51DEED
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:14:21 +0200 (CEST)
Received: from localhost ([::1]:45264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2T6-0007lQ-4G
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IE-0005oX-3O
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:06 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:34382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IC-0003pP-Ba
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:05 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 i25-20020a9d6259000000b00605df9afea7so5424900otk.1
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BIWTkf1wrFK+RU/H3vuJZSVWXtZJEi+LVYp9vG7Klf8=;
 b=O83STiUUpUG4Loe8aD0NnL2XQD2Hz6AR6fXtJsao7086nBfCjp5KZo7PE23oDVPqeZ
 3doZxdEs5D9QpUrIYvTVFwrUurW6yI+aANrAuMCtldSl9xeU8LnX68EZbWZ5+aDZKLKe
 ghBnZzpA8NhPMPu2vVvDxsPSVXMeVa8A+thEW+set7U6mTgdvSoSP+rfi996/1CAmkmm
 tXp5M/CN3/fnnz9gWvvn9Dkc6eP98iNb/uJ64pc9AcMsmQce7i6HKYrkDu4/zPURRw9X
 3BSGeeRk90xHhtKEkwsDphVml2owLVZmVmCcbFqyBwiNsmQxAPax+m9bAFU91k2ImMRh
 RHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BIWTkf1wrFK+RU/H3vuJZSVWXtZJEi+LVYp9vG7Klf8=;
 b=srO4Vep+12VWiBJa/sYBGwSe4EXSG/FpXe5KY7vI8RxYoUFC2waHwGuRmGFpdGQgUP
 rwPxKFKY2+e6bdHdWjYT8F13PGpgqV4eyVYlwxW5sk2eaOzm15R5UGIEvdfeu7uk7o2T
 igs2BVbcaTsz2EFhk+rm1iaxjxxpLmghenY9I9wiBYVSyBW6J7/dWbGQPMAvxO+iy8Oj
 etJM5nkmZZqRA7FAG+ynveQf8XzXhQk5BHRa7qA8cHul4jh/MfLZHyXmI56MsDrLKa+e
 cLuse/BJfhbLRuv3L4fadrk9jCBFIw3ZIaodx8lScHcyzUCT0IH349OU6O/C4cFDRD94
 q8DA==
X-Gm-Message-State: AOAM530wo4xTPQAXwKuTu+Bf4lv5BWxoAKF48JQjpSCzE6j78KRjY38u
 dEQo/mSdFYcwpIYijoFlEIAdEcO76qvWHutA
X-Google-Smtp-Source: ABdhPJzjgcXxkYv3FnBI8T85iXGy5p4w9asyNfwxMpDKCWv1N4dP7QJ96VIqXYe+rTrNuq0zCaLZNQ==
X-Received: by 2002:a05:6830:12d2:b0:605:e67e:edc5 with SMTP id
 a18-20020a05683012d200b00605e67eedc5mr1483232otq.326.1651860183672; 
 Fri, 06 May 2022 11:03:03 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 11/24] target/arm: Enable FEAT_Debugv8p2 for -cpu max
Date: Fri,  6 May 2022 13:02:29 -0500
Message-Id: <20220506180242.216785-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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

The only portion of FEAT_Debugv8p2 that is relevant to QEMU
is CONTEXTIDR_EL2, which is also conditionally implemented
with FEAT_VHE.  The rest of the debug extension concerns the
External debug interface, which is outside the scope of QEMU.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu.c              | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 2 ++
 4 files changed, 5 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index c3bd0676a8..965f35d8c9 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -14,6 +14,7 @@ the following architecture extensions:
 - FEAT_BTI (Branch Target Identification)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
+- FEAT_Debugv8p2 (Debug changes for v8.2)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7995ff2712..2667aaf28b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1806,6 +1806,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * feature registers as well.
          */
         cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
         cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
                                            ID_AA64PFR0, EL3, 0);
     }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 5fce40a6bc..202fd5c46e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -799,6 +799,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index bc8f9d0edf..b6fc3752f2 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -76,6 +76,8 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
-- 
2.34.1


