Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C97933AB6C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 07:09:32 +0100 (CET)
Received: from localhost ([::1]:36476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLgPz-0003eS-He
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 02:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLgMx-00017F-5C; Mon, 15 Mar 2021 02:06:23 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:47696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLgMv-0004gA-C6; Mon, 15 Mar 2021 02:06:22 -0400
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 234BA2E14EE;
 Mon, 15 Mar 2021 09:06:19 +0300 (MSK)
Received: from sas1-24e978739efd.qloud-c.yandex.net
 (sas1-24e978739efd.qloud-c.yandex.net [2a02:6b8:c14:3088:0:640:24e9:7873])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 ZCAZORnlv2-6HYuEtTD; Mon, 15 Mar 2021 09:06:19 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615788379; bh=c9G60La+2Sf+4noHvdEmbbjc208DGWTp5aj4kVCB4wo=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=uwtMkGCnGnDh/o73vkummk2WXcGrSPZALMjkpMJwKWXNnZzOG/fid9PzhTBlGmqWZ
 N3XOn0yzk8e5i3zPPSswuQlPLtCXcQRsXrZYX+stqespWl/h1OXDz2pqB+ZXzgzxes
 axzRSmtlLEiSwrAkFX2NXGev5DD5lshdyV0ZR704=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:23::1:15])
 by sas1-24e978739efd.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FoAWGMWkZt-6Hn0AYWB; Mon, 15 Mar 2021 09:06:17 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] block/nbd: stop manipulating in_flight counter
Date: Mon, 15 Mar 2021 09:06:11 +0300
Message-Id: <20210315060611.2989049-8-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

As the reconnect logic no longer interferes with drained sections, it
appears unnecessary to explicitly manipulate the in_flight counter.

Fixes: 5ad81b4946 ("nbd: Restrict connection_co reentrance")
Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c  | 6 ------
 nbd/client.c | 2 --
 2 files changed, 8 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index a5a9e4aca5..3a22f5d897 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -311,7 +311,6 @@ static void nbd_client_attach_aio_context_bh(void *opaque)
     if (s->connection_co) {
         qemu_aio_coroutine_enter(bs->aio_context, s->connection_co);
     }
-    bdrv_dec_in_flight(bs);
 }
 
 static void nbd_client_attach_aio_context(BlockDriverState *bs,
@@ -327,7 +326,6 @@ static void nbd_client_attach_aio_context(BlockDriverState *bs,
         qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), new_context);
     }
 
-    bdrv_inc_in_flight(bs);
 
     /*
      * Need to wait here for the BH to run because the BH must run while the
@@ -643,11 +641,9 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         goto out;
     }
 
-    bdrv_dec_in_flight(s->bs);
 
     ret = nbd_client_handshake(s->bs, &local_err);
 
-    bdrv_inc_in_flight(s->bs);
 
 out:
     s->connect_status = ret;
@@ -759,7 +755,6 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
 
     qemu_co_queue_restart_all(&s->free_sema);
     nbd_recv_coroutines_wake_all(s);
-    bdrv_dec_in_flight(s->bs);
 
     s->connection_co = NULL;
     if (s->ioc) {
@@ -2307,7 +2302,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     nbd_init_connect_thread(s);
 
     s->connection_co = qemu_coroutine_create(nbd_connection_entry, s);
-    bdrv_inc_in_flight(bs);
     aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
 
     return 0;
diff --git a/nbd/client.c b/nbd/client.c
index 0c2db4bcba..30d5383cb1 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -1434,9 +1434,7 @@ nbd_read_eof(BlockDriverState *bs, QIOChannel *ioc, void *buffer, size_t size,
 
         len = qio_channel_readv(ioc, &iov, 1, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
-            bdrv_dec_in_flight(bs);
             qio_channel_yield(ioc, G_IO_IN);
-            bdrv_inc_in_flight(bs);
             continue;
         } else if (len < 0) {
             return -EIO;
-- 
2.30.2


