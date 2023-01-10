Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7051664905
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:17:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHkx-0004ar-FF; Tue, 10 Jan 2023 11:45:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHku-0004YC-RX
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:44 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHks-0006lx-KG
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:44 -0500
Received: by mail-wr1-x431.google.com with SMTP id v2so1428791wrw.10
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VDhBbDUvfr9IaXWyqrMyPKAYIRrU4/62+8mx1MvW5Dg=;
 b=h5ghSeIkmu+Ye2Dj43VyqY4x+RMV92wph0vMdxitPFuMhgdkDOfEGvRusKSFr1n+b3
 Xp9Jum13WMj9R9dqdalxZA46jZBGDJ32SLuhGKpTh8bP2/5DXsENooFBmws91lL5Oc7R
 LpZlYxUMeXY6RtX6SnX22GEbBEho/GgFtUyafSX6thDF/T40DVQjFS758BphU1Uje9vf
 y9UtQ0nnJ2AsaroOKVuVOZEF3UnV7NUlbN3esJrSg1qE3BgIDDTtP1h3fZWaF0veu14P
 ZVgQwjT7Ef7y17nWe1E3DkIFmWv9OflFbhBV8IEHX4CBjiQQOHjEJ4bud4kC/OXmRlpO
 y3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VDhBbDUvfr9IaXWyqrMyPKAYIRrU4/62+8mx1MvW5Dg=;
 b=nel4q96D3Z/vuDCzTt8csl4NbT0WhOzd32p5IAKRR4vBanfpJXk9zEVMdRQQnK4OJz
 d5YOs1Tdx9t1v64ITjo19YHRYOpzLJEO9KuzkdW/NExUfDsYHxMYXq7O6mHwYTiXOjTd
 1tB+psqO3SqxJNzCZVhfk3wS9skyGjUUAndyR+dcQYfnf8iFIytss34+ONtMAf0eTlc1
 TVzB/ORon8/cuIsDZ30kwrq48xirjPLae7SOwckdmgectbiuJr/b5Tex1QzATg7NN/DW
 IZ/Ac7rgzlfyJkMK+GrJfKEj8EFfdFnqoz2F3TfdxQjKxzt6sbpwOUgKZ0v7a8lvvpTh
 GcwA==
X-Gm-Message-State: AFqh2kpML3RFRqIMnUewQ86l2PVfjCkleQ2R1FsGglPHD1ay8CifSIfU
 cRwEdQMJEdJTud7NypiqFmfxhhB35xyx0Pmm
X-Google-Smtp-Source: AMrXdXv1NJACiTDLrDeHwqpg8qM0Juf4qN1oCq6lqp2pvE9o1OpLPPwlOOPj+jqt8J3baEhqCE/C9Q==
X-Received: by 2002:a05:6000:18ca:b0:244:48b3:d138 with SMTP id
 w10-20020a05600018ca00b0024448b3d138mr39991201wrq.54.1673369138135; 
 Tue, 10 Jan 2023 08:45:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a5d4b44000000b002366dd0e030sm11505812wrs.68.2023.01.10.08.45.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:45:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 16/18] hw/arm/fsl-imx7: Replace object_initialize(ARMCPU) by
 object_new()
Date: Tue, 10 Jan 2023 17:44:04 +0100
Message-Id: <20230110164406.94366-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Replace the ARMCPU field in FslIMX7State by a reference to
an allocated ARMCPU. Instead of initializing the field with
object_initialize(), allocate it with object_new().

As we don't access ARMCPU internal fields or size, we can
move from arm_ss[] to the more generic softmmu_ss[] the followin
units:

 - fsl-imx7.c
 - mcimx7d-sabre.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx7.c         | 6 +++---
 hw/arm/mcimx7d-sabre.c    | 2 +-
 hw/arm/meson.build        | 2 +-
 include/hw/arm/fsl-imx7.h | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 6115677d43..634ed299cc 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -38,8 +38,8 @@ static void fsl_imx7_init(Object *obj)
 
     for (i = 0; i < MIN(ms->smp.cpus, FSL_IMX7_NUM_CPUS); i++) {
         snprintf(name, NAME_SIZE, "cpu%d", i);
-        object_initialize_child(obj, name, &s->cpu[i],
-                                ARM_CPU_TYPE_NAME("cortex-a7"));
+        s->cpu[i] = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("cortex-a7")));
+        object_property_add_child(obj, name, OBJECT(s->cpu[i]));
     }
 
     /*
@@ -157,7 +157,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
     }
 
     for (i = 0; i < smp_cpus; i++) {
-        o = OBJECT(&s->cpu[i]);
+        o = OBJECT(s->cpu[i]);
 
         /* On uniprocessor, the CBAR is set to 0 */
         if (smp_cpus > 1) {
diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 6182b15f19..ad46bf79c6 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -61,7 +61,7 @@ static void mcimx7d_sabre_init(MachineState *machine)
     }
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->cpu[0], machine, &boot_info);
+        arm_load_kernel(s->cpu[0], machine, &boot_info);
     }
 }
 
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index b244db5962..53ce301cbe 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -27,7 +27,6 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_ast2600.c',
   'aspeed_ast10x0.c',
   'fby35.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 
@@ -41,6 +40,7 @@ softmmu_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 softmmu_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 softmmu_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
+softmmu_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
 softmmu_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 softmmu_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 softmmu_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index ed8c1ec813..97c9731db3 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -38,7 +38,7 @@
 #include "hw/net/imx_fec.h"
 #include "hw/pci-host/designware.h"
 #include "hw/usb/chipidea.h"
-#include "target/arm/cpu.h"
+#include "hw/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX7 "fsl-imx7"
@@ -65,7 +65,7 @@ struct FslIMX7State {
     DeviceState    parent_obj;
 
     /*< public >*/
-    ARMCPU             cpu[FSL_IMX7_NUM_CPUS];
+    ARMCPU             *cpu[FSL_IMX7_NUM_CPUS];
     A15MPPrivState     a7mpcore;
     IMXGPTState        gpt[FSL_IMX7_NUM_GPTS];
     IMXGPIOState       gpio[FSL_IMX7_NUM_GPIOS];
-- 
2.38.1


