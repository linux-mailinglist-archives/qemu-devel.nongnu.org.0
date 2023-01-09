Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB9A6625D0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:47:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqxn-0008WO-2b; Mon, 09 Jan 2023 07:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxR-0008QI-El
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:04 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxP-0005to-BL
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:08:52 -0500
Received: by mail-wr1-x435.google.com with SMTP id r2so7924812wrv.7
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qvR2r7mABa8twb5HuIROvIsigWOYnFpMS9gvKcFCIYA=;
 b=V0TkCOiAmrQn4f7JC3E1NCiCImiog0UjG65Tv8q36jnVsjH/FWfIaVW62T4UlGNvPe
 S2JpbGCkGG9dzG974Zv9lNPPqV6xrnMF2wER5XXIPVkb4PUD4mJaqRuAmWkk7HMRUoGx
 oBg6OBOugD2IuDtLL7IT5UssotD7MCQlXITRll7aSdgDyo7/V4sQAhIy2y1YcrILO407
 HDgjr8tMRS6VcGTm0xpAI+JYAtLcIN2WgrBz534jp8R18xUA04EQLLlS45Sd/NRI+E3t
 E3phFdh/AW45aANvG3HU2B5cbGjL/aC/4CcrnBF0Ipb+bj7GVLeOCrbg0P1OBrJsGnxG
 U+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qvR2r7mABa8twb5HuIROvIsigWOYnFpMS9gvKcFCIYA=;
 b=ZrTH/fgVkXG2nLKb3aAjs/Iqw8IEUPxZjpJSkHntqnNp9VOJASeZXmlpQUEImrhyx4
 cux1aLQ0C0Dle/4ApqGhm5xBGtWG/t1P2s04UlhFe1JhUIXa+NRa83jT4B3j9er6vZWu
 YhfdDpBdKbhlE4i+Ty1TtSJfT3HselFQYiHerVcrgW5Wt0DX1amzZXxzUBEJ/yuigo2h
 Ryw9EY9b8RXwzLdKuU9+bCnWk9aLcNnkJCOuMQqaQ7SqT1mT8hhJg/HrAQHqG1Zx2wbn
 HUklh6i9W9kx4klv5GaFvIic/D5E6IiB9zV7xlyE4m31dMm3gl/WKm9BsX6PEuwwU9hz
 N8ig==
X-Gm-Message-State: AFqh2krT+XhhZH8bFRbFVaWsUQQd8csCq4W2bH5SXD8+MV6SeFPHl0fq
 k1lzqx+O1NrEe9zOtOMtwY8zipedvK006W1U
X-Google-Smtp-Source: AMrXdXv6JUOKhlzmJOreO+O1G1BD9lvth6knmXVqx+lPFjLUI7ls7lC74K/I8j1qsEWOfo7Q3n+r0w==
X-Received: by 2002:adf:f851:0:b0:2bc:7e19:fe84 with SMTP id
 d17-20020adff851000000b002bc7e19fe84mr1129699wrq.62.1673266129659; 
 Mon, 09 Jan 2023 04:08:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adfdec2000000b002b9b9445149sm9871197wrn.54.2023.01.09.04.08.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:08:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 03/21] hw/block: Use pflash_cfi01_get_blk() in
 pflash_cfi01_legacy_drive()
Date: Mon,  9 Jan 2023 13:08:15 +0100
Message-Id: <20230109120833.3330-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

By using pflash_cfi01_get_blk(), pflash_cfi01_legacy_drive()
doesn't require any knowledge of the PFlashCFI01 structure.
Thus we can pass a generic DeviceState pointer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/arm/sbsa-ref.c        | 2 +-
 hw/arm/virt.c            | 2 +-
 hw/block/pflash_cfi01.c  | 6 +++---
 hw/i386/pc_sysfw.c       | 2 +-
 hw/riscv/virt.c          | 2 +-
 include/hw/block/flash.h | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 65b9acba04..1d29e8ca7f 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -340,7 +340,7 @@ static bool sbsa_firmware_init(SBSAMachineState *sms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(sms->flash); i++) {
-        pflash_cfi01_legacy_drive(sms->flash[i],
+        pflash_cfi01_legacy_drive(DEVICE(sms->flash[i]),
                                   drive_get(IF_PFLASH, 0, i));
     }
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 954e3ca5ce..57726b0f52 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1227,7 +1227,7 @@ static bool virt_firmware_init(VirtMachineState *vms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(vms->flash); i++) {
-        pflash_cfi01_legacy_drive(vms->flash[i],
+        pflash_cfi01_legacy_drive(DEVICE(vms->flash[i]),
                                   drive_get(IF_PFLASH, 0, i));
     }
 
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 458c50ec45..8beba24989 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -1002,7 +1002,7 @@ MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl)
  * Else if @fl's property "drive" is already set, fatal error.
  * Else set it to the BlockBackend with @dinfo.
  */
-void pflash_cfi01_legacy_drive(PFlashCFI01 *fl, DriveInfo *dinfo)
+void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo)
 {
     Location loc;
 
@@ -1012,11 +1012,11 @@ void pflash_cfi01_legacy_drive(PFlashCFI01 *fl, DriveInfo *dinfo)
 
     loc_push_none(&loc);
     qemu_opts_loc_restore(dinfo->opts);
-    if (fl->blk) {
+    if (pflash_cfi01_get_blk(dev)) {
         error_report("clashes with -machine");
         exit(1);
     }
-    qdev_prop_set_drive_err(DEVICE(fl), "drive", blk_by_legacy_dinfo(dinfo),
+    qdev_prop_set_drive_err(dev, "drive", blk_by_legacy_dinfo(dinfo),
                             &error_fatal);
     loc_pop(&loc);
 }
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 4b85c48ec8..c08cba6628 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -214,7 +214,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
-        pflash_cfi01_legacy_drive(pcms->flash[i],
+        pflash_cfi01_legacy_drive(DEVICE(pcms->flash[i]),
                                   drive_get(IF_PFLASH, 0, i));
         pflash_blk[i] = pflash_cfi01_get_blk(DEVICE(pcms->flash[i]));
     }
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 94ff2a1584..aa8db65685 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1514,7 +1514,7 @@ static void virt_machine_init(MachineState *machine)
 
     for (i = 0; i < ARRAY_SIZE(s->flash); i++) {
         /* Map legacy -drive if=pflash to machine properties */
-        pflash_cfi01_legacy_drive(s->flash[i],
+        pflash_cfi01_legacy_drive(DEVICE(s->flash[i]),
                                   drive_get(IF_PFLASH, 0, i));
     }
     virt_flash_map(s, system_memory);
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 961b6e9f74..701a2c1701 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -23,7 +23,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
                                    int be);
 BlockBackend *pflash_cfi01_get_blk(DeviceState *dev);
 MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl);
-void pflash_cfi01_legacy_drive(PFlashCFI01 *dev, DriveInfo *dinfo);
+void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo);
 
 /* pflash_cfi02.c */
 
-- 
2.38.1


