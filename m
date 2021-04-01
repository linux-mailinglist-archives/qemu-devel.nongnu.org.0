Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609F1350CC8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 04:48:17 +0200 (CEST)
Received: from localhost ([::1]:56564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRnNY-0001J5-Ca
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 22:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHa-0002rK-OI
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 22:42:06 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:42646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHV-0003Cb-3H
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 22:42:06 -0400
Received: by mail-qk1-x729.google.com with SMTP id y5so875309qkl.9
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 19:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=36CRRigRDg6z7Ps/zHm2nFOe3o4QS1w0QeVs5IpQt88=;
 b=D68RcJiw9z0nkC+YTho/xYvi6Gl34ideQTD1NULJeMec2XASt3Z8WKABH+PRJf00mD
 KTdzP8LDslcwdJS+E1zVMCpeaAMWN1lB5/m3iQtaPoevb9DmFkViwA72MSemPeV7aaAN
 O4HgyS5QyqPtkKXAjzPM7sPz0a4vB4WzUq9O7GpBmN71TO73HcCZdmiqOsz1Ce+UmrxL
 Spjhyw58ChQIiGdjJFmSzzEVjkJah8oP3kl2jXsz/FOgL3uSKgL7nCBw4p9+6KeVGW4N
 /uqleBhiOxc2W7QmBG65uguew3ImzEPolJBwSGH2InnomSZaMwG8re0fwmvU9aqV432i
 pXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=36CRRigRDg6z7Ps/zHm2nFOe3o4QS1w0QeVs5IpQt88=;
 b=VQEPvKBbULr+RqQiqsXAfLsAzbkg7i/QruvldifQSMRIiDkNaDIWaeOr5t9sAHnf5J
 msPF0pNa1mY/E6nZwPwZzGEQ7Ro6o7mS+vRo3BqSLIyLRMHMxLrigxT2qrdslGEdMDrv
 6/jcrDmqbOhnRpTNtsk+zSd2bEEXpLKTGxxd3mqCjg/L8LKfZ3/8AyNVOl0gefgomFo6
 uyTVvf/J/iq3ykyOXhJ6dK0ZlBNK7HXsOAlg/JGBeSU64vZD0tuz3bx3gGtgKhqeS2rD
 kENvXpF5aW2+9t5C1Gxx9k/CQUm4UTB8FUudwsTldOch2Yumrgb2GhRtgo29XcVtIXyq
 6YSw==
X-Gm-Message-State: AOAM532HUl92N9rbuX4l/Jz4oDmpEVpfrpmOJ58RWmA2H86nMrnL18dC
 mfsGe3GTem/qkaGCcNxctlvBRA==
X-Google-Smtp-Source: ABdhPJzJqbH+IcDfBfH9ORFpvkEK0VwLuylAw6B+ZoABabqP9LGk8CzyWlug61Jzk162w/P/RYmVzQ==
X-Received: by 2002:a05:620a:14b3:: with SMTP id
 x19mr6434890qkj.384.1617244919937; 
 Wed, 31 Mar 2021 19:41:59 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id a8sm2525707qtx.9.2021.03.31.19.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 19:41:59 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v2 8/8] hw/arm/virt: add ITS support in virt GIC
Date: Wed, 31 Mar 2021 22:41:52 -0400
Message-Id: <20210401024152.203896-9-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210401024152.203896-1-shashi.mallela@linaro.org>
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x729.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Included creation of ITS as part of virt platform GIC
initialization.This Emulated ITS model now co-exists with kvm
ITS and is enabled in absence of kvm irq kernel support in a
platform.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/virt.c        | 10 ++++++++--
 target/arm/kvm_arm.h |  4 ++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e0..77cf2db90f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -622,7 +622,7 @@ static void create_v2m(VirtMachineState *vms)
     vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
-static void create_gic(VirtMachineState *vms)
+static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
     /* We create a standalone GIC */
@@ -656,6 +656,12 @@ static void create_gic(VirtMachineState *vms)
                              nb_redist_regions);
         qdev_prop_set_uint32(vms->gic, "redist-region-count[0]", redist0_count);
 
+        if (!kvm_irqchip_in_kernel()) {
+            object_property_set_link(OBJECT(vms->gic), "sysmem", OBJECT(mem),
+                                     &error_fatal);
+            qdev_prop_set_bit(vms->gic, "has-lpi", true);
+        }
+
         if (nb_redist_regions == 2) {
             uint32_t redist1_capacity =
                     vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
@@ -2039,7 +2045,7 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
-    create_gic(vms);
+    create_gic(vms, sysmem);
 
     virt_cpu_post_init(vms, sysmem);
 
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 34f8daa377..0613454975 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -525,8 +525,8 @@ static inline const char *its_class_name(void)
         /* KVM implementation requires this capability */
         return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
     } else {
-        /* Software emulation is not implemented yet */
-        return NULL;
+        /* Software emulation based model */
+        return "arm-gicv3-its";
     }
 }
 
-- 
2.27.0


