Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E42C5E9E5A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 11:52:59 +0200 (CEST)
Received: from localhost ([::1]:51650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocknK-00086z-Jz
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 05:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ockTh-0004t9-Qe
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:32:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ockTV-0000Ie-Pg
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664184748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qY8kuHl/HYCjFB05cGWdzGqXAY0Hm72mfTy3rfx4Z3I=;
 b=UM4UKmlSi2TKKx7Zu5nHuY+Txr73nXq9+2TwiRb/oPGNEHzlHYMuWZcBCN8/n4+aaCbiN0
 pVo9w4C2Da5t17dyD+ja7JcjOL0KwamKCvfS1VvmRRMHcUs/YjWi/tlwFgG1veZSSPMm1l
 vmE2QOWcnazQjJiWc1nMpn1PzZoK2I4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-8gnuxcOMMH633X0duc5xEg-1; Mon, 26 Sep 2022 05:32:24 -0400
X-MC-Unique: 8gnuxcOMMH633X0duc5xEg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5345D29ABA04;
 Mon, 26 Sep 2022 09:32:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1AE549BB65;
 Mon, 26 Sep 2022 09:32:23 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v12 17/21] job.h: categorize JobDriver callbacks that need the
 AioContext lock
Date: Mon, 26 Sep 2022 05:32:10 -0400
Message-Id: <20220926093214.506243-18-eesposit@redhat.com>
In-Reply-To: <20220926093214.506243-1-eesposit@redhat.com>
References: <20220926093214.506243-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 include/qemu/job.h | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 50a4c06b93..a954f8f992 100644
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


