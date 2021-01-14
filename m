Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848322F655F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:03:30 +0100 (CET)
Received: from localhost ([::1]:36588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l055t-0002Q5-G2
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l04m1-00039I-Cq
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:42:57 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:49632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l04lu-000277-WC
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:42:57 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EFZTiD024819;
 Thu, 14 Jan 2021 15:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding;
 s=corp-2020-01-29; bh=GIJL38OQNodfipnZtpBW3YnBapGkAANLyFyGyICSLjM=;
 b=YrDQQRvHb07UuglKX+Wovxe/HtJFfVBR25ryzkg9a+RxNVhoYcQ1h0ZLuABP2xiOch4w
 wQX2g/LV+psu/7X4AhUkIMBjlm+t2srRxSkX9wXeaMelLFiISR3idW/hac0oJCo4lp84
 icOuG0CjScnd4Zcvm94cBE9mEu29BDnJaYxo945PgU5PCQkcT2dBpUTj/3//B97G5rwK
 nlRTppJ1bU29c8z4AQqQLlZQ22956E3uesfB03ITwIJu7FTvGUlOWB51hrVF8cMF1pS8
 845Sa5EczvAydOmqzc6799GN/6VpOde8pMlg1P1T8KEVObDid2zMD9uk7s/V3NR/x9Pf 4Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 360kvk8rkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 15:42:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EFYsSv093482;
 Thu, 14 Jan 2021 15:40:41 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 360kf9nyj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 15:40:41 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10EFedHv010328;
 Thu, 14 Jan 2021 15:40:39 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 Jan 2021 07:40:39 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v19 11/20] multi-process: Associate fd of a PCIDevice with its
 object
Date: Thu, 14 Jan 2021 10:40:06 -0500
Message-Id: <b0c81bf9f111f55dd5a88741db118f7d078a1f84.1610638428.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610638428.git.jag.raman@oracle.com>
References: <cover.1610638428.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610638428.git.jag.raman@oracle.com>
References: <cover.1610638428.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140090
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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

Associate the file descriptor for a PCIDevice in remote process with
DeviceState object.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/remote-obj.c | 203 +++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS            |   1 +
 hw/remote/meson.build  |   1 +
 3 files changed, 205 insertions(+)
 create mode 100644 hw/remote/remote-obj.c

diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
new file mode 100644
index 0000000..4f21254
--- /dev/null
+++ b/hw/remote/remote-obj.c
@@ -0,0 +1,203 @@
+/*
+ * Copyright © 2020, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL-v2, version 2 or later.
+ *
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "qemu/error-report.h"
+#include "qemu/notify.h"
+#include "qom/object_interfaces.h"
+#include "hw/qdev-core.h"
+#include "io/channel.h"
+#include "hw/qdev-core.h"
+#include "hw/remote/machine.h"
+#include "io/channel-util.h"
+#include "qapi/error.h"
+#include "sysemu/sysemu.h"
+#include "hw/pci/pci.h"
+#include "qemu/sockets.h"
+#include "monitor/monitor.h"
+
+#define TYPE_REMOTE_OBJECT "x-remote-object"
+OBJECT_DECLARE_TYPE(RemoteObject, RemoteObjectClass, REMOTE_OBJECT)
+
+struct RemoteObjectClass {
+    ObjectClass parent_class;
+
+    unsigned int nr_devs;
+    unsigned int max_devs;
+};
+
+struct RemoteObject {
+    /* private */
+    Object parent;
+
+    Notifier machine_done;
+
+    int32_t fd;
+    char *devid;
+
+    QIOChannel *ioc;
+
+    DeviceState *dev;
+    DeviceListener listener;
+};
+
+static void remote_object_set_fd(Object *obj, const char *str, Error **errp)
+{
+    RemoteObject *o = REMOTE_OBJECT(obj);
+    int fd = -1;
+
+    fd = monitor_fd_param(monitor_cur(), str, errp);
+    if (fd == -1) {
+        error_prepend(errp, "Could not parse remote object fd %s:", str);
+        return;
+    }
+
+    if (!fd_is_socket(fd)) {
+        error_setg(errp, "File descriptor '%s' is not a socket", str);
+        close(fd);
+        return;
+    }
+
+    o->fd = fd;
+}
+
+static void remote_object_set_devid(Object *obj, const char *str, Error **errp)
+{
+    RemoteObject *o = REMOTE_OBJECT(obj);
+
+    g_free(o->devid);
+
+    o->devid = g_strdup(str);
+}
+
+static void remote_object_unrealize_listener(DeviceListener *listener,
+                                             DeviceState *dev)
+{
+    RemoteObject *o = container_of(listener, RemoteObject, listener);
+
+    if (o->dev == dev) {
+        object_unref(OBJECT(o));
+    }
+}
+
+static void remote_object_machine_done(Notifier *notifier, void *data)
+{
+    RemoteObject *o = container_of(notifier, RemoteObject, machine_done);
+    DeviceState *dev = NULL;
+    QIOChannel *ioc = NULL;
+    Coroutine *co = NULL;
+    RemoteCommDev *comdev = NULL;
+    Error *err = NULL;
+
+    dev = qdev_find_recursive(sysbus_get_default(), o->devid);
+    if (!dev || !object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_report("%s is not a PCI device", o->devid);
+        return;
+    }
+
+    ioc = qio_channel_new_fd(o->fd, &err);
+    if (!ioc) {
+        error_report_err(err);
+        return;
+    }
+    qio_channel_set_blocking(ioc, false, NULL);
+
+    o->dev = dev;
+
+    o->listener.unrealize = remote_object_unrealize_listener;
+    device_listener_register(&o->listener);
+
+    /* co-routine should free this. */
+    comdev = g_new0(RemoteCommDev, 1);
+    *comdev = (RemoteCommDev) {
+        .ioc = ioc,
+        .dev = PCI_DEVICE(dev),
+    };
+
+    co = qemu_coroutine_create(mpqemu_remote_msg_loop_co, comdev);
+    qemu_coroutine_enter(co);
+}
+
+static void remote_object_init(Object *obj)
+{
+    RemoteObjectClass *k = REMOTE_OBJECT_GET_CLASS(obj);
+    RemoteObject *o = REMOTE_OBJECT(obj);
+
+    if (k->nr_devs >= k->max_devs) {
+        error_report("Reached maximum number of devices: %u", k->max_devs);
+        return;
+    }
+
+    o->ioc = NULL;
+    o->fd = -1;
+    o->devid = NULL;
+
+    k->nr_devs++;
+
+    o->machine_done.notify = remote_object_machine_done;
+    qemu_add_machine_init_done_notifier(&o->machine_done);
+}
+
+static void remote_object_finalize(Object *obj)
+{
+    RemoteObjectClass *k = REMOTE_OBJECT_GET_CLASS(obj);
+    RemoteObject *o = REMOTE_OBJECT(obj);
+
+    device_listener_unregister(&o->listener);
+
+    if (o->ioc) {
+        qio_channel_shutdown(o->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+        qio_channel_close(o->ioc, NULL);
+    }
+
+    object_unref(OBJECT(o->ioc));
+
+    k->nr_devs--;
+    g_free(o->devid);
+}
+
+static void remote_object_class_init(ObjectClass *klass, void *data)
+{
+    RemoteObjectClass *k = REMOTE_OBJECT_CLASS(klass);
+
+    /*
+     * Limit number of supported devices to 1. This is done to avoid devices
+     * from one VM accessing the RAM of another VM. This is done until we
+     * start using separate address spaces for individual devices.
+     */
+    k->max_devs = 1;
+    k->nr_devs = 0;
+
+    object_class_property_add_str(klass, "fd", NULL, remote_object_set_fd);
+    object_class_property_add_str(klass, "devid", NULL,
+                                  remote_object_set_devid);
+}
+
+static const TypeInfo remote_object_info = {
+    .name = TYPE_REMOTE_OBJECT,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(RemoteObject),
+    .instance_init = remote_object_init,
+    .instance_finalize = remote_object_finalize,
+    .class_size = sizeof(RemoteObjectClass),
+    .class_init = remote_object_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void register_types(void)
+{
+    type_register_static(&remote_object_info);
+}
+
+type_init(register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 3c4800d..56eafe3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3194,6 +3194,7 @@ F: include/hw/remote/machine.h
 F: hw/remote/mpqemu-link.c
 F: include/hw/remote/mpqemu-link.h
 F: hw/remote/message.c
+F: hw/remote/remote-obj.c
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 9f5c57f..71d0a56 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -3,5 +3,6 @@ remote_ss = ss.source_set()
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
-- 
1.8.3.1


