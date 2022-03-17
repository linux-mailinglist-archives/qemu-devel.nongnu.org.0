Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EA94DC8C0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:27:38 +0100 (CET)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUr6H-00053l-I2
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:27:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqh7-00016I-RK
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:01:37 -0400
Received: from mga12.intel.com ([192.55.52.136]:25019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqh5-0004LN-OO
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647525695; x=1679061695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f/HYjrrPVIDfEjInD9F41PJhlI76P5ZOBWNuyMbg1eI=;
 b=U7xMUxM17Zxc5f1Cyq0jr7ZOCNI/RqUayL+PJMlMFskpgRRfsXXYQnFR
 JtShRI9Idg5eQJNe7OVrGOcEJLuRMFIuphTM3IqEVu0hgKeVJCbVHi7R3
 a7gD/ugVWLwlREbmlzdcpxr0IwP136YgHMP7QBOVjHq14JTKniK6cZ5Dm
 kNOQIfhtMV5t+DhNx26cGa/hHxef7uzeMtrDUKzKQG33kMf1Gb5LwzVpl
 QiHOhy+an0c1ORgJhBMjvIZdvs/nEaCQJvTrhP9UxpA1+YZJtf39C76M6
 EM5x5d5xkQ+4UX8snLa0IT6RVgczhL9noT1SF0VpQgDWkNf2yoYqGepCj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="236817201"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="236817201"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 07:00:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="541378457"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 07:00:48 -0700
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
Subject: [RFC PATCH v3 21/36] i386/tdx: Track mem_ptr for each firmware entry
 of TDVF
Date: Thu, 17 Mar 2022 21:58:58 +0800
Message-Id: <20220317135913.2166202-22-xiaoyao.li@intel.com>
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

For every TDVF sections, QEMU needs to copy its content to guest
private memory via KVM API, to initialize them.

So add a field @mem_ptr to track the pointer of each TDVF sections.

BFV and CFV are firmware and loaded as plfash.

TEMP_MEM and TD_HOB always locate at guest RAM before 4G, specifically
starting from 0x80 0000 (8M)

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 include/hw/i386/tdvf.h |  5 +++++
 target/i386/kvm/tdx.c  | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/hw/i386/tdvf.h b/include/hw/i386/tdvf.h
index 773bd39a3bff..ce28b7ec4543 100644
--- a/include/hw/i386/tdvf.h
+++ b/include/hw/i386/tdvf.h
@@ -39,6 +39,8 @@ typedef struct TdxFirmwareEntry {
     uint64_t size;
     uint32_t type;
     uint32_t attributes;
+
+    void *mem_ptr;
 } TdxFirmwareEntry;
 
 typedef struct TdxFirmware {
@@ -50,6 +52,9 @@ typedef struct TdxFirmware {
     TdxFirmwareEntry *entries;
 } TdxFirmware;
 
+#define for_each_tdx_fw_entry(fw, e)    \
+    for (e = (fw)->entries; e != (fw)->entries + (fw)->nr_entries; e++)
+
 int tdvf_parse_metadata(TdxFirmware *fw, void *flash_ptr, int size);
 
 #endif /* HW_I386_TDVF_H */
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index cd88b6dfc280..fe8554dcebb0 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -16,8 +16,10 @@
 #include "qom/object_interfaces.h"
 #include "standard-headers/asm-x86/kvm_para.h"
 #include "sysemu/kvm.h"
+#include "sysemu/sysemu.h"
 
 #include "hw/i386/x86.h"
+#include "hw/i386/tdvf.h"
 #include "kvm_i386.h"
 #include "tdx.h"
 
@@ -103,6 +105,44 @@ static void get_tdx_capabilities(void)
     tdx_caps = caps;
 }
 
+static void tdx_finalize_vm(Notifier *notifier, void *unused)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    void *base_ram_ptr = memory_region_get_ram_ptr(ms->ram);
+    TdxFirmware *tdvf = &tdx_guest->tdvf;
+    TdxFirmwareEntry *entry;
+
+    for_each_tdx_fw_entry(tdvf, entry) {
+        switch (entry->type) {
+        case TDVF_SECTION_TYPE_BFV:
+            if (tdvf->split_tdvf) {
+                entry->mem_ptr = tdvf->code_ptr;
+            } else {
+                entry->mem_ptr = tdvf->code_ptr + entry->data_offset;
+            }
+            break;
+        case TDVF_SECTION_TYPE_CFV:
+            if (tdvf->split_tdvf) {
+                entry->mem_ptr = tdvf->vars_ptr;
+            } else {
+                entry->mem_ptr = tdvf->code_ptr;
+            }
+            break;
+        case TDVF_SECTION_TYPE_TD_HOB:
+        case TDVF_SECTION_TYPE_TEMP_MEM:
+            entry->mem_ptr = base_ram_ptr + entry->address;
+            break;
+        default:
+            error_report("Unsupported TDVF section %d", entry->type);
+            exit(1);
+        }
+    }
+}
+
+static Notifier tdx_machine_done_notify = {
+    .notify = tdx_finalize_vm,
+};
+
 int tdx_kvm_init(MachineState *ms, Error **errp)
 {
     TdxGuest *tdx = (TdxGuest *)object_dynamic_cast(OBJECT(ms->cgs),
@@ -124,6 +164,8 @@ int tdx_kvm_init(MachineState *ms, Error **errp)
      */
     kvm_readonly_mem_allowed = false;
 
+    qemu_add_machine_init_done_notifier(&tdx_machine_done_notify);
+
     tdx_guest = tdx;
 
     return 0;
-- 
2.27.0


