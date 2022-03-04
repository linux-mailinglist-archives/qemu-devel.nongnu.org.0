Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384CB4CDA27
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:21:21 +0100 (CET)
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBcG-0006gL-9h
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:21:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB61-0005b9-Nh
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5y-0007TP-0w
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iwl2q+/A5l47sFL6ZpV0Q5lFWec4Qp9vSKIYqP+Wuuc=;
 b=AgB2IyYwspNpSl8UYQZlJXoORS3YTudm6fDlszyGepFMrTP6vTZgVL5eUJbCQFk1/+FU8i
 oUbbWGGwn3+s9QaKvJJe3cMl099WV4M8/pPUMK4eS8Ge/cEAiX4ADWLEKHLgx2Sn/gcPD3
 msRQFY6jPVaZZC3AxOC40abpptZoJ6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-a9ahtOpdNzWNXQF6qpsZHA-1; Fri, 04 Mar 2022 11:47:56 -0500
X-MC-Unique: a9ahtOpdNzWNXQF6qpsZHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D3531091DA0;
 Fri,  4 Mar 2022 16:47:55 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52AF183BF9;
 Fri,  4 Mar 2022 16:47:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 29/50] GS and IO CODE macros for blockjob_int.h
Date: Fri,  4 Mar 2022 17:46:50 +0100
Message-Id: <20220304164711.474713-30-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220303151616.325444-17-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.35.1


