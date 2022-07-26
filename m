Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F90580AA9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 07:05:00 +0200 (CEST)
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGCkd-0003Dm-H7
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 01:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCeV-0006Fb-6U
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:58:44 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:43898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCeR-0002bi-5e
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:58:38 -0400
Received: by mail-pl1-x632.google.com with SMTP id y15so12283933plp.10
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=emSFyLsiKiz9IhTW6WmW8M3rFKM7w+1zQzDRk8176ug=;
 b=JVkZgxXg+61wUQ+htk4SFkSLrq1sPlvbxNnzaXlrtMlVX+g9TLB6DFl3QPvfB77013
 bzpaEKTYDwMUpu8EhCxhHIbaud6S8kSOV0ZM/ph7U5HJS0zCk4IMy9x1hSNKI9Dno3KW
 oPPF1hs+5080+fW7LD12TCjREWn5UKdhPhul8OEkLAl8krfP7suZvWPLF9vC0qhCbu6n
 BoVjBtHS5b9509ucYcJtdhN11yebYIpkXnmzaEAMSUSqUf2TqIteCyPFVY0QSBU3oElC
 IZ6t1+JLQf3f2pCpSh9kkMOqC4SC+urZtVjmm9kXuJ5jG7PTmhPMCLaqkeQlLS3bRF8C
 S4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=emSFyLsiKiz9IhTW6WmW8M3rFKM7w+1zQzDRk8176ug=;
 b=iqRoCLL0+h5MgeVoq70TE8IQlbJCBXknk8OL9eBatmCgLrFT9EZppDtUgpcMl3mK6+
 aHpQ9AKd38nvrDI+mehApPWrh8/k97MvMOEFGaNm0hKGN0lMa+M1i2pXkCRNsYACOLXj
 +UMop0jw3OOWTCBd32CxnJicivHhdLbqPoxrL0DsDPjV7I/bqJPWLqFPBc1U+PKf8HeH
 wZUrKWHXRxxTZ8cKBk0hvwothXHZX5ClB+YArqI+zCIdiGRb3mQ8c7/EwUCtoRDaIs1d
 CqsIxttFqA6vivRZbAd9cgsz/8A/A4EKDHmYlYg/ANn3z68AW1HybMJnnqMLTGIidvGW
 4RbQ==
X-Gm-Message-State: AJIora9+gKYy8wWUtMvYjqdDQtPAcHZK/pzqZ68WYeiuemYSegI89JqH
 vOrPxDPSXHQUmHVSxCLAdWao8prz2Xqdxw==
X-Google-Smtp-Source: AGRyM1vJw+pVOGA9S8JirJ/1J8VVNh649qzra7x3u/wtiKTY4doef2dZ/5P3ADQXDiSOoosONxFZ1Q==
X-Received: by 2002:a17:902:a586:b0:16c:3182:a9b with SMTP id
 az6-20020a170902a58600b0016c31820a9bmr15115484plb.44.1658811513688; 
 Mon, 25 Jul 2022 21:58:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:673b:b40:a955:bc1b])
 by smtp.gmail.com with ESMTPSA id
 o19-20020aa79793000000b00525343b5047sm10550460pfp.76.2022.07.25.21.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 21:58:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH v2 3/3] target/arm: Move sve probe inside kvm >= 4.15 branch
Date: Mon, 25 Jul 2022 21:58:28 -0700
Message-Id: <20220726045828.53697-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726045828.53697-1-richard.henderson@linaro.org>
References: <20220726045828.53697-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
index 43cd7eb890..9b9dd46d78 100644
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
2.34.1


