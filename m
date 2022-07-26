Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6AC581B55
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:51:29 +0200 (CEST)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGRWa-0007Vv-Fp
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQue-0001CZ-HB; Tue, 26 Jul 2022 16:12:16 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:47324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQua-0001F7-Gn; Tue, 26 Jul 2022 16:12:15 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id C366F2E0DC9;
 Tue, 26 Jul 2022 23:12:03 +0300 (MSK)
Received: from localhost.localdomain (172.31.44.48-vpn.dhcp.yndx.net
 [172.31.44.48])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ZssKVYgWJm-C2O0Ts3Z; Tue, 26 Jul 2022 23:12:03 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658866323; bh=fdnzy21DcNkb5I8H6BYC0uuZF3cLw3rYot4unxKH7aQ=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=vLWsB87lXiQSsZr2inLKq63b5n9te+xmKuaPPmaF7V0EQETarZY43zCAaSljpa/Fk
 QcqUmTtFrR62t+i6a3JgE7PcXff8PmmdK290CxAFXB5eAP9zdjK0x5OLGYRFkfZFnh
 m2yY7jvy8Ev4iNVe3EZhm7zkrLuu36LSIcyRYibg=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v7 08/15] block/snapshot: stress that we fallback to primary
 child
Date: Tue, 26 Jul 2022 23:11:27 +0300
Message-Id: <20220726201134.924743-9-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726201134.924743-1-vsementsov@yandex-team.ru>
References: <20220726201134.924743-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


