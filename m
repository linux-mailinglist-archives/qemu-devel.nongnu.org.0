Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5AE2D41A7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 13:04:10 +0100 (CET)
Received: from localhost ([::1]:48226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmyCX-0004MG-Hw
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 07:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruc_gongyuanjun@163.com>)
 id 1kmy93-00030g-18
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:00:34 -0500
Received: from mail-m974.mail.163.com ([123.126.97.4]:47514)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ruc_gongyuanjun@163.com>)
 id 1kmy8u-0003Wf-W0
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=36C1Wb+UTGdE9bVIlN
 /deiBIBvixIL7dzSez2IwU7iY=; b=YzcD25rxbIfnu5NL3zEoBvfsiccACBh4cg
 BI8gSSfEFusENzZPdks6McY3SN0C03PWn1LqV67lOlxZ2+g3an1b0wJJaHOCr8je
 KJe4y2kcLoU4ZGYr3CXMEp4mNXC5XvuFy8n63FTdszKioAF8n0AXD3smWHqn/V12
 J6WdsFG2c=
Received: from localhost.localdomain (unknown [218.106.182.234])
 by smtp4 (Coremail) with SMTP id HNxpCgDX+hRPvNBfIH9Abw--.57822S4;
 Wed, 09 Dec 2020 20:00:15 +0800 (CST)
From: ruc_gongyuanjun@163.com
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 1/1] net/socket.c: Fix memory leak
Date: Wed,  9 Dec 2020 20:00:13 +0800
Message-Id: <20201209120013.13317-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: HNxpCgDX+hRPvNBfIH9Abw--.57822S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFWkuw13Jr4DZw4fWF17Jrb_yoWxZwb_Ww
 1xZFykWFZxuFnIkrWakrykX3y7C3WxGF1vgwnxtF4fGay8JFyqgFs7Cr95X3WxWryakryq
 kF1rua9ava1xKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRK3ktUUUUUU==
X-Originating-IP: [218.106.182.234]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbBiA-15VaD9XUo7wAAsF
Received-SPF: pass client-ip=123.126.97.4;
 envelope-from=ruc_gongyuanjun@163.com; helo=mail-m974.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: yuanjungong <ruc_gongyuanjun@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: yuanjungong <ruc_gongyuanjun@163.com>

close fd opened by monitor_fd_param() before returning.

Signed-off-by: yuanjungong <ruc_gongyuanjun@163.com>
---
 net/socket.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/socket.c b/net/socket.c
index 15b410e..2f720a7 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -735,12 +735,15 @@ int net_init_socket(const Netdev *netdev, const char *name,
         if (ret < 0) {
             error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
                              name, fd);
+            close(fd);
             return -1;
         }
         if (!net_socket_fd_init(peer, "socket", name, fd, 1, sock->mcast,
                                 errp)) {
+            close(fd);
             return -1;
         }
+        close(fd);
         return 0;
     }
 
-- 
2.17.1


