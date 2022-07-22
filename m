Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E007F57E714
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:11:51 +0200 (CEST)
Received: from localhost ([::1]:39814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEy3y-0001l7-WF
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxR-0005zU-Hq
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:05 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:59095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxP-0004de-H4
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:05 -0400
Received: from thinkpad.redhat.com ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MryGj-1nlLm03b9B-00nxaj; Fri, 22 Jul 2022 21:04:58 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v7 12/14] qemu-sockets: update socket_uri() and socket_parse()
 to be consistent
Date: Fri, 22 Jul 2022 21:04:40 +0200
Message-Id: <20220722190442.301310-13-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722190442.301310-1-lvivier@redhat.com>
References: <20220722190442.301310-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Fkz1pgwktjZ5f2d9BBnl0xXF4qh4fPFr8coTkBdPqz7znpCiWbD
 MNME+DQGoYBjMP+Msb/cORQJ/ZNOLpr92hN5F2d7A3ny2uzVmM8fV9ntpbgb831RsPlRZLc
 8B1bHy4GyRPf9O8pubma3Zd/a7IpMbT6dZ++paV81OVs/d+6l/lXzC7jg73SIb3Kt84/vhr
 TUd7rZDcm8Klm+v+Vyvpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iQSCW53r6Yc=:4g6vthf7t96Rjw48K/N9jT
 6/GJ4YB/hcL8F0mMCwaNljS3vl9s8Vs8M/vaRuFSay7opJ5ZpF51pw+U7DlESFxHf7OC58lHi
 4p0ao8tNFg1weA/PS0Vr6tw9GhcGIXdlxecBKUYdF3vdvNYfWXRIyfdDeBn6wrfSExaCUmbC1
 Gjwb79MPuKY1IDbn48OiTgHCecZCYmEQE776pF3q6b6YiyobVoygOhyce6yudplJp1ATjZFjZ
 1gSnQ4NBLUw7xqpdDv8Xrt2Nxi4KA5Z7lQHERdmrbM850v27agZ6gkRzDP8kkddCaniqqGyKc
 xkIEXaXAU3ChNegxv7xhksHmGxC99Ih8ZE5Lfb+/nUeFN+zPL4/tyEOhXdbXpCXx5b9ZEzm8j
 w74olAb/VoZou6reVaX6EVGsdNa7IKVoncwrKtx0KOzG4Ol+FAwVP8O8VMKypIIjRP6ggG+Nv
 cV3CNRjWRUT4GnsqxFzfQkJnowM69D4AlIdp/vJJ4VwUPL4hjdsQgUHZT71OEae5DrqPQwXRx
 qz/b6xYJfSZd/I1BoRZgFUlfKEajTujlu1s4LFGRZ62pqMQHrkpKChBPAK5izI9nuosZS4KZr
 101mGHP81CJXrhyFqBnlmrHZYusk071n7Am3ezYrNxi2euJtX9I3d1DW2hnCoy69VkWZSrM81
 h7ds/8hWVNzz0mPEiDugJf0udUddoAZhOf99VjOMuyoITSVcnun88XMs04fO97FDXNGDbgxlh
 o8tXeAHUq1TuHR7iCXQPXZx+7EU2JJLcIX+GWg==
Received-SPF: permerror client-ip=212.227.126.130;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
---
 util/qemu-sockets.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 870a36eb0e93..4531b13dbdbf 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1111,7 +1111,7 @@ char *socket_uri(SocketAddress *addr)
     case SOCKET_ADDRESS_TYPE_FD:
         return g_strdup_printf("fd:%s", addr->u.fd.str);
     case SOCKET_ADDRESS_TYPE_VSOCK:
-        return g_strdup_printf("tcp:%s:%s",
+        return g_strdup_printf("vsock:%s:%s",
                                addr->u.vsock.cid,
                                addr->u.vsock.port);
     default:
@@ -1145,6 +1145,11 @@ SocketAddress *socket_parse(const char *str, Error **errp)
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
2.37.1


