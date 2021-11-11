Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1AE44D95E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:45:59 +0100 (CET)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCGz-0007dP-Tw
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:45:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5g-0004Yo-9o; Thu, 11 Nov 2021 10:34:16 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:40774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5W-00042E-Uo; Thu, 11 Nov 2021 10:34:16 -0500
Received: from iva8-d2cd82b7433e.qloud-c.yandex.net
 (iva8-d2cd82b7433e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a88e:0:640:d2cd:82b7])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 4555D2E0B06;
 Thu, 11 Nov 2021 18:34:01 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-d2cd82b7433e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 miw3MvrZto-Y0saDCOq; Thu, 11 Nov 2021 18:34:01 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636644841; bh=DKCjFbwJQZiORGOk94Gym4SRfIr2B0CaMzsUkKErozw=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=V3WNhir/pgLs8qMdlR2HaLOo0zWHUu1P3VVcWOBvxRNUkNt/V4+6sA4/z8hn9PCtd
 DJREBi1SNx3aO9Lvrz1HaqLwWdpnuVjjzMwTphZcxUDb9S1S/YXbIai0ypQnNYvN4T
 wZL3Dyg4QkK+GwmtJ6tFAu1wamV2VThclPrprjXc=
Authentication-Results: iva8-d2cd82b7433e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8830::1:2d])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 WgGv8YbvMJ-Y0wCBM5o; Thu, 11 Nov 2021 18:34:00 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/10] chardev/char-fe: don't allow EAGAIN from blocking read
Date: Thu, 11 Nov 2021 18:33:48 +0300
Message-Id: <20211111153354.18807-5-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111153354.18807-1-rvkagan@yandex-team.ru>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

As its name suggests, ChardevClass.chr_sync_read is supposed to do a
blocking read.  The only implementation of it, tcp_chr_sync_read, does
set the underlying io channel to the blocking mode indeed.

Therefore a failure return with EAGAIN is not expected from this call.

So do not retry it in qemu_chr_fe_read_all; instead place an assertion
that it doesn't fail with EAGAIN.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 chardev/char-fe.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/chardev/char-fe.c b/chardev/char-fe.c
index 7789f7be9c..f94efe928e 100644
--- a/chardev/char-fe.c
+++ b/chardev/char-fe.c
@@ -68,13 +68,10 @@ int qemu_chr_fe_read_all(CharBackend *be, uint8_t *buf, int len)
     }
 
     while (offset < len) {
-    retry:
         res = CHARDEV_GET_CLASS(s)->chr_sync_read(s, buf + offset,
                                                   len - offset);
-        if (res == -1 && errno == EAGAIN) {
-            g_usleep(100);
-            goto retry;
-        }
+        /* ->chr_sync_read should block */
+        assert(!(res < 0 && errno == EAGAIN));
 
         if (res == 0) {
             break;
-- 
2.33.1


