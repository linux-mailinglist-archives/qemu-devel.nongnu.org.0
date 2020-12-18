Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB692DDE3A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 06:54:24 +0100 (CET)
Received: from localhost ([::1]:51672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8id-0004xs-Kc
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 00:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8W4-0000N7-K9
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:41:25 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:46534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8W2-0003vf-Lc
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:41:24 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5Yrj8161840;
 Fri, 18 Dec 2020 05:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=p/aLhwyifEC/n4Df9MoDaoH0VV/IMbS4Z8NhLUBPiHk=;
 b=G0fH4NtgE+8tpogCl02+Qf9XwaSeHQpyo5MjFXS1MwZ6WJI9ZI6dJIcfT3LL/5IzoW/P
 bggS3dwg33TpZymCQivHbpSV6JcJGvZaxFQyACe1QyDwuKiAGZTSMp168l7tpcmKtGAa
 U4Y7e5xZxHDHVFyECNwrnvc+V/H/8vdlzW5gyNkw2twjSPovrq4J/jBLEJgLTMi5E5PW
 E57kv56b5KQUCCJaXEkEKizBUxhkPpkXfmyU03T1dtZZXQ5F2ytsUzOk806Sl3hypbK2
 SqU0iZC1vwPZPTRr8TjEFedBZFM31UbMDg6dcy+zrUBMJMLj/WDEXWx9sk1AfmFwn3c+ aQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 35cn9rrqpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 05:41:14 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5ZJmS043270;
 Fri, 18 Dec 2020 05:41:13 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 35e6eu9vwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 05:41:13 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BI5fBpr009932;
 Fri, 18 Dec 2020 05:41:11 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 21:41:10 -0800
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH v14 RESEND 11/21] multi-process: Initialize message handler in
 remote device
Date: Thu, 17 Dec 2020 21:40:41 -0800
Message-Id: <119c445d82cad624ecd5c8fe7a52ae6b7b17178e.1608263018.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1608263017.git.elena.ufimtseva@oracle.com>
References: <cover.1608263017.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180040
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=elena.ufimtseva@oracle.com; helo=userp2130.oracle.com
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

From: Jagannathan Raman <jag.raman@oracle.com>

Initializes the message handler function in the remote process. It is
called whenever there's an event pending on QIOChannel that registers
this function.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/machine.h |  9 ++++++
 hw/remote/message.c         | 57 +++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |  1 +
 hw/remote/meson.build       |  1 +
 4 files changed, 68 insertions(+)
 create mode 100644 hw/remote/message.c

diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index d312972e85..3073db6341 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -14,6 +14,7 @@
 #include "qom/object.h"
 #include "hw/boards.h"
 #include "hw/pci-host/remote.h"
+#include "io/channel.h"
 
 typedef struct RemoteMachineState {
     MachineState parent_obj;
@@ -21,8 +22,16 @@ typedef struct RemoteMachineState {
     RemotePCIHost *host;
 } RemoteMachineState;
 
+/* Used to pass to co-routine device and ioc. */
+typedef struct RemoteCommDev {
+    PCIDevice *dev;
+    QIOChannel *ioc;
+} RemoteCommDev;
+
 #define TYPE_REMOTE_MACHINE "x-remote-machine"
 #define REMOTE_MACHINE(obj) \
     OBJECT_CHECK(RemoteMachineState, (obj), TYPE_REMOTE_MACHINE)
 
+void coroutine_fn mpqemu_remote_msg_loop_co(void *data);
+
 #endif
diff --git a/hw/remote/message.c b/hw/remote/message.c
new file mode 100644
index 0000000000..72ad6cd7fd
--- /dev/null
+++ b/hw/remote/message.c
@@ -0,0 +1,57 @@
+/*
+ * Copyright © 2020 Oracle and/or its affiliates.
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
+#include "hw/remote/machine.h"
+#include "io/channel.h"
+#include "hw/remote/mpqemu-link.h"
+#include "qapi/error.h"
+#include "sysemu/runstate.h"
+
+void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
+{
+    g_autofree RemoteCommDev *com = (RemoteCommDev *)data;
+    PCIDevice *pci_dev = NULL;
+    Error *local_err = NULL;
+
+    assert(com->ioc);
+
+    pci_dev = com->dev;
+    for (; !local_err;) {
+        MPQemuMsg msg = {0};
+
+        if (!mpqemu_msg_recv(&msg, com->ioc, &local_err)) {
+            break;
+        }
+
+        if (!mpqemu_msg_valid(&msg)) {
+            error_setg(&local_err, "Received invalid message from proxy"
+                                   "in remote process pid="FMT_pid"",
+                                   getpid());
+            break;
+        }
+
+        switch (msg.cmd) {
+        default:
+            error_setg(&local_err,
+                       "Unknown command (%d) received for device %s"
+                       " (pid="FMT_pid")",
+                       msg.cmd, DEVICE(pci_dev)->id, getpid());
+        }
+    }
+
+    if (local_err) {
+        error_report_err(local_err);
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);
+    } else {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 1305eb0829..1830b03439 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3175,6 +3175,7 @@ F: hw/remote/machine.c
 F: include/hw/remote/machine.h
 F: hw/remote/mpqemu-link.c
 F: include/hw/remote/mpqemu-link.h
+F: hw/remote/message.c
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index a2b2fc0e59..9f5c57f35a 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -2,5 +2,6 @@ remote_ss = ss.source_set()
 
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
-- 
2.25.GIT


