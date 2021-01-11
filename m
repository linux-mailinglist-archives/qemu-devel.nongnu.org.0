Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6C22F0C34
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 06:17:55 +0100 (CET)
Received: from localhost ([::1]:37580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kypaU-000889-9i
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 00:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kypPs-0001rI-O6
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:06:56 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:36644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kypPq-00060y-4P
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:06:56 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10B53gPp119192;
 Mon, 11 Jan 2021 05:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding;
 s=corp-2020-01-29; bh=fXPrMbHAoa1ImZNojE1IeU5w2E4WPDvjBAS0mksznM0=;
 b=FrcyCQ9XN850JawDoZvt29/3N0HqjnLca8Eadlz1aXmtUI7ETerEqWIWi5we6+j5ea2f
 wU5NCPhFW8a4OiO0QdLprIiP078tc1jnChM5r0GSWh7ayLfgNxt049zp8hsjJY4/RO/e
 3lEcW0VuWMJyaD4wAlzO+X6Rl1wMe6XiSl9bXOn9DIcINvd6dlZ3kGHkxQePCn7ffVwx
 xGsAJZ4g6+GnwRxVkR3kX+qV2ViuqgXCrMkC1QtIbXZM8tD+o1wyO5Ofl0ppVwaO2gR3
 boxqbIjTenYYq3Ry8dQZ8XVP/ly74JUv/PWpgWrDJUdyq1XTYaJUpMNa6obIyqE43Boy CA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 35y3wqu6fe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Jan 2021 05:06:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10B50htX139361;
 Mon, 11 Jan 2021 05:06:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 35yp2k9ct8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 05:06:45 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10B56gTX005356;
 Mon, 11 Jan 2021 05:06:43 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 10 Jan 2021 21:06:42 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 17/20] multi-process: Synchronize remote memory
Date: Mon, 11 Jan 2021 00:06:02 -0500
Message-Id: <ec0866ae82687167463dcbd188e023b363aeafd7.1610339529.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610339529.git.jag.raman@oracle.com>
References: <cover.1610339529.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610339529.git.jag.raman@oracle.com>
References: <cover.1610339529.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9860
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110030
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9860
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110030
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 include/hw/remote/proxy-memory-listener.h |  28 ++++
 include/hw/remote/proxy.h                 |   2 +
 hw/remote/message.c                       |   4 +
 hw/remote/proxy-memory-listener.c         | 227 ++++++++++++++++++++++++++++++
 hw/remote/proxy.c                         |   6 +
 MAINTAINERS                               |   2 +
 hw/remote/meson.build                     |   1 +
 7 files changed, 270 insertions(+)
 create mode 100644 include/hw/remote/proxy-memory-listener.h
 create mode 100644 hw/remote/proxy-memory-listener.c

diff --git a/include/hw/remote/proxy-memory-listener.h b/include/hw/remote/proxy-memory-listener.h
new file mode 100644
index 0000000..c4f3efb
--- /dev/null
+++ b/include/hw/remote/proxy-memory-listener.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
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
index ea7fa4f..12888b4 100644
--- a/include/hw/remote/proxy.h
+++ b/include/hw/remote/proxy.h
@@ -11,6 +11,7 @@
 
 #include "hw/pci/pci.h"
 #include "io/channel.h"
+#include "hw/remote/proxy-memory-listener.h"
 
 #define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIProxyDev, PCI_PROXY_DEV)
@@ -36,6 +37,7 @@ struct PCIProxyDev {
     QemuMutex io_mutex;
     QIOChannel *ioc;
     Error *migration_blocker;
+    ProxyMemoryListener proxy_listener;
     ProxyMemoryRegion region[PCI_NUM_REGIONS];
 };
 
diff --git a/hw/remote/message.c b/hw/remote/message.c
index f2e8445..25341d8 100644
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
index 0000000..af1fa6f
--- /dev/null
+++ b/hw/remote/proxy-memory-listener.c
@@ -0,0 +1,227 @@
+/*
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
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
index 22eb422..472b2df 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -19,6 +19,8 @@
 #include "qemu/sockets.h"
 #include "hw/remote/mpqemu-link.h"
 #include "qemu/error-report.h"
+#include "hw/remote/proxy-memory-listener.h"
+#include "qom/object.h"
 
 static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
 {
@@ -52,6 +54,8 @@ static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
 
     qemu_mutex_init(&dev->io_mutex);
     qio_channel_set_blocking(dev->ioc, true, NULL);
+
+    proxy_memory_listener_configure(&dev->proxy_listener, dev->ioc);
 }
 
 static void pci_proxy_dev_exit(PCIDevice *pdev)
@@ -65,6 +69,8 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
     migrate_del_blocker(dev->migration_blocker);
 
     error_free(dev->migration_blocker);
+
+    proxy_memory_listener_deconfigure(&dev->proxy_listener);
 }
 
 static void config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t *val,
diff --git a/MAINTAINERS b/MAINTAINERS
index 389287c..e2327e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3192,6 +3192,8 @@ F: include/hw/remote/memory.h
 F: hw/remote/memory.c
 F: hw/remote/proxy.c
 F: include/hw/remote/proxy.h
+F: hw/remote/proxy-memory-listener.c
+F: include/hw/remote/proxy-memory-listener.h
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 569cd20..7f11be4 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -7,5 +7,6 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
+specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
-- 
1.8.3.1


