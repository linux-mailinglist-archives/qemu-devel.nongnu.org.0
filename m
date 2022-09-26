Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A791A5EB1DA
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 22:10:29 +0200 (CEST)
Received: from localhost ([::1]:47366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocuQu-0001eU-O7
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 16:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8G-0008N0-Ui
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:13 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:57203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8F-0005xZ-3t
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:12 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M76jv-1obYgi0Gr9-008Y4e; Mon, 26 Sep 2022 21:51:03 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v9 11/16] net: dgram: add unix socket
Date: Mon, 26 Sep 2022 21:50:43 +0200
Message-Id: <20220926195048.487915-12-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926195048.487915-1-lvivier@redhat.com>
References: <20220926195048.487915-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GqZ+SQSpkhoTJw5nlavr7n5+SJhz1B/W4kLD0RFp0jduOV/TyP6
 qu4u87yOEp2H1vFNjPRX0Kp+XSVU7HGDep7ObiSv3zQHl7NBq2kDB7j9dygHRgzzd92SMlB
 4J6/FSfa1VWoYbA4gcbVJl1ClWFgCA0cAD7MDUdiMsBwP9BW3nINjI4ezmkxMgWDi9V/Xk/
 i5xK1VSSJZjrPqysLwBsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Lp2rHILO97c=:dT550RoD7eYeSSrJILy3vs
 JoTNmzMMWYbVodva292iw9oxoWUYswFR1ytu59ooeLQvrA2YI+Mk1K4wyqs9ZvAhMzsqf5iUS
 xLcxj4szboKdnV8NWYxD/QlW037fDoMjqsntgd/oMOGLCUYNM7lZRHa7s4oVY79OE3KGqWsnW
 gaJJTR0azwTXh8ZES/O896FuC1qOCnDwHHeqLn+07ZoPYbXqqg0riWi8Q+8b5Nu3beIBIYewN
 +/ZMV/DIDGhSzpgEkSmqU+QvfDilMKCr/ZMxGIa/9R1wCtonA/Sx9yzWndzlJ61K3pTHl2dy+
 ylNly+j5gOtHCVazhe1buGEp9GZsGEGPqpO2Tysg+6rJwgUhL3XiRW62ZTtHNIKeIvIsKzR7h
 Z7hBWptHiYLvOxlRvq0jEL6IWeihoVR+gAsT8Yw/NS/E+QChiHwH4ZJNtg5Lylj3BKuTgWOof
 S2dAwV9oyt9tNvzKSXfy16fAdic5Sz/hgh5bzyWD7f15GFF/9AxoBxfZoNAnflPbOUCPHQPLn
 ZRRvq/LNqnKBpYrLLbJEdqduIlTFKvmj1k/RsKycq1afvKiO42H2OA/yWLJJ+Jcbb7b880nNU
 aFYY92rO+tdB07KMMXrdrIfccIN5E3xMNdIpv3c2Qj09OC1IhKyaAkAPludAjsyWdktfX6oO1
 mtN48LRlTCsb2mwEDikydUffVQMqPeW6l6FpHINg6PtNKaMkZsde8BGfSwPtY1iwaPW1DDRXs
 kdLUSAgXqDvDawGgyLkCjFl8SWVWb8AceRLrOpXotuRtfePqGN7mHAfhAKkenJ64otYrtX5vF
 qjMsAWL
Received-SPF: permerror client-ip=212.227.126.134;
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

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
---
 net/dgram.c     | 65 ++++++++++++++++++++++++++++++++++++++++++++++---
 qapi/net.json   |  2 +-
 qemu-options.hx |  1 +
 3 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index 9fb01410304e..db631f6e2270 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -84,8 +84,15 @@ static ssize_t net_dgram_receive_dgram(NetClientState *nc,
 
     do {
         if (s->dgram_dst) {
-            ret = sendto(s->fd, buf, size, 0, s->dgram_dst,
-                         sizeof(struct sockaddr_in));
+            socklen_t len;
+
+            if (s->dgram_dst->sa_family == AF_INET) {
+                len = sizeof(struct sockaddr_in);
+            } else {
+                len = sizeof(struct sockaddr_un);
+            }
+
+            ret = sendto(s->fd, buf, size, 0, s->dgram_dst, len);
         } else {
             ret = send(s->fd, buf, size, 0);
         }
@@ -450,7 +457,7 @@ static int net_dgram_init(NetClientState *peer,
         }
     } else {
         if (local->type != SOCKET_ADDRESS_TYPE_FD) {
-            error_setg(errp, "type=inet requires remote parameter");
+            error_setg(errp, "type=inet or unix require remote parameter");
             return -1;
         }
     }
@@ -500,6 +507,58 @@ static int net_dgram_init(NetClientState *peer,
 
         break;
     }
+    case SOCKET_ADDRESS_TYPE_UNIX: {
+        struct sockaddr_un laddr_un, raddr_un;
+
+        ret = unlink(local->u.q_unix.path);
+        if (ret < 0 && errno != ENOENT) {
+            error_setg_errno(errp, errno, "failed to unlink socket %s",
+                             local->u.q_unix.path);
+            return -1;
+        }
+
+        laddr_un.sun_family = PF_UNIX;
+        ret = snprintf(laddr_un.sun_path, sizeof(laddr_un.sun_path), "%s",
+                       local->u.q_unix.path);
+        if (ret < 0 || ret >= sizeof(laddr_un.sun_path)) {
+            error_setg(errp, "UNIX socket path '%s' is too long",
+                       local->u.q_unix.path);
+            error_append_hint(errp, "Path must be less than %zu bytes\n",
+                              sizeof(laddr_un.sun_path));
+        }
+
+        raddr_un.sun_family = PF_UNIX;
+        ret = snprintf(raddr_un.sun_path, sizeof(raddr_un.sun_path), "%s",
+                       remote->u.q_unix.path);
+        if (ret < 0 || ret >= sizeof(raddr_un.sun_path)) {
+            error_setg(errp, "UNIX socket path '%s' is too long",
+                       remote->u.q_unix.path);
+            error_append_hint(errp, "Path must be less than %zu bytes\n",
+                              sizeof(raddr_un.sun_path));
+        }
+
+        fd = qemu_socket(PF_UNIX, SOCK_DGRAM, 0);
+        if (fd < 0) {
+            error_setg_errno(errp, errno, "can't create datagram socket");
+            return -1;
+        }
+
+        ret = bind(fd, (struct sockaddr *)&laddr_un, sizeof(laddr_un));
+        if (ret < 0) {
+            error_setg_errno(errp, errno, "can't bind unix=%s to socket",
+                             laddr_un.sun_path);
+            closesocket(fd);
+            return -1;
+        }
+        qemu_socket_set_nonblock(fd);
+
+        dgram_dst = g_malloc(sizeof(raddr_un));
+        memcpy(dgram_dst, &raddr_un, sizeof(raddr_un));
+
+        info_str = g_strdup_printf("udp=%s:%s",
+                                   laddr_un.sun_path, raddr_un.sun_path);
+        break;
+    }
     case SOCKET_ADDRESS_TYPE_FD: {
         SocketAddress *sa;
         SocketAddressType sa_type;
diff --git a/qapi/net.json b/qapi/net.json
index bb96701a49a7..9cc4be7535bb 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -600,7 +600,7 @@
 # @remote: remote address
 # @local: local address
 #
-# Only SocketAddress types 'inet' and 'fd' are supported.
+# Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
 #
 # The code checks there is at least one of these options and reports an error
 # if not. If remote address is present and it's a multicast address, local
diff --git a/qemu-options.hx b/qemu-options.hx
index 7a34022ac651..5adb2e688c73 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2744,6 +2744,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                configure a network backend to connect to a multicast maddr and port\n"
     "                use ``local.host=addr`` to specify the host address to send packets from\n"
     "-netdev dgram,id=str,local.type=inet,local.host=addr,local.port=port[,remote.type=inet,remote.host=addr,remote.port=port]\n"
+    "-netdev dgram,id=str,local.type=unix,local.path=path[,remote.type=unix,remote.path=path]\n"
     "-netdev dgram,id=str,local.type=fd,local.str=h\n"
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
-- 
2.37.3


