Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ED16FE14B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:11:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlP5-0006n0-UN; Wed, 10 May 2023 11:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pwlP3-0006mK-PX; Wed, 10 May 2023 11:06:53 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pwlP0-0001Ti-Bj; Wed, 10 May 2023 11:06:52 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:a884:0:640:947b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id C5BE95FD1C;
 Wed, 10 May 2023 18:06:40 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown [2a02:6b8:b081:2::1:11])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (smtpcorp/Yandex) with ESMTPSA id P6XgPR0OpqM0-vVDZwUMS; 
 Wed, 10 May 2023 18:06:40 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683731200; bh=9fVXmXfUGAl3kFCFCGH42efA63olGtvjCZYm0bEs8Lk=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=TpWFO899NNF7t5I01x9MF0Tcu9q8DndOGnKcTqhIW/LLtcgBsUx7zIysZxJ3dyT4V
 evizElFr28kRCWsUxzOaGNznN3u6wRZCeHLEY1ixgK9s2Ls/XKJa72rMDXaPkFdds3
 1PlYJPWUAF+ZT8XwX8kQbPsAodOn5NTaVR45WUs8=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru, den@openvz.org, alexander.ivanov@virtuozzo.com
Subject: [PATCH v9 5/6] blockdev: use state.bitmap in block-dirty-bitmap-add
 action
Date: Wed, 10 May 2023 18:06:23 +0300
Message-Id: <20230510150624.310640-6-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510150624.310640-1-vsementsov@yandex-team.ru>
References: <20230510150624.310640-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Other bitmap related actions use the .bitmap pointer in .abort action,
let's do same here:

1. It helps further refactoring, as bitmap-add is the only bitmap
   action that uses state.action in .abort

2. It must be safe: transaction actions rely on the fact that on
   .abort() the state is the same as at the end of .prepare(), so that
   in .abort() we could precisely rollback the changes done by
   .prepare().
   The only way to remove the bitmap during transaction should be
   block-dirty-bitmap-remove action, but it postpones actual removal to
   .commit(), so we are OK on any rollback path. (Note also that
   bitmap-remove is the only bitmap action that has .commit() phase,
   except for simple g_free the state on .clean())

3. Again, other bitmap actions behave this way: keep the bitmap pointer
   during the transaction.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 blockdev.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 6bcf80b18b..10003bdc52 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1998,7 +1998,8 @@ static void block_dirty_bitmap_add_action(BlkActionState *common,
                                &local_err);
 
     if (!local_err) {
-        state->prepared = true;
+        state->bitmap = block_dirty_bitmap_lookup(action->node, action->name,
+                                                  NULL, &error_abort);
     } else {
         error_propagate(errp, local_err);
     }
@@ -2006,15 +2007,10 @@ static void block_dirty_bitmap_add_action(BlkActionState *common,
 
 static void block_dirty_bitmap_add_abort(void *opaque)
 {
-    BlockDirtyBitmapAdd *action;
     BlockDirtyBitmapState *state = opaque;
 
-    action = state->common.action->u.block_dirty_bitmap_add.data;
-    /* Should not be able to fail: IF the bitmap was added via .prepare(),
-     * then the node reference and bitmap name must have been valid.
-     */
-    if (state->prepared) {
-        qmp_block_dirty_bitmap_remove(action->node, action->name, &error_abort);
+    if (state->bitmap) {
+        bdrv_release_dirty_bitmap(state->bitmap);
     }
 }
 
-- 
2.34.1


