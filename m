Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7272F5061
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 17:50:56 +0100 (CET)
Received: from localhost ([::1]:38352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzjMF-0003l7-4A
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 11:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kzjEu-0006Z6-Aa
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:43:21 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kzjEo-0007zV-JS
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:43:20 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DGfQqH138201;
 Wed, 13 Jan 2021 16:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding;
 s=corp-2020-01-29; bh=MU1AmTc1gX2/skmnie+Io5griCZAf5Q6DRLe2e/O5/k=;
 b=ASI8CyMhsqT3ch+0+HHx4TVmY+l9pTeNy0JWDjMDSsk7jOqO8NG4OzsUmWunp8hJ5gH2
 q6YNkNXoC6arRhogDNSJTFIEvu4v5j3cYgFJUDxAyV7gp+4xUhsm9lZxM/85TrU/Y2nM
 OGcq50E4GS1Ay5sb8L3VvffDf9KgCsiB+H3CQ49bzF0OBB7y19Tfq9Na590iCU7Rn2AS
 2aO39dsD/DSioLeKH47IYAHx1wunfbybs7XDr+XfjeIWnw24qy59/GgC2eGAeuUP03cx
 qVH+PHq98NBBuxdEYEr54iNzgOAH4Rl17qNeksdWdVZNARFHbzehMt0aD7D2QKrtyCr3 mA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 360kcyvdsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 16:43:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DGe9Kq190590;
 Wed, 13 Jan 2021 16:43:04 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 360kf0vr42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 16:43:04 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10DGh3GC028545;
 Wed, 13 Jan 2021 16:43:03 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Jan 2021 08:43:03 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v17 13/20] multi-process: introduce proxy object
Date: Wed, 13 Jan 2021 11:42:25 -0500
Message-Id: <5f2b66d94bd1ff76f77acd3e5188b9194ff7390d.1610556046.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610556046.git.jag.raman@oracle.com>
References: <cover.1610556046.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610556046.git.jag.raman@oracle.com>
References: <cover.1610556046.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Defines a PCI Device proxy object as a child of TYPE_PCI_DEVICE.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/proxy.h | 33 ++++++++++++++++
 hw/remote/proxy.c         | 99 +++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS               |  2 +
 hw/remote/meson.build     |  1 +
 4 files changed, 135 insertions(+)
 create mode 100644 include/hw/remote/proxy.h
 create mode 100644 hw/remote/proxy.c

diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
new file mode 100644
index 0000000..faa9c4d
--- /dev/null
+++ b/include/hw/remote/proxy.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef PROXY_H
+#define PROXY_H
+
+#include "hw/pci/pci.h"
+#include "io/channel.h"
+
+#define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
+OBJECT_DECLARE_SIMPLE_TYPE(PCIProxyDev, PCI_PROXY_DEV)
+
+struct PCIProxyDev {
+    PCIDevice parent_dev;
+    char *fd;
+
+    /*
+     * Mutex used to protect the QIOChannel fd from
+     * the concurrent access by the VCPUs since proxy
+     * blocks while awaiting for the replies from the
+     * process remote.
+     */
+    QemuMutex io_mutex;
+    QIOChannel *ioc;
+    Error *migration_blocker;
+};
+
+#endif /* PROXY_H */
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
new file mode 100644
index 0000000..cd5b071
--- /dev/null
+++ b/hw/remote/proxy.c
@@ -0,0 +1,99 @@
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
+#include "hw/remote/proxy.h"
+#include "hw/pci/pci.h"
+#include "qapi/error.h"
+#include "io/channel-util.h"
+#include "hw/qdev-properties.h"
+#include "monitor/monitor.h"
+#include "migration/blocker.h"
+#include "qemu/sockets.h"
+
+static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
+{
+    ERRP_GUARD();
+    PCIProxyDev *dev = PCI_PROXY_DEV(device);
+    int fd;
+
+    if (!dev->fd) {
+        error_setg(errp, "fd parameter not specified for %s",
+                   DEVICE(device)->id);
+        return;
+    }
+
+    fd = monitor_fd_param(monitor_cur(), dev->fd, errp);
+    if (fd == -1) {
+        error_prepend(errp, "proxy: unable to parse fd %s: ", dev->fd);
+        return;
+    }
+
+    if (!fd_is_socket(fd)) {
+        error_setg(errp, "proxy: fd %d is not a socket", fd);
+        close(fd);
+        return;
+    }
+
+    dev->ioc = qio_channel_new_fd(fd, errp);
+
+    error_setg(&dev->migration_blocker, "%s does not support migration",
+               TYPE_PCI_PROXY_DEV);
+    migrate_add_blocker(dev->migration_blocker, errp);
+
+    qemu_mutex_init(&dev->io_mutex);
+    qio_channel_set_blocking(dev->ioc, true, NULL);
+}
+
+static void pci_proxy_dev_exit(PCIDevice *pdev)
+{
+    PCIProxyDev *dev = PCI_PROXY_DEV(pdev);
+
+    if (dev->ioc) {
+        qio_channel_close(dev->ioc, NULL);
+    }
+
+    migrate_del_blocker(dev->migration_blocker);
+
+    error_free(dev->migration_blocker);
+}
+
+static Property proxy_properties[] = {
+    DEFINE_PROP_STRING("fd", PCIProxyDev, fd),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = pci_proxy_dev_realize;
+    k->exit = pci_proxy_dev_exit;
+    device_class_set_props(dc, proxy_properties);
+}
+
+static const TypeInfo pci_proxy_dev_type_info = {
+    .name          = TYPE_PCI_PROXY_DEV,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(PCIProxyDev),
+    .class_init    = pci_proxy_dev_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
+static void pci_proxy_dev_register_types(void)
+{
+    type_register_static(&pci_proxy_dev_type_info);
+}
+
+type_init(pci_proxy_dev_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index d6903e7..03d2f9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3190,6 +3190,8 @@ F: hw/remote/message.c
 F: hw/remote/remote-obj.c
 F: include/hw/remote/memory.h
 F: hw/remote/memory.c
+F: hw/remote/proxy.c
+F: include/hw/remote/proxy.h
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 64da16c..569cd20 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -4,6 +4,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 
-- 
1.8.3.1


