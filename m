Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F27D2F6F72
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 01:27:49 +0100 (CET)
Received: from localhost ([::1]:60262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Cxw-0004gL-KY
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 19:27:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1l0Cvr-0003RA-G1
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 19:25:40 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:32814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1l0Cvm-0005N7-9j
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 19:25:38 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10F0E6d1023858;
 Fri, 15 Jan 2021 00:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=JSJLkPe5BFmZjJ32a2oMUPk2QXhUPFvTCwSTbU9rTJA=;
 b=ljwN+Oh0NiqCG7ZInPQUV7X5NT9coRtfW95PPJJWBaDkPVlCvty6+jF/qyT6odkQlpJR
 5PrNszwInn0qXkLKVso6V/xsUEHPLCy54cbkpLmY7Xk/KHTiDtmqIhsIQxYz5/WNqLVb
 Zv0Pe5lClesIUmFWsghF7WiDqI9UHzDYOaJtDuKdmYGvcvVyi9H2TJ+E2gqynYtWfEx1
 R+W2OeRzNJtTM/Kx4yfR6hZ4/7FK1w28emL7ChOrFWeFhQ8B3DSuhYcRb5fl712pw0BT
 e/DroYHu9iD2CaYVspmscSKKMQynDEsjtCIpO7qJ/kFEHFyKUw2cq0hJ1bLMNR521hQ7 OQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 360kd02tvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 00:25:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10F0EeE9083408;
 Fri, 15 Jan 2021 00:25:29 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 360kfa9ddq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 00:25:29 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10F0PS6U009805;
 Fri, 15 Jan 2021 00:25:28 GMT
Received: from localhost.localdomain (/10.211.9.80)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 Jan 2021 16:25:28 -0800
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 1/2] qdev: add debug interface to kick/call eventfd
Date: Thu, 14 Jan 2021 16:27:29 -0800
Message-Id: <20210115002730.1279-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115002730.1279-1-dongli.zhang@oracle.com>
References: <20210115002730.1279-1-dongli.zhang@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150000
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150000
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=dongli.zhang@oracle.com; helo=aserp2120.oracle.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 joe.jin@oracle.com, armbru@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, joao.m.martins@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtio device/driver (e.g., vhost-scsi) may hang due to the lost of IRQ
or the lost of doorbell register kick, e.g.,

https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html

This patch adds a new debug interface 'DeviceEvent' to DeviceClass to help
narrow down if the issue is due to lost of irq/kick. So far the new
interface handles only two events: 'call' and 'kick'. Any device (e.g.,
e1000e or vhost-scsi) may implement (e.g., via eventfd, MSI-X or legacy
IRQ).

The 'call' is to inject irq on purpose by admin for a specific device (e.g.,
vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
on purpose by admin at QEMU/host side for a specific device.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hmp-commands.hx        | 14 ++++++++++++++
 include/hw/qdev-core.h |  6 ++++++
 include/monitor/hmp.h  |  1 +
 qapi/qdev.json         | 30 ++++++++++++++++++++++++++++++
 softmmu/qdev-monitor.c | 41 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 92 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 73e0832ea1..0fbb72568f 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1867,3 +1867,17 @@ ERST
         .flags      = "p",
     },
 
+    {
+        .name       = "x-debug-device-event",
+        .args_type  = "dev:s,event:s,queue:l",
+        .params     = "dev event queue",
+        .help       = "generate device event for a specific device queue",
+        .cmd        = hmp_x_debug_device_event,
+        .flags      = "p",
+    },
+
+SRST
+``x-debug-device-event`` *dev* *event* *queue*
+  Generate device event *event* for specific *queue* of *dev*
+ERST
+
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bafc311bfa..83df3bab89 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -29,9 +29,14 @@ typedef enum DeviceCategory {
     DEVICE_CATEGORY_MAX
 } DeviceCategory;
 
+#define DEVICE_EVENT_CALL 1
+#define DEVICE_EVENT_KICK 2
+
 typedef void (*DeviceRealize)(DeviceState *dev, Error **errp);
 typedef void (*DeviceUnrealize)(DeviceState *dev);
 typedef void (*DeviceReset)(DeviceState *dev);
+typedef void (*DeviceEvent)(DeviceState *dev, int event, int queue,
+                            Error **errp);
 typedef void (*BusRealize)(BusState *bus, Error **errp);
 typedef void (*BusUnrealize)(BusState *bus);
 
@@ -132,6 +137,7 @@ struct DeviceClass {
     DeviceReset reset;
     DeviceRealize realize;
     DeviceUnrealize unrealize;
+    DeviceEvent event;
 
     /* device state */
     const VMStateDescription *vmsd;
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index ed2913fd18..ffb48fce06 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -133,5 +133,6 @@ void hmp_info_replay(Monitor *mon, const QDict *qdict);
 void hmp_replay_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_seek(Monitor *mon, const QDict *qdict);
+void hmp_x_debug_device_event(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/qapi/qdev.json b/qapi/qdev.json
index b83178220b..6fc7a5bfc1 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -124,3 +124,33 @@
 ##
 { 'event': 'DEVICE_DELETED',
   'data': { '*device': 'str', 'path': 'str' } }
+
+##
+# @x-debug-device-event:
+#
+# Generate device event for a specific device queue
+#
+# @dev: device path
+#
+# @event: event (e.g., kick or call) to trigger
+#
+# @queue: queue id
+#
+# Returns: Nothing on success
+#
+# Since: 5.3
+#
+# Notes: This is used to debug VM driver hang issue. The 'kick' event is to
+#        send notification to QEMU/vhost while the 'call' event is to
+#        interrupt VM on purpose.
+#
+# Example:
+#
+# -> { "execute": "x-debug-device_event",
+#      "arguments": { "dev": "/machine/peripheral/vscsi0", "event": "kick",
+#                     "queue": "1" } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'x-debug-device-event',
+  'data': {'dev': 'str', 'event': 'str', 'queue': 'int'} }
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 8dc656becc..63dee5f1a6 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -915,6 +915,47 @@ void hmp_device_del(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
+void qmp_x_debug_device_event(const char *dev, const char *event,
+                              int64_t queue, Error **errp)
+{
+    DeviceState *device = find_device_state(dev, NULL);
+    DeviceClass *dc;
+    int evt;
+
+    if (!device) {
+        error_setg(errp, "Device %s not found", dev);
+        return;
+    }
+
+    dc = DEVICE_GET_CLASS(device);
+    if (!dc->event) {
+        error_setg(errp, "device_event is not supported");
+        return;
+    }
+
+    if (!strcmp(event, "kick"))
+        evt = DEVICE_EVENT_KICK;
+    else if (!strcmp(event, "call"))
+        evt = DEVICE_EVENT_CALL;
+    else {
+        error_setg(errp, "Unsupported event %s", event);
+        return;
+    }
+
+    dc->event(device, evt, queue, errp);
+}
+
+void hmp_x_debug_device_event(Monitor *mon, const QDict *qdict)
+{
+    const char *dev = qdict_get_str(qdict, "dev");
+    const char *event = qdict_get_str(qdict, "event");
+    int queue = qdict_get_try_int(qdict, "queue", -1);
+    Error *err = NULL;
+
+    qmp_x_debug_device_event(dev, event, queue, &err);
+    hmp_handle_error(mon, err);
+}
+
 BlockBackend *blk_by_qdev_id(const char *id, Error **errp)
 {
     DeviceState *dev;
-- 
2.17.1


