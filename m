Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C5144D948
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:39:36 +0100 (CET)
Received: from localhost ([::1]:40888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCAp-0005V3-MU
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:39:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5c-0004Ri-Qc; Thu, 11 Nov 2021 10:34:13 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:40966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5V-00041r-1v; Thu, 11 Nov 2021 10:34:08 -0500
Received: from iva8-d2cd82b7433e.qloud-c.yandex.net
 (iva8-d2cd82b7433e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a88e:0:640:d2cd:82b7])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 4D8D82E1EC3;
 Thu, 11 Nov 2021 18:33:59 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-d2cd82b7433e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 H1Ua6G5fdL-Xwsa2Q65; Thu, 11 Nov 2021 18:33:59 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636644839; bh=8CLtawSVTMjVLImwVYJk/7fg/KIi9Awuv7yUq/I54DY=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=EGa8LcsDnOeTgKUGLDcQu51zUPAc28bzQfoxBvsm46GAuVmOhOrzQwFBiGjJYvHl5
 YOd4tYJpFN8MNKsoBV0f+5UQIb2EVzoi0EWvXeu7A4zJtXByFped65QucfZWmyLOPd
 rFBARVQWjhke7OWFc31FMzrdSh4VCL6B8UsUzWBs=
Authentication-Results: iva8-d2cd82b7433e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8830::1:2d])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 WgGv8YbvMJ-XwwCc4Ee; Thu, 11 Nov 2021 18:33:58 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/10] chardev/char-socket: tcp_chr_recv: don't clobber errno
Date: Thu, 11 Nov 2021 18:33:46 +0300
Message-Id: <20211111153354.18807-3-rvkagan@yandex-team.ru>
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

tcp_chr_recv communicates the specific error condition to the caller via
errno.  However, after setting it, it may call into some system calls or
library functions which can clobber the errno.

Avoid this by moving the errno assignment to the end of the function.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 chardev/char-socket.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 836cfa0bc2..90054ce58c 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -346,13 +346,6 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
                                      NULL);
     }
 
-    if (ret == QIO_CHANNEL_ERR_BLOCK) {
-        errno = EAGAIN;
-        ret = -1;
-    } else if (ret == -1) {
-        errno = EIO;
-    }
-
     if (msgfds_num) {
         /* close and clean read_msgfds */
         for (i = 0; i < s->read_msgfds_num; i++) {
@@ -381,6 +374,13 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
 #endif
     }
 
+    if (ret == QIO_CHANNEL_ERR_BLOCK) {
+        errno = EAGAIN;
+        ret = -1;
+    } else if (ret == -1) {
+        errno = EIO;
+    }
+
     return ret;
 }
 
-- 
2.33.1


