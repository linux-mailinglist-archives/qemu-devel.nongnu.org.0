Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F0B585A6F
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 14:29:16 +0200 (CEST)
Received: from localhost ([::1]:44866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHlal-00077q-TA
	for lists+qemu-devel@lfdr.de; Sat, 30 Jul 2022 08:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oHlYx-0004N7-8u
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 08:27:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oHlYv-0002G3-P8
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 08:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MnDX3RrBQq6+e8AYHWlXA94311W1N/WuCrAz0MPrwww=; b=1WQFcSSFqJr5f6BKjddwNyOMMT
 JeL9gWgBwjSbvmTG1ZZXDjGrC8AiySzjXDq95552dixmZnKo8I7SjAcckWYTCoFN29wyRrkRHYwe9
 T/Bng1eZWJWdsZqiRq6EMmIOKUiN51YypUKLhwKqWA6dE6ITpTWKIex+Znzzvz2XlaVo3ZedpR+zy
 rq4Xc2BYg7JCzE/EE9FtRtcrDisS5Bq0qLRSemBJE8NUwhpfD+/Pk+7XjC+cIoTWR3rUkExpRcfab
 D+1yFKSolSGljBdxXWK1iwtFa5ARRxJeKlpI6um2SaDUGF+e5llj+WwhVd++u1Gy1lGokTugooF19
 /2k6NjDt1RkQbcldwqak7LJjxn9RLHX5l15xFuTtmJekEIHXo+RKB2lvxRuA0T1cI939lcM406Zv+
 c6uIqLBAoYJaoGtylEl1ipAYldtqP9hlOT4O90Y+msIv5RSYjiX2I84yFiVxALnEKXSkdyiIDtPok
 vsctOu4xyHQ/KRPC3xiXKCvZDqWpIeWc+HnMuVB4k3U9GOW7lgnegABgIfJJl5XsTQh3piXwm6WQt
 M4vMEYXHxOKEVQaIURikG39pGeCjGXlsmw3ZJ7IXXNpcyMtHrBCrD6mnxk8q40X22sn3g509T2zyL
 oJY6uE5Eo0/qVYpDapjKIEmO/Jmu0lHsKJLC1MeW4=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oHlXK-0006Ru-Mq; Sat, 30 Jul 2022 13:25:46 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, fam@euphon.net, alxndr@bu.edu, qemu-devel@nongnu.org
Date: Sat, 30 Jul 2022 13:26:55 +0100
Message-Id: <20220730122656.253448-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220730122656.253448-1-mark.cave-ayland@ilande.co.uk>
References: <20220730122656.253448-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH for-7.1 1/2] scsi-disk: fix overflow when block size is not a
 multiple of BDRV_SECTOR_SIZE
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

In scsi_disk_emulate_write_same() the number of host sectors to transfer is
calculated as (s->qdev.blocksize / BDRV_SECTOR_SIZE) which is then used to
copy data in block size chunks to the iov buffer.

Since the loop copying the data to the iov buffer uses a fixed increment of
s->qdev.blocksize then using a block size that isn't a multiple of
BDRV_SECTOR_SIZE introduces a rounding error in the iov buffer size calculation
such that the iov buffer copy overflows the space allocated.

Update the iov buffer copy for() loop so that it will use the smallest of either
the current block size or the remaining transfer count to prevent the overflow.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/scsi-disk.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index f5cdb9ad4b..3027ac3b1e 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1849,7 +1849,7 @@ static void scsi_disk_emulate_write_same(SCSIDiskReq *r, uint8_t *inbuf)
     uint32_t nb_sectors = scsi_data_cdb_xfer(r->req.cmd.buf);
     WriteSameCBData *data;
     uint8_t *buf;
-    int i;
+    int i, l;
 
     /* Fail if PBDATA=1 or LBDATA=1 or ANCHOR=1.  */
     if (nb_sectors == 0 || (req->cmd.buf[1] & 0x16)) {
@@ -1891,8 +1891,9 @@ static void scsi_disk_emulate_write_same(SCSIDiskReq *r, uint8_t *inbuf)
                                               data->iov.iov_len);
     qemu_iovec_init_external(&data->qiov, &data->iov, 1);
 
-    for (i = 0; i < data->iov.iov_len; i += s->qdev.blocksize) {
-        memcpy(&buf[i], inbuf, s->qdev.blocksize);
+    for (i = 0; i < data->iov.iov_len; i += l) {
+        l = MIN(s->qdev.blocksize, data->iov.iov_len - i);
+        memcpy(&buf[i], inbuf, l);
     }
 
     scsi_req_ref(&r->req);
-- 
2.30.2


