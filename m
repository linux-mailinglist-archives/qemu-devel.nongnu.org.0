Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1A639F7AC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:21:11 +0200 (CEST)
Received: from localhost ([::1]:60682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqbfJ-00084r-QT
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqbaz-00084V-JF; Tue, 08 Jun 2021 09:16:41 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqbax-0001vI-Ls; Tue, 08 Jun 2021 09:16:41 -0400
Received: by mail-wm1-x32c.google.com with SMTP id f17so1825730wmf.2;
 Tue, 08 Jun 2021 06:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w5BYwz9CkzKMn1Gz4JxvpKD5vqS4sgLfzaKKcpIrvYQ=;
 b=o0W/0u5v+AKNCd0FurLQgWlJMr4JFZI1SCp2nwuMp7/Kh27sxSaXqIitIlOPG8a+H7
 f6rImiq3v78oY47EWHWDazjVI+0d1HN9NkgY0fDDJXqn/w06eht7/rO7NRmXLf9LDb9W
 5Leps4vvz3FCya5AQLi4Spia/LtstqnbMbg4XWxHvQuDFnlrMyhZRI0tdAVZYasl/977
 0n1S8dtZorgfN+dmfvX3lzuENn2w152IJmR4PW56GeDx2cjZb+ppH6c0HaKdQ51YAGNb
 DLskqeEjaiEUC1+8pFNiO8V6ctay9So1kdY580eWfovbjYVsQBnpdXYYVsH0XBJcRh1A
 7vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w5BYwz9CkzKMn1Gz4JxvpKD5vqS4sgLfzaKKcpIrvYQ=;
 b=pA5Jm3IWgy6ZgtXiML4Au3jrVxRahIn/WRtAJ2Xl0SxKaAjtHv7Y5gvRq4i2pOLgm4
 jvF0a88hAE1LLiDFl9RoxR9mgygyCK/F3Uc5xHHhyyY/0+uuxTYKT66Y2N5s80K2yiEE
 +LHqIKpw/CNPwWoGoaAxal/veyMac7p/blQ5u056xxYxYtnYVWsyZZv24itfFLibYZgx
 dq0//gw93tR1l79aNahl0sSTmoeZiGISS0CLCrwJ1asyVehcw9N0dip7HsiNh312p9QT
 DNPAsaP2Jg6rBmHMH7Uof28WfwEnThmbWrmD34BUgRQgLPGacGxc5uC5YL0gnv62NTQG
 NSNg==
X-Gm-Message-State: AOAM533GFYEw2Ne7EuNFSYFyAoT1UnELjNCLm56Ah/HRYRT9FwgpATlC
 8/bne3fk8ehHk8RmuUkygJZ8WOgPON95vg==
X-Google-Smtp-Source: ABdhPJwVpue1B5NM5p04uk/2R19WyMFiyRQm3NhRxUtgIwfuIQeUJ3wzgZV2hSdrruFf5PU21kVdnw==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr21786708wmh.104.1623158197708; 
 Tue, 08 Jun 2021 06:16:37 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i9sm15855686wrn.54.2021.06.08.06.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 06:16:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/7] scsi-generic: pass max_segments via max_iov field in
 BlockLimits
Date: Tue,  8 Jun 2021 15:16:29 +0200
Message-Id: <20210608131634.423904-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608131634.423904-1-pbonzini@redhat.com>
References: <20210608131634.423904-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
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
index 536998a1d6..670c577bfe 100644
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



