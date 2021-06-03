Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6811739A259
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:39:08 +0200 (CEST)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lonYx-0005O6-CK
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXV-0002x9-Jx; Thu, 03 Jun 2021 09:37:37 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXT-00006F-VI; Thu, 03 Jun 2021 09:37:37 -0400
Received: by mail-ed1-x534.google.com with SMTP id dj8so7164204edb.6;
 Thu, 03 Jun 2021 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vbYfEBjMJnHzWkw4pPc6Wcc79dlc0TcTnsXCmhSPV+E=;
 b=tdML921oBxDGd94yOU2xLmbz86p1Vv5d3Gtr9UMczuB+14vDpfgUl4J/fSrEe8RnrU
 y1XvRCFvuoxe+b8FgpOZrszh9JEcCd3nQ6f5SxdKJOdo7oO9yNDPxfmrQDuXergxqMF5
 rMEH3nxPzHbBnztANQg++d9/qDTO5vL2Znb9e5uNIr+HsP2EVD8gJ2fuXbonNr8hFEDx
 LaveP0E5O5ebyVW3OCoxhqV6CwXnLSO7LQ/950IbJVVDWpbTT8Kxbz8tRFmGVkXjbo76
 yPvqH1Djzg9PzCW7ndkL73r6OjiU+1QmU3/HqdHaToIacR08joRar6pcnxkN4dot72yl
 zLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vbYfEBjMJnHzWkw4pPc6Wcc79dlc0TcTnsXCmhSPV+E=;
 b=Q9agVd0HXuYs0qjjPVag3gMiapbyUAxSPFcn6JJqtPkRcfCi0qb1YTjlOMv/pX+csi
 0GI6nIFSDiiJBhsEFvAbFItDLDd35GSllbYIwclkHhSlQAapzeyqDFioAgNfv+zAY6nj
 kGOOJS7arx/uT9xbPY6sJ8OIzMauV7AOsn6Mk7lkv/Cl65BhhDKUn4t5911oFY3neaqe
 z0F3TCQgRD7Y9VvL8KSKtWm2eZ7EO791lJCMMu9b9Q20k9JklaiFAZ2omXWY1S3OP+cp
 ft52q6bW4l65a7OSyIyUgqJ8KNDU2aza26czA16RyCBValIoIx2LohUTlYXPKfJE0ws4
 DQbg==
X-Gm-Message-State: AOAM531r9Rmi8Tw5i+8lUnw6rPRo/MVNk2cFeX3VLvvE2zpMmfy7niPw
 yyxtk3ypKD6UKMOMAtdFW9nAYe6HJTPsuw==
X-Google-Smtp-Source: ABdhPJzZd0llU/EsJdvHjhmZwriRi1j+LMYOhE3494/MNauVLbTm7EFF7dclSzz9RaR3DLkZNIcsqw==
X-Received: by 2002:a50:8e44:: with SMTP id 4mr44119663edx.244.1622727453209; 
 Thu, 03 Jun 2021 06:37:33 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e24sm1555369ejb.52.2021.06.03.06.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:37:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] scsi-generic: pass max_segments via max_iov field in
 BlockLimits
Date: Thu,  3 Jun 2021 15:37:17 +0200
Message-Id: <20210603133722.218465-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603133722.218465-1-pbonzini@redhat.com>
References: <20210603133722.218465-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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
index 58db526cc2..e3241a0dd3 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1239,8 +1239,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 
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
2.31.1



