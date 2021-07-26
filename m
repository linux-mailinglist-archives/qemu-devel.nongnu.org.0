Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C5E3D5C39
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:54:08 +0200 (CEST)
Received: from localhost ([::1]:50170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81zb-0005tc-HB
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m81sJ-00021S-OP
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:46:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m81sG-0007Xv-KE
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627310792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i5Vvs73w3ZLOkAZsr5dqanHRTQ6XAXl0neO1MTKmn7I=;
 b=ZYocSUcAVhMn1gM/v49vb9FpT/2sW0GQTPvqFBw7/gDEi0BqP3sji92StOT5UeUaPir+vJ
 ecdQVeGpcZ0BrIgKQAtwGTVllK7QExGy3T8XuUgPuS3EGS9RyFJXvN1Qn3PibDmhLR8uD+
 tuLgaMbQ0dRXADxQO52S31jAjyzdG6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315--8jYnVm7PPyK5AoxWO_BVw-1; Mon, 26 Jul 2021 10:46:30 -0400
X-MC-Unique: -8jYnVm7PPyK5AoxWO_BVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A26C192CC40;
 Mon, 26 Jul 2021 14:46:29 +0000 (UTC)
Received: from localhost (ovpn-112-179.ams2.redhat.com [10.36.112.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EAA716D28;
 Mon, 26 Jul 2021 14:46:29 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.1? v2 6/7] mirror: Check job_is_cancelled() earlier
Date: Mon, 26 Jul 2021 16:46:12 +0200
Message-Id: <20210726144613.954844-7-mreitz@redhat.com>
In-Reply-To: <20210726144613.954844-1-mreitz@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We must check whether the job is force-cancelled early in our main loop,
most importantly before any `continue` statement.  For example, we used
to have `continue`s before our current checking location that are
triggered by `mirror_flush()` failing.  So, if `mirror_flush()` kept
failing, force-cancelling the job would not terminate it.

A job being force-cancelled should be treated the same as the job having
failed, so put the check in the same place where we check `s->ret < 0`.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/mirror.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 72e02fa34e..46d1a1e5a2 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -993,7 +993,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
             mirror_wait_for_any_operation(s, true);
         }
 
-        if (s->ret < 0) {
+        if (s->ret < 0 || job_is_cancelled(&s->common.job)) {
             ret = s->ret;
             goto immediate_exit;
         }
@@ -1078,8 +1078,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
             break;
         }
 
-        ret = 0;
-
         if (job_is_ready(&s->common.job) && !should_complete) {
             delay_ns = (s->in_flight == 0 &&
                         cnt == 0 ? BLOCK_JOB_SLICE_TIME : 0);
@@ -1087,9 +1085,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
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


