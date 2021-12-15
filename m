Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F449476356
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:31:26 +0100 (CET)
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxavs-0004Eh-Mb
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:31:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq6-0003vD-UP
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:28 -0500
Received: from [2a00:1450:4864:20::32e] (port=38595
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq4-0004FN-Qb
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:26 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso157062wms.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qJ0T7w1/EpxM1EPS/S8htldDo8uYBjVwDt7qXgtP+7k=;
 b=iI4YgJcQiniChggfDpi7X3+YfFLjs3sxUQG0xgTe1nyzu+VLooI3fJbUtY1hneAlYK
 Zur1FSpBxdZ0eKalSoDRMnUR6ELBk4jiODcBklS7sIflHgvcdYvRmUCA1R0vZP63kbeT
 okK4T/olpnV596f0ym44yhRylZCiVvyvvqlyOPRCxLsjN9AOJnzEMfpfLRj71Ye8ZbQG
 OnTM/fV4DlDxb3BIsyOeCXbogxkmzy+PswT6j/eRQeP+CYRde6066Th7E9RgQM14EqJk
 fn7sy6SJa3DtpXaD7qIe3MDPv4sUGUOukFi5qFdnxafu6brgWQ41x+OcL9Gpsxp+qwgP
 O6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qJ0T7w1/EpxM1EPS/S8htldDo8uYBjVwDt7qXgtP+7k=;
 b=b8croXORuAQ3mEK9JxPlg4in5flDfB4dp0qSfpeOHyVRgQz65yR99eJGQxHwdCo0ho
 yFBfO0P9SdRGZra+JLyu6WigIRM314VE867vtgVtNhMTlDJ/Ko8s8Tq1bnID8PLJmfBd
 35m2YZZ/ef6wXPoDrO/fHPj+oKldAJtesgfW0SHtSzl3Cc1ccDpWj2j9+9K3e5EtVbju
 z0f6z/rCy2kCHVyg6mQ6uNyDrVb580Dv00sJU50deb+hC4y70/IzLDXf2MJIMfDIoKwm
 oS7fnIY2K3qaFirrzgGwU0ePiNkbzEFH9drIx0e9txCekV1JsoTY/MuAKT00blshVZhD
 xRSQ==
X-Gm-Message-State: AOAM533xJJ3AT8zlq4+M2motaoRtd2KxQaZjwLNnKezu1AFDuUbug4N6
 75bvS+nC4m8adOwWF56nCk8k0+tZixc=
X-Google-Smtp-Source: ABdhPJwEx6/9liNhxtKwd6bsXGFADadfpeeib8m8MNMfazsIyb1FvNgL1AYtsbz2Was4KvzDoDnCug==
X-Received: by 2002:a05:600c:3506:: with SMTP id
 h6mr1837479wmq.122.1639599923509; 
 Wed, 15 Dec 2021 12:25:23 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y11sm3794708wry.70.2021.12.15.12.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:25:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/13] numa: Enable numa for SGX EPC sections
Date: Wed, 15 Dec 2021 21:25:12 +0100
Message-Id: <20211215202515.91586-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215202515.91586-1-pbonzini@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

The basic SGX did not enable numa for SGX EPC sections, which
result in all EPC sections located in numa node 0. This patch
enable SGX numa function in the guest and the EPC section can
work with RAM as one numa node.

The Guest kernel related log:
[    0.009981] ACPI: SRAT: Node 0 PXM 0 [mem 0x180000000-0x183ffffff]
[    0.009982] ACPI: SRAT: Node 1 PXM 1 [mem 0x184000000-0x185bfffff]
The SRAT table can normally show SGX EPC sections menory info in different
numa nodes.

The SGX EPC numa related command:
 ......
 -m 4G,maxmem=20G \
 -smp sockets=2,cores=2 \
 -cpu host,+sgx-provisionkey \
 -object memory-backend-ram,size=2G,host-nodes=0,policy=bind,id=node0 \
 -object memory-backend-epc,id=mem0,size=64M,prealloc=on,host-nodes=0,policy=bind \
 -numa node,nodeid=0,cpus=0-1,memdev=node0 \
 -object memory-backend-ram,size=2G,host-nodes=1,policy=bind,id=node1 \
 -object memory-backend-epc,id=mem1,size=28M,prealloc=on,host-nodes=1,policy=bind \
 -numa node,nodeid=1,cpus=2-3,memdev=node1 \
 -M sgx-epc.0.memdev=mem0,sgx-epc.0.node=0,sgx-epc.1.memdev=mem1,sgx-epc.1.node=1 \
 ......

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20211101162009.62161-2-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/numa.c            |  5 ++---
 hw/i386/acpi-build.c      |  2 ++
 hw/i386/sgx-epc.c         |  3 +++
 hw/i386/sgx-stub.c        |  4 ++++
 hw/i386/sgx.c             | 44 +++++++++++++++++++++++++++++++++++++++
 include/hw/i386/sgx-epc.h |  3 +++
 monitor/hmp-cmds.c        |  1 +
 qapi/machine.json         | 10 ++++++++-
 qemu-options.hx           |  4 ++--
 9 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index e6050b2273..1aa05dcf42 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -784,9 +784,8 @@ static void numa_stat_memory_devices(NumaNodeMem node_mem[])
                 break;
             case MEMORY_DEVICE_INFO_KIND_SGX_EPC:
                 se = value->u.sgx_epc.data;
-                /* TODO: once we support numa, assign to right node */
-                node_mem[0].node_mem += se->size;
-                node_mem[0].node_plugged_mem += se->size;
+                node_mem[se->node].node_mem += se->size;
+                node_mem[se->node].node_plugged_mem = 0;
                 break;
             default:
                 g_assert_not_reached();
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a99c6e4fe3..8383b83ee3 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2068,6 +2068,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
         nvdimm_build_srat(table_data);
     }
 
+    sgx_epc_build_srat(table_data);
+
     /*
      * TODO: this part is not in ACPI spec and current linux kernel boots fine
      * without these entries. But I recall there were issues the last time I
diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index e508827e78..96b2940d75 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -21,6 +21,7 @@
 
 static Property sgx_epc_properties[] = {
     DEFINE_PROP_UINT64(SGX_EPC_ADDR_PROP, SGXEPCDevice, addr, 0),
+    DEFINE_PROP_UINT32(SGX_EPC_NUMA_NODE_PROP, SGXEPCDevice, node, 0),
     DEFINE_PROP_LINK(SGX_EPC_MEMDEV_PROP, SGXEPCDevice, hostmem,
                      TYPE_MEMORY_BACKEND_EPC, HostMemoryBackendEpc *),
     DEFINE_PROP_END_OF_LIST(),
@@ -139,6 +140,8 @@ static void sgx_epc_md_fill_device_info(const MemoryDeviceState *md,
     se->memaddr = epc->addr;
     se->size = object_property_get_uint(OBJECT(epc), SGX_EPC_SIZE_PROP,
                                         NULL);
+    se->node = object_property_get_uint(OBJECT(epc), SGX_EPC_NUMA_NODE_PROP,
+                                        NULL);
     se->memdev = object_get_canonical_path(OBJECT(epc->hostmem));
 
     info->u.sgx_epc.data = se;
diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
index c9b379e665..26833eb233 100644
--- a/hw/i386/sgx-stub.c
+++ b/hw/i386/sgx-stub.c
@@ -6,6 +6,10 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc-target.h"
 
+void sgx_epc_build_srat(GArray *table_data)
+{
+}
+
 SGXInfo *qmp_query_sgx(Error **errp)
 {
     error_setg(errp, "SGX support is not compiled in");
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 8fef3dd8fa..d04299904a 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -23,6 +23,7 @@
 #include "sysemu/hw_accel.h"
 #include "sysemu/reset.h"
 #include <sys/ioctl.h>
+#include "hw/acpi/aml-build.h"
 
 #define SGX_MAX_EPC_SECTIONS            8
 #define SGX_CPUID_EPC_INVALID           0x0
@@ -36,6 +37,46 @@
 
 #define RETRY_NUM                       2
 
+static int sgx_epc_device_list(Object *obj, void *opaque)
+{
+    GSList **list = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_SGX_EPC)) {
+        *list = g_slist_append(*list, DEVICE(obj));
+    }
+
+    object_child_foreach(obj, sgx_epc_device_list, opaque);
+    return 0;
+}
+
+static GSList *sgx_epc_get_device_list(void)
+{
+    GSList *list = NULL;
+
+    object_child_foreach(qdev_get_machine(), sgx_epc_device_list, &list);
+    return list;
+}
+
+void sgx_epc_build_srat(GArray *table_data)
+{
+    GSList *device_list = sgx_epc_get_device_list();
+
+    for (; device_list; device_list = device_list->next) {
+        DeviceState *dev = device_list->data;
+        Object *obj = OBJECT(dev);
+        uint64_t addr, size;
+        int node;
+
+        node = object_property_get_uint(obj, SGX_EPC_NUMA_NODE_PROP,
+                                        &error_abort);
+        addr = object_property_get_uint(obj, SGX_EPC_ADDR_PROP, &error_abort);
+        size = object_property_get_uint(obj, SGX_EPC_SIZE_PROP, &error_abort);
+
+        build_srat_memory(table_data, addr, size, node, MEM_AFFINITY_ENABLED);
+    }
+    g_slist_free(device_list);
+}
+
 static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
 {
     return (low & MAKE_64BIT_MASK(12, 20)) +
@@ -226,6 +267,9 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
         /* set the memdev link with memory backend */
         object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
                               &error_fatal);
+        /* set the numa node property for sgx epc object */
+        object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
+                             &error_fatal);
         object_property_set_bool(obj, "realized", true, &error_fatal);
         object_unref(obj);
     }
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index a6a65be854..581fac389a 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -25,6 +25,7 @@
 #define SGX_EPC_ADDR_PROP "addr"
 #define SGX_EPC_SIZE_PROP "size"
 #define SGX_EPC_MEMDEV_PROP "memdev"
+#define SGX_EPC_NUMA_NODE_PROP "node"
 
 /**
  * SGXEPCDevice:
@@ -38,6 +39,7 @@ typedef struct SGXEPCDevice {
 
     /* public */
     uint64_t addr;
+    uint32_t node;
     HostMemoryBackendEpc *hostmem;
 } SGXEPCDevice;
 
@@ -56,6 +58,7 @@ typedef struct SGXEPCState {
 } SGXEPCState;
 
 bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);
+void sgx_epc_build_srat(GArray *table_data);
 
 static inline uint64_t sgx_epc_above_4g_end(SGXEPCState *sgx_epc)
 {
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9c91bf93e9..2669156b28 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1810,6 +1810,7 @@ void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
                                se->id ? se->id : "");
                 monitor_printf(mon, "  memaddr: 0x%" PRIx64 "\n", se->memaddr);
                 monitor_printf(mon, "  size: %" PRIu64 "\n", se->size);
+                monitor_printf(mon, "  node: %" PRId64 "\n", se->node);
                 monitor_printf(mon, "  memdev: %s\n", se->memdev);
                 break;
             default:
diff --git a/qapi/machine.json b/qapi/machine.json
index f1839acf20..edeab6084b 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1207,12 +1207,15 @@
 #
 # @memdev: memory backend linked with device
 #
+# @node: the numa node
+#
 # Since: 6.2
 ##
 { 'struct': 'SgxEPCDeviceInfo',
   'data': { '*id': 'str',
             'memaddr': 'size',
             'size': 'size',
+            'node': 'int',
             'memdev': 'str'
           }
 }
@@ -1285,10 +1288,15 @@
 #
 # @memdev: memory backend linked with device
 #
+# @node: the numa node
+#
 # Since: 6.2
 ##
 { 'struct': 'SgxEPC',
-  'data': { 'memdev': 'str' } }
+  'data': { 'memdev': 'str',
+            'node': 'int'
+          }
+}
 
 ##
 # @SgxEPCProperties:
diff --git a/qemu-options.hx b/qemu-options.hx
index ae2c6dbbfc..489b58e151 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -127,11 +127,11 @@ SRST
 ERST
 
 DEF("M", HAS_ARG, QEMU_OPTION_M,
-    "                sgx-epc.0.memdev=memid\n",
+    "                sgx-epc.0.memdev=memid,sgx-epc.0.node=numaid\n",
     QEMU_ARCH_ALL)
 
 SRST
-``sgx-epc.0.memdev=@var{memid}``
+``sgx-epc.0.memdev=@var{memid},sgx-epc.0.node=@var{numaid}``
     Define an SGX EPC section.
 ERST
 
-- 
2.33.1



