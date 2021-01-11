Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687A72F0C3D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 06:23:12 +0100 (CET)
Received: from localhost ([::1]:46582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kypfb-0003kh-Gv
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 00:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kypRa-0004Sj-72
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:08:42 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:60526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kypRY-0006qS-54
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:08:41 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10B55BqO104655;
 Mon, 11 Jan 2021 05:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding;
 s=corp-2020-01-29; bh=/4RzBkEunVOU7riiNIadRgR/4m5L/z5WZ4sbNvbX4AY=;
 b=DllLnqDcCy5OzaKWQhPyGWkE75b6T8OpYoszJeW6b2ZYy425DnrHsUGxAxf/EZCCN3GD
 QcIrDdJjq8xl2uutE5kTE6D+dc3vPwGzaPHPfpFcxP4kJtjeGgcZ4trZRf+W1ZLeKToo
 dl1c5W0yKYo9tuHfGVU8D/BM72/v/XU1o27iaqHNMYu38quTB0GOkaCdoBrKf6olD6AB
 vFIZS74Vl+AP3jt/W8YsNl43o2wfrzKfHjZMEc6NStAECqCyh814MFakVKp7iO8ZiIRj
 XFVeXM9AEtDVdxYJmAnnUkDpGChdeqXTRuIp1+4NRZW7qtfE2fFnEgyPWlS5l9kmy8UB Yg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35y4ekk5vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Jan 2021 05:08:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10B50gjb139224;
 Mon, 11 Jan 2021 05:06:34 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 35yp2k9cpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 05:06:34 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10B56WRn019257;
 Mon, 11 Jan 2021 05:06:32 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 10 Jan 2021 21:06:31 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 10/20] multi-process: Initialize message handler in remote
 device
Date: Mon, 11 Jan 2021 00:05:55 -0500
Message-Id: <0e5d1b791ed74da96c16af9f328b452bbf2fe096.1610339529.git.jag.raman@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
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

Initializes the message handler function in the remote process. It is
called whenever there's an event pending on QIOChannel that registers
this function.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/machine.h |  9 +++++++
 hw/remote/message.c         | 57 +++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |  1 +
 hw/remote/meson.build       |  1 +
 4 files changed, 68 insertions(+)
 create mode 100644 hw/remote/message.c

diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index bdfbca4..b92b2ce 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -14,6 +14,7 @@
 #include "qom/object.h"
 #include "hw/boards.h"
 #include "hw/pci-host/remote.h"
+#include "io/channel.h"
 
 struct RemoteMachineState {
     MachineState parent_obj;
@@ -21,7 +22,15 @@ struct RemoteMachineState {
     RemotePCIHost *host;
 };
 
+/* Used to pass to co-routine device and ioc. */
+typedef struct RemoteCommDev {
+    PCIDevice *dev;
+    QIOChannel *ioc;
+} RemoteCommDev;
+
 #define TYPE_REMOTE_MACHINE "x-remote-machine"
 OBJECT_DECLARE_SIMPLE_TYPE(RemoteMachineState, REMOTE_MACHINE)
 
+void coroutine_fn mpqemu_remote_msg_loop_co(void *data);
+
 #endif
diff --git a/hw/remote/message.c b/hw/remote/message.c
new file mode 100644
index 0000000..36e2d4f
--- /dev/null
+++ b/hw/remote/message.c
@@ -0,0 +1,57 @@
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
index 3a297b6..14786c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3186,6 +3186,7 @@ F: hw/remote/machine.c
 F: include/hw/remote/machine.h
 F: hw/remote/mpqemu-link.c
 F: include/hw/remote/mpqemu-link.h
+F: hw/remote/message.c
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index a2b2fc0..9f5c57f 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -2,5 +2,6 @@ remote_ss = ss.source_set()
 
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
-- 
1.8.3.1


