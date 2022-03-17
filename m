Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C9B4DC912
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:41:30 +0100 (CET)
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrJh-00074C-BD
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:41:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqh1-0000uS-DJ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:01:31 -0400
Received: from mga12.intel.com ([192.55.52.136]:25019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqgv-0004LN-Lx
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647525685; x=1679061685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A+2XP4jbSe3PB7Mapyen8YX1FnexO4Fy/hlr8NnZ0hc=;
 b=Oxc7+UnxBWAHSS+Nas2MzxetcSXd1q59anvlwQwfdydlRxJu+itP+ftP
 Hh7IGFvCNfe5TbMn+ss/9yZpk2PsCNXeO0QPFceovbLts3LV5MwgQK8rZ
 U3HyW/GQ+5ZeWdqr/7somEDx+0zvk9cUjQKas3SD6CQRjeIO+mHFlfcsi
 50w5xMhIsG4gjKoMFSQc8tjm5XjgMG2ny/CbV9TY/SWxc370JraT7McJC
 0pOW6dwVHxt/3Z1Rj6IqrXMygERZw9ario9nqc/Kp8vcljWdDzQ/MMBnZ
 0X5AdtthjGK0sNUb24lpqRkYx0Nh4SbJz5Mh1U3Hc3r3qXBBWy2qQIgQS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="236817080"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="236817080"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 07:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="541378400"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 07:00:39 -0700
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
Subject: [RFC PATCH v3 19/36] i386/tdx: Parse TDVF metadata for TDX VM
Date: Thu, 17 Mar 2022 21:58:56 +0800
Message-Id: <20220317135913.2166202-20-xiaoyao.li@intel.com>
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

When boot a TDX VM, parse firmware as TDVF. Only enable this on the case
that firmware is provided as flash, since it's the correct interface to
specify firmware for uefi guest.

- When unified firmware is provided, there is only one pflsh, pflash[0];

- When split images (CODE.fd and VARs.fd) are provided, metadata is
  located in CODE.fd, which means pflash[0].

So parse TDVF on plash[0].

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 hw/i386/pc_sysfw.c         | 21 ++++++++++++++-------
 target/i386/kvm/tdx-stub.c |  5 +++++
 target/i386/kvm/tdx.c      |  4 ++++
 target/i386/kvm/tdx.h      |  4 ++++
 4 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 03c84b5aaa32..bdec29fd9519 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -200,15 +200,16 @@ static void pc_system_flash_map(PCMachineState *pcms,
         if (i == 0) {
             pc_isa_bios_init(rom_memory, flash_mem, size);
 
+            flash_ptr = memory_region_get_ram_ptr(flash_mem);
+            flash_size = memory_region_size(flash_mem);
+            /*
+             * OVMF places a GUIDed structures in the flash, so
+             * search for them
+             */
+            pc_system_parse_ovmf_flash(flash_ptr, flash_size);
+
             /* Encrypt the pflash boot ROM */
             if (sev_enabled()) {
-                flash_ptr = memory_region_get_ram_ptr(flash_mem);
-                flash_size = memory_region_size(flash_mem);
-                /*
-                 * OVMF places a GUIDed structures in the flash, so
-                 * search for them
-                 */
-                pc_system_parse_ovmf_flash(flash_ptr, flash_size);
 
                 ret = sev_es_save_reset_vector(flash_ptr, flash_size);
                 if (ret) {
@@ -217,6 +218,12 @@ static void pc_system_flash_map(PCMachineState *pcms,
                 }
 
                 sev_encrypt_flash(flash_ptr, flash_size, &error_fatal);
+            } else if (is_tdx_vm()) {
+                ret = tdx_parse_tdvf(flash_ptr, flash_size);
+                if (ret) {
+                    error_report("failed to parse TDVF in pflash for TDX VM");
+                    exit(1);
+                }
             }
         }
     }
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
index 1bb8211e74e6..7f34b14dc504 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -260,6 +260,10 @@ out:
     qemu_mutex_unlock(&tdx_guest->lock);
     return r;
 }
+int tdx_parse_tdvf(void *flash_ptr, int size)
+{
+    return tdvf_parse_metadata(&tdx_guest->tdvf, flash_ptr, size);
+}
 
 static bool tdx_guest_get_sept_ve_disable(Object *obj, Error **errp)
 {
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


