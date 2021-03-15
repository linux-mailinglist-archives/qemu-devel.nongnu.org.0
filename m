Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420F933C79F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:20:40 +0100 (CET)
Received: from localhost ([::1]:57900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLthf-0000m4-9p
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLtaE-0000l2-2j
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:12:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLtaB-0006TI-RF
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615839175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3DNZANP5pMLpFqzcQW1Lkyt3Il6KPWXcp2s6/Sr0h3o=;
 b=PWTOXGV7Amx8Jud2MwRCp1O35qDH+OeM7lbHRWFeM7B3DPt9KQhvZV+mbwWAXH4VSzmjFg
 NpTgQ9qBfqqF85p8UKLrV6YFyDqTlaKeJXow7PA75IjCQrAgLdWen5AKN+B5RIleasiAc7
 +/KNypOC5dJAtp43QVUCKtxwWVa31to=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-RLXSFgyrMFGAQhDKBT1_mg-1; Mon, 15 Mar 2021 16:12:52 -0400
X-MC-Unique: RLXSFgyrMFGAQhDKBT1_mg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A32F087A82A;
 Mon, 15 Mar 2021 20:12:51 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-235.ams2.redhat.com
 [10.36.114.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F418D62680;
 Mon, 15 Mar 2021 20:12:49 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, vgoyal@redhat.com,
 wanghao232@huawei.com, ma.mandourr@gmail.com
Subject: [PULL 8/9] monitor: Replaced qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
Date: Mon, 15 Mar 2021 20:12:14 +0000
Message-Id: <20210315201215.222539-9-dgilbert@redhat.com>
In-Reply-To: <20210315201215.222539-1-dgilbert@redhat.com>
References: <20210315201215.222539-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Removed various qemu_mutex_lock and their respective qemu_mutex_unlock
calls and used lock guard macros (QEMU_LOCK_GUARD and
WITH_QEMU_LOCK_GUARD). This simplifies the code by
eliminating qemu_mutex_unlock calls.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Message-Id: <20210311031538.5325-6-ma.mandourr@gmail.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor/monitor.c |  8 ++------
 monitor/qmp.c     | 51 ++++++++++++++++++++++-------------------------
 2 files changed, 26 insertions(+), 33 deletions(-)

diff --git a/monitor/monitor.c b/monitor/monitor.c
index e94f532cf5..640496e562 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -349,7 +349,7 @@ monitor_qapi_event_queue_no_reenter(QAPIEvent event, QDict *qdict)
     evconf = &monitor_qapi_event_conf[event];
     trace_monitor_protocol_event_queue(event, qdict, evconf->rate);
 
-    qemu_mutex_lock(&monitor_lock);
+    QEMU_LOCK_GUARD(&monitor_lock);
 
     if (!evconf->rate) {
         /* Unthrottled event */
@@ -391,8 +391,6 @@ monitor_qapi_event_queue_no_reenter(QAPIEvent event, QDict *qdict)
             timer_mod_ns(evstate->timer, now + evconf->rate);
         }
     }
-
-    qemu_mutex_unlock(&monitor_lock);
 }
 
 void qapi_event_emit(QAPIEvent event, QDict *qdict)
@@ -447,7 +445,7 @@ static void monitor_qapi_event_handler(void *opaque)
     MonitorQAPIEventConf *evconf = &monitor_qapi_event_conf[evstate->event];
 
     trace_monitor_protocol_event_handler(evstate->event, evstate->qdict);
-    qemu_mutex_lock(&monitor_lock);
+    QEMU_LOCK_GUARD(&monitor_lock);
 
     if (evstate->qdict) {
         int64_t now = qemu_clock_get_ns(monitor_get_event_clock());
@@ -462,8 +460,6 @@ static void monitor_qapi_event_handler(void *opaque)
         timer_free(evstate->timer);
         g_free(evstate);
     }
-
-    qemu_mutex_unlock(&monitor_lock);
 }
 
 static unsigned int qapi_event_throttle_hash(const void *key)
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 2326bd7f9b..2b0308f933 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -76,7 +76,7 @@ static void monitor_qmp_cleanup_req_queue_locked(MonitorQMP *mon)
 
 static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
 {
-    qemu_mutex_lock(&mon->qmp_queue_lock);
+    QEMU_LOCK_GUARD(&mon->qmp_queue_lock);
 
     /*
      * Same condition as in monitor_qmp_dispatcher_co(), but before
@@ -103,7 +103,6 @@ static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
         monitor_resume(&mon->common);
     }
 
-    qemu_mutex_unlock(&mon->qmp_queue_lock);
 }
 
 void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
@@ -179,7 +178,7 @@ static QMPRequest *monitor_qmp_requests_pop_any_with_lock(void)
     Monitor *mon;
     MonitorQMP *qmp_mon;
 
-    qemu_mutex_lock(&monitor_lock);
+    QEMU_LOCK_GUARD(&monitor_lock);
 
     QTAILQ_FOREACH(mon, &mon_list, entry) {
         if (!monitor_is_qmp(mon)) {
@@ -205,8 +204,6 @@ static QMPRequest *monitor_qmp_requests_pop_any_with_lock(void)
         QTAILQ_INSERT_TAIL(&mon_list, mon, entry);
     }
 
-    qemu_mutex_unlock(&monitor_lock);
-
     return req_obj;
 }
 
@@ -376,30 +373,30 @@ static void handle_qmp_command(void *opaque, QObject *req, Error *err)
     req_obj->err = err;
 
     /* Protect qmp_requests and fetching its length. */
-    qemu_mutex_lock(&mon->qmp_queue_lock);
+    WITH_QEMU_LOCK_GUARD(&mon->qmp_queue_lock) {
 
-    /*
-     * Suspend the monitor when we can't queue more requests after
-     * this one.  Dequeuing in monitor_qmp_dispatcher_co() or
-     * monitor_qmp_cleanup_queue_and_resume() will resume it.
-     * Note that when OOB is disabled, we queue at most one command,
-     * for backward compatibility.
-     */
-    if (!qmp_oob_enabled(mon) ||
-        mon->qmp_requests->length == QMP_REQ_QUEUE_LEN_MAX - 1) {
-        monitor_suspend(&mon->common);
-    }
+        /*
+         * Suspend the monitor when we can't queue more requests after
+         * this one.  Dequeuing in monitor_qmp_dispatcher_co() or
+         * monitor_qmp_cleanup_queue_and_resume() will resume it.
+         * Note that when OOB is disabled, we queue at most one command,
+         * for backward compatibility.
+         */
+        if (!qmp_oob_enabled(mon) ||
+            mon->qmp_requests->length == QMP_REQ_QUEUE_LEN_MAX - 1) {
+            monitor_suspend(&mon->common);
+        }
 
-    /*
-     * Put the request to the end of queue so that requests will be
-     * handled in time order.  Ownership for req_obj, req,
-     * etc. will be delivered to the handler side.
-     */
-    trace_monitor_qmp_in_band_enqueue(req_obj, mon,
-                                      mon->qmp_requests->length);
-    assert(mon->qmp_requests->length < QMP_REQ_QUEUE_LEN_MAX);
-    g_queue_push_tail(mon->qmp_requests, req_obj);
-    qemu_mutex_unlock(&mon->qmp_queue_lock);
+        /*
+         * Put the request to the end of queue so that requests will be
+         * handled in time order.  Ownership for req_obj, req,
+         * etc. will be delivered to the handler side.
+         */
+        trace_monitor_qmp_in_band_enqueue(req_obj, mon,
+                                          mon->qmp_requests->length);
+        assert(mon->qmp_requests->length < QMP_REQ_QUEUE_LEN_MAX);
+        g_queue_push_tail(mon->qmp_requests, req_obj);
+    }
 
     /* Kick the dispatcher routine */
     if (!qatomic_xchg(&qmp_dispatcher_co_busy, true)) {
-- 
2.30.2


