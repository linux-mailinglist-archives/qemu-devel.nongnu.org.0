Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D1348547E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:27:55 +0100 (CET)
Received: from localhost ([::1]:57316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57Gc-0008Br-ME
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:27:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56sW-0008Tj-7k
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:03:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56sU-0007Du-8b
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641391377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZ/SOkR+4Hg9csWNBf100L1EOqqRsNqhmnwutq86Fmk=;
 b=GfrmHqNh08Arlc7TD0ybICMjnLmE9aZuUBTilEfbJD0gYsxxwyrEn7JPX3ezT4vyD+/9OZ
 fPXCTOpqJdSssF4kH20jxc3cx+5+rCA59mMel3fZAVJ9cWakt3dB1F/1CwQ/1cP7+uCZfU
 7bHkDta6yHDSkSfmNpv63w9tWOU/cKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-h-uyjKypMBOGgx803tfYiQ-1; Wed, 05 Jan 2022 09:02:54 -0500
X-MC-Unique: h-uyjKypMBOGgx803tfYiQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D283190A7BD;
 Wed,  5 Jan 2022 14:02:47 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44C6C2B5AC;
 Wed,  5 Jan 2022 14:02:46 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 05/16] block/mirror.c: use of job helpers in drivers to
 avoid TOC/TOU
Date: Wed,  5 Jan 2022 09:01:57 -0500
Message-Id: <20220105140208.365608-6-eesposit@redhat.com>
In-Reply-To: <20220105140208.365608-1-eesposit@redhat.com>
References: <20220105140208.365608-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Once job lock is used and aiocontext is removed, mirror has
to perform job operations under the same critical section,
using the helpers prepared in previous commit.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/mirror.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 00089e519b..41450df55c 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -653,9 +653,13 @@ static int mirror_exit_common(Job *job)
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
@@ -1161,8 +1165,10 @@ static void mirror_complete(Job *job, Error **errp)
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
 
@@ -1182,8 +1188,11 @@ static bool mirror_drained_poll(BlockJob *job)
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


