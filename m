Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23CC360760
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:43:47 +0200 (CEST)
Received: from localhost ([::1]:50536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzTO-0002ir-KQ
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lWzRO-0000yk-C6
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:41:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:54485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lWzRF-0002Bp-6W
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:41:41 -0400
IronPort-SDR: ynw2bHfF4cKsN9af6h5QlWpVRe35tKI0rseHGbha7O1y6qC08t4jYtwpPIbfeNDl4bdlWjd+zg
 PK1bTmAXSbUQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="256146937"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="256146937"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:41:28 -0700
IronPort-SDR: lEFcQm6tMtbWTZUt4T4BSSgs7y1TSvn4AW/97SRTTnUvOAWJXsFH5nMlcpC94vKqcfEt7KK2vi
 700rIXcABAyA==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="425134966"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:41:25 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V5 4/6] net/colo-compare: Move data structure and define to .h
 file.
Date: Thu, 15 Apr 2021 18:35:13 +0800
Message-Id: <20210415103515.1251386-5-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415103515.1251386-1-chen.zhang@intel.com>
References: <20210415103515.1251386-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 net/colo-compare.c | 134 +++++----------------------------------------
 net/colo-compare.h | 106 +++++++++++++++++++++++++++++++++++
 2 files changed, 120 insertions(+), 120 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 9d1ad99941..b51b1437ef 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -17,44 +17,24 @@
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
 
 static NotifierList colo_compare_notifiers =
     NOTIFIER_LIST_INITIALIZER(colo_compare_notifiers);
 
-#define COMPARE_READ_LEN_MAX NET_BUFSIZE
-#define MAX_QUEUE_SIZE 1024
-
-#define COLO_COMPARE_FREE_PRIMARY     0x01
-#define COLO_COMPARE_FREE_SECONDARY   0x02
-
-#define REGULAR_PACKET_CHECK_MS 1000
-#define DEFAULT_TIME_OUT_MS 3000
-
 /* #define DEBUG_COLO_PACKETS */
 
 static QemuMutex colo_compare_mutex;
@@ -64,92 +44,6 @@ static QemuCond event_complete_cond;
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
-enum {
-    PRIMARY_IN = 0,
-    SECONDARY_IN,
-};
-
 static const char *colo_mode[] = {
     [PRIMARY_IN] = "primary",
     [SECONDARY_IN] = "secondary",
@@ -737,19 +631,19 @@ static void colo_compare_connection(void *opaque, void *user_data)
 
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
 
@@ -766,7 +660,7 @@ static void coroutine_fn _compare_chr_send(void *opaque)
 
             if (ret != sizeof(len)) {
                 g_free(entry->buf);
-                g_slice_free(SendEntry, entry);
+                g_slice_free(COLOSendEntry, entry);
                 goto err;
             }
         }
@@ -777,12 +671,12 @@ static void coroutine_fn _compare_chr_send(void *opaque)
 
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
@@ -790,9 +684,9 @@ static void coroutine_fn _compare_chr_send(void *opaque)
 
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
@@ -808,8 +702,8 @@ static int compare_chr_send(CompareState *s,
                             bool notify_remote_frame,
                             bool zero_copy)
 {
-    SendCo *sendco;
-    SendEntry *entry;
+    COLOSendCo *sendco;
+    COLOSendEntry *entry;
 
     if (notify_remote_frame) {
         sendco = &s->notify_sendco;
@@ -821,7 +715,7 @@ static int compare_chr_send(CompareState *s,
         return 0;
     }
 
-    entry = g_slice_new(SendEntry);
+    entry = g_slice_new(COLOSendEntry);
     entry->size = size;
     entry->vnet_hdr_len = vnet_hdr_len;
     if (zero_copy) {
@@ -1274,17 +1168,17 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
 
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
index 22ddd512e2..ab649c9dbe 100644
--- a/net/colo-compare.h
+++ b/net/colo-compare.h
@@ -17,6 +17,112 @@
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
+#define COMPARE_READ_LEN_MAX NET_BUFSIZE
+#define MAX_COLO_QUEUE_SIZE 1024
+
+#define COLO_COMPARE_FREE_PRIMARY     0x01
+#define COLO_COMPARE_FREE_SECONDARY   0x02
+
+#define COLO_REGULAR_PACKET_CHECK_MS 1000
+#define COLO_DEFAULT_TIME_OUT_MS 3000
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
+typedef struct COLOSendEntry {
+    uint32_t size;
+    uint32_t vnet_hdr_len;
+    uint8_t *buf;
+} COLOSendEntry;
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
+enum {
+    PRIMARY_IN = 0,
+    SECONDARY_IN,
+};
+
 void colo_notify_compares_event(void *opaque, int event, Error **errp);
 void colo_compare_register_notifier(Notifier *notify);
 void colo_compare_unregister_notifier(Notifier *notify);
-- 
2.25.1


