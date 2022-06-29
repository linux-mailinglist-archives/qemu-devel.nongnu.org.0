Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A921F5603A0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 16:51:08 +0200 (CEST)
Received: from localhost ([::1]:52908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Z23-0007AW-Fm
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 10:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o6YU8-000814-8V
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 10:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o6YTx-00026A-O5
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 10:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656512153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=onSpRKVFNRnC1visFTu1hPTv/cFs0iPy6zmldJBqPI8=;
 b=TwQAwmZg/pYq01g0+hYHEDLgtG+g+eDEnoQg2jotieyVyknykcC35LdEFT704ii6bZT8XL
 05AT2lZI+Kx20pR1V8vE+muz0e5VKYpYdJWhcX45HMI//i5KbKtV4wAFEdAWXhV95hSHfv
 r53lYPMxEntl6J5auXKWxROUgtP9sD4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-hpXgYvdyMXOBlU-kV7Sz5w-1; Wed, 29 Jun 2022 10:15:47 -0400
X-MC-Unique: hpXgYvdyMXOBlU-kV7Sz5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58FC51C006BE;
 Wed, 29 Jun 2022 14:15:47 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0966E18EAA;
 Wed, 29 Jun 2022 14:15:47 +0000 (UTC)
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
Subject: [PATCH v8 12/20] block/mirror.c: use of job helpers in drivers to
 avoid TOC/TOU
Date: Wed, 29 Jun 2022 10:15:30 -0400
Message-Id: <20220629141538.3400679-13-eesposit@redhat.com>
In-Reply-To: <20220629141538.3400679-1-eesposit@redhat.com>
References: <20220629141538.3400679-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Once job lock is used and aiocontext is removed, mirror has
to perform job operations under the same critical section,
using the helpers prepared in previous commit.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/mirror.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index d8ecb9efa2..b38676e19d 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -654,9 +654,13 @@ static int mirror_exit_common(Job *job)
     BlockDriverState *target_bs;
     BlockDriverState *mirror_top_bs;
     Error *local_err = NULL;
-    bool abort = job->ret < 0;
+    bool abort;
     int ret = 0;
 
+    WITH_JOB_LOCK_GUARD() {
+        abort = job->ret < 0;
+    }
+
     if (s->prepared) {
         return 0;
     }
@@ -1152,8 +1156,10 @@ static void mirror_complete(Job *job, Error **errp)
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
 
@@ -1173,8 +1179,11 @@ static bool mirror_drained_poll(BlockJob *job)
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


