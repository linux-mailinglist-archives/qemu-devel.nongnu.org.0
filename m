Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EC15F78B7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 15:14:59 +0200 (CEST)
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ognBq-0005tE-0s
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 09:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuO-0005zJ-Rl
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuN-0003Jk-77
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXOprbof5ZzjV+Qg8oww6F0SLAFGGrPH06mQ6uz1py0=;
 b=aydGLN8YXf40GEFdeiEJ+glwsjq2bmumEZ0mWCnmQxTfUz5d1VYPo/Fw0e6yWLoeeEU17+
 hM5sSStNbmIYfO8zTBgUfbXt9+JkBAH8R8mFummAkPHIp+ZryxvOjekr3477imc98/d5D+
 fUkCU0tdwMCIgdf2IEFLRef14jEiadc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-Z3ykn96vP0-gS1cYgi5G8g-1; Fri, 07 Oct 2022 06:48:45 -0400
X-MC-Unique: Z3ykn96vP0-gS1cYgi5G8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 358CC3826244;
 Fri,  7 Oct 2022 10:48:45 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7543A2024CBB;
 Fri,  7 Oct 2022 10:48:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 45/50] job.h: categorize JobDriver callbacks that need the
 AioContext lock
Date: Fri,  7 Oct 2022 12:47:47 +0200
Message-Id: <20221007104752.141361-46-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Some callbacks implementation use bdrv_* APIs that assume the
AioContext lock is held. Make sure this invariant is documented.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20220926093214.506243-18-eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/job.h | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index c96387069d..b943d90e8f 100644
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
2.37.3


