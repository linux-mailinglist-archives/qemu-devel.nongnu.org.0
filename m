Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6295203C8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 19:49:08 +0200 (CEST)
Received: from localhost ([::1]:56082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no7VL-0001fP-2z
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 13:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1no7JB-00074M-8H
 for qemu-devel@nongnu.org; Mon, 09 May 2022 13:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1no7J9-000132-ML
 for qemu-devel@nongnu.org; Mon, 09 May 2022 13:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652117791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WN0XLtgqvXP+5fCjwXrSGWZiyDajcM+5Evox/7Xl5L0=;
 b=RdVETL43IBvE78hMYi/9svwObZ9U2cJVC+fj3m7f8XZpyMc+eMi+ojl+fUSJpLpd5xahep
 Uyg1IIYBci+BVWQ4ioKikxfh0xWc6OerCkWRuF1l8/cC1ie5jOnHoiZSBM4U6CtYxqYeVJ
 bjM1t7U9lmTgMNEu/T7F5Q2B/UpF6EA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-Skp00dGgOdKuZcAd_BJaqA-1; Mon, 09 May 2022 13:36:28 -0400
X-MC-Unique: Skp00dGgOdKuZcAd_BJaqA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80E68185A7B2
 for <qemu-devel@nongnu.org>; Mon,  9 May 2022 17:36:28 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A944840CF8EC;
 Mon,  9 May 2022 17:36:27 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH 6/6] net: socket-ng: add unix socket for dgram mode
Date: Mon,  9 May 2022 19:36:18 +0200
Message-Id: <20220509173618.467207-7-lvivier@redhat.com>
In-Reply-To: <20220509173618.467207-1-lvivier@redhat.com>
References: <20220509173618.467207-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
---
 net/socket-ng.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/net/socket-ng.c b/net/socket-ng.c
index aabdd0eed381..d4457f4bc63b 100644
--- a/net/socket-ng.c
+++ b/net/socket-ng.c
@@ -123,8 +123,15 @@ static ssize_t net_socket_receive_dgram(NetClientState *nc,
 
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
@@ -831,7 +838,7 @@ static int net_socketng_udp_init(NetClientState *peer,
         }
     } else {
         if (local->type != SOCKET_ADDRESS_TYPE_FD) {
-            error_setg(errp, "type=inet and mode=unicast require "
+            error_setg(errp, "type=inet or unix and mode=unicast require "
                              "remote parameter");
             return -1;
         }
@@ -882,6 +889,58 @@ static int net_socketng_udp_init(NetClientState *peer,
 
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
+        info_str = g_strdup_printf("socket-ng: udp=%s:%s",
+                                   laddr_un.sun_path, raddr_un.sun_path);
+        break;
+    }
     case SOCKET_ADDRESS_TYPE_FD: {
         SocketAddress *sa;
         SocketAddressType sa_type;
-- 
2.35.3


