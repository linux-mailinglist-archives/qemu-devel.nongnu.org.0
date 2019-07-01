Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C5A35A43
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 12:11:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYSsp-0000jA-Tv
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 06:11:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYSr9-0008HL-En
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 06:09:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYSr8-0007ay-Hh
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 06:09:19 -0400
Received: from relay.sw.ru ([185.231.240.75]:47168)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYSr8-0007Yu-9T; Wed, 05 Jun 2019 06:09:18 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYSr4-0000xT-6Y; Wed, 05 Jun 2019 13:09:14 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed,  5 Jun 2019 13:09:13 +0300
Message-Id: <20190605100913.34972-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190605100913.34972-1-vsementsov@virtuozzo.com>
References: <20190605100913.34972-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 2/2] nbd-client: enable TCP keepalive
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
	mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable keepalive option to track server availablity.

Requested-by: Denis V. Lunev <den@openvz.org>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd-client.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/nbd-client.c b/block/nbd-client.c
index 790ecc1ee1..b57cea8482 100644
--- a/block/nbd-client.c
+++ b/block/nbd-client.c
@@ -1137,6 +1137,7 @@ static int nbd_client_connect(BlockDriverState *bs,
 
     /* NBD handshake */
     logout("session init %s\n", export);
+    qio_channel_set_keepalive(QIO_CHANNEL(sioc), true, NULL);
     qio_channel_set_blocking(QIO_CHANNEL(sioc), true, NULL);
 
     client->info.request_sizes = true;
-- 
2.18.0


