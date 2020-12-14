Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8356E2D92DC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:38:18 +0100 (CET)
Received: from localhost ([::1]:48192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogYr-0006Hm-Ki
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kogF7-0007Gr-5W
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 00:17:53 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:40388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kogF4-0007Lx-Hk
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 00:17:52 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BE5EhQi007194;
 Mon, 14 Dec 2020 05:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=NQrUtSHQ/SyjP9Lv7kgus4LkTCtsp1NGWGzWnNqtxWU=;
 b=DrSbafsR3jHG/E0fzTK1RupbFzLH+rT962sMQOPccmgVboZwxKzEBvfWNw60qx+1oVrW
 yiEcdJPRaWe0hWAdtxel63F756gUlWOJAVC7MdAzhEcGLmhglT8lBHp7B8aF0NPJfJpi
 hhpk8Q915n4aPW1oELx9QRwLaRQqkyZbPHToGoqlhvHcoR+bUiW6BXTl1o6jw1vYOJzc
 Q2CwQoUa+SIGp9ByNqQh8N/a34dw9s2hPdUhx90p/YQtKZjMpbX++8TeI2bJqrhi/vSl
 ouf4lJ9OZlEVjNSYTPyZFQJpzZWz3gf2RU+8gUxx0One8wct+WnnhOTY9OY5qLjQ8vDy cw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 35cn9r3cjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Dec 2020 05:17:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BE5AwxE162449;
 Mon, 14 Dec 2020 05:15:42 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 35d7mpfg4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 05:15:42 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BE5FeBW006632;
 Mon, 14 Dec 2020 05:15:40 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 13 Dec 2020 21:15:40 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 19/19] multi-process: perform device reset in the remote
 process
Date: Mon, 14 Dec 2020 00:14:59 -0500
Message-Id: <06082cf4fe8ff46d941669a7bb8d8a3bb407bace.1607922214.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
References: <cover.1607922214.git.jag.raman@oracle.com>
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
References: <cover.1607922214.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012140040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140040
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
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

Perform device reset in the remote process when QEMU performs
device reset. This is required to reset the internal state
(like registers, etc...) of emulated devices

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/mpqemu-link.h |  1 +
 hw/remote/message.c             | 22 ++++++++++++++++++++++
 hw/remote/proxy.c               | 19 +++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 0de995e..49dcad9 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -40,6 +40,7 @@ typedef enum {
     MPQEMU_CMD_BAR_WRITE,
     MPQEMU_CMD_BAR_READ,
     MPQEMU_CMD_SET_IRQFD,
+    MPQEMU_CMD_DEVICE_RESET,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
diff --git a/hw/remote/message.c b/hw/remote/message.c
index 96ed11d..97e608e 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -19,6 +19,7 @@
 #include "exec/memattrs.h"
 #include "hw/remote/memory.h"
 #include "hw/remote/iohub.h"
+#include "sysemu/reset.h"
 
 static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
                                  MPQemuMsg *msg, Error **errp);
@@ -26,6 +27,8 @@ static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
                                 MPQemuMsg *msg, Error **errp);
 static void process_bar_write(QIOChannel *ioc, MPQemuMsg *msg, Error **errp);
 static void process_bar_read(QIOChannel *ioc, MPQemuMsg *msg, Error **errp);
+static void process_device_reset_msg(QIOChannel *ioc, PCIDevice *dev,
+                                     Error **errp);
 
 void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
 {
@@ -69,6 +72,9 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         case MPQEMU_CMD_SET_IRQFD:
             process_set_irqfd_msg(pci_dev, &msg);
             break;
+        case MPQEMU_CMD_DEVICE_RESET:
+            process_device_reset_msg(com->ioc, pci_dev, &local_err);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s"
@@ -206,3 +212,19 @@ fail:
                       getpid());
     }
 }
+
+static void process_device_reset_msg(QIOChannel *ioc, PCIDevice *dev,
+                                     Error **errp)
+{
+    DeviceClass *dc = DEVICE_GET_CLASS(dev);
+    DeviceState *s = DEVICE(dev);
+    MPQemuMsg ret = { 0 };
+
+    if (dc->reset) {
+        dc->reset(s);
+    }
+
+    ret.cmd = MPQEMU_CMD_RET;
+
+    mpqemu_msg_send(&ret, ioc, errp);
+}
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 7db9794..253a703 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -25,6 +25,7 @@
 #include "util/event_notifier-posix.c"
 
 static void probe_pci_info(PCIDevice *dev, Error **errp);
+static void proxy_device_reset(DeviceState *dev);
 
 static void proxy_intx_update(PCIDevice *pci_dev)
 {
@@ -194,6 +195,8 @@ static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
     k->config_read = pci_proxy_read_config;
     k->config_write = pci_proxy_write_config;
 
+    dc->reset = proxy_device_reset;
+
     device_class_set_props(dc, proxy_properties);
 }
 
@@ -350,3 +353,19 @@ static void probe_pci_info(PCIDevice *dev, Error **errp)
         }
     }
 }
+
+static void proxy_device_reset(DeviceState *dev)
+{
+    PCIProxyDev *pdev = PCI_PROXY_DEV(dev);
+    MPQemuMsg msg = { 0 };
+    Error *local_err = NULL;
+
+    msg.cmd = MPQEMU_CMD_DEVICE_RESET;
+    msg.size = 0;
+
+    mpqemu_msg_send_and_await_reply(&msg, pdev, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+    }
+
+}
-- 
1.8.3.1


