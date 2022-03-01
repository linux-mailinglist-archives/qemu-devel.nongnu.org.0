Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B8D4C8DA0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:25:54 +0100 (CET)
Received: from localhost ([::1]:49736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3Rp-0005D3-EI
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:25:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nP3NY-0000SM-1F
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:21:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nP3NW-00074e-DI
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646144485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5f+rQLg9LhPIHUAod7Xj2CQqVzU5134kG9U/8ZVgRw=;
 b=NGGn/aBkDx92aWnvVjRl81rFvSbTE11bOxyTISXFpMRkpsTSuiqu8yY9eDqvq97IET4R0+
 BsmYguA9QLCAbCeG4z48MD28s0+QUldssIDE5As1230K4h3UMmk5MotSrsRaiYJJ1c2PsN
 fKpKTMHfRWAccwfC9rjTrWZkY8zFf9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-Sg7mSfJyOrW48NWaxYCc-A-1; Tue, 01 Mar 2022 09:21:23 -0500
X-MC-Unique: Sg7mSfJyOrW48NWaxYCc-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0751F801DDB;
 Tue,  1 Mar 2022 14:21:22 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42DED866CD;
 Tue,  1 Mar 2022 14:21:21 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 4/5] child_job_drained_poll: override polling condition
 only when in home thread
Date: Tue,  1 Mar 2022 09:21:12 -0500
Message-Id: <20220301142113.163174-5-eesposit@redhat.com>
In-Reply-To: <20220301142113.163174-1-eesposit@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

drv->drained_poll() is only implemented in mirror, and allows
it to drain from the coroutine. The mirror implementation uses
in_drain flag to recognize when it is draining from coroutine,
and consequently avoid deadlocking (wait the poll condition in
child_job_drained_poll to wait for itself).

The problem is that this flag is dangerous, because it breaks
bdrv_drained_begin() invariants: once drained_begin ends, all
jobs, in_flight requests, and anything running in the iothread
are blocked.

This can be broken in such way:
iothread(mirror): s->in_drain = true; // mirror.c:1112
main loop: bdrv_drained_begin(mirror_bs);
/*
 * drained_begin wait for bdrv_drain_poll_top_level() condition,
 * that translates in child_job_drained_poll() for jobs, but
 * mirror implements drv->drained_poll() so it returns
 * !!in_flight_requests, which his 0 (assertion in mirror.c:1105).
 */
main loop: thinks iothread is stopped and is modifying the graph...
iothread(mirror): *continues*, as nothing is stopping it
iothread(mirror): bdrv_drained_begin(bs);
/* draining reads the graph while it is modified!! */
main loop: done modifying the graph...

In order to fix this, we can simply allow drv->drained_poll()
to be called only by the iothread, and not the main loop.
We distinguish it by using in_aio_context_home_thread(), that
returns false if @ctx is not the same as the thread that runs it.

Co-Developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockjob.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/blockjob.c b/blockjob.c
index 10815a89fe..e132d9587e 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -107,6 +107,7 @@ static bool child_job_drained_poll(BdrvChild *c)
     BlockJob *bjob = c->opaque;
     Job *job = &bjob->job;
     const BlockJobDriver *drv = block_job_driver(bjob);
+    AioContext *ctx = block_job_get_aio_context(bjob);
 
     /* An inactive or completed job doesn't have any pending requests. Jobs
      * with !job->busy are either already paused or have a pause point after
@@ -117,7 +118,7 @@ static bool child_job_drained_poll(BdrvChild *c)
 
     /* Otherwise, assume that it isn't fully stopped yet, but allow the job to
      * override this assumption. */
-    if (drv->drained_poll) {
+    if (in_aio_context_home_thread(ctx) && drv->drained_poll) {
         return drv->drained_poll(bjob);
     } else {
         return true;
-- 
2.31.1


