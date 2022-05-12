Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8430524386
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 05:39:15 +0200 (CEST)
Received: from localhost ([::1]:36124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nozfW-0001zu-Qr
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 23:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nozMr-00042v-Io
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:19:57 -0400
Received: from mga05.intel.com ([192.55.52.43]:34738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nozMp-0002uQ-Oa
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652325595; x=1683861595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M/0DXsoAdTsomv46aC1DMtYHZIlgvh0t6pKtEL4u3kU=;
 b=khPL4Bw6zkRBjAFAxu5xI7lSLbzEijc2i1VSCfvMbc7B0xGwC384MMl/
 f6pf9a2j6+8hpd3rwKnFAF9XuLiVYcG2lpFossQsRhnuiBgerF4KbIREM
 8GFEFhcJGluynI0qZ0QUJs08um1k1oyVCr/UPa2mV9Q9DOGMuK+LLIrQ1
 UoYVBvfmbC3x07wGGuCkA2k2j0sPqKMwz4c5Y8E/m0PtdoruCNjsgr2LG
 iHKvdccdWLtlJzQLFDON6vr+YjUTPsCX7ZrjJNz/Z7av5Qsxmqbv8ePC+
 BL0yw56HSGscofe1Sb2urCGlIY3vabD53ffuJMCTKOgPPNu9luXotK74I A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="356298545"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="356298545"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 20:19:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="594455893"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2022 20:19:28 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
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
Subject: [RFC PATCH v4 17/36] i386/tdx: Parse TDVF metadata for TDX VM
Date: Thu, 12 May 2022 11:17:44 +0800
Message-Id: <20220512031803.3315890-18-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220512031803.3315890-1-xiaoyao.li@intel.com>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=xiaoyao.li@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TDX cannot support pflash device since it doesn't support read-only
memslot and doesn't support emulation. Load TDVF(OVMF) with -bios option
for TDs.

When boot a TD, besides load TDVF to the address below 4G, it needs
parse TDVF metadata.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 hw/i386/pc_sysfw.c         | 7 +++++++
 hw/i386/x86.c              | 3 ++-
 target/i386/kvm/tdx-stub.c | 5 +++++
 target/i386/kvm/tdx.c      | 4 ++++
 target/i386/kvm/tdx.h      | 4 ++++
 5 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index c8d9e71b889b..cf63434ba89d 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -37,6 +37,7 @@
 #include "hw/block/flash.h"
 #include "sysemu/kvm.h"
 #include "sev.h"
+#include "kvm/tdx.h"
 
 #define FLASH_SECTOR_SIZE 4096
 
@@ -265,5 +266,11 @@ void x86_firmware_configure(void *ptr, int size)
         }
 
         sev_encrypt_flash(ptr, size, &error_fatal);
+    } else if (is_tdx_vm()) {
+        ret = tdx_parse_tdvf(ptr, size);
+        if (ret) {
+            error_report("failed to parse TDVF for TDX VM");
+            exit(1);
+        }
     }
 }
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 4d0b0047627d..fdf6af2f6add 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -47,6 +47,7 @@
 #include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "target/i386/sev.h"
+#include "kvm/tdx.h"
 
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/irq.h"
@@ -1115,7 +1116,7 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
     }
     bios = g_malloc(sizeof(*bios));
     memory_region_init_ram(bios, NULL, "pc.bios", bios_size, &error_fatal);
-    if (sev_enabled()) {
+    if (sev_enabled() || is_tdx_vm()) {
         /*
          * The concept of a "reset" simply doesn't exist for
          * confidential computing guests, we have to destroy and
diff --git a/target/i386/kvm/tdx-stub.c b/target/i386/kvm/tdx-stub.c
index 2871de9d7b56..395a59721266 100644
--- a/target/i386/kvm/tdx-stub.c
+++ b/target/i386/kvm/tdx-stub.c
@@ -12,3 +12,8 @@ int tdx_pre_create_vcpu(CPUState *cpu)
 {
     return -EINVAL;
 }
+
+int tdx_parse_tdvf(void *flash_ptr, int size)
+{
+    return -EINVAL;
+}
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 23bc3c32b14a..2953d2728b32 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -261,6 +261,10 @@ out:
     qemu_mutex_unlock(&tdx_guest->lock);
     return r;
 }
+int tdx_parse_tdvf(void *flash_ptr, int size)
+{
+    return tdvf_parse_metadata(&tdx_guest->tdvf, flash_ptr, size);
+}
 
 /* tdx guest */
 OBJECT_DEFINE_TYPE_WITH_INTERFACES(TdxGuest,
diff --git a/target/i386/kvm/tdx.h b/target/i386/kvm/tdx.h
index 46a24ee8c7cc..12bcf25bb95b 100644
--- a/target/i386/kvm/tdx.h
+++ b/target/i386/kvm/tdx.h
@@ -6,6 +6,7 @@
 #endif
 
 #include "exec/confidential-guest-support.h"
+#include "hw/i386/tdvf.h"
 
 #define TYPE_TDX_GUEST "tdx-guest"
 #define TDX_GUEST(obj)  OBJECT_CHECK(TdxGuest, (obj), TYPE_TDX_GUEST)
@@ -21,6 +22,8 @@ typedef struct TdxGuest {
 
     bool initialized;
     uint64_t attributes;    /* TD attributes */
+
+    TdxFirmware tdvf;
 } TdxGuest;
 
 #ifdef CONFIG_TDX
@@ -33,5 +36,6 @@ int tdx_kvm_init(MachineState *ms, Error **errp);
 void tdx_get_supported_cpuid(uint32_t function, uint32_t index, int reg,
                              uint32_t *ret);
 int tdx_pre_create_vcpu(CPUState *cpu);
+int tdx_parse_tdvf(void *flash_ptr, int size);
 
 #endif /* QEMU_I386_TDX_H */
-- 
2.27.0


