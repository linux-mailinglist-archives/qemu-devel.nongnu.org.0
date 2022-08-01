Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5414D586DEE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 17:41:31 +0200 (CEST)
Received: from localhost ([::1]:56652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIXXu-0001Ld-2h
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 11:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIXSo-0005Ml-IF
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:36:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIXSm-0006hC-8I
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:36:14 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z12so4495007wrs.9
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=7TrRZP89XydMUNpJE0vVRKRxKhZa4Vn1cfpQMOwzXNY=;
 b=ziGjG+ZzRSGC2GzPgrs7Lgx31Mr3RcINHJyMatrS6pjL0r6+JSdc3832uoOEEhucID
 gix+fAFlUgGP44SVGUWCJwfC6XfynsJ6drRkE9VBovQn1FEvyHEXcNjwNg0U/qKWXcWP
 vzk384XZ8m7wG+ZA4O/D1VnFMzse45p7m082ZypBVdHaC0YUp7edYIz7QJcuK8WLOEMv
 P+RHN2GcgnU4rh7YQXvyilLOCAJ3suzBB2lWSmO87ll86t784aa484MEs7TVWHQCHpiH
 9PcxS3g5tYblyUJ0uCivva57eyBdsg+x7IBcrGDn8s2Nta3nRRvfYAPUz0+Kj5+VBbpp
 fn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=7TrRZP89XydMUNpJE0vVRKRxKhZa4Vn1cfpQMOwzXNY=;
 b=U61nhY7v4KKo9OWkNuxq+8/o+W2WhsogPfuZvb2kNgKsvtWdz9dZq8b7RNWXbStn/b
 SnZokoa80hcOZ/BliT/kE0sB7toxPEDm0gOTV6HY1Xw6HzxFQJktLwtWyvb6X1xeEkJA
 Hx6Em20iaVwhy7vh3jLnal6hOri94tIjunnxjIiBHvuB/5HTKvJwxkb8L3LpEquwMaRB
 ajy6t+C2AjfQlT2iTOK04m+wh4+DCqlQ0ouWcrsCddLUFapBJselmfsnzN0FeBpn2zuS
 nbJTG5NAUaTSmdefC2VLzteN6r/Tji05e00r8/0N60oCJQgTwf1OcHuLfm1fWRzbrgv6
 OG/w==
X-Gm-Message-State: ACgBeo3stAyXx62fa3BYeO6WpNTYa75asnrU9DBR2eVXzFGsUr7hj+Zj
 1kvtEoXp7rixjnkknCSlVm0yKGMPt0U0wg==
X-Google-Smtp-Source: AA6agR43oZ/gq9cNqDuSTmMwu/6wZ2lfOGpBZgkYHZKz8kJP4unF6BEKvQnPreAQC2fK/HsDgT4OIg==
X-Received: by 2002:a05:6000:1a8e:b0:21d:a7a8:54f4 with SMTP id
 f14-20020a0560001a8e00b0021da7a854f4mr10680740wry.654.1659368170938; 
 Mon, 01 Aug 2022 08:36:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4bd0000000b0022059422255sm7109295wrt.69.2022.08.01.08.36.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 08:36:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] target/arm: Move sve probe inside kvm >= 4.15 branch
Date: Mon,  1 Aug 2022 16:36:05 +0100
Message-Id: <20220801153605.3051778-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220801153605.3051778-1-peter.maydell@linaro.org>
References: <20220801153605.3051778-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

The test for the IF block indicates no ID registers are exposed, much
less host support for SVE.  Move the SVE probe into the ELSE block.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220726045828.53697-4-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm64.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 43cd7eb8904..9b9dd46d782 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -679,18 +679,18 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
             err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
                                   ARM64_SYS_REG(3, 3, 9, 12, 0));
         }
-    }
 
-    if (sve_supported) {
-        /*
-         * There is a range of kernels between kernel commit 73433762fcae
-         * and f81cb2c3ad41 which have a bug where the kernel doesn't expose
-         * SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has enabled
-         * SVE support, which resulted in an error rather than RAZ.
-         * So only read the register if we set KVM_ARM_VCPU_SVE above.
-         */
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
-                              ARM64_SYS_REG(3, 0, 0, 4, 4));
+        if (sve_supported) {
+            /*
+             * There is a range of kernels between kernel commit 73433762fcae
+             * and f81cb2c3ad41 which have a bug where the kernel doesn't
+             * expose SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has
+             * enabled SVE support, which resulted in an error rather than RAZ.
+             * So only read the register if we set KVM_ARM_VCPU_SVE above.
+             */
+            err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
+                                  ARM64_SYS_REG(3, 0, 0, 4, 4));
+        }
     }
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
-- 
2.25.1


