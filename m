Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C021C580AA7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 07:04:53 +0200 (CEST)
Received: from localhost ([::1]:47702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGCkV-00034y-E7
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 01:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCeT-0006FV-Qh
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:58:38 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCeQ-0002bX-Rg
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:58:37 -0400
Received: by mail-pl1-x633.google.com with SMTP id p8so12265794plq.13
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDVN6nTJJe7rCbQUwyIy/u753J7JpZeC4VTwUN/cZno=;
 b=APhM1IrpttSVx3NmqdfhpBa9QHQqWO9MHeI1Mp0npitZS5gM/fp3WXKk2x9f2Gy0Uq
 0O1mfalpAM+mqAIOVQUTy+E9XG05BfkEeWN1suY7m6CaLyBC53q773jd/sci7kHl3APp
 PUJ1HBJCUH+SNVib9az6aHQz9N9W0ycVfNpuj/s2Uj6TlR8xu3za8BV1alSZQn4dzQzv
 5qZ4+QYfEWAI510ijeheAxtQX+nowrlLEigwp6eaDd6VE5hL1c8J8RCcaWz2kOlfyxzT
 IB1Fv/27gh8igstFblkmqVk6QVGwxmp8ciGUDBF/awPxr1zywzBJe/mKnYBVA3fK9anl
 G5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDVN6nTJJe7rCbQUwyIy/u753J7JpZeC4VTwUN/cZno=;
 b=Wezebh0yyYmcDESj/a1KPHvdMEfbZqUy4M39E1C/zMPrpEtqY4TrAxYoJkC/Zt7Yem
 fcxtb1qVFH3Ksc3LxRXYB4P7r50Cdthp4qzm9YIDME3HGmxeLHyM2s49KAZ0VmPSDvU0
 pbVsusIUu0RuNrEEtSwe/htXLG4b23gxKciYRriNetIGNWuLs3uyGd1ZA75vYZNwG7yF
 mJq+dONJ+DzyopnTv+ZuyHkvrNlpdx9IlJfBpm0ATcAuRXA6cJMwqwn5Um5EQsAHskdw
 l6bFR/cwUR3lkIG0vU74doFELvNFnOImyCM0LKlNovFC2MQ/VluqXARaKl4tNuzf83HK
 Nn9A==
X-Gm-Message-State: AJIora8GhD9QYk6wXZKrhxvBRfkvlOXHpjvLKNiMl+XPwj7qXot0aoRC
 pFS9yoTtkRF1T344G15M/er6yA0Uh2sOdw==
X-Google-Smtp-Source: AGRyM1viHVib0MwNmy9t4d9diAKcYYuAWN9oS2J3ETUYKaJcuBxTZe5MCStI4Caxq2SvMA7dbYj5oQ==
X-Received: by 2002:a17:90b:4c08:b0:1f2:977:c147 with SMTP id
 na8-20020a17090b4c0800b001f20977c147mr35532174pjb.6.1658811512608; 
 Mon, 25 Jul 2022 21:58:32 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:673b:b40:a955:bc1b])
 by smtp.gmail.com with ESMTPSA id
 o19-20020aa79793000000b00525343b5047sm10550460pfp.76.2022.07.25.21.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 21:58:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH v2 2/3] target/arm: Set KVM_ARM_VCPU_SVE while probing the host
Date: Mon, 25 Jul 2022 21:58:27 -0700
Message-Id: <20220726045828.53697-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726045828.53697-1-richard.henderson@linaro.org>
References: <20220726045828.53697-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Because we weren't setting this flag, our probe of ID_AA64ZFR0
was always returning zero.  This also obviates the adjustment
of ID_AA64PFR0, which had sanitized the SVE field.

The effects of the bug are not visible, because the only thing that
ID_AA64ZFR0 is used for within qemu at present is tcg translation.
The other tests for SVE within KVM are via ID_AA64PFR0.SVE.

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index bb1516b3d5..43cd7eb890 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -507,7 +507,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     bool sve_supported;
     bool pmu_supported = false;
     uint64_t features = 0;
-    uint64_t t;
     int err;
 
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
@@ -528,10 +527,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     struct kvm_vcpu_init init = { .target = -1, };
 
     /*
-     * Ask for Pointer Authentication if supported. We can't play the
-     * SVE trick of synthesising the ID reg as KVM won't tell us
-     * whether we have the architected or IMPDEF version of PAuth, so
-     * we have to use the actual ID regs.
+     * Ask for SVE if supported, so that we can query ID_AA64ZFR0,
+     * which is otherwise RAZ.
+     */
+    sve_supported = kvm_arm_sve_supported();
+    if (sve_supported) {
+        init.features[0] |= 1 << KVM_ARM_VCPU_SVE;
+    }
+
+    /*
+     * Ask for Pointer Authentication if supported, so that we get
+     * the unsanitized field values for AA64ISAR1_EL1.
      */
     if (kvm_arm_pauth_supported()) {
         init.features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
@@ -675,20 +681,13 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         }
     }
 
-    sve_supported = kvm_arm_sve_supported();
-
-    /* Add feature bits that can't appear until after VCPU init. */
     if (sve_supported) {
-        t = ahcf->isar.id_aa64pfr0;
-        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
-        ahcf->isar.id_aa64pfr0 = t;
-
         /*
          * There is a range of kernels between kernel commit 73433762fcae
          * and f81cb2c3ad41 which have a bug where the kernel doesn't expose
          * SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has enabled
-         * SVE support, so we only read it here, rather than together with all
-         * the other ID registers earlier.
+         * SVE support, which resulted in an error rather than RAZ.
+         * So only read the register if we set KVM_ARM_VCPU_SVE above.
          */
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
                               ARM64_SYS_REG(3, 0, 0, 4, 4));
-- 
2.34.1


