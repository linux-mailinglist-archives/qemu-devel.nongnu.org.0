Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7CC502AE4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:23:13 +0200 (CEST)
Received: from localhost ([::1]:36674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfLuq-00018B-PO
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrS-0006Xf-3j; Fri, 15 Apr 2022 09:19:43 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrP-0007qZ-KS; Fri, 15 Apr 2022 09:19:41 -0400
Received: by mail-ed1-x52b.google.com with SMTP id z12so9927664edl.2;
 Fri, 15 Apr 2022 06:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/b+5wydA9RdU0ZF0qsuG26Wp2w9p/13mEw4B/cEDK5A=;
 b=BHdYhL9NooFAnQOXQq+DN72delKYZHJ4grdZRsxvl0jYMVoNBBuhLrNfabZPV8uDkc
 Ww+6KWY3HGNGoqZKh/EYVvxc8egfdHb8YWv2AwX+Cpeldh1ztlUaBFhqZYzSl6qP+63R
 AUoopeHW7CL98tyxpm9YfocQDgOoY/nEZRfGeA0O+bRJwHAvfFJaXRhVx8uzudeJQt+4
 h/07KH9UyyUlJsJ4TST9EwtcIp+Olb9rD8NU+Gy0hkZg4w09dRQ44E3eaYfbk7TSKCwF
 l7yFFsThwEvdYTpj0Td0uUx0QlkSJfhGEB1qRb3fkDEbB8kYk/0wzsBchgg2BzFP456O
 f2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/b+5wydA9RdU0ZF0qsuG26Wp2w9p/13mEw4B/cEDK5A=;
 b=v4RA4oFCpJhiGv/uT88p/1c16m0NKGKHnYQ3SX/6R2jca8Bdd5Y/mqUm37Q0M7ybCs
 FXpiLsvDG9gphUtB5aZy2kyoG8lzNLQxAIdJx/41SLQ0OEe1aofIGrKI6vPllFAOUr67
 yG9FUMfv/ByKqvCfKVlvxzM7NIwNMwaUBtzGFiAl+2I0qBKrqF+eS4ES/1ibTFTdPixK
 C2yglWwzF29Wj24hw0bBQ0/D2Ye7bIEx5Aldv6hVLyOWLlhgDMOw2k/pIhu5b+GymzWQ
 XeTBX+vO5EosCmG5aC0VNK33fHWZU+EawS0nTHuy30pqSJmfPWUYUG9sNRaE2m5T+KnG
 7P6Q==
X-Gm-Message-State: AOAM531oCUpRojjN8Yfl52+HCWkuaTTbJ4tBvO/5QSivSSA+xSwXeDEo
 ObLkMs833DyPPsYj33dc/5AQoCbP+Uo0Jg==
X-Google-Smtp-Source: ABdhPJwTwN1ZHbe79445bwgzQVjPbA7k0zXc75Q0jR0Z2nXBToxTs5knIaUIS1uD0O7C5wTrBeuhIg==
X-Received: by 2002:a05:6402:1148:b0:413:11e0:1f58 with SMTP id
 g8-20020a056402114800b0041311e01f58mr8143186edw.113.1650028776531; 
 Fri, 15 Apr 2022 06:19:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:19:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/26] block: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:41 +0200
Message-Id: <20220415131900.793161-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: malureau@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c | 18 +++++++++---------
 block/io.c            | 24 ++++++++++++------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index fedf2eca83..52009b8949 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1413,8 +1413,8 @@ typedef struct BlkRwCo {
     BdrvRequestFlags flags;
 } BlkRwCo;
 
-int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                      int64_t bytes, BdrvRequestFlags flags)
+int coroutine_fn blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                                   int64_t bytes, BdrvRequestFlags flags)
 {
     IO_OR_GS_CODE();
     return blk_pwritev_part(blk, offset, bytes, NULL, 0,
@@ -1534,7 +1534,7 @@ static BlockAIOCB *blk_aio_prwv(BlockBackend *blk, int64_t offset,
     return &acb->common;
 }
 
-static void blk_aio_read_entry(void *opaque)
+static void coroutine_fn blk_aio_read_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
@@ -1546,7 +1546,7 @@ static void blk_aio_read_entry(void *opaque)
     blk_aio_complete(acb);
 }
 
-static void blk_aio_write_entry(void *opaque)
+static void coroutine_fn blk_aio_write_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
@@ -1580,8 +1580,8 @@ int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes)
     return ret < 0 ? ret : bytes;
 }
 
-int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
-               BdrvRequestFlags flags)
+int coroutine_fn blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
+                            BdrvRequestFlags flags)
 {
     int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
@@ -1681,7 +1681,7 @@ int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
     return ret;
 }
 
-static void blk_aio_ioctl_entry(void *opaque)
+static void coroutine_fn blk_aio_ioctl_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
@@ -1715,7 +1715,7 @@ blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
     return bdrv_co_pdiscard(blk->root, offset, bytes);
 }
 
-static void blk_aio_pdiscard_entry(void *opaque)
+static void coroutine_fn blk_aio_pdiscard_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
@@ -1771,7 +1771,7 @@ int coroutine_fn blk_co_do_flush(BlockBackend *blk)
     return bdrv_co_flush(blk_bs(blk));
 }
 
-static void blk_aio_flush_entry(void *opaque)
+static void coroutine_fn blk_aio_flush_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
diff --git a/block/io.c b/block/io.c
index 9769ec53b0..7db9be3c03 100644
--- a/block/io.c
+++ b/block/io.c
@@ -751,7 +751,7 @@ void bdrv_drain_all(void)
  *
  * This function should be called when a tracked request is completing.
  */
-static void tracked_request_end(BdrvTrackedRequest *req)
+static void coroutine_fn tracked_request_end(BdrvTrackedRequest *req)
 {
     if (req->serialising) {
         qatomic_dec(&req->bs->serialising_in_flight);
@@ -766,11 +766,11 @@ static void tracked_request_end(BdrvTrackedRequest *req)
 /**
  * Add an active request to the tracked requests list
  */
-static void tracked_request_begin(BdrvTrackedRequest *req,
-                                  BlockDriverState *bs,
-                                  int64_t offset,
-                                  int64_t bytes,
-                                  enum BdrvTrackedRequestType type)
+static void coroutine_fn tracked_request_begin(BdrvTrackedRequest *req,
+                                               BlockDriverState *bs,
+                                               int64_t offset,
+                                               int64_t bytes,
+                                               enum BdrvTrackedRequestType type)
 {
     bdrv_check_request(offset, bytes, &error_abort);
 
@@ -809,7 +809,7 @@ static bool tracked_request_overlaps(BdrvTrackedRequest *req,
 }
 
 /* Called with self->bs->reqs_lock held */
-static BdrvTrackedRequest *
+static coroutine_fn BdrvTrackedRequest *
 bdrv_find_conflicting_request(BdrvTrackedRequest *self)
 {
     BdrvTrackedRequest *req;
@@ -1704,10 +1704,10 @@ static bool bdrv_init_padding(BlockDriverState *bs,
     return true;
 }
 
-static int bdrv_padding_rmw_read(BdrvChild *child,
-                                 BdrvTrackedRequest *req,
-                                 BdrvRequestPadding *pad,
-                                 bool zero_middle)
+static coroutine_fn int bdrv_padding_rmw_read(BdrvChild *child,
+                                              BdrvTrackedRequest *req,
+                                              BdrvRequestPadding *pad,
+                                              bool zero_middle)
 {
     QEMUIOVector local_qiov;
     BlockDriverState *bs = child->bs;
@@ -3228,7 +3228,7 @@ out:
     return ret;
 }
 
-int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf)
+int coroutine_fn bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf)
 {
     BlockDriver *drv = bs->drv;
     CoroutineIOCompletion co = {
-- 
2.35.1



