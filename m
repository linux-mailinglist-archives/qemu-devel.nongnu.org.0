Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E7E6E15E9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:34:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3cc-00040g-9B; Thu, 13 Apr 2023 16:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3cZ-0003zd-3b; Thu, 13 Apr 2023 16:32:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3cI-0003mE-5b; Thu, 13 Apr 2023 16:32:42 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3D33A40145;
 Thu, 13 Apr 2023 23:31:58 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id C79A695;
 Thu, 13 Apr 2023 23:31:56 +0300 (MSK)
Received: (nullmailer pid 2344373 invoked by uid 1000);
 Thu, 13 Apr 2023 20:31:54 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Lukas Tschoke <lukts330@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 21/21] block/vhdx: fix dynamic VHDX BAT corruption
Date: Thu, 13 Apr 2023 23:31:33 +0300
Message-Id: <20230413203143.2344250-21-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230413203051.2344192-1-mjt@tls.msk.ru>
References: <20230413203051.2344192-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Lukas Tschoke <lukts330@gmail.com>

The corruption occurs when a BAT entry aligned to 4096 bytes is changed.

Specifically, the corruption occurs during the creation of the LOG Data
Descriptor. The incorrect behavior involves copying 4088 bytes from the
original 4096 bytes aligned offset to `tmp[8..4096]` and then copying
the new value for the first BAT entry to the beginning `tmp[0..8]`.
This results in all existing BAT entries inside the 4K region being
incorrectly moved by 8 bytes and the last entry being lost.

This bug did not cause noticeable corruption when only sequentially
writing once to an empty dynamic VHDX (e.g.
using `qemu-img convert -O vhdx -o subformat=dynamic ...`), but it
still resulted in invalid values for the (unused) Sector Bitmap BAT
entries.

Importantly, this corruption would only become noticeable after the
corrupted BAT is re-read from the file.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/727
Cc: qemu-stable@nongnu.org
Signed-off-by: Lukas Tschoke <lukts330@gmail.com>
Message-Id: <6cfb6d6b-adc5-7772-c8a5-6bae9a0ad668@gmail.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
(cherry picked from commit 8af037fe4cfeb88bbcded3122cec2c5be0b90907)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/vhdx-log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index 572582b87b..0866897a85 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -980,7 +980,7 @@ static int vhdx_log_write(BlockDriverState *bs, BDRVVHDXState *s,
             sector_write = merged_sector;
         } else if (i == sectors - 1 && trailing_length) {
             /* partial sector at the end of the buffer */
-            ret = bdrv_pread(bs->file, file_offset,
+            ret = bdrv_pread(bs->file, file_offset + trailing_length,
                              VHDX_LOG_SECTOR_SIZE - trailing_length,
                              merged_sector + trailing_length, 0);
             if (ret < 0) {
-- 
2.30.2


