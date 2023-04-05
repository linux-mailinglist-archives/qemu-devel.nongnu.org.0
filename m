Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F616D8372
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:18:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5pv-0002AG-Si; Wed, 05 Apr 2023 12:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk5pp-000263-Ju
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:18:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk5pn-0007XZ-HZ
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680711486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRv3d9XhhjNhjQXRivQph0G2zk9LhmJcwKMfnOGhgnU=;
 b=VL/xU4FDo7YZbYqTwcdnyjCEYh709oh2cpMsVE2OnXyIUP/L57yjpODlEUwyDeFRvdHzVM
 OqA3xo9FrMPSc2UBgs5ryw7pZWpMDlo38CL5VXTNJ7CJICnhciuFfZp4vu6u6iPGu+BqRZ
 3afnZQC7oeByyjm/z+SyoBcTL8XtmWk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-4U0mPTQ2OaS2XwR6sxC3rQ-1; Wed, 05 Apr 2023 12:18:05 -0400
X-MC-Unique: 4U0mPTQ2OaS2XwR6sxC3rQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-930719372d5so45807866b.2
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680711482; x=1683303482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wRv3d9XhhjNhjQXRivQph0G2zk9LhmJcwKMfnOGhgnU=;
 b=v6WREXpP2jzhaZ4EmHWZ6vlmDReNV2C/TthHuAztaozWsl2LydRmMi/NQQO/ZEzNBf
 HjPU++dN7wtOuT57UZet7EiG5NePhPX6oIZFUKYu3UOJotHdJ8qqGxUCdumKkaHlssMx
 QZNRuHbahvhGIUusmeVbp9zEw1N7naDr456H8iW/5WWn7m/WqAgA5GSjfW0ED6bw8poZ
 TcTJGXI8SyN4l6L8fejydiGZork8jD8YN6PlVXACreIgsWxUJpmV2OQ0CGMHlEiI+Cml
 pzzwcdnsStmkb7TEs+YpalgGlXehyGUvLZy0s7PjGaPGeuSgXUR7FI39bSkszYEBjzxX
 aD9w==
X-Gm-Message-State: AAQBX9diF8kaAa2V9bujzl0lOvQN42EhRfXPEooxcDvh38hF30ozqHwH
 8AZJEFrcHIucd9iFCK3OSPRwH689DH8HpmJPBvJx+1S/I1vH4ZuCnGLrTT9xGU5y9CPGClDVINS
 TJqQ/Vx1sEdLAQCcQQoh8ZDb16BA5fOxk2O3pZtBbdzKFRdTICfehYaanZW60nw+O8nhRq51RVK
 Q=
X-Received: by 2002:aa7:d5c9:0:b0:4f9:deb4:b984 with SMTP id
 d9-20020aa7d5c9000000b004f9deb4b984mr2596315eds.9.1680711482534; 
 Wed, 05 Apr 2023 09:18:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350aVxNJbFcpYBIn9pBt3c/IQs+BndlHoj8P3fr0PgkutghbxExubb314wBPjTQKtNFMeIt5nIw==
X-Received: by 2002:aa7:d5c9:0:b0:4f9:deb4:b984 with SMTP id
 d9-20020aa7d5c9000000b004f9deb4b984mr2596286eds.9.1680711482177; 
 Wed, 05 Apr 2023 09:18:02 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a056402036a00b004e48f8df7e2sm7443519edw.72.2023.04.05.09.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:18:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 f.ebner@proxmox.com
Subject: [PATCH 2/3] block-backend: make global properties write-once
Date: Wed,  5 Apr 2023 18:17:51 +0200
Message-Id: <20230405161752.194727-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405161752.194727-1-pbonzini@redhat.com>
References: <20230405161752.194727-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The three global properties allow_aio_context_change,
disable_request_queuing and allow_write_before_eof are
always set for the whole life of a BlockBackend.  Make
this clear by removing the possibility of clearing them,
and by marking the corresponding function GLOBAL_STATE_CODE().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c             | 27 +++++++++++++++------------
 block/commit.c                    |  4 ++--
 block/export/export.c             |  2 +-
 block/mirror.c                    |  4 ++--
 block/parallels.c                 |  2 +-
 block/qcow.c                      |  2 +-
 block/qcow2.c                     |  2 +-
 block/qed.c                       |  2 +-
 block/stream.c                    |  4 ++--
 block/vdi.c                       |  2 +-
 block/vhdx.c                      |  2 +-
 block/vmdk.c                      |  4 ++--
 block/vpc.c                       |  2 +-
 include/sysemu/block-backend-io.h |  6 +++---
 nbd/server.c                      |  3 +--
 tests/unit/test-bdrv-drain.c      |  4 ++--
 tests/unit/test-block-iothread.c  |  2 +-
 17 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 9e0f48692a35..10419f8be91e 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -73,8 +73,13 @@ struct BlockBackend {
     uint64_t shared_perm;
     bool disable_perm;
 
+    /*
+     * Can only become true; should be written before any requests is
+     * submitted to the BlockBackend.
+     */
     bool allow_aio_context_change;
     bool allow_write_beyond_eof;
+    bool disable_request_queuing;
 
     /* Protected by BQL */
     NotifierList remove_bs_notifiers, insert_bs_notifiers;
@@ -83,7 +88,6 @@ struct BlockBackend {
     int quiesce_counter; /* atomic: written under BQL, read by other threads */
     QemuMutex queued_requests_lock; /* protects queued_requests */
     CoQueue queued_requests;
-    bool disable_request_queuing; /* atomic */
 
     VMChangeStateEntry *vmsh;
     bool force_allow_inactivate;
@@ -1221,22 +1225,22 @@ void blk_iostatus_set_err(BlockBackend *blk, int error)
     }
 }
 
-void blk_set_allow_write_beyond_eof(BlockBackend *blk, bool allow)
+void blk_allow_write_beyond_eof(BlockBackend *blk)
 {
-    IO_CODE();
-    blk->allow_write_beyond_eof = allow;
+    GLOBAL_STATE_CODE();
+    blk->allow_write_beyond_eof = true;
 }
 
-void blk_set_allow_aio_context_change(BlockBackend *blk, bool allow)
+void blk_allow_aio_context_change(BlockBackend *blk)
 {
-    IO_CODE();
-    blk->allow_aio_context_change = allow;
+    GLOBAL_STATE_CODE();
+    blk->allow_aio_context_change = true;
 }
 
-void blk_set_disable_request_queuing(BlockBackend *blk, bool disable)
+void blk_disable_request_queuing(BlockBackend *blk)
 {
-    IO_CODE();
-    qatomic_set(&blk->disable_request_queuing, disable);
+    GLOBAL_STATE_CODE();
+    blk->disable_request_queuing = true;
 }
 
 static int coroutine_fn GRAPH_RDLOCK
@@ -1275,8 +1279,7 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 {
     assert(blk->in_flight > 0);
 
-    if (qatomic_read(&blk->quiesce_counter) &&
-        !qatomic_read(&blk->disable_request_queuing)) {
+    if (qatomic_read(&blk->quiesce_counter) && !blk->disable_request_queuing) {
         /*
          * Take lock before decrementing in flight counter so main loop thread
          * waits for us to enqueue ourselves before it can leave the drained
diff --git a/block/commit.c b/block/commit.c
index 2b20fd0fd4d2..88e1d7373d36 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -379,7 +379,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     if (ret < 0) {
         goto fail;
     }
-    blk_set_disable_request_queuing(s->base, true);
+    blk_disable_request_queuing(s->base);
     s->base_bs = base;
 
     /* Required permissions are already taken with block_job_add_bdrv() */
@@ -388,7 +388,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     if (ret < 0) {
         goto fail;
     }
-    blk_set_disable_request_queuing(s->top, true);
+    blk_disable_request_queuing(s->top);
 
     s->backing_file_str = g_strdup(backing_file_str);
     s->on_error = on_error;
diff --git a/block/export/export.c b/block/export/export.c
index e3fee6061169..0a1336c07fed 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -155,7 +155,7 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
     blk = blk_new(ctx, perm, BLK_PERM_ALL);
 
     if (!fixed_iothread) {
-        blk_set_allow_aio_context_change(blk, true);
+        blk_allow_aio_context_change(blk);
     }
 
     ret = blk_insert_bs(blk, bs, errp);
diff --git a/block/mirror.c b/block/mirror.c
index 1c46ad51bf50..93eda37660a3 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1787,8 +1787,8 @@ static BlockJob *mirror_start_job(
          * ensure that. */
         blk_set_force_allow_inactivate(s->target);
     }
-    blk_set_allow_aio_context_change(s->target, true);
-    blk_set_disable_request_queuing(s->target, true);
+    blk_allow_aio_context_change(s->target);
+    blk_disable_request_queuing(s->target);
 
     s->replaces = g_strdup(replaces);
     s->on_source_error = on_source_error;
diff --git a/block/parallels.c b/block/parallels.c
index 013684801a61..97a5c629bbab 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -578,7 +578,7 @@ static int coroutine_fn parallels_co_create(BlockdevCreateOptions* opts,
         ret = -EPERM;
         goto out;
     }
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
 
     /* Create image format */
     bat_entries = DIV_ROUND_UP(total_size, cl_size);
diff --git a/block/qcow.c b/block/qcow.c
index 490e4f819ed1..5089dd0c6bf3 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -842,7 +842,7 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
         ret = -EPERM;
         goto exit;
     }
-    blk_set_allow_write_beyond_eof(qcow_blk, true);
+    blk_allow_write_beyond_eof(qcow_blk);
 
     /* Create image format */
     memset(&header, 0, sizeof(header));
diff --git a/block/qcow2.c b/block/qcow2.c
index f8ea03a34515..761aa7e1555a 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3643,7 +3643,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
         ret = -EPERM;
         goto out;
     }
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
 
     /* Write the header */
     QEMU_BUILD_BUG_ON((1 << MIN_CLUSTER_BITS) < sizeof(*header));
diff --git a/block/qed.c b/block/qed.c
index 0705a7b4e25f..7fec1cabc4f6 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -690,7 +690,7 @@ static int coroutine_fn bdrv_qed_co_create(BlockdevCreateOptions *opts,
         ret = -EPERM;
         goto out;
     }
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
 
     /* Prepare image format */
     header = (QEDHeader) {
diff --git a/block/stream.c b/block/stream.c
index d92a4c99d359..935e109a4e05 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -336,8 +336,8 @@ void stream_start(const char *job_id, BlockDriverState *bs,
      * Disable request queuing in the BlockBackend to avoid deadlocks on drain:
      * The job reports that it's busy until it reaches a pause point.
      */
-    blk_set_disable_request_queuing(s->blk, true);
-    blk_set_allow_aio_context_change(s->blk, true);
+    blk_disable_request_queuing(s->blk);
+    blk_allow_aio_context_change(s->blk);
 
     /*
      * Prevent concurrent jobs trying to modify the graph structure here, we
diff --git a/block/vdi.c b/block/vdi.c
index f2434d6153e1..1e4eb6a0bd0b 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -813,7 +813,7 @@ static int coroutine_fn vdi_co_do_create(BlockdevCreateOptions *create_options,
         goto exit;
     }
 
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
 
     /* We need enough blocks to store the given disk size,
        so always round up. */
diff --git a/block/vhdx.c b/block/vhdx.c
index 81420722a188..7f59b6cb0403 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -2003,7 +2003,7 @@ static int coroutine_fn vhdx_co_create(BlockdevCreateOptions *opts,
         ret = -EPERM;
         goto delete_and_exit;
     }
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
 
     /* Create (A) */
 
diff --git a/block/vmdk.c b/block/vmdk.c
index 3f8c731e32e8..08a009f527e1 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2298,7 +2298,7 @@ vmdk_create_extent(const char *filename, int64_t filesize, bool flat,
         goto exit;
     }
 
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
 
     ret = vmdk_init_extent(blk, filesize, flat, compress, zeroed_grain, errp);
 exit:
@@ -2796,7 +2796,7 @@ static BlockBackend * coroutine_fn vmdk_co_create_cb(int64_t size, int idx,
     if (!blk) {
         return NULL;
     }
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
     bdrv_unref(bs);
 
     if (size != -1) {
diff --git a/block/vpc.c b/block/vpc.c
index b89b0ff8e275..1dc9a86c6aa2 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -1016,7 +1016,7 @@ static int coroutine_fn vpc_co_create(BlockdevCreateOptions *opts,
         ret = -EPERM;
         goto out;
     }
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
 
     /* Get geometry and check that it matches the image size*/
     ret = calculate_rounded_image_size(vpc_opts, &cyls, &heads, &secs_per_cyl,
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index db29c164997d..1a55d25c133a 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -27,9 +27,9 @@ const char *blk_name(const BlockBackend *blk);
 
 BlockDriverState *blk_bs(BlockBackend *blk);
 
-void blk_set_allow_write_beyond_eof(BlockBackend *blk, bool allow);
-void blk_set_allow_aio_context_change(BlockBackend *blk, bool allow);
-void blk_set_disable_request_queuing(BlockBackend *blk, bool disable);
+void blk_allow_write_beyond_eof(BlockBackend *blk);
+void blk_allow_aio_context_change(BlockBackend *blk);
+void blk_disable_request_queuing(BlockBackend *blk);
 bool blk_iostatus_is_enabled(const BlockBackend *blk);
 
 char *blk_get_attached_dev_id(BlockBackend *blk);
diff --git a/nbd/server.c b/nbd/server.c
index cb41b56095ee..423dc2d2517e 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1777,7 +1777,7 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
      * be properly quiesced when entering a drained section, as our coroutines
      * servicing pending requests might enter blk_pread().
      */
-    blk_set_disable_request_queuing(blk, true);
+    blk_disable_request_queuing(blk);
 
     blk_add_aio_context_notifier(blk, blk_aio_attached, blk_aio_detach, exp);
 
@@ -1853,7 +1853,6 @@ static void nbd_export_delete(BlockExport *blk_exp)
     }
     blk_remove_aio_context_notifier(exp->common.blk, blk_aio_attached,
                                     blk_aio_detach, exp);
-    blk_set_disable_request_queuing(exp->common.blk, false);
 
     for (i = 0; i < exp->nr_export_bitmaps; i++) {
         bdrv_dirty_bitmap_set_busy(exp->export_bitmaps[i], false);
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index d9d38070621a..9484e194d6f9 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -513,7 +513,7 @@ static void test_iothread_common(enum drain_type drain_type, int drain_thread)
                               &error_abort);
     s = bs->opaque;
     blk_insert_bs(blk, bs, &error_abort);
-    blk_set_disable_request_queuing(blk, true);
+    blk_disable_request_queuing(blk);
 
     blk_set_aio_context(blk, ctx_a, &error_abort);
     aio_context_acquire(ctx_a);
@@ -739,7 +739,7 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
                                   &error_abort);
     blk_target = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
     blk_insert_bs(blk_target, target, &error_abort);
-    blk_set_allow_aio_context_change(blk_target, true);
+    blk_allow_aio_context_change(blk_target);
 
     aio_context_acquire(ctx);
     tjob = block_job_create("job0", &test_job_driver, NULL, src,
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 3a5e1eb2c413..90b60ce32c68 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -795,7 +795,7 @@ static void test_propagate_mirror(void)
 
     /* ...unless we explicitly allow it */
     aio_context_acquire(ctx);
-    blk_set_allow_aio_context_change(blk, true);
+    blk_allow_aio_context_change(blk);
     bdrv_try_change_aio_context(target, ctx, NULL, &error_abort);
     aio_context_release(ctx);
 
-- 
2.39.2


