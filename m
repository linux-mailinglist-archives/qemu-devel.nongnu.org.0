Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F4457E70B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:08:47 +0200 (CEST)
Received: from localhost ([::1]:60002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEy10-0004Ye-UW
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxQ-0005vM-3g
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:04 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:36205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxN-0004cg-Sb
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:03 -0400
Received: from thinkpad.redhat.com ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MMoKq-1nyOTc08Cy-00IlhY; Fri, 22 Jul 2022 21:04:56 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v7 10/14] net: dgram: add unix socket
Date: Fri, 22 Jul 2022 21:04:38 +0200
Message-Id: <20220722190442.301310-11-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722190442.301310-1-lvivier@redhat.com>
References: <20220722190442.301310-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cRHNFwfg8klj+rwLzz7CQdEEOIYFMwmeaJ3V7Dg1IU3rC4zozAE
 R4dy6YxEbh/VXHJgGif2j8v0AX6FUVLotWhFulOmzrZ86yphR+j7XNogXurgfoQGG6diFz7
 RIwAuFcCl+WXgWeW9tzJ9PUPbA3GJSA2vfkY2FouIx8pb6fotpcOIVQoKkcEOlnNx2Rs/Ka
 8DWNZDc7+KoIBV/6eA65w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Clpt+ujrTg8=:CkboqXC3WfE3XMf+CU3AZt
 J+VKd2imi/ugNxWy5x5cjAnjpeWJpUFKLbZ+68OrENCo6wrlcp9TfRLaCk/Is30kNuZSvbpM9
 +4QvYtyFXdgexxq3yJKoXD6IxRrRDoyQ2s8B4VDyuXvn62Pc9kC/DHTeVNhHODF9BQog1Xa5O
 5rCgVRzubW7nWy2thQea7d/P+QkvNZFCs5d5DaIGkD6PNOw98BesR0xe+DPWZE/lrL7LlOnX1
 ISjNUeA+/1cQBMrgm+sUTQ739QgimJhn0atieIP+Hvok6vi6KVWvpwsLUntBA7nVtFPHdpUkz
 OqvyBG4oHUVNcp/m+E9bcy1zxi5LLHK/nlSUuamF0BGlbeFuperqNbp+XrUePLj4Q3g3uLH9n
 N87IH17tE7iY2VZ/vFu3JoatoZH1Hfpe3rvWmXWduXjnvykaV6zM6kEawIK1YLlC3xX9GEBNL
 GZyyBAbQW+eyZ9FvdT9lYn9UqU0BCMjtBAcYoZ0ks1LT1T2WSCqW9n4u8ku/ceGRJnsr977D0
 mS/f6yeHxh8OjCaZLSMpzT+sEGUWkNFRTlMpAgysyXA0whDF9Snr1U/Qi1134b1cg5AYr6noB
 A+MCAx5P74f80ZxW2d4ETRuvcG5jjEqtcQjp5Y6N6b9DAlHUOi9QtuvVIRNfYJ52NrgjZe+kW
 fNIzwRCfOAxBAPqK6eHpNYlheqHhCZW3qz2iMjatW6uzD1RTrJgnpUaOwJyCbxE3WYPRKrhJh
 WliEHhgNRbIoJ41CSA3jX6DaeZl+QnrHgyGAIg==
Received-SPF: permerror client-ip=212.227.126.131;
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

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
---
 net/dgram.c     | 65 ++++++++++++++++++++++++++++++++++++++++++++++---
 qapi/net.json   |  2 +-
 qemu-options.hx |  1 +
 3 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index 16e2d909755c..9f3eafee3b67 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -86,8 +86,15 @@ static ssize_t net_dgram_receive_dgram(NetClientState *nc,
 
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
@@ -509,7 +516,7 @@ static int net_dgram_udp_init(NetClientState *peer,
         }
     } else {
         if (local->type != SOCKET_ADDRESS_TYPE_FD) {
-            error_setg(errp, "type=inet requires remote parameter");
+            error_setg(errp, "type=inet or unix require remote parameter");
             return -1;
         }
     }
@@ -559,6 +566,58 @@ static int net_dgram_udp_init(NetClientState *peer,
 
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
index 518f288758b0..894c06a82b1b 100644
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
index 827a951a9ef2..33c5bd72af21 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2736,6 +2736,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                configure a network backend to connect to a multicast maddr and port\n"
     "                use ``local.host=addr`` to specify the host address to send packets from\n"
     "-netdev dgram,id=str,local.type=inet,local.host=addr,local.port=port[,remote.type=inet,remote.host=addr,remote.port=port]\n"
+    "-netdev dgram,id=str,local.type=unix,local.path=path[,remote.type=unix,remote.path=path]\n"
     "-netdev dgram,id=str,local.type=fd,local.str=h\n"
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
-- 
2.37.1


