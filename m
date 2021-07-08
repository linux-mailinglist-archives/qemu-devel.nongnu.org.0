Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0FE3BF35B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:14:11 +0200 (CEST)
Received: from localhost ([::1]:36646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IcE-0006EB-BF
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKx-0002JD-IO
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:19 -0400
Received: from mga06.intel.com ([134.134.136.31]:36390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKv-0007ML-OW
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="270534902"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="270534902"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770050"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:56 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 19/44] hw/i386/e820: introduce a helper function to
 change type of e820
Date: Wed,  7 Jul 2021 17:54:49 -0700
Message-Id: <57f1c8c44405aadc421bc1fd5b6cb41f55b10e20.1625704981.git.isaku.yamahata@intel.com>
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

Introduce a helper function, e820_change_type(), that change
the type of subregion of e820 entry.
The following patch uses it.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/i386/e820_memory_layout.c | 72 ++++++++++++++++++++++++++++++++++++
 hw/i386/e820_memory_layout.h |  1 +
 2 files changed, 73 insertions(+)

diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
index d9bb11c02a..109c4f715a 100644
--- a/hw/i386/e820_memory_layout.c
+++ b/hw/i386/e820_memory_layout.c
@@ -57,6 +57,78 @@ int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
     return e820_entries;
 }
 
+int e820_change_type(uint64_t address, uint64_t length, uint32_t type)
+{
+    size_t i;
+
+    if (type != E820_RAM) {
+        int ret = e820_append_reserve(address, length, type);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    /* new "etc/e820" file -- include ram too */
+    for (i = 0; i < e820_entries; i++) {
+        struct e820_entry *e = &e820_table[i];
+        struct e820_entry tmp = {
+            .address = le64_to_cpu(e->address),
+            .length = le64_to_cpu(e->length),
+            .type = le32_to_cpu(e->type),
+        };
+        /* overlap? */
+        if (address + length < tmp.address ||
+            tmp.address + tmp.length < address) {
+            continue;
+        }
+        /*
+         * partial-overlap is not allowed.
+         * It is assumed that the region is completely contained within
+         * other region.
+         */
+        if (address < tmp.address ||
+            tmp.address + tmp.length < address + length) {
+            return -EINVAL;
+        }
+        /* only real type change is allowed. */
+        if (tmp.type == type) {
+            return -EINVAL;
+        }
+
+        if (tmp.address == address &&
+            tmp.address + tmp.length == address + length) {
+            e->type = cpu_to_le32(type);
+            return e820_entries;
+        } else if (tmp.address == address) {
+            e820_table = g_renew(struct e820_entry,
+                                 e820_table, e820_entries + 1);
+            e = &e820_table[i];
+            e->address = cpu_to_le64(tmp.address + length);
+            e820_append_entry(address, length, type);
+            return e820_entries;
+        } else if (tmp.address + tmp.length == address + length) {
+            e820_table = g_renew(struct e820_entry,
+                                 e820_table, e820_entries + 1);
+            e = &e820_table[i];
+            e->length = cpu_to_le64(tmp.length - length);
+            e820_append_entry(address, length, type);
+            return e820_entries;
+        } else {
+            e820_table = g_renew(struct e820_entry,
+                                 e820_table, e820_entries + 2);
+            e = &e820_table[i];
+            e->length = cpu_to_le64(address - tmp.address);
+            e820_append_entry(address, length, type);
+            e820_append_entry(address + length,
+                              tmp.address + tmp.length - (address + length),
+                              tmp.type);
+            return e820_entries;
+        }
+    }
+
+    return -EINVAL;
+}
+
 int e820_get_num_entries(void)
 {
     return e820_entries;
diff --git a/hw/i386/e820_memory_layout.h b/hw/i386/e820_memory_layout.h
index 2a0ceb8b9c..5f27cee476 100644
--- a/hw/i386/e820_memory_layout.h
+++ b/hw/i386/e820_memory_layout.h
@@ -33,6 +33,7 @@ extern struct e820_table e820_reserve;
 extern struct e820_entry *e820_table;
 
 int e820_add_entry(uint64_t address, uint64_t length, uint32_t type);
+int e820_change_type(uint64_t address, uint64_t length, uint32_t type);
 int e820_get_num_entries(void);
 bool e820_get_entry(int index, uint32_t type,
                     uint64_t *address, uint64_t *length);
-- 
2.25.1


