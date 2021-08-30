Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD543FBF2D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 01:01:43 +0200 (CEST)
Received: from localhost ([::1]:34382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKqHd-0006gK-JG
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 19:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mKqBC-0005aj-Ox; Mon, 30 Aug 2021 18:55:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mKqBA-0000oq-UU; Mon, 30 Aug 2021 18:55:02 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6527F40798;
 Tue, 31 Aug 2021 01:54:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id C8D7F7D;
 Tue, 31 Aug 2021 01:54:56 +0300 (MSK)
Received: (nullmailer pid 1509769 invoked by uid 1000);
 Mon, 30 Aug 2021 22:54:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Subject: qemu-sockets: account for trailing \0 byte in unix socket pathname
Date: Tue, 31 Aug 2021 01:54:49 +0300
Message-Id: <20210830225449.1509719-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Bug-Debian: http://bugs.debian.org/993145
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux kernel can return size of af_unix socket to be
one byte larger than sockaddr_un structure - adding
the trailing zero byte.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f (first in 6.1.0)
Cc: qemu-stable@nongnu.org

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index f2f3676d1f..83926dc2bc 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1345,8 +1345,9 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
     SocketAddress *addr;
     struct sockaddr_un *su = (struct sockaddr_un *)sa;
 
+    /* kernel might have added \0 terminator to non-abstract socket */
     assert(salen >= sizeof(su->sun_family) + 1 &&
-           salen <= sizeof(struct sockaddr_un));
+           salen <= sizeof(struct sockaddr_un) + su->sun_path[0] ? 1 : 0);
 
     addr = g_new0(SocketAddress, 1);
     addr->type = SOCKET_ADDRESS_TYPE_UNIX;

