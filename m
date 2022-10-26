Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8A60D897
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 02:52:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onUc4-0006DR-08; Tue, 25 Oct 2022 20:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1onUc1-0006AP-I4
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 20:49:41 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1onUbz-0003cT-PD
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 20:49:41 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id i12so10252819qvs.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 17:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=itdJjoWTzr0ylNc2qCCbqq49u8Zk8OI8xM4xXE0AET8=;
 b=DErcIejy+jTfZFrrHblUaN3ryaHEn6mgd2TCHyOHrRofiS/ZHNaoRKG8PfnL8yQP0X
 2Yv6HFnPkkC+29wcpuzRi6ItVra8KrfgsNUwmlM8yephllXnY0cOTYRsLLbqGL2wMXdn
 cx7m7O0X4TxiYd+mLeC1m5Oq/wqLB0BA7Nmbjd3u92rDjmGYZf87nlJx4EfKhQTKv89g
 hcYuwn+YVnQikqdrgPe51EEYdRQv9FIrjG7HCieEIEyLLDaievMubaB+tMFBzj9y9fG2
 bnIUG9Ym7bnLWSHGesGLhhYOt0F7Z7EKGPsp+u+L5kNcpexCXeDgW3ZBmu7ME3ZaQFt6
 +NGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=itdJjoWTzr0ylNc2qCCbqq49u8Zk8OI8xM4xXE0AET8=;
 b=n9SlyEkLBg2Gf++99yQe1OxQvIkDfe8fyvKqcUECIEXEiEQa8DtGhJpoVuZXUDEqJs
 etyITjolgnKiOaeO4WU1YkgOJHc/88R1NF3rFPflHJ+cLTCjEQSzz8vvbPr46CiZ6vY9
 UAUFr+axuJVc0ptb+QltEhRu3HYUiP1pO8ECzeGzlPAF2J28zod4nVEJHugFF97pZQqO
 tPLpSCA6JQmG4PdjTwafszM5WN+0H4Nvj7UfXi8//7JA6njah867wIxycO3DadRHOTnE
 ymdGWTSyK/eMAoGIAXUynHjmx0qeqdhgXFq/upDubSySwnhlVAZKbfVEX6/MCXw42bQa
 7HrA==
X-Gm-Message-State: ACrzQf0D2IZ1hAMCfBoO26CcWfAenFXkAFpNNWT6dx/QT9uYAjoNh2ZO
 NRK46XTfiCQUUKbBw2vAXTHQ3yinBQ==
X-Google-Smtp-Source: AMsMyM5JSL7W12XrKKbKyXJP9wWmNB6SvooPIuwe6FpViFuujBLsvC9GOqJBnqlfQPAVFkWcVoC2Ng==
X-Received: by 2002:ad4:5fc8:0:b0:4b7:6ca0:adc6 with SMTP id
 jq8-20020ad45fc8000000b004b76ca0adc6mr27173507qvb.120.1666745378233; 
 Tue, 25 Oct 2022 17:49:38 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 j15-20020ac8550f000000b0039a610a04b1sm2408651qtq.37.2022.10.25.17.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 17:49:31 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: qemu-devel@nongnu.org
Cc: jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org, mst@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: [PATCH 4/4] hw/acpi/cxl.c: Fill in SRAT for vmem/pmem if NUMA node is
 assigned
Date: Tue, 25 Oct 2022 20:47:37 -0400
Message-Id: <20221026004737.3646-5-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026004737.3646-1-gregory.price@memverge.com>
References: <20221026004737.3646-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch enables the direct assignment of a NUMA node to a volatile or
persistent memory region on a CXL type-3 device.  This is useful for
testing static mapping for type-3 device memory regions as memory and
leveraging them directly via its NUMA node.

Co-developed-By: Davidlohr Bueso <dave@stgolabs.net>
Signed-off-by: Gregory Price <gregory.price@memverge.com>
---
 docs/system/devices/cxl.rst | 21 ++++++++++++
 hw/acpi/cxl.c               | 67 +++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c        |  4 +++
 include/hw/acpi/cxl.h       |  1 +
 4 files changed, 93 insertions(+)

diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index 9e165064c8..32bf84a97c 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -332,6 +332,27 @@ The same volatile setup may optionally include an LSA region::
   -device cxl-type3,bus=root_port13,volatile-memdev=vmem0,lsa=cxl-lsa0,id=cxl-vmem0 \
   -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G
 
+
+Volatile and Persistent Memory regions may also be assigned an SRAT entry and statically
+mapped into the system by manually assigning them a CPU-less NUMA node. This is an example
+of a CXL Type 3 Volatile Memory device being assigned an SRAT entry via a NUMA node mapping::
+
+    qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
+    ...
+    -smp 4 \
+    -enable-kvm \
+    -nographic \
+    -object memory-backend-ram,id=mem0,size=2G,share=on \
+    -object memory-backend-ram,id=mem1,size=2G,share=on \
+    -numa node,memdev=mem0,cpus=0-3,nodeid=0 \
+    -numa node,memdev=mem1,nodeid=1, \
+    -device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 \
+    -device cxl-rp,port=0,id=rp0,bus=cxl.0,chassis=0,slot=0 \
+    -device cxl-rp,port=1,id=rp1,bus=cxl.0,chassis=0,slot=1 \
+    -device cxl-type3,bus=rp0,volatile-memdev=mem1,id=cxl-mem0 
+
+
+
 A setup suitable for 4 way interleave. Only one fixed window provided, to enable 2 way
 interleave across 2 CXL host bridges.  Each host bridge has 2 CXL Root Ports, with
 the CXL Type3 device directly attached (no switches).::
diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index 2bf8c07993..a8c6166b7f 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -254,3 +254,70 @@ void build_cxl_osc_method(Aml *dev)
     aml_append(dev, aml_name_decl("CTRC", aml_int(0)));
     aml_append(dev, __build_cxl_osc_method());
 }
+
+static int cxl_device_list(Object *obj, void *opaque)
+{
+    GSList **list = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_CXL_TYPE3)) {
+        *list = g_slist_append(*list, DEVICE(obj));
+    }
+
+    object_child_foreach(obj, cxl_device_list, opaque);
+    return 0;
+}
+
+static GSList *cxl_get_device_list(void)
+{
+    GSList *list = NULL;
+
+    object_child_foreach(qdev_get_machine(), cxl_device_list, &list);
+    return list;
+}
+
+void cxl_build_srat(GArray *table_data, NodeInfo* numa_info, int nb_numa_nodes)
+{
+    GSList *device_list, *list = cxl_get_device_list();
+    int node = 0;
+
+    for (device_list = list; device_list; device_list = device_list->next) {
+        DeviceState *dev = device_list->data;
+        CXLType3Dev *ct3d = CXL_TYPE3(dev);
+        MemoryRegion *mr = NULL;
+
+        if (ct3d->hostvmem) {
+            /* Find the numa node associated with this memdev */
+            for (node = 0; node < nb_numa_nodes; node++) {
+                if (numa_info[node].node_memdev == ct3d->hostvmem) {
+                    break;
+                }
+            }
+            if (node != nb_numa_nodes) {
+                mr = host_memory_backend_get_memory(ct3d->hostvmem);
+                if (mr) {
+                    build_srat_memory(table_data, mr->addr, mr->size, node,
+                          (MEM_AFFINITY_ENABLED | MEM_AFFINITY_HOTPLUGGABLE));
+                }
+            }
+        }
+
+        if (ct3d->hostpmem) {
+            /* Find the numa node associated with this memdev */
+            for (node = 0; node < nb_numa_nodes; node++) {
+                if (numa_info[node].node_memdev == ct3d->hostpmem) {
+                    break;
+                }
+            }
+            if (node != nb_numa_nodes) {
+                mr = host_memory_backend_get_memory(ct3d->hostpmem);
+                if (mr) {
+                    build_srat_memory(table_data, mr->addr, mr->size, node,
+                          (MEM_AFFINITY_ENABLED | MEM_AFFINITY_HOTPLUGGABLE |
+                           MEM_AFFINITY_NON_VOLATILE));
+                }
+            }
+        }
+    }
+
+    g_slist_free(list);
+}
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4f54b61904..af62c888e5 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2080,6 +2080,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
      * Memory devices may override proximity set by this entry,
      * providing _PXM method if necessary.
      */
+    if (pcms->cxl_devices_state.is_enabled) {
+        cxl_build_srat(table_data, numa_info, nb_numa_nodes);
+    }
+
     if (hotpluggable_address_space_size) {
         build_srat_memory(table_data, machine->device_memory->base,
                           hotpluggable_address_space_size, nb_numa_nodes - 1,
diff --git a/include/hw/acpi/cxl.h b/include/hw/acpi/cxl.h
index acf4418886..b4974297db 100644
--- a/include/hw/acpi/cxl.h
+++ b/include/hw/acpi/cxl.h
@@ -25,5 +25,6 @@ void cxl_build_cedt(GArray *table_offsets, GArray *table_data,
                     BIOSLinker *linker, const char *oem_id,
                     const char *oem_table_id, CXLState *cxl_state);
 void build_cxl_osc_method(Aml *dev);
+void cxl_build_srat(GArray *table_data, NodeInfo* numa_info, int nb_numa_nodes);
 
 #endif
-- 
2.37.3


