Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB64964CC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 19:09:41 +0100 (CET)
Received: from localhost ([::1]:57930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAyM0-0002V1-D4
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 13:09:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxNy-000157-QD
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:07:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxNw-0000Y4-MX
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VPdiWwDoDupGovD5wObv4qoWDsvbLWyekhiXgKX8tA=;
 b=HRBDusZ/aNCz0Rwu3L0Zq56DM3ETkzOiMD1QxTmmVR/VQxA5AVWmHP1k8b7/kw8M65eWUJ
 tFlGFztcFDJaqXg++wuIPdHJsq4rlDSB7u51Qlu86nLLZHWmUnKiuSByjh+3Xg+qXBEZYp
 9bmIo1c9lg6nfgx9b96NnFOu0clb/vM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-6Tb7win9P0KAK-gA1rjt3A-1; Fri, 21 Jan 2022 12:07:30 -0500
X-MC-Unique: 6Tb7win9P0KAK-gA1rjt3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9541100C666;
 Fri, 21 Jan 2022 17:07:27 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A8AA7EBCA;
 Fri, 21 Jan 2022 17:06:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 32/33] crypto: delegate permission functions to JobDriver
 .pre_run
Date: Fri, 21 Jan 2022 12:05:43 -0500
Message-Id: <20220121170544.2049944-33-eesposit@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

block_crypto_amend_options_generic_luks uses the block layer
permission API, therefore it should be called with the BQL held.

However, the same function is being called by two BlockDriver
callbacks: bdrv_amend_options (under BQL) and bdrv_co_amend (I/O).

The latter is I/O because it is invoked by block/amend.c's
blockdev_amend_run(), a .run callback of the amend JobDriver

Therefore we want to 1) change block_crypto driver
to use the permission API only when the BQL is held, and
2) use the .pre_run JobDriver callback to check for
permissions before switching to the job aiocontext. This has also
the benefit of applying the same permission operation to all
amend implementations, not only luks.

Remove the permission check in block_crypto_amend_options_generic_luks()
and:
- Add helper functions block_crypto_amend_options_{prepare/cleanup}
  that take care of checking permissions in
  block_crypto_amend_options_luks(), so when it is under BQL, and

- Use job->pre_run() and job->clean() to do the same thing when
  we are in an iothread, by performing these checks before the
  job runs in its aiocontext. So far job->pre_run() is only defined
  but not called in job_start(), now it is the moment to use it.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/crypto.c | 57 ++++++++++++++++++++++++++++++++------------------
 job.c          | 13 ++++++++++++
 2 files changed, 50 insertions(+), 20 deletions(-)

diff --git a/block/crypto.c b/block/crypto.c
index f5e0c7b7c0..bdb4ba5664 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -791,6 +791,28 @@ block_crypto_amend_cleanup(BlockDriverState *bs)
     crypto->updating_keys = false;
 }
 
+static int
+block_crypto_amend_options_prepare(BlockDriverState *bs,
+                                   Error **errp)
+{
+    BlockCrypto *crypto = bs->opaque;
+
+    /* apply for exclusive read/write permissions to the underlying file*/
+    crypto->updating_keys = true;
+    return bdrv_child_refresh_perms(bs, bs->file, errp);
+}
+
+static int
+block_crypto_amend_options_cleanup(BlockDriverState *bs,
+                                   Error **errp)
+{
+    BlockCrypto *crypto = bs->opaque;
+
+    /* release exclusive read/write permissions to the underlying file*/
+    crypto->updating_keys = false;
+    return bdrv_child_refresh_perms(bs, bs->file, errp);
+}
+
 static int
 block_crypto_amend_options_generic_luks(BlockDriverState *bs,
                                         QCryptoBlockAmendOptions *amend_options,
@@ -798,30 +820,17 @@ block_crypto_amend_options_generic_luks(BlockDriverState *bs,
                                         Error **errp)
 {
     BlockCrypto *crypto = bs->opaque;
-    int ret;
 
     assert(crypto);
     assert(crypto->block);
 
-    /* apply for exclusive read/write permissions to the underlying file*/
-    crypto->updating_keys = true;
-    ret = bdrv_child_refresh_perms(bs, bs->file, errp);
-    if (ret) {
-        goto cleanup;
-    }
-
-    ret = qcrypto_block_amend_options(crypto->block,
-                                      block_crypto_read_func,
-                                      block_crypto_write_func,
-                                      bs,
-                                      amend_options,
-                                      force,
-                                      errp);
-cleanup:
-    /* release exclusive read/write permissions to the underlying file*/
-    crypto->updating_keys = false;
-    bdrv_child_refresh_perms(bs, bs->file, errp);
-    return ret;
+    return qcrypto_block_amend_options(crypto->block,
+                                       block_crypto_read_func,
+                                       block_crypto_write_func,
+                                       bs,
+                                       amend_options,
+                                       force,
+                                       errp);
 }
 
 static int
@@ -847,8 +856,16 @@ block_crypto_amend_options_luks(BlockDriverState *bs,
     if (!amend_options) {
         goto cleanup;
     }
+
+    ret = block_crypto_amend_options_prepare(bs, errp);
+    if (ret) {
+        goto perm_cleanup;
+    }
     ret = block_crypto_amend_options_generic_luks(bs, amend_options,
                                                   force, errp);
+
+perm_cleanup:
+    block_crypto_amend_options_cleanup(bs, errp);
 cleanup:
     qapi_free_QCryptoBlockAmendOptions(amend_options);
     return ret;
diff --git a/job.c b/job.c
index 39bf511949..cf0dc9325a 100644
--- a/job.c
+++ b/job.c
@@ -967,11 +967,24 @@ static void coroutine_fn job_co_entry(void *opaque)
     aio_bh_schedule_oneshot(qemu_get_aio_context(), job_exit, job);
 }
 
+static int job_pre_run(Job *job)
+{
+    assert(qemu_in_main_thread());
+    if (job->driver->pre_run) {
+        return job->driver->pre_run(job, &job->err);
+    }
+
+    return 0;
+}
+
 void job_start(Job *job)
 {
     assert(job && !job_started(job) && job->paused &&
            job->driver && job->driver->run);
     job->co = qemu_coroutine_create(job_co_entry, job);
+    if (job_pre_run(job)) {
+        return;
+    }
     job->pause_count--;
     job->busy = true;
     job->paused = false;
-- 
2.31.1


