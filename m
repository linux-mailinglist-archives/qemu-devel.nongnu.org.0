Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B6C3BECC3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:02:59 +0200 (CEST)
Received: from localhost ([::1]:40960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Aws-00017E-GW
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m1Asi-0002e1-6B
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:58:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m1Asg-0000Cx-Cw
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625677117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W7TYMUwf6IpkICteKnmbomuPmxZgg9fNxbNqStYaMgg=;
 b=GBZJn6TkVOqfNLcV97kyZoMeITIC29ME5pTjck+MRuBJGEkCBdVgLGWT5T3zl+XZFu/NNp
 jPw/Xf3OT0W6LvBZMqUbgtfhsSyJ+ZUvFbfrT21tMN5+Zg3EZyUnnIUR2SrghF0LrQi3kG
 a2MUkrbrGJ+wvm+7JxmtP96diQ5V3ZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-0fWQ8cgtMnuez65sQ6DtvQ-1; Wed, 07 Jul 2021 12:58:34 -0400
X-MC-Unique: 0fWQ8cgtMnuez65sQ6DtvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14740801107;
 Wed,  7 Jul 2021 16:58:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-115-49.ams2.redhat.com
 [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 884E3100EB3D;
 Wed,  7 Jul 2021 16:58:30 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 3/6] job: minor changes to simplify locking
Date: Wed,  7 Jul 2021 18:58:10 +0200
Message-Id: <20210707165813.55361-4-eesposit@redhat.com>
In-Reply-To: <20210707165813.55361-1-eesposit@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check for NULL id to job_get, so that in the next patch we can
move job_get inside a single critical section of job_create.

Also add missing notifier_list_init for the on_idle NotifierList,
which seems to have been forgot.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 job.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/job.c b/job.c
index 96fb8e9730..48b304c3ff 100644
--- a/job.c
+++ b/job.c
@@ -375,6 +375,10 @@ Job *job_get(const char *id)
 {
     Job *job;
 
+    if (!id) {
+        return NULL;
+    }
+
     QLIST_FOREACH(job, &jobs, job_list) {
         if (job->id && !strcmp(id, job->id)) {
             return job;
@@ -406,15 +410,18 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
             error_setg(errp, "Invalid job ID '%s'", job_id);
             return NULL;
         }
-        if (job_get(job_id)) {
-            error_setg(errp, "Job ID '%s' already in use", job_id);
-            return NULL;
-        }
     } else if (!(flags & JOB_INTERNAL)) {
         error_setg(errp, "An explicit job ID is required");
         return NULL;
     }
 
+    job_lock();
+    if (job_get(job_id)) {
+        error_setg(errp, "Job ID '%s' already in use", job_id);
+        job_unlock();
+        return NULL;
+    }
+
     job = g_malloc0(driver->instance_size);
     job->driver        = driver;
     job->id            = g_strdup(job_id);
@@ -434,6 +441,7 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
     notifier_list_init(&job->on_finalize_completed);
     notifier_list_init(&job->on_pending);
     notifier_list_init(&job->on_ready);
+    notifier_list_init(&job->on_idle);
 
     job_state_transition(job, JOB_STATUS_CREATED);
     aio_timer_init(qemu_get_aio_context(), &job->sleep_timer,
-- 
2.31.1


