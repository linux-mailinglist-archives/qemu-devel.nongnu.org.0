Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E639523E8A2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 10:14:03 +0200 (CEST)
Received: from localhost ([::1]:51198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3xVq-0004J8-Ux
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 04:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k3xSi-00077u-EJ
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 04:10:48 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:46971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k3xSf-0001i5-Qe
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 04:10:48 -0400
Received: by mail-il1-x142.google.com with SMTP id c6so1053809ilo.13
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E4Z1kCiUrBimgEjKsiAAuWvSYrgx0uM3+pFLTYp+Tfo=;
 b=cJ/kFwfhn0FpSeVU1gWECY0BMOHuLuuuFwU84PSbXIGANz1yeQ6pVm/aNOrqlW3l4d
 kdb+Fnx3KFnZgwbFN9kJ0cmu4dde0Zf0PuydYkpx+mca88+DoEDbWpEmCaqXLQYGx2vL
 x5MWt2JB4xazsZlIpjkeQc/McsUDBrfiJaAmOLda7mPwls1in12KEm6hG/lErHNrO1DB
 VT3EikXKtjMEn/rGn8Ff4gEEVYWFjMsFsDkAkp1A+7SsaCdOmicD3N0UTdi+gVXSYZSM
 MVvL8ZgiVNjoFZf4FbdYJNUVwYi6fivUJ0BQ35/3iw+vnl2kJhG23rZeA9egmbDq9+23
 7vFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E4Z1kCiUrBimgEjKsiAAuWvSYrgx0uM3+pFLTYp+Tfo=;
 b=Ogawfm3SMcHfjoTlKTuSrYTSdaMIVWd1hMBSW3J0PINUXDmNgIW/Nw1dMdwEhPEfh4
 siw+PuBvHdNhFqwd7GtHYxI9haCD7EyTudlwU47ONBFiN8KdkYeiUiAVPfMhtYMYWdBC
 KcpjSRRPZ8WYCCOdAZ+noNQuw5RjcuMjajKMZzRVdLAojaOUhifZBgzkCTf19f1eeCp6
 vmXawTiRIW8W6Ez4/2CsVIEhPPrqaA5cPBREujngOdf2X1IUeSGeMUvSM3YZbIwkJ/xx
 ST1uxNDhTQcDsX0s04EViuPgHMUBz/R5Q3XDoQkvT20UwGx7ORSbuX0DWnmCqdrkwLKg
 SNuw==
X-Gm-Message-State: AOAM532I2AvN5x76TQtubQ3YP3CvtSlX/iYMy0A6eRkSAjSL4i2atDFG
 2YT93P41k07ZZmmbAdmf5/Fe
X-Google-Smtp-Source: ABdhPJym7Jpp+wNdWcugx3gTAJGFUYcHMHQrI4WU5hi1n9YUsb4RayaeBOrVEIbbSiHg4h00q/cyZw==
X-Received: by 2002:a92:cb07:: with SMTP id s7mr3206988ilo.58.1596787844820;
 Fri, 07 Aug 2020 01:10:44 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id l144sm6233546ill.6.2020.08.07.01.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:10:44 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH 5/7] target/arm/kvm: spe: Add device init and set_irq
 operations
Date: Fri,  7 Aug 2020 08:10:35 +0000
Message-Id: <3160507b3f981c92857d3234468d3de1dd352a03.1596768588.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1596768588.git.haibo.xu@linaro.org>
References: <cover.1596768588.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: drjones@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/kvm64.c   | 33 +++++++++++++++++++++++++++++++++
 target/arm/kvm_arm.h |  5 +++++
 2 files changed, 38 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 75a417d65c..be045ccc5f 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -450,6 +450,39 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
     }   
 }
 
+void kvm_arm_spe_init(CPUState *cs)
+{
+    struct kvm_device_attr attr = {
+        .group = KVM_ARM_VCPU_SPE_V1_CTRL,
+        .attr = KVM_ARM_VCPU_SPE_V1_INIT,
+    };
+
+    if (!ARM_CPU(cs)->has_spe) {
+        return;
+    }
+    if (!kvm_arm_dev_set_attr(cs, &attr)) {
+        error_report("failed to init SPE");
+        abort();
+    }
+}
+
+void kvm_arm_spe_set_irq(CPUState *cs, int irq)
+{
+    struct kvm_device_attr attr = {
+        .group = KVM_ARM_VCPU_SPE_V1_CTRL,
+        .addr = (intptr_t)&irq,
+        .attr = KVM_ARM_VCPU_SPE_V1_IRQ,
+    };
+
+    if (!ARM_CPU(cs)->has_spe) {
+        return;
+    }
+    if (!kvm_arm_dev_set_attr(cs, &attr)) {
+        error_report("failed to set irq for SPE");
+        abort();
+    }
+}
+
 static int read_sys_reg32(int fd, uint32_t *pret, uint64_t id)
 {
     uint64_t ret;
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index f79655674e..bb155322eb 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -348,6 +348,8 @@ int kvm_arm_vgic_probe(void);

 void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
 void kvm_arm_pmu_init(CPUState *cs);
+void kvm_arm_spe_set_irq(CPUState *cs, int irq);
+void kvm_arm_spe_init(CPUState *cs);
 int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);

 #else
@@ -397,6 +399,9 @@ static inline int kvm_arm_vgic_probe(void)
 static inline void kvm_arm_pmu_set_irq(CPUState *cs, int irq) {}
 static inline void kvm_arm_pmu_init(CPUState *cs) {}

+static inline void kvm_arm_spe_set_irq(CPUState *cs, int irq) {}
+static inline void kvm_arm_spe_init(CPUState *cs) {}
+
 static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map) {}

 static inline void kvm_arm_get_virtual_time(CPUState *cs) {}
-- 
2.17.1


