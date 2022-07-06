Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632095694A0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:41:49 +0200 (CEST)
Received: from localhost ([::1]:45194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9CmK-000358-Ai
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9BRK-0005Hk-Mx
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 16:16:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9BRC-0007HZ-Ee
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 16:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657138553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OiUptmWF7VOdW4W8cW/dAQP65c6tG1/VYqG+GUGqsh4=;
 b=Fa4gj9d16ZBc7eQ1PYE97KBDgRfgOVOJIsyMZ3OhrjGm+bisLfRDFzMa3vNzQGu5RW/j7M
 3WE+/EufMfYB9gtK1mLdhz9uDXtxDgh7RZZFb3n61wFcK4DHrMITmQhIlcQgX4RihWMW+Q
 YIdmgNhzNmvp/tI3eIwfCB9GYmbcBSQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-bwW1hB76OaSVR0t6KrLhxg-1; Wed, 06 Jul 2022 16:15:49 -0400
X-MC-Unique: bwW1hB76OaSVR0t6KrLhxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00C6C3801F62;
 Wed,  6 Jul 2022 20:15:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0004112132C;
 Wed,  6 Jul 2022 20:15:48 +0000 (UTC)
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
Subject: [PATCH v9 19/21] blockjob: protect iostatus field in BlockJob struct
Date: Wed,  6 Jul 2022 16:15:31 -0400
Message-Id: <20220706201533.289775-20-eesposit@redhat.com>
In-Reply-To: <20220706201533.289775-1-eesposit@redhat.com>
References: <20220706201533.289775-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

iostatus is the only field (together with .job) that needs
protection using the job mutex.

It is set in the main loop (GLOBAL_STATE functions) but read
in I/O code (block_job_error_action).

In order to protect it, change block_job_iostatus_set_err
to block_job_iostatus_set_err_locked(), always called under
job lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockjob.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index a2559b97a7..893c8ff08e 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -367,7 +367,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
     return block_job_query_locked(job, errp);
 }
 
-static void block_job_iostatus_set_err(BlockJob *job, int error)
+/* Called with job lock held */
+static void block_job_iostatus_set_err_locked(BlockJob *job, int error)
 {
     if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
         job->iostatus = error == ENOSPC ? BLOCK_DEVICE_IO_STATUS_NOSPACE :
@@ -586,8 +587,8 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
                  */
                 job->job.user_paused = true;
             }
+            block_job_iostatus_set_err_locked(job, error);
         }
-        block_job_iostatus_set_err(job, error);
     }
     return action;
 }
-- 
2.31.1


