Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB244DC8E0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:37:39 +0100 (CET)
Received: from localhost ([::1]:49314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrFy-00017m-Nf
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:37:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqgm-0000gm-9F
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:01:18 -0400
Received: from mga12.intel.com ([192.55.52.136]:25019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqgj-0004LN-T6
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647525673; x=1679061673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mV+vZKgB9wWAZa80ndD8UAUUgRWr1a59i9z1xeznEGc=;
 b=YBsUeYRrcJiyz57K1rfcm0zuNFa/SR6ZufVeqk8U6diMWK+oQdArRldV
 VjnUgbiCjz81yvSOCHY49xW4WLKoADTRaxDBW7XlXdu8D8rWqKX86PdaA
 YYZhF7U3U3hsY6aJ1N5Z5hRzE/xNPiQoU18MDH0V2MVqCEGO6eftGwqYY
 9zhBoFv4P5NorBsZpybhDCMBAwD5kaQ66t8jdlpSSkuLW4RlQnhksz+yA
 smW+seO2wYgdC58dSpzE2TFAHvuUVwaUS80SZimtEQylrrbaXefY0/OeW
 40BUva9OwwPLSWy8cT6tyV9H8PCX+xsXUV+SvFrTctoTBLDiK7Kh8IWRg w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="236816983"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="236816983"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 07:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="541378304"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 07:00:29 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [RFC PATCH v3 17/36] pflash_cfi01/tdx: Introduce ram_mode of pflash
 for TDVF
Date: Thu, 17 Mar 2022 21:58:54 +0800
Message-Id: <20220317135913.2166202-18-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220317135913.2166202-1-xiaoyao.li@intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 Connor Kuehl <ckuehl@redhat.com>, seanjc@google.com, xiaoyao.li@intel.com,
 qemu-devel@nongnu.org, erdemaktas@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TDX VM needs to boot with Trust Domain Virtual Firmware (TDVF). Unlike
that OVMF is mapped as rom device, TDVF needs to be mapped as private
memory. This is because TDX architecture doesn't provide read-only
capability for VMM, and it doesn't support instruction emulation due
to guest memory and registers are not accessible for VMM.

On the other hand, OVMF can work as TDVF, which is usually configured
as pflash device in QEMU. To keep the same usage (QEMU parameter),
introduce ram_mode to pflash for TDVF. When it's creating a TDX VM,
ram_mode will be enabled automatically that map the firmware as RAM.

Note, this implies two things:
 1. TDVF (OVMF) is not read-only (write-protected).

 2. It doesn't support non-volatile UEFI variables as what pflash
    supports that the change to non-volatile UEFI variables won't get
    synced back to backend vars.fd file.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 hw/block/pflash_cfi01.c | 25 ++++++++++++++++++-------
 hw/i386/pc_sysfw.c      | 14 +++++++++++---
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 74c7190302bd..55e8bb2bd5ee 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -87,6 +87,7 @@ struct PFlashCFI01 {
     void *storage;
     VMChangeStateEntry *vmstate;
     bool old_multiple_chip_handling;
+    bool ram_mode;  /* if 1, the flash is mapped as RAM */
 };
 
 static int pflash_post_load(void *opaque, int version_id);
@@ -818,17 +819,24 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
 
     total_len = pfl->sector_len * pfl->nb_blocs;
 
-    memory_region_init_rom_device(
-        &pfl->mem, OBJECT(dev),
-        &pflash_cfi01_ops,
-        pfl,
-        pfl->name, total_len, errp);
+    if (pfl->ram_mode) {
+        memory_region_init_ram(&pfl->mem, OBJECT(dev),pfl->name, total_len, errp);
+    } else {
+        memory_region_init_rom_device(
+            &pfl->mem, OBJECT(dev),
+            &pflash_cfi01_ops,
+            pfl,
+            pfl->name, total_len, errp);
+    }
     if (*errp) {
         return;
     }
 
     pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
+
+    if (!pfl->ram_mode) {
+        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
+    }
 
     if (pfl->blk) {
         uint64_t perm;
@@ -879,7 +887,9 @@ static void pflash_cfi01_system_reset(DeviceState *dev)
      */
     pfl->cmd = 0x00;
     pfl->wcycle = 0;
-    memory_region_rom_device_set_romd(&pfl->mem, true);
+    if (!pfl->ram_mode) {
+        memory_region_rom_device_set_romd(&pfl->mem, true);
+    }
     /*
      * The WSM ready timer occurs at most 150ns after system reset.
      * This model deliberately ignores this delay.
@@ -924,6 +934,7 @@ static Property pflash_cfi01_properties[] = {
     DEFINE_PROP_STRING("name", PFlashCFI01, name),
     DEFINE_PROP_BOOL("old-multiple-chip-handling", PFlashCFI01,
                      old_multiple_chip_handling, false),
+    DEFINE_PROP_BOOL("ram-mode", PFlashCFI01, ram_mode, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 75b34d02cb4f..03c84b5aaa32 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -38,6 +38,7 @@
 #include "hw/block/flash.h"
 #include "sysemu/kvm.h"
 #include "sev.h"
+#include "kvm/tdx.h"
 
 #define FLASH_SECTOR_SIZE 4096
 
@@ -184,12 +185,19 @@ static void pc_system_flash_map(PCMachineState *pcms,
         total_size += size;
         qdev_prop_set_uint32(DEVICE(system_flash), "num-blocks",
                              size / FLASH_SECTOR_SIZE);
+        qdev_prop_set_bit(DEVICE(system_flash), "ram-mode", is_tdx_vm());
         sysbus_realize_and_unref(SYS_BUS_DEVICE(system_flash), &error_fatal);
-        sysbus_mmio_map(SYS_BUS_DEVICE(system_flash), 0,
-                        0x100000000ULL - total_size);
+        flash_mem = pflash_cfi01_get_memory(system_flash);
+        if (is_tdx_vm()) {
+            memory_region_add_subregion(get_system_memory(),
+                                        0x100000000ULL - total_size,
+                                        flash_mem);
+        } else {
+            sysbus_mmio_map(SYS_BUS_DEVICE(system_flash), 0,
+                            0x100000000ULL - total_size);
+        }
 
         if (i == 0) {
-            flash_mem = pflash_cfi01_get_memory(system_flash);
             pc_isa_bios_init(rom_memory, flash_mem, size);
 
             /* Encrypt the pflash boot ROM */
-- 
2.27.0


