Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3292728F834
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 20:11:42 +0200 (CEST)
Received: from localhost ([::1]:41106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT7j3-0006F4-5o
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 14:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kT7dQ-0008Pa-BV
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 14:05:52 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:52870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kT7dN-0002MS-MG
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 14:05:52 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FI5WpK128456;
 Thu, 15 Oct 2020 18:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=Wcwlop9HSfDveCXe0oyh5/0MRezO0jvRGPWDaiDyIH4=;
 b=L4LEuc4y5J49FC7GTYAo95VVq00NpdjGI23mFRmDHFx+CSX+3UcOCRRvXbIWLyX7I7DA
 HkCyNP1MrPkU1/khkMv4smrWI0Gt+T7zHHZ63pjbcqHokwJf1HW4DuFn5uD8HPMBljEB
 fyc4XySGp8npvcsvX5A2opwQ8nJS0/vwSH/LO2opHKf2dH1K4qg0UPv1By4VL/gVGzdC
 NfTe+r62eeR7BFC6ItUQ0y4IMi4HtRxSxAJNHlRjwXl5XdW5Emli0CGi7jA6ytKnmjZW
 nbJGA3GnX9QlJn1U/7W/7IQZIIFepTQoNEHxspm3ldP9JxvomU2/N9nS13r0I9q+3x1p oA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 346g8gkcd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 15 Oct 2020 18:05:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FI5dE4040121;
 Thu, 15 Oct 2020 18:05:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 344by5hhw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Oct 2020 18:05:42 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09FI5e56007934;
 Thu, 15 Oct 2020 18:05:40 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 15 Oct 2020 11:05:40 -0700
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 13/19] multi-process: PCI BAR read/write handling for
 proxy & remote endpoints
Date: Thu, 15 Oct 2020 14:05:06 -0400
Message-Id: <7a0fcb42667292ac6d455f24aef7fba33679a1ba.1602784930.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1602784930.git.jag.raman@oracle.com>
References: <cover.1602784930.git.jag.raman@oracle.com>
In-Reply-To: <cover.1602784930.git.jag.raman@oracle.com>
References: <cover.1602784930.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9775
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=1 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010150121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9775
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=1
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150121
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 11:04:16
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
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
 hw/i386/remote-msg.c     | 87 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/pci/proxy.c           | 60 +++++++++++++++++++++++++++++++++
 include/hw/pci/proxy.h   | 10 ++++++
 include/io/mpqemu-link.h | 10 ++++++
 io/mpqemu-link.c         |  6 ++++
 5 files changed, 173 insertions(+)

diff --git a/hw/i386/remote-msg.c b/hw/i386/remote-msg.c
index 94937db..9b9ca7e 100644
--- a/hw/i386/remote-msg.c
+++ b/hw/i386/remote-msg.c
@@ -16,11 +16,14 @@
 #include "qapi/error.h"
 #include "sysemu/runstate.h"
 #include "hw/pci/pci.h"
+#include "exec/memattrs.h"
 
 static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
                                  MPQemuMsg *msg);
 static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
                                 MPQemuMsg *msg);
+static void process_bar_write(QIOChannel *ioc, MPQemuMsg *msg, Error **errp);
+static void process_bar_read(QIOChannel *ioc, MPQemuMsg *msg, Error **errp);
 
 void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
 {
@@ -55,6 +58,12 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         case PCI_CONFIG_READ:
             process_config_read(com->ioc, pci_dev, &msg);
             break;
+        case BAR_WRITE:
+            process_bar_write(com->ioc, &msg, &local_err);
+            break;
+        case BAR_READ:
+            process_bar_read(com->ioc, &msg, &local_err);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s (pid=%d)",
@@ -122,3 +131,81 @@ static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
                      getpid());
     }
 }
+
+static void process_bar_write(QIOChannel *ioc, MPQemuMsg *msg, Error **errp)
+{
+    BarAccessMsg *bar_access = &msg->data.bar_access;
+    AddressSpace *as =
+        bar_access->memory ? &address_space_memory : &address_space_io;
+    MPQemuMsg ret = { 0 };
+    MemTxResult res;
+    uint64_t val;
+    Error *local_err = NULL;
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
+        error_setg(errp, "Could not perform address space write operation,"
+                   " inaccessible address: %lx in pid %d.",
+                   bar_access->addr, getpid());
+        ret.data.u64 = -1;
+    }
+
+fail:
+    ret.cmd = RET_MSG;
+    ret.size = sizeof(ret.data.u64);
+
+    mpqemu_msg_send(&ret, ioc, &local_err);
+    if (local_err) {
+        error_setg(errp, "Error while sending message to proxy "
+                   "in remote process pid=%d", getpid());
+    }
+}
+
+static void process_bar_read(QIOChannel *ioc, MPQemuMsg *msg, Error **errp)
+{
+    BarAccessMsg *bar_access = &msg->data.bar_access;
+    MPQemuMsg ret = { 0 };
+    AddressSpace *as;
+    MemTxResult res;
+    uint64_t val = 0;
+    Error *local_err = NULL;
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
+        error_setg(errp, "Could not perform address space read operation,"
+                   " inaccessible address: %lx in pid %d.",
+                   bar_access->addr, getpid());
+        val = UINT64_MAX;
+    }
+
+fail:
+    ret.cmd = RET_MSG;
+    ret.data.u64 = le64_to_cpu(val);
+    ret.size = sizeof(ret.data.u64);
+
+    mpqemu_msg_send(&ret, ioc, &local_err);
+    if (local_err) {
+        error_setg(errp, "Error while sending message to proxy "
+                   "in remote process pid=%d", getpid());
+    }
+}
diff --git a/hw/pci/proxy.c b/hw/pci/proxy.c
index 27714fe..4ae4919 100644
--- a/hw/pci/proxy.c
+++ b/hw/pci/proxy.c
@@ -146,3 +146,63 @@ static void pci_proxy_dev_register_types(void)
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
+        msg.cmd = BAR_WRITE;
+        msg.data.bar_access.val = *val;
+    } else {
+        msg.cmd = BAR_READ;
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
diff --git a/include/hw/pci/proxy.h b/include/hw/pci/proxy.h
index 923432a..e29c61b 100644
--- a/include/hw/pci/proxy.h
+++ b/include/hw/pci/proxy.h
@@ -16,8 +16,17 @@
 
 #define PCI_PROXY_DEV(obj) \
             OBJECT_CHECK(PCIProxyDev, (obj), TYPE_PCI_PROXY_DEV)
+
 typedef struct PCIProxyDev PCIProxyDev;
 
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
@@ -31,6 +40,7 @@ struct PCIProxyDev {
     QemuMutex io_mutex;
     QIOChannel *ioc;
     Error *migration_blocker;
+    ProxyMemoryRegion region[PCI_NUM_REGIONS];
 };
 
 #endif /* PROXY_H */
diff --git a/include/io/mpqemu-link.h b/include/io/mpqemu-link.h
index 459d345..234ac82 100644
--- a/include/io/mpqemu-link.h
+++ b/include/io/mpqemu-link.h
@@ -36,6 +36,8 @@ typedef enum {
     RET_MSG,
     PCI_CONFIG_WRITE,
     PCI_CONFIG_READ,
+    BAR_WRITE,
+    BAR_READ,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
@@ -51,6 +53,13 @@ typedef struct {
     int l;
 } ConfDataMsg;
 
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
@@ -70,6 +79,7 @@ typedef struct {
         uint64_t u64;
         ConfDataMsg conf_data;
         SyncSysmemMsg sync_sysmem;
+        BarAccessMsg bar_access;
     } data;
 
     int fds[REMOTE_MAX_FDS];
diff --git a/io/mpqemu-link.c b/io/mpqemu-link.c
index 5ef82da..7e297ef 100644
--- a/io/mpqemu-link.c
+++ b/io/mpqemu-link.c
@@ -284,6 +284,12 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
             return false;
         }
         break;
+    case BAR_WRITE:
+    case BAR_READ:
+        if ((msg->size != sizeof(BarAccessMsg)) || (msg->num_fds != 0)) {
+            return false;
+        }
+        break;
     default:
         break;
     }
-- 
1.8.3.1


