Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685FE54E1F7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:29:53 +0200 (CEST)
Received: from localhost ([::1]:34946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pZI-0004V9-Gn
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o1pOY-0005DG-Kb
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:18:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o1pOU-0007Wx-DE
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655385521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKzdl4yaWGasKgkx0bVjRufoCtK+pZbR9esiYWn/JFo=;
 b=B9tPUPnWH8QHjM39Vi28SI9yg5I9ThC1ZhDyAPKCyoAqdb36fiMVmKc051KFA9XEdyyaT/
 X0TSvRgw04zsBBxz8NKlTM+3H56zSaN/BOSG7hGcsha960mKN+rh8geQvlPIQVG1QG49NX
 1Kb8FunEnrURnoSWmntunhY9hQv7w1A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-NhVbPESsMiWv-H3_j4F9pw-1; Thu, 16 Jun 2022 09:18:38 -0400
X-MC-Unique: NhVbPESsMiWv-H3_j4F9pw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C55EA803B22;
 Thu, 16 Jun 2022 13:18:37 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72A2640334E;
 Thu, 16 Jun 2022 13:18:37 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v7 01/18] job.c: make job_mutex and job_lock/unlock() public
Date: Thu, 16 Jun 2022 09:18:18 -0400
Message-Id: <20220616131835.2004262-2-eesposit@redhat.com>
In-Reply-To: <20220616131835.2004262-1-eesposit@redhat.com>
References: <20220616131835.2004262-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

job mutex will be used to protect the job struct elements and list,
replacing AioContext locks.

Right now use a shared lock for all jobs, in order to keep things
simple. Once the AioContext lock is gone, we can introduce per-job
locks.

To simplify the switch from aiocontext to job lock, introduce
*nop* lock/unlock functions and macros.
We want to always call job_lock/unlock outside the AioContext locks,
and not vice-versa, otherwise we might get a deadlock. This is not
straightforward to do, and that's why we start with nop functions.
Once everything is protected by job_lock/unlock, we can change the nop into
an actual mutex and remove the aiocontext lock.

Since job_mutex is already being used, add static
real_job_{lock/unlock} for the existing usage.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/job.h | 24 ++++++++++++++++++++++++
 job.c              | 35 +++++++++++++++++++++++------------
 2 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index c105b31076..d1192ffd61 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -303,6 +303,30 @@ typedef enum JobCreateFlags {
     JOB_MANUAL_DISMISS = 0x04,
 } JobCreateFlags;
 
+extern QemuMutex job_mutex;
+
+#define JOB_LOCK_GUARD() /* QEMU_LOCK_GUARD(&job_mutex) */
+
+#define WITH_JOB_LOCK_GUARD() /* WITH_QEMU_LOCK_GUARD(&job_mutex) */
+
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
index 075c6f3a20..2b4ffca9d4 100644
--- a/job.c
+++ b/job.c
@@ -32,6 +32,12 @@
 #include "trace/trace-root.h"
 #include "qapi/qapi-events-job.h"
 
+/*
+ * job_mutex protects the jobs list, but also makes the
+ * struct job fields thread-safe.
+ */
+QemuMutex job_mutex;
+
 static QLIST_HEAD(, Job) jobs = QLIST_HEAD_INITIALIZER(jobs);
 
 /* Job State Transition Table */
@@ -74,17 +80,22 @@ struct JobTxn {
     int refcnt;
 };
 
-/* Right now, this mutex is only needed to synchronize accesses to job->busy
- * and job->sleep_timer, such as concurrent calls to job_do_yield and
- * job_enter. */
-static QemuMutex job_mutex;
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
+static void real_job_lock(void)
 {
     qemu_mutex_lock(&job_mutex);
 }
 
-static void job_unlock(void)
+static void real_job_unlock(void)
 {
     qemu_mutex_unlock(&job_mutex);
 }
@@ -450,21 +461,21 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
         return;
     }
 
-    job_lock();
+    real_job_lock();
     if (job->busy) {
-        job_unlock();
+        real_job_unlock();
         return;
     }
 
     if (fn && !fn(job)) {
-        job_unlock();
+        real_job_unlock();
         return;
     }
 
     assert(!job->deferred_to_main_loop);
     timer_del(&job->sleep_timer);
     job->busy = true;
-    job_unlock();
+    real_job_unlock();
     aio_co_enter(job->aio_context, job->co);
 }
 
@@ -481,13 +492,13 @@ void job_enter(Job *job)
  * called explicitly. */
 static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
 {
-    job_lock();
+    real_job_lock();
     if (ns != -1) {
         timer_mod(&job->sleep_timer, ns);
     }
     job->busy = false;
     job_event_idle(job);
-    job_unlock();
+    real_job_unlock();
     qemu_coroutine_yield();
 
     /* Set by job_enter_cond() before re-entering the coroutine.  */
-- 
2.31.1


