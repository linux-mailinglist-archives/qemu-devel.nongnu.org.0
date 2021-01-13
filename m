Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE75A2F50A7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 18:09:37 +0100 (CET)
Received: from localhost ([::1]:53580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzjeK-0006fk-RN
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 12:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kzjEy-0006Zv-3P
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:43:25 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kzjEo-0007zA-Ie
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:43:22 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DGfOVm138137;
 Wed, 13 Jan 2021 16:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=RdD2os6t3PSYJEZeInDV3U76ZlcxnwkHmDA1IYMV3bY=;
 b=UzyvXSbIXJcBEJRcgf72jy1toVGWMFq+haU0/IVNEDdtqNqxeosRscm+YEoiM1hfoG4m
 Xd7nAqt2OdSmpwieoX6qmE6u1LpMkiiXo8cAVPTJTBSptl671g+kvP6CPGo2C/0wOLtP
 mNdBEBLWTA0Av18rfkfXs/o88UBcLTcURIEj2R9cx9wvXZXi4A3pZ6Xh2oyXbFAzZg9V
 N1mJrTK2wf6qek0JynbwD+ZyPjErJajyq8v47pxbd4zGmu3nYxG1m9jra+Ih0IBVVOH+
 c7o9vClVYEKa1s7O/Mo48A8TKd8GBcUndG+P/KM5xDZKtsdELdeISExzNlDBruYOuBb+ 6g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 360kcyvdtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 16:43:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DGe8sX190564;
 Wed, 13 Jan 2021 16:43:07 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 360kf0vr8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 16:43:07 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10DGh68Y028574;
 Wed, 13 Jan 2021 16:43:06 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Jan 2021 08:43:06 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v17 15/20] multi-process: Forward PCI config space acceses to
 the remote process
Date: Wed, 13 Jan 2021 11:42:27 -0500
Message-Id: <a6d1ef8e1fe2fc8e2a260241af2a96589a43a64c.1610556046.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610556046.git.jag.raman@oracle.com>
References: <cover.1610556046.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610556046.git.jag.raman@oracle.com>
References: <cover.1610556046.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130100
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
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

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

The Proxy Object sends the PCI config space accesses as messages
to the remote process over the communication channel

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/mpqemu-link.h | 10 +++++++
 hw/remote/message.c             | 60 +++++++++++++++++++++++++++++++++++++++++
 hw/remote/mpqemu-link.c         |  8 +++++-
 hw/remote/proxy.c               | 55 +++++++++++++++++++++++++++++++++++++
 4 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 1b35d40..7bc0bdd 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -34,6 +34,9 @@
  */
 typedef enum {
     MPQEMU_CMD_SYNC_SYSMEM,
+    MPQEMU_CMD_RET,
+    MPQEMU_CMD_PCI_CFGWRITE,
+    MPQEMU_CMD_PCI_CFGREAD,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
@@ -43,6 +46,12 @@ typedef struct {
     off_t offsets[REMOTE_MAX_FDS];
 } SyncSysmemMsg;
 
+typedef struct {
+    uint32_t addr;
+    uint32_t val;
+    int len;
+} PciConfDataMsg;
+
 /**
  * MPQemuMsg:
  * @cmd: The remote command
@@ -60,6 +69,7 @@ typedef struct {
 
     union {
         uint64_t u64;
+        PciConfDataMsg pci_conf_data;
         SyncSysmemMsg sync_sysmem;
     } data;
 
diff --git a/hw/remote/message.c b/hw/remote/message.c
index 36e2d4f..636bd16 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -15,6 +15,12 @@
 #include "hw/remote/mpqemu-link.h"
 #include "qapi/error.h"
 #include "sysemu/runstate.h"
+#include "hw/pci/pci.h"
+
+static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
+                                 MPQemuMsg *msg, Error **errp);
+static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
+                                MPQemuMsg *msg, Error **errp);
 
 void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
 {
@@ -40,6 +46,12 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         }
 
         switch (msg.cmd) {
+        case MPQEMU_CMD_PCI_CFGWRITE:
+            process_config_write(com->ioc, pci_dev, &msg, &local_err);
+            break;
+        case MPQEMU_CMD_PCI_CFGREAD:
+            process_config_read(com->ioc, pci_dev, &msg, &local_err);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s"
@@ -55,3 +67,51 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
 }
+
+static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
+                                 MPQemuMsg *msg, Error **errp)
+{
+    ERRP_GUARD();
+    PciConfDataMsg *conf = (PciConfDataMsg *)&msg->data.pci_conf_data;
+    MPQemuMsg ret = { 0 };
+
+    if ((conf->addr + sizeof(conf->val)) > pci_config_size(dev)) {
+        error_setg(errp, "Bad address for PCI config write, pid "FMT_pid".",
+                   getpid());
+        ret.data.u64 = UINT64_MAX;
+    } else {
+        pci_default_write_config(dev, conf->addr, conf->val, conf->len);
+    }
+
+    ret.cmd = MPQEMU_CMD_RET;
+    ret.size = sizeof(ret.data.u64);
+
+    if (!mpqemu_msg_send(&ret, ioc, NULL)) {
+        error_prepend(errp, "Error returning code to proxy, pid "FMT_pid": ",
+                      getpid());
+    }
+}
+
+static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
+                                MPQemuMsg *msg, Error **errp)
+{
+    ERRP_GUARD();
+    PciConfDataMsg *conf = (PciConfDataMsg *)&msg->data.pci_conf_data;
+    MPQemuMsg ret = { 0 };
+
+    if ((conf->addr + sizeof(conf->val)) > pci_config_size(dev)) {
+        error_setg(errp, "Bad address for PCI config read, pid "FMT_pid".",
+                   getpid());
+        ret.data.u64 = UINT64_MAX;
+    } else {
+        ret.data.u64 = pci_default_read_config(dev, conf->addr, conf->len);
+    }
+
+    ret.cmd = MPQEMU_CMD_RET;
+    ret.size = sizeof(ret.data.u64);
+
+    if (!mpqemu_msg_send(&ret, ioc, NULL)) {
+        error_prepend(errp, "Error returning code to proxy, pid "FMT_pid": ",
+                      getpid());
+    }
+}
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index 88d1f9b..5bd6a9d 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -207,7 +207,7 @@ uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev,
         return ret;
     }
 
-    if (!mpqemu_msg_valid(&msg_reply)) {
+    if (!mpqemu_msg_valid(&msg_reply) || msg_reply.cmd != MPQEMU_CMD_RET) {
         error_setg(errp, "ERROR: Invalid reply received for command %d",
                          msg->cmd);
         return ret;
@@ -242,6 +242,12 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
             return false;
         }
         break;
+    case MPQEMU_CMD_PCI_CFGWRITE:
+    case MPQEMU_CMD_PCI_CFGREAD:
+        if (msg->size != sizeof(PciConfDataMsg)) {
+            return false;
+        }
+        break;
     default:
         break;
     }
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index cd5b071..2b14394 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -17,6 +17,8 @@
 #include "monitor/monitor.h"
 #include "migration/blocker.h"
 #include "qemu/sockets.h"
+#include "hw/remote/mpqemu-link.h"
+#include "qemu/error-report.h"
 
 static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
 {
@@ -65,6 +67,56 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
     error_free(dev->migration_blocker);
 }
 
+static void config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t *val,
+                           int len, unsigned int op)
+{
+    MPQemuMsg msg = { 0 };
+    uint64_t ret = -EINVAL;
+    Error *local_err = NULL;
+
+    msg.cmd = op;
+    msg.data.pci_conf_data.addr = addr;
+    msg.data.pci_conf_data.val = (op == MPQEMU_CMD_PCI_CFGWRITE) ? *val : 0;
+    msg.data.pci_conf_data.len = len;
+    msg.size = sizeof(PciConfDataMsg);
+
+    ret = mpqemu_msg_send_and_await_reply(&msg, pdev, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+    }
+
+    if (ret == UINT64_MAX) {
+        error_report("Failed to perform PCI config %s operation",
+                     (op == MPQEMU_CMD_PCI_CFGREAD) ? "READ" : "WRITE");
+    }
+
+    if (op == MPQEMU_CMD_PCI_CFGREAD) {
+        *val = (uint32_t)ret;
+    }
+}
+
+static uint32_t pci_proxy_read_config(PCIDevice *d, uint32_t addr, int len)
+{
+    uint32_t val;
+
+    config_op_send(PCI_PROXY_DEV(d), addr, &val, len, MPQEMU_CMD_PCI_CFGREAD);
+
+    return val;
+}
+
+static void pci_proxy_write_config(PCIDevice *d, uint32_t addr, uint32_t val,
+                                   int len)
+{
+    /*
+     * Some of the functions access the copy of remote device's PCI config
+     * space which is cached in the proxy device. Therefore, maintain
+     * it updated.
+     */
+    pci_default_write_config(d, addr, val, len);
+
+    config_op_send(PCI_PROXY_DEV(d), addr, &val, len, MPQEMU_CMD_PCI_CFGWRITE);
+}
+
 static Property proxy_properties[] = {
     DEFINE_PROP_STRING("fd", PCIProxyDev, fd),
     DEFINE_PROP_END_OF_LIST(),
@@ -77,6 +129,9 @@ static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
 
     k->realize = pci_proxy_dev_realize;
     k->exit = pci_proxy_dev_exit;
+    k->config_read = pci_proxy_read_config;
+    k->config_write = pci_proxy_write_config;
+
     device_class_set_props(dc, proxy_properties);
 }
 
-- 
1.8.3.1


