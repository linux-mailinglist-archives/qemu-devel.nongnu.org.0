Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5C955BADC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 17:51:47 +0200 (CEST)
Received: from localhost ([::1]:32918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5r1e-0006ro-PB
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 11:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o5qyL-0002Hu-JF
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 11:48:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o5qyK-0005jZ-0F
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 11:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656344899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGe9Ce5Z69DGRZCioCTNc776DpVOAAjQrdw2xalT9QI=;
 b=Ph3XXPkBhlL+eyAK6xQfDOiSFaSKCOfLLw0W6nP+ZmMjQ+uBwDwwWzcyUuA+M5bsXyUj8A
 /FqcrlJuADNvsu31PUdLg5sa5LWX5gD+1uBO9uqr0yQXfiSNmPXQ3lFXB1Na2Eg8ErD53J
 A3EzX1gBu2MhJp+zQPZFccUnaVwsBAg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-fkCplegoN2Ss7Gxupv5sJQ-1; Mon, 27 Jun 2022 11:48:18 -0400
X-MC-Unique: fkCplegoN2Ss7Gxupv5sJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B320685A581
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:48:17 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 190422166B26;
 Mon, 27 Jun 2022 15:48:15 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v5 10/12] net: dgram: add unix socket
Date: Mon, 27 Jun 2022 17:47:47 +0200
Message-Id: <20220627154749.871943-11-lvivier@redhat.com>
In-Reply-To: <20220627154749.871943-1-lvivier@redhat.com>
References: <20220627154749.871943-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 qemu-options.hx |  1 +
 2 files changed, 63 insertions(+), 3 deletions(-)

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
diff --git a/qemu-options.hx b/qemu-options.hx
index 23ff12c1b183..950e932f528f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2732,6 +2732,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                configure a network backend to connect to a multicast maddr and port\n"
     "                use 'local.host=addr' to specify the host address to send packets from\n"
     "-netdev dgram,id=str,local.type=inet,local.host=addr,local.port=port[,remote.type=inet,remote.host=addr,remote.port=port]\n"
+    "-netdev dgram,id=str,local.type=unix,local.path=path[,remote.type=unix,remote.path=path]\n"
     "-netdev dgram,id=str,local.type=fd,local.str=h\n"
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
-- 
2.36.1


