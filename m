Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507BA5803F3
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 20:22:44 +0200 (CEST)
Received: from localhost ([::1]:33642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG2j5-0003RX-Ar
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 14:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bo-0004mh-82
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:15:15 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bl-0005q9-E1
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:15:11 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 g5-20020a17090a290500b001f2ea602563so258065pjd.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 11:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N2OJQKKwRLRjFx/fh9iTaEVWiqAoFPuSiTt6AYqCB48=;
 b=k4z62w5IpFLty3Sy7/0qLGS4SWQO4CjNegPSxpWly3VcZf0kSa3MzwL3M4+34CbLqa
 LhO166wyO+M/MVMahHYFFxJ7H01JznqF9r7NbhAoioPy8vi9YSASVFtEPlklaj2an2Ss
 k7UVdtb1Fj6G2gCTDMlP9X+a9TkrSxAzHGuPy5+jg0MDCHDYzOFw6FbNTTlnudA7DtJ6
 OtjUVMv1N3d6Jfq/JvRFU2b1uPxtJqq0G4qoFUw3/AUtEn0yLFJ+BJsAiB3nyZeGoFDV
 et2p2QvXUaNQjN8F4Mz8I9sZMaBu23dvZo/mzJA0lJBnyKfNKDjAHuniH6cnJC1O9xsP
 SYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N2OJQKKwRLRjFx/fh9iTaEVWiqAoFPuSiTt6AYqCB48=;
 b=56pmWyb669X1tRtuKN9v9VAQPhi7jyY4FQrm3+oWduz0WLhqh8xVzAD071uAwXwR1O
 j8nblDm1ZD5wQTH2sqMBDlNhDagR8al/ZdMYl/PW6td7w6ZETVb41Phg+IiystrEWu70
 SzJH5LhT8t0paxtchAfx0phktZMm2wlTRkzpnQnBYUtycLMI9H0cH+Zs53S9yOyeIWQB
 U34rPHEZhM2wtNgS5v26ms8C6ojldB3ooVhD2eTquaxXHN/0eF5v8gYd/vpFlM1GZF3f
 vKrZFHQ3SpXAQao4HWWmeBQlzJ+5fqWXRuSfnkaqstuwDdaCJ07dAoS8Jv7Zm0Ca3Jil
 IY5A==
X-Gm-Message-State: AJIora+l42+gbj3fV3o9FozSBZDU+2F2GAJxioe2YzP8rOJTtZCVdSKN
 xZKeCVGh3G/uTeh1YijtT0dLg6T9kzdB8A==
X-Google-Smtp-Source: AGRyM1vNlm5NJPRWRznEPLaCoFG+T677SB5++0X1+X8SW8/nlaPXr5Pw+es5HEDBMdyFVYE67OT72g==
X-Received: by 2002:a17:902:ec86:b0:16d:6424:efb2 with SMTP id
 x6-20020a170902ec8600b0016d6424efb2mr9952698plg.62.1658772908058; 
 Mon, 25 Jul 2022 11:15:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:30c1:2484:a853:233d])
 by smtp.gmail.com with ESMTPSA id
 bg5-20020a1709028e8500b0016d8d277c02sm1125004plb.25.2022.07.25.11.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 11:15:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH 2/3] target/arm: Set KVM_ARM_VCPU_SVE while probing the host
Date: Mon, 25 Jul 2022 11:14:56 -0700
Message-Id: <20220725181457.41083-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725181457.41083-1-richard.henderson@linaro.org>
References: <20220725181457.41083-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 36ff20c9e3..8b2ae9948a 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -512,7 +512,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     bool sve_supported;
     bool pmu_supported = false;
     uint64_t features = 0;
-    uint64_t t;
     int err;
 
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
@@ -533,10 +532,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     struct kvm_vcpu_init init = { .target = -1, };
 
     /*
-     * Ask for Pointer Authentication if supported. We can't play the
-     * SVE trick of synthesising the ID reg as KVM won't tell us
-     * whether we have the architected or IMPDEF version of PAuth, so
-     * we have to use the actual ID regs.
+     * Ask for SVE if supported, so that we can query ID_AA64ZFR0,
+     * which is otherwise RAZ.
+     */
+    sve_supported = kvm_arm_svm_supported();
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
@@ -680,20 +686,13 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         }
     }
 
-    sve_supported = kvm_arm_svm_supported();
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


