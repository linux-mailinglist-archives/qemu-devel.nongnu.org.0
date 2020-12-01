Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388E72CAD7C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:38:43 +0100 (CET)
Received: from localhost ([::1]:34854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkCQ6-0007vn-4U
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kkCDV-0000dO-FQ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:25:41 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:46246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kkCDS-0001Nv-B2
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:25:41 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1KOxVZ149583;
 Tue, 1 Dec 2020 20:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=P6NvMr51hwVJcqiHrVjB75Ut0udoh3vJfFzY0R0dLwE=;
 b=hTuEYBqZVeIU2KZrsXJNhlrHEzHPZtjXixPpflpBgoKDlrLDiuojzl3b7TofHVmuiAC4
 K8IVjCJyyFyBoDBrd52oDGYjIdjCPs2K8A1KR87M+J/7vPwgOof5D4TI5Tx/heJP3Bsm
 4cJ4i0GZutALXkPP8HRU644haq57sxyC1b8aAAlzFI10+XxXwKl6VPwF9BHyTJYiOhu/
 GvrH2fzxMBbpAdJdVfe0w9HIaaXEoRQhpgtpyPml+Yt/qLgiqhvMHAbIZGa6XM1vmWWP
 ylnlBjujelEhHt5Np4qmmP6dNLWiNzzglyBDHEFK4qp9vbdoj7jaetnJBKzCF0yfBngm IA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 353egkmmcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 01 Dec 2020 20:25:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1KFKTS006231;
 Tue, 1 Dec 2020 20:23:28 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 3540fxgym9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Dec 2020 20:23:28 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B1KNRHn013105;
 Tue, 1 Dec 2020 20:23:27 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Dec 2020 20:23:27 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 14/19] multi-process: Forward PCI config space acceses to
 the remote process
Date: Tue,  1 Dec 2020 15:22:49 -0500
Message-Id: <67d558deedfeb3d331e013edd857b2d193e8617e.1606853298.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1606853298.git.jag.raman@oracle.com>
References: <cover.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <cover.1606853298.git.jag.raman@oracle.com>
References: <cover.1606853298.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=3
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 suspectscore=3
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010123
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

The Proxy Object sends the PCI config space accesses as messages
to the remote process over the communication channel

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/mpqemu-link.h |  9 ++++++
 hw/remote/message.c             | 62 +++++++++++++++++++++++++++++++++++++++++
 hw/remote/mpqemu-link.c         |  6 ++++
 hw/remote/proxy.c               | 51 +++++++++++++++++++++++++++++++++
 4 files changed, 128 insertions(+)

diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index cee9468..057c98b 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -34,6 +34,8 @@ typedef enum {
     MPQEMU_CMD_INIT,
     SYNC_SYSMEM,
     RET_MSG,
+    PCI_CONFIG_WRITE,
+    PCI_CONFIG_READ,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
@@ -43,6 +45,12 @@ typedef struct {
     off_t offsets[REMOTE_MAX_FDS];
 } SyncSysmemMsg;
 
+typedef struct {
+    uint32_t addr;
+    uint32_t val;
+    int l;
+} PciConfDataMsg;
+
 /**
  * MPQemuMsg:
  * @cmd: The remote command
@@ -60,6 +68,7 @@ typedef struct {
 
     union {
         uint64_t u64;
+        PciConfDataMsg pci_conf_data;
         SyncSysmemMsg sync_sysmem;
     } data;
 
diff --git a/hw/remote/message.c b/hw/remote/message.c
index 1f2edc7..52a6f6f 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -15,6 +15,12 @@
 #include "hw/remote/mpqemu-link.h"
 #include "qapi/error.h"
 #include "sysemu/runstate.h"
+#include "hw/pci/pci.h"
+
+static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
+                                 MPQemuMsg *msg);
+static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
+                                MPQemuMsg *msg);
 
 void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
 {
@@ -43,6 +49,12 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         }
 
         switch (msg.cmd) {
+        case PCI_CONFIG_WRITE:
+            process_config_write(com->ioc, pci_dev, &msg);
+            break;
+        case PCI_CONFIG_READ:
+            process_config_read(com->ioc, pci_dev, &msg);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s (pid=%d)",
@@ -60,3 +72,53 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
 
     return;
 }
+
+static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
+                                 MPQemuMsg *msg)
+{
+    PciConfDataMsg *conf = (PciConfDataMsg *)&msg->data.pci_conf_data;
+    MPQemuMsg ret = { 0 };
+    Error *local_err = NULL;
+
+    if ((conf->addr + sizeof(conf->val)) > pci_config_size(dev)) {
+        error_report("Bad address received when writing PCI config, pid %d",
+                     getpid());
+        ret.data.u64 = UINT64_MAX;
+    } else {
+        pci_default_write_config(dev, conf->addr, conf->val, conf->l);
+    }
+
+    ret.cmd = RET_MSG;
+    ret.size = sizeof(ret.data.u64);
+
+    mpqemu_msg_send(&ret, ioc, &local_err);
+    if (local_err) {
+        error_report("Could not send message to proxy from pid %d",
+                     getpid());
+    }
+}
+
+static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
+                                MPQemuMsg *msg)
+{
+    PciConfDataMsg *conf = (PciConfDataMsg *)&msg->data.pci_conf_data;
+    MPQemuMsg ret = { 0 };
+    Error *local_err = NULL;
+
+    if ((conf->addr + sizeof(conf->val)) > pci_config_size(dev)) {
+        error_report("Bad address received when reading PCI config, pid %d",
+                     getpid());
+        ret.data.u64 = UINT64_MAX;
+    } else {
+        ret.data.u64 = pci_default_read_config(dev, conf->addr, conf->l);
+    }
+
+    ret.cmd = RET_MSG;
+    ret.size = sizeof(ret.data.u64);
+
+    mpqemu_msg_send(&ret, ioc, &local_err);
+    if (local_err) {
+        error_report("Could not send message to proxy from pid %d",
+                     getpid());
+    }
+}
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index 18c8a54..83dbd65 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -283,6 +283,12 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
             return false;
         }
         break;
+    case PCI_CONFIG_WRITE:
+    case PCI_CONFIG_READ:
+        if (msg->size != sizeof(PciConfDataMsg)) {
+            return false;
+        }
+        break;
     default:
         break;
     }
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 29100bc..c193484 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -16,6 +16,8 @@
 #include "hw/qdev-properties.h"
 #include "monitor/monitor.h"
 #include "migration/blocker.h"
+#include "hw/remote/mpqemu-link.h"
+#include "qemu/error-report.h"
 
 static void proxy_set_socket(PCIProxyDev *pdev, int fd, Error **errp)
 {
@@ -69,6 +71,52 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
     error_free(dev->migration_blocker);
 }
 
+static int config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t *val,
+                          int l, unsigned int op)
+{
+    MPQemuMsg msg = { 0 };
+    uint64_t ret = -EINVAL;
+    Error *local_err = NULL;
+
+    msg.cmd = op;
+    msg.data.pci_conf_data.addr = addr;
+    msg.data.pci_conf_data.val = (op == PCI_CONFIG_WRITE) ? *val : 0;
+    msg.data.pci_conf_data.l = l;
+    msg.size = sizeof(PciConfDataMsg);
+
+    ret = mpqemu_msg_send_and_await_reply(&msg, pdev, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+    }
+    if (op == PCI_CONFIG_READ) {
+        *val = (uint32_t)ret;
+    }
+
+    return ret;
+}
+
+static uint32_t pci_proxy_read_config(PCIDevice *d, uint32_t addr, int len)
+{
+    uint32_t val;
+
+    (void)config_op_send(PCI_PROXY_DEV(d), addr, &val, len, PCI_CONFIG_READ);
+
+    return val;
+}
+
+static void pci_proxy_write_config(PCIDevice *d, uint32_t addr, uint32_t val,
+                                   int l)
+{
+    /*
+     * Some of the functions access the copy of remote device's PCI config
+     * space which is cached in the proxy device. Therefore, maintain
+     * it updated.
+     */
+    pci_default_write_config(d, addr, val, l);
+
+    (void)config_op_send(PCI_PROXY_DEV(d), addr, &val, l, PCI_CONFIG_WRITE);
+}
+
 static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -76,6 +124,9 @@ static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
 
     k->realize = pci_proxy_dev_realize;
     k->exit = pci_proxy_dev_exit;
+    k->config_read = pci_proxy_read_config;
+    k->config_write = pci_proxy_write_config;
+
     device_class_set_props(dc, proxy_properties);
 }
 
-- 
1.8.3.1


