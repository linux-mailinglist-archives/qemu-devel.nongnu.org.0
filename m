Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF625FBC17
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:34:02 +0200 (CEST)
Received: from localhost ([::1]:55964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiLwv-0004DK-DR
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLW3-0006Pk-D8
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:20 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:51373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLW1-0003ll-BX
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:15 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MWixU-1og7X70yQy-00X0c0; Tue, 11 Oct 2022 22:06:01 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Greg Kurz <groug@kaod.org>,
 Eric Blake <eblake@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paul Durrant <paul@xen.org>,
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v11 11/17] net: dgram: move mcast specific code from
 net_socket_fd_init_dgram()
Date: Tue, 11 Oct 2022 22:05:33 +0200
Message-Id: <20221011200539.1486809-12-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011200539.1486809-1-lvivier@redhat.com>
References: <20221011200539.1486809-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:F1WBOjes54Ktx9ZJasV0Hab4sIMUR/z2M3jvkx2EPwUQPltAOCa
 y1XLW8Oj6A59NXmTOzuu/5XLhRXcTdHx/2y4rx0F8dMCoLfq6sRFmVbYQdrkWeb5A1w+ReD
 dZfkGUutwbsz/4BqwdDSTgUJpnXng+v+LVPyuro0xgJbBDwOfjL90X4hyn2261T2rM/PYCn
 FuM+zRiXY9IzbNPLArrBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Js7oq39HmRI=:mRAqevwrzuxkvuEpNSBN3W
 6E+w49WgogP7r3Tfx15xZkL9cTdmamflmPGaaIPxKS/rTv2irM0GTlpDe16DBjPfcrP/XiYgM
 obCKvNxaXUS428WK7A/qFIc09c3sCzMhmASM0nLJz1G4z2oYHcftzE3/MGRMVGgAUB22J6UrJ
 qPvNfDSS/7jYGjYiUk/X+3cO5g2cH978c1UdzOGRJ+orqJP76DzbpulF0ZG78EKncb4WUlKyt
 J9DZ5jFgEfnNTmBp/tz1fumKi+tZzPGIO2PcIG7Ra8+eI88pPY0qecHEqULhWybInyaDIbcVB
 1K3YpzRyxCrbLlF9G3j59r9WP16c5+VdpKM8GfbjuCUfs1BU8+VQAZzEtmMRpeYUmlGoCyWCa
 7qQoVHp51ONpaU3FKgY3Hz3MUgcXmqirBe19MHaWsR3eBBqJLB3Cj0a9yHxvKe4yDjrghcw2j
 00yjqV0rnwGCnjH3AOnXIqeN4HoglOw3iavd8l8TyZfzu8NUK4BMxpHCLlPNTkprwCXIbYfEJ
 FkfMlCrjKnigGoECX4WBtQNayuBn+BE07NHVtz/HzVkvSQrT8ZwpccoyBVLcdr8jS8XgxPKlP
 uJy3Xzg13FTrPVd0kYc1ZYidA47IB11HKF8PSn7zo7MIb6LzR180h5ZAMk02simUNPHy0pw1Q
 26mvqnpPuD1XsoyOF0gGD8snVxbfub6R8L15TZQ8T86/i1QdY/6y2GvwwdKLeN3dA0c5ODMs8
 WPhfvG5T9a3VHvW0jngim+BebPJYi25ugxVx/PCuWBdZLs75hjeqdVndVo7oOLzeXMFqdVkYz
 25LRVFM
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

It is less complex to manage special cases directly in
net_dgram_mcast_init() and net_dgram_udp_init().

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/dgram.c | 143 ++++++++++++++++++++++++++++------------------------
 1 file changed, 76 insertions(+), 67 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index e20be9ca79d3..e581cc62f39f 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -259,52 +259,11 @@ static NetClientInfo net_dgram_socket_info = {
 static NetDgramState *net_dgram_fd_init(NetClientState *peer,
                                         const char *model,
                                         const char *name,
-                                        int fd, int is_fd,
-                                        SocketAddress *mcast,
+                                        int fd,
                                         Error **errp)
 {
-    struct sockaddr_in *saddr = NULL;
-    int newfd;
     NetClientState *nc;
     NetDgramState *s;
-    SocketAddress *sa;
-    SocketAddressType sa_type;
-
-    sa = socket_local_address(fd, errp);
-    if (!sa) {
-        return NULL;
-    }
-    sa_type = sa->type;
-    qapi_free_SocketAddress(sa);
-
-    /*
-     * fd passed: multicast: "learn" dest_addr address from bound address and
-     * save it. Because this may be "shared" socket from a "master" process,
-     * datagrams would be recv() by ONLY ONE process: we must "clone" this
-     * dgram socket --jjo
-     */
-
-    if (is_fd && mcast != NULL) {
-            saddr = g_new(struct sockaddr_in, 1);
-
-            if (convert_host_port(saddr, mcast->u.inet.host, mcast->u.inet.port,
-                                  errp) < 0) {
-                goto err;
-            }
-            /* must be bound */
-            if (saddr->sin_addr.s_addr == 0) {
-                error_setg(errp, "can't setup multicast destination address");
-                goto err;
-            }
-            /* clone dgram socket */
-            newfd = net_dgram_mcast_create(saddr, NULL, errp);
-            if (newfd < 0) {
-                goto err;
-            }
-            /* clone newfd to fd, close newfd */
-            dup2(newfd, fd);
-            close(newfd);
-    }
 
     nc = qemu_new_net_client(&net_dgram_socket_info, peer, model, name);
 
@@ -314,23 +273,7 @@ static NetDgramState *net_dgram_fd_init(NetClientState *peer,
     net_socket_rs_init(&s->rs, net_dgram_rs_finalize, false);
     net_dgram_read_poll(s, true);
 
-    /* mcast: save bound address as dst */
-    if (saddr) {
-        g_assert(s->dest_addr == NULL);
-        s->dest_addr = (struct sockaddr *)saddr;
-        s->dest_len = sizeof(*saddr);
-        qemu_set_info_str(nc, "fd=%d (cloned mcast=%s:%d)", fd,
-                          inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
-    } else {
-        qemu_set_info_str(nc, "fd=%d %s", fd, SocketAddressType_str(sa_type));
-    }
-
     return s;
-
-err:
-    g_free(saddr);
-    closesocket(fd);
-    return NULL;
 }
 
 static int net_dgram_mcast_init(NetClientState *peer,
@@ -381,7 +324,9 @@ static int net_dgram_mcast_init(NetClientState *peer,
             }
             break;
         }
-        case SOCKET_ADDRESS_TYPE_FD:
+        case SOCKET_ADDRESS_TYPE_FD: {
+            int newfd;
+
             fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
             if (fd == -1) {
                 g_free(saddr);
@@ -394,7 +339,42 @@ static int net_dgram_mcast_init(NetClientState *peer,
                                  name, fd);
                 return -1;
             }
+
+            /*
+             * fd passed: multicast: "learn" dest_addr address from bound
+             * address and save it. Because this may be "shared" socket from a
+             * "master" process, datagrams would be recv() by ONLY ONE process:
+             * we must "clone" this dgram socket --jjo
+             */
+
+            saddr = g_new(struct sockaddr_in, 1);
+
+            if (convert_host_port(saddr, local->u.inet.host, local->u.inet.port,
+                                  errp) < 0) {
+                g_free(saddr);
+                closesocket(fd);
+                return -1;
+            }
+
+            /* must be bound */
+            if (saddr->sin_addr.s_addr == 0) {
+                error_setg(errp, "can't setup multicast destination address");
+                g_free(saddr);
+                closesocket(fd);
+                return -1;
+            }
+            /* clone dgram socket */
+            newfd = net_dgram_mcast_create(saddr, NULL, errp);
+            if (newfd < 0) {
+                g_free(saddr);
+                closesocket(fd);
+                return -1;
+            }
+            /* clone newfd to fd, close newfd */
+            dup2(newfd, fd);
+            close(newfd);
             break;
+        }
         default:
             g_free(saddr);
             error_setg(errp, "only support inet or fd type for local");
@@ -402,9 +382,7 @@ static int net_dgram_mcast_init(NetClientState *peer,
         }
     }
 
-    s = net_dgram_fd_init(peer, model, name, fd,
-                          local->type == SOCKET_ADDRESS_TYPE_FD,
-                          remote, errp);
+    s = net_dgram_fd_init(peer, model, name, fd, errp);
     if (!s) {
         g_free(saddr);
         return -1;
@@ -414,8 +392,26 @@ static int net_dgram_mcast_init(NetClientState *peer,
     s->dest_addr = (struct sockaddr *)saddr;
     s->dest_len = sizeof(*saddr);
 
-    qemu_set_info_str(&s->nc, "mcast=%s:%d", inet_ntoa(saddr->sin_addr),
-                      ntohs(saddr->sin_port));
+    if (!local) {
+        qemu_set_info_str(&s->nc, "mcast=%s:%d",
+                          inet_ntoa(saddr->sin_addr),
+                          ntohs(saddr->sin_port));
+    } else {
+        switch (local->type) {
+        case SOCKET_ADDRESS_TYPE_INET:
+            qemu_set_info_str(&s->nc, "mcast=%s:%d",
+                              inet_ntoa(saddr->sin_addr),
+                              ntohs(saddr->sin_port));
+            break;
+        case SOCKET_ADDRESS_TYPE_FD:
+            qemu_set_info_str(&s->nc, "fd=%d (cloned mcast=%s:%d)",
+                              fd, inet_ntoa(saddr->sin_addr),
+                              ntohs(saddr->sin_port));
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
 
     return 0;
 
@@ -531,7 +527,7 @@ int net_init_dgram(const Netdev *netdev, const char *name,
         return -1;
     }
 
-    s = net_dgram_fd_init(peer, "dgram", name, fd, 0, NULL, errp);
+    s = net_dgram_fd_init(peer, "dgram", name, fd, errp);
     if (!s) {
         return -1;
     }
@@ -550,9 +546,22 @@ int net_init_dgram(const Netdev *netdev, const char *name,
                           inet_ntoa(raddr_in.sin_addr),
                           ntohs(raddr_in.sin_port));
         break;
-    case SOCKET_ADDRESS_TYPE_FD:
-        qemu_set_info_str(&s->nc, "fd=%d", fd);
+    case SOCKET_ADDRESS_TYPE_FD: {
+        SocketAddress *sa;
+        SocketAddressType sa_type;
+
+        sa = socket_local_address(fd, errp);
+        if (sa) {
+            sa_type = sa->type;
+            qapi_free_SocketAddress(sa);
+
+            qemu_set_info_str(&s->nc, "fd=%d %s", fd,
+                              SocketAddressType_str(sa_type));
+        } else {
+            qemu_set_info_str(&s->nc, "fd=%d", fd);
+        }
         break;
+    }
     default:
         g_assert_not_reached();
     }
-- 
2.37.3


