Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5093B1742
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:50:01 +0200 (CEST)
Received: from localhost ([::1]:52552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvzWC-0006qV-HQ
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvzRf-0005Tc-NQ
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:45:19 -0400
Received: from mga02.intel.com ([134.134.136.20]:12503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvzRc-0007EE-CE
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:45:19 -0400
IronPort-SDR: zC01Y0mDHxAnONeqMzj/iXNOZ4nCFIYHy1J3jWtAloOPW0+Ph3uxYdseo7TaQQMcbNd4avaXPY
 hAEef5X7TtWw==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="194369587"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="194369587"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 02:45:14 -0700
IronPort-SDR: dZVCy/2NPLUqlqQXpTt9yNpuYWKoDHzi+axXrAl5pgYXnM6AcZTJAG4E/lN1ZJys3R9B7iiaA9
 5bvbpAs6w6lA==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="487242897"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 02:45:11 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V9 4/6] net/colo-compare: Move data structure and define to .h
 file.
Date: Wed, 23 Jun 2021 17:37:55 +0800
Message-Id: <20210623093757.2683226-5-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623093757.2683226-1-chen.zhang@intel.com>
References: <20210623093757.2683226-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, Lukas Straub <lukasstraub2@web.de>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename structure with COLO index and move it to .h file,
It make other modules can reuse COLO code.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 132 ++++++++-------------------------------------
 net/colo-compare.h |  86 +++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+), 109 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index b100e7b51f..dcd24bb113 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -17,29 +17,18 @@
 #include "qemu/error-report.h"
 #include "trace.h"
 #include "qapi/error.h"
-#include "net/net.h"
 #include "net/eth.h"
 #include "qom/object_interfaces.h"
 #include "qemu/iov.h"
 #include "qom/object.h"
 #include "net/queue.h"
-#include "chardev/char-fe.h"
 #include "qemu/sockets.h"
-#include "colo.h"
-#include "sysemu/iothread.h"
 #include "net/colo-compare.h"
-#include "migration/colo.h"
-#include "migration/migration.h"
 #include "util.h"
 
 #include "block/aio-wait.h"
 #include "qemu/coroutine.h"
 
-#define TYPE_COLO_COMPARE "colo-compare"
-typedef struct CompareState CompareState;
-DECLARE_INSTANCE_CHECKER(CompareState, COLO_COMPARE,
-                         TYPE_COLO_COMPARE)
-
 static QTAILQ_HEAD(, CompareState) net_compares =
        QTAILQ_HEAD_INITIALIZER(net_compares);
 
@@ -47,13 +36,13 @@ static NotifierList colo_compare_notifiers =
     NOTIFIER_LIST_INITIALIZER(colo_compare_notifiers);
 
 #define COMPARE_READ_LEN_MAX NET_BUFSIZE
-#define MAX_QUEUE_SIZE 1024
+#define MAX_COLO_QUEUE_SIZE 1024
 
 #define COLO_COMPARE_FREE_PRIMARY     0x01
 #define COLO_COMPARE_FREE_SECONDARY   0x02
 
-#define REGULAR_PACKET_CHECK_MS 1000
-#define DEFAULT_TIME_OUT_MS 3000
+#define COLO_REGULAR_PACKET_CHECK_MS 1000
+#define COLO_DEFAULT_TIME_OUT_MS 3000
 
 /* #define DEBUG_COLO_PACKETS */
 
@@ -64,87 +53,6 @@ static QemuCond event_complete_cond;
 static int event_unhandled_count;
 static uint32_t max_queue_size;
 
-/*
- *  + CompareState ++
- *  |               |
- *  +---------------+   +---------------+         +---------------+
- *  |   conn list   + - >      conn     + ------- >      conn     + -- > ......
- *  +---------------+   +---------------+         +---------------+
- *  |               |     |           |             |          |
- *  +---------------+ +---v----+  +---v----+    +---v----+ +---v----+
- *                    |primary |  |secondary    |primary | |secondary
- *                    |packet  |  |packet  +    |packet  | |packet  +
- *                    +--------+  +--------+    +--------+ +--------+
- *                        |           |             |          |
- *                    +---v----+  +---v----+    +---v----+ +---v----+
- *                    |primary |  |secondary    |primary | |secondary
- *                    |packet  |  |packet  +    |packet  | |packet  +
- *                    +--------+  +--------+    +--------+ +--------+
- *                        |           |             |          |
- *                    +---v----+  +---v----+    +---v----+ +---v----+
- *                    |primary |  |secondary    |primary | |secondary
- *                    |packet  |  |packet  +    |packet  | |packet  +
- *                    +--------+  +--------+    +--------+ +--------+
- */
-
-typedef struct SendCo {
-    Coroutine *co;
-    struct CompareState *s;
-    CharBackend *chr;
-    GQueue send_list;
-    bool notify_remote_frame;
-    bool done;
-    int ret;
-} SendCo;
-
-typedef struct SendEntry {
-    uint32_t size;
-    uint32_t vnet_hdr_len;
-    uint8_t *buf;
-} SendEntry;
-
-struct CompareState {
-    Object parent;
-
-    char *pri_indev;
-    char *sec_indev;
-    char *outdev;
-    char *notify_dev;
-    CharBackend chr_pri_in;
-    CharBackend chr_sec_in;
-    CharBackend chr_out;
-    CharBackend chr_notify_dev;
-    SocketReadState pri_rs;
-    SocketReadState sec_rs;
-    SocketReadState notify_rs;
-    SendCo out_sendco;
-    SendCo notify_sendco;
-    bool vnet_hdr;
-    uint64_t compare_timeout;
-    uint32_t expired_scan_cycle;
-
-    /*
-     * Record the connection that through the NIC
-     * Element type: Connection
-     */
-    GQueue conn_list;
-    /* Record the connection without repetition */
-    GHashTable *connection_track_table;
-
-    IOThread *iothread;
-    GMainContext *worker_context;
-    QEMUTimer *packet_check_timer;
-
-    QEMUBH *event_bh;
-    enum colo_event event;
-
-    QTAILQ_ENTRY(CompareState) next;
-};
-
-typedef struct CompareClass {
-    ObjectClass parent_class;
-} CompareClass;
-
 enum {
     PRIMARY_IN = 0,
     SECONDARY_IN,
@@ -155,6 +63,12 @@ static const char *colo_mode[] = {
     [SECONDARY_IN] = "secondary",
 };
 
+typedef struct COLOSendEntry {
+    uint32_t size;
+    uint32_t vnet_hdr_len;
+    uint8_t *buf;
+} COLOSendEntry;
+
 static int compare_chr_send(CompareState *s,
                             uint8_t *buf,
                             uint32_t size,
@@ -724,19 +638,19 @@ static void colo_compare_connection(void *opaque, void *user_data)
 
 static void coroutine_fn _compare_chr_send(void *opaque)
 {
-    SendCo *sendco = opaque;
+    COLOSendCo *sendco = opaque;
     CompareState *s = sendco->s;
     int ret = 0;
 
     while (!g_queue_is_empty(&sendco->send_list)) {
-        SendEntry *entry = g_queue_pop_tail(&sendco->send_list);
+        COLOSendEntry *entry = g_queue_pop_tail(&sendco->send_list);
         uint32_t len = htonl(entry->size);
 
         ret = qemu_chr_fe_write_all(sendco->chr, (uint8_t *)&len, sizeof(len));
 
         if (ret != sizeof(len)) {
             g_free(entry->buf);
-            g_slice_free(SendEntry, entry);
+            g_slice_free(COLOSendEntry, entry);
             goto err;
         }
 
@@ -753,7 +667,7 @@ static void coroutine_fn _compare_chr_send(void *opaque)
 
             if (ret != sizeof(len)) {
                 g_free(entry->buf);
-                g_slice_free(SendEntry, entry);
+                g_slice_free(COLOSendEntry, entry);
                 goto err;
             }
         }
@@ -764,12 +678,12 @@ static void coroutine_fn _compare_chr_send(void *opaque)
 
         if (ret != entry->size) {
             g_free(entry->buf);
-            g_slice_free(SendEntry, entry);
+            g_slice_free(COLOSendEntry, entry);
             goto err;
         }
 
         g_free(entry->buf);
-        g_slice_free(SendEntry, entry);
+        g_slice_free(COLOSendEntry, entry);
     }
 
     sendco->ret = 0;
@@ -777,9 +691,9 @@ static void coroutine_fn _compare_chr_send(void *opaque)
 
 err:
     while (!g_queue_is_empty(&sendco->send_list)) {
-        SendEntry *entry = g_queue_pop_tail(&sendco->send_list);
+        COLOSendEntry *entry = g_queue_pop_tail(&sendco->send_list);
         g_free(entry->buf);
-        g_slice_free(SendEntry, entry);
+        g_slice_free(COLOSendEntry, entry);
     }
     sendco->ret = ret < 0 ? ret : -EIO;
 out:
@@ -795,8 +709,8 @@ static int compare_chr_send(CompareState *s,
                             bool notify_remote_frame,
                             bool zero_copy)
 {
-    SendCo *sendco;
-    SendEntry *entry;
+    COLOSendCo *sendco;
+    COLOSendEntry *entry;
 
     if (notify_remote_frame) {
         sendco = &s->notify_sendco;
@@ -808,7 +722,7 @@ static int compare_chr_send(CompareState *s,
         return 0;
     }
 
-    entry = g_slice_new(SendEntry);
+    entry = g_slice_new(COLOSendEntry);
     entry->size = size;
     entry->vnet_hdr_len = vnet_hdr_len;
     if (zero_copy) {
@@ -1261,17 +1175,17 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
 
     if (!s->compare_timeout) {
         /* Set default value to 3000 MS */
-        s->compare_timeout = DEFAULT_TIME_OUT_MS;
+        s->compare_timeout = COLO_DEFAULT_TIME_OUT_MS;
     }
 
     if (!s->expired_scan_cycle) {
         /* Set default value to 3000 MS */
-        s->expired_scan_cycle = REGULAR_PACKET_CHECK_MS;
+        s->expired_scan_cycle = COLO_REGULAR_PACKET_CHECK_MS;
     }
 
     if (!max_queue_size) {
         /* Set default queue size to 1024 */
-        max_queue_size = MAX_QUEUE_SIZE;
+        max_queue_size = MAX_COLO_QUEUE_SIZE;
     }
 
     if (find_and_check_chardev(&chr, s->pri_indev, errp) ||
diff --git a/net/colo-compare.h b/net/colo-compare.h
index b055270da2..031b627a2f 100644
--- a/net/colo-compare.h
+++ b/net/colo-compare.h
@@ -17,6 +17,92 @@
 #ifndef QEMU_COLO_COMPARE_H
 #define QEMU_COLO_COMPARE_H
 
+#include "net/net.h"
+#include "chardev/char-fe.h"
+#include "migration/colo.h"
+#include "migration/migration.h"
+#include "sysemu/iothread.h"
+#include "colo.h"
+
+#define TYPE_COLO_COMPARE "colo-compare"
+typedef struct CompareState CompareState;
+DECLARE_INSTANCE_CHECKER(CompareState, COLO_COMPARE,
+                         TYPE_COLO_COMPARE)
+
+typedef struct COLOSendCo {
+    Coroutine *co;
+    struct CompareState *s;
+    CharBackend *chr;
+    GQueue send_list;
+    bool notify_remote_frame;
+    bool done;
+    int ret;
+} COLOSendCo;
+
+/*
+ *  + CompareState ++
+ *  |               |
+ *  +---------------+   +---------------+         +---------------+
+ *  |   conn list   + - >      conn     + ------- >      conn     + -- > ......
+ *  +---------------+   +---------------+         +---------------+
+ *  |               |     |           |             |          |
+ *  +---------------+ +---v----+  +---v----+    +---v----+ +---v----+
+ *                    |primary |  |secondary    |primary | |secondary
+ *                    |packet  |  |packet  +    |packet  | |packet  +
+ *                    +--------+  +--------+    +--------+ +--------+
+ *                        |           |             |          |
+ *                    +---v----+  +---v----+    +---v----+ +---v----+
+ *                    |primary |  |secondary    |primary | |secondary
+ *                    |packet  |  |packet  +    |packet  | |packet  +
+ *                    +--------+  +--------+    +--------+ +--------+
+ *                        |           |             |          |
+ *                    +---v----+  +---v----+    +---v----+ +---v----+
+ *                    |primary |  |secondary    |primary | |secondary
+ *                    |packet  |  |packet  +    |packet  | |packet  +
+ *                    +--------+  +--------+    +--------+ +--------+
+ */
+struct CompareState {
+    Object parent;
+
+    char *pri_indev;
+    char *sec_indev;
+    char *outdev;
+    char *notify_dev;
+    CharBackend chr_pri_in;
+    CharBackend chr_sec_in;
+    CharBackend chr_out;
+    CharBackend chr_notify_dev;
+    SocketReadState pri_rs;
+    SocketReadState sec_rs;
+    SocketReadState notify_rs;
+    COLOSendCo out_sendco;
+    COLOSendCo notify_sendco;
+    bool vnet_hdr;
+    uint64_t compare_timeout;
+    uint32_t expired_scan_cycle;
+
+    /*
+     * Record the connection that through the NIC
+     * Element type: Connection
+     */
+    GQueue conn_list;
+    /* Record the connection without repetition */
+    GHashTable *connection_track_table;
+
+    IOThread *iothread;
+    GMainContext *worker_context;
+    QEMUTimer *packet_check_timer;
+
+    QEMUBH *event_bh;
+    enum colo_event event;
+
+    QTAILQ_ENTRY(CompareState) next;
+};
+
+typedef struct CompareClass {
+    ObjectClass parent_class;
+} CompareClass;
+
 void colo_notify_compares_event(void *opaque, int event, Error **errp);
 void colo_compare_register_notifier(Notifier *notify);
 void colo_compare_unregister_notifier(Notifier *notify);
-- 
2.25.1


