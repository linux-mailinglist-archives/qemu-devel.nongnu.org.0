Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2648645B4D9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:01:53 +0100 (CET)
Received: from localhost ([::1]:34690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmHv-0007uS-HC
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:01:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm2H-0004fC-Cy
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm2C-0004z8-89
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hx5dK9/MJG9Z492GWUGynyAP7wVCMTfypTBTpIvoqAs=;
 b=CNkFcLzFaBpirKUFbUkIUgOpKEvYI3nrVXudYJr1eFodBo9in0XhpF+h1IWcT6BBrEYpzH
 nrIKx9bJg6arCK90k/OJPLuOuB1x9wJK9Neo8+CcatXtjLB+MYLBWIKjvLzzWCp96v5sXm
 ucnA/CAmJGjm2HE9zVn1FEV199F/Qe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-4nMjboEuMwOnpqtU5UmYRg-1; Wed, 24 Nov 2021 01:45:32 -0500
X-MC-Unique: 4nMjboEuMwOnpqtU5UmYRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B47981CCB5;
 Wed, 24 Nov 2021 06:45:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13CE660843;
 Wed, 24 Nov 2021 06:45:30 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 11/31] include/block/blockjob_int.h: split header into I/O
 and GS API
Date: Wed, 24 Nov 2021 01:43:58 -0500
Message-Id: <20211124064418.3120601-12-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Since the I/O functions are not many, keep a single file.
Also split the function pointers in BlockJobDriver.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/blockjob_int.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/block/blockjob_int.h b/include/block/blockjob_int.h
index 6633d83da2..718d7b92d2 100644
--- a/include/block/blockjob_int.h
+++ b/include/block/blockjob_int.h
@@ -38,6 +38,13 @@ struct BlockJobDriver {
     /** Generic JobDriver callbacks and settings */
     JobDriver job_driver;
 
+    /*
+     * I/O API functions. These functions are thread-safe.
+     *
+     * See include/block/block-io.h for more information about
+     * the I/O API.
+     */
+
     /*
      * Returns whether the job has pending requests for the child or will
      * submit new requests before the next pause point. This callback is polled
@@ -46,6 +53,13 @@ struct BlockJobDriver {
      */
     bool (*drained_poll)(BlockJob *job);
 
+    /*
+     * Global state (GS) API. These functions run under the BQL lock.
+     *
+     * See include/block/block-global-state.h for more information about
+     * the GS API.
+     */
+
     /*
      * If the callback is not NULL, it will be invoked before the job is
      * resumed in a new AioContext.  This is the place to move any resources
@@ -56,6 +70,13 @@ struct BlockJobDriver {
     void (*set_speed)(BlockJob *job, int64_t speed);
 };
 
+/*
+ * Global state (GS) API. These functions run under the BQL lock.
+ *
+ * See include/block/block-global-state.h for more information about
+ * the GS API.
+ */
+
 /**
  * block_job_create:
  * @job_id: The id of the newly-created job, or %NULL to have one
@@ -98,6 +119,13 @@ void block_job_free(Job *job);
  */
 void block_job_user_resume(Job *job);
 
+/*
+ * I/O API functions. These functions are thread-safe.
+ *
+ * See include/block/block-io.h for more information about
+ * the I/O API.
+ */
+
 /**
  * block_job_ratelimit_get_delay:
  *
-- 
2.27.0


