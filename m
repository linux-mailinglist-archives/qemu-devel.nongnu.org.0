Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5086625A9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:33:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqxp-00005Y-EZ; Mon, 09 Jan 2023 07:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxk-0008W2-6h
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:12 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxi-0005zG-Iv
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:11 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so7017346wml.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RlZzQsn6LG39OnRXiNzAdXltRv/HPGk8unzxKgnfU6M=;
 b=dO0T4HaZ9g5WFHME+0loKXa6sUjYWH+rPgUokm3oskdePX6NGY+UrljVjwILlkI86P
 qMbW4upTk1lcz2IAQgQs0PXHUs0qLSFP2JMKCDcGYLcxaKTIpjfOIUyfofJUciW6x4kx
 AG7maSg7s+CDfVwfXSaib7bcGAA+BwWax+ztCXsEkhUsbV/YeyptPokqmlJMx5uamqbP
 XiAEJuJ9DYJauLwm9dKWTNGlSX7oZ3RrWfkLNdEV3K+9xrCPMasSSwwNwbidCI3uv5K7
 4AiEl27XrcieKxambVpSDXVXiLGP7kRvXuYozstimXLdjc/WMWGH4pL+Tz8o2O0+aglQ
 mhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RlZzQsn6LG39OnRXiNzAdXltRv/HPGk8unzxKgnfU6M=;
 b=b+JdRvGACwGAG7HKRmZKMAcJgdsg4dNIDyCSmQZDId+f3DDgaHLO71GKxYNuGiX896
 W0yFdHM22e2mrKVEGFG7KHvB1aVCKAz7cfoDocc4O3HQqLdw8O5BlzwTmd5io7dPA35X
 /s2JKW3jayxPHOEa6bN8JIeuVmaZY7v4nrjQOU3PJ/WIclSW4nTfFPIm1oAKSxxXIhg/
 I3gTzPNCDjwdky7bK0RhDHIcmaPJmuXJ8f7e9dlbUINtj4lXqMwuvnh3HNAyClBpv/Q6
 YYay9q7jZVcC+MbEBdus7lD5f621WHbncTkIEa+l/w5kdLxA03k5qyk5r/QKoX9iSgjS
 hzAg==
X-Gm-Message-State: AFqh2kp4DgAhC5f9kMGR6V8CQRhz9kxO/TtQg9vbYn8uOKGIB9W4yZ5h
 Pkms2SW1WyAa9GryxrRGtY/Iclf7ioHQJ21B
X-Google-Smtp-Source: AMrXdXtrpABj/03F5CWvqmV03iWrMn/RQxhSrwc6+gsYPoQm+HxIL1IXPEjgJelfeAq88oW+Z9RidA==
X-Received: by 2002:a05:600c:13ca:b0:3d3:4427:dfbf with SMTP id
 e10-20020a05600c13ca00b003d34427dfbfmr45606329wmg.5.1673266148780; 
 Mon, 09 Jan 2023 04:09:08 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c155300b003d98a7aa12csm17583162wmg.16.2023.01.09.04.09.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:09:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 07/21] hw/riscv: Use generic DeviceState instead of
 PFlashCFI01
Date: Mon,  9 Jan 2023 13:08:19 +0100
Message-Id: <20230109120833.3330-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Nothing here requires access to PFlashCFI01 internal fields:
use the inherited generic DeviceState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/riscv/virt.c         | 9 +++++----
 include/hw/riscv/virt.h | 3 +--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index aa8db65685..a2cd174599 100644
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
@@ -1514,7 +1515,7 @@ static void virt_machine_init(MachineState *machine)
 
     for (i = 0; i < ARRAY_SIZE(s->flash); i++) {
         /* Map legacy -drive if=pflash to machine properties */
-        pflash_cfi01_legacy_drive(DEVICE(s->flash[i]),
+        pflash_cfi01_legacy_drive(s->flash[i],
                                   drive_get(IF_PFLASH, 0, i));
     }
     virt_flash_map(s, system_memory);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 3407c9e8dd..2be47547ac 100644
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


