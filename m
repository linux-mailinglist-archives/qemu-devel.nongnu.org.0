Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53C66B0F98
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:02:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx88-0004Q0-PA; Wed, 08 Mar 2023 11:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx82-0004GM-Gy; Wed, 08 Mar 2023 11:59:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx80-00041s-Nf; Wed, 08 Mar 2023 11:59:02 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7FE7A400F1;
 Wed,  8 Mar 2023 19:58:21 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 4B0681FD;
 Wed,  8 Mar 2023 19:58:20 +0300 (MSK)
Received: (nullmailer pid 2098290 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fiona Ebner <f.ebner@proxmox.com>, Eric Blake <eblake@redhat.com>,
 Hanna Czenczek <hreitz@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 19/47] block: fix detect-zeroes= with BDRV_REQ_REGISTERED_BUF
Date: Wed,  8 Mar 2023 19:57:22 +0300
Message-Id: <20230308165815.2098148-19-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Stefan Hajnoczi <stefanha@redhat.com>

When a write request is converted into a write zeroes request by the
detect-zeroes= feature, it is no longer associated with an I/O buffer.
The BDRV_REQ_REGISTERED_BUF flag doesn't make sense without an I/O
buffer and must be cleared because bdrv_co_do_pwrite_zeroes() fails with
-EINVAL when it's set.

Fiona Ebner <f.ebner@proxmox.com> bisected and diagnosed this QEMU 7.2
regression where writes containing zeroes to a blockdev with
discard=unmap,detect-zeroes=unmap fail.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1404
Fixes: e8b6535533be ("block: add BDRV_REQ_REGISTERED_BUF request flag")
Tested-by: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230207203719.242926-2-stefanha@redhat.com>
(cherry picked from commit 3c5867156eb81c7c71611d078b2c5c2c863f884a)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/io.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/io.c b/block/io.c
index b9424024f9..bbaa0d1b2d 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2087,6 +2087,9 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
         if (bs->detect_zeroes == BLOCKDEV_DETECT_ZEROES_OPTIONS_UNMAP) {
             flags |= BDRV_REQ_MAY_UNMAP;
         }
+
+        /* Can't use optimization hint with bufferless zero write */
+        flags &= ~BDRV_REQ_REGISTERED_BUF;
     }
 
     if (ret < 0) {
-- 
2.30.2


