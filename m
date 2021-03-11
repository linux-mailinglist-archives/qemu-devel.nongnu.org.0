Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFC4336ED8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:29:13 +0100 (CET)
Received: from localhost ([::1]:40872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHd2-0002mn-9P
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBnq-0001OC-Sk
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:15:58 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBno-0000i3-V7
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:15:58 -0500
Received: by mail-wm1-x32f.google.com with SMTP id g20so406514wmk.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 19:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UF2uIEk2a+ZLtiqF+PRF7HpxKroPVBJ9bM3hn+fhcM0=;
 b=p7r8dUNkzKckPl+pLRABtoFa1fJbcoI/OZjUiydMahx/Z2ZbFuX+0b1z5GGi9+ADur
 m0wfbB5GghB96y9fHussnLVzTpe+97yhaxuaZyb74b6O0dCVp+Pt4rsgW+dPS8FA7Wjg
 ncm6bmwX6XWq2e+lnoILOpzaPQXjp3nDkwyIzM6eQiSSxOOI5//XDStbmGqPuepqivyv
 uDvkazWvMtaluVTo8Mi3XzvQb5VKkLhlc4FDDfWXeJHrdBabXE5GnBql5zz12lOHdfMF
 1B5jzu+OPAY7IXo/Nn9hnD12npKmAceUvheXMeXHJH00SIjc/VEsmg+QECON2v6UobZj
 pzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UF2uIEk2a+ZLtiqF+PRF7HpxKroPVBJ9bM3hn+fhcM0=;
 b=Ot7H326fm97vNQ2WphSpY/LmuaBLJuJ65kq2TNKqr2BKIA6vCqdFujscAMAoqMrCjE
 UpkviehI737VAYw3KAmJl8keJgJpD4sz29d3dMdYTlvbq6YctcyA5yiuJChlt58FyM1x
 9EEHYGuE+H/NeDkJwu6L9lmqyGEQuNlBMbCURRINMV+X/6kxSTMIUhSQyAFWbJeeZWzU
 wq68w7IupVRmHbqIyemgzp+NsP87nYwnSXN2sfBvb4lejQpvkdpKN1o2p7HQDdOp/dwx
 +0U5P7dW8xxCovnzowtl5CvPfRV6sBxinuYLFtRwH/jdLvXs6jX2oawMHF/BxHqFCjJ7
 5jMQ==
X-Gm-Message-State: AOAM531RZGA5vpSCjoly05kLUVONfTupCKjSIbHSy52nh0jwNZe9sK5/
 aQrj4STGfShH0xTS80/nOJIsOfWcpb8TrLPi8xQ=
X-Google-Smtp-Source: ABdhPJzkMbMUsyT4HZ2GJfhA/mkSxRJne8Pg2hcHgamvknhMnPlMaW/4QY6emjnYWr1gKt2fhEswhg==
X-Received: by 2002:a1c:a916:: with SMTP id s22mr6247078wme.82.1615432555262; 
 Wed, 10 Mar 2021 19:15:55 -0800 (PST)
Received: from localhost.localdomain ([197.61.47.225])
 by smtp.googlemail.com with ESMTPSA id o188sm1450416wme.7.2021.03.10.19.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 19:15:54 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] monitor: Replaced qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
Date: Thu, 11 Mar 2021 05:15:34 +0200
Message-Id: <20210311031538.5325-6-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311031538.5325-1-ma.mandourr@gmail.com>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Mar 2021 04:24:53 -0500
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Removed various qemu_mutex_lock and their respective qemu_mutex_unlock
calls and used lock guard macros (QEMU_LOCK_GUARD and
WITH_QEMU_LOCK_GUARD). This simplifies the code by
eliminating qemu_mutex_unlock calls.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
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
2.25.1


