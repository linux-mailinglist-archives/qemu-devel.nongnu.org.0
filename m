Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6895A28A2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:33:38 +0200 (CEST)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZSr-00059M-MU
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZH1-0000j0-E9
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZGu-0003xM-Tg
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661520073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zp+q4MM/zCiQqraeSDqSmksIeOzSHcwupgpVrQKebtA=;
 b=Px28lhtaPeqT/q0RmDkP2mB5CuUTxBzmQU/zuDdn1FOj7cnor9yaDidTOa5AoA4a3QpvK/
 I7/Q8sGFAIDn0RZ8LQe6DvS/9Mu1VaAHraLPphDlB8075Uu9svKxA0/Um1mS9FpI0+jNLJ
 78YLPHrj4/5BpzhkqYkAOZAm8SpjNO4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-iwWoiecCPW2c_B4HkXR4QA-1; Fri, 26 Aug 2022 09:21:12 -0400
X-MC-Unique: iwWoiecCPW2c_B4HkXR4QA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99BB8101A54E;
 Fri, 26 Aug 2022 13:21:11 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 473F4492C3B;
 Fri, 26 Aug 2022 13:21:11 +0000 (UTC)
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
Subject: [PATCH v11 10/21] block/mirror.c: use of job helpers in drivers
Date: Fri, 26 Aug 2022 09:20:53 -0400
Message-Id: <20220826132104.3678958-11-eesposit@redhat.com>
In-Reply-To: <20220826132104.3678958-1-eesposit@redhat.com>
References: <20220826132104.3678958-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Once job lock is used and aiocontext is removed, mirror has
to perform job operations under the same critical section,
Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/mirror.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 3c4ab1159d..c6bf7f40ce 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1152,8 +1152,10 @@ static void mirror_complete(Job *job, Error **errp)
     s->should_complete = true;
 
     /* If the job is paused, it will be re-entered when it is resumed */
-    if (!job->paused) {
-        job_enter(job);
+    WITH_JOB_LOCK_GUARD() {
+        if (!job->paused) {
+            job_enter_cond_locked(job, NULL);
+        }
     }
 }
 
@@ -1173,8 +1175,11 @@ static bool mirror_drained_poll(BlockJob *job)
      * from one of our own drain sections, to avoid a deadlock waiting for
      * ourselves.
      */
-    if (!s->common.job.paused && !job_is_cancelled(&job->job) && !s->in_drain) {
-        return true;
+    WITH_JOB_LOCK_GUARD() {
+        if (!s->common.job.paused && !job_is_cancelled_locked(&job->job)
+            && !s->in_drain) {
+            return true;
+        }
     }
 
     return !!s->in_flight;
-- 
2.31.1


