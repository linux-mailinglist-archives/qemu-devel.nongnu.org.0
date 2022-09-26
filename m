Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D465EB1CC
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 22:06:49 +0200 (CEST)
Received: from localhost ([::1]:32874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocuNG-0005Wf-PK
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 16:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8G-0008Mz-FN
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:13 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:60733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8E-0005xJ-Q6
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:12 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MdwRi-1pCn783v30-00b04X; Mon, 26 Sep 2022 21:51:05 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v9 13/16] qemu-sockets: update socket_uri() and socket_parse()
 to be consistent
Date: Mon, 26 Sep 2022 21:50:45 +0200
Message-Id: <20220926195048.487915-14-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926195048.487915-1-lvivier@redhat.com>
References: <20220926195048.487915-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:41awJXUxslYXyOIIygAc4cJ1vYwZ7P4M5JO3qqwS+BX53ja8gtC
 pep/YuyVjQes8IW3knT0V9dfi3JDFm4Asq4bWokUkgpiLPwosxBISImfAla/bPCaP1d10PH
 pVNft2PoR8WB2BcqwKAHvMKwbl8UMlGtmThpqkAhGNQIAoJlyt9hRZ0I3vJLUAkZxk2OF97
 wi2fZAhME78FivgKXcWgA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EvVzXOkMryY=:B+tRedP1H9QK/pzPnP59B1
 djkJBrP1+Ky42jo5TLPYRXuUbCY6p/eGxMEmEXgnAe8Bi34WPmhekU2WntfJhKFjfotv9ghmG
 hYqn3l3oYES8sCeJD3XHZ6SrBXHPnIk0rUbtIiFmGcw3sYJBA8yGqhsTutKFqntY17I27RBxn
 SHKhoZUi+vbUbZ+OAyxUiDXJ25X4+O6bW3rj3RJZkExv2k+nztTgBI3bdoJIkzB2rZYQzG2kG
 XXOvUjw0hU0wRDKBUSkfUmMoPlIqm6kNtPnYYGnoaxp+YAhds196LCu7PM+1eb79FBND+0WYZ
 hsBoOXAhQadPaPC67/VrZ6nciucSTEGfiWuynoFdvlia6AK8J48/x8IyXzN4MAN0Hj+18jJ3g
 uiguRjP4eFpEbv1tIK5lyjbqyTn0vttr8Nt5BYeCAhaa0B3SP/StuVVxETqcSQwhu58xLbls2
 8kLsenPHgWEAp8SRRzX8CViiV0vxNJij6c1S8MlKDmT78lxVQ1AjanG1jOdOf0v5Sb/e2aLHs
 30QD4wiZRnFsD4qv9LWbIBRl5zcnx3HEk/C8gnfVRlq7Lk/ulrSvenXBtg0Y0T4IyAMwXYNK0
 VviFWq1OhEot0TDdRVGL9OW6YBKodWuer2GATqbVuDLQ+Wx+KFz5kTkdw+NYP4ahF+cJIKmY0
 qRkyPW1AVKfOcup6wa1CUSL4W1p38zLERUa2HonBWlkvIGM63VgKKHkk2XMVz0OAYF0XOdLhE
 zoNjgTK98DwEhRU7Xq6LzVN48cwsaIi/Opu6OqdrtqLFKXB7y9jPp+AXG35O2VMGRrodS675Y
 18wm88r
Received-SPF: permerror client-ip=212.227.126.133;
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

To be consistent with socket_uri(), add 'tcp:' prefix for inet type in
socket_parse(), by default socket_parse() use tcp when no prefix is
provided (format is host:port).

In socket_uri(), use 'vsock:' prefix for vsock type rather than 'tcp:'
because it makes a vsock address look like an inet address with CID
misinterpreted as host.
Goes back to commit 9aca82ba31 "migration: Create socket-address parameter"

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 util/qemu-sockets.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 9f6f655fd526..a9926af714c4 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1090,7 +1090,7 @@ char *socket_uri(SocketAddress *addr)
     case SOCKET_ADDRESS_TYPE_FD:
         return g_strdup_printf("fd:%s", addr->u.fd.str);
     case SOCKET_ADDRESS_TYPE_VSOCK:
-        return g_strdup_printf("tcp:%s:%s",
+        return g_strdup_printf("vsock:%s:%s",
                                addr->u.vsock.cid,
                                addr->u.vsock.port);
     default:
@@ -1124,6 +1124,11 @@ SocketAddress *socket_parse(const char *str, Error **errp)
         if (vsock_parse(&addr->u.vsock, str + strlen("vsock:"), errp)) {
             goto fail;
         }
+    } else if (strstart(str, "tcp:", NULL)) {
+        addr->type = SOCKET_ADDRESS_TYPE_INET;
+        if (inet_parse(&addr->u.inet, str + strlen("tcp:"), errp)) {
+            goto fail;
+        }
     } else {
         addr->type = SOCKET_ADDRESS_TYPE_INET;
         if (inet_parse(&addr->u.inet, str, errp)) {
-- 
2.37.3


