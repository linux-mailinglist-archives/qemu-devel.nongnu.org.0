Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54F33BF35E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:15:00 +0200 (CEST)
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Id1-0000JJ-Pw
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKx-0002HY-4t
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:19 -0400
Received: from mga06.intel.com ([134.134.136.31]:36379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKt-0007L4-5C
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:18 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="270534901"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="270534901"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770047"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:55 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 18/44] hw/i386: refactor e820_add_entry()
Date: Wed,  7 Jul 2021 17:54:48 -0700
Message-Id: <876d3849f5293e7902df6e6f1dc8e89662b42a6b.1625704981.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=isaku.yamahata@intel.com; helo=mga06.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

The following patch will utilize this refactoring.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/i386/e820_memory_layout.c | 42 ++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
index bcf9eaf837..d9bb11c02a 100644
--- a/hw/i386/e820_memory_layout.c
+++ b/hw/i386/e820_memory_layout.c
@@ -14,31 +14,45 @@ static size_t e820_entries;
 struct e820_table e820_reserve;
 struct e820_entry *e820_table;
 
-int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
+static int e820_append_reserve(uint64_t address, uint64_t length, uint32_t type)
 {
     int index = le32_to_cpu(e820_reserve.count);
     struct e820_entry *entry;
 
-    if (type != E820_RAM) {
-        /* old FW_CFG_E820_TABLE entry -- reservations only */
-        if (index >= E820_NR_ENTRIES) {
-            return -EBUSY;
-        }
-        entry = &e820_reserve.entry[index++];
+    /* old FW_CFG_E820_TABLE entry -- reservations only */
+    if (index >= E820_NR_ENTRIES) {
+        return -EBUSY;
+    }
+    entry = &e820_reserve.entry[index++];
 
-        entry->address = cpu_to_le64(address);
-        entry->length = cpu_to_le64(length);
-        entry->type = cpu_to_le32(type);
+    entry->address = cpu_to_le64(address);
+    entry->length = cpu_to_le64(length);
+    entry->type = cpu_to_le32(type);
 
-        e820_reserve.count = cpu_to_le32(index);
-    }
+    e820_reserve.count = cpu_to_le32(index);
+    return 0;
+}
 
-    /* new "etc/e820" file -- include ram too */
-    e820_table = g_renew(struct e820_entry, e820_table, e820_entries + 1);
+static void e820_append_entry(uint64_t address, uint64_t length, uint32_t type)
+{
     e820_table[e820_entries].address = cpu_to_le64(address);
     e820_table[e820_entries].length = cpu_to_le64(length);
     e820_table[e820_entries].type = cpu_to_le32(type);
     e820_entries++;
+}
+
+int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
+{
+    if (type != E820_RAM) {
+        int ret = e820_append_reserve(address, length, type);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    /* new "etc/e820" file -- include ram too */
+    e820_table = g_renew(struct e820_entry, e820_table, e820_entries + 1);
+    e820_append_entry(address, length, type);
 
     return e820_entries;
 }
-- 
2.25.1


