Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ED3301474
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 11:07:44 +0100 (CET)
Received: from localhost ([::1]:58470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3FpX-0001XQ-0l
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 05:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l3Fo1-0000sn-Ee
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 05:06:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l3Fnw-0003Ul-DP
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 05:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611396361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iDV+fAnpYxRRMENpO3wSS90PgF487Vfo9BsKde0DiGw=;
 b=hRHFg68h9/4GviE/fi5jk/8yplU3VfU+O50pirzfPs9kYMKeupVI8Y1kT4BYz6//S0312p
 O0qiu4q1VCl82ogkkNGThfG/IfM3k3NWDre+jIJwICsq+0Jj/zkkjKKAR8KZ+8gyWoJULC
 7I3Nntvbojrqesd9MuBbBBFizNhS5nY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-10QSqrsrMbiq7wVO9y_Aaw-1; Sat, 23 Jan 2021 05:05:58 -0500
X-MC-Unique: 10QSqrsrMbiq7wVO9y_Aaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3943801817;
 Sat, 23 Jan 2021 10:05:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-11.phx2.redhat.com
 [10.3.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC34F71C9D;
 Sat, 23 Jan 2021 10:05:54 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: [PATCH] fdc: check drive block device before usage (CVE-2021-20196)
Date: Sat, 23 Jan 2021 15:33:45 +0530
Message-Id: <20210123100345.642933-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gaoning Pan <pgn@zju.edu.cn>, QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

While processing ioport command in 'fdctrl_write_dor', device
controller may select a drive which is not initialised with a
block device. This may result in a NULL pointer dereference.
Add checks to avoid it.

Fixes: CVE-2021-20196
Reported-by: Gaoning Pan <pgn@zju.edu.cn>
Buglink: https://bugs.launchpad.net/qemu/+bug/1912780
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/block/fdc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 3636874432..13a9470d19 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1429,7 +1429,9 @@ static void fdctrl_write_dor(FDCtrl *fdctrl, uint32_t value)
         }
     }
     /* Selected drive */
-    fdctrl->cur_drv = value & FD_DOR_SELMASK;
+    if (fdctrl->drives[value & FD_DOR_SELMASK].blk) {
+        fdctrl->cur_drv = value & FD_DOR_SELMASK;
+    }
 
     fdctrl->dor = value;
 }
@@ -1894,6 +1896,10 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
     uint32_t pos;
 
     cur_drv = get_cur_drv(fdctrl);
+    if (!cur_drv->blk) {
+        FLOPPY_DPRINTF("No drive connected\n");
+        return 0;
+    }
     fdctrl->dsr &= ~FD_DSR_PWRDOWN;
     if (!(fdctrl->msr & FD_MSR_RQM) || !(fdctrl->msr & FD_MSR_DIO)) {
         FLOPPY_DPRINTF("error: controller not ready for reading\n");
@@ -2420,7 +2426,8 @@ static void fdctrl_write_data(FDCtrl *fdctrl, uint32_t value)
         if (pos == FD_SECTOR_LEN - 1 ||
             fdctrl->data_pos == fdctrl->data_len) {
             cur_drv = get_cur_drv(fdctrl);
-            if (blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
+            if (cur_drv->blk == NULL
+                || blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
                            BDRV_SECTOR_SIZE, 0) < 0) {
                 FLOPPY_DPRINTF("error writing sector %d\n",
                                fd_sector(cur_drv));
-- 
2.29.2


