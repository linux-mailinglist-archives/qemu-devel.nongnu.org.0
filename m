Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6012D43A0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 14:59:53 +0100 (CET)
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn00W-0003Hx-Rx
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 08:59:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmzvu-00081m-Q7
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 08:55:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmzvs-0000bK-74
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 08:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607522103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFdr45lZbh4a0j9aZwe8o/S6u+IWfguN1aBwlZZFVPY=;
 b=hMs64EpchKqEi5iwJrfMkEdRkTFg6UoVRW+Dgh3C0MiUgf9mwn+IKVxjfZ2y93m5oZidg5
 q03rhOyAVjdmONs3myREk1M3H0hwWjvrOKnFiYkHoJ47YyOnTAq9QlocmfUmG8+R11KhFj
 ADR/w+nvWLwTzPLVnz5FAaYnKTmWz6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-aSYS8QC5NJGI7Lit2UgOQQ-1; Wed, 09 Dec 2020 08:55:02 -0500
X-MC-Unique: aSYS8QC5NJGI7Lit2UgOQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 970FC803654;
 Wed,  9 Dec 2020 13:54:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 309185D6BA;
 Wed,  9 Dec 2020 13:54:18 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] block: use blk_get_max_ioctl_transfer for SCSI
 passthrough
Date: Wed,  9 Dec 2020 15:53:54 +0200
Message-Id: <20201209135355.561745-5-mlevitsk@redhat.com>
In-Reply-To: <20201209135355.561745-1-mlevitsk@redhat.com>
References: <20201209135355.561745-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Tom Yan <tom.ty89@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch file-posix to expose only the max_ioctl_transfer limit.

Let the iscsi driver work as it did before since it is bound by the transfer
limit in both regular read/write and in SCSI passthrough case.

Switch the scsi-disk and scsi-block drivers to read the SG max transfer limits
using the new blk_get_max_ioctl_transfer interface.


Fixes: 867eccfed8 ("file-posix: Use max transfer length/segment count only for SCSI passthrough")
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 block/file-posix.c     | 4 ++--
 block/iscsi.c          | 1 +
 hw/scsi/scsi-generic.c | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 10ebc4c5b7..0a94211847 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1284,12 +1284,12 @@ static void hdev_refresh_limits(BlockDriverState *bs, Error **errp)
                        get_max_transfer_length(s->fd);
 
     if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
-        bs->bl.max_transfer = pow2floor(ret);
+        bs->bl.max_ioctl_transfer = pow2floor(ret);
     }
 
     ret = bs->sg ? sg_get_max_segments(s->fd) : get_max_segments(s->fd);
     if (ret > 0) {
-        bs->bl.max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
+        bs->bl.max_ioctl_transfer = MIN_NON_ZERO(bs->bl.max_ioctl_transfer,
                                            ret * qemu_real_host_page_size);
     }
 
diff --git a/block/iscsi.c b/block/iscsi.c
index e30a7e3606..3685da2971 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -2065,6 +2065,7 @@ static void iscsi_refresh_limits(BlockDriverState *bs, Error **errp)
 
     if (max_xfer_len * block_size < INT_MAX) {
         bs->bl.max_transfer = max_xfer_len * iscsilun->block_size;
+        bs->bl.max_ioctl_transfer = bs->bl.max_transfer;
     }
 
     if (iscsilun->lbp.lbpu) {
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 2cb23ca891..6df67bf889 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -167,7 +167,7 @@ static void scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s)
         page = r->req.cmd.buf[2];
         if (page == 0xb0) {
             uint32_t max_transfer =
-                blk_get_max_transfer(s->conf.blk) / s->blocksize;
+                blk_get_max_ioctl_transfer(s->conf.blk) / s->blocksize;
 
             assert(max_transfer);
             stl_be_p(&r->buf[8], max_transfer);
@@ -210,7 +210,7 @@ static int scsi_generic_emulate_block_limits(SCSIGenericReq *r, SCSIDevice *s)
     uint8_t buf[64];
 
     SCSIBlockLimits bl = {
-        .max_io_sectors = blk_get_max_transfer(s->conf.blk) / s->blocksize
+        .max_io_sectors = blk_get_max_ioctl_transfer(s->conf.blk) / s->blocksize
     };
 
     memset(r->buf, 0, r->buflen);
-- 
2.26.2


