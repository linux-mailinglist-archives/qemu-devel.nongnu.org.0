Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C500D65E028
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:42:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBte-0000jH-5O; Wed, 04 Jan 2023 17:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBtM-0000dD-FS
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:05:48 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBtK-0005Bu-AG
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:05:48 -0500
Received: by mail-ej1-x636.google.com with SMTP id x22so85913373ejs.11
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ostFdFduA8VJQbdYun/a8v7V9oLZ2nQ4qLyqomH/nUo=;
 b=cZ1cbmjQ9ajzsj/qRRfezodu3WDXPkdUOzcyfLhMAGZk/ZZsnQX8L58azDOnW26nY2
 d77GDNdgpJpNRgzpyqOvYsPjXCT9i/J5aoH5EdSbqseARnUzFrWVm2GA9VYtWyislI8P
 +d9MHiwMsAtUNES2ptR/KpU1jEI7ykv/SxgED3znEp8cuE4lbh+0NIqCIlRqN6hOsVHc
 NBUKvTYJgFphynebyrrdNuPY2rAx1ixETvE84bufagH96rg/QteKoQNu25PnT8ao0Itk
 iFYhlmoXrwxKIGXX0gElKp+LoXToMt7F4Ms+lSflR+x3iy+PLgU/r1payraLhASTbpaN
 rtxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ostFdFduA8VJQbdYun/a8v7V9oLZ2nQ4qLyqomH/nUo=;
 b=EGd7h7EqtgVbi6hVkAF2U/OSAHnBcZ6Fz+X4MqEv/4ittYn4elDk1Un6BV6bwOHTIL
 kVNDDf5am+W0REKmH5BgUT5yccUFLKtP08Krd62Mn2VBjdNTdo+uCNUc7d8y6f9NHIJ3
 pyB7zAaq1NTX8ojaftcBJln1NDadbQaIEEpVRLw/J6jgPB5HSs3Ac7bejOF927Cs7zNT
 RHsGvBY/6lBB+l01+1KY/nCBOOhNKoeM8G2YsyqXy9mvJsyEnfuGV93E3OcIEVlrzb5I
 X6LL2D3zI+1FcAw2o0xVyLceJoKiTasSVK6HaKW2XRGMeFHyamyBbn+RMYav8D6giCv/
 gVPA==
X-Gm-Message-State: AFqh2krqjIOtRfjUmBlt9bZJpozOaiIKboQ+b/v5j3UkQxOKpPwrvEe7
 dHw9hacXsmC39YAIbIlUZC6mAvb/kz1mIwto
X-Google-Smtp-Source: AMrXdXtP0Ui0b2hBx7NHtBze8v+zdSqTXs6aUE7faqv0xwYoEZhCWQ/aBwDwRmY3x3v8mwVBFvbpLA==
X-Received: by 2002:a17:906:5012:b0:7c1:2e19:ba3f with SMTP id
 s18-20020a170906501200b007c12e19ba3fmr47063708ejj.57.1672869944488; 
 Wed, 04 Jan 2023 14:05:44 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a1709063caa00b007bd28b50305sm15541696ejh.200.2023.01.04.14.05.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:05:44 -0800 (PST)
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
Subject: [PATCH 06/20] hw/riscv: Use generic DeviceState instead of PFlashCFI01
Date: Wed,  4 Jan 2023 23:04:35 +0100
Message-Id: <20230104220449.41337-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
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
 hw/riscv/virt.c         | 9 +++++----
 include/hw/riscv/virt.h | 3 +--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 400bd9329f..b421a9dc12 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -46,6 +46,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tpm.h"
+#include "hw/block/flash.h"
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
@@ -106,7 +107,7 @@ static MemMapEntry virt_high_pcie_memmap;
 
 #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
 
-static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
+static DeviceState *virt_flash_create1(RISCVVirtState *s,
                                        const char *name,
                                        const char *alias_prop_name)
 {
@@ -130,7 +131,7 @@ static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
     object_property_add_alias(OBJECT(s), alias_prop_name,
                               OBJECT(dev), "drive");
 
-    return PFLASH_CFI01(dev);
+    return dev;
 }
 
 static void virt_flash_create(RISCVVirtState *s)
@@ -139,7 +140,7 @@ static void virt_flash_create(RISCVVirtState *s)
     s->flash[1] = virt_flash_create1(s, "virt.flash1", "pflash1");
 }
 
-static void virt_flash_map1(PFlashCFI01 *flash,
+static void virt_flash_map1(DeviceState *flash,
                             hwaddr base, hwaddr size,
                             MemoryRegion *sysmem)
 {
@@ -1517,7 +1518,7 @@ static void virt_machine_init(MachineState *machine)
 
     for (i = 0; i < ARRAY_SIZE(s->flash); i++) {
         /* Map legacy -drive if=pflash to machine properties */
-        pflash_cfi01_legacy_drive(DEVICE(s->flash[i]),
+        pflash_cfi01_legacy_drive(s->flash[i],
                                   drive_get(IF_PFLASH, 0, i));
     }
     virt_flash_map(s, system_memory);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index be4ab8fe7f..b700a46763 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -21,7 +21,6 @@
 
 #include "hw/riscv/riscv_hart.h"
 #include "hw/sysbus.h"
-#include "hw/block/flash.h"
 #include "qom/object.h"
 
 #define VIRT_CPUS_MAX_BITS             9
@@ -49,7 +48,7 @@ struct RISCVVirtState {
     DeviceState *platform_bus_dev;
     RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
     DeviceState *irqchip[VIRT_SOCKETS_MAX];
-    PFlashCFI01 *flash[2];
+    DeviceState *flash[2];
     FWCfgState *fw_cfg;
 
     int fdt_size;
-- 
2.38.1


