Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFDD422B8B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 16:55:06 +0200 (CEST)
Received: from localhost ([::1]:60660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXlqT-0004rX-Ee
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 10:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlX9-0003Iq-8C
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlX1-0004gt-Ry
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VXQ0943rYVNPxRJFPwjFcqM+GaHXm++hO9CmecVP9zk=;
 b=IF/izj+UUrGgC3bHmroH6s4rbpJpp//0PJgVlwnwF609W0o+pCFYPa25p1Zq89jIgMvjj1
 Mc+5qiwzKBg1clHXntUggUdnIG5h94SzT91+4tI4C5cvxrFIGL/lzS3TqlkcyBytLFRt5t
 s/IhNicOXIDVMUP2j9ypprqkdNg+wSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-UvRbiH0IOie4qAzFim_Y2g-1; Tue, 05 Oct 2021 10:34:58 -0400
X-MC-Unique: UvRbiH0IOie4qAzFim_Y2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ED462E7A;
 Tue,  5 Oct 2021 14:34:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E40701002391;
 Tue,  5 Oct 2021 14:34:55 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 09/25] include/block/blockjob_int.h: split header into
 I/O and GS API
Date: Tue,  5 Oct 2021 10:31:59 -0400
Message-Id: <20211005143215.29500-10-eesposit@redhat.com>
In-Reply-To: <20211005143215.29500-1-eesposit@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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

Since the I/O functions are not many, keep a single file.
Also split the function pointers in BlockJobDriver.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/blockjob_int.h | 55 ++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/include/block/blockjob_int.h b/include/block/blockjob_int.h
index 6633d83da2..bac4e8f46d 100644
--- a/include/block/blockjob_int.h
+++ b/include/block/blockjob_int.h
@@ -38,6 +38,12 @@ struct BlockJobDriver {
     /** Generic JobDriver callbacks and settings */
     JobDriver job_driver;
 
+    /*
+     * I/O API functions. These functions are thread-safe, and therefore
+     * can run in any thread as long as they have called
+     * aio_context_acquire/release().
+     */
+
     /*
      * Returns whether the job has pending requests for the child or will
      * submit new requests before the next pause point. This callback is polled
@@ -46,6 +52,28 @@ struct BlockJobDriver {
      */
     bool (*drained_poll)(BlockJob *job);
 
+    /*
+     * Global state (GS) API. These functions run under the BQL lock.
+     *
+     * If a function modifies the graph, it also uses drain and/or
+     * aio_context_acquire/release to be sure it has unique access.
+     * aio_context locking is needed together with BQL because of
+     * the thread-safe I/O API that concurrently runs and accesses
+     * the graph without the BQL.
+     *
+     * It is important to note that not all of these functions are
+     * necessarily limited to running under the BQL, but they would
+     * require additional auditing and may small thread-safety changes
+     * to move them into the I/O API. Often it's not worth doing that
+     * work since the APIs are only used with the BQL held at the
+     * moment, so they have been placed in the GS API (for now).
+     *
+     * All callers that use these function pointers must
+     * use this assertion:
+     * g_assert(qemu_in_main_thread());
+     * to catch when they are accidentally called without the BQL.
+     */
+
     /*
      * If the callback is not NULL, it will be invoked before the job is
      * resumed in a new AioContext.  This is the place to move any resources
@@ -56,6 +84,27 @@ struct BlockJobDriver {
     void (*set_speed)(BlockJob *job, int64_t speed);
 };
 
+/*
+ * Global state (GS) API. These functions run under the BQL lock.
+ *
+ * If a function modifies the graph, it also uses drain and/or
+ * aio_context_acquire/release to be sure it has unique access.
+ * aio_context locking is needed together with BQL because of
+ * the thread-safe I/O API that concurrently runs and accesses
+ * the graph without the BQL.
+ *
+ * It is important to note that not all of these functions are
+ * necessarily limited to running under the BQL, but they would
+ * require additional auditing and may small thread-safety changes
+ * to move them into the I/O API. Often it's not worth doing that
+ * work since the APIs are only used with the BQL held at the
+ * moment, so they have been placed in the GS API (for now).
+ *
+ * All functions below must use this assertion:
+ * g_assert(qemu_in_main_thread());
+ * to catch when they are accidentally called without the BQL.
+ */
+
 /**
  * block_job_create:
  * @job_id: The id of the newly-created job, or %NULL to have one
@@ -98,6 +147,12 @@ void block_job_free(Job *job);
  */
 void block_job_user_resume(Job *job);
 
+/*
+ * I/O API functions. These functions are thread-safe, and therefore
+ * can run in any thread as long as they have called
+ * aio_context_acquire/release().
+ */
+
 /**
  * block_job_ratelimit_get_delay:
  *
-- 
2.27.0


