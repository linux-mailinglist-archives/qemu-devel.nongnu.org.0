Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47F95A28D5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:50:32 +0200 (CEST)
Received: from localhost ([::1]:34746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZjD-0003Mx-Go
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZHE-0001AN-7R
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZH0-000415-2i
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661520081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2+4jxsul7Ik360711QSxaiocXEVhfrWNmu6gva/hW4=;
 b=TnNZsnI64MEL5iomcRH0Df/FiUB7KNn7gzM+1yszS8/9QAyuKN28BATkpFOkzTV5UAaJJq
 CmcNo3yHrW4YBKRFLendCi4NVMB/6CAQ8nRZrFIDRTYJI8KGX/ZMpIKiS+tkgS8xhESKrB
 J1Zub3Q6pHOkeRL8tZRN4wVAK8FMyc8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-L1cdsw0lOFW7F0XDlt9oJw-1; Fri, 26 Aug 2022 09:21:10 -0400
X-MC-Unique: L1cdsw0lOFW7F0XDlt9oJw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB53E3C0CD4A;
 Fri, 26 Aug 2022 13:21:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93A45492C3B;
 Fri, 26 Aug 2022 13:21:09 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v11 06/21] job: move and update comments from blockjob.c
Date: Fri, 26 Aug 2022 09:20:49 -0400
Message-Id: <20220826132104.3678958-7-eesposit@redhat.com>
In-Reply-To: <20220826132104.3678958-1-eesposit@redhat.com>
References: <20220826132104.3678958-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This comment applies more on job, it was left in blockjob as in the past
the whole job logic was implemented there.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 blockjob.c | 20 --------------------
 job.c      | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index 4868453d74..7da59a1f1c 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -36,21 +36,6 @@
 #include "qemu/main-loop.h"
 #include "qemu/timer.h"
 
-/*
- * The block job API is composed of two categories of functions.
- *
- * The first includes functions used by the monitor.  The monitor is
- * peculiar in that it accesses the block job list with block_job_get, and
- * therefore needs consistency across block_job_get and the actual operation
- * (e.g. block_job_set_speed).  The consistency is achieved with
- * aio_context_acquire/release.  These functions are declared in blockjob.h.
- *
- * The second includes functions used by the block job drivers and sometimes
- * by the core block layer.  These do not care about locking, because the
- * whole coroutine runs under the AioContext lock, and are declared in
- * blockjob_int.h.
- */
-
 static bool is_block_job(Job *job)
 {
     return job_type(job) == JOB_TYPE_BACKUP ||
@@ -433,11 +418,6 @@ static void block_job_event_ready(Notifier *n, void *opaque)
 }
 
 
-/*
- * API for block job drivers and the block layer.  These functions are
- * declared in blockjob_int.h.
- */
-
 void *block_job_create(const char *job_id, const BlockJobDriver *driver,
                        JobTxn *txn, BlockDriverState *bs, uint64_t perm,
                        uint64_t shared_perm, int64_t speed, int flags,
diff --git a/job.c b/job.c
index c6fb8ec16b..dcd561fd46 100644
--- a/job.c
+++ b/job.c
@@ -32,6 +32,22 @@
 #include "trace/trace-root.h"
 #include "qapi/qapi-events-job.h"
 
+/*
+ * The job API is composed of two categories of functions.
+ *
+ * The first includes functions used by the monitor.  The monitor is
+ * peculiar in that it accesses the job list with job_get, and
+ * therefore needs consistency across job_get and the actual operation
+ * (e.g. job_user_cancel). To achieve this consistency, the caller
+ * calls job_lock/job_unlock itself around the whole operation.
+ *
+ *
+ * The second includes functions used by the job drivers and sometimes
+ * by the core block layer. These delegate the locking to the callee instead.
+ *
+ * TODO Actually make this true
+ */
+
 /*
  * job_mutex protects the jobs list, but also makes the
  * struct job fields thread-safe.
-- 
2.31.1


