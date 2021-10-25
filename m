Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E374393E5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:40:50 +0200 (CEST)
Received: from localhost ([::1]:51876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexPM-0000xM-Ae
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex49-0005On-2f
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:18:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex47-0006tk-4O
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635157129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WPA/p2dWagRIpiYlhK4uwWCg79uRYzRg5ABGy7I7VcY=;
 b=Md9WsiO9WyJRNRYw6xR3WsfroT7Mi+KlP0qlTMf1inF9SGzTwsUNWab4vg/79EFvp94KhD
 6PHSM3A7UbmO+JtRa+QOvOFh8lBVOxm7kGhdzqfa2NJPx5II234AOHtDxpIlVIUq/YYySP
 YDpUFdNBu2KGlufSrEOLKolMae4nkYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-0RJ7oip-ORO_hT4m_QP9UA-1; Mon, 25 Oct 2021 06:18:46 -0400
X-MC-Unique: 0RJ7oip-ORO_hT4m_QP9UA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E4E6362F8;
 Mon, 25 Oct 2021 10:18:45 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03E955D9D5;
 Mon, 25 Oct 2021 10:18:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 10/25] assertions for blockjob_int.h
Date: Mon, 25 Oct 2021 06:17:20 -0400
Message-Id: <20211025101735.2060852-11-eesposit@redhat.com>
In-Reply-To: <20211025101735.2060852-1-eesposit@redhat.com>
References: <20211025101735.2060852-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 blockjob.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/blockjob.c b/blockjob.c
index 4bad1408cb..fbd6c7d873 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -83,6 +83,7 @@ BlockJob *block_job_get(const char *id)
 
 void block_job_free(Job *job)
 {
+    assert(qemu_in_main_thread());
     BlockJob *bjob = container_of(job, BlockJob, job);
 
     block_job_remove_all_bdrv(bjob);
@@ -436,6 +437,8 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     BlockBackend *blk;
     BlockJob *job;
 
+    assert(qemu_in_main_thread());
+
     if (job_id == NULL && !(flags & JOB_INTERNAL)) {
         job_id = bdrv_get_device_name(bs);
     }
@@ -504,6 +507,7 @@ void block_job_iostatus_reset(BlockJob *job)
 
 void block_job_user_resume(Job *job)
 {
+    assert(qemu_in_main_thread());
     BlockJob *bjob = container_of(job, BlockJob, job);
     block_job_iostatus_reset(bjob);
 }
-- 
2.27.0


