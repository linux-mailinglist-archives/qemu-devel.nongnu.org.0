Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4177539F7B7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:22:36 +0200 (CEST)
Received: from localhost ([::1]:37766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqbgh-0003Bh-BG
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqbb1-00087R-4D; Tue, 08 Jun 2021 09:16:43 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqbay-0001wI-Bv; Tue, 08 Jun 2021 09:16:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id l2so21575655wrw.6;
 Tue, 08 Jun 2021 06:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dF7owOl+svnhvnWs3WgYxu4nGCHypf8DifXjCW0AXrU=;
 b=gAcmYzrNXaBPye7k7uvaY5wgZkdQMrTwBS+gtIEg3ZUCdXZW/gs7pYIhMR+Q5T9VgL
 vnVW0/SMyFvaXsr3o2Wy3T8HLhohqotkpmqdIGHmTXJKHNLzf14vOVJp7VyHjrrLiIUn
 sdSvigXhOgIuUuk4xGumJfw6oCYWKTl5ka0rZr31RUvxuAI2oks/EiRpZN2kikNOyVOE
 BNFa+n5e2zOZ8RezMJk0MCIfucMhQgnIBi2dTCilLr/1YXVIvTNngmdFkmdvfBTXwCMM
 NQFrEyFF6vSCLOxwWlcJncsrc4z0nXoJp1JNu9gdBJj5HSYv7QudtRqh9JNgRske59BA
 ICBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dF7owOl+svnhvnWs3WgYxu4nGCHypf8DifXjCW0AXrU=;
 b=ZlR75T3t2Ah0FNe4dHMRuMSueaq+0uGodrthtZWOsyeuZ4hJ0QegHGjMqWtJvcxSa0
 ld2/GykCQHftWhHvVjHwsFosmXPBjHgWoAj7rtiuuDxhsFlAILUIEXsALeQJrAvSssRa
 G+jI18ujYCbSkJK4RetEzGjZov4MaGRMEfeWTwLTIWJ29sdygrkSPZyVoFXlLlCAJdE7
 qok3Je4ts47WqWf3F+gmsJqaSoWUUwX2UcVLIE57k6UaMZOh76oXMiT3DR3WLtfVt5Cm
 mRp4US0Rfi9WMf0/bMFP3AIc7T8niXfhMMuGSnAsOF/okXjFd1FBW79y8B+Xd3LERqix
 nltg==
X-Gm-Message-State: AOAM532C039JPj1PiHgm+L8F7SFZOm9m0WQPCaZ/IW5YZUgUSZ0US+jH
 +33YU1XofXIsY2j5feulTrijY5IywMf0tw==
X-Google-Smtp-Source: ABdhPJylo3c8FC5lf0LbgokxGWpCB2IBgx2O1kkNHzs3f5BtsOxA6g0LF+YNvUblk0h5lF3LV0Ji0A==
X-Received: by 2002:adf:de03:: with SMTP id b3mr22720768wrm.15.1623158198466; 
 Tue, 08 Jun 2021 06:16:38 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i9sm15855686wrn.54.2021.06.08.06.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 06:16:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/7] block: add max_hw_transfer to BlockLimits
Date: Tue,  8 Jun 2021 15:16:30 +0200
Message-Id: <20210608131634.423904-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608131634.423904-1-pbonzini@redhat.com>
References: <20210608131634.423904-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org
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
index 670c577bfe..c9746d3eb6 100644
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



