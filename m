Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AB55A28AE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:34:39 +0200 (CEST)
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZTq-00087e-Sy
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZH8-00013I-Cp
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZGx-0003zY-1S
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661520078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7E7FE+LhZ+NHyRNMywoPpolP8FJ9rrZkHKcD5djleQ=;
 b=cCN07UJJbLG0iMlp7EKJ4geBjy1HsYcD4dchN05xOO5pvzk6NMjRbcaMs6mK5zuHWm76F8
 uY0Ae+cuwoagmn55q5KLoGvW3jJyg3Vl1vANGx0J7V3kN3GcluOBhmLT6XETERBMW5GfsF
 10SK+c5UtmD9g5CaIRGHRZgbxDiZMmY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-Aa1JaN8POLuNP-mbmiEr-A-1; Fri, 26 Aug 2022 09:21:14 -0400
X-MC-Unique: Aa1JaN8POLuNP-mbmiEr-A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E90A185A794;
 Fri, 26 Aug 2022 13:21:14 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2389492C3B;
 Fri, 26 Aug 2022 13:21:13 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v11 17/21] job.h: categorize JobDriver callbacks that need the
 AioContext lock
Date: Fri, 26 Aug 2022 09:21:00 -0400
Message-Id: <20220826132104.3678958-18-eesposit@redhat.com>
In-Reply-To: <20220826132104.3678958-1-eesposit@redhat.com>
References: <20220826132104.3678958-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some callbacks implementation use bdrv_* APIs that assume the
AioContext lock is held. Make sure this invariant is documented.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job.h | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index cede227e67..b24aa89737 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -65,7 +65,11 @@ typedef struct Job {
     /** True if this job should automatically dismiss itself */
     bool auto_dismiss;
 
-    /** The completion function that will be called when the job completes.  */
+    /**
+     * The completion function that will be called when the job completes.
+     * Called with AioContext lock held, since many callback implementations
+     * use bdrv_* functions that require to hold the lock.
+     */
     BlockCompletionFunc *cb;
 
     /** The opaque value that is passed to the completion function.  */
@@ -260,6 +264,9 @@ struct JobDriver {
      *
      * This callback will not be invoked if the job has already failed.
      * If it fails, abort and then clean will be called.
+     *
+     * Called with AioContext lock held, since many callbacs implementations
+     * use bdrv_* functions that require to hold the lock.
      */
     int (*prepare)(Job *job);
 
@@ -270,6 +277,9 @@ struct JobDriver {
      *
      * All jobs will complete with a call to either .commit() or .abort() but
      * never both.
+     *
+     * Called with AioContext lock held, since many callback implementations
+     * use bdrv_* functions that require to hold the lock.
      */
     void (*commit)(Job *job);
 
@@ -280,6 +290,9 @@ struct JobDriver {
      *
      * All jobs will complete with a call to either .commit() or .abort() but
      * never both.
+     *
+     * Called with AioContext lock held, since many callback implementations
+     * use bdrv_* functions that require to hold the lock.
      */
     void (*abort)(Job *job);
 
@@ -288,6 +301,9 @@ struct JobDriver {
      * .commit() or .abort(). Regardless of which callback is invoked after
      * completion, .clean() will always be called, even if the job does not
      * belong to a transaction group.
+     *
+     * Called with AioContext lock held, since many callbacs implementations
+     * use bdrv_* functions that require to hold the lock.
      */
     void (*clean)(Job *job);
 
@@ -302,11 +318,18 @@ struct JobDriver {
      * READY).
      * (If the callback is NULL, the job is assumed to terminate
      * without I/O.)
+     *
+     * Called with AioContext lock held, since many callback implementations
+     * use bdrv_* functions that require to hold the lock.
      */
     bool (*cancel)(Job *job, bool force);
 
 
-    /** Called when the job is freed */
+    /**
+     * Called when the job is freed.
+     * Called with AioContext lock held, since many callback implementations
+     * use bdrv_* functions that require to hold the lock.
+     */
     void (*free)(Job *job);
 };
 
-- 
2.31.1


