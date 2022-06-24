Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76B755A382
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:33:03 +0200 (CEST)
Received: from localhost ([::1]:49902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4qv9-0003Ue-4q
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qru-0008Se-Op; Fri, 24 Jun 2022 17:29:34 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:33262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qrt-0004QK-3U; Fri, 24 Jun 2022 17:29:34 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 56A832E2011;
 Sat, 25 Jun 2022 00:29:25 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 tdBxdviOvo-TOKSMIde; Sat, 25 Jun 2022 00:29:25 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656106165; bh=1PgPpbCWetTiZ45OLenSsW9L9CTtt5yDtt1BOgpawyQ=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=KVyn0lqN4FVauv0xScPsDECL2P1o596ux8DwHzYHpM4GU0BM4RYEreGEKhIy0ERjU
 u42zrU0+AxKXEzO/OqYlrkFoN8vi7FrPZgGamRQyUAFM2xJXhm1iaGvAQIvqFO8V3h
 zeZh6v1DpXhLtnm4MhFh4xOiagh/y8fqcMp9TJGA=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b64c::1:2c])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KXs24KJ458-TOMSvl4r; Sat, 25 Jun 2022 00:29:24 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru, Eric Blake <eblake@redhat.com>,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PATCH v6 05/15] tests-bdrv-drain: bdrv_replace_test driver: declare
 supports_backing
Date: Sat, 25 Jun 2022 00:28:20 +0300
Message-Id: <20220624212830.316919-6-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624212830.316919-1-vsementsov@yandex-team.ru>
References: <20220624212830.316919-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

We do add COW child to the node.  In future we are going to forbid
adding COW child to the node that doesn't support backing. So, fix it
here now.

Don't worry about setting bs->backing itself: in further commit we'll
update the block-layer to automatically set/unset this field in generic
code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 36be84ae55..23d425a494 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1948,6 +1948,7 @@ static void coroutine_fn bdrv_replace_test_co_drain_end(BlockDriverState *bs)
 static BlockDriver bdrv_replace_test = {
     .format_name            = "replace_test",
     .instance_size          = sizeof(BDRVReplaceTestState),
+    .supports_backing       = true,
 
     .bdrv_close             = bdrv_replace_test_close,
     .bdrv_co_preadv         = bdrv_replace_test_co_preadv,
-- 
2.25.1


