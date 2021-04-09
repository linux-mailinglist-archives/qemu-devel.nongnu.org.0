Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E6135A2BB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:10:52 +0200 (CEST)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtid-0007Ud-Ow
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUtcN-0001ha-Dc; Fri, 09 Apr 2021 12:04:23 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:52854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUtcF-0006Id-3J; Fri, 09 Apr 2021 12:04:21 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id BED702E1A93;
 Fri,  9 Apr 2021 19:04:08 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 iR9BYIEsDS-480W0v17; Fri, 09 Apr 2021 19:04:08 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617984248; bh=Omb0dVDNPA6u4nSQafyqDHEybVHGCcmblraURTu0yeE=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=O+HTsHqmKcWvSpLQNBo8rexyDa4Hyu6DGEz3rtZgVhP/f+pi+yf0WnbaiI7aZtrkW
 SSYGRdpg5ChHfrHQ8pd4wt9AYlOLi9WSbclhLpHbR/qMs+6lMoJvgffaJXneGDT1yI
 dTkthmj2LHvXfE9YG1QSuuwvMSI/JYSdxf+IqQ8M=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 QZcMcvrvJz-48oSai1H; Fri, 09 Apr 2021 19:04:08 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 1/2] block/nbd: fix channel object leak
Date: Fri,  9 Apr 2021 19:04:05 +0300
Message-Id: <20210409160406.1800272-2-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210409160406.1800272-1-rvkagan@yandex-team.ru>
References: <20210409160406.1800272-1-rvkagan@yandex-team.ru>
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

nbd_free_connect_thread leaks the channel object if it hasn't been
stolen.

Unref it and fix the leak.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/nbd.c b/block/nbd.c
index c26dc5a54f..d86df3afcb 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -385,6 +385,7 @@ static void nbd_free_connect_thread(NBDConnectThread *thr)
 {
     if (thr->sioc) {
         qio_channel_close(QIO_CHANNEL(thr->sioc), NULL);
+        object_unref(OBJECT(thr->sioc));
     }
     error_free(thr->err);
     qapi_free_SocketAddress(thr->saddr);
-- 
2.30.2


