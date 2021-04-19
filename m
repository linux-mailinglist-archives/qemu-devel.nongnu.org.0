Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BC2363FCC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:47:07 +0200 (CEST)
Received: from localhost ([::1]:54522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRQo-000623-Oy
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR4s-0006ib-1t
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:24:26 -0400
Received: from mga17.intel.com ([192.55.52.151]:24099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR4p-00025K-TJ
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:24:25 -0400
IronPort-SDR: f0SsxfAJTBxh6FhRetskhLJYd9Cx/vkfBmRyQrkZUM4xaBtgvaAkb+Ua2Pp6pZp9deOG+x4EEv
 eZfAIVM9Ft+g==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="175409347"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="175409347"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 03:23:22 -0700
IronPort-SDR: 2UNPXIF1RJHC1AA5Fyqgc9MntQUl3Jma034szDcZad6xUEOzGG5ithBu5/V8tJOGlpiw8GtY/J
 9Y9P1YrqEhHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="419947568"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2021 03:23:20 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/32] sgx-epc: Add the fill_device_info() callback support
Date: Mon, 19 Apr 2021 18:01:55 +0800
Message-Id: <20210419100156.53504-32-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210419100156.53504-1-yang.zhong@intel.com>
References: <20210419100156.53504-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since there is no fill_device_info() callback support, and when we
execute "info memory-devices" command in the monitor, the segfault
will be found.

This patch will add this callback support and "info memory-devices"
will show sgx epc memory exposed to guest. The result as below:

qemu) info memory-devices
Memory device [sgx-epc]: "epc1"
  memaddr: 0x180000000
  size: 29360128
  memdev: /objects/mem1
Memory device [sgx-epc]: "epc2"
  memaddr: 0x181c00000
  size: 10485760
  memdev: /objects/mem2

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/sgx-epc.c  | 17 ++++++++++++++++-
 monitor/hmp-cmds.c | 10 ++++++++++
 qapi/machine.json  | 26 +++++++++++++++++++++++++-
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index 7b198595d5..b1427cd250 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -208,7 +208,22 @@ static MemoryRegion *sgx_epc_md_get_memory_region(MemoryDeviceState *md,
 static void sgx_epc_md_fill_device_info(const MemoryDeviceState *md,
                                         MemoryDeviceInfo *info)
 {
-    /* TODO */
+    SgxEPCDeviceInfo *se = g_new0(SgxEPCDeviceInfo, 1);
+    SGXEPCDevice *epc = SGX_EPC(md);
+    const DeviceState *dev = DEVICE(md);
+
+    if (dev->id) {
+        se->has_id = true;
+        se->id = g_strdup(dev->id);
+    }
+
+    se->memaddr = epc->addr;
+    se->size = object_property_get_uint(OBJECT(epc), SGX_EPC_SIZE_PROP,
+                                        NULL);
+    se->memdev = object_get_canonical_path(OBJECT(epc->hostmem));
+
+    info->u.sgx_epc.data = se;
+    info->type = MEMORY_DEVICE_INFO_KIND_SGX_EPC;
 }
 
 static void sgx_epc_class_init(ObjectClass *oc, void *data)
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index bd539e0c1e..974892e73d 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1819,6 +1819,7 @@ void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
     VirtioMEMDeviceInfo *vmi;
     MemoryDeviceInfo *value;
     PCDIMMDeviceInfo *di;
+    SgxEPCDeviceInfo *se;
 
     for (info = info_list; info; info = info->next) {
         value = info->value;
@@ -1866,6 +1867,15 @@ void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
                                vmi->block_size);
                 monitor_printf(mon, "  memdev: %s\n", vmi->memdev);
                 break;
+            case MEMORY_DEVICE_INFO_KIND_SGX_EPC:
+                se = value->u.sgx_epc.data;
+                monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
+                               MemoryDeviceInfoKind_str(value->type),
+                               se->id ? se->id : "");
+                monitor_printf(mon, "  memaddr: 0x%" PRIx64 "\n", se->memaddr);
+                monitor_printf(mon, "  size: %" PRIu64 "\n", se->size);
+                monitor_printf(mon, "  memdev: %s\n", se->memdev);
+                break;
             default:
                 g_assert_not_reached();
             }
diff --git a/qapi/machine.json b/qapi/machine.json
index 6e90d463fc..3f2c2da92f 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1184,6 +1184,29 @@
           }
 }
 
+##
+# @SgxEPCDeviceInfo:
+#
+# Sgx EPC state information
+#
+# @id: device's ID
+#
+# @memaddr: physical address in memory, where device is mapped
+#
+# @size: size of memory that the device provides
+#
+# @memdev: memory backend linked with device
+#
+# Since: 5.1
+##
+{ 'struct': 'SgxEPCDeviceInfo',
+  'data': { '*id': 'str',
+            'memaddr': 'size',
+            'size': 'size',
+            'memdev': 'str'
+          }
+}
+
 ##
 # @MemoryDeviceInfo:
 #
@@ -1198,7 +1221,8 @@
   'data': { 'dimm': 'PCDIMMDeviceInfo',
             'nvdimm': 'PCDIMMDeviceInfo',
             'virtio-pmem': 'VirtioPMEMDeviceInfo',
-            'virtio-mem': 'VirtioMEMDeviceInfo'
+            'virtio-mem': 'VirtioMEMDeviceInfo',
+            'sgx-epc': 'SgxEPCDeviceInfo'
           }
 }
 
-- 
2.29.2.334.gfaefdd61ec


