Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822EA45B4B4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 07:56:50 +0100 (CET)
Received: from localhost ([::1]:52768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmD3-0000dN-Jc
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 01:56:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm2H-0004fq-K2
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm2D-00050B-DP
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KtUEI83tocQr1oNWL2C69TochNEGFpQLiERI+L3k70o=;
 b=QyNE3Z76T6Qz8YmVBdwsCuGsueGkzKaemIyzgZCoDQlNQNwQyxfalEy5BZ+fm9i7tRAtm8
 g7EVeT6XwNinxMVxdG10F4ZgmmlQnjxpxZolr6jWJ/Dc9Ia5jwWLOY/AUF4oXj4ar98DOi
 7DizVVuS6XGtYbeSBYV0HTJD7LtmcNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-bTW2buYYMp66PtOwK-CwPA-1; Wed, 24 Nov 2021 01:45:33 -0500
X-MC-Unique: bTW2buYYMp66PtOwK-CwPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C00D18460E6;
 Wed, 24 Nov 2021 06:45:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 552652B0B8;
 Wed, 24 Nov 2021 06:45:31 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 12/31] assertions for blockjob_int.h
Date: Wed, 24 Nov 2021 01:43:59 -0500
Message-Id: <20211124064418.3120601-13-eesposit@redhat.com>
In-Reply-To: <20211124064418.3120601-1-eesposit@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 blockjob.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/blockjob.c b/blockjob.c
index 4bad1408cb..10c807413e 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -84,6 +84,7 @@ BlockJob *block_job_get(const char *id)
 void block_job_free(Job *job)
 {
     BlockJob *bjob = container_of(job, BlockJob, job);
+    assert(qemu_in_main_thread());
 
     block_job_remove_all_bdrv(bjob);
     blk_unref(bjob->blk);
@@ -436,6 +437,8 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     BlockBackend *blk;
     BlockJob *job;
 
+    assert(qemu_in_main_thread());
+
     if (job_id == NULL && !(flags & JOB_INTERNAL)) {
         job_id = bdrv_get_device_name(bs);
     }
@@ -505,6 +508,7 @@ void block_job_iostatus_reset(BlockJob *job)
 void block_job_user_resume(Job *job)
 {
     BlockJob *bjob = container_of(job, BlockJob, job);
+    assert(qemu_in_main_thread());
     block_job_iostatus_reset(bjob);
 }
 
-- 
2.27.0


