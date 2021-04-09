Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B52935A34F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:28:40 +0200 (CEST)
Received: from localhost ([::1]:35134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtzq-0007Uv-Pd
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnz-0007sX-Ni
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnq-0003Ot-Ns
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617984972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=envdenWhikru72pinNtwLZrRiTerRxbNv4jonq+HG1k=;
 b=ZyxPQ1BcH5ImE65kHwDXJFoRk9nBk2r9hkVIxJf/9I4qIc6EPorMtpZ+FrMEqIbJiBI6rm
 mb4CXJhW4Zppa2o3SbLSDWwZV2IkH1QbQYBlfQQnq7TDxe4tnILqn6C5X+GXdjWgMPA2YD
 ygd0Ar7btbX4L5j2a1uAYLM7B019Mdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-47TvgiSHM2e5VfiFRcKsYA-1; Fri, 09 Apr 2021 12:16:09 -0400
X-MC-Unique: 47TvgiSHM2e5VfiFRcKsYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EA2610CE780;
 Fri,  9 Apr 2021 16:16:08 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-63.ams2.redhat.com [10.36.115.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CF9C5D6A1;
 Fri,  9 Apr 2021 16:16:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/10] mirror: Do not enter a paused job on completion
Date: Fri,  9 Apr 2021 18:15:46 +0200
Message-Id: <20210409161548.341297-9-kwolf@redhat.com>
In-Reply-To: <20210409161548.341297-1-kwolf@redhat.com>
References: <20210409161548.341297-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Currently, it is impossible to complete jobs on standby (i.e. paused
ready jobs), but actually the only thing in mirror_complete() that does
not work quite well with a paused job is the job_enter() at the end.

If we make it conditional, this function works just fine even if the
mirror job is paused.

So technically this is a no-op, but obviously the intention is to accept
block-job-complete even for jobs on standby, which we need this patch
for first.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210409120422.144040-3-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/mirror.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/mirror.c b/block/mirror.c
index f1f936bf1a..5a71bd8bbc 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1148,7 +1148,11 @@ static void mirror_complete(Job *job, Error **errp)
     }
 
     s->should_complete = true;
-    job_enter(job);
+
+    /* If the job is paused, it will be re-entered when it is resumed */
+    if (!job->paused) {
+        job_enter(job);
+    }
 }
 
 static void coroutine_fn mirror_pause(Job *job)
-- 
2.30.2


