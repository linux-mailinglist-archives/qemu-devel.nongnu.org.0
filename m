Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9976C65E02C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:44:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBte-0000k9-Ta; Wed, 04 Jan 2023 17:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBtV-0000fj-PW
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:04 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBtR-0005VZ-Qg
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:05:56 -0500
Received: by mail-ed1-x535.google.com with SMTP id 18so1319915edw.7
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x61H7egSNuZgElN8gUrBWk1wkFnRoVuCr6783O6GJXk=;
 b=Th4FBs4U4GMYmlDov4HhEzwLf/chHb+7fksYsjEgZjLMY2CiSiNl7tU3Cv+bvHfCQD
 3LMfvJsagOyzjY6KAdN1A99Dc7+n7TshDqhyLqT+ef08YrO8QMwouYU7YxETl8KwuIyz
 XnHeCB47ZJA7rHfpGurbNlUR9600OboiTboAL4zWY6hsRNZsDoTYcPQFQs9t5kfqtG8N
 tDqxjshf9m971D4CZSdXkyfg0B1xMw/DcTUbaBcObaDKVVim8AUb+7DK0VSbahSAu2Sn
 SjlvSedjPuxnWjCkOSaWQG9yvuDiwS2v8HZmfDPanqGUTMmaFS/Xvwb1WNuas4R890hz
 Q9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x61H7egSNuZgElN8gUrBWk1wkFnRoVuCr6783O6GJXk=;
 b=BdOaOi6tdzvXO1byAvM9LlCwTy2NNGEGym3galiici7wris0QOgzewvk+TZxtT501s
 TlPq17tqgDd97NBi0SS2vnO1WRiPcLycISJTMGsen492aAS/IDgVeXCULdvMiOubou8a
 YF3z3OGdRMTbF88ceun65ZYZZxvAEedCF5cPReM3yCQpT86inESRgCcji4cDbgT96Ewj
 M4lNSfa62ZTEu5/ZB17DZ6DDbPqjMDKJzUObCKcSJolVtBFFybvnRoRQx3pVkmGjXjJG
 sBEaP5l3vo76np5235arKbbhM8KJDOFtsT81LyUZ8Bnw9hq7JUlO4tUrm1vG21S9Tb70
 B8tg==
X-Gm-Message-State: AFqh2kquaIUNaGPs8nT9I0fDs65bClKgOeKLXhVDTq4XhF4bhHlJhgou
 IRCuhvRxMcqUKX7N7egyjfXoyC/mLH01Yn7o
X-Google-Smtp-Source: AMrXdXsL06u9hoxw6I2oOMx5X5B5BGvCWbj1saQRD2Z3pnyoddfAir9QEbGcIgLcKRg30HYcdrA6Zw==
X-Received: by 2002:a05:6402:f05:b0:46f:9a53:fdcc with SMTP id
 i5-20020a0564020f0500b0046f9a53fdccmr58034665eda.12.1672869952056; 
 Wed, 04 Jan 2023 14:05:52 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c4-20020aa7c984000000b004873927780bsm10065344edt.20.2023.01.04.14.05.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:05:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 07/20] hw/i386: Use generic DeviceState instead of PFlashCFI01
Date: Wed,  4 Jan 2023 23:04:36 +0100
Message-Id: <20230104220449.41337-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Nothing here requires access to PFlashCFI01 internal fields:
use the inherited generic DeviceState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_sysfw.c   | 14 +++++++-------
 include/hw/i386/pc.h |  3 +--
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 60db0efb41..1a12207dd1 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -71,7 +71,7 @@ static void pc_isa_bios_init(MemoryRegion *rom_memory,
     memory_region_set_readonly(isa_bios, true);
 }
 
-static PFlashCFI01 *pc_pflash_create(PCMachineState *pcms,
+static DeviceState *pc_pflash_create(PCMachineState *pcms,
                                      const char *name,
                                      const char *alias_prop_name)
 {
@@ -88,7 +88,7 @@ static PFlashCFI01 *pc_pflash_create(PCMachineState *pcms,
      * will be removed with object_unparent.
      */
     object_unref(OBJECT(dev));
-    return PFLASH_CFI01(dev);
+    return dev;
 }
 
 void pc_system_flash_create(PCMachineState *pcms)
@@ -143,7 +143,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
     int i;
     BlockBackend *blk;
     int64_t size;
-    PFlashCFI01 *system_flash;
+    DeviceState *system_flash;
     MemoryRegion *flash_mem;
     void *flash_ptr;
     int flash_size;
@@ -152,7 +152,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
 
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
         system_flash = pcms->flash[i];
-        blk = pflash_cfi01_get_blk(DEVICE(system_flash));
+        blk = pflash_cfi01_get_blk(system_flash);
         if (!blk) {
             break;
         }
@@ -187,7 +187,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
                         0x100000000ULL - total_size);
 
         if (i == 0) {
-            flash_mem = pflash_cfi01_get_memory(DEVICE(system_flash));
+            flash_mem = pflash_cfi01_get_memory(system_flash);
             pc_isa_bios_init(rom_memory, flash_mem, size);
 
             /* Encrypt the pflash boot ROM */
@@ -214,9 +214,9 @@ void pc_system_firmware_init(PCMachineState *pcms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
-        pflash_cfi01_legacy_drive(DEVICE(pcms->flash[i]),
+        pflash_cfi01_legacy_drive(pcms->flash[i],
                                   drive_get(IF_PFLASH, 0, i));
-        pflash_blk[i] = pflash_cfi01_get_blk(DEVICE(pcms->flash[i]));
+        pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
     }
 
     /* Reject gaps */
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 991f905f5d..70abe61805 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -6,7 +6,6 @@
 #include "qemu/uuid.h"
 #include "hw/boards.h"
 #include "hw/block/fdc.h"
-#include "hw/block/flash.h"
 #include "hw/i386/x86.h"
 
 #include "hw/acpi/acpi_dev_interface.h"
@@ -35,7 +34,7 @@ typedef struct PCMachineState {
     /* Pointers to devices and objects: */
     PCIBus *bus;
     I2CBus *smbus;
-    PFlashCFI01 *flash[2];
+    DeviceState *flash[2];
     ISADevice *pcspk;
     DeviceState *iommu;
 
-- 
2.38.1


