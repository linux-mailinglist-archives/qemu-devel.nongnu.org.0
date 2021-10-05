Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC64422BA2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 16:59:57 +0200 (CEST)
Received: from localhost ([::1]:43858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXlvA-0004FF-Lw
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 10:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXy-0004Yz-HF
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXw-0005Wm-Cp
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZaaG8O81IlKfFB8i5VaL1pQdWPfyEk6LSOepzHE6uc=;
 b=H8jlRrMhnlSxsdqo5ZC1TCGrv16momuwX/2dfldgwJTFNgNi6M6c0vnysmYB4hGCzz+iQL
 hv+rZA28z8UkGUp/ZmT+u/rhwg+TwgUbW2WSCFw/yHzdAa9ECDIBWNQyJ8Nk9rNYGmiSMH
 5fr1K78STW+ncDyWJgUlggwZQaVu/J0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-nJXsG3rDM-CF0bUO5yyZSA-1; Tue, 05 Oct 2021 10:35:54 -0400
X-MC-Unique: nJXsG3rDM-CF0bUO5yyZSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 610F11084684;
 Tue,  5 Oct 2021 14:35:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33D151045D05;
 Tue,  5 Oct 2021 14:35:52 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 24/25] job.h: split function pointers in JobDriver
Date: Tue,  5 Oct 2021 10:32:14 -0400
Message-Id: <20211005143215.29500-25-eesposit@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The job API will be handled separately in another serie.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 41162ed494..c236c43026 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -169,12 +169,21 @@ typedef struct Job {
  * Callbacks and other information about a Job driver.
  */
 struct JobDriver {
+
+    /* Fields initialized in struct definition and never changed. */
+
     /** Derived Job struct size */
     size_t instance_size;
 
     /** Enum describing the operation */
     JobType job_type;
 
+    /*
+     * I/O API functions. These functions are thread-safe, and therefore
+     * can run in any thread as long as they have called
+     * aio_context_acquire/release().
+     */
+
     /**
      * Mandatory: Entrypoint for the Coroutine.
      *
@@ -201,6 +210,28 @@ struct JobDriver {
      */
     void coroutine_fn (*resume)(Job *job);
 
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
     /**
      * Called when the job is resumed by the user (i.e. user_paused becomes
      * false). .user_resume is called before .resume.
-- 
2.27.0


