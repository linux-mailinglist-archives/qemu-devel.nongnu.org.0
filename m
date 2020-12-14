Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1E2D92A7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:26:01 +0100 (CET)
Received: from localhost ([::1]:44510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogMy-0001EL-U2
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kogEs-00076O-5z
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 00:17:38 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:36600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kogEp-0007L9-OL
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 00:17:37 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BE5E3N4135577;
 Mon, 14 Dec 2020 05:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding;
 s=corp-2020-01-29; bh=Oo5yyEvvqeudaO748/rrLIjiD9mItxjoGOnYFYAh7TY=;
 b=Iz32CwMX+ilTDkRNZ80upqcPgU9oP9LP2QxON9ylfl67D1LkV5Hk9YHo4QZqdOYvPHiz
 lnElldlDFBm7bpkRF08KUb7aGtF9kJv8x/RuJ9uv5ysdngYhABOjtdrVdgp4lznBaXkn
 gQ41OKQlg7t2KCSAyQKjs5FBQ8NhG4vYI/Dauk4+VkJntIHF4TbO/EI1GvzRh3ACOwOV
 4pMUXwuSymSe24dwoTC+8nBcCmYeBvvxAVlNk4tcIZpqYmqQlaxxJ9EJd+HIhqkl2n3U
 Uq58QVWoWv6y25yr6pNolBSpwCjyqQvk/XTYV6I6F4g+si8iqKjjt3X78Pa7medqRhl2 gA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35cntkubdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Dec 2020 05:17:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BE5B4EX125083;
 Mon, 14 Dec 2020 05:15:29 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 35d7ek1bn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 05:15:29 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BE5FRRB030703;
 Mon, 14 Dec 2020 05:15:27 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 13 Dec 2020 21:15:27 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 11/19] multi-process: setup memory manager for remote
 device
Date: Mon, 14 Dec 2020 00:14:51 -0500
Message-Id: <94e7ed26bbaf44bdbf00db62e839be780cc24c14.1607922214.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
References: <cover.1607922214.git.jag.raman@oracle.com>
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
References: <cover.1607922214.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012140040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012140040
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
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
index 0000000..4fd548e
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
index b763bda..48c617e 100644
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
index 0000000..cb5fa5d
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
index b50e9a0..5c9af1d 100644
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
index f049059..33a4ad6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3161,6 +3161,8 @@ F: hw/remote/mpqemu-link.c
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


