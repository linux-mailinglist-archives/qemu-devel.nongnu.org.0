Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A455EB1C4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 22:04:04 +0200 (CEST)
Received: from localhost ([::1]:44348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocuKh-0003Mo-11
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 16:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8D-0008L3-Hm
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:11 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:59331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu89-0005wC-13
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:07 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N9L64-1pHrb402j6-015MkV; Mon, 26 Sep 2022 21:50:58 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v9 06/16] net: socket: Don't ignore EINVAL on netdev socket
 connection
Date: Mon, 26 Sep 2022 21:50:38 +0200
Message-Id: <20220926195048.487915-7-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926195048.487915-1-lvivier@redhat.com>
References: <20220926195048.487915-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mzYqy5WbuMtZBLw6LSbZaq5MkTX+N20QAJlp/Bowqz77PmcsiNH
 3qT5UahWEy1s6tUnBZifWu4MbpNqhUXvoLSjw4Yv00qRKCyWF0N92YH8EGfg3KSmFI72dCb
 juGY3dPNrB6lKFJV+59w4cYFovFTU7CnYLUQCUCiuHQgy7b0OoZUyUNxmTquCUcIfLu0lVy
 sx8o3RmBBUUTsN5lSIEig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VczpP9eWkOQ=:RI0zjqp6ZneG8ojkz4oucr
 AyTgcgJHaIsDsXM10NHmxZUX/GZveK/WfR7PqSNkiPJpcQ74geg3Oaa3oBLs0gZbw4Y8v37tF
 /+pL4/JuKjgnXxj/o/y+LIXwZgBqyu6EJzluBd0S/bPNXGygfWIZO+vkWG7QST5HmvvgGK+I7
 kBJZvuj+mJgiFuAW7Wt8YxJc3DbhauKf/GCcjCSUCv+WRXtY6y3md03KWA9kYS9+xLu30U1iJ
 dzDoRHUHhMHTIHU8Y8LE7K3KMA/Dl3yyuZrwxdlBHxWgJfb+bdi87EWd3AmmSYE0gbGKHmVvX
 GPdOPnow9IeekCwpdKdKm64dlr45yUCCUcg2M08hEamU73YvS1NGoIDIw+ZZdWbEwG4h7puAo
 V2FgwAKyPSx9eywo9chHts8Qt4dR/4eBRK3MGUBR3mCLnYFdSudNt3IF33FVEMEoYq43yyOUx
 9UsxSQpm0lCS77Vm3ox67xzT1w9dqEyuGZX7HIjbZOo9RnRr4flaMXBR0GfS4l2HbuTNkP4C3
 FvLHNCXX6bTT91TT3yPnarBz7Au3+vHhcO2+bx8OM2ERsgVCQ+5GEwN8T9NPwCBth6yPCQYTV
 2plqLhoTioE3j72iyRvZI4vPBSqHWKDh48Ntt6D4pJZIBy7ypecBYJLLUu9jzHcwmxeK2zcYk
 gGL4Ib0zJOPmBjrzByYNWiapYzUqR0WTmIJ2jN1Nw/sy0YS4JkNM76Zw/ko12ThNwMo3M2Tge
 ZoW43/o3CZkZkrBpLy159xeGUZuXE1fhhmJQABSk1ZVkyIIIb2wNUq6VoxgzN28Uz2XmXyK1+
 vnDN31g
Received-SPF: permerror client-ip=212.227.126.131;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Brivio <sbrivio@redhat.com>

Other errors are treated as failure by net_socket_connect_init(),
but if connect() returns EINVAL, we'll fail silently. Remove the
related exception.

Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 net/socket.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/socket.c b/net/socket.c
index bfd8596250c4..ce6f80f4445f 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -579,8 +579,7 @@ static int net_socket_connect_init(NetClientState *peer,
             if (errno == EINTR || errno == EWOULDBLOCK) {
                 /* continue */
             } else if (errno == EINPROGRESS ||
-                       errno == EALREADY ||
-                       errno == EINVAL) {
+                       errno == EALREADY) {
                 break;
             } else {
                 error_setg_errno(errp, errno, "can't connect socket");
-- 
2.37.3


