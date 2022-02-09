Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723F94AEFC7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:11:30 +0100 (CET)
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHksj-0007mm-Ez
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:11:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHkcw-00056r-5Z
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHkcq-00045s-M1
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644404104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tk5lXvDVvRy261KgOHk7/jWnc8aBHxQyhiutI85zWXw=;
 b=dPXtJ/A0rnPd1MVGjWHcusWnlEtKGIQFOf1/fUDiEhWDgIiFIUpwV2e4bmrHQx98blW7pN
 D6oxxioVsDyKCGcLkDHNOw7WmeS87z4WSi6SEeLdESxBA/FYeDq7Bbw1WfmjK+imfs1qZ7
 HS9ZCF/yBH1LJcvFEwByEcRpFAlfyh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-F1FRhPw0PaSOEV2qq0OfHQ-1; Wed, 09 Feb 2022 05:55:00 -0500
X-MC-Unique: F1FRhPw0PaSOEV2qq0OfHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 511F11937FC2;
 Wed,  9 Feb 2022 10:54:58 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BA4E5F6AF;
 Wed,  9 Feb 2022 10:54:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/5] crypto: perform permission checks under BQL
Date: Wed,  9 Feb 2022 05:54:48 -0500
Message-Id: <20220209105452.1694545-2-eesposit@redhat.com>
In-Reply-To: <20220209105452.1694545-1-eesposit@redhat.com>
References: <20220209105452.1694545-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the permission API calls into driver-specific callbacks
that always run under BQL. In this case, bdrv_crypto_luks
needs to perform permission checks before and after
qcrypto_block_amend_options(). The problem is that the caller,
block_crypto_amend_options_generic_luks(), can also run in I/O
from .bdrv_co_amend(). This does not comply with Global State-I/O API split,
as permissions API must always run under BQL.

Firstly, introduce .bdrv_amend_pre_run() and .bdrv_amend_clean()
callbacks. These two callbacks are guaranteed to be invoked under
BQL, respectively before and after .bdrv_co_amend().
They take care of performing the permission checks
in the same way as they are currently done before and after
qcrypto_block_amend_options().
These callbacks are in preparation for next patch, where we
delete the original permission check. Right now they just add redundant
control.

Then, call .bdrv_amend_pre_run() before job_start in
qmp_x_blockdev_amend(), so that it will be run before the job coroutine
is created and stay in the main loop.
As a cleanup, use JobDriver's .clean() callback to call
.bdrv_amend_clean(), and run amend-specific cleanup callbacks under BQL.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/amend.c             | 24 ++++++++++++++++++++++++
 block/crypto.c            | 27 +++++++++++++++++++++++++++
 include/block/block_int.h | 14 ++++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/block/amend.c b/block/amend.c
index 392df9ef83..329bca53dc 100644
--- a/block/amend.c
+++ b/block/amend.c
@@ -53,10 +53,29 @@ static int coroutine_fn blockdev_amend_run(Job *job, Error **errp)
     return ret;
 }
 
+static int blockdev_amend_pre_run(BlockdevAmendJob *s, Error **errp)
+{
+    if (s->bs->drv->bdrv_amend_pre_run) {
+        return s->bs->drv->bdrv_amend_pre_run(s->bs, errp);
+    }
+
+    return 0;
+}
+
+static void blockdev_amend_clean(Job *job)
+{
+    BlockdevAmendJob *s = container_of(job, BlockdevAmendJob, common);
+
+    if (s->bs->drv->bdrv_amend_clean) {
+        s->bs->drv->bdrv_amend_clean(s->bs);
+    }
+}
+
 static const JobDriver blockdev_amend_job_driver = {
     .instance_size = sizeof(BlockdevAmendJob),
     .job_type      = JOB_TYPE_AMEND,
     .run           = blockdev_amend_run,
+    .clean         = blockdev_amend_clean,
 };
 
 void qmp_x_blockdev_amend(const char *job_id,
@@ -113,5 +132,10 @@ void qmp_x_blockdev_amend(const char *job_id,
     s->bs = bs,
     s->opts = QAPI_CLONE(BlockdevAmendOptions, options),
     s->force = has_force ? force : false;
+
+    if (blockdev_amend_pre_run(s, errp)) {
+        return;
+    }
+
     job_start(&s->common);
 }
diff --git a/block/crypto.c b/block/crypto.c
index c8ba4681e2..59f768ea8d 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -777,6 +777,31 @@ block_crypto_get_specific_info_luks(BlockDriverState *bs, Error **errp)
     return spec_info;
 }
 
+static int
+block_crypto_amend_prepare(BlockDriverState *bs, Error **errp)
+{
+    BlockCrypto *crypto = bs->opaque;
+
+    /* apply for exclusive read/write permissions to the underlying file*/
+    crypto->updating_keys = true;
+    return bdrv_child_refresh_perms(bs, bs->file, errp);
+}
+
+static void
+block_crypto_amend_cleanup(BlockDriverState *bs)
+{
+    BlockCrypto *crypto = bs->opaque;
+    Error *errp = NULL;
+
+    /* release exclusive read/write permissions to the underlying file*/
+    crypto->updating_keys = false;
+    bdrv_child_refresh_perms(bs, bs->file, &errp);
+
+    if (errp) {
+        error_report_err(errp);
+    }
+}
+
 static int
 block_crypto_amend_options_generic_luks(BlockDriverState *bs,
                                         QCryptoBlockAmendOptions *amend_options,
@@ -931,6 +956,8 @@ static BlockDriver bdrv_crypto_luks = {
     .bdrv_get_specific_info = block_crypto_get_specific_info_luks,
     .bdrv_amend_options = block_crypto_amend_options_luks,
     .bdrv_co_amend      = block_crypto_co_amend_luks,
+    .bdrv_amend_pre_run = block_crypto_amend_prepare,
+    .bdrv_amend_clean   = block_crypto_amend_cleanup,
 
     .is_format          = true,
 
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 27008cfb22..31bd788919 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -124,6 +124,20 @@ struct BlockDriver {
      * on those children.
      */
     bool is_format;
+
+    /*
+     * This function is invoked under BQL before .bdrv_co_amend()
+     * (which in contrast does not necessarily run under the BQL)
+     * to allow driver-specific initialization code that requires
+     * the BQL, like setting up specific permission flags.
+     */
+    int (*bdrv_amend_pre_run)(BlockDriverState *bs, Error **errp);
+    /*
+     * This function is invoked under BQL after .bdrv_co_amend()
+     * to allow cleaning up what was done in .bdrv_amend_pre_run().
+     */
+    void (*bdrv_amend_clean)(BlockDriverState *bs);
+
     /*
      * Return true if @to_replace can be replaced by a BDS with the
      * same data as @bs without it affecting @bs's behavior (that is,
-- 
2.31.1


