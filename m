Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FB933AB6B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 07:09:14 +0100 (CET)
Received: from localhost ([::1]:35090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLgPh-00035c-R7
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 02:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLgMw-00015t-Jk; Mon, 15 Mar 2021 02:06:22 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:34756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLgMt-0004d5-6C; Mon, 15 Mar 2021 02:06:22 -0400
Received: from sas1-6b1512233ef6.qloud-c.yandex.net
 (sas1-6b1512233ef6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:44af:0:640:6b15:1223])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 6CE722E14CB;
 Mon, 15 Mar 2021 09:06:15 +0300 (MSK)
Received: from sas1-24e978739efd.qloud-c.yandex.net
 (sas1-24e978739efd.qloud-c.yandex.net [2a02:6b8:c14:3088:0:640:24e9:7873])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 kuNQ7xWcW9-6FC8xRCw; Mon, 15 Mar 2021 09:06:15 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615788375; bh=ZFOtVVKovF3ArT9MW64RzPKbNlbAihWsxHJHarLjJG8=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=y1f0UBKVQgcU9Bc/W6g5chvl3/inJVUZFajHGa+V31EwSOeEx+2a2kO8HtrlXfs/4
 NXqtFIkjM6laxkml9DFcRRh5Pu8J5LmHOBh2iHPu4aaFOYOTSwSsb4wXahN993qT+W
 EEYA4i21BxOlX+fBOAjLJ4Ru+g+uk9o8SOdG/6io=
Authentication-Results: sas1-6b1512233ef6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:23::1:15])
 by sas1-24e978739efd.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FoAWGMWkZt-6En06RxR; Mon, 15 Mar 2021 09:06:15 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] block/nbd: assert attach/detach runs in the proper context
Date: Mon, 15 Mar 2021 09:06:07 +0300
Message-Id: <20210315060611.2989049-4-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document (via a comment and an assert) that
nbd_client_detach_aio_context and nbd_client_attach_aio_context_bh run
in the desired aio_context.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 1d8edb5b21..658b827d24 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -241,6 +241,12 @@ static void nbd_client_detach_aio_context(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
+    /*
+     * This runs in the (old, about to be detached) aio context of the @bs so
+     * accessing the stuff on @s is concurrency-free.
+     */
+    assert(qemu_get_current_aio_context() == bdrv_get_aio_context(bs));
+
     /* Timer is deleted in nbd_client_co_drain_begin() */
     assert(!s->reconnect_delay_timer);
     /*
@@ -258,6 +264,12 @@ static void nbd_client_attach_aio_context_bh(void *opaque)
     BlockDriverState *bs = opaque;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
+    /*
+     * This runs in the (new, just attached) aio context of the @bs so
+     * accessing the stuff on @s is concurrency-free.
+     */
+    assert(qemu_get_current_aio_context() == bdrv_get_aio_context(bs));
+
     if (s->connection_co) {
         /*
          * The node is still drained, so we know the coroutine has yielded in
-- 
2.30.2


