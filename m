Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052EC390EA1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 05:03:52 +0200 (CEST)
Received: from localhost ([::1]:38700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lljpn-0000yB-2H
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 23:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lljnT-0006fA-Io
 for qemu-devel@nongnu.org; Tue, 25 May 2021 23:01:28 -0400
Received: from mga14.intel.com ([192.55.52.115]:16092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lljnO-0002ux-Gz
 for qemu-devel@nongnu.org; Tue, 25 May 2021 23:01:26 -0400
IronPort-SDR: X0H+YOfGa93403QEsDda/AvBvYhc1KnrPLfLgoS5O80IMHQZZtRhE06d8tuH7u441ZPnPnbu6J
 5E0BwwsfIW3A==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202118635"
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="202118635"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 20:01:19 -0700
IronPort-SDR: vGzzl8H6f9zSmBe/C2g6N7vuMoFMY3xxyMNfGfkgcpCLvibGI96J/4+shEf8tiYpa/FnX8jl3c
 9Jwdwj2vlbsQ==
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="443741429"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 20:01:15 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V7 5/6] net/colo-compare: Add passthrough list to CompareState
Date: Wed, 26 May 2021 10:54:23 +0800
Message-Id: <20210526025424.1319994-6-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526025424.1319994-1-chen.zhang@intel.com>
References: <20210526025424.1319994-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Add passthrough list for each CompareState.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 28 ++++++++++++++++++++++++++++
 net/colo-compare.h | 12 ++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 8175612c5f..2250efd40d 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -161,6 +161,7 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
     ConnectionKey key;
     Packet *pkt = NULL;
     Connection *conn;
+    COLOPassthroughEntry *pass, *next;
     int ret;
 
     if (mode == PRIMARY_IN) {
@@ -180,6 +181,31 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
     }
     fill_connection_key(pkt, &key);
 
+    /* Check COLO passthrough specifications */
+    qemu_mutex_lock(&s->passthroughlist_mutex);
+    if (!QLIST_EMPTY(&s->passthroughlist)) {
+        QLIST_FOREACH_SAFE(pass, &s->passthroughlist, node, next) {
+            if (key.ip_proto == pass->l4_protocol->p_proto) {
+                if (pass->src_port == 0 || pass->src_port == key.dst_port) {
+                    if (pass->src_ip.s_addr == 0 ||
+                        pass->src_ip.s_addr == key.src.s_addr) {
+                        if (pass->dst_port == 0 ||
+                            pass->dst_port == key.src_port) {
+                            if (pass->dst_ip.s_addr == 0 ||
+                                pass->dst_ip.s_addr == key.dst.s_addr) {
+                                packet_destroy(pkt, NULL);
+                                pkt = NULL;
+                                qemu_mutex_unlock(&s->passthroughlist_mutex);
+                                return -1;
+                            }
+                        }
+                    }
+                }
+            }
+        }
+    }
+    qemu_mutex_unlock(&s->passthroughlist_mutex);
+
     conn = connection_get(s->connection_track_table,
                           &key,
                           &s->conn_list);
@@ -1245,6 +1271,7 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
     }
 
     g_queue_init(&s->conn_list);
+    QLIST_INIT(&s->passthroughlist);
 
     s->connection_track_table = g_hash_table_new_full(connection_key_hash,
                                                       connection_key_equal,
@@ -1259,6 +1286,7 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
         qemu_cond_init(&event_complete_cond);
         colo_compare_active = true;
     }
+    qemu_mutex_init(&s->passthroughlist_mutex);
     QTAILQ_INSERT_TAIL(&net_compares, s, next);
     qemu_mutex_unlock(&colo_compare_mutex);
 
diff --git a/net/colo-compare.h b/net/colo-compare.h
index a481df8ce6..1980df4487 100644
--- a/net/colo-compare.h
+++ b/net/colo-compare.h
@@ -23,6 +23,7 @@
 #include "migration/migration.h"
 #include "sysemu/iothread.h"
 #include "colo.h"
+#include <netdb.h>
 
 #define TYPE_COLO_COMPARE "colo-compare"
 typedef struct CompareState CompareState;
@@ -39,6 +40,15 @@ typedef struct COLOSendCo {
     int ret;
 } COLOSendCo;
 
+typedef struct COLOPassthroughEntry {
+    struct protoent *l4_protocol;
+    int src_port;
+    int dst_port;
+    struct in_addr src_ip;
+    struct in_addr dst_ip;
+    QLIST_ENTRY(COLOPassthroughEntry) node;
+} COLOPassthroughEntry;
+
 /*
  *  + CompareState ++
  *  |               |
@@ -95,6 +105,8 @@ struct CompareState {
 
     QEMUBH *event_bh;
     enum colo_event event;
+    QLIST_HEAD(, COLOPassthroughEntry) passthroughlist;
+    QemuMutex passthroughlist_mutex;
 
     QTAILQ_ENTRY(CompareState) next;
 };
-- 
2.25.1


