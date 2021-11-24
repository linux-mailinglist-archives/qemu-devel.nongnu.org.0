Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D149145B542
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:22:02 +0100 (CET)
Received: from localhost ([::1]:32964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmbR-000170-VY
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:22:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3c-0005hy-G7
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:47:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3a-0005HL-FW
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iSOqCLMO+aHeGD+8Mr1igEix9uoxDGST7t6WvYYSr3s=;
 b=RLJ3zf9tAQjxM1DgaTeO1CMrPWQsJTjsThcbBk1xSSfNWsV0PDKLpAdFdAvMiLSOObLgGM
 0jyuK+EZ3UICTidhgJiaUClBnF7PL0EtgQ8xH2sUsoFgp5LfAEaxShNEotw5whHmg0ocMa
 zOtx7P7/ImumUg4z8LogCRMH7eDZ2qM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-LmkqR2_zP8-ZgpoylCAXtw-1; Wed, 24 Nov 2021 01:46:58 -0500
X-MC-Unique: LmkqR2_zP8-ZgpoylCAXtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBA381DDE6;
 Wed, 24 Nov 2021 06:46:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 948D060843;
 Wed, 24 Nov 2021 06:46:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 29/31] jobs: introduce pre_run function in JobDriver
Date: Wed, 24 Nov 2021 01:44:16 -0500
Message-Id: <20211124064418.3120601-30-eesposit@redhat.com>
In-Reply-To: <20211124064418.3120601-1-eesposit@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

.pre_run takes care of doing some initial job setup just before
the job is run inside the coroutine. Doing so can be useful
to invoke GS functions that require the BQL held.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job.h |  9 +++++++++
 job.c              | 13 +++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 4ea7a4a0cd..915ceff425 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -223,6 +223,15 @@ struct JobDriver {
      * the GS API.
      */
 
+    /**
+     * Called in the Main Loop context, before the job coroutine
+     * is started in the job aiocontext. Useful to perform operations
+     * that needs to be done under BQL (like permissions setup).
+     * On success, it returns 0. Otherwise the job failed to initialize
+     * and won't start.
+     */
+    int (*pre_run)(Job *job, Error **errp);
+
     /**
      * Called when the job is resumed by the user (i.e. user_paused becomes
      * false). .user_resume is called before .resume.
diff --git a/job.c b/job.c
index bb57ec6887..e048037099 100644
--- a/job.c
+++ b/job.c
@@ -967,11 +967,24 @@ static void coroutine_fn job_co_entry(void *opaque)
     aio_bh_schedule_oneshot(qemu_get_aio_context(), job_exit, job);
 }
 
+static int job_pre_run(Job *job)
+{
+    assert(qemu_in_main_thread());
+    if (job->driver->pre_run) {
+        return job->driver->pre_run(job, &job->err);
+    }
+
+    return 0;
+}
+
 void job_start(Job *job)
 {
     assert(job && !job_started(job) && job->paused &&
            job->driver && job->driver->run);
     job->co = qemu_coroutine_create(job_co_entry, job);
+    if (job_pre_run(job)) {
+        return;
+    }
     job->pause_count--;
     job->busy = true;
     job->paused = false;
-- 
2.27.0


