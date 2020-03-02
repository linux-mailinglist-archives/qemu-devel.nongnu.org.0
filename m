Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE011757F0
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 11:07:09 +0100 (CET)
Received: from localhost ([::1]:57840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8hye-00069U-6J
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 05:07:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50762)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j8hxU-0004UN-Vt
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:05:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j8hxU-0007lJ-37
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:05:56 -0500
Received: from relay.sw.ru ([185.231.240.75]:48174)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1j8hxR-0007jL-SY; Mon, 02 Mar 2020 05:05:54 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1j8hxI-000350-1e; Mon, 02 Mar 2020 13:05:44 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/5] block/nbd-client: drop max_block restriction from discard
Date: Mon,  2 Mar 2020 13:05:34 +0300
Message-Id: <20200302100537.29058-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200302100537.29058-1-vsementsov@virtuozzo.com>
References: <20200302100537.29058-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NBD spec is updated, so that max_block doesn't relate to
NBD_CMD_TRIM. So, drop the restriction.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/nbd.c b/block/nbd.c
index 2a58d6b91c..a62761ea5a 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1955,7 +1955,6 @@ static void nbd_refresh_limits(BlockDriverState *bs, Error **errp)
     }
 
     bs->bl.request_alignment = min;
-    bs->bl.max_pdiscard = max;
     bs->bl.max_pwrite_zeroes = max;
     bs->bl.max_transfer = max;
 
-- 
2.21.0


