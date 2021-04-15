Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2F23609C2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:48:23 +0200 (CEST)
Received: from localhost ([::1]:41124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1Py-0004Tz-Ai
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lX1Kz-0008Hd-FD; Thu, 15 Apr 2021 08:43:13 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lX1Kx-0006SN-R1; Thu, 15 Apr 2021 08:43:13 -0400
Received: by mail-ed1-x530.google.com with SMTP id e7so27813909edu.10;
 Thu, 15 Apr 2021 05:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rhfohXvd9u9hiyEFj5jEs/XQvfO1s0x/uIcLpSe61TU=;
 b=lC55u/Hy0jEIz/lqrhmaGoRPOLkA/k5Ljkh420pxGGk6gf9dTdh0cyt5bGxlbncqSP
 MoJv3Qn2HAnODpzz3+IQ+/507SGhwxxwPazD/RczHMun6kli1emwE1H9v6uVb9UQPfsa
 srBuJTdMrohZY8kFgmNZGEJFgzoJGGfh3gPpHvdfXXiQqqtkzEKy16fRCk/5qUOEAY7i
 qTY4YEk6ui0hAT+aYVnfnA9XOyThCbhFGD6UzP8nzgK8OdOCYqXa+Up3Y8MMz4TciZZU
 Ps5LiHh3DUbk3eMZzXg5b1KPIZjuLhJ7K8aB1hNksJ0u6LhzcZ2BGsv4QOtfi9D26KfM
 BlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rhfohXvd9u9hiyEFj5jEs/XQvfO1s0x/uIcLpSe61TU=;
 b=WTeuk4RVIA85BRcKlAIK++rEOFTFp0+U7ixg/1OyFvFcGp9xo1dAx5vRY87M9Z7Op5
 grLIMMTO++FDsc1ZXchPn53pw7K1lSh3vmskA0yOcaumN/G0NHQ3piQWalFUX0Ku/540
 Zg7ujav0Mx7AX/LIAO+sNZWMJqn/NopCCfmBqzuXDFvH/nwmKv2vE61twFuOJmq49rkb
 WS3Pvjvh7F8ybPkLDpNondC0INkaEzlRR3wFdnXZNGqLiZoB2PyNoG2xILWTuG1kuX4p
 IaMuEMqOfV5TGlZB1p9bPiHk703lghRKlosMYrftXxblkxWCuSIUJ5vrmZxnwo0KDFjT
 z0UA==
X-Gm-Message-State: AOAM532f+KiLQAjvHdrXsPFY6So/P4syP17J80eqTiWKNBkrP0qPW8yW
 k9HKw9xaypadFQQfyZbPNoqjbIulD6s=
X-Google-Smtp-Source: ABdhPJxLoQCRPT6UhIsSf0l0Lx62KGnDVG298mkBvgumAcrGCrlwbVff7fziy97pZgdZeWWKfDjLrQ==
X-Received: by 2002:aa7:c5c6:: with SMTP id h6mr2598955eds.136.1618490590150; 
 Thu, 15 Apr 2021 05:43:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id r10sm1862585ejd.112.2021.04.15.05.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:43:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] scsi-generic: pass max_segments via max_iov field in
 BlockLimits
Date: Thu, 15 Apr 2021 14:43:05 +0200
Message-Id: <20210415124307.428203-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210415124307.428203-1-pbonzini@redhat.com>
References: <20210415124307.428203-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I/O to a disk via read/write is not limited by the number of segments allowed
by the host adapter; the kernel can split requests if needed, and the limit
imposed by the host adapter can be very low (256k or so) to avoid that SG_IO
returns EINVAL if memory is heavily fragmented.

Since this value is only interesting for SG_IO-based I/O, do not include
it in the max_transfer and only take it into account when patching the
block limits VPD page in the scsi-generic device.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c     | 3 +--
 hw/scsi/scsi-generic.c | 6 ++++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 20e14f8e96..9e316a2a97 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1252,8 +1252,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 
         ret = sg_get_max_segments(s->fd);
         if (ret > 0) {
-            bs->bl.max_transfer = MIN(bs->bl.max_transfer,
-                                      ret * qemu_real_host_page_size);
+            bs->bl.max_iov = ret;
         }
     }
 
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 98c30c5d5c..82e1e2ee79 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -179,10 +179,12 @@ static void scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s)
         (r->req.cmd.buf[1] & 0x01)) {
         page = r->req.cmd.buf[2];
         if (page == 0xb0) {
-            uint32_t max_transfer =
-                blk_get_max_transfer(s->conf.blk) / s->blocksize;
+            uint32_t max_transfer = blk_get_max_transfer(s->conf.blk);
+            uint32_t max_iov = blk_get_max_iov(s->conf.blk);
 
             assert(max_transfer);
+            max_transfer = MIN_NON_ZERO(max_transfer, max_iov * qemu_real_host_page_size)
+                / s->blocksize;
             stl_be_p(&r->buf[8], max_transfer);
             /* Also take care of the opt xfer len. */
             stl_be_p(&r->buf[12],
-- 
2.30.1



