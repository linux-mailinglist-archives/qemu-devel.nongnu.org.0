Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F52D30AC82
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:22:09 +0100 (CET)
Received: from localhost ([::1]:56900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bxo-0006xn-3G
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6brJ-0003ge-7j
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:15:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6br9-0003N6-NX
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:15:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612196112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ww5CzWnh3SoioG5+dSXSHtjkLezq2WsdXm/RYk/7yZs=;
 b=TRSIklVK711vFd6VxvMovOzDL2dgMLKadYgvEGa6B5yR3Hsp18bGQV4hrPwFJQoJrFPQQB
 c09rHekFn51t5kksborPUDqioOf/5x1oH84qZpY4Tr2YXfxJyHLA44AgAeatcvpvmmz4HQ
 0x42wYZdsvjCPt/k/bPzpjZ44pb50hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-KDt0KrDXPhys1dD_r4Q4Mg-1; Mon, 01 Feb 2021 11:15:10 -0500
X-MC-Unique: KDt0KrDXPhys1dD_r4Q4Mg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 486618030AA
 for <qemu-devel@nongnu.org>; Mon,  1 Feb 2021 16:15:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBC352C154;
 Mon,  1 Feb 2021 16:15:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4976A1138468; Mon,  1 Feb 2021 17:15:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] qmp: Resume OOB-enabled monitor before processing the
 request
Date: Mon,  1 Feb 2021 17:15:04 +0100
Message-Id: <20210201161504.1976989-4-armbru@redhat.com>
In-Reply-To: <20210201161504.1976989-1-armbru@redhat.com>
References: <20210201161504.1976989-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: kwolf@redhat.com, jsnow@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

monitor_qmp_dispatcher_co() needs to resume the monitor if
handle_qmp_command() suspended it.  Two cases:

1. OOB enabled: suspended if mon->qmp_requests has no more space

2. OOB disabled: suspended always

We resume only after we processed the request.  Which can take a long
time.

Resume the monitor right when the queue has space to keep the monitor
available for out-of-band commands even in this corner case.

Leave the "OOB disabled" case alone.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/qmp.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index e37b047c8a..d164b9f744 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -214,7 +214,7 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
 {
     QMPRequest *req_obj = NULL;
     QDict *rsp;
-    bool need_resume;
+    bool oob_enabled;
     MonitorQMP *mon;
 
     while (true) {
@@ -273,11 +273,32 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
         aio_co_schedule(qemu_get_aio_context(), qmp_dispatcher_co);
         qemu_coroutine_yield();
 
+        /*
+         * @req_obj has a request, we hold req_obj->mon->qmp_queue_lock
+         */
+
         mon = req_obj->mon;
-        /* qmp_oob_enabled() might change after "qmp_capabilities" */
-        need_resume = !qmp_oob_enabled(mon) ||
-            mon->qmp_requests->length == QMP_REQ_QUEUE_LEN_MAX - 1;
+
+        /*
+         * We need to resume the monitor if handle_qmp_command()
+         * suspended it.  Two cases:
+         * 1. OOB enabled: mon->qmp_requests has no more space
+         *    Resume right away, so that OOB commands can get executed while
+         *    this request is being processed.
+         * 2. OOB disabled: always
+         *    Resume only after we're done processing the request, 
+         * We need to save qmp_oob_enabled() for later, because
+         * qmp_qmp_capabilities() can change it.
+         */
+        oob_enabled = qmp_oob_enabled(mon);
+        if (oob_enabled
+            && mon->qmp_requests->length == QMP_REQ_QUEUE_LEN_MAX - 1) {
+            monitor_resume(&mon->common);
+        }
+
         qemu_mutex_unlock(&mon->qmp_queue_lock);
+
+        /* Process request */
         if (req_obj->req) {
             if (trace_event_get_state(TRACE_MONITOR_QMP_CMD_IN_BAND)) {
                 QDict *qdict = qobject_to(QDict, req_obj->req);
@@ -298,10 +319,10 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
             qobject_unref(rsp);
         }
 
-        if (need_resume) {
-            /* Pairs with the monitor_suspend() in handle_qmp_command() */
+        if (!oob_enabled) {
             monitor_resume(&mon->common);
         }
+
         qmp_request_free(req_obj);
 
         /*
-- 
2.26.2


