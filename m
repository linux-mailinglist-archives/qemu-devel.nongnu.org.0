Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7DD524392
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 05:43:30 +0200 (CEST)
Received: from localhost ([::1]:45814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nozjd-00008k-7F
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 23:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nozMu-0004DZ-Id
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:20:00 -0400
Received: from mga07.intel.com ([134.134.136.100]:5605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nozMs-0002tI-DY
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652325598; x=1683861598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iPfjEIWmdeRLeZ7fLOMQoVx7MutRu7zTRwQqD6FveQ4=;
 b=Pgmco8Wttk/J6E85xr8TK8Phy0a+84eSKY0VqqU/sP7L1U1i5kiwrXll
 lz8otqAytYniWSHkHf3YnvUfTArnGyESPPrkYaVTh6qTUgJwk7Y8HtC3G
 P5fvGYuFRlH+K09X3x4pzubAPYFvO5lZuRDPJMAW6BdjB8eGHUZhyqPVB
 sXWIV4B1r93uW93+Db3C4tKYzQyXBkgHrTQBNYwDvqGa8jAY3tpCZF9Gh
 E6qjksZ0o2598flJ3hZZEvSxq82KkKw6f5n05Ixg21aBL6mRxgw2528T2
 Wr+0AgJtLWu5rjD8odlIN5aRoFlqZJTplMrIJ5yOAdxxA1STdmpqbJaCK Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="332915059"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="332915059"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 20:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="594456181"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2022 20:19:53 -0700
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
Subject: [RFC PATCH v4 22/36] i386/tdx: Track RAM entries for TDX VM
Date: Thu, 12 May 2022 11:17:49 +0800
Message-Id: <20220512031803.3315890-23-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220512031803.3315890-1-xiaoyao.li@intel.com>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=xiaoyao.li@intel.com; helo=mga07.intel.com
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

The RAM of TDX VM can be classified into two types:

 - TDX_RAM_UNACCEPTED: default type of TDX memory, which needs to be
   accepted by TDX guest before it can be used and will be all-zeros
   after being accepted.

 - TDX_RAM_ADDED: the RAM that is ADD'ed to TD guest before running, and
   can be used directly. E.g., TD HOB and TEMP MEM that needed by TDVF.

Maintain TdxRamEntries[] which grabs the initial RAM info from e820 table
and mark each RAM range as default type TDX_RAM_UNACCEPTED.

Then turn the range of TD HOB and TEMP MEM to TDX_RAM_ADDED since these
ranges will be ADD'ed before TD runs and no need to be accepted runtime.

The TdxRamEntries[] are later used to setup the memory TD resource HOB
that passes memory info from QEMU to TDVF.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/kvm/tdx.c | 99 +++++++++++++++++++++++++++++++++++++++++++
 target/i386/kvm/tdx.h | 14 ++++++
 2 files changed, 113 insertions(+)

diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 8bac49419f37..e7071bfe4c9c 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -19,6 +19,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/sysemu.h"
 
+#include "hw/i386/e820_memory_layout.h"
 #include "hw/i386/x86.h"
 #include "hw/i386/tdvf.h"
 #include "kvm_i386.h"
@@ -129,11 +130,105 @@ static void get_tdx_capabilities(void)
     tdx_caps = caps;
 }
 
+static void tdx_add_ram_entry(uint64_t address, uint64_t length, uint32_t type)
+{
+    uint32_t nr_entries = tdx_guest->nr_ram_entries;
+    tdx_guest->ram_entries = g_renew(TdxRamEntry, tdx_guest->ram_entries,
+                                     nr_entries + 1);
+
+    tdx_guest->ram_entries[nr_entries].address = address;
+    tdx_guest->ram_entries[nr_entries].length = length;
+    tdx_guest->ram_entries[nr_entries].type = type;
+    tdx_guest->nr_ram_entries++;
+}
+
+static int tdx_accept_ram_range(uint64_t address, uint64_t length)
+{
+    TdxRamEntry *e;
+    int i;
+
+    for (i = 0; i < tdx_guest->nr_ram_entries; i++) {
+        e = &tdx_guest->ram_entries[i];
+
+        if (address + length < e->address ||
+            e->address + e->length < address) {
+                continue;
+        }
+
+        if (e->address > address ||
+            e->address + e->length < address + length) {
+            return -EINVAL;
+        }
+
+        if (e->address == address && e->length == length) {
+            e->type = TDX_RAM_ADDED;
+        } else if (e->address == address) {
+            e->address += length;
+            e->length -= length;
+            tdx_add_ram_entry(address, length, TDX_RAM_ADDED);
+        } else if (e->address + e->length == address + length) {
+            e->length -= length;
+            tdx_add_ram_entry(address, length, TDX_RAM_ADDED);
+        } else {
+            TdxRamEntry tmp = {
+                .address = e->address,
+                .length = e->length,
+            };
+            e->length = address - tmp.address;
+
+            tdx_add_ram_entry(address, length, TDX_RAM_ADDED);
+            tdx_add_ram_entry(address + length,
+                              tmp.address + tmp.length - (address + length),
+                              TDX_RAM_UNACCEPTED);
+        }
+
+        return 0;
+    }
+
+    return -1;
+}
+
+static int tdx_ram_entry_compare(const void *lhs_, const void* rhs_)
+{
+    const TdxRamEntry *lhs = lhs_;
+    const TdxRamEntry *rhs = rhs_;
+
+    if (lhs->address == rhs->address) {
+        return 0;
+    }
+    if (le64_to_cpu(lhs->address) > le64_to_cpu(rhs->address)) {
+        return 1;
+    }
+    return -1;
+}
+
+static void tdx_init_ram_entries(void)
+{
+    unsigned i, j, nr_e820_entries;
+
+    nr_e820_entries = e820_get_num_entries();
+    tdx_guest->ram_entries = g_new(TdxRamEntry, nr_e820_entries);
+
+    for (i = 0, j = 0; i < nr_e820_entries; i++) {
+        uint64_t addr, len;
+
+        if (e820_get_entry(i, E820_RAM, &addr, &len)) {
+            tdx_guest->ram_entries[j].address = addr;
+            tdx_guest->ram_entries[j].length = len;
+            tdx_guest->ram_entries[j].type = TDX_RAM_UNACCEPTED;
+            j++;
+        }
+    }
+    tdx_guest->nr_ram_entries = j;
+}
+
 static void tdx_finalize_vm(Notifier *notifier, void *unused)
 {
     TdxFirmware *tdvf = &tdx_guest->tdvf;
     TdxFirmwareEntry *entry;
 
+    tdx_init_ram_entries();
+
     for_each_tdx_fw_entry(tdvf, entry) {
         switch (entry->type) {
         case TDVF_SECTION_TYPE_BFV:
@@ -144,12 +239,16 @@ static void tdx_finalize_vm(Notifier *notifier, void *unused)
         case TDVF_SECTION_TYPE_TEMP_MEM:
             entry->mem_ptr = qemu_ram_mmap(-1, entry->size,
                                            qemu_real_host_page_size(), 0, 0);
+            tdx_accept_ram_range(entry->address, entry->size);
             break;
         default:
             error_report("Unsupported TDVF section %d", entry->type);
             exit(1);
         }
     }
+
+    qsort(tdx_guest->ram_entries, tdx_guest->nr_ram_entries,
+          sizeof(TdxRamEntry), &tdx_ram_entry_compare);
 }
 
 static Notifier tdx_machine_done_notify = {
diff --git a/target/i386/kvm/tdx.h b/target/i386/kvm/tdx.h
index 12bcf25bb95b..5792518afa62 100644
--- a/target/i386/kvm/tdx.h
+++ b/target/i386/kvm/tdx.h
@@ -15,6 +15,17 @@ typedef struct TdxGuestClass {
     ConfidentialGuestSupportClass parent_class;
 } TdxGuestClass;
 
+enum TdxRamType{
+    TDX_RAM_UNACCEPTED,
+    TDX_RAM_ADDED,
+};
+
+typedef struct TdxRamEntry {
+    uint64_t address;
+    uint64_t length;
+    uint32_t type;
+} TdxRamEntry;
+
 typedef struct TdxGuest {
     ConfidentialGuestSupport parent_obj;
 
@@ -24,6 +35,9 @@ typedef struct TdxGuest {
     uint64_t attributes;    /* TD attributes */
 
     TdxFirmware tdvf;
+
+    uint32_t nr_ram_entries;
+    TdxRamEntry *ram_entries;
 } TdxGuest;
 
 #ifdef CONFIG_TDX
-- 
2.27.0


