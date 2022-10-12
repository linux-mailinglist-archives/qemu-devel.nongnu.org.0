Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784A35FC446
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 13:22:22 +0200 (CEST)
Received: from localhost ([::1]:45504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiZoY-0008Ul-Ck
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 07:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1oiZmf-00070i-Oq
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:20:21 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:49412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1oiZmd-00068B-Oo
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:20:21 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 4A6DF44953;
 Wed, 12 Oct 2022 13:20:07 +0200 (CEST)
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: gilbert@redhat.com,
	quintela@redhat.com
Subject: [PATCH] migration/channel-block: fix return value for
 qio_channel_block_{readv, writev}
Date: Wed, 12 Oct 2022 13:19:35 +0200
Message-Id: <20221012111935.117480-1-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

in the error case. The documentation in include/io/channel.h states
that -1 or QIO_CHANNEL_ERR_BLOCK should be returned upon error. Simply
passing along the return value from the bdrv-functions has the
potential to confuse the call sides. Non-blocking mode is not
implemented currently, so -1 it is.

Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
---
 migration/channel-block.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/channel-block.c b/migration/channel-block.c
index c55c8c93ce..aabc4634a4 100644
--- a/migration/channel-block.c
+++ b/migration/channel-block.c
@@ -62,7 +62,8 @@ qio_channel_block_readv(QIOChannel *ioc,
     qemu_iovec_init_external(&qiov, (struct iovec *)iov, niov);
     ret = bdrv_readv_vmstate(bioc->bs, &qiov, bioc->offset);
     if (ret < 0) {
-        return ret;
+        error_setg(errp, "bdrv_readv_vmstate returned error %d", ret);
+        return -1;
     }
 
     bioc->offset += qiov.size;
@@ -86,7 +87,8 @@ qio_channel_block_writev(QIOChannel *ioc,
     qemu_iovec_init_external(&qiov, (struct iovec *)iov, niov);
     ret = bdrv_writev_vmstate(bioc->bs, &qiov, bioc->offset);
     if (ret < 0) {
-        return ret;
+        error_setg(errp, "bdrv_writev_vmstate returned error %d", ret);
+        return -1;
     }
 
     bioc->offset += qiov.size;
-- 
2.30.2



