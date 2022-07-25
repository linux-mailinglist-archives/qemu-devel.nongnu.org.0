Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6DC5803F2
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 20:22:35 +0200 (CEST)
Received: from localhost ([::1]:33234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG2iv-0003AI-UH
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 14:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bp-0004mj-8q
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:15:24 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bm-0005qS-HF
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:15:12 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 p6-20020a17090a680600b001f2267a1c84so13418202pjj.5
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 11:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RMuYv4EVFHYkxhumjJ2SxEr+kwKlkg7raeV+cD/IvUA=;
 b=gdkKLSsn67CGhJcgVZK6E1oznK8FiA2GeWq8C5g/ShfoaiPh7tWV3dMdpTGb1uKEhM
 x7adCPIMCKbE5h1nf3LOQkd95D8YEruVYo76URWAmy/PN/RI0poGBdafZYcoUhvarlQX
 tYD8TMikMYuxhi2hNttDdklf909MIQcgxZepLxEn+pzn/+9SJV4c/IDYGaKqnVGg1Dk0
 jVcbdRRf7hQbilgjF6YK8/M5SBTHlQavxHu5AMhCclx5MqzL0kGntA7w2KTvF+ijPpFN
 yEJ+OGdg7R1KfOpfOJ5+E1QFVkdluph/gvw4aNR80bzghkcqrd0LiBEyvF9EqtYCOFG2
 7oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RMuYv4EVFHYkxhumjJ2SxEr+kwKlkg7raeV+cD/IvUA=;
 b=YKbj3oJPfr9PxPIw2rKmkE6VSH7M/np7ey82IUin3dV0cFkgSIIxOqbGCfzDZOnEnb
 ZvEiE3Ca+L3F228x0arEC+29VXHlywvvuHQ1d6iPM/+h1wxOuwXULsBRWjmqVQJ0zJX8
 zeYmCkh696+pwMvIQ68H7pTxBx8HgVDQXUpHLbDX+lo+YpAm8VQ+NokUEjHs1sYj5b1I
 t83GqOAl+X3dzpw8AV6ziNiy3IAGdzU/BfA8A42YtrKIL4rDYubVmHK2/yPLZd30gWtI
 n+Sd82wFPDSjam1j6gEtWfJRrt8AFC/I+v2a8iCYHqiagc2wT1FzIj1ykcrpHP9m6oDa
 yzgw==
X-Gm-Message-State: AJIora8ZusuiZFuAmqvzY4R9m/IiuXXdUh0Y5kMeqeiPaUw8+pPnydsT
 2CuX/EQlJx2XCcO1ZontbwBlXykUq7fEpw==
X-Google-Smtp-Source: AGRyM1uV9VK9jpy6AJF2jPFpKKvHyzcfdAZx+xKOrsk9bVr6s/uggvaXdYXvr3lcxFhWvNBP2/wrUA==
X-Received: by 2002:a17:902:8b88:b0:16d:2a70:26d9 with SMTP id
 ay8-20020a1709028b8800b0016d2a7026d9mr13502777plb.84.1658772909150; 
 Mon, 25 Jul 2022 11:15:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:30c1:2484:a853:233d])
 by smtp.gmail.com with ESMTPSA id
 bg5-20020a1709028e8500b0016d8d277c02sm1125004plb.25.2022.07.25.11.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 11:15:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH 3/3] target/arm: Move sve probe inside kvm >= 4.15 branch
Date: Mon, 25 Jul 2022 11:14:57 -0700
Message-Id: <20220725181457.41083-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725181457.41083-1-richard.henderson@linaro.org>
References: <20220725181457.41083-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

The test for the IF block indicates no ID registers are exposed, much
less host support for SVE.  Move the SVE probe into the ELSE block.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 8b2ae9948a..bc3d7d9883 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -684,18 +684,18 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
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
2.34.1


