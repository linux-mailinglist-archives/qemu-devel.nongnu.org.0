Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3941D30B85A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 08:09:49 +0100 (CET)
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6pop-0000GM-Mj
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 02:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l6pnl-0008Ih-M1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 02:08:41 -0500
Received: from mail.ispras.ru ([83.149.199.84]:54668)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l6pnj-0004Wm-FL
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 02:08:41 -0500
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 7E7B140D4004;
 Tue,  2 Feb 2021 07:08:31 +0000 (UTC)
Subject: [PATCH] char: don't fail when client is not connected
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Tue, 02 Feb 2021 10:08:31 +0300
Message-ID: <161224971122.79781.8594358970645859667.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, pavel.dovgalyuk@ispras.ru, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch checks that ioc is not null before
using it in tcp socket tcp_chr_add_watch function.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 chardev/char-socket.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 213a4c8dd0..cef1d9438f 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -385,6 +385,9 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
 static GSource *tcp_chr_add_watch(Chardev *chr, GIOCondition cond)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
+    if (!s->ioc) {
+        return NULL;
+    }
     return qio_channel_create_watch(s->ioc, cond);
 }
 


