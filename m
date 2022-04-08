Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFF14F981E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:33:24 +0200 (CEST)
Received: from localhost ([::1]:56120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpfv-0006AS-CD
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPH-0006un-Aw
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:12 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPF-0002If-1u
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:11 -0400
Received: by mail-wm1-x333.google.com with SMTP id r7so5581158wmq.2
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KUS8jHf3RiAub0TzLvyVWR6Uq3p/cHMqxywf5Ll+/4E=;
 b=afF4d8W+FqBptO5tmuMTZ/etPs/SRTSR81/OGVbAafdL8WGkOttqb1rUwHxLinGdZD
 QtZXSZCKmPRw7BjkfYPSHreC5eodkNol6accuUITRkNBckyfQw6jGe9XgM1TXf1QwGHK
 avra9/4tzElVXqv6zx2Urw5aC4xksUb93TkblZcEQW5krHdptaarNPn6LLZCd+bM4G53
 51fMNIrG4oHcqbCHonWxx2rdoytIisM94hrOtch494BH+KQHg4BG/xFYZW9+/dZTj7YV
 vKHCdea4Zl+xPTxtw+7BtdBu2qdUMAeEMrHuVcXxg+xxCQCAPM1RDljX5/fbOhyOz/eu
 P0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KUS8jHf3RiAub0TzLvyVWR6Uq3p/cHMqxywf5Ll+/4E=;
 b=agIGWRprFR6E9yPPf25bL/12/XIEnBgavX/agUG5tSm8DhxkSiBnAO+OQr1ZaGg+w6
 r2fZ3svI0kFyMTp5s17neTUdyXsPghskruJNNb04VVoi4jHcJZhFE7Hh1GxGffB19c1Y
 sSNKfRlsvH58VWiCUK/4uWgdYCNE+PnaH2envRP9vt8zKUl1H22qXT3lP6bZdtKK8ct0
 KEG4SzUMi1nfucnx33Xfw9IGbNDL7drU006shb0Fv4fVWtwC8luI6RODLX2yJj3hfPus
 YtkNzuosypV2P8KBAd0UGv8K0iqkPS5vMvF2hAjN3ywIIMJhsHm4xLindxiaCBCkh8vW
 HVkw==
X-Gm-Message-State: AOAM531aMheOohn7HKzPDU/tgXVwA680wIAUAGfVmwN7i7s5e5ayEl+H
 bQHCRVg4ykqpIK7cazi+BYm3IKPS68C+hg==
X-Google-Smtp-Source: ABdhPJzRmMRkdYTznXbt/1L/7OkFxGz4e3DNPWeypnKfOHlunJEAqYLKMNgnQrtuUyRxWfWg3UZ22A==
X-Received: by 2002:a05:600c:1548:b0:38e:a8df:eced with SMTP id
 f8-20020a05600c154800b0038ea8dfecedmr2426069wmg.9.1649427367840; 
 Fri, 08 Apr 2022 07:16:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/41] hw/intc/arm_gicv3: Keep pointers to every connected ITS
Date: Fri,  8 Apr 2022 15:15:24 +0100
Message-Id: <20220408141550.1271295-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GICv4 ITS VMOVP command's semantics require it to perform the
operation on every ITS connected to the same GIC that the ITS that
received the command is attached to.  This means that the GIC object
needs to keep a pointer to every ITS that is connected to it
(previously it was sufficient for the ITS to have a pointer to its
GIC).

Add a glib ptrarray to the GICv3 object which holds pointers to every
connected ITS, and make the ITS add itself to the array for the GIC
it is connected to when it is realized.

Note that currently all QEMU machine types with an ITS have exactly
one ITS in the system, so typically the length of this ptrarray will
be 1.  Multiple ITSes are typically used to improve performance on
real hardware, so we wouldn't need to have more than one unless we
were modelling a real machine type that had multile ITSes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h           | 9 +++++++++
 include/hw/intc/arm_gicv3_common.h | 2 ++
 hw/intc/arm_gicv3_common.c         | 2 ++
 hw/intc/arm_gicv3_its.c            | 2 ++
 hw/intc/arm_gicv3_its_kvm.c        | 2 ++
 5 files changed, 17 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 6e22c8072e9..69a59daf867 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -709,4 +709,13 @@ static inline void gicv3_cache_all_target_cpustates(GICv3State *s)
 
 void gicv3_set_gicv3state(CPUState *cpu, GICv3CPUState *s);
 
+/*
+ * The ITS should call this when it is realized to add itself
+ * to its GIC's list of connected ITSes.
+ */
+static inline void gicv3_add_its(GICv3State *s, DeviceState *its)
+{
+    g_ptr_array_add(s->itslist, its);
+}
+
 #endif /* QEMU_ARM_GICV3_INTERNAL_H */
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index fc38e4b7dca..08b27789385 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -272,6 +272,8 @@ struct GICv3State {
     uint32_t gicd_nsacr[DIV_ROUND_UP(GICV3_MAXIRQ, 16)];
 
     GICv3CPUState *cpu;
+    /* List of all ITSes connected to this GIC */
+    GPtrArray *itslist;
 };
 
 #define GICV3_BITMAP_ACCESSORS(BMP)                                     \
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index c797c82786b..dcc5ce28c6a 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -414,6 +414,8 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
         cpuidx += s->redist_region_count[i];
         s->cpu[cpuidx - 1].gicr_typer |= GICR_TYPER_LAST;
     }
+
+    s->itslist = g_ptr_array_new();
 }
 
 static void arm_gicv3_finalize(Object *obj)
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 21bc1a6c18b..6ff3c3b0348 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1680,6 +1680,8 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    gicv3_add_its(s->gicv3, dev);
+
     gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
 
     /* set the ITS default features supported */
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 0b4cbed28b3..529c7bd4946 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -106,6 +106,8 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
     kvm_arm_register_device(&s->iomem_its_cntrl, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_ITS_ADDR_TYPE, s->dev_fd, 0);
 
+    gicv3_add_its(s->gicv3, dev);
+
     gicv3_its_init_mmio(s, NULL, NULL);
 
     if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
-- 
2.25.1


