Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738221B539B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 06:26:15 +0200 (CEST)
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRTRG-0001uf-Fz
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 00:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1jRTGr-0001CA-Jn
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 00:15:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1jRTGq-00088P-UI
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 00:15:29 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:39238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1jRTGq-00085z-93
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 00:15:28 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03N4CvME052304;
 Thu, 23 Apr 2020 04:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=XEdp27TV+sTRqUYU+yDosGCQDmdC3K9lRfKd6pei3Zs=;
 b=X1bqxVAkGOInU6K5MGkmW6O0YPImbtd1bVAvq4ZCeKS+ewPz7z9hlVHh0QxL9YFM+EpB
 J4dzWfxWbTVD4iANOILTL4tfbXMFFMYdAuPMAFQZaVyGGinBaCnKBPiWBDeIH/5Ea6VZ
 VvoKiLDBc4d5kGhY/abFBGvaKxctOpQMAWYZJUWfNFYkRFygpOgyX1ko5Hh+j78kgQBC
 31QtJ/JtYyAfxlZ57F4MlnADdzIFQcedruaAf6qv4hfdO3xRa7Dos0HujjA7NHO+Vba6
 LNuWWe3pR3W3ylVnVMD+krimzb9KtUgNhfgQv7IZZQnInUB55tFcfPw5XG3wFpFkPXwy kg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 30jhyc543k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 04:15:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03N4CIMA089330;
 Thu, 23 Apr 2020 04:15:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 30gb1ku8g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 04:15:20 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03N4FJDG026673;
 Thu, 23 Apr 2020 04:15:19 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 22 Apr 2020 21:15:19 -0700
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v6 30/36] multi-process: perform device reset in the
 remote process
Date: Wed, 22 Apr 2020 21:14:05 -0700
Message-Id: <52ab9cde73d17581f7931cd6e94963a7fe71bedf.1587614626.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1587614626.git.elena.ufimtseva@oracle.com>
References: <cover.1587614626.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9599
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=1 spamscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004230027
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9599
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 mlxscore=0
 clxscore=1015 suspectscore=1 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004230027
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=elena.ufimtseva@oracle.com; helo=userp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 00:14:40
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.85
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
 liran.alon@oracle.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
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
---
 hw/proxy/qemu-proxy.c    | 25 +++++++++++++++++++++++++
 include/io/mpqemu-link.h |  1 +
 remote/remote-main.c     | 13 +++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/hw/proxy/qemu-proxy.c b/hw/proxy/qemu-proxy.c
index 162014353f..cffc227acd 100644
--- a/hw/proxy/qemu-proxy.c
+++ b/hw/proxy/qemu-proxy.c
@@ -291,14 +291,39 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
     stop_hb_timer(dev);
 }
 
+static void proxy_device_reset(DeviceState *dev)
+{
+    PCIProxyDev *pdev = PCI_PROXY_DEV(dev);
+    MPQemuMsg msg;
+    int wait = -1;
+
+    memset(&msg, 0, sizeof(MPQemuMsg));
+
+    msg.bytestream = 0;
+    msg.size = sizeof(msg.data1);
+    msg.cmd = DEVICE_RESET;
+
+    wait = GET_REMOTE_WAIT;
+    msg.num_fds = 1;
+    msg.fds[0] = wait;
+
+    mpqemu_msg_send(&msg, pdev->mpqemu_link->com);
+
+    (void)wait_for_remote(wait);
+
+    PUT_REMOTE_WAIT(wait);
+}
+
 static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
     k->realize = pci_proxy_dev_realize;
     k->exit = pci_proxy_dev_exit;
     k->config_read = pci_proxy_read_config;
     k->config_write = pci_proxy_write_config;
+    dc->reset = proxy_device_reset;
 }
 
 static const TypeInfo pci_proxy_dev_type_info = {
diff --git a/include/io/mpqemu-link.h b/include/io/mpqemu-link.h
index 45ea1fcafa..22fb234744 100644
--- a/include/io/mpqemu-link.h
+++ b/include/io/mpqemu-link.h
@@ -51,6 +51,7 @@ typedef enum {
     GET_PCI_INFO,
     RET_PCI_INFO,
     PROXY_PING,
+    DEVICE_RESET,
     MAX,
 } mpqemu_cmd_t;
 
diff --git a/remote/remote-main.c b/remote/remote-main.c
index beac591fac..562db4ccc3 100644
--- a/remote/remote-main.c
+++ b/remote/remote-main.c
@@ -39,6 +39,7 @@
 #include "exec/address-spaces.h"
 #include "remote/iohub.h"
 #include "remote-opts.h"
+#include "sysemu/reset.h"
 
 static void process_msg(GIOCondition cond, MPQemuLinkState *link,
                         MPQemuChannel *chan);
@@ -208,6 +209,15 @@ static void process_get_pci_info_msg(MPQemuLinkState *link, MPQemuMsg *msg)
     mpqemu_msg_send(&ret, link->dev);
 }
 
+static void process_device_reset_msg(MPQemuMsg *msg)
+{
+    qemu_devices_reset();
+
+    if (msg->num_fds == 1) {
+            notify_proxy(msg->fds[0], 0);
+    }
+}
+
 static void process_msg(GIOCondition cond, MPQemuLinkState *link,
                         MPQemuChannel *chan)
 {
@@ -274,6 +284,9 @@ static void process_msg(GIOCondition cond, MPQemuLinkState *link,
         wait = msg->fds[0];
         notify_proxy(wait, 0);
         break;
+    case DEVICE_RESET:
+        process_device_reset_msg(msg);
+        break;
     default:
         error_setg(&err, "Unknown command in %s", print_pid_exec(pid_exec));
         goto finalize_loop;
-- 
2.25.GIT


