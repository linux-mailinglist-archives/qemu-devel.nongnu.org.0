Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA2742A0C1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 11:11:06 +0200 (CEST)
Received: from localhost ([::1]:43462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maDoP-00021M-DR
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 05:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1maDUb-0006Gy-3J
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:50:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1maDUU-0002wM-UL
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634028629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E09Pplj9O2RgDKrJ4Zh6DdZMYsu4GGH9LKpEBxPHwXU=;
 b=jTy+J045WDspk4I8MC2oKTisd35en8u5XMq4gP5H+tmUbJAwZ/6fnsZu34RDdO7e6YwV+W
 GsVS5yFNBFcVz7RH06YZjq0UTNLaXT6uG7Ww3WNn9K7jLmc7voGOxYeuKNbf7hhq9PFz6Y
 0khoZAiREAlnqCTpjfuqnec1OnnRpV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-Bet5gvaPOjOq91S9gvelhg-1; Tue, 12 Oct 2021 04:50:26 -0400
X-MC-Unique: Bet5gvaPOjOq91S9gvelhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2C0B800471;
 Tue, 12 Oct 2021 08:50:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B5DA6788C;
 Tue, 12 Oct 2021 08:49:59 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 12/25] assertions for blockob.h global state API
Date: Tue, 12 Oct 2021 04:48:53 -0400
Message-Id: <20211012084906.2060507-13-eesposit@redhat.com>
In-Reply-To: <20211012084906.2060507-1-eesposit@redhat.com>
References: <20211012084906.2060507-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 blockjob.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/blockjob.c b/blockjob.c
index fbd6c7d873..4982f6a2b5 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -61,6 +61,7 @@ static bool is_block_job(Job *job)
 
 BlockJob *block_job_next(BlockJob *bjob)
 {
+    assert(qemu_in_main_thread());
     Job *job = bjob ? &bjob->job : NULL;
 
     do {
@@ -72,6 +73,7 @@ BlockJob *block_job_next(BlockJob *bjob)
 
 BlockJob *block_job_get(const char *id)
 {
+    assert(qemu_in_main_thread());
     Job *job = job_get(id);
 
     if (job && is_block_job(job)) {
@@ -185,6 +187,7 @@ static const BdrvChildClass child_job = {
 
 void block_job_remove_all_bdrv(BlockJob *job)
 {
+    assert(qemu_in_main_thread());
     /*
      * bdrv_root_unref_child() may reach child_job_[can_]set_aio_ctx(),
      * which will also traverse job->nodes, so consume the list one by
@@ -207,6 +210,7 @@ void block_job_remove_all_bdrv(BlockJob *job)
 bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs)
 {
     GSList *el;
+    assert(qemu_in_main_thread());
 
     for (el = job->nodes; el; el = el->next) {
         BdrvChild *c = el->data;
@@ -223,6 +227,7 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
 {
     BdrvChild *c;
     bool need_context_ops;
+    assert(qemu_in_main_thread());
 
     bdrv_ref(bs);
 
@@ -272,6 +277,8 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     const BlockJobDriver *drv = block_job_driver(job);
     int64_t old_speed = job->speed;
 
+    assert(qemu_in_main_thread());
+
     if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp) < 0) {
         return false;
     }
@@ -309,6 +316,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
     BlockJobInfo *info;
     uint64_t progress_current, progress_total;
 
+    assert(qemu_in_main_thread());
+
     if (block_job_is_internal(job)) {
         error_setg(errp, "Cannot query QEMU internal jobs");
         return NULL;
@@ -498,6 +507,7 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
 void block_job_iostatus_reset(BlockJob *job)
 {
+    assert(qemu_in_main_thread());
     if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
         return;
     }
-- 
2.27.0


