Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09110563FE0
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 13:49:12 +0200 (CEST)
Received: from localhost ([::1]:53934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7bcd-0002Xy-4S
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 07:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o7bO7-0003W4-KY
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:34:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o7bO5-00080i-LP
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656761649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ucg/IwUXXbiD7o0QoLNGNJZ5xaPheNGQ2/axa9ThQo=;
 b=hC0qKsbsL+bG+PT0cmCyi8sja0NlUtXmZdVJo83wlQkhOfzW+Ymwy09hLPKF/hM3WCtHjr
 UCm8b27OW9CPB3wRjCZS8w/xTcdhra6Sl6zEApGpeAoCmtZIjKQ35YBZdpbdyocjUuoacR
 B05B2x2o/bIXCRAFG3V/cQUFUYHdRVs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-XcNUMVLgPGiEUg1gD9Fgiw-1; Sat, 02 Jul 2022 07:34:05 -0400
X-MC-Unique: XcNUMVLgPGiEUg1gD9Fgiw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 584FC1C068E2;
 Sat,  2 Jul 2022 11:34:05 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3161F492C3B;
 Sat,  2 Jul 2022 11:34:02 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alberto Garcia <berto@igalia.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>, Alberto Faria <afaria@redhat.com>
Subject: [RFC 8/8] Avoid calls from coroutine_fn to no_coroutine_fn
Date: Sat,  2 Jul 2022 12:33:31 +0100
Message-Id: <20220702113331.2003820-9-afaria@redhat.com>
In-Reply-To: <20220702113331.2003820-1-afaria@redhat.com>
References: <20220702113331.2003820-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
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

These calls were found by static-analyzer.py.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c  |  2 +-
 block/io.c             | 10 +++++-----
 block/parallels.c      |  4 ++--
 block/qcow2-refcount.c |  2 +-
 block/qed-table.c      |  2 +-
 block/qed.c            |  2 +-
 block/vmdk.c           |  4 ++--
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 5f2a912a59..8fa48576cd 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1395,7 +1395,7 @@ static int coroutine_fn blk_pwritev_part(BlockBackend *blk, int64_t offset,
     int ret;
 
     blk_inc_in_flight(blk);
-    ret = blk_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
+    ret = blk_co_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
     blk_dec_in_flight(blk);
 
     return ret;
diff --git a/block/io.c b/block/io.c
index bbfe94503b..832bccd31e 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2781,8 +2781,8 @@ int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
         return 1;
     }
 
-    ret = bdrv_common_block_status_above(bs, NULL, false, false, offset,
-                                         bytes, &pnum, NULL, NULL, NULL);
+    ret = bdrv_co_common_block_status_above(bs, NULL, false, false, offset,
+                                            bytes, &pnum, NULL, NULL, NULL);
 
     if (ret < 0) {
         return ret;
@@ -2798,9 +2798,9 @@ int coroutine_fn bdrv_is_allocated(BlockDriverState *bs, int64_t offset,
     int64_t dummy;
     IO_CODE();
 
-    ret = bdrv_common_block_status_above(bs, bs, true, false, offset,
-                                         bytes, pnum ? pnum : &dummy, NULL,
-                                         NULL, NULL);
+    ret = bdrv_co_common_block_status_above(bs, bs, true, false, offset,
+                                            bytes, pnum ? pnum : &dummy, NULL,
+                                            NULL, NULL);
     if (ret < 0) {
         return ret;
     }
diff --git a/block/parallels.c b/block/parallels.c
index 8879b7027a..22c59a1ee2 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -503,8 +503,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
              * In order to really repair the image, we must shrink it.
              * That means we have to pass exact=true.
              */
-            ret = bdrv_truncate(bs->file, res->image_end_offset, true,
-                                PREALLOC_MODE_OFF, 0, &local_err);
+            ret = bdrv_co_truncate(bs->file, res->image_end_offset, true,
+                                   PREALLOC_MODE_OFF, 0, &local_err);
             if (ret < 0) {
                 error_report_err(local_err);
                 res->check_errors++;
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index ed0ecfaa89..e30fd38e14 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1233,7 +1233,7 @@ int coroutine_fn qcow2_flush_caches(BlockDriverState *bs)
         return ret;
     }
 
-    return bdrv_flush(bs->file->bs);
+    return bdrv_co_flush(bs->file->bs);
 }
 
 /*********************************************************/
diff --git a/block/qed-table.c b/block/qed-table.c
index 1cc844b1a5..aa203f2627 100644
--- a/block/qed-table.c
+++ b/block/qed-table.c
@@ -100,7 +100,7 @@ static int coroutine_fn qed_write_table(BDRVQEDState *s, uint64_t offset,
     }
 
     if (flush) {
-        ret = bdrv_flush(s->bs);
+        ret = bdrv_co_flush(s->bs);
         if (ret < 0) {
             goto out;
         }
diff --git a/block/qed.c b/block/qed.c
index 96f4cda83f..dc9f065c02 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -490,7 +490,7 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
         }
 
         /* From here on only known autoclear feature bits are valid */
-        bdrv_flush(bs->file->bs);
+        bdrv_co_flush(bs->file->bs);
     }
 
     s->l1_table = qed_alloc_table(s);
diff --git a/block/vmdk.c b/block/vmdk.c
index 38e5ab3806..5c94a2f27c 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2150,8 +2150,8 @@ vmdk_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
                 return length;
             }
             length = QEMU_ALIGN_UP(length, BDRV_SECTOR_SIZE);
-            ret = bdrv_truncate(s->extents[i].file, length, false,
-                                PREALLOC_MODE_OFF, 0, NULL);
+            ret = bdrv_co_truncate(s->extents[i].file, length, false,
+                                   PREALLOC_MODE_OFF, 0, NULL);
             if (ret < 0) {
                 return ret;
             }
-- 
2.36.1


