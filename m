Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1AB59E4E6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 16:07:33 +0200 (CEST)
Received: from localhost ([::1]:57438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQUZ2-0004tr-6c
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 10:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oQUVz-0002kj-13
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 10:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oQUVw-0004Az-BD
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 10:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661263459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmuAt80WLkzymQL9b+SA97Wj4jwpUgcOf5obf0E2EQM=;
 b=KTulNpatG0yeDP4tgSRUSbxldjYXDA8RkoH7Vlvh1cd4/0dszU+4KxUD3US9R9logqZeP+
 iuCAsMLlMSUM0NBQjeQ+vpxPUydSoTwWi49Lui1XtyXZ2snc+wqpS4fzjD2kAaVjkuiKRp
 HAa+2Fqqf3ZVC6Q2ADO61Enw9P73fj4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-okcwWu89N4SNYt51ODVNKw-1; Tue, 23 Aug 2022 10:04:16 -0400
X-MC-Unique: okcwWu89N4SNYt51ODVNKw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEE68966307;
 Tue, 23 Aug 2022 14:04:15 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38A17492C3B;
 Tue, 23 Aug 2022 14:04:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 1/1] scsi-generic: Fix emulated block limits VPD page
Date: Tue, 23 Aug 2022 16:04:06 +0200
Message-Id: <20220823140406.73805-2-kwolf@redhat.com>
In-Reply-To: <20220823140406.73805-1-kwolf@redhat.com>
References: <20220823140406.73805-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Commits 01ef8185b80 amd 24b36e9813e updated the way that the maximum
transfer length is calculated for patching block limits VPD page in an
INQUIRY response.

The same updates also need to be made for the case where the host device
does not support the block limits VPD page at all and we emulate the
whole page.

Without this fix, on host block devices a maximum transfer length of
(INT_MAX - sector_size) bytes is advertised to the guest, resulting in
I/O errors when a request that exceeds the host limits is made by the
guest. (Prior to commit 24b36e9813e, this code path would use the
max_transfer value from the host instead of INT_MAX, but still miss the
fix from 01ef8185b80 where max_transfer is also capped to max_iov
host pages, so it would be less wrong, but still wrong.)

Cc: qemu-stable@nongnu.org
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2096251
Fixes: 01ef8185b809af9d287e1a03a3f9d8ea8231118a
Fixes: 24b36e9813ec15da7db62e3b3621730710c5f020
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20220822125320.48257-1-kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/scsi/scsi-generic.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index ada24d7486..3d35d307e1 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -147,6 +147,18 @@ static int execute_command(BlockBackend *blk,
     return 0;
 }
 
+static uint64_t calculate_max_transfer(SCSIDevice *s)
+{
+    uint64_t max_transfer = blk_get_max_hw_transfer(s->conf.blk);
+    uint32_t max_iov = blk_get_max_hw_iov(s->conf.blk);
+
+    assert(max_transfer);
+    max_transfer = MIN_NON_ZERO(max_transfer,
+                                max_iov * qemu_real_host_page_size());
+
+    return max_transfer / s->blocksize;
+}
+
 static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
 {
     uint8_t page, page_idx;
@@ -179,12 +191,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
         (r->req.cmd.buf[1] & 0x01)) {
         page = r->req.cmd.buf[2];
         if (page == 0xb0) {
-            uint64_t max_transfer = blk_get_max_hw_transfer(s->conf.blk);
-            uint32_t max_iov = blk_get_max_hw_iov(s->conf.blk);
-
-            assert(max_transfer);
-            max_transfer = MIN_NON_ZERO(max_transfer, max_iov * qemu_real_host_page_size())
-                / s->blocksize;
+            uint64_t max_transfer = calculate_max_transfer(s);
             stl_be_p(&r->buf[8], max_transfer);
             /* Also take care of the opt xfer len. */
             stl_be_p(&r->buf[12],
@@ -230,7 +237,7 @@ static int scsi_generic_emulate_block_limits(SCSIGenericReq *r, SCSIDevice *s)
     uint8_t buf[64];
 
     SCSIBlockLimits bl = {
-        .max_io_sectors = blk_get_max_transfer(s->conf.blk) / s->blocksize
+        .max_io_sectors = calculate_max_transfer(s),
     };
 
     memset(r->buf, 0, r->buflen);
-- 
2.37.1


