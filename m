Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE96437C776
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:27:32 +0200 (CEST)
Received: from localhost ([::1]:53364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrhr-0005uS-UU
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lgrf5-0003QA-7u
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:24:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lgrer-0000Sx-KO
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620836664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XfM63cGDTcRvaElhEmL5JntPfckYz8Xsx2Ed7PYY+p4=;
 b=SRSdYVP3snkP/91ujZOB0tPpmqUACz6xN0kWSXGRK9cYtoWuzz7LBhrA7g7Ttus0tYeIjF
 EpkmyzC4EyoXyK/ggra1hL4fa5NYZcWfP6i57IuehDJtUnpJvruX9UIbk4//oqIzrO4NER
 6IWDgYtaLuOJXoK320gc6uIusu9xB3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-aakgcLL3O7iqSa8eOznrTw-1; Wed, 12 May 2021 12:24:17 -0400
X-MC-Unique: aakgcLL3O7iqSa8eOznrTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83622801107;
 Wed, 12 May 2021 16:24:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C2135D9D7;
 Wed, 12 May 2021 16:24:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 02FDD113861E; Wed, 12 May 2021 18:24:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
Date: Wed, 12 May 2021 18:24:08 +0200
Message-Id: <20210512162412.338120-2-armbru@redhat.com>
In-Reply-To: <20210512162412.338120-1-armbru@redhat.com>
References: <20210512162412.338120-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 Stefan Reiter <s.reiter@proxmox.com>, qemu-stable@nongnu.org,
 Wolfgang Bumiller <w.bumiller@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Reiter <s.reiter@proxmox.com>

The QMP dispatcher coroutine holds the qmp_queue_lock over a yield
point, where it expects to be rescheduled from the main context. If a
CHR_EVENT_CLOSED event is received just then, it can race and block the
main thread on the mutex in monitor_qmp_cleanup_queue_and_resume.

monitor_resume does not need to be called from main context, so we can
call it immediately after popping a request from the queue, which allows
us to drop the qmp_queue_lock mutex before yielding.

Suggested-by: Wolfgang Bumiller <w.bumiller@proxmox.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
Message-Id: <20210322154024.15011-1-s.reiter@proxmox.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/qmp.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index 2b0308f933..092c527b6f 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -257,24 +257,6 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
         trace_monitor_qmp_in_band_dequeue(req_obj,
                                           req_obj->mon->qmp_requests->length);
 
-        if (qatomic_xchg(&qmp_dispatcher_co_busy, true) == true) {
-            /*
-             * Someone rescheduled us (probably because a new requests
-             * came in), but we didn't actually yield. Do that now,
-             * only to be immediately reentered and removed from the
-             * list of scheduled coroutines.
-             */
-            qemu_coroutine_yield();
-        }
-
-        /*
-         * Move the coroutine from iohandler_ctx to qemu_aio_context for
-         * executing the command handler so that it can make progress if it
-         * involves an AIO_WAIT_WHILE().
-         */
-        aio_co_schedule(qemu_get_aio_context(), qmp_dispatcher_co);
-        qemu_coroutine_yield();
-
         /*
          * @req_obj has a request, we hold req_obj->mon->qmp_queue_lock
          */
@@ -298,8 +280,30 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
             monitor_resume(&mon->common);
         }
 
+        /*
+         * Drop the queue mutex now, before yielding, otherwise we might
+         * deadlock if the main thread tries to lock it.
+         */
         qemu_mutex_unlock(&mon->qmp_queue_lock);
 
+        if (qatomic_xchg(&qmp_dispatcher_co_busy, true) == true) {
+            /*
+             * Someone rescheduled us (probably because a new requests
+             * came in), but we didn't actually yield. Do that now,
+             * only to be immediately reentered and removed from the
+             * list of scheduled coroutines.
+             */
+            qemu_coroutine_yield();
+        }
+
+        /*
+         * Move the coroutine from iohandler_ctx to qemu_aio_context for
+         * executing the command handler so that it can make progress if it
+         * involves an AIO_WAIT_WHILE().
+         */
+        aio_co_schedule(qemu_get_aio_context(), qmp_dispatcher_co);
+        qemu_coroutine_yield();
+
         /* Process request */
         if (req_obj->req) {
             if (trace_event_get_state(TRACE_MONITOR_QMP_CMD_IN_BAND)) {
-- 
2.26.3


