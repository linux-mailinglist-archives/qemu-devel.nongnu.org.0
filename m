Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5E01FA98F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 09:08:31 +0200 (CEST)
Received: from localhost ([::1]:39160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl5hu-0003Eo-D3
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 03:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5N8-0002E1-1L
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:47:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35639
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5N5-0005p5-PR
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592290019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=q+Zson716eA2srJK2dRNURIuqK9Cb9Ivl3c8K1m1iM8=;
 b=PbIWkM4qLxqsM6lpLrK4UuvPr3tJ6udt5SoVlpAtIqMd5rheSqI7c3AoG2PD/Cjc7gNigh
 JDqfDUq47FVln6SZv6NVBSmCuMULt9Z4TJtWxlVrz/jmKhHm9ENH7D1wLtxs4hpoEX4V8l
 K/TGwuygL+hfv8pJx7z1rX170sEzTGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-zhb_TGf6NyyoLmEd8uqH4A-1; Tue, 16 Jun 2020 02:46:56 -0400
X-MC-Unique: zhb_TGf6NyyoLmEd8uqH4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAE3E801503;
 Tue, 16 Jun 2020 06:46:55 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-222.pek2.redhat.com
 [10.72.13.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E409B8202D;
 Tue, 16 Jun 2020 06:46:53 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 28/33] net/colo-compare.c: Check that colo-compare is active
Date: Tue, 16 Jun 2020 14:45:39 +0800
Message-Id: <1592289944-13727-29-git-send-email-jasowang@redhat.com>
In-Reply-To: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
References: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

If the colo-compare object is removed before failover and a
checkpoint happens, qemu crashes because it tries to lock
the destroyed event_mtx in colo_notify_compares_event.

Fix this by checking if everything is initialized by
introducing a new variable colo_compare_active which
is protected by a new mutex colo_compare_mutex. The new mutex
also protects against concurrent access of the net_compares
list and makes sure that colo_notify_compares_event isn't
active while we destroy event_mtx and event_complete_cond.

With this it also is again possible to use colo without
colo-compare (periodic mode) and to use multiple colo-compare
for multiple network interfaces.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo-compare.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index a609f49..c30dbfb 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -54,6 +54,8 @@ static NotifierList colo_compare_notifiers =
 #define REGULAR_PACKET_CHECK_MS 3000
 #define DEFAULT_TIME_OUT_MS 3000
 
+static QemuMutex colo_compare_mutex;
+static bool colo_compare_active;
 static QemuMutex event_mtx;
 static QemuCond event_complete_cond;
 static int event_unhandled_count;
@@ -906,6 +908,12 @@ static void check_old_packet_regular(void *opaque)
 void colo_notify_compares_event(void *opaque, int event, Error **errp)
 {
     CompareState *s;
+    qemu_mutex_lock(&colo_compare_mutex);
+
+    if (!colo_compare_active) {
+        qemu_mutex_unlock(&colo_compare_mutex);
+        return;
+    }
 
     qemu_mutex_lock(&event_mtx);
     QTAILQ_FOREACH(s, &net_compares, next) {
@@ -919,6 +927,7 @@ void colo_notify_compares_event(void *opaque, int event, Error **errp)
     }
 
     qemu_mutex_unlock(&event_mtx);
+    qemu_mutex_unlock(&colo_compare_mutex);
 }
 
 static void colo_compare_timer_init(CompareState *s)
@@ -1274,7 +1283,14 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
                            s->vnet_hdr);
     }
 
+    qemu_mutex_lock(&colo_compare_mutex);
+    if (!colo_compare_active) {
+        qemu_mutex_init(&event_mtx);
+        qemu_cond_init(&event_complete_cond);
+        colo_compare_active = true;
+    }
     QTAILQ_INSERT_TAIL(&net_compares, s, next);
+    qemu_mutex_unlock(&colo_compare_mutex);
 
     s->out_sendco.s = s;
     s->out_sendco.chr = &s->chr_out;
@@ -1292,9 +1308,6 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
 
     g_queue_init(&s->conn_list);
 
-    qemu_mutex_init(&event_mtx);
-    qemu_cond_init(&event_complete_cond);
-
     s->connection_track_table = g_hash_table_new_full(connection_key_hash,
                                                       connection_key_equal,
                                                       g_free,
@@ -1382,12 +1395,19 @@ static void colo_compare_finalize(Object *obj)
 
     qemu_bh_delete(s->event_bh);
 
+    qemu_mutex_lock(&colo_compare_mutex);
     QTAILQ_FOREACH(tmp, &net_compares, next) {
         if (tmp == s) {
             QTAILQ_REMOVE(&net_compares, s, next);
             break;
         }
     }
+    if (QTAILQ_EMPTY(&net_compares)) {
+        colo_compare_active = false;
+        qemu_mutex_destroy(&event_mtx);
+        qemu_cond_destroy(&event_complete_cond);
+    }
+    qemu_mutex_unlock(&colo_compare_mutex);
 
     AioContext *ctx = iothread_get_aio_context(s->iothread);
     aio_context_acquire(ctx);
@@ -1415,15 +1435,18 @@ static void colo_compare_finalize(Object *obj)
         object_unref(OBJECT(s->iothread));
     }
 
-    qemu_mutex_destroy(&event_mtx);
-    qemu_cond_destroy(&event_complete_cond);
-
     g_free(s->pri_indev);
     g_free(s->sec_indev);
     g_free(s->outdev);
     g_free(s->notify_dev);
 }
 
+static void __attribute__((__constructor__)) colo_compare_init_globals(void)
+{
+    colo_compare_active = false;
+    qemu_mutex_init(&colo_compare_mutex);
+}
+
 static const TypeInfo colo_compare_info = {
     .name = TYPE_COLO_COMPARE,
     .parent = TYPE_OBJECT,
-- 
2.5.0


