Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9248C2335D6
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 17:45:33 +0200 (CEST)
Received: from localhost ([::1]:48922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1AkO-00081C-HK
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 11:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1k1AfT-0001cS-NT
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 11:40:27 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:38998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1k1AfP-0002WW-9S
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 11:40:27 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06UFXPB2155707;
 Thu, 30 Jul 2020 15:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=2Avxi1QWe6cUG3l1LSMFbAq/69tVDOToYh40OrsqGe4=;
 b=JbtPvXPsB7YTbRvXEQcezDf1/hl6eo4YAYQOf/3R88VzkPO1trOzEzr3w/Zj4uim3Dev
 4iYa84hS+7lLDnRO8rRso5jMOMW0sI0FcMOtLyCbh4rgZLI/P5kTSjB3IV9FH3Ghb5/k
 kZ28/1Yv9IZfgtkqA10m5cMOocUd8spHPIf90ZUNhGRrdZtB+LAZip+albt+gt36Ulpm
 SZmUCg7oxkgdZ88k7fQCYXsOjleMPYsKubhoJp3QJkSlmLnpGJ+pfSvNagW4mP+xxcpQ
 zGCTW+H7jdZcK49VlJX8jRIyOMT8JMgE/PLswNDW1Ir7scT08UJyBaPZccu1617VfMuV uw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 32hu1jmeut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 Jul 2020 15:40:21 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06UFYjZg172022;
 Thu, 30 Jul 2020 15:38:20 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 32hu5x0wut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 15:38:20 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06UFcI64020550;
 Thu, 30 Jul 2020 15:38:18 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 30 Jul 2020 08:38:18 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V1 32/32] vfio-pci: improved tracing
Date: Thu, 30 Jul 2020 08:14:36 -0700
Message-Id: <1596122076-341293-33-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
References: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9698
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=1 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9698
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=1 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300111
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=steven.sistare@oracle.com; helo=aserp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 11:37:57
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Print more info for existing trace points:
  trace_kvm_irqchip_add_msi_route.
  trace_pci_update_mappings_del
  trace_pci_update_mappings_add

Add new trace points:
  trace_kvm_irqchip_assign_irqfd
  trace_msix_table_mmio_write
  trace_vfio_dma_unmap
  trace_vfio_dma_map
  trace_vfio_region
  trace_vfio_descriptors
  trace_ram_block_add

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 accel/kvm/kvm-all.c    |  8 ++++++--
 accel/kvm/trace-events |  3 ++-
 exec.c                 |  3 +++
 hw/pci/msix.c          |  1 +
 hw/pci/pci.c           | 10 ++++++----
 hw/pci/trace-events    |  5 +++--
 hw/vfio/common.c       | 16 +++++++++++++++-
 hw/vfio/pci.c          |  1 +
 hw/vfio/trace-events   |  9 ++++++---
 trace-events           |  2 ++
 10 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 63ef6af..5511ea7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -46,6 +46,7 @@
 #include "sysemu/reset.h"
 
 #include "hw/boards.h"
+#include "trace-root.h"
 
 /* This check must be after config-host.h is included */
 #ifdef CONFIG_EVENTFD
@@ -1670,7 +1671,7 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
     }
 
     trace_kvm_irqchip_add_msi_route(dev ? dev->name : (char *)"N/A",
-                                    vector, virq);
+                                    vector, virq, msg.address, msg.data);
 
     kvm_add_routing_entry(s, &kroute);
     kvm_arch_add_msi_route_post(&kroute, vector, dev);
@@ -1717,6 +1718,7 @@ static int kvm_irqchip_assign_irqfd(KVMState *s, EventNotifier *event,
 {
     int fd = event_notifier_get_fd(event);
     int rfd = resample ? event_notifier_get_fd(resample) : -1;
+    int ret;
 
     struct kvm_irqfd irqfd = {
         .fd = fd,
@@ -1758,7 +1760,9 @@ static int kvm_irqchip_assign_irqfd(KVMState *s, EventNotifier *event,
         return -ENOSYS;
     }
 
-    return kvm_vm_ioctl(s, KVM_IRQFD, &irqfd);
+    ret = kvm_vm_ioctl(s, KVM_IRQFD, &irqfd);
+    trace_kvm_irqchip_assign_irqfd(fd, virq, rfd, ret);
+    return ret;
 }
 
 int kvm_irqchip_add_adapter_route(KVMState *s, AdapterInfo *adapter)
diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
index a68eb66..67a01e6 100644
--- a/accel/kvm/trace-events
+++ b/accel/kvm/trace-events
@@ -9,7 +9,8 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev fd %d, type 0x%x, arg %p"
 kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to retrieve ONEREG %" PRIu64 " from KVM: %s"
 kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to set ONEREG %" PRIu64 " to KVM: %s"
 kvm_irqchip_commit_routes(void) ""
-kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s vector %d virq %d"
+kvm_irqchip_add_msi_route(char *name, int vector, int virq, uint64_t addr, uint32_t data) "%s, vector %d, virq %d, msg {addr 0x%"PRIx64", data 0x%x}"
+kvm_irqchip_assign_irqfd(int fd, int virq, int rfd, int status) "(fd=%d, virq=%d, rfd=%d) KVM_IRQFD returns %d"
 kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=%d"
 kvm_irqchip_release_virq(int virq) "virq %d"
 kvm_set_ioeventfd_mmio(int fd, uint64_t addr, uint32_t val, bool assign, uint32_t size, bool datamatch) "fd: %d @0x%" PRIx64 " val=0x%x assign: %d size: %d match: %d"
diff --git a/exec.c b/exec.c
index 5473c09..dd99ee0 100644
--- a/exec.c
+++ b/exec.c
@@ -2319,6 +2319,9 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
         }
         ram_block_notify_add(new_block->host, new_block->max_length);
     }
+    trace_ram_block_add(new_block->host, new_block->max_length,
+                        memory_region_name(new_block->mr),
+                        new_block->mr->readonly ? "ro" : "rw");
 }
 
 #ifdef CONFIG_POSIX
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 67e34f3..65a2882 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -189,6 +189,7 @@ static void msix_table_mmio_write(void *opaque, hwaddr addr,
     int vector = addr / PCI_MSIX_ENTRY_SIZE;
     bool was_masked;
 
+    trace_msix_table_mmio_write(dev->name, addr, val, size);
     was_masked = msix_is_masked(dev, vector);
     pci_set_long(dev->msix_table + addr, val);
     msix_handle_mask_update(dev, vector, was_masked);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index c2e1509..6142411 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1324,9 +1324,11 @@ void pci_update_mappings(PCIDevice *d)
     PCIIORegion *r;
     int i;
     pcibus_t new_addr;
+    const char *name;
 
     for(i = 0; i < PCI_NUM_REGIONS; i++) {
         r = &d->io_regions[i];
+        name = r->memory ? r->memory->name : "";
 
         /* this region isn't registered */
         if (!r->size)
@@ -1340,18 +1342,18 @@ void pci_update_mappings(PCIDevice *d)
 
         /* now do the real mapping */
         if (r->addr != PCI_BAR_UNMAPPED) {
-            trace_pci_update_mappings_del(d, pci_dev_bus_num(d),
+            trace_pci_update_mappings_del(d->name, pci_dev_bus_num(d),
                                           PCI_SLOT(d->devfn),
                                           PCI_FUNC(d->devfn),
-                                          i, r->addr, r->size);
+                                          i, r->addr, r->size, name);
             memory_region_del_subregion(r->address_space, r->memory);
         }
         r->addr = new_addr;
         if (r->addr != PCI_BAR_UNMAPPED) {
-            trace_pci_update_mappings_add(d, pci_dev_bus_num(d),
+            trace_pci_update_mappings_add(d->name, pci_dev_bus_num(d),
                                           PCI_SLOT(d->devfn),
                                           PCI_FUNC(d->devfn),
-                                          i, r->addr, r->size);
+                                          i, r->addr, r->size, name);
             memory_region_add_subregion_overlap(r->address_space,
                                                 r->addr, r->memory, 1);
         }
diff --git a/hw/pci/trace-events b/hw/pci/trace-events
index def4b39..6dd7015 100644
--- a/hw/pci/trace-events
+++ b/hw/pci/trace-events
@@ -1,8 +1,8 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
 # pci.c
-pci_update_mappings_del(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
-pci_update_mappings_add(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
+pci_update_mappings_del(const char *dname, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size, const char *name) "%s %02x:%02x.%x [%d] 0x%"PRIx64", 0x%"PRIx64"B \"%s\""
+pci_update_mappings_add(const char *dname, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size, const char *name) "%s %02x:%02x.%x [%d] 0x%"PRIx64", 0x%"PRIx64"B \"%s\""
 
 # pci_host.c
 pci_cfg_read(const char *dev, unsigned devid, unsigned fnid, unsigned offs, unsigned val) "%s %02u:%u @0x%x -> 0x%x"
@@ -10,3 +10,4 @@ pci_cfg_write(const char *dev, unsigned devid, unsigned fnid, unsigned offs, uns
 
 # msix.c
 msix_write_config(char *name, bool enabled, bool masked) "dev %s enabled %d masked %d"
+msix_table_mmio_write(char *name, uint64_t addr, uint64_t val, unsigned size)  "(%s, @%"PRId64", 0x%"PRIx64", %dB)"
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a51a093..23c8bf3 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -304,6 +304,8 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return 0;
     }
 
+    trace_vfio_dma_unmap(container->fd, iova, size);
+
     while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
         /*
          * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
@@ -327,6 +329,11 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return -errno;
     }
 
+    if (unmap.size != size) {
+        error_printf("warn: VFIO_UNMAP_DMA(0x%lx, 0x%lx) only unmaps 0x%llx",
+                     iova, size, unmap.size);
+    }
+
     return 0;
 }
 
@@ -345,6 +352,9 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         return 0;
     }
 
+    trace_vfio_dma_map(container->fd, iova, size, vaddr,
+                       (readonly ? "r" : "rw"));
+
     if (!readonly) {
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
@@ -985,7 +995,8 @@ int vfio_region_mmap(VFIORegion *region)
         trace_vfio_region_mmap(memory_region_name(&region->mmaps[i].mem),
                                region->mmaps[i].offset,
                                region->mmaps[i].offset +
-                               region->mmaps[i].size - 1);
+                               region->mmaps[i].size - 1,
+                               region->mmaps[i].mmap);
     }
 
     return 0;
@@ -1696,6 +1707,9 @@ retry:
         goto retry;
     }
 
+    trace_vfio_region(vbasedev->name, index, (*info)->offset, (*info)->size,
+                      (*info)->cap_offset, (*info)->flags);
+
     return 0;
 }
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index f72e277..d74e078 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -41,6 +41,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/blocker.h"
+#include "trace-root.h"
 
 #define TYPE_VFIO_PCI "vfio-pci"
 #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 10d899c..83cd0a6 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -25,7 +25,7 @@ vfio_pci_size_rom(const char *name, int size) "%s ROM size 0x%x"
 vfio_vga_write(uint64_t addr, uint64_t data, int size) " (0x%"PRIx64", 0x%"PRIx64", %d)"
 vfio_vga_read(uint64_t addr, int size, uint64_t data) " (0x%"PRIx64", %d) = 0x%"PRIx64
 vfio_pci_read_config(const char *name, int addr, int len, int val) " (%s, @0x%x, len=0x%x) 0x%x"
-vfio_pci_write_config(const char *name, int addr, int val, int len) " (%s, @0x%x, 0x%x, len=0x%x)"
+vfio_pci_write_config(const char *name, int addr, int val, int len) "(%s, @0x%x, 0x%x, 0x%xB)"
 vfio_msi_setup(const char *name, int pos) "%s PCI MSI CAP @0x%x"
 vfio_msix_early_setup(const char *name, int pos, int table_bar, int offset, int entries) "%s PCI MSI-X CAP @0x%x, BAR %d, offset 0x%x, entries %d"
 vfio_check_pcie_flr(const char *name) "%s Supports FLR via PCIe cap"
@@ -37,7 +37,7 @@ vfio_pci_hot_reset_dep_devices(int domain, int bus, int slot, int function, int
 vfio_pci_hot_reset_result(const char *name, const char *result) "%s hot reset: %s"
 vfio_populate_device_config(const char *name, unsigned long size, unsigned long offset, unsigned long flags) "Device %s config:\n  size: 0x%lx, offset: 0x%lx, flags: 0x%lx"
 vfio_populate_device_get_irq_info_failure(const char *errstr) "VFIO_DEVICE_GET_IRQ_INFO failure: %s"
-vfio_realize(const char *name, int group_id) " (%s) group %d"
+vfio_realize(const char *name, int group_id) "(%s) group %d"
 vfio_mdev(const char *name, bool is_mdev) " (%s) is_mdev %d"
 vfio_add_ext_cap_dropped(const char *name, uint16_t cap, uint16_t offset) "%s 0x%x@0x%x"
 vfio_pci_reset(const char *name) " (%s)"
@@ -109,7 +109,7 @@ vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions,
 vfio_put_base_device(int fd) "close vdev->fd=%d"
 vfio_region_setup(const char *dev, int index, const char *name, unsigned long flags, unsigned long offset, unsigned long size) "Device %s, region %d \"%s\", flags: 0x%lx, offset: 0x%lx, size: 0x%lx"
 vfio_region_mmap_fault(const char *name, int index, unsigned long offset, unsigned long size, int fault) "Region %s mmaps[%d], [0x%lx - 0x%lx], fault: %d"
-vfio_region_mmap(const char *name, unsigned long offset, unsigned long end) "Region %s [0x%lx - 0x%lx]"
+vfio_region_mmap(const char *name, unsigned long offset, unsigned long end, void *addr) "%s [0x%lx - 0x%lx] maps to %p"
 vfio_region_exit(const char *name, int index) "Device %s, region %d"
 vfio_region_finalize(const char *name, int index) "Device %s, region %d"
 vfio_region_mmaps_set_enabled(const char *name, bool enabled) "Region %s mmaps enabled: %d"
@@ -117,6 +117,9 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
+vfio_dma_unmap(int fd, uint64_t iova, uint64_t size) "fd %d, iova 0x%"PRIx64", len 0x%"PRIx64
+vfio_dma_map(int fd, uint64_t iova, uint64_t size, void *addr, const char *access) "fd %d, iova 0x%"PRIx64", len 0x%"PRIx64", va %p, %s"
+vfio_region(const char *name, int index, uint64_t offset, uint64_t size, int cap_offset, int flags) "%s [%d]: +0x%"PRIx64", 0x%"PRIx64"B, cap +0x%x, flags 0x%x"
 
 # platform.c
 vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
diff --git a/trace-events b/trace-events
index 42107eb..98589a4 100644
--- a/trace-events
+++ b/trace-events
@@ -107,6 +107,8 @@ qmp_job_complete(void *job) "job %p"
 qmp_job_finalize(void *job) "job %p"
 qmp_job_dismiss(void *job) "job %p"
 
+# exec.c
+ram_block_add(void *host, uint64_t maxlen, const char *name, const char *mode) "host=%p, maxlen=0x%"PRIx64", mr = {name=%s, %s}"
 
 ### Guest events, keep at bottom
 
-- 
1.8.3.1


