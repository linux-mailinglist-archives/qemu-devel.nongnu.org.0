Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7D5649F4F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:01:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iQL-0001N5-Uc; Mon, 12 Dec 2022 08:00:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPT-0001CH-Lt
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPR-0000dL-FE
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670849992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=372OTOBxI2AXWgTlqDZU+4Uyk2bfD1HPIFuxCc+rwBM=;
 b=ZcpnUjbIKdJTeRaQOX2knRBvLEbZCGq0G6jX9bq3CD9TXfQi9sI5nCxZqbQ95epZyWwyja
 wg/8/kgJVEnrNDnbw4WbBb0HPt214BdCfC5tlmiA1WgqGuR2UR7D3raQ9fhObrRykzzpgX
 CPOmnqkcutPfE0vbHUnjlPE1A9OzeMk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-evXOj14WPJWrTR_tCQ_O5A-1; Mon, 12 Dec 2022 07:59:52 -0500
X-MC-Unique: evXOj14WPJWrTR_tCQ_O5A-1
Received: by mail-wm1-f71.google.com with SMTP id
 r129-20020a1c4487000000b003d153a83d27so3347352wma.0
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=372OTOBxI2AXWgTlqDZU+4Uyk2bfD1HPIFuxCc+rwBM=;
 b=KjFZSkKzwa5UTojfInhn6Y6Necj2DxmMa+VxyS4KhAEHC70sPD33f2LQgZMKcyELGE
 53MH305TuPX5P3oKwAIUtn0KyXPJcMSFaHQHc9+wZuI8uJclTWlTJoT0wZ1kojuPfDKe
 728VNv4LEmToQcbaATwbIK8Yic0QjUZ8Jui2DCCnTH4b5cRassvZHgaQzM8lzBbBbWY4
 4feeqzX0GFNM03bln6sV3ozcZ6DKh7DvHEzSaAVAy5wmLHf0zElmV0ieIYD4GQlTMIev
 YraTCUIQZxaKy8hH9SUu3FunMpd3dGCGRrxbnoBzkfLCES0WdeAkXkXpTKnJYCVj5gxs
 NXMg==
X-Gm-Message-State: ANoB5pmtkSNsB1mS/HeuVRFva3ANt2OlBHQGkHmaI8kOmP68jIciAE5k
 QWoyTGnLYbiyN2k99q9n/8mXyNSvBPUtJMpgyjQcH3Tumxe9mQ7YlWGjKxfRtOtsRxsop2tK//5
 3RMLIcjjqzsbXccVlQn1dfqTlIMc/dIJPvi5iidDcihoKENzIwUFGs9vXxBeu7V6iCzI=
X-Received: by 2002:a05:600c:3b0e:b0:3cf:b067:4161 with SMTP id
 m14-20020a05600c3b0e00b003cfb0674161mr12355447wms.15.1670849989880; 
 Mon, 12 Dec 2022 04:59:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4qcHHfGXH8L3OQ3ttO9HnljgxNDW/WWoTyQ70hHUPYe+8Vp7uyG1ksgjKd1ZOYry3PpTWLhw==
X-Received: by 2002:a05:600c:3b0e:b0:3cf:b067:4161 with SMTP id
 m14-20020a05600c3b0e00b003cfb0674161mr12355425wms.15.1670849989508; 
 Mon, 12 Dec 2022 04:59:49 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 bt4-20020a056000080400b002365cd93d05sm8893696wrb.102.2022.12.12.04.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:59:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 09/15] block-backend: make global properties write-once
Date: Mon, 12 Dec 2022 13:59:14 +0100
Message-Id: <20221212125920.248567-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212125920.248567-1-pbonzini@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 block/block-backend.c             | 24 ++++++++++++++----------
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
 17 files changed, 37 insertions(+), 34 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index c4a884b86c2b..fe42d53d655d 100644
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
@@ -82,7 +87,6 @@ struct BlockBackend {
 
     int quiesce_counter;
     CoQueue queued_requests;
-    bool disable_request_queuing;
 
     VMChangeStateEntry *vmsh;
     bool force_allow_inactivate;
@@ -1217,22 +1221,22 @@ void blk_iostatus_set_err(BlockBackend *blk, int error)
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
-    blk->disable_request_queuing = disable;
+    GLOBAL_STATE_CODE();
+    blk->disable_request_queuing = true;
 }
 
 static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
diff --git a/block/commit.c b/block/commit.c
index b34634176797..7a448838301b 100644
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
index 7cc0c25c1c9f..6abfe5becb88 100644
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
index 251adc5ae02a..28e76e9dbf55 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1768,8 +1768,8 @@ static BlockJob *mirror_start_job(
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
index bbea2f2221ff..44e18a8cc75d 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -576,7 +576,7 @@ static int coroutine_fn parallels_co_create(BlockdevCreateOptions* opts,
         ret = -EPERM;
         goto out;
     }
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
 
     /* Create image format */
     bat_entries = DIV_ROUND_UP(total_size, cl_size);
diff --git a/block/qcow.c b/block/qcow.c
index 18e17a5b1235..6165885882dd 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -844,7 +844,7 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
         ret = -EPERM;
         goto exit;
     }
-    blk_set_allow_write_beyond_eof(qcow_blk, true);
+    blk_allow_write_beyond_eof(qcow_blk);
 
     /* Create image format */
     memset(&header, 0, sizeof(header));
diff --git a/block/qcow2.c b/block/qcow2.c
index 7cc49a3a6ce3..133dcef16760 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3634,7 +3634,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
         ret = -EPERM;
         goto out;
     }
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
 
     /* Write the header */
     QEMU_BUILD_BUG_ON((1 << MIN_CLUSTER_BITS) < sizeof(*header));
diff --git a/block/qed.c b/block/qed.c
index 9d54c8eec5b0..6bcbace6f24a 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -687,7 +687,7 @@ static int coroutine_fn bdrv_qed_co_create(BlockdevCreateOptions *opts,
         ret = -EPERM;
         goto out;
     }
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
 
     /* Prepare image format */
     header = (QEDHeader) {
diff --git a/block/stream.c b/block/stream.c
index 8744ad103f71..660d9dd4fa22 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -331,8 +331,8 @@ void stream_start(const char *job_id, BlockDriverState *bs,
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
index 479bcfe820ed..b5f43f42021a 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -812,7 +812,7 @@ static int coroutine_fn vdi_co_do_create(BlockdevCreateOptions *create_options,
         goto exit;
     }
 
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
 
     /* We need enough blocks to store the given disk size,
        so always round up. */
diff --git a/block/vhdx.c b/block/vhdx.c
index 4c929800feeb..30904dc73978 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -2001,7 +2001,7 @@ static int coroutine_fn vhdx_co_create(BlockdevCreateOptions *opts,
         ret = -EPERM;
         goto delete_and_exit;
     }
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
 
     /* Create (A) */
 
diff --git a/block/vmdk.c b/block/vmdk.c
index afd347191527..ed9011648ec5 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2307,7 +2307,7 @@ static int coroutine_fn vmdk_create_extent(const char *filename,
         goto exit;
     }
 
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
 
     ret = vmdk_init_extent(blk, filesize, flat, compress, zeroed_grain, errp);
 exit:
@@ -2807,7 +2807,7 @@ static BlockBackend * coroutine_fn vmdk_co_create_cb(int64_t size, int idx,
     if (!blk) {
         return NULL;
     }
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
     bdrv_unref(bs);
 
     if (size != -1) {
diff --git a/block/vpc.c b/block/vpc.c
index 6ee95dcb9600..e5c420a8cb76 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -1015,7 +1015,7 @@ static int coroutine_fn vpc_co_create(BlockdevCreateOptions *opts,
         ret = -EPERM;
         goto out;
     }
-    blk_set_allow_write_beyond_eof(blk, true);
+    blk_allow_write_beyond_eof(blk);
 
     /* Get geometry and check that it matches the image size*/
     ret = calculate_rounded_image_size(vpc_opts, &cyls, &heads, &secs_per_cyl,
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 7ec6d978d408..f77adb1fe294 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -26,9 +26,9 @@ const char *blk_name(const BlockBackend *blk);
 
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
index 462ddb0e4adb..5c92bec6d005 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1778,7 +1778,7 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
      * be properly quiesced when entering a drained section, as our coroutines
      * servicing pending requests might enter blk_pread().
      */
-    blk_set_disable_request_queuing(blk, true);
+    blk_disable_request_queuing(blk);
 
     blk_add_aio_context_notifier(blk, blk_aio_attached, blk_aio_detach, exp);
 
@@ -1854,7 +1854,6 @@ static void nbd_export_delete(BlockExport *blk_exp)
     }
     blk_remove_aio_context_notifier(exp->common.blk, blk_aio_attached,
                                     blk_aio_detach, exp);
-    blk_set_disable_request_queuing(exp->common.blk, false);
 
     for (i = 0; i < exp->nr_export_bitmaps; i++) {
         bdrv_dirty_bitmap_set_busy(exp->export_bitmaps[i], false);
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index f677f1d9fc25..d44fa1728589 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -541,7 +541,7 @@ static void test_iothread_common(enum drain_type drain_type, int drain_thread)
                               &error_abort);
     s = bs->opaque;
     blk_insert_bs(blk, bs, &error_abort);
-    blk_set_disable_request_queuing(blk, true);
+    blk_disable_request_queuing(blk);
 
     blk_set_aio_context(blk, ctx_a, &error_abort);
     aio_context_acquire(ctx_a);
@@ -767,7 +767,7 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
                                   &error_abort);
     blk_target = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
     blk_insert_bs(blk_target, target, &error_abort);
-    blk_set_allow_aio_context_change(blk_target, true);
+    blk_allow_aio_context_change(blk_target);
 
     aio_context_acquire(ctx);
     tjob = block_job_create("job0", &test_job_driver, NULL, src,
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 8ca5adec5e82..68df827cddd8 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -793,7 +793,7 @@ static void test_propagate_mirror(void)
 
     /* ...unless we explicitly allow it */
     aio_context_acquire(ctx);
-    blk_set_allow_aio_context_change(blk, true);
+    blk_allow_aio_context_change(blk);
     bdrv_try_change_aio_context(target, ctx, NULL, &error_abort);
     aio_context_release(ctx);
 
-- 
2.38.1


