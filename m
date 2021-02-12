Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAFF31A5EC
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:19:15 +0100 (CET)
Received: from localhost ([::1]:46438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAeuI-0006VR-Lv
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:19:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAern-0004In-Jf
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerj-0003sv-A8
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613160994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CO+o1TEaSb7GV3Min+1FT7ANGUgrTFANiZySe6ig7m0=;
 b=S6VzJbAVmxfkcZGzCRpa7C1cByUDBycOXejoKBIEauC4jpXOQxEgGJgY5F634Z/NuJbI0M
 AMBSwrANoLfl4dr+XLhyRvlIuoPgahmrCFyorZh5oj7cYdwHnG4bzyRpRPR5xIBB6Qc+zf
 mKgZP+EiZNvTNX4R3Zj/5LAqlwY3OB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526--585gfT9OFuw8rSwH9uFIA-1; Fri, 12 Feb 2021 15:16:32 -0500
X-MC-Unique: -585gfT9OFuw8rSwH9uFIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AAE963AD2;
 Fri, 12 Feb 2021 20:16:31 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E04266B8E5;
 Fri, 12 Feb 2021 20:16:30 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/14] job: add .cancel handler for the driver
Date: Fri, 12 Feb 2021 14:16:13 -0600
Message-Id: <20210212201619.1388255-9-eblake@redhat.com>
In-Reply-To: <20210212201619.1388255-1-eblake@redhat.com>
References: <20210212201619.1388255-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, "open list:Block Jobs" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

To be used in mirror in the following commit to cancel in-flight io on
target to not waste the time.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210205163720.887197-5-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/qemu/job.h | 5 +++++
 job.c              | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 32aabb1c6000..efc6fa754498 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -251,6 +251,11 @@ struct JobDriver {
      */
     void (*clean)(Job *job);

+    /**
+     * If the callback is not NULL, it will be invoked in job_cancel_async
+     */
+    void (*cancel)(Job *job);
+

     /** Called when the job is freed */
     void (*free)(Job *job);
diff --git a/job.c b/job.c
index 3aaaebafe2c8..289edee14374 100644
--- a/job.c
+++ b/job.c
@@ -715,6 +715,9 @@ static int job_finalize_single(Job *job)

 static void job_cancel_async(Job *job, bool force)
 {
+    if (job->driver->cancel) {
+        job->driver->cancel(job);
+    }
     if (job->user_paused) {
         /* Do not call job_enter here, the caller will handle it.  */
         if (job->driver->user_resume) {
-- 
2.30.1


