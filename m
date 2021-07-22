Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE053D2362
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:36:12 +0200 (CEST)
Received: from localhost ([::1]:34628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Xvv-0007x3-2f
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m6Xmp-00082c-Dv
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:26:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m6Xmn-0007Vb-CA
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626956804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmGrDvHsecJJ+mqHnEzlHx6wcO3b8Xtcoq4YHifW5Q8=;
 b=N+mUsn0kd9cEOwc7Ma4DDeceQSu4+65sJf3ChwC1TzFRo2D4BDuipGeRJsP7zIYAy7Y6Y8
 66H/1Ih+CZuBYr7+LozM6drO372Znqy4UR+M5RpsDh+C6IaXI81kIgLgnCyGnA3dVkXOYM
 h+6TPEqqadAyB2Kwn/oPHm7PkSoiZWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-ssoSA5C0PSCxDyKMARb9lg-1; Thu, 22 Jul 2021 08:26:41 -0400
X-MC-Unique: ssoSA5C0PSCxDyKMARb9lg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17902190B2B2;
 Thu, 22 Jul 2021 12:26:40 +0000 (UTC)
Received: from localhost (ovpn-112-220.ams2.redhat.com [10.36.112.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1E18385;
 Thu, 22 Jul 2021 12:26:39 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.1? 5/6] mirror: Check job_is_cancelled() earlier
Date: Thu, 22 Jul 2021 14:26:26 +0200
Message-Id: <20210722122627.29605-6-mreitz@redhat.com>
In-Reply-To: <20210722122627.29605-1-mreitz@redhat.com>
References: <20210722122627.29605-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
index 291d2ed040..a993ed37d0 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -995,7 +995,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
             mirror_wait_for_any_operation(s, true);
         }
 
-        if (s->ret < 0) {
+        if (s->ret < 0 || job_is_cancelled(&s->common.job)) {
             ret = s->ret;
             goto immediate_exit;
         }
@@ -1081,17 +1081,12 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
             break;
         }
 
-        ret = 0;
-
         if (s->synced && !should_complete) {
             delay_ns = (s->in_flight == 0 &&
                         cnt == 0 ? BLOCK_JOB_SLICE_TIME : 0);
         }
         trace_mirror_before_sleep(s, cnt, s->synced, delay_ns);
         job_sleep_ns(&s->common.job, delay_ns);
-        if (job_is_cancelled(&s->common.job)) {
-            break;
-        }
         s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
     }
 
-- 
2.31.1


