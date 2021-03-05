Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B0932F078
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:59:06 +0100 (CET)
Received: from localhost ([::1]:44666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDn7-0000SF-O2
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDk3-0006oL-Ki
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:55:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDjx-00078g-D0
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+24Wp5v0/ql1DcefmbkDRn1VATYhE49R2ywNT9QU2c=;
 b=bzoRx6/Xixz4Hqwuzuo60IVLuypQgkCrL54Up7Ff8k6Q6GV1dp9LS8E91/NJdbl2N3blpl
 CTmuoPIvgt+i4puUl652oFF0QLf6RrBNjklTHyAEbOeggwMof9ioUeUaTVRUUnBGYzhAJF
 n3GAPaUCRBf2zVva4VI6vTaLkgigtY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-Dncz_u7jMd6q7oiv4f28dw-1; Fri, 05 Mar 2021 11:55:44 -0500
X-MC-Unique: Dncz_u7jMd6q7oiv4f28dw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D5111005584;
 Fri,  5 Mar 2021 16:55:15 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 714AE60BF3;
 Fri,  5 Mar 2021 16:55:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/31] blockjob: report a better error message
Date: Fri,  5 Mar 2021 17:54:29 +0100
Message-Id: <20210305165454.356840-7-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

From: Stefano Garzarella <sgarzare@redhat.com>

When a block job fails, we report strerror(-job->job.ret) error
message, also if the job set an error object.
Let's report a better error message using error_get_pretty(job->job.err).

If an error object was not set, strerror(-job->ret) is used as fallback,
as explained in include/qemu/job.h:

typedef struct Job {
    ...
    /**
     * Error object for a failed job.
     * If job->ret is nonzero and an error object was not set, it will be set
     * to strerror(-job->ret) during job_completed.
     */
    Error *err;
}

In block_job_query() there can be a transient where 'job.err' is not set
by a scheduled bottom half. In that case we use strerror(-job->ret) as it
was before.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20210225103633.76746-1-sgarzare@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 blockjob.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index f2feff051d..ef968017a2 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -318,8 +318,12 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
     info->status    = job->job.status;
     info->auto_finalize = job->job.auto_finalize;
     info->auto_dismiss  = job->job.auto_dismiss;
-    info->has_error = job->job.ret != 0;
-    info->error     = job->job.ret ? g_strdup(strerror(-job->job.ret)) : NULL;
+    if (job->job.ret) {
+        info->has_error = true;
+        info->error = job->job.err ?
+                        g_strdup(error_get_pretty(job->job.err)) :
+                        g_strdup(strerror(-job->job.ret));
+    }
     return info;
 }
 
@@ -356,7 +360,7 @@ static void block_job_event_completed(Notifier *n, void *opaque)
     }
 
     if (job->job.ret < 0) {
-        msg = strerror(-job->job.ret);
+        msg = error_get_pretty(job->job.err);
     }
 
     qapi_event_send_block_job_completed(job_type(&job->job),
-- 
2.29.2


