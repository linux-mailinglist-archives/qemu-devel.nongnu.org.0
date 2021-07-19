Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FBA3CD3F9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:35:05 +0200 (CEST)
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5RY8-0002Kw-Db
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RRh-0006Dk-Hn
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:28:25 -0400
Received: from mga09.intel.com ([134.134.136.24]:16178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RRc-000611-NN
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:28:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="211035293"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="211035293"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 04:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="656813705"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jul 2021 04:27:47 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/33] sgx-epc: Add the reset interface for sgx-epc virt
 device
Date: Mon, 19 Jul 2021 19:21:26 +0800
Message-Id: <20210719112136.57018-24-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210719112136.57018-1-yang.zhong@intel.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the VM is reset, we need make sure sgx virt epc in clean status.
Once the VM is reset, and sgx epc virt device will be reseted by
reset callback registered by qemu_register_reset(). Since this epc
virt device depend on backend, this reset will call backend reset
interface to re-mmap epc to guest.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/sgx-epc.c | 94 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 13 deletions(-)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index 924dea22f0..9880d832d5 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -18,6 +18,9 @@
 #include "qapi/visitor.h"
 #include "target/i386/cpu.h"
 #include "exec/address-spaces.h"
+#include "sysemu/reset.h"
+
+uint32_t epc_num;
 
 static Property sgx_epc_properties[] = {
     DEFINE_PROP_UINT64(SGX_EPC_ADDR_PROP, SGXEPCDevice, addr, 0),
@@ -47,12 +50,84 @@ static void sgx_epc_init(Object *obj)
                         NULL, NULL, NULL);
 }
 
+static void sgx_epc_del_subregion(DeviceState *dev)
+{
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    SGXEPCState *sgx_epc = &pcms->sgx_epc;
+    SGXEPCDevice *epc = SGX_EPC(dev);
+
+    /* del subregion and related operations */
+    memory_region_del_subregion(&sgx_epc->mr,
+                                host_memory_backend_get_memory(epc->hostmem));
+    host_memory_backend_set_mapped(epc->hostmem, false);
+    g_free(sgx_epc->sections);
+    sgx_epc->sections = NULL;
+
+    /* multiple epc devices, only zero the first time */
+    if (epc_num == sgx_epc->nr_sections) {
+        sgx_epc->size = 0;
+        sgx_epc->nr_sections = 0;
+    }
+}
+
+static void sgx_epc_initialization(DeviceState *dev)
+{
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    SGXEPCState *sgx_epc = &pcms->sgx_epc;
+    MemoryDeviceState *md = MEMORY_DEVICE(dev);
+    SGXEPCDevice *epc = SGX_EPC(dev);
+    Error *errp = NULL;
+
+    if (!epc->hostmem) {
+        error_setg(&errp, "'" SGX_EPC_MEMDEV_PROP "' property is not set");
+        return;
+    }
+
+    epc->addr = sgx_epc->base + sgx_epc->size;
+
+    memory_region_add_subregion(&sgx_epc->mr, epc->addr - sgx_epc->base,
+                                host_memory_backend_get_memory(epc->hostmem));
+
+    host_memory_backend_set_mapped(epc->hostmem, true);
+
+    sgx_epc->sections = g_renew(SGXEPCDevice *, sgx_epc->sections,
+                                sgx_epc->nr_sections + 1);
+    sgx_epc->sections[sgx_epc->nr_sections++] = epc;
+
+    sgx_epc->size += memory_device_get_region_size(md, &errp);
+}
+
+static void sgx_epc_reset(void *opaque)
+{
+    DeviceState *dev = opaque;
+    SGXEPCDevice *epc = SGX_EPC(dev);
+    Error *errp = NULL;
+    int fd;
+
+    if (!epc->hostmem) {
+        error_setg(&errp, "'" SGX_EPC_MEMDEV_PROP "' property is not set");
+        return;
+    }
+
+    /* delete subregion and related operations */
+    sgx_epc_del_subregion(dev);
+
+    /* reset sgx backend */
+    fd = memory_region_get_fd(host_memory_backend_get_memory(epc->hostmem));
+    sgx_memory_backend_reset(epc->hostmem, fd, &errp);
+    if (errp) {
+        error_setg(&errp, "failed to call sgx_memory_backend_reset");
+        return;
+    }
+
+    /* re-add subregion and related operations */
+    sgx_epc_initialization(dev);
+}
+
 static void sgx_epc_realize(DeviceState *dev, Error **errp)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     X86MachineState *x86ms = X86_MACHINE(pcms);
-    MemoryDeviceState *md = MEMORY_DEVICE(dev);
-    SGXEPCState *sgx_epc = &pcms->sgx_epc;
     SGXEPCDevice *epc = SGX_EPC(dev);
     const char *path;
 
@@ -71,18 +146,11 @@ static void sgx_epc_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    epc->addr = sgx_epc->base + sgx_epc->size;
-
-    memory_region_add_subregion(&sgx_epc->mr, epc->addr - sgx_epc->base,
-                                host_memory_backend_get_memory(epc->hostmem));
-
-    host_memory_backend_set_mapped(epc->hostmem, true);
-
-    sgx_epc->sections = g_renew(SGXEPCDevice *, sgx_epc->sections,
-                                sgx_epc->nr_sections + 1);
-    sgx_epc->sections[sgx_epc->nr_sections++] = epc;
+    sgx_epc_initialization(dev);
+    epc_num++;
 
-    sgx_epc->size += memory_device_get_region_size(md, errp);
+    /* register the reset callback for sgx reset */
+    qemu_register_reset(sgx_epc_reset, dev);
 }
 
 static void sgx_epc_unrealize(DeviceState *dev)

