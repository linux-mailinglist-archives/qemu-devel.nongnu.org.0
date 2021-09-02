Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A763FEDC0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:27:33 +0200 (CEST)
Received: from localhost ([::1]:37920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLloa-0003Xh-UB
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f83df00900816476cca41bb536e4d532b297d76e@lizzy.crudebyte.com>)
 id 1mLlG8-0001l2-AG
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:51:56 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:48995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f83df00900816476cca41bb536e4d532b297d76e@lizzy.crudebyte.com>)
 id 1mLlG6-0006ra-LT
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=jrx/vT+QUzUBsJuKPl621+bCaiWTm/AVkmhAnnC3ldM=; b=j8fAU
 fnMzPuK+0d4FNp69IpAjqNRgWpEOcvMv7S3SM7tZeOH5+efpQg84VZNrkV7um4ApoGeZkcXcezqRO
 mmFz8voV7bftTWOUidvIxPbQB1ZegDLELS3HdMaTFvep7apzQp23qljTz4zcKndVAakyGh+/cp5P+
 lKVL8a0nwHA9ax3OSp73BrZeoXujcWl0dFN+OP/TRrgtTbQdj75K+hqkC1sA3mR7sYJNc8A2aCofv
 BULkTtCDDq0PcjW3q+cY68LybRbnhUJr1jTBZxtlYsXQxeQRVa1H3ctHF5zsfBAHELdu6u3cGc37N
 ERh5a2ElyHbun6M9+TbJd1ArFbGUw==;
Message-Id: <f83df00900816476cca41bb536e4d532b297d76e.1630582967.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1630582967.git.qemu_oss@crudebyte.com>
References: <cover.1630582967.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 02 Sep 2021 13:42:47 +0200
Subject: [PULL 3/3] 9pfs: fix crash in v9fs_walk()
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=f83df00900816476cca41bb536e4d532b297d76e@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v9fs_walk() utilizes the v9fs_co_run_in_worker({...}) macro to run the
supplied fs driver code block on a background worker thread.

When either the 'Twalk' client request was interrupted or if the client
requested fid for that 'Twalk' request caused a stat error then that
fs driver code block was left by 'break' keyword, with the intention to
return from worker thread back to main thread as well:

    v9fs_co_run_in_worker({
        if (v9fs_request_cancelled(pdu)) {
            err = -EINTR;
            break;
        }
        err = s->ops->lstat(&s->ctx, &dpath, &fidst);
        if (err < 0) {
            err = -errno;
            break;
        }
        ...
    });

However that 'break;' statement also skipped the v9fs_co_run_in_worker()
macro's final and mandatory

    /* re-enter back to qemu thread */
    qemu_coroutine_yield();

call and thus caused the rest of v9fs_walk() to be continued being
executed on the worker thread instead of main thread, eventually
leading to a crash in the transport virtio transport driver.

To fix this issue and to prevent the same error from happening again by
other users of v9fs_co_run_in_worker() in future, auto wrap the supplied
code block into its own

    do { } while (0);

loop inside the 'v9fs_co_run_in_worker' macro definition.

Full discussion and backtrace:
https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg05209.html
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg00174.html

Fixes: 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <E1mLTBg-0002Bh-2D@lizzy.crudebyte.com>
---
 hw/9pfs/coth.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
index c51289903d..f83c7dda7b 100644
--- a/hw/9pfs/coth.h
+++ b/hw/9pfs/coth.h
@@ -51,7 +51,9 @@
          */                                                             \
         qemu_coroutine_yield();                                         \
         qemu_bh_delete(co_bh);                                          \
-        code_block;                                                     \
+        do {                                                            \
+            code_block;                                                 \
+        } while (0);                                                    \
         /* re-enter back to qemu thread */                              \
         qemu_coroutine_yield();                                         \
     } while (0)
-- 
2.20.1


