Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36DE30F47B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:04:06 +0100 (CET)
Received: from localhost ([::1]:34892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fEr-0005uC-Ro
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7fCb-0003cf-R1
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:01:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7fCZ-00006e-TZ
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612447302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLxYNuVKbLaHExy22fumUpWboafTmTjNstltLuznAVM=;
 b=UXZG6qFutqMpRXjqflKzGcKf7pLIazzHmLmigHUo+SBSpnq7IaWlwW/zlSK1nDk02esK88
 oePS45oQ/TTXCG0z+TYZd7t90zfXWw5WZMk5yXnCeKdSPAnLsCMnjFP5cnXxBagwecNdu1
 0ZKNSrrDuvI+EvN+YgIoaEvCkOnXqec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-vcKOnUJkN1e2l_bEglbAlQ-1; Thu, 04 Feb 2021 09:01:40 -0500
X-MC-Unique: vcKOnUJkN1e2l_bEglbAlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E05A0100C617;
 Thu,  4 Feb 2021 14:01:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B05235B698;
 Thu,  4 Feb 2021 14:01:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 826051132CB1; Thu,  4 Feb 2021 15:01:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] qmp: Add more tracepoints
Date: Thu,  4 Feb 2021 15:01:35 +0100
Message-Id: <20210204140136.2769065-9-armbru@redhat.com>
In-Reply-To: <20210204140136.2769065-1-armbru@redhat.com>
References: <20210204140136.2769065-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add tracepoints for in-band request enqueue and dequeue, processing of
queued in-band errors, and responses.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210201161504.1976989-3-armbru@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 monitor/qmp.c        | 7 +++++++
 monitor/trace-events | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index f6a1e7783b..e37b047c8a 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -113,6 +113,7 @@ void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
 
     json = qobject_to_json_pretty(data, mon->pretty);
     assert(json != NULL);
+    trace_monitor_qmp_respond(mon, json->str);
 
     g_string_append_c(json, '\n');
     monitor_puts(&mon->common, json->str);
@@ -251,6 +252,9 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
             }
         }
 
+        trace_monitor_qmp_in_band_dequeue(req_obj,
+                                          req_obj->mon->qmp_requests->length);
+
         if (qatomic_xchg(&qmp_dispatcher_co_busy, true) == true) {
             /*
              * Someone rescheduled us (probably because a new requests
@@ -287,6 +291,7 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
             monitor_qmp_dispatch(mon, req_obj->req);
         } else {
             assert(req_obj->err);
+            trace_monitor_qmp_err_in_band(error_get_pretty(req_obj->err));
             rsp = qmp_error_response(req_obj->err);
             req_obj->err = NULL;
             monitor_qmp_respond(mon, rsp);
@@ -364,6 +369,8 @@ static void handle_qmp_command(void *opaque, QObject *req, Error *err)
      * handled in time order.  Ownership for req_obj, req,
      * etc. will be delivered to the handler side.
      */
+    trace_monitor_qmp_in_band_enqueue(req_obj, mon,
+                                      mon->qmp_requests->length);
     assert(mon->qmp_requests->length < QMP_REQ_QUEUE_LEN_MAX);
     g_queue_push_tail(mon->qmp_requests, req_obj);
     qemu_mutex_unlock(&mon->qmp_queue_lock);
diff --git a/monitor/trace-events b/monitor/trace-events
index 0365ac4d99..348dcfca9b 100644
--- a/monitor/trace-events
+++ b/monitor/trace-events
@@ -10,6 +10,10 @@ monitor_protocol_event_queue(uint32_t event, void *qdict, uint64_t rate) "event=
 monitor_suspend(void *ptr, int cnt) "mon %p: %d"
 
 # qmp.c
+monitor_qmp_in_band_enqueue(void *req, void *mon, unsigned len) "%p mon %p len %u"
+monitor_qmp_in_band_dequeue(void *req, unsigned len) "%p len %u"
 monitor_qmp_cmd_in_band(const char *id) "%s"
+monitor_qmp_err_in_band(const char *desc) "%s"
 monitor_qmp_cmd_out_of_band(const char *id) "%s"
+monitor_qmp_respond(void *mon, const char *json) "mon %p resp: %s"
 handle_qmp_command(void *mon, const char *req) "mon %p req: %s"
-- 
2.26.2


