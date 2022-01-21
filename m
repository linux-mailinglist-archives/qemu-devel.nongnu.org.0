Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900144964BA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 19:04:53 +0100 (CET)
Received: from localhost ([::1]:49400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAyHM-0004zZ-4M
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 13:04:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxNP-0008O2-OE
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:07:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxNN-0000Vt-St
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C0NQZD5YV+yXLYKT/wG/IwJqgnvcOMYhuGvfFai0Ujs=;
 b=JoRuKbZyFzI4Vv6wv+0S9cy94jLutzgv8ORQyo0FYKfhHDUiQkYEreSysTejjeVIgcizCf
 117aLC38jUvzMf3YbMKojJ/rBOZ1bkdYhlZgM0nPQGHPAkAWalm+/tV23+v18iNvmOKigf
 gG33NpCLZ7O8ZisQLHm1W2W6fLj5G/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-OIDPC-A6N2Sb4NSaEFljww-1; Fri, 21 Jan 2022 12:06:56 -0500
X-MC-Unique: OIDPC-A6N2Sb4NSaEFljww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 411EB874981;
 Fri, 21 Jan 2022 17:06:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF607EBE0;
 Fri, 21 Jan 2022 17:06:52 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 31/33] include/qemu/job.h: introduce job->pre_run() and use
 it in amend
Date: Fri, 21 Jan 2022 12:05:42 -0500
Message-Id: <20220121170544.2049944-32-eesposit@redhat.com>
In-Reply-To: <20220121170544.2049944-1-eesposit@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce .pre_run() job callback. This cb will run in job_start,
before the coroutine is created and runs run() in the job aiocontext.

Therefore, .pre_run() always runs in the main loop.
We can use this function together with clean() cb to replace
bdrv_child_refresh_perms in block_crypto_amend_options_generic_luks(),
since that function can also be called from an iothread via
.bdrv_co_amend().

In addition, doing so we check for permissions in all bdrv
in amend, not only crypto.

.pre_run() and .clean() take care of calling bdrv_amend_pre_run()
and bdrv_amend_clean() respectively, to set up driver-specific flags
and allow the crypto driver to temporarly provide the WRITE
perm to qcrypto_block_amend_options().

.pre_run() is not yet invoked by job_start, but .clean() is.
This is not a problem, since it will just be a redundant check
and crypto will have the update->keys flag == false anyways.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/amend.c      | 33 +++++++++++++++++++++++++++++++++
 include/qemu/job.h |  9 +++++++++
 2 files changed, 42 insertions(+)

diff --git a/block/amend.c b/block/amend.c
index 392df9ef83..1618fd05a6 100644
--- a/block/amend.c
+++ b/block/amend.c
@@ -53,10 +53,43 @@ static int coroutine_fn blockdev_amend_run(Job *job, Error **errp)
     return ret;
 }
 
+static int blockdev_amend_refresh_perms(Job *job, Error **errp)
+{
+    BlockdevAmendJob *s = container_of(job, BlockdevAmendJob, common);
+    return bdrv_child_refresh_perms(s->bs, s->bs->file, errp);
+}
+
+static int blockdev_amend_pre_run(Job *job, Error **errp)
+{
+    BlockdevAmendJob *s = container_of(job, BlockdevAmendJob, common);
+
+    if (s->bs->drv->bdrv_amend_pre_run) {
+        s->bs->drv->bdrv_amend_pre_run(s->bs);
+    }
+    return blockdev_amend_refresh_perms(job, errp);
+}
+
+static void blockdev_amend_clean(Job *job)
+{
+    BlockdevAmendJob *s = container_of(job, BlockdevAmendJob, common);
+    Error *errp = NULL;
+
+    if (s->bs->drv->bdrv_amend_clean) {
+        s->bs->drv->bdrv_amend_clean(s->bs);
+    }
+
+    blockdev_amend_refresh_perms(job, &errp);
+    if (errp) {
+        error_report_err(errp);
+    }
+}
+
 static const JobDriver blockdev_amend_job_driver = {
     .instance_size = sizeof(BlockdevAmendJob),
     .job_type      = JOB_TYPE_AMEND,
     .run           = blockdev_amend_run,
+    .pre_run       = blockdev_amend_pre_run,
+    .clean         = blockdev_amend_clean,
 };
 
 void qmp_x_blockdev_amend(const char *job_id,
diff --git a/include/qemu/job.h b/include/qemu/job.h
index 4ea7a4a0cd..915ceff425 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -223,6 +223,15 @@ struct JobDriver {
      * the GS API.
      */
 
+    /**
+     * Called in the Main Loop context, before the job coroutine
+     * is started in the job aiocontext. Useful to perform operations
+     * that needs to be done under BQL (like permissions setup).
+     * On success, it returns 0. Otherwise the job failed to initialize
+     * and won't start.
+     */
+    int (*pre_run)(Job *job, Error **errp);
+
     /**
      * Called when the job is resumed by the user (i.e. user_paused becomes
      * false). .user_resume is called before .resume.
-- 
2.31.1


