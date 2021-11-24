Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61D645B54A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:22:46 +0100 (CET)
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmc9-0001bL-Ng
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:22:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3X-0005b4-28
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:46:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3V-0005FH-1S
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvw/zxmM9vZp+KKqQvlPg0oGyfq7qo2hLrXkNBeNwDA=;
 b=VKTW1BJhAvya2Eoi8vfeI31GZkeORxNH3SDpvcpw9oYFmy0o/KhLpnojtjzxJN3WmO8k52
 BJeTqCvI/gakYQ9D2XjMptv7HMMqFjgdpeoSEPEpL91/0b4jMy5nhjcHsgHDa/pNQAQEgF
 siXlLMavoxSyCwScqGbcfbLrJ6mztvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-1AfQiGhNPZCbXy6A08iRaw-1; Wed, 24 Nov 2021 01:46:55 -0500
X-MC-Unique: 1AfQiGhNPZCbXy6A08iRaw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB94181CCB4;
 Wed, 24 Nov 2021 06:46:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 328EF60843;
 Wed, 24 Nov 2021 06:46:50 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 26/31] job.h: split function pointers in JobDriver
Date: Wed, 24 Nov 2021 01:44:13 -0500
Message-Id: <20211124064418.3120601-27-eesposit@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The job API will be handled separately in another serie.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 6e67b6977f..4ea7a4a0cd 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -169,6 +169,12 @@ typedef struct Job {
  * Callbacks and other information about a Job driver.
  */
 struct JobDriver {
+
+    /*
+     * These fields are initialized when this object is created,
+     * and are never changed afterwards
+     */
+
     /** Derived Job struct size */
     size_t instance_size;
 
@@ -184,9 +190,18 @@ struct JobDriver {
      * aborted. If it returns zero, the job moves into the WAITING state. If it
      * is the last job to complete in its transaction, all jobs in the
      * transaction move from WAITING to PENDING.
+     *
+     * This callback must be run in the job's context.
      */
     int coroutine_fn (*run)(Job *job, Error **errp);
 
+    /*
+     * Functions run without regard to the BQL that may run in any
+     * arbitrary thread. These functions do not need to be thread-safe
+     * because the caller ensures that they are invoked from one
+     * thread at time.
+     */
+
     /**
      * If the callback is not NULL, it will be invoked when the job transitions
      * into the paused state.  Paused jobs must not perform any asynchronous
@@ -201,6 +216,13 @@ struct JobDriver {
      */
     void coroutine_fn (*resume)(Job *job);
 
+    /*
+     * Global state (GS) API. These functions run under the BQL lock.
+     *
+     * See include/block/block-global-state.h for more information about
+     * the GS API.
+     */
+
     /**
      * Called when the job is resumed by the user (i.e. user_paused becomes
      * false). .user_resume is called before .resume.
-- 
2.27.0


