Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F6E44D940
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:36:35 +0100 (CET)
Received: from localhost ([::1]:60760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlC7u-0007vE-Va
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:36:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5c-0004Rj-RM; Thu, 11 Nov 2021 10:34:13 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:40698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5T-00041T-Vh; Thu, 11 Nov 2021 10:34:07 -0500
Received: from iva8-d2cd82b7433e.qloud-c.yandex.net
 (iva8-d2cd82b7433e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a88e:0:640:d2cd:82b7])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 537D32E0D9F;
 Thu, 11 Nov 2021 18:34:00 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-d2cd82b7433e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 yqqNnxLPo2-XxsmD3MZ; Thu, 11 Nov 2021 18:34:00 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636644840; bh=TedE66OqqrCpmWNOkElnCfTFsfCyJ94a9jRk6gTtn9Q=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=JGitZLLqeSOFMVP7DmpqH9hSaUsJKmpFKMhmLHygAWJwCQmp7Vn//eWBYCsiRottn
 iduUDYgNxpFzojdc7Krz1aliF1hmvLYOocrsp3HIM6SwAoI8WxzjM4P7QG178zJSQ7
 UTfTW7j4VRdmWMkxFHnRFlx7TecTp2chSKzH87l8=
Authentication-Results: iva8-d2cd82b7433e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8830::1:2d])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 WgGv8YbvMJ-XxwCQpBN; Thu, 11 Nov 2021 18:33:59 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/10] chardev/char-socket: tcp_chr_sync_read: don't clobber
 errno
Date: Thu, 11 Nov 2021 18:33:47 +0300
Message-Id: <20211111153354.18807-4-rvkagan@yandex-team.ru>
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

After the return from tcp_chr_recv, tcp_chr_sync_read calls into a
function which eventually makes a system call and may clobber errno.

Make a copy of errno right after tcp_chr_recv and restore the errno on
return from tcp_chr_sync_read.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 chardev/char-socket.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 90054ce58c..cf7f2ba65a 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -581,6 +581,7 @@ static int tcp_chr_sync_read(Chardev *chr, const uint8_t *buf, int len)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
     int size;
+    int saved_errno;
 
     if (s->state != TCP_CHARDEV_STATE_CONNECTED) {
         return 0;
@@ -588,6 +589,7 @@ static int tcp_chr_sync_read(Chardev *chr, const uint8_t *buf, int len)
 
     qio_channel_set_blocking(s->ioc, true, NULL);
     size = tcp_chr_recv(chr, (void *) buf, len);
+    saved_errno = errno;
     if (s->state != TCP_CHARDEV_STATE_DISCONNECTED) {
         qio_channel_set_blocking(s->ioc, false, NULL);
     }
@@ -596,6 +598,7 @@ static int tcp_chr_sync_read(Chardev *chr, const uint8_t *buf, int len)
         tcp_chr_disconnect(chr);
     }
 
+    errno = saved_errno;
     return size;
 }
 
-- 
2.33.1


