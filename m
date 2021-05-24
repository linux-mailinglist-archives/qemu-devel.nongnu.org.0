Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFABF38F1AD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:42:17 +0200 (CEST)
Received: from localhost ([::1]:53802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDei-0002t0-Jx
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDZT-00076k-Fy; Mon, 24 May 2021 12:36:51 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDZR-0002kw-Po; Mon, 24 May 2021 12:36:51 -0400
Received: by mail-ed1-x52a.google.com with SMTP id t15so32726869edr.11;
 Mon, 24 May 2021 09:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfZamIf15Ke/BeRA5FMstz0DDkSoart1dVqPlrNSeDc=;
 b=XK/AQIEqMEpVsNugmbEfMYGf123pNsC5/ASU4D0lXQZ5OcINiZe+pR6BVRjasUVjzi
 XUMz1rvgtujTB8zdDBAptq45wV09b5ALbvG8HbtWaJEawZa24NQLHA0n85Lq0eL2MNEY
 3pxH2fK1lSZ1EFKtnqnj0uhNAN14FdRPMOtOdyh1Nz2xZMtaCpZunozQJlUR69ql3L8s
 nwHzi1jLpSwKq3+fRq+R9ymYsQpWCB7ZEAMefhO7l5ozUPMu0G/rKlUgbBvUdIFnXb6D
 YmbYSj5TT5iNCaascZDMHLy/DhCemePVyrkWMTPwCtZODm9wp7JgxksAu1DvGAxkF6RF
 XvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mfZamIf15Ke/BeRA5FMstz0DDkSoart1dVqPlrNSeDc=;
 b=To3TIJABsqrCQaxXJQutqvvRrpiRc8eQDe21c8g1CvQWHhuYQLUbXcdI7mEF63yg5E
 NTF7PBts7QqutfHkW0OlDZPg8UgJJwoNe3h8cBOobJCDJ50/htqhRqNpkeAhdJ+ToRW+
 /RjPiwj2r3ZcchVznBylCDJ9BMgsVi1ltPHr+mRn+C1GHceUMvAr5CDTzuSSqauqIlQl
 OdCnR91BL3AdHnNGnh9I+IRHgvg+bLo+oLw/QuV+XQvs4e8b2U+DXNEZQ8NNeRXsDm2k
 S+3HSqvhZU/xy+dWgXCwYPcg+/YTWM2Jv7eyOtQODOiC3CKZ+SE4rKaZaMQKgk7bwS5g
 m1Gw==
X-Gm-Message-State: AOAM530rGYQOLFghSuTEKxxGCpT+n5qhGKeN/FjRJ6cmwWXUOmwga/C4
 wSuaFZ1ITO3S8kaetksDabwYiRr6qO/clw==
X-Google-Smtp-Source: ABdhPJwVYWMDnSG8hQnwP71u3irBpnNn453Vmytt3B4CIr/Kqm2WzvMjM4OYpUP2em6GAJftPtfFgg==
X-Received: by 2002:a50:fd11:: with SMTP id i17mr26486789eds.23.1621874207472; 
 Mon, 24 May 2021 09:36:47 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n8sm7967684ejl.0.2021.05.24.09.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:36:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] scsi-generic: pass max_segments via max_iov field in
 BlockLimits
Date: Mon, 24 May 2021 18:36:40 +0200
Message-Id: <20210524163645.382940-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524163645.382940-1-pbonzini@redhat.com>
References: <20210524163645.382940-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: qemu-block@nongnu.org
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



