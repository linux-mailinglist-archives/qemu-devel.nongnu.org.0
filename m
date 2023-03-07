Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F176AE19B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:05:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXvF-0006aW-TL; Tue, 07 Mar 2023 09:04:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZXux-0006Wk-Rg
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:03:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZXuw-0001ln-BW
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678197826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KEu6P1ZJP7dKqV8Ksitsew2SKcq/+ppL8Ef5ttbM8bE=;
 b=hrjCTRWU7/nCW7LtwwBVhMDamvaD0puRuUDlWMZ5BlZh0z+zYo4eQOkZisUZXQSgoSFRvH
 1SZn2+PK1IP9kh/xGPDU3NZ2y5qxXq/x+z7zr8EVayMod8yWDiJBSZDf9X4Zu/48MF73yn
 92XD32AxKZRe6d27I9Cd8yGGY+oew9k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-ohqKOTDhNtWJww952taGPQ-1; Tue, 07 Mar 2023 09:03:44 -0500
X-MC-Unique: ohqKOTDhNtWJww952taGPQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26D58824049;
 Tue,  7 Mar 2023 14:02:41 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA12C492C14;
 Tue,  7 Mar 2023 14:02:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, clg@kaod.org, kraxel@redhat.com, berrange@redhat.com,
 zhengxiang9@huawei.com, mail@maciej.szmigiero.name, qemu-devel@nongnu.org
Subject: [PATCH] pflash: Fix blk_pread_nonzeroes()
Date: Tue,  7 Mar 2023 15:02:30 +0100
Message-Id: <20230307140230.59158-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Commit a4b15a8b introduced a new function blk_pread_nonzeroes(). Instead
of reading directly from the root node of the BlockBackend, it reads
from its 'file' child node. This can happen to mostly work for raw
images (as long as the 'raw' format driver is in use, but not actually
doing anything), but it breaks everything else.

Fix it to read from the root node instead.

Fixes: a4b15a8b9ef25b44fa92a4825312622600c1f37c
Reported-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/block.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/block/block.c b/hw/block/block.c
index af0710e477..9f52ee6e72 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -39,8 +39,7 @@ static int blk_pread_nonzeroes(BlockBackend *blk, hwaddr size, void *buf)
             return ret;
         }
         if (!(ret & BDRV_BLOCK_ZERO)) {
-            ret = bdrv_pread(bs->file, offset, bytes,
-                             (uint8_t *) buf + offset, 0);
+            ret = blk_pread(blk, offset, bytes, (uint8_t *) buf + offset, 0);
             if (ret < 0) {
                 return ret;
             }
-- 
2.39.2


