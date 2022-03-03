Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C22E4CC17B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:37:15 +0100 (CET)
Received: from localhost ([::1]:53066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnVy-0004C9-Db
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:37:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnEN-0007Ir-0I
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:19:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnEJ-0006Cr-TW
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646320737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Al/v0BBCXY66ByNPmP47e+LLlHdqCvgow5fPuXLRAVg=;
 b=ItRLH7rmCqd0HGXkDc3oo1doSBpFCWKyPLfEvJ/nZx7h5pptGxm6dnueOfbw6CllfCpijf
 Z8vJxBMGfp7iPtFjyOjtMvpPnv4On4BkIPwbZlmpiDreSSNpWz5aja+6n4E/V8LypvdRvA
 cNoncaWTC3iixUjwl3QadVwk/WCdTFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-RjbbtNW2NHSH0qrD5qCwsw-1; Thu, 03 Mar 2022 10:18:54 -0500
X-MC-Unique: RjbbtNW2NHSH0qrD5qCwsw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 023D751F0;
 Thu,  3 Mar 2022 15:18:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB9CD7BCDC;
 Thu,  3 Mar 2022 15:18:51 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 19/31] assertions for blockjob.h global state API
Date: Thu,  3 Mar 2022 10:16:04 -0500
Message-Id: <20220303151616.325444-20-eesposit@redhat.com>
In-Reply-To: <20220303151616.325444-1-eesposit@redhat.com>
References: <20220303151616.325444-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockjob.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/blockjob.c b/blockjob.c
index d79a52d204..4868453d74 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -62,6 +62,7 @@ static bool is_block_job(Job *job)
 BlockJob *block_job_next(BlockJob *bjob)
 {
     Job *job = bjob ? &bjob->job : NULL;
+    GLOBAL_STATE_CODE();
 
     do {
         job = job_next(job);
@@ -73,6 +74,7 @@ BlockJob *block_job_next(BlockJob *bjob)
 BlockJob *block_job_get(const char *id)
 {
     Job *job = job_get(id);
+    GLOBAL_STATE_CODE();
 
     if (job && is_block_job(job)) {
         return container_of(job, BlockJob, job);
@@ -184,6 +186,7 @@ static const BdrvChildClass child_job = {
 
 void block_job_remove_all_bdrv(BlockJob *job)
 {
+    GLOBAL_STATE_CODE();
     /*
      * bdrv_root_unref_child() may reach child_job_[can_]set_aio_ctx(),
      * which will also traverse job->nodes, so consume the list one by
@@ -206,6 +209,7 @@ void block_job_remove_all_bdrv(BlockJob *job)
 bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs)
 {
     GSList *el;
+    GLOBAL_STATE_CODE();
 
     for (el = job->nodes; el; el = el->next) {
         BdrvChild *c = el->data;
@@ -222,6 +226,7 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
 {
     BdrvChild *c;
     bool need_context_ops;
+    GLOBAL_STATE_CODE();
 
     bdrv_ref(bs);
 
@@ -271,6 +276,8 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     const BlockJobDriver *drv = block_job_driver(job);
     int64_t old_speed = job->speed;
 
+    GLOBAL_STATE_CODE();
+
     if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp) < 0) {
         return false;
     }
@@ -309,6 +316,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
     BlockJobInfo *info;
     uint64_t progress_current, progress_total;
 
+    GLOBAL_STATE_CODE();
+
     if (block_job_is_internal(job)) {
         error_setg(errp, "Cannot query QEMU internal jobs");
         return NULL;
@@ -491,6 +500,7 @@ fail:
 
 void block_job_iostatus_reset(BlockJob *job)
 {
+    GLOBAL_STATE_CODE();
     if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
         return;
     }
@@ -548,5 +558,6 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
 
 AioContext *block_job_get_aio_context(BlockJob *job)
 {
+    GLOBAL_STATE_CODE();
     return job->job.aio_context;
 }
-- 
2.31.1


