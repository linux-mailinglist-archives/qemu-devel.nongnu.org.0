Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F1B640982
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 16:42:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p189X-0001Sy-Ov; Fri, 02 Dec 2022 10:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p189V-0001RM-07
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 10:40:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p189R-000139-Rt
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 10:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669995632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=k31gxd363+rUh2suHaYSb16ogW0CYQz/oUuU7ri+gT4=;
 b=JrKl8j1FV7dmdg9JmTdLXsmOtQW5/3LuMvO8LOz6Pj/pBztJZfmp1YUBYLwYd/UKLgH+xr
 kD15mWFGhNcQtUZs6BWRt753UuK34csnoL+llhUbrezMPYZMST8IBlIRO/9LDBm5aDVhzB
 PpjPEaWAT1O+oUZO6blQwCfLIGvsV1I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-ABQYHRjCPFK9TJH82YeZ_A-1; Fri, 02 Dec 2022 10:40:30 -0500
X-MC-Unique: ABQYHRjCPFK9TJH82YeZ_A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFFD9185A79C;
 Fri,  2 Dec 2022 15:40:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C30B0403165;
 Fri,  2 Dec 2022 15:40:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 for-8.0] hw/misc: Move some arm-related files from
 specific_ss into softmmu_ss
Date: Fri,  2 Dec 2022 16:40:23 +0100
Message-Id: <20221202154023.293614-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The header arget/arm/kvm-consts.h checks CONFIG_KVM which is marked as
poisoned in common code, so the files that include this header have to
be added to specific_ss and recompiled for each, qemu-system-arm and
qemu-system-aarch64. However, since the kvm headers are only optionally
used in kvm-constants.h for some sanity checks, we can additionally
check the NEED_CPU_H macro first to avoid the poisoned CONFIG_KVM macro,
so kvm-constants.h can also be used from "common" files (without the
sanity checks - which should be OK since they are still done from other
target-specific files instead). This way, and by adjusting some other
include statements in the related files here and there, we can move some
files from specific_ss into softmmu_ss, so that they only need to be
compiled once during the build process.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Use NEED_CPU_H wrapper in kvm-consts.h instead of avoiding to include it

 include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  2 +-
 target/arm/kvm-consts.h                |  8 ++++----
 hw/misc/imx6_src.c                     |  2 +-
 hw/misc/iotkit-sysctl.c                |  1 -
 hw/misc/meson.build                    | 11 +++++------
 5 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/include/hw/misc/xlnx-zynqmp-apu-ctrl.h b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
index b8ca9434af..c3bf3c1583 100644
--- a/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
+++ b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
@@ -13,7 +13,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/register.h"
-#include "target/arm/cpu.h"
+#include "target/arm/cpu-qom.h"
 
 #define TYPE_XLNX_ZYNQMP_APU_CTRL "xlnx.apu-ctrl"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPAPUCtrl, XLNX_ZYNQMP_APU_CTRL)
diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index faacf96fdc..09967ec5e6 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -14,16 +14,16 @@
 #ifndef ARM_KVM_CONSTS_H
 #define ARM_KVM_CONSTS_H
 
+#ifdef NEED_CPU_H
 #ifdef CONFIG_KVM
 #include <linux/kvm.h>
 #include <linux/psci.h>
-
 #define MISMATCH_CHECK(X, Y) QEMU_BUILD_BUG_ON(X != Y)
+#endif
+#endif
 
-#else
-
+#ifndef MISMATCH_CHECK
 #define MISMATCH_CHECK(X, Y) QEMU_BUILD_BUG_ON(0)
-
 #endif
 
 #define CP_REG_SIZE_SHIFT 52
diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index 7b0e968804..a9c64d06eb 100644
--- a/hw/misc/imx6_src.c
+++ b/hw/misc/imx6_src.c
@@ -15,7 +15,7 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
-#include "arm-powerctl.h"
+#include "target/arm/arm-powerctl.h"
 #include "hw/core/cpu.h"
 
 #ifndef DEBUG_IMX6_SRC
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 7147e2f84e..e664215ee6 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -30,7 +30,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/arm/armsse-version.h"
 #include "target/arm/arm-powerctl.h"
-#include "target/arm/cpu.h"
 
 REG32(SECDBGSTAT, 0x0)
 REG32(SECDBGSET, 0x4)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 95268eddc0..ed0598dc9e 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -51,6 +51,7 @@ softmmu_ss.add(when: 'CONFIG_IMX', if_true: files(
   'imx25_ccm.c',
   'imx31_ccm.c',
   'imx6_ccm.c',
+  'imx6_src.c',
   'imx6ul_ccm.c',
   'imx7_ccm.c',
   'imx7_gpr.c',
@@ -84,8 +85,8 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
 ))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
-specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
-specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-apu-ctrl.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-apu-ctrl.c'))
 specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-crl.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(
   'xlnx-versal-xramc.c',
@@ -101,6 +102,7 @@ softmmu_ss.add(when: 'CONFIG_TZ_MPC', if_true: files('tz-mpc.c'))
 softmmu_ss.add(when: 'CONFIG_TZ_MSC', if_true: files('tz-msc.c'))
 softmmu_ss.add(when: 'CONFIG_TZ_PPC', if_true: files('tz-ppc.c'))
 softmmu_ss.add(when: 'CONFIG_IOTKIT_SECCTL', if_true: files('iotkit-secctl.c'))
+softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSCTL', if_true: files('iotkit-sysctl.c'))
 softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSINFO', if_true: files('iotkit-sysinfo.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE_CPU_PWRCTRL', if_true: files('armsse-cpu-pwrctrl.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: files('armsse-cpuid.c'))
@@ -126,15 +128,12 @@ softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
 
 specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c'))
 
-specific_ss.add(when: 'CONFIG_IMX', if_true: files('imx6_src.c'))
-specific_ss.add(when: 'CONFIG_IOTKIT_SYSCTL', if_true: files('iotkit-sysctl.c'))
-
 specific_ss.add(when: 'CONFIG_MAC_VIA', if_true: files('mac_via.c'))
 
 specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_cmgcr.c', 'mips_cpc.c'))
 specific_ss.add(when: 'CONFIG_MIPS_ITU', if_true: files('mips_itu.c'))
 
-specific_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
+softmmu_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
 
 # HPPA devices
 softmmu_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
-- 
2.31.1


