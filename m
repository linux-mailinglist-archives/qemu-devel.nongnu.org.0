Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200574D85D8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:23:24 +0100 (CET)
Received: from localhost ([::1]:36284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkfS-0004ZU-UB
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:23:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbU-0001N4-Ud
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbR-0006ab-Vc
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647263953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kjw9Nxjqxr/9vvEq1d2PrrSV5wW1BVe9jUPxonmNzko=;
 b=Uvv2vOixCXl57UIhd35iFHThk+UVJN9AjpfWKzGV84eZe9Aw0SkF2NLVO4uRhxv4USnFo0
 90NZvUcYmwOtWrZosskQPV2K3+IJ88Ef7ClNjipRKdbjRpuyf6p9OjzMDvyDBodvw9xYJY
 60bIitGR2zLKOu2ME7vkQlYVGJ9h9MM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-IILUMor1P1qvW0I67Zj9FA-1; Mon, 14 Mar 2022 09:19:07 -0400
X-MC-Unique: IILUMor1P1qvW0I67Zj9FA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E351E3802AC2;
 Mon, 14 Mar 2022 13:19:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A13141686D;
 Mon, 14 Mar 2022 13:19:06 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 09/10] child_job_drained_poll: override polling condition
 only when in home thread
Date: Mon, 14 Mar 2022 09:18:53 -0400
Message-Id: <20220314131854.2202651-10-eesposit@redhat.com>
In-Reply-To: <20220314131854.2202651-1-eesposit@redhat.com>
References: <20220314131854.2202651-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

drv->drained_poll() is only implemented in mirror, and allows
it to drain from within the coroutine. The mirror implementation uses
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
 blockjob.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index 4868453d74..14a919b3cc 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -110,7 +110,9 @@ static bool child_job_drained_poll(BdrvChild *c)
     BlockJob *bjob = c->opaque;
     Job *job = &bjob->job;
     const BlockJobDriver *drv = block_job_driver(bjob);
+    AioContext *ctx;
 
+    ctx = job->aio_context;
     /* An inactive or completed job doesn't have any pending requests. Jobs
      * with !job->busy are either already paused or have a pause point after
      * being reentered, so no job driver code will run before they pause. */
@@ -118,9 +120,14 @@ static bool child_job_drained_poll(BdrvChild *c)
         return false;
     }
 
-    /* Otherwise, assume that it isn't fully stopped yet, but allow the job to
-     * override this assumption. */
-    if (drv->drained_poll) {
+    /*
+     * Otherwise, assume that it isn't fully stopped yet, but allow the job to
+     * override this assumption, if the drain is being performed in the
+     * iothread. We need to check that the caller is the home thread because
+     * it could otherwise lead the main loop to exit polling while the job
+     * has not paused yet.
+     */
+    if (in_aio_context_home_thread(ctx) && drv->drained_poll) {
         return drv->drained_poll(bjob);
     } else {
         return true;
-- 
2.31.1


