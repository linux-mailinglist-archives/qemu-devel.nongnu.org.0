Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EC72E1906
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:39:02 +0100 (CET)
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxnZ-0002Kw-Bw
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1krxRI-00062D-9Y
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:16:00 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:33516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1krxR9-0006Lv-9e
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:16:00 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BN6A7Js094464;
 Wed, 23 Dec 2020 06:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=Zb95eeQNsY7WoYC6Qz2M4laSuWGUaqTaAWdnG3+1wa4=;
 b=rt0hGpvPZhn2pMKFLjyMay8HRluPqRwxxuU1uPPEot6Y4jJQxXOf3DRYSBuAMa9DOG9I
 O+BN958+kOWmV9WSAsFD+4eoopyV9rMsht4c9tWnc/fBme3oyyWNfBkoOsOATMVNaePJ
 hu6C2wu3gWC67EcpynGOe4w/LtqfOheZOzh65MvyZH/3bHLuWNNtnhyXAkosDhTvedso
 v2Z/aqbjhlNfDW9njSHou9Hk8Jl8UaI3ZfpItqMmjHYCGFYYGM8qTN8+csBNw1l3X2ud
 V0Af+4VMpL2UZOqWjzbCPH2kJW0i1Mx+e71zXvA7SDlq4ve4ZruBmpKiEYgBJMhsdvfO sw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35k0cw6f5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Dec 2020 06:15:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BN6FbQE119906;
 Wed, 23 Dec 2020 06:15:42 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 35k0e2kqjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Dec 2020 06:15:42 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BN6FeVo031938;
 Wed, 23 Dec 2020 06:15:40 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 22 Dec 2020 22:15:40 -0800
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH v15 15/20] multi-process: Forward PCI config space acceses to
 the remote process
Date: Tue, 22 Dec 2020 22:14:50 -0800
Message-Id: <9aed0b8ab0d2b2220563baa0f67d55306949c4b2.1608702853.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1608702853.git.elena.ufimtseva@oracle.com>
References: <cover.1608702853.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9843
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012230047
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9843
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012230046
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

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

The Proxy Object sends the PCI config space accesses as messages
to the remote process over the communication channel

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/mpqemu-link.h | 10 ++++++
 hw/remote/message.c             | 60 +++++++++++++++++++++++++++++++++
 hw/remote/mpqemu-link.c         |  8 ++++-
 hw/remote/proxy.c               | 55 ++++++++++++++++++++++++++++++
 4 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 36b540c047..1f35568ed0 100644
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
index 72ad6cd7fd..82f85c9f09 100644
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
index df35a4d9c6..d7672bc1a8 100644
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
index 489f4cecc9..eee680bb88 100644
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
2.25.GIT


