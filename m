Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86F74757DE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:36:22 +0100 (CET)
Received: from localhost ([::1]:45604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSa6-0008Pt-12
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:36:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRii-0007K7-8F
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:12 -0500
Received: from [2a00:1450:4864:20::429] (port=33682
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiW-0008QA-Fp
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:11 -0500
Received: by mail-wr1-x429.google.com with SMTP id j9so5247582wrc.0
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4nPJwOh5yptV6qB589WsMaQo4rGNTXm5s0QSiyJipoM=;
 b=ST3jK+HyBGIssI22KZsa8Ve5MwdvyH1Lg6EzVLbEM3So83xhy+ro4JjLJSw1Wx7UYy
 Tha2suvLTYKtlS5EUcg5q5JD+PMWUhEMUif4ahFDtYSqkqf5J04dJr42NECKNEKMDWvn
 2uc5EA8kmyzT7fCC9tp06A/t1vzUretQdB9Ck6J5Yujm1UEXpWxSgDSuKGvjnrNNf4dR
 GKk7HQfqbnUNRDOzDb3ARonBMWUc4ytoBeBpWXPRsJuWlRDOiXrii37avsebxV36iyLH
 quuP42DJeDndnh5CWrHr5vjQG4dXEYH2JjMwMx2G80F2qDQ+pORae/gATk8M6a5PVpkf
 iD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4nPJwOh5yptV6qB589WsMaQo4rGNTXm5s0QSiyJipoM=;
 b=O3CoMWwGmJlfqgs8SsMlZdC2Yx/5v47uwC/gvpD2bG6IhkF6Xs2yxbqaNpRkYpouJZ
 mqk8vu2KEKzrC3eSR1qGUBzpNasdoABZlrmuuZ7uEcN9or8FRFSLtYK7QtMdrL2G8aPg
 3dfHxgNEoEXQuzABqZLFdaLSKxNj6iSp5scVWjCfK3gmIoeyod7+84UzpmzfsR38BDpj
 i920bYrUShgMRpGuNdEzJLYlNQklCxrJvtDuMWfM+nOUJTpn9IdYTLS0i3S/zIaeqbrn
 1EJB1qjMsEJkFSf6TllSukBaV/WZ7uLL6FNsKzIALqW+2/Zyp3KS4EHusUZVGdXvL/XJ
 eJtg==
X-Gm-Message-State: AOAM532zW9/EnaGxFlIoUCR7znIhZIDEE2vb02jZIByvaI4feeEAY3oG
 qCuox/g4ZlvvtiI18oj3gGR4fjvksdv7Vg==
X-Google-Smtp-Source: ABdhPJwcOH6VZmSVbEIihteBlzOV6AUxLBuWG9ViJBXufv+I9rXHrEQGfx+63mUMp3rHMjSEUIXxLQ==
X-Received: by 2002:a5d:64ef:: with SMTP id g15mr3815510wri.639.1639564855444; 
 Wed, 15 Dec 2021 02:40:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/33] hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig
 selector
Date: Wed, 15 Dec 2021 10:40:24 +0000
Message-Id: <20211215104049.2030475-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The TYPE_ARM_GICV3 device is an emulated one.  When using
KVM, it is recommended to use the TYPE_KVM_ARM_GICV3 device
(which uses in-kernel support).

When using --with-devices-FOO, it is possible to build a
binary with a specific set of devices. When this binary is
restricted to KVM accelerator, the TYPE_ARM_GICV3 device is
irrelevant, and it is desirable to remove it from the binary.

Therefore introduce the CONFIG_ARM_GIC_TCG Kconfig selector
which select the files required to have the TYPE_ARM_GICV3
device, but also allowing to de-select this device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20211115223619.2599282-3-philmd@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3.c |  2 +-
 hw/intc/Kconfig     |  5 +++++
 hw/intc/meson.build | 10 ++++++----
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 9f5f815db9b..715df5421dd 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -1,5 +1,5 @@
 /*
- * ARM Generic Interrupt Controller v3
+ * ARM Generic Interrupt Controller v3 (emulation)
  *
  * Copyright (c) 2015 Huawei.
  * Copyright (c) 2016 Linaro Limited
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 78aed93c454..010ded7eae0 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -25,6 +25,11 @@ config APIC
     select MSI_NONBROKEN
     select I8259
 
+config ARM_GIC_TCG
+    bool
+    default y
+    depends on ARM_GIC && TCG
+
 config ARM_GIC_KVM
     bool
     default y
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 11352806db2..70080bc161c 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -3,12 +3,14 @@ softmmu_ss.add(when: 'CONFIG_ARM_GIC', if_true: files(
   'arm_gic.c',
   'arm_gic_common.c',
   'arm_gicv2m.c',
-  'arm_gicv3.c',
   'arm_gicv3_common.c',
-  'arm_gicv3_dist.c',
   'arm_gicv3_its_common.c',
-  'arm_gicv3_redist.c',
+))
+softmmu_ss.add(when: 'CONFIG_ARM_GIC_TCG', if_true: files(
+  'arm_gicv3.c',
+  'arm_gicv3_dist.c',
   'arm_gicv3_its.c',
+  'arm_gicv3_redist.c',
 ))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
 softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
@@ -26,7 +28,7 @@ softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-pmu-iomod-in
 specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
-specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif.c'))
+specific_ss.add(when: 'CONFIG_ARM_GIC_TCG', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
-- 
2.25.1


