Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888945F587A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 18:43:23 +0200 (CEST)
Received: from localhost ([::1]:49512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og7UQ-0003fz-JJ
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 12:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og796-0007SM-33
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:20 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:40995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og791-0002pC-2z
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:19 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MjSHc-1p4gBT4AZe-00kxPs; Wed, 05 Oct 2022 18:21:10 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v10 12/17] net: dgram: add unix socket
Date: Wed,  5 Oct 2022 18:20:46 +0200
Message-Id: <20221005162051.1120041-13-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005162051.1120041-1-lvivier@redhat.com>
References: <20221005162051.1120041-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9mW5BjYZsTrgrCThoia1OPKqH2KDGXaDKQlaJZ4BEWNkWh5yydq
 94wyBB2yvRx1r8UVV/oYtHfW1B0IeueDLDj8R84H54pqpOsZcdinrjp5w0KZBlso+FV/Q00
 SuKbBV6NF/UpNeoaRi/hWavIfXrvCFdltUXqUTe2R7ylCtxen04+S9f36r2NbOf7sxBkCmW
 5jtCUE31V5qM5DlaCApfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TdT+ES3sRYM=:kV/5ApdlVAx011nCwqeidQ
 /tKMtccIhWe9p9OnDhbTKCji80gEyej53MFcdAYh4zyjfqW4dwSbye9Ylzdr3ohrKKuAQoqg3
 MCoypw885ilOADoK4hSU0lBHGcR+pGJz7tlHpMR/LdESQ9TJRnoqfUPtsPZPs2eZsqVu9kIBh
 yzl+BegyIhiP8+dbheWBGBgcurzuDeQbXmj56+Ylg+d/SPdb8CEEVB/w+VvbWvc/+YFHUDqEA
 C/7EZFRQAuwlPLiH/bNT8iSbxv6L0r1MuxVqJSvSec3eLEBBtXxXQVylnqfOKqcjkfEz7+tOQ
 WrXSwPlc9TIAnKVtJfzcE/SXZisOdLqn8VhZ2uDx80Mj3bynvf6otb0cigdZrmyMU3tBt9LmG
 LHB1yUD39zB7+vXaS3SWtNqV/T08d3JJyF1Iio+svg+w/U5TgGn04yR5caJ44GWyDC/jIkHsz
 RSOsS3CwWXUJgTfTCi4d+kDjgsxcHIU2n8VF+M8WhcMLxVBaPzjj64TA0pwiouea50lxtTK94
 uxLN1bG121fpuWmE3fykvTfqarCcYXeDz7V51SG6jJvrctE4QD5d4sdKazab26Wt8Q6YvKoLA
 mlzzUbeNUBx5dSx8ZlTlfGrnSbJh3QVy64fcWNlXwi5A18/UrUmLfyTCnpf4pUrrBbcUEFD8t
 RwDsbC3xmJJu7SElxd0BRcin0XcgIkoMqxFYy463zsXX/jNJcjTZvYMSIm2TWesMvFDc8Lybd
 ec+mmmncb0FIbk4osoKxYvVG6UNaMnm2Jk4ZeeqrH3fOHDT56NRazh5InymCupijC5rydPMfe
 49pnCp+
Received-SPF: permerror client-ip=217.72.192.73;
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
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 net/dgram.c     | 54 ++++++++++++++++++++++++++++++++++++++++++++++++-
 qapi/net.json   |  2 +-
 qemu-options.hx |  1 +
 3 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index e581cc62f39f..02a189e36358 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -426,6 +426,7 @@ int net_init_dgram(const Netdev *netdev, const char *name,
     SocketAddress *remote, *local;
     struct sockaddr *dest_addr;
     struct sockaddr_in laddr_in, raddr_in;
+    struct sockaddr_un laddr_un, raddr_un;
     socklen_t dest_len;
 
     assert(netdev->type == NET_CLIENT_DRIVER_DGRAM);
@@ -465,7 +466,7 @@ int net_init_dgram(const Netdev *netdev, const char *name,
         }
     } else {
         if (local->type != SOCKET_ADDRESS_TYPE_FD) {
-            error_setg(errp, "type=inet requires remote parameter");
+            error_setg(errp, "type=inet or unix require remote parameter");
             return -1;
         }
     }
@@ -508,6 +509,53 @@ int net_init_dgram(const Netdev *netdev, const char *name,
         dest_addr = g_malloc(dest_len);
         memcpy(dest_addr, &raddr_in, dest_len);
         break;
+    case SOCKET_ADDRESS_TYPE_UNIX:
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
+        dest_len = sizeof(raddr_un);
+        dest_addr = g_malloc(dest_len);
+        memcpy(dest_addr, &raddr_un, dest_len);
+        break;
     case SOCKET_ADDRESS_TYPE_FD:
         fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
         if (fd == -1) {
@@ -546,6 +594,10 @@ int net_init_dgram(const Netdev *netdev, const char *name,
                           inet_ntoa(raddr_in.sin_addr),
                           ntohs(raddr_in.sin_port));
         break;
+    case SOCKET_ADDRESS_TYPE_UNIX:
+        qemu_set_info_str(&s->nc, "udp=%s:%s",
+                          laddr_un.sun_path, raddr_un.sun_path);
+        break;
     case SOCKET_ADDRESS_TYPE_FD: {
         SocketAddress *sa;
         SocketAddressType sa_type;
diff --git a/qapi/net.json b/qapi/net.json
index d8065c335072..14d1531536c5 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -600,7 +600,7 @@
 # @remote: remote address
 # @local: local address
 #
-# Only SocketAddress types 'inet' and 'fd' are supported.
+# Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
 #
 # If remote address is present and it's a multicast address, local address
 # is optional. Otherwise local address is required and remote address is
diff --git a/qemu-options.hx b/qemu-options.hx
index 95b231095542..1111e02a220c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2766,6 +2766,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                configure a network backend to connect to a multicast maddr and port\n"
     "                use ``local.host=addr`` to specify the host address to send packets from\n"
     "-netdev dgram,id=str,local.type=inet,local.host=addr,local.port=port[,remote.type=inet,remote.host=addr,remote.port=port]\n"
+    "-netdev dgram,id=str,local.type=unix,local.path=path[,remote.type=unix,remote.path=path]\n"
     "-netdev dgram,id=str,local.type=fd,local.str=file-descriptor\n"
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
-- 
2.37.3


