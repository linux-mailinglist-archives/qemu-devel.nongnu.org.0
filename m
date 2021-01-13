Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868412F5088
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 18:02:36 +0100 (CET)
Received: from localhost ([::1]:36140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzjXX-0006xi-GM
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 12:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kzjEo-0006WJ-25
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:43:15 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kzjEl-0007xw-Th
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:43:13 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DGfPoj138188;
 Wed, 13 Jan 2021 16:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding;
 s=corp-2020-01-29; bh=un37RV4qA2CTGTfALzqQ3OpoGjqPaC++XgV79ufbak0=;
 b=ms1pUS713OxGwx0vkEeK2/kibGhdZ1bXTec1LPJBfg9AwDoOsGu6U4dGFt6wP5fNHCJM
 kklMhw1u0fGlADLwjogbVs/A+NaZuuku1cr9aqn46ITugZnhsnQEJSu+AdRmSSOriwRq
 WDNExsXx9hYS+e4eWvgAF1/N3DLggpBOe7pYfNl3uPozZ74JeHtQq0fdWlPB2F8Wwrnl
 P3/PwbQbV5WjzTLu17Sd3/4PdUsYd1OTxdZHXbmq83ixRFviGV5tzDPNIvBFyIpPjP39
 GYKlcIAAO75QKN7wCDf1KZr1KKyWcgCRHT8TbykScFTz1ODVUr9Pm5SQiXzNnT0n9Xdy SA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 360kcyvdsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 16:43:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DGeZC8150744;
 Wed, 13 Jan 2021 16:43:03 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 360kf7wjcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 16:43:03 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10DGh2PP008429;
 Wed, 13 Jan 2021 16:43:02 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Jan 2021 08:43:01 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v17 12/20] multi-process: setup memory manager for remote
 device
Date: Wed, 13 Jan 2021 11:42:24 -0500
Message-Id: <b7fab7111cffb4e8dd83ac97d0b95a61df3902f0.1610556046.git.jag.raman@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130101
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
 include/hw/remote/memory.h      | 19 ++++++++++++
 include/hw/remote/mpqemu-link.h | 10 +++++++
 hw/remote/memory.c              | 65 +++++++++++++++++++++++++++++++++++++++++
 hw/remote/mpqemu-link.c         | 11 +++++++
 MAINTAINERS                     |  2 ++
 hw/remote/meson.build           |  2 ++
 6 files changed, 109 insertions(+)
 create mode 100644 include/hw/remote/memory.h
 create mode 100644 hw/remote/memory.c

diff --git a/include/hw/remote/memory.h b/include/hw/remote/memory.h
new file mode 100644
index 0000000..bc2e309
--- /dev/null
+++ b/include/hw/remote/memory.h
@@ -0,0 +1,19 @@
+/*
+ * Memory manager for remote device
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
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
index cac699c..6ee5bc5 100644
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
index 0000000..32085b1
--- /dev/null
+++ b/hw/remote/memory.c
@@ -0,0 +1,65 @@
+/*
+ * Memory manager for remote device
+ *
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
index b3d380e..4b25649 100644
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
index 1ab4ece..d6903e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3188,6 +3188,8 @@ F: hw/remote/mpqemu-link.c
 F: include/hw/remote/mpqemu-link.h
 F: hw/remote/message.c
 F: hw/remote/remote-obj.c
+F: include/hw/remote/memory.h
+F: hw/remote/memory.c
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 71d0a56..64da16c 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -5,4 +5,6 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 
+specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
+
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
-- 
1.8.3.1


