Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3222DDE4F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:03:52 +0100 (CET)
Received: from localhost ([::1]:48100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8rn-0006se-Nf
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8WK-0000Va-UO
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:41:41 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:57646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8WE-00041Y-KS
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:41:40 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5YJgm079176;
 Fri, 18 Dec 2020 05:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=f9ddxEYeQ0vKjAo9Om/d/oipEGkRB5/t69cdzTxqkFw=;
 b=i+PTWnydzFX940QICMHPZuP4x7smF1Z2tRDEiTC74GrtZjluivNCGgqOir30idlTGUqQ
 frJ1EXAH65pUSZLe7hZxRAcj7Wvq9AUzZJzqvLm1bywNZbcnRgY8aCnsQ1GKwDbIE864
 MedjZ+5wnmVzaFPuHsuhAWL7eyaaSVWS8p4OWLeiSE9FhBk1ozo3ghukI6W7UBI70rgZ
 5vnMVFT2ixskNJsjie+15HwSfisd+VRtIRZB4+5c6LE4Zn6tQRfivjtdzM6CI9ACxw8n
 3sV0VjC3vCmWfnedIPbjSC1TK+szoWqWxqi5WrRaQXbrXgKvw3l7wUBsSgn8PLF3OGZ0 Ig== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35cntmgnxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 05:41:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5ZKuA161039;
 Fri, 18 Dec 2020 05:41:26 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 35d7ervmny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 05:41:26 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BI5fN0R010010;
 Fri, 18 Dec 2020 05:41:24 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 21:41:23 -0800
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH v14 RESEND 18/21] multi-process: Synchronize remote memory
Date: Thu, 17 Dec 2020 21:40:48 -0800
Message-Id: <c9668c0da19a5c47a82e4df9c062b7fadb2f8125.1608263018.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1608263017.git.elena.ufimtseva@oracle.com>
References: <cover.1608263017.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180040
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=elena.ufimtseva@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jagannathan Raman <jag.raman@oracle.com>

Add ProxyMemoryListener object which is used to keep the view of the RAM
in sync between QEMU and remote process.
A MemoryListener is registered for system-memory AddressSpace. The
listener sends SYNC_SYSMEM message to the remote process when memory
listener commits the changes to memory, the remote process receives
the message and processes it in the handler for SYNC_SYSMEM message.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/proxy-memory-listener.h |  28 +++
 include/hw/remote/proxy.h                 |   2 +
 hw/remote/message.c                       |   4 +
 hw/remote/proxy-memory-listener.c         | 227 ++++++++++++++++++++++
 hw/remote/proxy.c                         |   6 +
 MAINTAINERS                               |   2 +
 hw/remote/meson.build                     |   1 +
 7 files changed, 270 insertions(+)
 create mode 100644 include/hw/remote/proxy-memory-listener.h
 create mode 100644 hw/remote/proxy-memory-listener.c

diff --git a/include/hw/remote/proxy-memory-listener.h b/include/hw/remote/proxy-memory-listener.h
new file mode 100644
index 0000000000..874ea9bbdd
--- /dev/null
+++ b/include/hw/remote/proxy-memory-listener.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright © 2018, 2020 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef PROXY_MEMORY_LISTENER_H
+#define PROXY_MEMORY_LISTENER_H
+
+#include "exec/memory.h"
+#include "io/channel.h"
+
+typedef struct ProxyMemoryListener {
+    MemoryListener listener;
+
+    int n_mr_sections;
+    MemoryRegionSection *mr_sections;
+
+    QIOChannel *ioc;
+} ProxyMemoryListener;
+
+void proxy_memory_listener_configure(ProxyMemoryListener *proxy_listener,
+                                     QIOChannel *ioc);
+void proxy_memory_listener_deconfigure(ProxyMemoryListener *proxy_listener);
+
+#endif
diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
index e29c61b73f..5f35b3b641 100644
--- a/include/hw/remote/proxy.h
+++ b/include/hw/remote/proxy.h
@@ -11,6 +11,7 @@
 
 #include "hw/pci/pci.h"
 #include "io/channel.h"
+#include "hw/remote/proxy-memory-listener.h"
 
 #define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
 
@@ -40,6 +41,7 @@ struct PCIProxyDev {
     QemuMutex io_mutex;
     QIOChannel *ioc;
     Error *migration_blocker;
+    ProxyMemoryListener proxy_listener;
     ProxyMemoryRegion region[PCI_NUM_REGIONS];
 };
 
diff --git a/hw/remote/message.c b/hw/remote/message.c
index 40740e23c0..54003b5dfe 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -17,6 +17,7 @@
 #include "sysemu/runstate.h"
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
+#include "hw/remote/memory.h"
 
 static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
                                  MPQemuMsg *msg, Error **errp);
@@ -61,6 +62,9 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         case MPQEMU_CMD_BAR_READ:
             process_bar_read(com->ioc, &msg, &local_err);
             break;
+        case MPQEMU_CMD_SYNC_SYSMEM:
+            remote_sysmem_reconfig(&msg, &local_err);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s"
diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
new file mode 100644
index 0000000000..10726981b2
--- /dev/null
+++ b/hw/remote/proxy-memory-listener.c
@@ -0,0 +1,227 @@
+/*
+ * Copyright © 2018, 2020 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "qemu/compiler.h"
+#include "qemu/int128.h"
+#include "qemu/range.h"
+#include "exec/memory.h"
+#include "exec/cpu-common.h"
+#include "cpu.h"
+#include "exec/ram_addr.h"
+#include "exec/address-spaces.h"
+#include "qapi/error.h"
+#include "hw/remote/mpqemu-link.h"
+#include "hw/remote/proxy-memory-listener.h"
+
+/*
+ * TODO: get_fd_from_hostaddr(), proxy_mrs_can_merge() and
+ * proxy_memory_listener_commit() defined below perform tasks similar to the
+ * functions defined in vhost-user.c. These functions are good candidates
+ * for refactoring.
+ *
+ */
+
+static void proxy_memory_listener_reset(MemoryListener *listener)
+{
+    ProxyMemoryListener *proxy_listener = container_of(listener,
+                                                       ProxyMemoryListener,
+                                                       listener);
+    int mrs;
+
+    for (mrs = 0; mrs < proxy_listener->n_mr_sections; mrs++) {
+        memory_region_unref(proxy_listener->mr_sections[mrs].mr);
+    }
+
+    g_free(proxy_listener->mr_sections);
+    proxy_listener->mr_sections = NULL;
+    proxy_listener->n_mr_sections = 0;
+}
+
+static int get_fd_from_hostaddr(uint64_t host, ram_addr_t *offset)
+{
+    MemoryRegion *mr;
+    ram_addr_t off;
+
+    /**
+     * Assumes that the host address is a valid address as it's
+     * coming from the MemoryListener system. In the case host
+     * address is not valid, the following call would return
+     * the default subregion of "system_memory" region, and
+     * not NULL. So it's not possible to check for NULL here.
+     */
+    mr = memory_region_from_host((void *)(uintptr_t)host, &off);
+
+    if (offset) {
+        *offset = off;
+    }
+
+    return memory_region_get_fd(mr);
+}
+
+static bool proxy_mrs_can_merge(uint64_t host, uint64_t prev_host, size_t size)
+{
+    if (((prev_host + size) != host)) {
+        return false;
+    }
+
+    if (get_fd_from_hostaddr(host, NULL) !=
+            get_fd_from_hostaddr(prev_host, NULL)) {
+        return false;
+    }
+
+    return true;
+}
+
+static bool try_merge(ProxyMemoryListener *proxy_listener,
+                      MemoryRegionSection *section)
+{
+    uint64_t mrs_size, mrs_gpa, mrs_page;
+    MemoryRegionSection *prev_sec;
+    bool merged = false;
+    uintptr_t mrs_host;
+    RAMBlock *mrs_rb;
+
+    if (!proxy_listener->n_mr_sections) {
+        return false;
+    }
+
+    mrs_rb = section->mr->ram_block;
+    mrs_page = (uint64_t)qemu_ram_pagesize(mrs_rb);
+    mrs_size = int128_get64(section->size);
+    mrs_gpa = section->offset_within_address_space;
+    mrs_host = (uintptr_t)memory_region_get_ram_ptr(section->mr) +
+               section->offset_within_region;
+
+    if (get_fd_from_hostaddr(mrs_host, NULL) < 0) {
+        return true;
+    }
+
+    mrs_host = mrs_host & ~(mrs_page - 1);
+    mrs_gpa = mrs_gpa & ~(mrs_page - 1);
+    mrs_size = ROUND_UP(mrs_size, mrs_page);
+
+    prev_sec = proxy_listener->mr_sections +
+               (proxy_listener->n_mr_sections - 1);
+    uint64_t prev_gpa_start = prev_sec->offset_within_address_space;
+    uint64_t prev_size = int128_get64(prev_sec->size);
+    uint64_t prev_gpa_end   = range_get_last(prev_gpa_start, prev_size);
+    uint64_t prev_host_start =
+        (uintptr_t)memory_region_get_ram_ptr(prev_sec->mr) +
+        prev_sec->offset_within_region;
+    uint64_t prev_host_end = range_get_last(prev_host_start, prev_size);
+
+    if (mrs_gpa <= (prev_gpa_end + 1)) {
+        g_assert(mrs_gpa > prev_gpa_start);
+
+        if ((section->mr == prev_sec->mr) &&
+            proxy_mrs_can_merge(mrs_host, prev_host_start,
+                                (mrs_gpa - prev_gpa_start))) {
+            uint64_t max_end = MAX(prev_host_end, mrs_host + mrs_size);
+            merged = true;
+            prev_sec->offset_within_address_space =
+                MIN(prev_gpa_start, mrs_gpa);
+            prev_sec->offset_within_region =
+                MIN(prev_host_start, mrs_host) -
+                (uintptr_t)memory_region_get_ram_ptr(prev_sec->mr);
+            prev_sec->size = int128_make64(max_end - MIN(prev_host_start,
+                                                         mrs_host));
+        }
+    }
+
+    return merged;
+}
+
+static void proxy_memory_listener_region_addnop(MemoryListener *listener,
+                                                MemoryRegionSection *section)
+{
+    ProxyMemoryListener *proxy_listener = container_of(listener,
+                                                       ProxyMemoryListener,
+                                                       listener);
+
+    if (!memory_region_is_ram(section->mr) ||
+            memory_region_is_rom(section->mr)) {
+        return;
+    }
+
+    if (try_merge(proxy_listener, section)) {
+        return;
+    }
+
+    ++proxy_listener->n_mr_sections;
+    proxy_listener->mr_sections = g_renew(MemoryRegionSection,
+                                          proxy_listener->mr_sections,
+                                          proxy_listener->n_mr_sections);
+    proxy_listener->mr_sections[proxy_listener->n_mr_sections - 1] = *section;
+    proxy_listener->mr_sections[proxy_listener->n_mr_sections - 1].fv = NULL;
+    memory_region_ref(section->mr);
+}
+
+static void proxy_memory_listener_commit(MemoryListener *listener)
+{
+    ProxyMemoryListener *proxy_listener = container_of(listener,
+                                                       ProxyMemoryListener,
+                                                       listener);
+    MPQemuMsg msg;
+    MemoryRegionSection *section;
+    ram_addr_t offset;
+    uintptr_t host_addr;
+    int region;
+    Error *local_err = NULL;
+
+    memset(&msg, 0, sizeof(MPQemuMsg));
+
+    msg.cmd = MPQEMU_CMD_SYNC_SYSMEM;
+    msg.num_fds = proxy_listener->n_mr_sections;
+    msg.size = sizeof(SyncSysmemMsg);
+    if (msg.num_fds > REMOTE_MAX_FDS) {
+        error_report("Number of fds is more than %d", REMOTE_MAX_FDS);
+        return;
+    }
+
+    for (region = 0; region < proxy_listener->n_mr_sections; region++) {
+        section = &proxy_listener->mr_sections[region];
+        msg.data.sync_sysmem.gpas[region] =
+            section->offset_within_address_space;
+        msg.data.sync_sysmem.sizes[region] = int128_get64(section->size);
+        host_addr = (uintptr_t)memory_region_get_ram_ptr(section->mr) +
+                    section->offset_within_region;
+        msg.fds[region] = get_fd_from_hostaddr(host_addr, &offset);
+        msg.data.sync_sysmem.offsets[region] = offset;
+    }
+    if (!mpqemu_msg_send(&msg, proxy_listener->ioc, &local_err)) {
+        error_report_err(local_err);
+    }
+}
+
+void proxy_memory_listener_deconfigure(ProxyMemoryListener *proxy_listener)
+{
+    memory_listener_unregister(&proxy_listener->listener);
+
+    proxy_memory_listener_reset(&proxy_listener->listener);
+}
+
+void proxy_memory_listener_configure(ProxyMemoryListener *proxy_listener,
+                                     QIOChannel *ioc)
+{
+    proxy_listener->n_mr_sections = 0;
+    proxy_listener->mr_sections = NULL;
+
+    proxy_listener->ioc = ioc;
+
+    proxy_listener->listener.begin = proxy_memory_listener_reset;
+    proxy_listener->listener.commit = proxy_memory_listener_commit;
+    proxy_listener->listener.region_add = proxy_memory_listener_region_addnop;
+    proxy_listener->listener.region_nop = proxy_memory_listener_region_addnop;
+    proxy_listener->listener.priority = 10;
+
+    memory_listener_register(&proxy_listener->listener,
+                             &address_space_memory);
+}
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 2b294e60f9..9cb4093c55 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -18,6 +18,8 @@
 #include "migration/blocker.h"
 #include "hw/remote/mpqemu-link.h"
 #include "qemu/error-report.h"
+#include "hw/remote/proxy-memory-listener.h"
+#include "qom/object.h"
 
 static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
 {
@@ -44,6 +46,8 @@ static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
 
     qemu_mutex_init(&dev->io_mutex);
     qio_channel_set_blocking(dev->ioc, true, NULL);
+
+    proxy_memory_listener_configure(&dev->proxy_listener, dev->ioc);
 }
 
 static void pci_proxy_dev_exit(PCIDevice *pdev)
@@ -57,6 +61,8 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
     migrate_del_blocker(dev->migration_blocker);
 
     error_free(dev->migration_blocker);
+
+    proxy_memory_listener_deconfigure(&dev->proxy_listener);
 }
 
 static void config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t *val,
diff --git a/MAINTAINERS b/MAINTAINERS
index aa65ef86f2..13f0e7225d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3181,6 +3181,8 @@ F: include/hw/remote/memory.h
 F: hw/remote/memory.c
 F: hw/remote/proxy.c
 F: include/hw/remote/proxy.h
+F: hw/remote/proxy-memory-listener.c
+F: include/hw/remote/proxy-memory-listener.h
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 569cd20edf..7f11be4736 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -7,5 +7,6 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
+specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
-- 
2.25.GIT


