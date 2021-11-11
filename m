Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4799E44D942
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:37:12 +0100 (CET)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlC8V-0000se-10
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:37:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5c-0004Rl-QZ; Thu, 11 Nov 2021 10:34:13 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:40958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5U-00041n-C2; Thu, 11 Nov 2021 10:34:07 -0500
Received: from iva8-d2cd82b7433e.qloud-c.yandex.net
 (iva8-d2cd82b7433e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a88e:0:640:d2cd:82b7])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id ED2E22E1EB3;
 Thu, 11 Nov 2021 18:33:57 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-d2cd82b7433e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 zsePPL9uyc-XvsCs8cq; Thu, 11 Nov 2021 18:33:57 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636644837; bh=nX/VQTsziIB/0PxDV+dfQg83qC3n/hyFTLwjB7EMJwU=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=bG4T5+N1cts9NmH8kQHz4aaAo3pvHaUz7hLaIdUODcRGH2ulWEuzLK2aY2Fuq7v2V
 LtwNd6oT6aB6HkYKAOsBIINGNctQ4aNmtFib2OsJTGp2w47EvWJwLLzZy9P6413vCe
 ajyjz5byzjgEEQwR+WL05Havmf6++94NYshfDZ4Q=
Authentication-Results: iva8-d2cd82b7433e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8830::1:2d])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 WgGv8YbvMJ-XuwCbZVu; Thu, 11 Nov 2021 18:33:57 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/10] vhost-user-blk: reconnect on any error during realize
Date: Thu, 11 Nov 2021 18:33:45 +0300
Message-Id: <20211111153354.18807-2-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111153354.18807-1-rvkagan@yandex-team.ru>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost-user-blk realize only attempts to reconnect if the previous
connection attempt failed on "a problem with the connection and not an
error related to the content (which would fail again the same way in the
next attempt)".

However this distinction is very subtle, and may be inadvertently broken
if the code changes somewhere deep down the stack and a new error gets
propagated up to here.

OTOH now that the number of reconnection attempts is limited it seems
harmless to try reconnecting on any error.

So relax the condition of whether to retry connecting to check for any
error.

This patch amends a527e312b5 "vhost-user-blk: Implement reconnection
during realize".

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 hw/block/vhost-user-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index ba13cb87e5..f9b17f6813 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -511,7 +511,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
             *errp = NULL;
         }
         ret = vhost_user_blk_realize_connect(s, errp);
-    } while (ret == -EPROTO && retries--);
+    } while (ret < 0 && retries--);
 
     if (ret < 0) {
         goto virtio_err;
-- 
2.33.1


