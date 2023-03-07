Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0EC6AE596
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:57:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZfW-0006Jt-H7; Tue, 07 Mar 2023 10:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rbq/=67=kaod.org=clg@ozlabs.org>)
 id 1pZZfS-0006IT-3Q; Tue, 07 Mar 2023 10:55:58 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rbq/=67=kaod.org=clg@ozlabs.org>)
 id 1pZZfP-0000RC-C9; Tue, 07 Mar 2023 10:55:57 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PWKmD5Bk9z4whk;
 Wed,  8 Mar 2023 02:55:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PWKmB6R7cz4xDh;
 Wed,  8 Mar 2023 02:55:38 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 2/5] pflash: Fix blk_pread_nonzeroes()
Date: Tue,  7 Mar 2023 16:55:25 +0100
Message-Id: <20230307155528.3655534-3-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307155528.3655534-1-clg@kaod.org>
References: <20230307155528.3655534-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=rbq/=67=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Kevin Wolf <kwolf@redhat.com>

Commit a4b15a8b introduced a new function blk_pread_nonzeroes(). Instead
of reading directly from the root node of the BlockBackend, it reads
from its 'file' child node. This can happen to mostly work for raw
images (as long as the 'raw' format driver is in use, but not actually
doing anything), but it breaks everything else.

Fix it to read from the root node instead.

Fixes: a4b15a8b9ef25b44fa92a4825312622600c1f37c
Reported-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230307140230.59158-1-kwolf@redhat.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
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


