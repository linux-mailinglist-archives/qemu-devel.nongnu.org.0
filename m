Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11A84CDB52
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:52:06 +0100 (CET)
Received: from localhost ([::1]:37496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQC61-0002EP-Ek
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:52:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6U-00066r-84
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6S-0007cD-NP
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A4RzhRojpr7Dldd+C+yNLHj5nPh+XN9kHYT/DnQGnMQ=;
 b=Sj2rfXW3NQm8L4xV8xfDbxb1+KfMKQQEx1bzrdnAJqwvoYd8JILhaREg+HS6aGaY1ztQG/
 ya95Mt0XoExYsuPgChC8IosTo6snpjTLcEvStCYcj643yEjnGJfSlphDtS7M4kPAD1UuZ4
 Hw897ZtxgvJLo4eZYq03s7qcNEWM8aU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-IBXOnR9sOZiVLr2U1AAN0g-1; Fri, 04 Mar 2022 11:48:25 -0500
X-MC-Unique: IBXOnR9sOZiVLr2U1AAN0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B715180FD71;
 Fri,  4 Mar 2022 16:48:24 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DF7183BF9;
 Fri,  4 Mar 2022 16:48:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 43/50] job.h: split function pointers in JobDriver
Date: Fri,  4 Mar 2022 17:47:04 +0100
Message-Id: <20220304164711.474713-44-kwolf@redhat.com>
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

The job API will be handled separately in another serie.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220303151616.325444-31-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/job.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 6e67b6977f..c105b31076 100644
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
+     * Global state (GS) API. These functions run under the BQL.
+     *
+     * See include/block/block-global-state.h for more information about
+     * the GS API.
+     */
+
     /**
      * Called when the job is resumed by the user (i.e. user_paused becomes
      * false). .user_resume is called before .resume.
-- 
2.35.1


