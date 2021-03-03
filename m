Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D713032B3F3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 05:25:20 +0100 (CET)
Received: from localhost ([::1]:39764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHJ4W-0001rV-AV
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 23:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0c-0005Ml-Rh
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:14 -0500
Received: from mga18.intel.com ([134.134.136.126]:42971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0a-000591-Na
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:14 -0500
IronPort-SDR: AIqIAlay1wCkuU/ecy6aBc+Jb1vLSYIVwEZQ0Ce9OzkMMIxOsg+6DDcVcJJvA2JjT+JmXwtGzj
 2/cB6SdlJeyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174732231"
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="174732231"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:21:11 -0800
IronPort-SDR: DQIPAfmrqSUpeRxnjOEOSrkrGdEjea3V/K0bC3YkxVAoQCGAon07uh6LQocX2upTbb3kQsuTK4
 rAciN/1CScGQ==
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="407060032"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:21:09 -0800
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH V2 5/7] net/colo-compare: Move data structure and define to .h
 file.
Date: Wed,  3 Mar 2021 12:15:37 +0800
Message-Id: <20210303041539.1032415-6-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303041539.1032415-1-chen.zhang@intel.com>
References: <20210303041539.1032415-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=1.624,
 FROM_WSP_TRAIL=1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Make other modules can reuse COLO code.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 106 ---------------------------------------------
 net/colo-compare.h | 106 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+), 106 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 84db4978ac..a803f8b888 100644
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
diff --git a/net/colo-compare.h b/net/colo-compare.h
index 22ddd512e2..2a9dcac0a7 100644
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
+#define MAX_QUEUE_SIZE 1024
+
+#define COLO_COMPARE_FREE_PRIMARY     0x01
+#define COLO_COMPARE_FREE_SECONDARY   0x02
+
+#define REGULAR_PACKET_CHECK_MS 1000
+#define DEFAULT_TIME_OUT_MS 3000
+
+typedef struct SendCo {
+    Coroutine *co;
+    struct CompareState *s;
+    CharBackend *chr;
+    GQueue send_list;
+    bool notify_remote_frame;
+    bool done;
+    int ret;
+} SendCo;
+
+typedef struct SendEntry {
+    uint32_t size;
+    uint32_t vnet_hdr_len;
+    uint8_t *buf;
+} SendEntry;
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
+    SendCo out_sendco;
+    SendCo notify_sendco;
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


