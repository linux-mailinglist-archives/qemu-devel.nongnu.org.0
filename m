Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D4D3B3535
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:07:16 +0200 (CEST)
Received: from localhost ([::1]:46414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwTkx-0002V4-Jg
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiJ-0007zz-N6; Thu, 24 Jun 2021 14:04:35 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiH-0001R4-Dj; Thu, 24 Jun 2021 14:04:31 -0400
Received: by mail-ej1-x631.google.com with SMTP id hc16so10755187ejc.12;
 Thu, 24 Jun 2021 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oBy2rWBfxuFWeS2NQNlXhg91jwIz3LB5M14uVRp5Bzc=;
 b=XVL+ww5we5OR0G2n7Hl9nF+LFURkAG5B2y0c18jZX7Zba3oCRBpKaUU/REm98RJiwD
 s+kzhQO2Ru2AQ68Wf4GS62LdQ4MLS8FICJGb6FI1YLv6g+cWCTgt1Ik4476DX4nWIpiw
 LxJ15RtdGVN9RGaaM9xs5s1yi8mfqNHrXWCjjlBTKladJAmfcrv+SbzOUeaOxNUlpNSY
 B200pnIUVvS/Mm6ebekeFQ+ULUWReXKipV5jL7Cq9r8SOAtEUWmW8vOQRARmGz4tg/ax
 mLHCC2Blx2exOPjaQ4wtAHwTpGypq7hXRIciN84FxfLtxVtBlNlRL24BeTi8NGxjDzpL
 OQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oBy2rWBfxuFWeS2NQNlXhg91jwIz3LB5M14uVRp5Bzc=;
 b=NpKwgKfzYwnQJc035QNlvD0/YTPic2nBWbN3Iuv1CUm+sinIkMsIeW/i3Az4LAr5z8
 LJL+QWfkQ4bNTHSmvwMXWxTkHnH4PU7ouOVM94cKdUOLON5huFaDXLnTcq7zYOt8AlDN
 3gJYJjy0iv9TfOGhQqPBpOWdGDNxHZzQu8d2kSTflq1ws20P4jGMyb/g0qB+RwOqqpYl
 KeA0k/4bJw+KO7rQ98XKpDEw1antqCcPILcp7HCT68yVNDF7fRXqRfsfwi88FL13x20Y
 48BuwnlrVmq6s85MVnQI+GP8VxQGg8KrC/4r2zd0HQ8LfqGaXxPqPrjMxBJlIvrCIg7d
 MkpQ==
X-Gm-Message-State: AOAM5325+ndehg6C7OS1KN/ohL9ybm5aooFsfpLBqtU0x6EmeialH2YZ
 2U0Vj+umOmzhk++EF/A2f/WDvizYrXw=
X-Google-Smtp-Source: ABdhPJzzol6boMxNi2LQMCMJMfu+2foufVQ870eLjJsQljBcFck19rUk0fs0punIHyGg8X11JbrDOA==
X-Received: by 2002:a17:907:3f06:: with SMTP id
 hq6mr6195166ejc.130.1624557867074; 
 Thu, 24 Jun 2021 11:04:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a1sm2436466edt.16.2021.06.24.11.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 11:04:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] scsi-generic: pass max_segments via max_iov field in
 BlockLimits
Date: Thu, 24 Jun 2021 20:04:14 +0200
Message-Id: <20210624180423.1322165-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624180423.1322165-1-pbonzini@redhat.com>
References: <20210624180423.1322165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
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
Cc: mreitz@redhat.com, qemu-block@nongnu.org, mlevitsk@redhat.com
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
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/file-posix.c     | 3 +--
 hw/scsi/scsi-generic.c | 6 ++++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index b8dc19ce1a..6db690baf2 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1237,8 +1237,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 
         ret = sg_get_max_segments(s->fd);
         if (ret > 0) {
-            bs->bl.max_transfer = MIN(bs->bl.max_transfer,
-                                      ret * qemu_real_host_page_size);
+            bs->bl.max_iov = ret;
         }
     }
 
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 40e039864f..b6c4143dc7 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -179,10 +179,12 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
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



