Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8634458790E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 10:33:43 +0200 (CEST)
Received: from localhost ([::1]:39650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oInLS-00054F-Ja
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 04:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oImfC-0005Ja-TW
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:50:11 -0400
Received: from mga07.intel.com ([134.134.136.100]:3383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oImeu-0006BA-6g
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659426584; x=1690962584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nnEzWTZZAQAOd1+B5KqBcumEqs9fwgWi9g0A4eLHcuo=;
 b=KAms99kZO/NH2uh2zwt7d++jM32pgmcEmZEjkBNwNEt950BW5kqRHa7e
 MrQXsd2IXEqBQJhzUyY2DkkxpkEc+XojdKOjWKUZU0KoQGMgYWK5B6Rf4
 EqLliZfnRXxFUeFJ6CkJrbg5qFQB1tnyHjDDYtLDp74tUFC/uems5yx8D
 TJ0LnagzqBLfNQrQ2BQO8beNj6V3y1czH9dz58ccbk+oKKt6EeAL4M1Ox
 7+otMKeOEP7t0uUGJSAmBOaImHZ8tk/VNec+2vPKPtiqLrE/1PZaBxY/C
 AvHSZwGXUMY8VAdMaYinV1nU2/6VYuIWK749jKCvQvpZCAjbUg6HvtC6I Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="353352421"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="353352421"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 00:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="630604175"
Received: from lxy-dell.sh.intel.com ([10.239.48.38])
 by orsmga008.jf.intel.com with ESMTP; 02 Aug 2022 00:49:30 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com,
 xiaoyao.li@intel.com
Subject: [PATCH v1 23/40] i386/tdx: Don't initialize pc.rom for TDX VMs
Date: Tue,  2 Aug 2022 15:47:33 +0800
Message-Id: <20220802074750.2581308-24-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220802074750.2581308-1-xiaoyao.li@intel.com>
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=xiaoyao.li@intel.com; helo=mga07.intel.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

For TDX, the address below 1MB are entirely general RAM. No need to
initialize pc.rom memory region for TDs.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
This is more as a workaround of the issue that for q35 machine type, the
real memslot update (which requires memslot deletion )for pc.rom happens
after tdx_init_memory_region. It leads to the private memory ADD'ed
before get lost. I haven't work out a good solution to resolve the
order issue. So just skip the pc.rom setup to avoid memslot deletion.
---
 hw/i386/pc.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1f62971759bf..c089dc49485d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -62,6 +62,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "kvm/kvm_i386.h"
+#include "kvm/tdx.h"
 #include "hw/xen/xen.h"
 #include "hw/xen/start_info.h"
 #include "ui/qemu-spice.h"
@@ -1084,16 +1085,18 @@ void pc_memory_init(PCMachineState *pcms,
     /* Initialize PC system firmware */
     pc_system_firmware_init(pcms, rom_memory);
 
-    option_rom_mr = g_malloc(sizeof(*option_rom_mr));
-    memory_region_init_ram(option_rom_mr, NULL, "pc.rom", PC_ROM_SIZE,
-                           &error_fatal);
-    if (pcmc->pci_enabled) {
-        memory_region_set_readonly(option_rom_mr, true);
+    if (!is_tdx_vm()) {
+        option_rom_mr = g_malloc(sizeof(*option_rom_mr));
+        memory_region_init_ram(option_rom_mr, NULL, "pc.rom", PC_ROM_SIZE,
+                            &error_fatal);
+        if (pcmc->pci_enabled) {
+            memory_region_set_readonly(option_rom_mr, true);
+        }
+        memory_region_add_subregion_overlap(rom_memory,
+                                            PC_ROM_MIN_VGA,
+                                            option_rom_mr,
+                                            1);
     }
-    memory_region_add_subregion_overlap(rom_memory,
-                                        PC_ROM_MIN_VGA,
-                                        option_rom_mr,
-                                        1);
 
     fw_cfg = fw_cfg_arch_create(machine,
                                 x86ms->boot_cpus, x86ms->apic_id_limit);
-- 
2.27.0


