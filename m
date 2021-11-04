Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB7E4455D9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:58:36 +0100 (CET)
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mieCI-0002KG-IT
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mie81-000389-8m
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mie7y-0006sS-Un
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636037646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7ofFkHnExQPEdJ0ShEbR6dIWEJ0sNV5QRWGv2LCM4g=;
 b=L5c49Mutm0umE43dZC00qkubzgKb+MfVR3Pd+2WWizy/2Y2puNGt+JWF/1ynokGRgzLTip
 YDsiQf633iuOlGwPPCypmFcBPdclNVf0jfF6m/bzo5goI+zhuKoAeA7/n52zhlLILGlBs9
 Doow6wRtlRQ9NbikLykVJ+uMck8/YtI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-Uwf9X2dpOxOsddGABji-uw-1; Thu, 04 Nov 2021 10:54:03 -0400
X-MC-Unique: Uwf9X2dpOxOsddGABji-uw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D419F1923795;
 Thu,  4 Nov 2021 14:53:51 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B779E6418A;
 Thu,  4 Nov 2021 14:53:50 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 01/14] job.c: make job_lock/unlock public
Date: Thu,  4 Nov 2021 10:53:21 -0400
Message-Id: <20211104145334.1346363-2-eesposit@redhat.com>
In-Reply-To: <20211104145334.1346363-1-eesposit@redhat.com>
References: <20211104145334.1346363-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

job mutex will be used to protect the job struct elements and list,
replacing AioContext locks.

Right now use a shared lock for all jobs, in order to keep things
simple. Once the AioContext lock is gone, we can introduce per-job
locks.

To simplify the switch from aiocontext to job lock, introduce
*nop* lock/unlock functions and macros. Once everything is protected
by jobs, we can add the mutex and remove the aiocontext.
Since job_mutex is already being used, add static
_job_{lock/unlock}.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/job.h | 18 ++++++++++++++++++
 job.c              | 39 +++++++++++++++++++++++++++------------
 2 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 7e9e59f4b8..ccf7826426 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -297,6 +297,24 @@ typedef enum JobCreateFlags {
     JOB_MANUAL_DISMISS = 0x04,
 } JobCreateFlags;
 
+/**
+ * job_lock:
+ *
+ * Take the mutex protecting the list of jobs and their status.
+ * Most functions called by the monitor need to call job_lock
+ * and job_unlock manually.  On the other hand, function called
+ * by the block jobs themselves and by the block layer will take the
+ * lock for you.
+ */
+void job_lock(void);
+
+/**
+ * job_unlock:
+ *
+ * Release the mutex protecting the list of jobs and their status.
+ */
+void job_unlock(void);
+
 /**
  * Allocate and return a new job transaction. Jobs can be added to the
  * transaction using job_txn_add_job().
diff --git a/job.c b/job.c
index 94b142684f..0e4dacf028 100644
--- a/job.c
+++ b/job.c
@@ -32,6 +32,12 @@
 #include "trace/trace-root.h"
 #include "qapi/qapi-events-job.h"
 
+/*
+ * job_mutex protects the jobs list, but also makes the
+ * struct job fields thread-safe.
+ */
+static QemuMutex job_mutex;
+
 static QLIST_HEAD(, Job) jobs = QLIST_HEAD_INITIALIZER(jobs);
 
 /* Job State Transition Table */
@@ -74,17 +80,26 @@ struct JobTxn {
     int refcnt;
 };
 
-/* Right now, this mutex is only needed to synchronize accesses to job->busy
- * and job->sleep_timer, such as concurrent calls to job_do_yield and
- * job_enter. */
-static QemuMutex job_mutex;
+#define JOB_LOCK_GUARD() /* QEMU_LOCK_GUARD(&job_mutex) */
+
+#define WITH_JOB_LOCK_GUARD() /* WITH_QEMU_LOCK_GUARD(&job_mutex) */
+
+void job_lock(void)
+{
+    /* nop */
+}
+
+void job_unlock(void)
+{
+    /* nop */
+}
 
-static void job_lock(void)
+static void _job_lock(void)
 {
     qemu_mutex_lock(&job_mutex);
 }
 
-static void job_unlock(void)
+static void _job_unlock(void)
 {
     qemu_mutex_unlock(&job_mutex);
 }
@@ -449,21 +464,21 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
         return;
     }
 
-    job_lock();
+    _job_lock();
     if (job->busy) {
-        job_unlock();
+        _job_unlock();
         return;
     }
 
     if (fn && !fn(job)) {
-        job_unlock();
+        _job_unlock();
         return;
     }
 
     assert(!job->deferred_to_main_loop);
     timer_del(&job->sleep_timer);
     job->busy = true;
-    job_unlock();
+    _job_unlock();
     aio_co_enter(job->aio_context, job->co);
 }
 
@@ -480,13 +495,13 @@ void job_enter(Job *job)
  * called explicitly. */
 static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
 {
-    job_lock();
+    _job_lock();
     if (ns != -1) {
         timer_mod(&job->sleep_timer, ns);
     }
     job->busy = false;
     job_event_idle(job);
-    job_unlock();
+    _job_unlock();
     qemu_coroutine_yield();
 
     /* Set by job_enter_cond() before re-entering the coroutine.  */
-- 
2.27.0


