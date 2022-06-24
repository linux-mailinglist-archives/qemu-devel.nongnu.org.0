Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0426955A3BA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:39:50 +0200 (CEST)
Received: from localhost ([::1]:40282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4r1p-0007to-3C
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qs3-0000XO-Lk; Fri, 24 Jun 2022 17:29:43 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:54556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qs1-0004TE-UU; Fri, 24 Jun 2022 17:29:43 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 0F7C82E3024;
 Sat, 25 Jun 2022 00:29:34 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 RTGhKtHDPo-TUK0pwqU; Sat, 25 Jun 2022 00:29:34 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656106174; bh=/jK2ITosRAt/QJ+Qo7GaTBfC7plAbMHEl4XWtWfmf0Y=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=q0h8203YyZ25+I6F/u8vsreNhZL/TmwpzKFwdidnt0pxmshrByw5vBgwd2OJZJx2v
 zPKOLY96gZx9U1PID3LOgYsijoc3mpIRqQdGRlNL5Q4AwwHsVycJBaI96E4LKmsofG
 GlOfBIB+Ik7ezv61yHhd4umbMzMi2vPXRmJcxMG4=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b64c::1:2c])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KXs24KJ458-TUMSimKT; Sat, 25 Jun 2022 00:29:30 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v6 11/15] Revert "block: Restructure
 remove_file_or_backing_child()"
Date: Sat, 25 Jun 2022 00:28:26 +0300
Message-Id: <20220624212830.316919-12-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624212830.316919-1-vsementsov@yandex-team.ru>
References: <20220624212830.316919-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That's a preparation to previously reverted
"block: Let replace_child_noperm free children". Drop it too, we don't
need it for a new approach.

This reverts commit 562bda8bb41879eeda0bd484dd3d55134579b28e.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/block.c b/block.c
index a83845b120..3ac332a460 100644
--- a/block.c
+++ b/block.c
@@ -5051,33 +5051,30 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran)
 {
-    BdrvChild **childp;
     BdrvRemoveFilterOrCowChild *s;
 
+    assert(child == bs->backing || child == bs->file);
+
     if (!child) {
         return;
     }
 
-    if (child == bs->backing) {
-        childp = &bs->backing;
-    } else if (child == bs->file) {
-        childp = &bs->file;
-    } else {
-        g_assert_not_reached();
-    }
-
     if (child->bs) {
-        bdrv_replace_child_tran(*childp, NULL, tran);
+        bdrv_replace_child_tran(child, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
     *s = (BdrvRemoveFilterOrCowChild) {
         .child = child,
-        .is_backing = (childp == &bs->backing),
+        .is_backing = (child == bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
 
-    *childp = NULL;
+    if (s->is_backing) {
+        bs->backing = NULL;
+    } else {
+        bs->file = NULL;
+    }
 }
 
 /*
-- 
2.25.1


