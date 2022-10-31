Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C98613252
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 10:15:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQsL-0004Zw-Rk; Mon, 31 Oct 2022 05:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1opQsK-0004Zj-6g
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:14:32 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1opQsI-0000HU-QV
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:14:32 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id A79B4DA08F3;
 Mon, 31 Oct 2022 10:14:29 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id A3B8E46001C; Mon, 31 Oct 2022 10:14:29 +0100 (CET)
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
	Stefan Weil <sw@weilnetz.de>
Subject: [PULL 4/4] block/nfs: Fix 32-bit Windows build
Date: Mon, 31 Oct 2022 10:14:06 +0100
Message-Id: <20221031091406.382872-5-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031091406.382872-1-sw@weilnetz.de>
References: <20221031091406.382872-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

libnfs.h declares nfs_fstat() as the following for win32:

  int nfs_fstat(struct nfs_context *nfs, struct nfsfh *nfsfh,
                struct __stat64 *st);

The 'st' parameter should be of type 'struct __stat64'. The
codes happen to build successfully for 64-bit Windows, but it
does not build for 32-bit Windows.

Fixes: 6542aa9c75bc ("block: add native support for NFS")
Fixes: 18a8056e0bc7 ("block/nfs: cache allocated filesize for read-only files")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20220908132817.1831008-6-bmeng.cn@gmail.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block/nfs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block/nfs.c b/block/nfs.c
index 596ebe98cb..ece22353ac 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -418,7 +418,11 @@ static int64_t nfs_client_open(NFSClient *client, BlockdevOptionsNfs *opts,
                                int flags, int open_flags, Error **errp)
 {
     int64_t ret = -EINVAL;
+#ifdef _WIN32
+    struct __stat64 st;
+#else
     struct stat st;
+#endif
     char *file = NULL, *strp = NULL;
 
     qemu_mutex_init(&client->mutex);
@@ -781,7 +785,11 @@ static int nfs_reopen_prepare(BDRVReopenState *state,
                               BlockReopenQueue *queue, Error **errp)
 {
     NFSClient *client = state->bs->opaque;
+#ifdef _WIN32
+    struct __stat64 st;
+#else
     struct stat st;
+#endif
     int ret = 0;
 
     if (state->flags & BDRV_O_RDWR && bdrv_is_read_only(state->bs)) {
-- 
2.30.2


