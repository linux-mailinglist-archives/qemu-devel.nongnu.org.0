Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C569916B170
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 22:05:14 +0100 (CET)
Received: from localhost ([::1]:43256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Kuf-0002d8-Mv
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 16:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50427)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jag.raman@oracle.com>) id 1j6KmH-0006YO-7H
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:56:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jag.raman@oracle.com>) id 1j6KmF-0003E3-QC
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:56:33 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:53150)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jag.raman@oracle.com>)
 id 1j6KmF-0003Cg-Gs
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:56:31 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01OKraDM164120;
 Mon, 24 Feb 2020 20:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=wsUMHj1D4jty5Rx598x7CcBe8ardoTAET1n87QbPxi8=;
 b=uVWfQ9J+EA0snhB8o9lt2MW3277lYmCZHQpkFOSzl6NEg61qoVvqPEjbprFQ+qn8P9AB
 zUqo6jpizi/5j0+oFZL5yOkV8Eiu9Cg3s06XfwOfpuhH0lH8tNgIokrX7RMc5Upxyfv9
 YrGHjMZaggFaQtzyxnrShSxpXAYGLxuNGlvsj5JbDmVvE7cqqPLbKDqn37uuLtb7yUAr
 wH1iiwa1AVHeVgVw7dL4oM1TGlv4C57vgzDbNQR0AALyuyDorCo429fxxi+2lZL37aKF
 +iJ8MUg1AH0x/m2mn4cpBe0k9apBe2FDvxFHwy3L5aMwC32s4Vju/c4r9osRhNKuAh9Q hA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2ybvr4p94e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 20:56:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01OKpuFw108591;
 Mon, 24 Feb 2020 20:56:25 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2ybe123t8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 20:56:25 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01OKuO4R028344;
 Mon, 24 Feb 2020 20:56:24 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Feb 2020 12:56:24 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/50] multi-process: configure remote side devices
Date: Mon, 24 Feb 2020 15:55:09 -0500
Message-Id: <e5b29270ef3f52c797067b8b5c3098540aa21e3e.1582576372.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1582576372.git.jag.raman@oracle.com>
References: <cover.1582576372.git.jag.raman@oracle.com>
In-Reply-To: <cover.1582576372.git.jag.raman@oracle.com>
References: <cover.1582576372.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9541
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=1 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240153
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9541
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 suspectscore=1 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240153
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.78
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

Add functions to configure remote devices.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 v4 -> v5:
  - Fixed qstr leak issue

 hw/proxy/qemu-proxy.c         | 56 ++++++++++++++++++++++++++++++++++++++++++-
 include/hw/proxy/qemu-proxy.h |  3 +++
 include/io/mpqemu-link.h      |  9 +++++++
 3 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/hw/proxy/qemu-proxy.c b/hw/proxy/qemu-proxy.c
index 0cf7dcc..3ba05d9 100644
--- a/hw/proxy/qemu-proxy.c
+++ b/hw/proxy/qemu-proxy.c
@@ -21,8 +21,60 @@
 #include "qemu/event_notifier.h"
 #include "sysemu/kvm.h"
 #include "util/event_notifier-posix.c"
+#include "hw/boards.h"
+#include "include/qemu/log.h"
 
 static void pci_proxy_dev_realize(PCIDevice *dev, Error **errp);
+static void setup_irqfd(PCIProxyDev *dev);
+
+static void proxy_ready(PCIDevice *dev)
+{
+    PCIProxyDev *pdev = PCI_PROXY_DEV(dev);
+
+    setup_irqfd(pdev);
+}
+
+static int set_remote_opts(PCIDevice *dev, QDict *qdict, unsigned int cmd)
+{
+    QString *qstr;
+    MPQemuMsg msg;
+    PCIProxyDev *pdev;
+    const char *str;
+    uint32_t reply = 0;
+    int rc = -EINVAL;
+    int wait;
+
+    pdev = PCI_PROXY_DEV(dev);
+
+    qstr = qobject_to_json(QOBJECT(qdict));
+    str = qstring_get_str(qstr);
+
+    memset(&msg, 0, sizeof(MPQemuMsg));
+
+    msg.data2 = (uint8_t *)(str);
+    msg.cmd = cmd;
+    msg.bytestream = 1;
+    msg.size = qstring_get_length(qstr) + 1;
+
+
+    wait = eventfd(0, EFD_NONBLOCK);
+    msg.num_fds = 1;
+    msg.fds[0] = wait;
+
+    mpqemu_msg_send(&msg, pdev->mpqemu_link->com);
+
+    reply = (uint32_t)wait_for_remote(wait);
+    close(wait);
+
+    /* TODO: Add proper handling if remote did not set options. */
+    if (reply == REMOTE_OK) {
+        rc = 0;
+    }
+
+    qobject_unref(qstr);
+
+    return rc;
+}
 
 static int add_argv(char *opts_str, char **argv, int argc)
 {
@@ -297,7 +349,6 @@ static void init_proxy(PCIDevice *dev, char *command, char *exec_name,
                         pdev->socket);
 
     configure_memory_sync(pdev->sync, pdev->mpqemu_link);
-    setup_irqfd(pdev);
 }
 
 static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
@@ -317,6 +368,9 @@ static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
     dev->get_proxy_sock = get_proxy_sock;
     dev->init_proxy = init_proxy;
     dev->sync = REMOTE_MEM_SYNC(object_new(TYPE_MEMORY_LISTENER));
+
+    dev->set_remote_opts = set_remote_opts;
+    dev->proxy_ready = proxy_ready;
 }
 
 static void send_bar_access_msg(PCIProxyDev *dev, MemoryRegion *mr,
diff --git a/include/hw/proxy/qemu-proxy.h b/include/hw/proxy/qemu-proxy.h
index 56aec0e..cd8505a 100644
--- a/include/hw/proxy/qemu-proxy.h
+++ b/include/hw/proxy/qemu-proxy.h
@@ -14,6 +14,8 @@
 #include "io/mpqemu-link.h"
 #include "hw/proxy/memory-sync.h"
 #include "qemu/event_notifier.h"
+#include "hw/pci/pci.h"
+#include "block/qdict.h"
 
 #define TYPE_PCI_PROXY_DEV "pci-proxy-dev"
 
@@ -62,6 +64,7 @@ struct PCIProxyDev {
     void (*set_proxy_sock) (PCIDevice *dev, int socket);
     int (*get_proxy_sock) (PCIDevice *dev);
 
+    int (*set_remote_opts) (PCIDevice *dev, QDict *qdict, unsigned int cmd);
     void (*proxy_ready) (PCIDevice *dev);
     void (*init_proxy) (PCIDevice *dev, char *command, char *exec_name,
                         bool need_spawn, Error **errp);
diff --git a/include/io/mpqemu-link.h b/include/io/mpqemu-link.h
index 13c4b80..90a8437 100644
--- a/include/io/mpqemu-link.h
+++ b/include/io/mpqemu-link.h
@@ -54,9 +54,18 @@ typedef enum {
     BAR_WRITE,
     BAR_READ,
     SET_IRQFD,
+    DEV_OPTS,
+    DRIVE_OPTS,
+    DEVICE_ADD,
+    DEVICE_DEL,
     MAX,
 } mpqemu_cmd_t;
 
+typedef enum {
+    REMOTE_OK = 0,
+    REMOTE_FAIL,
+} mpqemu_reply_t;
+
 /**
  * MPQemuMsg:
  * @cmd: The remote command
-- 
1.8.3.1


