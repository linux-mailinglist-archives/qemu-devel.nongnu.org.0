Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66924DC922
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:44:26 +0100 (CET)
Received: from localhost ([::1]:38050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrMX-0004Xu-FP
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:44:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqh4-00010T-QC
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:01:34 -0400
Received: from mga12.intel.com ([192.55.52.136]:25019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqh2-0004LN-Mb
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647525692; x=1679061692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oEeqQmOKoOKto7Xte1cDFjAzm6xqCAOTTDxwehnmZN0=;
 b=YmtrZU8znQCpKec01E05v4BGqeg4fm448LjNOo3IPFroWQwb69hIg8fH
 UOdmJJk1VBuxVfnThu+J725Oyt7vZoCGTNccT3pO20NnktZJgD65Petkr
 7lM0Yq1QJtWQNdF1Ku6ZheYCx9hAcNrL8MPyk14CkKwWg0AnIHpp7qPQQ
 qZnam2zJTsdtB1fHyNo8bkGElVvZAtdL4FFDS7TsKF8kqJO3jblfuYgwB
 5R722ogTWVcNNGrbdyQPGi5ngJqFxYeZjcosc734hzSI/Xt8M973xNjZx
 9QdR79T28fh+LXe8x6fmE+6PvSwD5yRBpizSD0MCepFbHyjdncOEa4qeF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="236817136"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="236817136"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 07:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="541378427"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 07:00:43 -0700
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
Subject: [RFC PATCH v3 20/36] i386/tdx: Get and store the mem_ptr of TDVF
 firmware
Date: Thu, 17 Mar 2022 21:58:57 +0800
Message-Id: <20220317135913.2166202-21-xiaoyao.li@intel.com>
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

QEMU needs to later copy the context of TDVF firmware to guest private
memory. So get the mem_ptr of CODE.fd and VARS.fd and store them in
tdx_guest object.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 hw/i386/pc_sysfw.c         | 20 ++++++++++++--------
 include/hw/i386/tdvf.h     |  4 ++++
 target/i386/kvm/tdx-stub.c |  5 +++++
 target/i386/kvm/tdx.c      |  7 +++++++
 target/i386/kvm/tdx.h      |  1 +
 5 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index bdec29fd9519..fbe3e42278cd 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -147,8 +147,8 @@ static void pc_system_flash_map(PCMachineState *pcms,
     int64_t size;
     PFlashCFI01 *system_flash;
     MemoryRegion *flash_mem;
-    void *flash_ptr;
-    int flash_size;
+    void *flash_ptr[2] = {NULL, NULL};
+    int flash_size[2];
     int ret;
 
     assert(PC_MACHINE_GET_CLASS(pcms)->pci_enabled);
@@ -197,29 +197,29 @@ static void pc_system_flash_map(PCMachineState *pcms,
                             0x100000000ULL - total_size);
         }
 
+        flash_ptr[i] = memory_region_get_ram_ptr(flash_mem);
+        flash_size[i] = memory_region_size(flash_mem);
         if (i == 0) {
             pc_isa_bios_init(rom_memory, flash_mem, size);
 
-            flash_ptr = memory_region_get_ram_ptr(flash_mem);
-            flash_size = memory_region_size(flash_mem);
             /*
              * OVMF places a GUIDed structures in the flash, so
              * search for them
              */
-            pc_system_parse_ovmf_flash(flash_ptr, flash_size);
+            pc_system_parse_ovmf_flash(flash_ptr[i], flash_size[i]);
 
             /* Encrypt the pflash boot ROM */
             if (sev_enabled()) {
 
-                ret = sev_es_save_reset_vector(flash_ptr, flash_size);
+                ret = sev_es_save_reset_vector(flash_ptr[i], flash_size[i]);
                 if (ret) {
                     error_report("failed to locate and/or save reset vector");
                     exit(1);
                 }
 
-                sev_encrypt_flash(flash_ptr, flash_size, &error_fatal);
+                sev_encrypt_flash(flash_ptr[i], flash_size[i], &error_fatal);
             } else if (is_tdx_vm()) {
-                ret = tdx_parse_tdvf(flash_ptr, flash_size);
+                ret = tdx_parse_tdvf(flash_ptr[i], flash_size[i]);
                 if (ret) {
                     error_report("failed to parse TDVF in pflash for TDX VM");
                     exit(1);
@@ -227,6 +227,10 @@ static void pc_system_flash_map(PCMachineState *pcms,
             }
         }
     }
+
+    if (is_tdx_vm()) {
+        tdx_set_code_vars_ptr(flash_ptr[0], flash_ptr[1]);
+    }
 }
 
 void pc_system_firmware_init(PCMachineState *pcms,
diff --git a/include/hw/i386/tdvf.h b/include/hw/i386/tdvf.h
index 593341eb2e93..773bd39a3bff 100644
--- a/include/hw/i386/tdvf.h
+++ b/include/hw/i386/tdvf.h
@@ -42,6 +42,10 @@ typedef struct TdxFirmwareEntry {
 } TdxFirmwareEntry;
 
 typedef struct TdxFirmware {
+    bool split_tdvf;
+    void *code_ptr;
+    void *vars_ptr;
+
     uint32_t nr_entries;
     TdxFirmwareEntry *entries;
 } TdxFirmware;
diff --git a/target/i386/kvm/tdx-stub.c b/target/i386/kvm/tdx-stub.c
index 395a59721266..b548b4578276 100644
--- a/target/i386/kvm/tdx-stub.c
+++ b/target/i386/kvm/tdx-stub.c
@@ -17,3 +17,8 @@ int tdx_parse_tdvf(void *flash_ptr, int size)
 {
     return -EINVAL;
 }
+
+void tdx_set_code_vars_ptr(void *code_ptr, void *vars_ptr)
+{
+    g_assert_not_reached();
+}
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 7f34b14dc504..cd88b6dfc280 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -265,6 +265,13 @@ int tdx_parse_tdvf(void *flash_ptr, int size)
     return tdvf_parse_metadata(&tdx_guest->tdvf, flash_ptr, size);
 }
 
+void tdx_set_code_vars_ptr(void *code_ptr, void *vars_ptr)
+{
+    tdx_guest->tdvf.code_ptr = code_ptr;
+    tdx_guest->tdvf.vars_ptr = vars_ptr;
+    tdx_guest->tdvf.split_tdvf = vars_ptr ? true : false;
+}
+
 static bool tdx_guest_get_sept_ve_disable(Object *obj, Error **errp)
 {
     TdxGuest *tdx = TDX_GUEST(obj);
diff --git a/target/i386/kvm/tdx.h b/target/i386/kvm/tdx.h
index 12bcf25bb95b..b3cedd0d5d0c 100644
--- a/target/i386/kvm/tdx.h
+++ b/target/i386/kvm/tdx.h
@@ -37,5 +37,6 @@ void tdx_get_supported_cpuid(uint32_t function, uint32_t index, int reg,
                              uint32_t *ret);
 int tdx_pre_create_vcpu(CPUState *cpu);
 int tdx_parse_tdvf(void *flash_ptr, int size);
+void tdx_set_code_vars_ptr(void *code_ptr, void *vars_ptr);
 
 #endif /* QEMU_I386_TDX_H */
-- 
2.27.0


