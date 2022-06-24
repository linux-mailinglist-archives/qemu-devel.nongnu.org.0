Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D5855A3A9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:36:21 +0200 (CEST)
Received: from localhost ([::1]:59752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4qyS-0001oR-Hu
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qrw-00007T-Pp; Fri, 24 Jun 2022 17:29:36 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:44496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qru-0004S4-QJ; Fri, 24 Jun 2022 17:29:36 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id A10152E1FC2;
 Sat, 25 Jun 2022 00:29:27 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 rRI5sjqVso-TRKaXLMx; Sat, 25 Jun 2022 00:29:27 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656106167; bh=fdnzy21DcNkb5I8H6BYC0uuZF3cLw3rYot4unxKH7aQ=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=xiDna2y+pOrq2f1tpOYlOjlilAPgMohn+pme2C1zK9kuVfm40rH/vljoZTKmP7YzE
 iBUuIdGsgAkAk91nTXkZ+cA9rG1G2crwbu37jE8aA/6bTwuFYpcqzYqKWIfzDDSnbv
 SELWjeYeQqOtVyVuIF9lvfvVD1iWDhajiEKZEmPw=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b64c::1:2c])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KXs24KJ458-TQMSNQO5; Sat, 25 Jun 2022 00:29:27 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v6 08/15] block/snapshot: stress that we fallback to primary
 child
Date: Sat, 25 Jun 2022 00:28:23 +0300
Message-Id: <20220624212830.316919-9-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624212830.316919-1-vsementsov@yandex-team.ru>
References: <20220624212830.316919-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Actually what we chose is a primary child. Let's stress it in the code.

We are going to drop indirect pointer logic here in future. Actually
this commit simplifies the future work: we drop use of indirection in
the assertion now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/snapshot.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/block/snapshot.c b/block/snapshot.c
index d6f53c3065..75e8d3a937 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -161,21 +161,14 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
 static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
 {
     BdrvChild **fallback;
-    BdrvChild *child;
+    BdrvChild *child = bdrv_primary_child(bs);
 
-    /*
-     * The only BdrvChild pointers that are safe to modify (and which
-     * we can thus return a reference to) are bs->file and
-     * bs->backing.
-     */
-    fallback = &bs->file;
-    if (!*fallback && bs->drv && bs->drv->is_filter) {
-        fallback = &bs->backing;
-    }
-
-    if (!*fallback) {
+    /* We allow fallback only to primary child */
+    if (!child) {
         return NULL;
     }
+    fallback = (child == bs->file ? &bs->file : &bs->backing);
+    assert(*fallback == child);
 
     /*
      * Check that there are no other children that would need to be
@@ -309,15 +302,12 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         }
 
         /*
-         * fallback_ptr is &bs->file or &bs->backing.  *fallback_ptr
-         * was closed above and set to NULL, but the .bdrv_open() call
-         * has opened it again, because we set the respective option
-         * (with the qdict_put_str() call above).
-         * Assert that .bdrv_open() has attached some child on
-         * *fallback_ptr, and that it has attached the one we wanted
-         * it to (i.e., fallback_bs).
+         * fallback was a primary child. It was closed above and set to NULL,
+         * but the .bdrv_open() call has opened it again, because we set the
+         * respective option (with the qdict_put_str() call above).
+         * Assert that .bdrv_open() has attached the right BDS as primary child.
          */
-        assert(*fallback_ptr && fallback_bs == (*fallback_ptr)->bs);
+        assert(bdrv_primary_bs(bs) == fallback_bs);
         bdrv_unref(fallback_bs);
         return ret;
     }
-- 
2.25.1


