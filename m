Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BB42DDE48
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:00:33 +0100 (CET)
Received: from localhost ([::1]:39618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8oa-0003DT-NM
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8W9-0000PE-OC
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:41:31 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:46610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8W7-0003xp-6w
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:41:29 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5YQX6161730;
 Fri, 18 Dec 2020 05:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=EAlltYc1pPow6ncR3PCpYE61QpN625mVISZ2jJqxoJs=;
 b=Nw3LBq+TatvhuM5CvX33ZVWLacw1o28b6DUiyJgZURD9Gs8Ub5mS3H03tzNtv+ExFTi7
 AT6U7PmQdGQZFpLKaAkiJ1/moK0zIMn23zE3UW0KsaZDl7VP74y28iXRff+49LoYKDHe
 pEQ5hs2LWJp7hifJSPHqMqO0Jta9aReFb7MDikA1g96CUG5Ect8L3b6G8cv1o0coFfsZ
 JVfFevLvTGG42QQCjkDj8+iUMfPJ/HsAl7y56bf7KLbBHvnShq2Y9JExcC3knAFrV0WR
 uNp93ksdttGSa0a0ICM8bsEI/xvpHSGyWvYjP6SHW//f0lRLgjgLRzFqDiBCZrxaep0D aQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 35cn9rrqpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 05:41:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5ZKgU042381;
 Fri, 18 Dec 2020 05:41:16 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 35g3rfptm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 05:41:16 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BI5fEfj009938;
 Fri, 18 Dec 2020 05:41:14 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 21:41:14 -0800
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH v14 RESEND 13/21] multi-process: setup memory manager for
 remote device
Date: Thu, 17 Dec 2020 21:40:43 -0800
Message-Id: <d5b9e232a67f180246e084aec598a9002a0d745c.1608263018.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1608263017.git.elena.ufimtseva@oracle.com>
References: <cover.1608263017.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
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

SyncSysMemMsg message format is defined. It is used to send
file descriptors of the RAM regions to remote device.
RAM on the remote device is configured with a set of file descriptors.
Old RAM regions are deleted and new regions, each with an fd, is
added to the RAM.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/memory.h      | 19 ++++++++++
 include/hw/remote/mpqemu-link.h | 10 +++++
 hw/remote/memory.c              | 65 +++++++++++++++++++++++++++++++++
 hw/remote/mpqemu-link.c         | 11 ++++++
 MAINTAINERS                     |  2 +
 hw/remote/meson.build           |  2 +
 6 files changed, 109 insertions(+)
 create mode 100644 include/hw/remote/memory.h
 create mode 100644 hw/remote/memory.c

diff --git a/include/hw/remote/memory.h b/include/hw/remote/memory.h
new file mode 100644
index 0000000000..4fd548eccb
--- /dev/null
+++ b/include/hw/remote/memory.h
@@ -0,0 +1,19 @@
+/*
+ * Memory manager for remote device
+ *
+ * Copyright © 2018, 2020 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_MEMORY_H
+#define REMOTE_MEMORY_H
+
+#include "exec/hwaddr.h"
+#include "hw/remote/mpqemu-link.h"
+
+void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp);
+
+#endif
diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index b763bdab74..48c617ebad 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -14,6 +14,7 @@
 #include "qom/object.h"
 #include "qemu/thread.h"
 #include "io/channel.h"
+#include "exec/hwaddr.h"
 
 #define REMOTE_MAX_FDS 8
 
@@ -30,9 +31,16 @@
  *
  */
 typedef enum {
+    MPQEMU_CMD_SYNC_SYSMEM,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
+typedef struct {
+    hwaddr gpas[REMOTE_MAX_FDS];
+    uint64_t sizes[REMOTE_MAX_FDS];
+    off_t offsets[REMOTE_MAX_FDS];
+} SyncSysmemMsg;
+
 /**
  * MPQemuMsg:
  * @cmd: The remote command
@@ -43,12 +51,14 @@ typedef enum {
  * MPQemuMsg Format of the message sent to the remote device from QEMU.
  *
  */
+
 typedef struct {
     int cmd;
     size_t size;
 
     union {
         uint64_t u64;
+        SyncSysmemMsg sync_sysmem;
     } data;
 
     int fds[REMOTE_MAX_FDS];
diff --git a/hw/remote/memory.c b/hw/remote/memory.c
new file mode 100644
index 0000000000..cb5fa5d41c
--- /dev/null
+++ b/hw/remote/memory.c
@@ -0,0 +1,65 @@
+/*
+ * Memory manager for remote device
+ *
+ * Copyright © 2018, 2020 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "hw/remote/memory.h"
+#include "exec/address-spaces.h"
+#include "exec/ram_addr.h"
+#include "qapi/error.h"
+
+static void remote_sysmem_reset(void)
+{
+    MemoryRegion *sysmem, *subregion, *next;
+
+    sysmem = get_system_memory();
+
+    QTAILQ_FOREACH_SAFE(subregion, &sysmem->subregions, subregions_link, next) {
+        if (subregion->ram) {
+            memory_region_del_subregion(sysmem, subregion);
+            object_unparent(OBJECT(subregion));
+        }
+    }
+}
+
+void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
+{
+    ERRP_GUARD();
+    SyncSysmemMsg *sysmem_info = &msg->data.sync_sysmem;
+    MemoryRegion *sysmem, *subregion;
+    static unsigned int suffix;
+    int region;
+
+    sysmem = get_system_memory();
+
+    remote_sysmem_reset();
+
+    for (region = 0; region < msg->num_fds; region++) {
+        g_autofree char *name;
+        subregion = g_new(MemoryRegion, 1);
+        name = g_strdup_printf("remote-mem-%u", suffix++);
+        memory_region_init_ram_from_fd(subregion, NULL,
+                                       name, sysmem_info->sizes[region],
+                                       true, msg->fds[region],
+                                       sysmem_info->offsets[region],
+                                       errp);
+
+        if (*errp) {
+            g_free(subregion);
+            remote_sysmem_reset();
+            return;
+        }
+
+        memory_region_add_subregion(sysmem, sysmem_info->gpas[region],
+                                    subregion);
+
+    }
+}
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index b50e9a0cfe..5c9af1de71 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -201,5 +201,16 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
         }
     }
 
+     /* Verify message specific fields. */
+    switch (msg->cmd) {
+    case MPQEMU_CMD_SYNC_SYSMEM:
+        if (msg->num_fds == 0 || msg->size != sizeof(SyncSysmemMsg)) {
+            return false;
+        }
+        break;
+    default:
+        break;
+    }
+
     return true;
 }
diff --git a/MAINTAINERS b/MAINTAINERS
index b4d3787826..4e3a3dba48 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3177,6 +3177,8 @@ F: hw/remote/mpqemu-link.c
 F: include/hw/remote/mpqemu-link.h
 F: hw/remote/message.c
 F: hw/remote/remote-obj.c
+F: include/hw/remote/memory.h
+F: hw/remote/memory.c
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 71d0a5689e..64da16c1de 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -5,4 +5,6 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 
+specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
+
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
-- 
2.25.GIT


