Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A4E4CD978
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 17:50:34 +0100 (CET)
Received: from localhost ([::1]:57246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQB8S-0007nn-Ot
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 11:50:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5R-0004Ll-Nz
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5O-0007Ew-Mx
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBLhYyHGxDa852f1UgmSYeaagEna4adluNcI2ZCxDIo=;
 b=FZF41SLQB7m74eC5KzXiFJ7MtYyhGvQifqFyHSqbVbogZ54nHD8kQTTN/Iy9Z9PeyacVVZ
 bWjRQqr6jrWPQ/8GE4ElFCcTxG9Pf7Q9mKdDRDx2eozdXh73g9n4kvfut5Z1IYy59n6bW6
 6Ev7VsncFhalH5No7ExdbqrAcbGg/bQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-uN8m6q6mNC6AOxqB4xqMLg-1; Fri, 04 Mar 2022 11:47:20 -0500
X-MC-Unique: uN8m6q6mNC6AOxqB4xqMLg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48928800423;
 Fri,  4 Mar 2022 16:47:18 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47B7683BF9;
 Fri,  4 Mar 2022 16:47:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/50] crypto: perform permission checks under BQL
Date: Fri,  4 Mar 2022 17:46:22 +0100
Message-Id: <20220304164711.474713-2-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

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

After this patch, permission failures occur early in the blockdev-amend
job to update a LUKS volume's keys.  iotest 296 must now expect them in
x-blockdev-amend's QMP reply instead of waiting for the actual job to
fail later.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220209105452.1694545-2-eesposit@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220304153729.711387-6-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int.h  | 14 ++++++++++++++
 block/amend.c              | 25 +++++++++++++++++++++++++
 block/crypto.c             | 33 +++++++++++++++++++++++++++++++++
 tests/qemu-iotests/296     |  8 ++++++--
 tests/qemu-iotests/296.out | 17 +++++------------
 5 files changed, 83 insertions(+), 14 deletions(-)

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
diff --git a/block/amend.c b/block/amend.c
index 392df9ef83..f465738665 100644
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
@@ -113,5 +132,11 @@ void qmp_x_blockdev_amend(const char *job_id,
     s->bs = bs,
     s->opts = QAPI_CLONE(BlockdevAmendOptions, options),
     s->force = has_force ? force : false;
+
+    if (blockdev_amend_pre_run(s, errp)) {
+        job_early_fail(&s->common);
+        return;
+    }
+
     job_start(&s->common);
 }
diff --git a/block/crypto.c b/block/crypto.c
index c8ba4681e2..70b2f07351 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -777,6 +777,37 @@ block_crypto_get_specific_info_luks(BlockDriverState *bs, Error **errp)
     return spec_info;
 }
 
+static int
+block_crypto_amend_prepare(BlockDriverState *bs, Error **errp)
+{
+    BlockCrypto *crypto = bs->opaque;
+    int ret;
+
+    /* apply for exclusive read/write permissions to the underlying file */
+    crypto->updating_keys = true;
+    ret = bdrv_child_refresh_perms(bs, bs->file, errp);
+    if (ret < 0) {
+        /* Well, in this case we will not be updating any keys */
+        crypto->updating_keys = false;
+    }
+    return ret;
+}
+
+static void
+block_crypto_amend_cleanup(BlockDriverState *bs)
+{
+    BlockCrypto *crypto = bs->opaque;
+    Error *errp = NULL;
+
+    /* release exclusive read/write permissions to the underlying file */
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
@@ -931,6 +962,8 @@ static BlockDriver bdrv_crypto_luks = {
     .bdrv_get_specific_info = block_crypto_get_specific_info_luks,
     .bdrv_amend_options = block_crypto_amend_options_luks,
     .bdrv_co_amend      = block_crypto_co_amend_luks,
+    .bdrv_amend_pre_run = block_crypto_amend_prepare,
+    .bdrv_amend_clean   = block_crypto_amend_cleanup,
 
     .is_format          = true,
 
diff --git a/tests/qemu-iotests/296 b/tests/qemu-iotests/296
index 099a3eeaa5..f80ef3434a 100755
--- a/tests/qemu-iotests/296
+++ b/tests/qemu-iotests/296
@@ -174,8 +174,12 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
         }
 
         result = vm.qmp('x-blockdev-amend', **args)
-        assert result['return'] == {}
-        vm.run_job('job0')
+        iotests.log(result)
+        # Run the job only if it was created
+        event = ('JOB_STATUS_CHANGE',
+                 {'data': {'id': 'job0', 'status': 'created'}})
+        if vm.events_wait([event], timeout=0.0) is not None:
+            vm.run_job('job0')
 
     # test that when the image opened by two qemu processes,
     # neither of them can update the encryption keys
diff --git a/tests/qemu-iotests/296.out b/tests/qemu-iotests/296.out
index 42205cc981..609826eaa0 100644
--- a/tests/qemu-iotests/296.out
+++ b/tests/qemu-iotests/296.out
@@ -1,11 +1,9 @@
 
-{"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
-Job failed: Failed to get shared "consistent read" lock
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
-Job failed: Failed to get shared "consistent read" lock
-{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"error": {"class": "GenericError", "desc": "Failed to get shared \"consistent read\" lock"}}
+{"error": {"class": "GenericError", "desc": "Failed to get shared \"consistent read\" lock"}}
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
@@ -13,14 +11,9 @@ qemu-img: Failed to get shared "consistent read" lock
 Is another process using the image [TEST_DIR/test.img]?
 
 .
-Job failed: Block node is read-only
-{"execute": "job-dismiss", "arguments": {"id": "job0"}}
-{"return": {}}
-Job failed: Failed to get shared "consistent read" lock
-{"execute": "job-dismiss", "arguments": {"id": "job0"}}
-{"return": {}}
-Job failed: Failed to get shared "consistent read" lock
-{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"error": {"class": "GenericError", "desc": "Block node is read-only"}}
+{"error": {"class": "GenericError", "desc": "Failed to get shared \"consistent read\" lock"}}
+{"error": {"class": "GenericError", "desc": "Failed to get shared \"consistent read\" lock"}}
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
-- 
2.35.1


