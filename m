Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F13DE2D71
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 11:34:57 +0200 (CEST)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNZWB-0006jk-M2
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 05:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jag.raman@oracle.com>) id 1iNZ9p-0000RD-Fo
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:11:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jag.raman@oracle.com>) id 1iNZ9n-0004uO-Aw
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:11:49 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:46382)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jag.raman@oracle.com>)
 id 1iNZ9l-0004rT-By
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:11:47 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9O94N2A116351;
 Thu, 24 Oct 2019 09:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2019-08-05;
 bh=/ad2stwObBARiiY2DPYHk5A75OfLrnaBriLueQ+wnxU=;
 b=nH7SC+q6Ewvqmki0bQv6kuq40smmkhapJmTVfSKaY8YBZAr9yJs6vHq0+QUv1U7BjiEW
 yBJKxc16HgM3XmXTI4qDu4nUGaOxtUpQOyHG+KxRypbPlkdznZuqO9/MwjU3p63iY89z
 e7ZiBfnDKuPNl7COGHJZsyQ1oWGj/KGrdEWmkbODyVwH+GDXSIBtsqiXqKiHFdEA9jos
 Zo74IZCMwGAEB3wQJPT2vpSMRHTfNIeTJlXpcU78INONluzCDtTnMobtr18m8K99YD4w
 Tr5lmXwfwcfJth51djVSFECU0PmAXF7kctUHVnEggds1IjmmLgtMcYK/cLQpgG5xb70t fg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2vqswtte3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 09:11:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9O97jj3170600;
 Thu, 24 Oct 2019 09:11:36 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2vtsk488t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 09:11:36 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9O9BYu2002648;
 Thu, 24 Oct 2019 09:11:34 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Oct 2019 02:11:34 -0700
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 PATCH 39/49] multi-process: prevent duplicate memory
 initialization in remote
Date: Thu, 24 Oct 2019 05:09:20 -0400
Message-Id: <a3d90ced8e9646b073a18731f10f2d3bf1356efb.1571905346.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1571905346.git.jag.raman@oracle.com>
References: <cover.1571905346.git.jag.raman@oracle.com>
In-Reply-To: <cover.1571905346.git.jag.raman@oracle.com>
References: <cover.1571905346.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9419
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910240089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9419
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910240089
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.86
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, john.g.johnson@oracle.com,
 kraxel@redhat.com, jag.raman@oracle.com, quintela@redhat.com, mst@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 liran.alon@oracle.com, stefanha@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When multiple controllers are configured in a remote process,
it's better for the memory to be managed by only one of the proxy
objects for that process, in order to conserve file descriptors. Added
"mem_int" flag for this purpose.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 New patch in v3

 hw/proxy/qemu-proxy.c         | 13 ++++++++++++-
 include/hw/proxy/qemu-proxy.h |  1 +
 qdev-monitor.c                |  2 +-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/proxy/qemu-proxy.c b/hw/proxy/qemu-proxy.c
index 5aada67..623a6c5 100644
--- a/hw/proxy/qemu-proxy.c
+++ b/hw/proxy/qemu-proxy.c
@@ -350,6 +350,13 @@ static void pci_proxy_write_config(PCIDevice *d, uint32_t addr, uint32_t val,
     config_op_send(PCI_PROXY_DEV(d), addr, &val, l, CONF_WRITE);
 }
 
+static void pci_proxy_dev_inst_init(Object *obj)
+{
+    PCIProxyDev *dev = PCI_PROXY_DEV(obj);
+
+    dev->mem_init = false;
+}
+
 static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
@@ -364,6 +371,7 @@ static const TypeInfo pci_proxy_dev_type_info = {
     .name          = TYPE_PCI_PROXY_DEV,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCIProxyDev),
+    .instance_init = pci_proxy_dev_inst_init,
     .abstract      = true,
     .class_size    = sizeof(PCIProxyDevClass),
     .class_init    = pci_proxy_dev_class_init,
@@ -460,7 +468,10 @@ static void init_proxy(PCIDevice *dev, char *command, bool need_spawn, Error **e
     mpqemu_init_channel(pdev->mpqemu_link, &pdev->mpqemu_link->mmio,
                         pdev->mmio_sock);
 
-    configure_memory_sync(pdev->sync, pdev->mpqemu_link);
+    if (!pdev->mem_init) {
+        pdev->mem_init = true;
+        configure_memory_sync(pdev->sync, pdev->mpqemu_link);
+    }
 }
 
 static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
diff --git a/include/hw/proxy/qemu-proxy.h b/include/hw/proxy/qemu-proxy.h
index 672303c..17e07ac 100644
--- a/include/hw/proxy/qemu-proxy.h
+++ b/include/hw/proxy/qemu-proxy.h
@@ -63,6 +63,7 @@ struct PCIProxyDev {
     MPQemuLinkState *mpqemu_link;
 
     RemoteMemSync *sync;
+    bool mem_init;
     struct kvm_irqfd irqfd;
 
     EventNotifier intr;
diff --git a/qdev-monitor.c b/qdev-monitor.c
index f38849e..2a2c10b 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -713,10 +713,10 @@ DeviceState *qdev_proxy_add(const char *rid, const char *id, char *bus,
         pdev->socket = old_pdev->socket;
         pdev->mmio_sock = old_pdev->mmio_sock;
         pdev->remote_pid = old_pdev->remote_pid;
+        pdev->mem_init = true;
     } else {
         pdev->rsocket = managed ? rsocket : -1;
         pdev->socket = managed ? rsocket : -1;
-
     }
     pdev->managed = managed;
 
-- 
1.8.3.1


