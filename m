Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC8B586DF0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 17:41:42 +0200 (CEST)
Received: from localhost ([::1]:57108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIXY5-0001eF-RW
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 11:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIXSn-0005Mb-Nd
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:36:15 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIXSl-0006h7-Px
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:36:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id z17so9912698wrq.4
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=zlTomEsC6jgfuL5E2VJ8p507QO9XDvOULRxbbhKQdX4=;
 b=QBIcLC5HT6W95Xs+9s3+gYB+O9f+E/zLealQJZ+Ch1jDrXdc2TMbsDOyAoC5rZyzhv
 eDAC58T5Z7+isN7DLc0NpneSxCcPElVgx7q3+h78nVFxlDcdqj71OA2GDNK3zOhKN9r2
 lLrk0VlA49JapynuFMRIx4F33VFdcfVIu+mKQaDC3K4VIyIjnWx76MGAI04I0V5b4EKD
 O1M9UIkEyDm+rGNuLTFbBBoCbZqVVIqZxzPvhFUvwOxUSxbwC8FD4R3n49Im6B7sJbFv
 HoEeFo2dRd3dzMDAj1UtPgA0XDrWT/UTqcH7pSYZ6/KHzA95POy8gkddgZzsmaYeIVF8
 JwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=zlTomEsC6jgfuL5E2VJ8p507QO9XDvOULRxbbhKQdX4=;
 b=4TgaVeiV9A43c5s5cVKRD88+e5U34ML3qSAUjICXeHbMX66ilWu4dHlRkPcrMp7ujn
 vWk793TU3gU1DrhXr3Pgbi25sFpSVAVSNwJQSbGZs4cAhy8Fgiu/zdMi0h7rUMovHFFm
 RrNUa00DUz/wmg8uL8ulX3FlnIop7QVSFLroqGiuovjcNoxGPlLXd/CXpT2j43vBYt5u
 7mv4B24PV1QVNxj03hg/SUe5hTEkH8TXvrvfVhL1Akk1pl3A5AH23ol8HZU07Eqd5MJ0
 TQplXqY0mpW7l1dfaplZZTKiBBQtVsHXAk3RY7sZqR+FTbpshwa05lkXGD+EQu05BQNY
 xVTg==
X-Gm-Message-State: ACgBeo1PDqQF/WTKQx/wA1HSyD2n/+MFY749KhtcJ708TKTo5zaIAcVL
 aE48gjXVs7CpAYB4yDWnqryEePUyOYzH/w==
X-Google-Smtp-Source: AA6agR64y/z+8cJyWQknvQ8HzSMw+oG3v0FdV+Eju8INorhnOHVS074sm4B/q0obS5qYvR44xVBXLg==
X-Received: by 2002:a05:6000:156e:b0:21d:c50a:7cdb with SMTP id
 14-20020a056000156e00b0021dc50a7cdbmr10927716wrz.16.1659368170191; 
 Mon, 01 Aug 2022 08:36:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4bd0000000b0022059422255sm7109295wrt.69.2022.08.01.08.36.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 08:36:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] target/arm: Set KVM_ARM_VCPU_SVE while probing the host
Date: Mon,  1 Aug 2022 16:36:04 +0100
Message-Id: <20220801153605.3051778-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220801153605.3051778-1-peter.maydell@linaro.org>
References: <20220801153605.3051778-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Because we weren't setting this flag, our probe of ID_AA64ZFR0
was always returning zero.  This also obviates the adjustment
of ID_AA64PFR0, which had sanitized the SVE field.

The effects of the bug are not visible, because the only thing that
ID_AA64ZFR0 is used for within qemu at present is tcg translation.
The other tests for SVE within KVM are via ID_AA64PFR0.SVE.

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220726045828.53697-3-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm64.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index bb1516b3d5a..43cd7eb8904 100644
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
2.25.1


