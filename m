Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 265102F0C1A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 06:12:27 +0100 (CET)
Received: from localhost ([::1]:49166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kypVC-00016e-5F
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 00:12:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kypPg-0001Jo-EF
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:06:44 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:59512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kypPe-0005vC-B7
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:06:44 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10B55blP104744;
 Mon, 11 Jan 2021 05:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding;
 s=corp-2020-01-29; bh=0Avbue15Atcf5KQqf2U1Z15S5sZbTf3MutDuPrzrfis=;
 b=amo7R7E1PfMC8rGlkE60fLZwIYGPUz+mENDbMqbYZW6rFOL1mQUxseDntOu9Mz+tytlK
 Ag+6EnM/wg7h/kN4q4xzB9R0qC/TkBoi1OIKgLdCO1B5lc6VHpFwDfmQvyUMhMn9QV2h
 IraQblsyCSBe3RRyxeboipK9C9/WUox6b9PeD6Ac60cWI5wxPJ5Eu80KJKbsa+/JtIVJ
 BTUwjM2MGIMkpY0CMQBevgsr+eclZOV+x56YU6/BooqztJUl/wX+L411ZyTlJ4PfH1L2
 e4O4CLRclasCqM7QMaVzoLMjHBbk+pcKEp0DTJjkpbjOhTyfIr+5vf46uhqxVjkdvOsW 3g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35y4ekk5s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Jan 2021 05:06:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10B50e7G089905;
 Mon, 11 Jan 2021 05:06:35 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 35yp8pp761-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 05:06:34 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10B56Xn3021006;
 Mon, 11 Jan 2021 05:06:33 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 10 Jan 2021 21:06:33 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 11/20] multi-process: Associate fd of a PCIDevice with its
 object
Date: Mon, 11 Jan 2021 00:05:56 -0500
Message-Id: <33b82daeafef19654fe6c0c3235fc727ff9b6f93.1610339529.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610339529.git.jag.raman@oracle.com>
References: <cover.1610339529.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610339529.git.jag.raman@oracle.com>
References: <cover.1610339529.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9860
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110030
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9860
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101110030
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
index 14786c6..6ee7a8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3187,6 +3187,7 @@ F: include/hw/remote/machine.h
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


