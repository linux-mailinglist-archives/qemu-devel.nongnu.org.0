Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394412F5467
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 22:03:38 +0100 (CET)
Received: from localhost ([::1]:41890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kznIn-0000UC-AZ
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 16:03:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kzn9t-0006Ro-Ac
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 15:54:25 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:38390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kzn9o-0000jQ-9Z
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 15:54:25 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DKrcJo077229;
 Wed, 13 Jan 2021 20:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=WWJvgtB3AelazeMKJ9LuGJwKpRD2TFnza0WlANweXA0=;
 b=s0i3k9r2GGwZ0zl1Y80umV/KbsaUMwN28h/lC8OxA+Xtz8JK226CsftT5NFmfkCcf+KM
 3GvZX8dlYN7mk5x1KX1TK5AXk0H5y7iFVdSvIlphSDnBpRMH79rwD/ZoUZ0+0mfj1bKM
 MeM1qA+SuS3jmI1DFcoj4gYkanJl4AiAsiNue8Mo0PS9g5Fj/I3fIjBpvKu97YLe2Y7+
 iNaJobxx+xUwFF5AE+AKAwGik0EsAHDAu7tEBs+o2+KrW2E8N2I5ObglQVlZakZIm62c
 iRgD3ytJJeG66WwI8OjevieYzZTZvcQctAMcDow8zAiO9QU8iTzTEvI96gN7HSc9+9wC zw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 360kg1whhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 20:54:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DKkAs7143102;
 Wed, 13 Jan 2021 20:54:12 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 360kf17rgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 20:54:12 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10DKsBAY024064;
 Wed, 13 Jan 2021 20:54:11 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Jan 2021 12:54:11 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v18 16/20] multi-process: PCI BAR read/write handling for
 proxy & remote endpoints
Date: Wed, 13 Jan 2021 15:53:35 -0500
Message-Id: <aeb74dcc470507d87ec31ab63bcc45b26b9ae718.1610570756.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610570756.git.jag.raman@oracle.com>
References: <cover.1610570756.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610570756.git.jag.raman@oracle.com>
References: <cover.1610570756.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130127
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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

Proxy device object implements handler for PCI BAR writes and reads.
The handler uses BAR_WRITE/BAR_READ message to communicate to the
remote process with the BAR address and value to be written/read.
The remote process implements handler for BAR_WRITE/BAR_READ
message.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/mpqemu-link.h | 10 +++++
 include/hw/remote/proxy.h       |  9 +++++
 hw/remote/message.c             | 83 +++++++++++++++++++++++++++++++++++++++++
 hw/remote/mpqemu-link.c         |  6 +++
 hw/remote/proxy.c               | 60 +++++++++++++++++++++++++++++
 5 files changed, 168 insertions(+)

diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 7bc0bdd..6303e62 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -37,6 +37,8 @@ typedef enum {
     MPQEMU_CMD_RET,
     MPQEMU_CMD_PCI_CFGWRITE,
     MPQEMU_CMD_PCI_CFGREAD,
+    MPQEMU_CMD_BAR_WRITE,
+    MPQEMU_CMD_BAR_READ,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
@@ -52,6 +54,13 @@ typedef struct {
     int len;
 } PciConfDataMsg;
 
+typedef struct {
+    hwaddr addr;
+    uint64_t val;
+    unsigned size;
+    bool memory;
+} BarAccessMsg;
+
 /**
  * MPQemuMsg:
  * @cmd: The remote command
@@ -71,6 +80,7 @@ typedef struct {
         uint64_t u64;
         PciConfDataMsg pci_conf_data;
         SyncSysmemMsg sync_sysmem;
+        BarAccessMsg bar_access;
     } data;
 
     int fds[REMOTE_MAX_FDS];
diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
index faa9c4d..ea7fa4f 100644
--- a/include/hw/remote/proxy.h
+++ b/include/hw/remote/proxy.h
@@ -15,6 +15,14 @@
 #define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIProxyDev, PCI_PROXY_DEV)
 
+typedef struct ProxyMemoryRegion {
+    PCIProxyDev *dev;
+    MemoryRegion mr;
+    bool memory;
+    bool present;
+    uint8_t type;
+} ProxyMemoryRegion;
+
 struct PCIProxyDev {
     PCIDevice parent_dev;
     char *fd;
@@ -28,6 +36,7 @@ struct PCIProxyDev {
     QemuMutex io_mutex;
     QIOChannel *ioc;
     Error *migration_blocker;
+    ProxyMemoryRegion region[PCI_NUM_REGIONS];
 };
 
 #endif /* PROXY_H */
diff --git a/hw/remote/message.c b/hw/remote/message.c
index 636bd16..f2e8445 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -16,11 +16,14 @@
 #include "qapi/error.h"
 #include "sysemu/runstate.h"
 #include "hw/pci/pci.h"
+#include "exec/memattrs.h"
 
 static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
                                  MPQemuMsg *msg, Error **errp);
 static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
                                 MPQemuMsg *msg, Error **errp);
+static void process_bar_write(QIOChannel *ioc, MPQemuMsg *msg, Error **errp);
+static void process_bar_read(QIOChannel *ioc, MPQemuMsg *msg, Error **errp);
 
 void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
 {
@@ -52,6 +55,12 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         case MPQEMU_CMD_PCI_CFGREAD:
             process_config_read(com->ioc, pci_dev, &msg, &local_err);
             break;
+        case MPQEMU_CMD_BAR_WRITE:
+            process_bar_write(com->ioc, &msg, &local_err);
+            break;
+        case MPQEMU_CMD_BAR_READ:
+            process_bar_read(com->ioc, &msg, &local_err);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s"
@@ -115,3 +124,77 @@ static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
                       getpid());
     }
 }
+
+static void process_bar_write(QIOChannel *ioc, MPQemuMsg *msg, Error **errp)
+{
+    ERRP_GUARD();
+    BarAccessMsg *bar_access = &msg->data.bar_access;
+    AddressSpace *as =
+        bar_access->memory ? &address_space_memory : &address_space_io;
+    MPQemuMsg ret = { 0 };
+    MemTxResult res;
+    uint64_t val;
+
+    if (!is_power_of_2(bar_access->size) ||
+       (bar_access->size > sizeof(uint64_t))) {
+        ret.data.u64 = UINT64_MAX;
+        goto fail;
+    }
+
+    val = cpu_to_le64(bar_access->val);
+
+    res = address_space_rw(as, bar_access->addr, MEMTXATTRS_UNSPECIFIED,
+                           (void *)&val, bar_access->size, true);
+
+    if (res != MEMTX_OK) {
+        error_setg(errp, "Bad address %"PRIx64" for mem write, pid "FMT_pid".",
+                   bar_access->addr, getpid());
+        ret.data.u64 = -1;
+    }
+
+fail:
+    ret.cmd = MPQEMU_CMD_RET;
+    ret.size = sizeof(ret.data.u64);
+
+    if (!mpqemu_msg_send(&ret, ioc, NULL)) {
+        error_prepend(errp, "Error returning code to proxy, pid "FMT_pid": ",
+                      getpid());
+    }
+}
+
+static void process_bar_read(QIOChannel *ioc, MPQemuMsg *msg, Error **errp)
+{
+    ERRP_GUARD();
+    BarAccessMsg *bar_access = &msg->data.bar_access;
+    MPQemuMsg ret = { 0 };
+    AddressSpace *as;
+    MemTxResult res;
+    uint64_t val = 0;
+
+    as = bar_access->memory ? &address_space_memory : &address_space_io;
+
+    if (!is_power_of_2(bar_access->size) ||
+       (bar_access->size > sizeof(uint64_t))) {
+        val = UINT64_MAX;
+        goto fail;
+    }
+
+    res = address_space_rw(as, bar_access->addr, MEMTXATTRS_UNSPECIFIED,
+                           (void *)&val, bar_access->size, false);
+
+    if (res != MEMTX_OK) {
+        error_setg(errp, "Bad address %"PRIx64" for mem read, pid "FMT_pid".",
+                   bar_access->addr, getpid());
+        val = UINT64_MAX;
+    }
+
+fail:
+    ret.cmd = MPQEMU_CMD_RET;
+    ret.data.u64 = le64_to_cpu(val);
+    ret.size = sizeof(ret.data.u64);
+
+    if (!mpqemu_msg_send(&ret, ioc, NULL)) {
+        error_prepend(errp, "Error returning code to proxy, pid "FMT_pid": ",
+                      getpid());
+    }
+}
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index 5bd6a9d..bcb32e0 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -248,6 +248,12 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
             return false;
         }
         break;
+    case MPQEMU_CMD_BAR_WRITE:
+    case MPQEMU_CMD_BAR_READ:
+        if ((msg->size != sizeof(BarAccessMsg)) || (msg->num_fds != 0)) {
+            return false;
+        }
+        break;
     default:
         break;
     }
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 2b14394..22eb422 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -152,3 +152,63 @@ static void pci_proxy_dev_register_types(void)
 }
 
 type_init(pci_proxy_dev_register_types)
+
+static void send_bar_access_msg(PCIProxyDev *pdev, MemoryRegion *mr,
+                                bool write, hwaddr addr, uint64_t *val,
+                                unsigned size, bool memory)
+{
+    MPQemuMsg msg = { 0 };
+    long ret = -EINVAL;
+    Error *local_err = NULL;
+
+    msg.size = sizeof(BarAccessMsg);
+    msg.data.bar_access.addr = mr->addr + addr;
+    msg.data.bar_access.size = size;
+    msg.data.bar_access.memory = memory;
+
+    if (write) {
+        msg.cmd = MPQEMU_CMD_BAR_WRITE;
+        msg.data.bar_access.val = *val;
+    } else {
+        msg.cmd = MPQEMU_CMD_BAR_READ;
+    }
+
+    ret = mpqemu_msg_send_and_await_reply(&msg, pdev, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+    }
+
+    if (!write) {
+        *val = ret;
+    }
+}
+
+static void proxy_bar_write(void *opaque, hwaddr addr, uint64_t val,
+                            unsigned size)
+{
+    ProxyMemoryRegion *pmr = opaque;
+
+    send_bar_access_msg(pmr->dev, &pmr->mr, true, addr, &val, size,
+                        pmr->memory);
+}
+
+static uint64_t proxy_bar_read(void *opaque, hwaddr addr, unsigned size)
+{
+    ProxyMemoryRegion *pmr = opaque;
+    uint64_t val;
+
+    send_bar_access_msg(pmr->dev, &pmr->mr, false, addr, &val, size,
+                        pmr->memory);
+
+    return val;
+}
+
+const MemoryRegionOps proxy_mr_ops = {
+    .read = proxy_bar_read,
+    .write = proxy_bar_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+    },
+};
-- 
1.8.3.1


