Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ADF583383
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 21:25:38 +0200 (CEST)
Received: from localhost ([::1]:46746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGmf2-00029s-SP
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 15:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGmNH-0008D3-BH; Wed, 27 Jul 2022 15:07:15 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:50376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGmNE-000521-Ai; Wed, 27 Jul 2022 15:07:13 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 263BA2E0974;
 Wed, 27 Jul 2022 22:07:02 +0300 (MSK)
Received: from localhost.localdomain (172.31.41.131-vpn.dhcp.yndx.net
 [172.31.41.131])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 lEd3EUqO2s-70OOsEgk; Wed, 27 Jul 2022 22:07:01 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658948821; bh=ITm4/qIgvcgoWJmSBIq+Z1cbVfBb36dogMDzX7p/ShE=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=xhfuKckBEEaDklsv3JIhmG3Lpn2UKT6AGEk+1xRaepR7ihJQ0LJrDQwI1JlA+z/wH
 5M6FH3w+iU9VeAKAtHgnfDMNSdH68ejOaeIzCp6qPcGEMdEh622kbj1dgbf8yo4M5q
 i88LnSni+gqshr8raG9jonNfLBEcFuZ+87arU+mU=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@yandex-team.ru, den@openvz.org,
 stefanha@redhat.com
Subject: [PULL 1/2] block/parallels: Fix buffer-based write call
Date: Wed, 27 Jul 2022 22:06:34 +0300
Message-Id: <20220727190635.1024863-2-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727190635.1024863-1-vsementsov@yandex-team.ru>
References: <20220727190635.1024863-1-vsementsov@yandex-team.ru>
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

From: Hanna Reitz <hreitz@redhat.com>

Commit a4072543ccdddbd241d5962d9237b8b41fd006bf has changed the I/O here
from working on a local one-element I/O vector to just using the buffer
directly (using the bdrv_co_pread()/bdrv_co_pwrite() helper functions
introduced shortly before).

However, it only changed the bdrv_co_preadv() call to bdrv_co_pread() -
the subsequent bdrv_co_pwritev() call stayed this way, and so still
expects a QEMUIOVector pointer instead of a plain buffer.  We must
change that to be a bdrv_co_pwrite() call.

Fixes: a4072543ccdddbd241d5962d ("block/parallels: use buffer-based io")
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20220714132801.72464-2-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 8b235b9505..a229c06f25 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -241,8 +241,8 @@ static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
             return ret;
         }
 
-        ret = bdrv_co_pwritev(bs->file, s->data_end * BDRV_SECTOR_SIZE,
-                              nb_cow_bytes, buf, 0);
+        ret = bdrv_co_pwrite(bs->file, s->data_end * BDRV_SECTOR_SIZE,
+                             nb_cow_bytes, buf, 0);
         qemu_vfree(buf);
         if (ret < 0) {
             return ret;
-- 
2.25.1


