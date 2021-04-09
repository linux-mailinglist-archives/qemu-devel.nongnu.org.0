Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBB635A2F0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:22:29 +0200 (CEST)
Received: from localhost ([::1]:42394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtts-00076X-HP
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnt-0007lh-I4
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnq-0003PC-N6
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617984972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6cyGtTKb0Ub94dC5ay9OpqyYGaN9Q+YEJi5ImXJogl8=;
 b=hQPRHc2LSSdVA3Tza23BEzwT6Y/sYDRURhVRyoUDnva5DIN6mGq8xECa7Z1ntvLMsSy6Tq
 0/2XKHHPt7QECWxcETfcW4arSII8ZJFQDv5fVEpfV1hVcHPF3meHtAdoLoraJQq3LixqDA
 fy3ORHkcFWuWvJkD1YPxMLITKsPL57A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-rWDEfyzMPnqFNFVx0djXfA-1; Fri, 09 Apr 2021 12:16:10 -0400
X-MC-Unique: rWDEfyzMPnqFNFVx0djXfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 732F01883520;
 Fri,  9 Apr 2021 16:16:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-63.ams2.redhat.com [10.36.115.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 559E15D6A1;
 Fri,  9 Apr 2021 16:16:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/10] job: Allow complete for jobs on standby
Date: Fri,  9 Apr 2021 18:15:47 +0200
Message-Id: <20210409161548.341297-10-kwolf@redhat.com>
In-Reply-To: <20210409161548.341297-1-kwolf@redhat.com>
References: <20210409161548.341297-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

The only job that implements .complete is the mirror job, and it can
handle completion requests just fine while the job is paused.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1945635
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210409120422.144040-4-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 job.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/job.c b/job.c
index 289edee143..4aff13d95a 100644
--- a/job.c
+++ b/job.c
@@ -56,7 +56,7 @@ bool JobVerbTable[JOB_VERB__MAX][JOB_STATUS__MAX] = {
     [JOB_VERB_PAUSE]                = {0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
     [JOB_VERB_RESUME]               = {0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
     [JOB_VERB_SET_SPEED]            = {0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
-    [JOB_VERB_COMPLETE]             = {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
+    [JOB_VERB_COMPLETE]             = {0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0},
     [JOB_VERB_FINALIZE]             = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
     [JOB_VERB_DISMISS]              = {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0},
 };
@@ -991,7 +991,7 @@ void job_complete(Job *job, Error **errp)
     if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
         return;
     }
-    if (job->pause_count || job_is_cancelled(job) || !job->driver->complete) {
+    if (job_is_cancelled(job) || !job->driver->complete) {
         error_setg(errp, "The active block job '%s' cannot be completed",
                    job->id);
         return;
-- 
2.30.2


