Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E03639A25F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:41:03 +0200 (CEST)
Received: from localhost ([::1]:32774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lonao-0001cp-4v
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXW-0002yv-EV; Thu, 03 Jun 2021 09:37:38 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXU-00006U-Lb; Thu, 03 Jun 2021 09:37:38 -0400
Received: by mail-ed1-x536.google.com with SMTP id t3so7142751edc.7;
 Thu, 03 Jun 2021 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TXk60Ue5UcMQghXgK7HFTeenuUtizKd8R3ZkiQqwPxM=;
 b=a7LBLBLn7n55lvwYez12DWKDP15zijb0aCH7kFWnl+DqnaxV33Y/bPMpQZPNy3y1j7
 beGBe8uzkSTorkqFhcze+0s85b7Sl+mk5/tiAShf1qEKGsoEP0Y9zsfPugVXO5hd/x9B
 L8A/auKHi36j+frChE2rMWF1i0ZFcN1tcKvHYdet6oGT3lNJE3XdHAO8CArhIHbGUovR
 OJx75WHorfwLrtLBJFWf2f/04NHZ68PNkeu0+DepDOQR6HY1r8pPL87pOFou7G5Qg7eG
 s7jBO5GC5zwnY1hFTdqxHvOzrAIeGtpp+MvMf7eBmexRKa8MyDYQMu1MrquveVPHBGrv
 uxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TXk60Ue5UcMQghXgK7HFTeenuUtizKd8R3ZkiQqwPxM=;
 b=IHGXwd0TZgJU6v0ONXZCIB1FfTkDCfC2crgK2tawzBn9f+sBuYNsZ8NvoMdH0S55tA
 GS2dKMor+id5dow3eGUqtaZDdqFzkodNKgE6UyRhnSNhqYKLOKm7WBuTUuVN+1ozDjjI
 LVmHoPxyW5jo412NeNXuGTUqNq8oLjkceZJ5n30sAxOiWCYRXf/d6NWHl10Q98NL7LtG
 tdXP30oDsT6CMsIubix3WaYjn+f4h5RCLoGkbsJL6LUbzJ68LbpE/fg31+wN4KlTcYb8
 9L0A+CsWGTrl10TvwBkqhAk5jB198gnjXeKqkB12Z9J2sVSthSVrIwttEk3AucI8QpcV
 8i0A==
X-Gm-Message-State: AOAM530aIToi5OCsu6f8abZIwHsZkntthESUVkLKucBG8+YUr04ZyGQf
 IiZFBKOc1rW+brRQGY5t0r2aLeQ5/T77Qg==
X-Google-Smtp-Source: ABdhPJyH3fniqfEat9ZF3VHP9GxiY53Uy8bvgo5n/w7gFFzLgPplVVMztsSHx0OFB9713lheDM+lWQ==
X-Received: by 2002:a05:6402:152:: with SMTP id
 s18mr43169986edu.221.1622727454016; 
 Thu, 03 Jun 2021 06:37:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e24sm1555369ejb.52.2021.06.03.06.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:37:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] block: add max_hw_transfer to BlockLimits
Date: Thu,  3 Jun 2021 15:37:18 +0200
Message-Id: <20210603133722.218465-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603133722.218465-1-pbonzini@redhat.com>
References: <20210603133722.218465-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For block host devices, I/O can happen through either the kernel file
descriptor I/O system calls (preadv/pwritev, io_submit, io_uring)
or the SCSI passthrough ioctl SG_IO.

In the latter case, the size of each transfer can be limited by the
HBA, while for file descriptor I/O the kernel is able to split and
merge I/O in smaller pieces as needed.  Applying the HBA limits to
file descriptor I/O results in more system calls and suboptimal
performance, so this patch splits the max_transfer limit in two:
max_transfer remains valid and is used in general, while max_hw_transfer
is limited to the maximum hardware size.  max_hw_transfer can then be
included by the scsi-generic driver in the block limits page, to ensure
that the stricter hardware limit is used.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c          | 12 ++++++++++++
 block/file-posix.c             |  2 +-
 block/io.c                     |  1 +
 hw/scsi/scsi-generic.c         |  2 +-
 include/block/block_int.h      |  7 +++++++
 include/sysemu/block-backend.h |  1 +
 6 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 15f1ea4288..2ea1412a54 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1953,6 +1953,18 @@ uint32_t blk_get_request_alignment(BlockBackend *blk)
     return bs ? bs->bl.request_alignment : BDRV_SECTOR_SIZE;
 }
 
+/* Returns the maximum hardware transfer length, in bytes; guaranteed nonzero */
+uint64_t blk_get_max_hw_transfer(BlockBackend *blk)
+{
+    BlockDriverState *bs = blk_bs(blk);
+    uint64_t max = INT_MAX;
+
+    if (bs) {
+        max = MIN_NON_ZERO(bs->bl.max_hw_transfer, bs->bl.max_transfer);
+    }
+    return max;
+}
+
 /* Returns the maximum transfer length, in bytes; guaranteed nonzero */
 uint32_t blk_get_max_transfer(BlockBackend *blk)
 {
diff --git a/block/file-posix.c b/block/file-posix.c
index e3241a0dd3..f55f92d0f5 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1234,7 +1234,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
         int ret = sg_get_max_transfer_length(s->fd);
 
         if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
-            bs->bl.max_transfer = pow2floor(ret);
+            bs->bl.max_hw_transfer = pow2floor(ret);
         }
 
         ret = sg_get_max_segments(s->fd);
diff --git a/block/io.c b/block/io.c
index 323854d063..089b99bb0c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -127,6 +127,7 @@ static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
 {
     dst->opt_transfer = MAX(dst->opt_transfer, src->opt_transfer);
     dst->max_transfer = MIN_NON_ZERO(dst->max_transfer, src->max_transfer);
+    dst->max_hw_transfer = MIN_NON_ZERO(dst->max_hw_transfer, src->max_hw_transfer);
     dst->opt_mem_alignment = MAX(dst->opt_mem_alignment,
                                  src->opt_mem_alignment);
     dst->min_mem_alignment = MAX(dst->min_mem_alignment,
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 82e1e2ee79..3762dce749 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -179,7 +179,7 @@ static void scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s)
         (r->req.cmd.buf[1] & 0x01)) {
         page = r->req.cmd.buf[2];
         if (page == 0xb0) {
-            uint32_t max_transfer = blk_get_max_transfer(s->conf.blk);
+            uint64_t max_transfer = blk_get_max_hw_transfer(s->conf.blk);
             uint32_t max_iov = blk_get_max_iov(s->conf.blk);
 
             assert(max_transfer);
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 057d88b1fc..f1a54db0f8 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -695,6 +695,13 @@ typedef struct BlockLimits {
      * clamped down. */
     uint32_t max_transfer;
 
+    /* Maximal hardware transfer length in bytes.  Applies whenever
+     * transfers to the device bypass the kernel I/O scheduler, for
+     * example with SG_IO.  If larger than max_transfer or if zero,
+     * blk_get_max_hw_transfer will fall back to max_transfer.
+     */
+    uint64_t max_hw_transfer;
+
     /* memory alignment, in bytes so that no bounce buffer is needed */
     size_t min_mem_alignment;
 
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 5423e3d9c6..9ac5f7bbd3 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -208,6 +208,7 @@ void blk_eject(BlockBackend *blk, bool eject_flag);
 int blk_get_flags(BlockBackend *blk);
 uint32_t blk_get_request_alignment(BlockBackend *blk);
 uint32_t blk_get_max_transfer(BlockBackend *blk);
+uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
 int blk_get_max_iov(BlockBackend *blk);
 void blk_set_guest_block_size(BlockBackend *blk, int align);
 void *blk_try_blockalign(BlockBackend *blk, size_t size);
-- 
2.31.1



