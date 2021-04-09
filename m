Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B592E359E6E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 14:16:00 +0200 (CEST)
Received: from localhost ([::1]:48504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUq3L-0006rq-AP
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 08:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUpsR-00084R-Qo
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 08:04:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUpsL-0008Ej-JR
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 08:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617969875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcJ4iKj56gsilCizTluXLSAk28HiI47nLspxmevo2Sw=;
 b=A+/Xw2LTOCa3JVsms4ghDyVthmQXPMpCC8I63iV5aoMVk0M+F4KbdZ+NwkqctIXD0bfpbW
 XBsYSL5UyaYsl091BVItO1MZhNNoiued2blI2w174r1LrJj08simmE8pPYAwGIGsYmndnu
 cPBrhIbpUQcXMraXfqfmrt3ULawZeWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-wGaQICmGMLaTBNUxDF42Mw-1; Fri, 09 Apr 2021 08:04:32 -0400
X-MC-Unique: wGaQICmGMLaTBNUxDF42Mw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AF7E8030A0;
 Fri,  9 Apr 2021 12:04:31 +0000 (UTC)
Received: from localhost (ovpn-114-67.ams2.redhat.com [10.36.114.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B38E419C66;
 Fri,  9 Apr 2021 12:04:30 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/4] job: Allow complete for jobs on standby
Date: Fri,  9 Apr 2021 14:04:20 +0200
Message-Id: <20210409120422.144040-4-mreitz@redhat.com>
In-Reply-To: <20210409120422.144040-1-mreitz@redhat.com>
References: <20210409120422.144040-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only job that implements .complete is the mirror job, and it can
handle completion requests just fine while the job is paused.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1945635
Signed-off-by: Max Reitz <mreitz@redhat.com>
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
2.29.2


