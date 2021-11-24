Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950A945B554
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:27:53 +0100 (CET)
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmh6-00073o-Nf
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:27:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3d-0005iS-TN
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:47:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3c-0005Hg-7Y
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ENGVgZgYiqSNYUvBkGAKjiVrR3ltb3m3mJ5UEYsN50A=;
 b=DYVw1fh1MYlSl/p7UiMtETbo66sGMqdhjffht342tk6BEnaCOkoxDc928Sbu7Xqf9wGN5x
 mgjtaMNY6m9dzCyEkVHh6o6U9+xP65+4TEMxQPEYZaVGhkz4Il6/Lns23Nd6S+uVt7l2VA
 oF/pfP2TYmrD4S4LKWXzFiEhaTSrtuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-pDq0NJjDPRq9I58m39JZMA-1; Wed, 24 Nov 2021 01:47:00 -0500
X-MC-Unique: pDq0NJjDPRq9I58m39JZMA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 081D283DD20;
 Wed, 24 Nov 2021 06:46:59 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D54FB60843;
 Wed, 24 Nov 2021 06:46:57 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 30/31] crypto: delegate permission functions to JobDriver
 .pre_run
Date: Wed, 24 Nov 2021 01:44:17 -0500
Message-Id: <20211124064418.3120601-31-eesposit@redhat.com>
In-Reply-To: <20211124064418.3120601-1-eesposit@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

block_crypto_amend_options_generic_luks uses the block layer
permission API, therefore it should be called with the BQL held.

However, the same function is being called ib two BlockDriver
callbacks: bdrv_amend_options (under BQL) and bdrv_co_amend (I/O).

The latter is I/O because it is invoked by block/amend.c's
blockdev_amend_run(), a .run callback of the amend JobDriver

Therefore we want to 1) change block_crypto_amend_options_generic_luks
to use the permission API only when the BQL is held, and
2) use the .pre_run JobDriver callback to check for
permissions before switching to the job aiocontext. This has also
the benefit of applying the same permission operation to all
amend implementations, not only luks.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/amend.c  | 20 ++++++++++++++++++++
 block/crypto.c | 18 ++++++++++++------
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/block/amend.c b/block/amend.c
index 392df9ef83..fba6add51a 100644
--- a/block/amend.c
+++ b/block/amend.c
@@ -53,10 +53,30 @@ static int coroutine_fn blockdev_amend_run(Job *job, Error **errp)
     return ret;
 }
 
+static int blockdev_amend_refresh_perms(Job *job, Error **errp)
+{
+    BlockdevAmendJob *s = container_of(job, BlockdevAmendJob, common);
+
+    return bdrv_child_refresh_perms(s->bs, s->bs->file, errp);
+}
+
+static int blockdev_amend_pre_run(Job *job, Error **errp)
+{
+    return blockdev_amend_refresh_perms(job, errp);
+}
+
+static void blockdev_amend_clean(Job *job)
+{
+    Error *errp;
+    blockdev_amend_refresh_perms(job, &errp);
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
diff --git a/block/crypto.c b/block/crypto.c
index c8ba4681e2..82f154516c 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -780,6 +780,7 @@ block_crypto_get_specific_info_luks(BlockDriverState *bs, Error **errp)
 static int
 block_crypto_amend_options_generic_luks(BlockDriverState *bs,
                                         QCryptoBlockAmendOptions *amend_options,
+                                        bool under_bql,
                                         bool force,
                                         Error **errp)
 {
@@ -791,9 +792,12 @@ block_crypto_amend_options_generic_luks(BlockDriverState *bs,
 
     /* apply for exclusive read/write permissions to the underlying file*/
     crypto->updating_keys = true;
-    ret = bdrv_child_refresh_perms(bs, bs->file, errp);
-    if (ret) {
-        goto cleanup;
+
+    if (under_bql) {
+        ret = bdrv_child_refresh_perms(bs, bs->file, errp);
+        if (ret) {
+            goto cleanup;
+        }
     }
 
     ret = qcrypto_block_amend_options(crypto->block,
@@ -806,7 +810,9 @@ block_crypto_amend_options_generic_luks(BlockDriverState *bs,
 cleanup:
     /* release exclusive read/write permissions to the underlying file*/
     crypto->updating_keys = false;
-    bdrv_child_refresh_perms(bs, bs->file, errp);
+    if (under_bql) {
+        bdrv_child_refresh_perms(bs, bs->file, errp);
+    }
     return ret;
 }
 
@@ -834,7 +840,7 @@ block_crypto_amend_options_luks(BlockDriverState *bs,
         goto cleanup;
     }
     ret = block_crypto_amend_options_generic_luks(bs, amend_options,
-                                                  force, errp);
+                                                  true, force, errp);
 cleanup:
     qapi_free_QCryptoBlockAmendOptions(amend_options);
     return ret;
@@ -853,7 +859,7 @@ coroutine_fn block_crypto_co_amend_luks(BlockDriverState *bs,
         .u.luks = *qapi_BlockdevAmendOptionsLUKS_base(&opts->u.luks),
     };
     return block_crypto_amend_options_generic_luks(bs, &amend_opts,
-                                                   force, errp);
+                                                   false, force, errp);
 }
 
 static void
-- 
2.27.0


