Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648E3312993
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:56:31 +0100 (CET)
Received: from localhost ([::1]:56170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xf4-0005GW-GP
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6H-0007iD-Qa
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:20:33 -0500
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:35398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6D-0001is-Gp
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:20:33 -0500
Received: by mail-il1-x12b.google.com with SMTP id o7so6946234ils.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 19:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o0Vd6bwYd4gneYtpxWheq/+EF/MLp77aqunUp/r0WeM=;
 b=WJPJFFmCjI7Cy+8Li3azAORG2h7v0NTSoYCGKPU0wxeofQMYxpx+oM+NkkFfA6t9H1
 sTcxABNPNNcNgOqIUIRIO4yH3MsbYh42UCft2AG13RQAC3n3MlvLGbqYAJzDEJWQFfGp
 6eppHMUpKu9KkA9ywJw+WltsQd1qLNRrpTchv1U3NkhIDJWJEPUyM+WzI0Fv4UwffVMt
 +0hyZCn6iJtzxaR/R1EAwFBA+UJWfyeSW+H0b+i7ZUYxG8wSdbbs/Pag0kRIR23wOHbK
 b+OU8mEl2PoV2nQE0l4v1GR88mqAUFBjVAyqbPyjszq8dlpGCYwt1uKTGQPaI9gKgxh2
 5zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o0Vd6bwYd4gneYtpxWheq/+EF/MLp77aqunUp/r0WeM=;
 b=KD2Wkh6cPLNyDOyEVNvd9fApU42o79hw+K3AOHtRJvQGXf6Qqal5x4KSahehU+XAUt
 XHBgHR3dYnwNqDOZZpVBGYCGmZKaNzMHfYiWO4Xo5kRkFu2y5YJFnJpVXosrB319k41M
 UQ9PVdCqQTW56KpQOD4IQMYkjrr4qgj9AfcnUKaVh5z1LEUG5uh1awiGJTKZZacBLppb
 ycezV4PRcKy5pX8fVwYWMluMSnH3rBT/Yytu8bjdy5iKJLKICQwhzkPmNj4gvEfiq/Xm
 aYzioqlVSIN2EhXV5dMBKZbh0V3znGKmC15mEYZCEfP6T2W2CBlA6EF60XoSZlFNA1R/
 N6Vg==
X-Gm-Message-State: AOAM533aO6KfQokvO4eocn2MwWtnQR0xTNxKumVMURVRlqjG5w4wq7U4
 dqArLcTfLjnTDGxZnmP8u9zc
X-Google-Smtp-Source: ABdhPJzrwo6nJvVoig7FToo6S6q1Wj8CSQ4ghJt1fet/rBDFOlB/GwYQd6e7cbiEh4XxtZADlv5V5g==
X-Received: by 2002:a92:d485:: with SMTP id p5mr12873827ilg.114.1612754428532; 
 Sun, 07 Feb 2021 19:20:28 -0800 (PST)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id o8sm8022965ilu.55.2021.02.07.19.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 19:20:28 -0800 (PST)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [RFC PATCH 3/5] Add APIs to get/set MTE tags
Date: Mon,  8 Feb 2021 03:20:04 +0000
Message-Id: <ae69254130370fff4c9a38673deb1e3a27609e9c.1612747873.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612747873.git.haibo.xu@linaro.org>
References: <cover.1612747873.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MTE spec provide instructions to retrieve the memory tags:
(1) LDG, at 16 bytes granularity, and available in both user
    and kernel space;
(2) LDGM, at 256 bytes granularity in maximum, and only
    available in kernel space

To improve the performance, KVM has exposed the LDGM capability
to user space by providing a new APIs. This patch is just a
wrapper for the KVM APIs.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/kvm64.c   | 24 ++++++++++++++++++++++++
 target/arm/kvm_arm.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 23f34034db..4a6790d53b 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1608,3 +1608,27 @@ bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
     }
     return false;
 }
+
+int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
+{
+    struct kvm_arm_copy_mte_tags args = {
+        .guest_ipa = ipa,
+        .length = len,
+        .addr = buf,
+        .flags = KVM_ARM_TAGS_FROM_GUEST,
+    };
+
+    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);
+}
+
+int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
+{
+    struct kvm_arm_copy_mte_tags args = {
+        .guest_ipa = ipa,
+        .length = len,
+        .addr = buf,
+        .flags = KVM_ARM_TAGS_TO_GUEST,
+    };
+
+    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);
+}
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index eb81b7059e..1b94dbe7c8 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -358,6 +358,8 @@ int kvm_arm_vgic_probe(void);
 
 void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
 void kvm_arm_pmu_init(CPUState *cs);
+int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
+int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
 
 /**
  * kvm_arm_pvtime_init:
-- 
2.17.1


