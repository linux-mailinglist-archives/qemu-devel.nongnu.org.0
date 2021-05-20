Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A4438A004
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:41:26 +0200 (CEST)
Received: from localhost ([::1]:54256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeFB-0006K8-RX
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxj-0005RI-98
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:29 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxe-0001bZ-W4
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:22 -0400
Received: by mail-wr1-x435.google.com with SMTP id v12so16673106wrq.6
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfZamIf15Ke/BeRA5FMstz0DDkSoart1dVqPlrNSeDc=;
 b=I1RxqJIAGCZETtJiQ3/FCP+aDY4XqtU0xy6PW9CzitxLHzkV3HmMTVRJSQRLPTQIGR
 keL6aGjv+2IPQ0Q6IrDAdmsuweMcaeKNyReE3M84HQD6WssSwF1Estp+YqUyWKQ7+HxO
 sO/lhmalHGEK/osf+UNx8rV08+oSfNy1lSl2QvgNiyokqZ0lhluLqJE7CiV+vnTtVICC
 qtUIrI9cfn2PfmN+ccu1XSOUviDpjbvldqpl+CRgkUorC9DDt2pVpziSoBSx4JENcTtA
 JcJyWQdAVBcX1ppt5fUBWDX+yuY+V1Muzs1sKyhqMxPTFz5Mg2VTvN0BoKJMDK2aaUBa
 10Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mfZamIf15Ke/BeRA5FMstz0DDkSoart1dVqPlrNSeDc=;
 b=MJHJa1YKP4JecaWTCvo9uvyqzeaf3g8bE3T3Q/NkGh6jowVHphnJP6b1nY7c4EXjVJ
 +E5In56HQxRksR7dcvd9syWFIToqpBeHLvO+X09g9/DLcnA5ed5z3Vn3b74RI8ptLK+b
 dNAZbtZ+nuvPdfqL53b1TlarUH4DopJ+yC7528MmfhQXjQdDxQZ7DMCZa6SVOA2PvHMS
 XuKcSSuzfpAr9mUa5QXM6DajQaTkCAEZmkwMeKy+HpmkLxNuyGVsWyy/z0F8vHNFGA+u
 jLSUgINYeOuwai9xMhqUPnvkUF2NoyzieXmQysdBY3KXZZvd2PWU6BArBkSrKYwzeiUm
 PPgg==
X-Gm-Message-State: AOAM533NHUWFQEZs8EDuYcMGdXBMmBwO0E0E5BQEgM1Ai/K+h6zQLs/d
 ZKauFdCFsqqA0NTtRj06C5eO7DyL1v4NwQ==
X-Google-Smtp-Source: ABdhPJyCdQRDXg2SyeudYiC9s8IxLwanuBspulh9+FnW9YDj6zADI0veQyqLhC1npaiPbLQjbhOKqw==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr2998959wre.157.1621498995569; 
 Thu, 20 May 2021 01:23:15 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.14 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/26] scsi-generic: pass max_segments via max_iov field in
 BlockLimits
Date: Thu, 20 May 2021 10:22:57 +0200
Message-Id: <20210520082257.187061-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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
index 10b71d9a13..59c889d5a7 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1228,8 +1228,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 
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


