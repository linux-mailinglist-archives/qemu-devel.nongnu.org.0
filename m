Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA173B4582
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:27:31 +0200 (CEST)
Received: from localhost ([::1]:46760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmnq-0000nn-3P
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfJ-0003Gq-II
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:41 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:42573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfI-0003Dp-0U
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:41 -0400
Received: by mail-ed1-x531.google.com with SMTP id m14so13622372edp.9
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oBy2rWBfxuFWeS2NQNlXhg91jwIz3LB5M14uVRp5Bzc=;
 b=g1BMS5Gl/DSFMP3wslBn8/Mdb5F2T8aVULnRn4SFWmPoAHZUzwknKjJdmVK9hHqx9D
 LQ8889rgBHsuGNoWnV8taKTBak/viDeCU3yVu+XHUKIOGfTdE5oc6kkil2GQAp4lbWmd
 v5F7UYaCC4sSbLRPT7Xw517kAHUYXDIBi3e89fmo5oCo05RzuOHoM4HH9k/rJro1vDfn
 dSJEr+xlyuYNnSETyfdUvZgR/WRM7lQ6eadqEw7wheYbPFdd1FeIkm/F91T+/T/1teeC
 eQpWVEudWkkkvhSBNm46gZS1rX321MTXTwbHz7ViPtbqOEEluModqFKzzRr+EvBKll0m
 cR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oBy2rWBfxuFWeS2NQNlXhg91jwIz3LB5M14uVRp5Bzc=;
 b=LyXEx49wRA18DaSkXf4tM5LB73XchnHSWfBNudKhGnKZlOz68ClUcQW+WyQ3VQzEMO
 AAtYdUxb5b281U6FqeVju/jruPUWohTtBP46uQsJ5emn7AJlJari/gsjwyN/Bbw59H/n
 4ZuQ4/z1qCxg6Dtj+LTZsf449qwU5iTo4YiGF+9l3AEt09Uo7/3IImmUYeVC31OT3And
 mTby6FnxkJl/X9aHMib1ac+T9KD2QvHCkgYJJyqFyxSV7pQ0uNqUyEvyjuai0JnI1L2H
 vdFLiouifu1vzg3u2ZxBW9ZhK2gsxzHAMeDZ3uIzQrp5J8ZRpFL5E3+o5c+SiDkBsV7f
 mW2A==
X-Gm-Message-State: AOAM5322VMIbnW0jru78bFoZXyUmeNM1UhSyyAJEuSQfITCGlBfCRx4Y
 H3ABf7GhWaBCmpb69CGCoCSDFCnugmw=
X-Google-Smtp-Source: ABdhPJz6lsLJ7t1fbpRNust1bRvlk+IwQZONwarxt4+5rtRZXhUjnBUNdYxzYw/Ii9yBmvXJswVNGg==
X-Received: by 2002:a05:6402:944:: with SMTP id
 h4mr14610303edz.76.1624630718623; 
 Fri, 25 Jun 2021 07:18:38 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/28] scsi-generic: pass max_segments via max_iov field in
 BlockLimits
Date: Fri, 25 Jun 2021 16:18:08 +0200
Message-Id: <20210625141822.1368639-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: Max Reitz <mreitz@redhat.com>
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



