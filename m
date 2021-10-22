Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E3B437597
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 12:36:34 +0200 (CEST)
Received: from localhost ([::1]:46366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdrub-0007fZ-Nr
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 06:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mdrqL-00016c-0i
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:32:09 -0400
Received: from mga06.intel.com ([134.134.136.31]:5677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mdrqI-0000Dj-HQ
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:32:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="290113948"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="290113948"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 03:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="595506398"
Received: from icx.bj.intel.com ([10.240.192.117])
 by orsmga004.jf.intel.com with ESMTP; 22 Oct 2021 03:32:01 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] numa: Support SGX numa in the monitor and Libvirt
 interfaces
Date: Fri, 22 Oct 2021 15:27:52 -0400
Message-Id: <20211022192754.58196-4-yang.zhong@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211022192754.58196-1-yang.zhong@intel.com>
References: <20211022192754.58196-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, jarkko@kernel.org,
 eblake@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the SGXEPCSection list into SGXInfo to show the multiple
SGX EPC sections detailed info, not the total size like before.
This patch can enable numa support for 'info sgx' command and
QMP interfaces. The new interfaces show each EPC section info
in one numa node. Libvirt can use QMP interface to get the
detailed host SGX EPC capabilities to decide how to allocate
host EPC sections to guest.

(qemu) info sgx
 SGX support: enabled
 SGX1 support: enabled
 SGX2 support: enabled
 FLC support: enabled
 NUMA node #0: size=67108864
 NUMA node #1: size=29360128

The QMP interface show:
(QEMU) query-sgx
{"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
[{"node": 0, "size": 67108864}, {"node": 1, "size": 29360128}], "flc": true}}

(QEMU) query-sgx-capabilities
{"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
[{"node": 0, "size": 17070817280}, {"node": 1, "size": 17079205888}], "flc": true}}

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 qapi/misc-target.json | 19 ++++++++++++++--
 hw/i386/sgx.c         | 51 +++++++++++++++++++++++++++++++++++--------
 2 files changed, 59 insertions(+), 11 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 5aa2b95b7d..1022aa0184 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -337,6 +337,21 @@
   'if': 'TARGET_ARM' }
 
 
+##
+# @SGXEPCSection:
+#
+# Information about intel SGX EPC section info
+#
+# @node: the numa node
+#
+# @size: the size of epc section
+#
+# Since: 6.2
+##
+{ 'struct': 'SGXEPCSection',
+  'data': { 'node': 'int',
+            'size': 'uint64'}}
+
 ##
 # @SGXInfo:
 #
@@ -350,7 +365,7 @@
 #
 # @flc: true if FLC is supported
 #
-# @section-size: The EPC section size for guest
+# @sections: The EPC sections info for guest
 #
 # Since: 6.2
 ##
@@ -359,7 +374,7 @@
             'sgx1': 'bool',
             'sgx2': 'bool',
             'flc': 'bool',
-            'section-size': 'uint64'},
+            'sections': ['SGXEPCSection']},
    'if': 'TARGET_I386' }
 
 ##
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 9a77519609..b5b710a556 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -76,11 +76,13 @@ static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
            ((high & MAKE_64BIT_MASK(0, 20)) << 32);
 }
 
-static uint64_t sgx_calc_host_epc_section_size(void)
+static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
 {
+    SGXEPCSectionList *head = NULL, **tail = &head;
+    SGXEPCSection *section;
     uint32_t i, type;
     uint32_t eax, ebx, ecx, edx;
-    uint64_t size = 0;
+    uint32_t j = 0;
 
     for (i = 0; i < SGX_MAX_EPC_SECTIONS; i++) {
         host_cpuid(0x12, i + 2, &eax, &ebx, &ecx, &edx);
@@ -94,10 +96,13 @@ static uint64_t sgx_calc_host_epc_section_size(void)
             break;
         }
 
-        size += sgx_calc_section_metric(ecx, edx);
+        section = g_new0(SGXEPCSection, 1);
+        section->node = j++;
+        section->size = sgx_calc_section_metric(ecx, edx);
+        QAPI_LIST_APPEND(tail, section);
     }
 
-    return size;
+    return head;
 }
 
 SGXInfo *qmp_query_sgx_capabilities(Error **errp)
@@ -121,13 +126,35 @@ SGXInfo *qmp_query_sgx_capabilities(Error **errp)
     info->sgx1 = eax & (1U << 0) ? true : false;
     info->sgx2 = eax & (1U << 1) ? true : false;
 
-    info->section_size = sgx_calc_host_epc_section_size();
+    info->sections = sgx_calc_host_epc_sections();
 
     close(fd);
 
     return info;
 }
 
+static SGXEPCSectionList *sgx_get_epc_sections_list(void)
+{
+    GSList *device_list = sgx_epc_get_device_list();
+    SGXEPCSectionList *head = NULL, **tail = &head;
+    SGXEPCSection *section;
+
+    for (; device_list; device_list = device_list->next) {
+        DeviceState *dev = device_list->data;
+        Object *obj = OBJECT(dev);
+
+        section = g_new0(SGXEPCSection, 1);
+        section->node = object_property_get_uint(obj, SGX_EPC_NUMA_NODE_PROP,
+                                                 &error_abort);
+        section->size = object_property_get_uint(obj, SGX_EPC_SIZE_PROP,
+                                                 &error_abort);
+        QAPI_LIST_APPEND(tail, section);
+    }
+    g_slist_free(device_list);
+
+    return head;
+}
+
 SGXInfo *qmp_query_sgx(Error **errp)
 {
     SGXInfo *info = NULL;
@@ -146,14 +173,13 @@ SGXInfo *qmp_query_sgx(Error **errp)
         return NULL;
     }
 
-    SGXEPCState *sgx_epc = &pcms->sgx_epc;
     info = g_new0(SGXInfo, 1);
 
     info->sgx = true;
     info->sgx1 = true;
     info->sgx2 = true;
     info->flc = true;
-    info->section_size = sgx_epc->size;
+    info->sections = sgx_get_epc_sections_list();
 
     return info;
 }
@@ -161,6 +187,7 @@ SGXInfo *qmp_query_sgx(Error **errp)
 void hmp_info_sgx(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
+    SGXEPCSectionList *section_list, *section;
     g_autoptr(SGXInfo) info = qmp_query_sgx(&err);
 
     if (err) {
@@ -175,8 +202,14 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
                    info->sgx2 ? "enabled" : "disabled");
     monitor_printf(mon, "FLC support: %s\n",
                    info->flc ? "enabled" : "disabled");
-    monitor_printf(mon, "size: %" PRIu64 "\n",
-                   info->section_size);
+
+    section_list = info->sections;
+    for (section = section_list; section; section = section->next) {
+        monitor_printf(mon, "NUMA node #%" PRId64 ": ",
+                       section->value->node);
+        monitor_printf(mon, "size=%" PRIu64 "\n",
+                       section->value->size);
+    }
 }
 
 bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)

