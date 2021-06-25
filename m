Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82673B45A0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:33:14 +0200 (CEST)
Received: from localhost ([::1]:34920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmtN-0003ZX-Np
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfM-0003RA-8W
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:44 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfK-0003FL-FG
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:44 -0400
Received: by mail-ej1-x630.google.com with SMTP id n2so4244431eju.11
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XzrbbkEGL9DUDKoP6G9+FXKiRtPajUq/O5vyZRD1tS4=;
 b=Vz/20QPSnuOYRRtRMi2zbQCKshn+OHe47lZSdfta53ZVFUSb63sRvTO20djQtAA3UZ
 cReoXwAb5N6klXMH1cAL6h/KcoHENoPOvLRDQaCrSnSocWY58hQ9bVI0+vUbSbZBtG2L
 ZjErTM0uVicDe7rut6ZNC/1eIvbvvLS4ZkesA4FCeAFTUgsseRV3gAgxS4SC/BOIv2bt
 JthFDXeoUuFz7EEjLcy3SNhyVv7CrXcmGG0HQloWE7vRhU39u+nYl+sj8DnwV1Y/fKmE
 s53DXV1yMD5RfuNKtoTaTg1ZLKG/Tfzu1m8exEZQ6mc0KnlfaShB/q0WTo9cjqXA/bbi
 /jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XzrbbkEGL9DUDKoP6G9+FXKiRtPajUq/O5vyZRD1tS4=;
 b=ZUzZ50zDbgmxOGWqcdh6njObpcyMX/WAkp+DhUpU5mg9FSRRR2+HVVCob402IZIt8M
 j2sRkZg8UDaVbpOzTz6Lwr2lQbDZSpXIW4DZbz/EwJI7xBySMsCGsJjpvBTm10hMYkxh
 N8Sli1eGm31fJDEmTMTeXv7nUP/jk7QtMT9nW8IxKzT6odl2brV2Ur4/ZBhMcYIuYS2K
 rGLHXPZDpEB0ut3Bh5y03RWfd+30Jc7jzZ8ZBNAbbPZRF956Tf6a95h8uBQLwAinPQXp
 sY5Q/6FjFLdTPvp/guA5891Efh324WvTwh7/B9A/KOaTTHK8LKgthsm4HlE3H4mBJjnc
 CegA==
X-Gm-Message-State: AOAM530lk/NSfwCa9kzetDmKcDPqcRJ65221otlY2l/6i2pluVMNNgKb
 xmKU5sqMhqyp8X8lvbaCkQYP9E8EDPk=
X-Google-Smtp-Source: ABdhPJymfd6xnnf9yZ0LJiJM+SyLoJGVEixILNKE6WDPOoBw/waBb2NTXgmIr0BvsEFNpYqH2ngsgg==
X-Received: by 2002:a17:906:e03:: with SMTP id l3mr10901963eji.6.1624630721009; 
 Fri, 25 Jun 2021 07:18:41 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/28] block: add max_hw_transfer to BlockLimits
Date: Fri, 25 Jun 2021 16:18:11 +0200
Message-Id: <20210625141822.1368639-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 block/block-backend.c          | 13 +++++++++++++
 block/file-posix.c             |  2 +-
 block/io.c                     |  2 ++
 hw/scsi/scsi-generic.c         |  2 +-
 include/block/block_int.h      |  7 +++++++
 include/sysemu/block-backend.h |  1 +
 6 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 6e37582740..deb55c272e 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1953,6 +1953,19 @@ uint32_t blk_get_request_alignment(BlockBackend *blk)
     return bs ? bs->bl.request_alignment : BDRV_SECTOR_SIZE;
 }
 
+/* Returns the maximum hardware transfer length, in bytes; guaranteed nonzero */
+uint64_t blk_get_max_hw_transfer(BlockBackend *blk)
+{
+    BlockDriverState *bs = blk_bs(blk);
+    uint64_t max = INT_MAX;
+
+    if (bs) {
+        max = MIN_NON_ZERO(max, bs->bl.max_hw_transfer);
+        max = MIN_NON_ZERO(max, bs->bl.max_transfer);
+    }
+    return ROUND_DOWN(max, blk_get_request_alignment(blk));
+}
+
 /* Returns the maximum transfer length, in bytes; guaranteed nonzero */
 uint32_t blk_get_max_transfer(BlockBackend *blk)
 {
diff --git a/block/file-posix.c b/block/file-posix.c
index 6db690baf2..88e58d2863 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1232,7 +1232,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
         int ret = sg_get_max_transfer_length(s->fd);
 
         if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
-            bs->bl.max_transfer = pow2floor(ret);
+            bs->bl.max_hw_transfer = pow2floor(ret);
         }
 
         ret = sg_get_max_segments(s->fd);
diff --git a/block/io.c b/block/io.c
index 323854d063..dd93364258 100644
--- a/block/io.c
+++ b/block/io.c
@@ -127,6 +127,8 @@ static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
 {
     dst->opt_transfer = MAX(dst->opt_transfer, src->opt_transfer);
     dst->max_transfer = MIN_NON_ZERO(dst->max_transfer, src->max_transfer);
+    dst->max_hw_transfer = MIN_NON_ZERO(dst->max_hw_transfer,
+                                        src->max_hw_transfer);
     dst->opt_mem_alignment = MAX(dst->opt_mem_alignment,
                                  src->opt_mem_alignment);
     dst->min_mem_alignment = MAX(dst->min_mem_alignment,
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index b6c4143dc7..665baf900e 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -179,7 +179,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
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



