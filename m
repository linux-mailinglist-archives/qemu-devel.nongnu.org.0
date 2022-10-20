Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4026066C8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:10:51 +0200 (CEST)
Received: from localhost ([::1]:60708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZ3u-0001fV-Rt
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:10:35 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYnn-0004Bb-Po
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNY-0004vf-9Q
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:49 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:45923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNT-00072U-43
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:41 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MeUPU-1pLz3J0YjM-00aRr5; Thu, 20 Oct 2022 18:26:21 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v13 12/17] net: dgram: add unix socket
Date: Thu, 20 Oct 2022 18:25:53 +0200
Message-Id: <20221020162558.123284-13-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020162558.123284-1-lvivier@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:alvdcWL/VgvS671yN91mMLL08XAvN+/+sIJ5RLxMGDrUJXTaxYt
 p+1sHClivcrUIarOFspBYCZNiMr0gWwmJQlc9CG9570Lllx6wTMvGsxYxTK82GDRt/ceC0Y
 mRc1YbyH8CX0yjdTtN5meDzilYi3LfEvBnRJFtQGipPGNDVVcnNGNHzCTLxdB5EnszcmW6f
 xKhXJNJ+2M7j9DL53ugNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aCCgGcsMsyE=:+UnZdn2Mo7dA5J0IXycQ/p
 5kVp8VtV3IHONGyNd+MTf+zJpHJsGkD6/RBtUcyOOvbsKdgqUQAg+jYhH7EGAElaINPXm59UU
 1AWK1+sfp8nWblhs5oMvQwENRYLKk5D4vP20K8iV49TN86cGX30CBi5CMpYxzx44Ao5MZfNvf
 8OI4F+7zxqyaF/+HW2hvBz272iFc/jmn+NXu9+cZB1drbUN3GRJ2dNMOyW3Zq1XiQwY3PmaVM
 i9pY/Hrd0N7G0NL/53xadFl2FrEsYVm4pwspAA8oA7MIXegMuwnRDD8oPxuspmBWSFKaQS1wg
 1RAD6oVLPkQUg+ALfmSLAZDtJWn5PiGBr7NnUl5stVAQOxoqHA9O5GQFeWBKFGJRYy3y/ykgC
 xw1pIDh9ISSysfJclPxAM3SKRV034Uc5PBb0kbUqy5Gke8v4d0UV0WVpAzKvCJJfjPHRKe/PF
 UDcrA0H6MY1/53fChJ1yXYtpNY7WDheUgQuWnVX4lLXDgtj8PwIVxqHnTAWuLluEvmce7azj/
 D9XiZb9qkFjQ5izeMXYs/FkAigjhS+ZujG3goa+HoP96L5cgt7CGud6qf3mj0SQwFQeLoAMX4
 /Mrc+cBEH1UVY4R57cXn/EJZNsR0+zaemWS2HHh1pS+yP9mE53+nmUkqS1ZwOP31cTlrFRKx9
 DfEYMua6fFtOxW69D+Cw27zzbX67ClNfhjBf1RdUnw1LvdYImWWDJK9hEzjZJC8tKJeF15D4Q
 uX3VYxc59LdSXBAVj1uieEJvp7m6J8JEPQuszO5xbKEjD5h0KoTVZk4wzNbxL8sjfcNPqiXtE
 zFrjVjE
Received-SPF: permerror client-ip=212.227.126.187;
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
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com> (QAPI schema)
---
 net/dgram.c     | 55 ++++++++++++++++++++++++++++++++++++++++++++++++-
 qapi/net.json   |  2 +-
 qemu-options.hx |  1 +
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index e581cc62f39f..9f7bf3837653 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -426,6 +426,7 @@ int net_init_dgram(const Netdev *netdev, const char *name,
     SocketAddress *remote, *local;
     struct sockaddr *dest_addr;
     struct sockaddr_in laddr_in, raddr_in;
+    struct sockaddr_un laddr_un, raddr_un;
     socklen_t dest_len;
 
     assert(netdev->type == NET_CLIENT_DRIVER_DGRAM);
@@ -465,7 +466,8 @@ int net_init_dgram(const Netdev *netdev, const char *name,
         }
     } else {
         if (local->type != SOCKET_ADDRESS_TYPE_FD) {
-            error_setg(errp, "type=inet requires remote parameter");
+            error_setg(errp,
+                       "type=inet or type=unix requires remote parameter");
             return -1;
         }
     }
@@ -508,6 +510,53 @@ int net_init_dgram(const Netdev *netdev, const char *name,
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
@@ -546,6 +595,10 @@ int net_init_dgram(const Netdev *netdev, const char *name,
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
index aed4ce1a97ff..39388b1b6c41 100644
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
index 98e2595df93b..fafb214cb89f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2782,6 +2782,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                configure a network backend to connect to a multicast maddr and port\n"
     "                use ``local.host=addr`` to specify the host address to send packets from\n"
     "-netdev dgram,id=str,local.type=inet,local.host=addr,local.port=port[,remote.type=inet,remote.host=addr,remote.port=port]\n"
+    "-netdev dgram,id=str,local.type=unix,local.path=path[,remote.type=unix,remote.path=path]\n"
     "-netdev dgram,id=str,local.type=fd,local.str=file-descriptor\n"
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
-- 
2.37.3


