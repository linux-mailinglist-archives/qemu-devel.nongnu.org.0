Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E3C40297B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:12:43 +0200 (CEST)
Received: from localhost ([::1]:33762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNau2-0002Oa-63
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRT-0005tL-JJ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:43:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRR-0006Mj-Ps
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631018588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NJXHXfb3pQ+8VZadOR9DzFDVfBhAMoHjd+yo1PNqLpw=;
 b=YHI4O5GGM6yTKkUpo1i2rX5dHFAGUsG5R4G1YnDpag8IWGU1huOfrf7LncP69IH+DwzcZk
 mhxHD8aG6fGmIdyKMRmxPNrVRBaqD1T1iM4kWARzTUZsbXgIXXWJC0+VIsDG2k9Yfohn9k
 kIMlAlmhVCuVvi6nFi9+4mCXLTM5nf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-hYyg7iv_OmuU8fgdFDQl2A-1; Tue, 07 Sep 2021 08:43:07 -0400
X-MC-Unique: hYyg7iv_OmuU8fgdFDQl2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0327835DE2;
 Tue,  7 Sep 2021 12:43:06 +0000 (UTC)
Received: from localhost (unknown [10.39.193.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 550E860BE5;
 Tue,  7 Sep 2021 12:43:06 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 09/12] mirror: Check job_is_cancelled() earlier
Date: Tue,  7 Sep 2021 14:42:42 +0200
Message-Id: <20210907124245.143492-10-hreitz@redhat.com>
In-Reply-To: <20210907124245.143492-1-hreitz@redhat.com>
References: <20210907124245.143492-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We must check whether the job is force-cancelled early in our main loop,
most importantly before any `continue` statement.  For example, we used
to have `continue`s before our current checking location that are
triggered by `mirror_flush()` failing.  So, if `mirror_flush()` kept
failing, force-cancelling the job would not terminate it.

Jobs can be cancelled while they yield, and once they are
(force-cancelled), they should not generate new I/O requests.
Therefore, we should put the check after the last yield before
mirror_iteration() is invoked.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/mirror.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 024fa2dcea..bf1d50ff1c 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1000,6 +1000,11 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
 
         job_pause_point(&s->common.job);
 
+        if (job_is_cancelled(&s->common.job)) {
+            ret = 0;
+            goto immediate_exit;
+        }
+
         cnt = bdrv_get_dirty_count(s->dirty_bitmap);
         /* cnt is the number of dirty bytes remaining and s->bytes_in_flight is
          * the number of bytes currently being processed; together those are
@@ -1078,8 +1083,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
             break;
         }
 
-        ret = 0;
-
         if (job_is_ready(&s->common.job) && !should_complete) {
             delay_ns = (s->in_flight == 0 &&
                         cnt == 0 ? BLOCK_JOB_SLICE_TIME : 0);
@@ -1087,9 +1090,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
                                   delay_ns);
         job_sleep_ns(&s->common.job, delay_ns);
-        if (job_is_cancelled(&s->common.job)) {
-            break;
-        }
         s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
     }
 
-- 
2.31.1


