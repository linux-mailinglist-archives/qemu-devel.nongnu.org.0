Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40A14B2867
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 15:55:43 +0100 (CET)
Received: from localhost ([::1]:33390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIXKo-0007ZG-SJ
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 09:55:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXHl-0003X8-MS
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXHf-0001kt-Us
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644591143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xoN5lRUlgkuKi4+9tGLDAeGiuGc/W2VJKoDREFd6YA0=;
 b=i0+n50ai0zbvvZlsNouU2p/2zchS5WHhawNljID/f0I7Xx78F0WLTyZabMJcX46qSh/h1J
 P1ubGw7zj1KprtYomsy1LhLvnE7sG8Vfq8pDvUNbjp5W+BGc08D8NzTIERqWwHt1aVEtAW
 kBNE6DdFTjkAOe/1dXB1hD11rEwEfJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-vAxvvt-MPAyGoyjjFNkkmw-1; Fri, 11 Feb 2022 09:52:19 -0500
X-MC-Unique: vAxvvt-MPAyGoyjjFNkkmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80714101875E;
 Fri, 11 Feb 2022 14:52:18 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52F487C0E8;
 Fri, 11 Feb 2022 14:52:17 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 16/31] GS and IO CODE macros for blockjob_int.h
Date: Fri, 11 Feb 2022 09:51:38 -0500
Message-Id: <20220211145153.2861415-17-eesposit@redhat.com>
In-Reply-To: <20220211145153.2861415-1-eesposit@redhat.com>
References: <20220211145153.2861415-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 blockjob.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/blockjob.c b/blockjob.c
index 10815a89fe..d79a52d204 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -84,6 +84,7 @@ BlockJob *block_job_get(const char *id)
 void block_job_free(Job *job)
 {
     BlockJob *bjob = container_of(job, BlockJob, job);
+    GLOBAL_STATE_CODE();
 
     block_job_remove_all_bdrv(bjob);
     ratelimit_destroy(&bjob->limit);
@@ -299,6 +300,7 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 
 int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
 {
+    IO_CODE();
     return ratelimit_calculate_delay(&job->limit, n);
 }
 
@@ -434,6 +436,7 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 {
     BlockJob *job;
     int ret;
+    GLOBAL_STATE_CODE();
 
     if (job_id == NULL && !(flags & JOB_INTERNAL)) {
         job_id = bdrv_get_device_name(bs);
@@ -498,6 +501,7 @@ void block_job_iostatus_reset(BlockJob *job)
 void block_job_user_resume(Job *job)
 {
     BlockJob *bjob = container_of(job, BlockJob, job);
+    GLOBAL_STATE_CODE();
     block_job_iostatus_reset(bjob);
 }
 
@@ -505,6 +509,7 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
                                         int is_read, int error)
 {
     BlockErrorAction action;
+    IO_CODE();
 
     switch (on_err) {
     case BLOCKDEV_ON_ERROR_ENOSPC:
-- 
2.31.1


