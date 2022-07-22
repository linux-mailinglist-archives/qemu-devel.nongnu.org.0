Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CA557E745
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:22:02 +0200 (CEST)
Received: from localhost ([::1]:37324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEyDp-0002qE-Aw
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExyK-0007Vj-FQ
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:06:01 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:60541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExyI-0005N5-FO
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:59 -0400
Received: from thinkpad.redhat.com ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mi2eP-1nbUPE452X-00e1yX; Fri, 22 Jul 2022 21:04:46 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v7 01/14] net: introduce convert_host_port()
Date: Fri, 22 Jul 2022 21:04:29 +0200
Message-Id: <20220722190442.301310-2-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722190442.301310-1-lvivier@redhat.com>
References: <20220722190442.301310-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZP2Kx9DTH2400TsoJYcNzwb9TevjOEs6WJpKedK32cFeYrMfvND
 i8yTnOgJrYTmREWf0VkFYKkak3hNTLS6Bj4Wa1S2fsqTAXsqOw7NC7VgTNQBmn7IFae/5Jv
 nNamIeV+6UlsYyTHe/hEVapQbgIM6bBmCjvH3IFCN/ArSpXjJRQeGbL2LYnFoEf8q/le/z3
 f4HgQb4OzbyDPZrlVWYcA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4SKYIwG4VxM=:z/RQ1OXqFbCSjgPofRbzCV
 BnzDkhTl1y/f0JUvx1ukz1AJlOQ+Wu4iYdiojDFvK8XPLs8hC6t3LqHb5ABPih45qDiQIywtM
 EooKRAb7m24XeamtW0J77PcHPTtU1My4zZJ5dVGD2zEwws8cdeIbNv8tRGOsadZ84fKa0XEKo
 Tzd3qPVEkIV1c89OXIyJw58RrAJkeKQfTHW0rj5o+1VVrfjFTtMF+yYJOPU9AneMc4l/Qg/2t
 nyyvpVqupv/fhydGjkFDiz2rYPU195eRJhcEp5dCeDZFHr2NPO137T5J5HWlV4eufgM0nv6v4
 yoYZE9WwVR+zeb6u+pugc2lHTWfovCSAowqtbUanqQB1iGydwEJH4ZfZs3lWUHoynG4KAkJwv
 OR1r1zWfBKQVbRpqj5CfKX+EcRaHJtvfGLOMsdWU6M0GeVfnRtd5Q9gQ6uZxYR9vIyRi/9+p3
 3HwTtywLKWBzbf+T9b0lFSPiFVoadqUymGuUVyr5vv1Sc/d63d+1J2zwCtPFKWBKGCcOq03TE
 g3IbZjgYRb+1NqRSPNU3w6idfQSKnoO943cS7LF7MQZQTV973hGmmLS12MF1Oxt6IytDxg4Lo
 c0bOZCVxKBHJeiYJ9a7jOavQJJtxPc1lqOmoItAbBfIwXTMYTt72n9Klowxe6pwdvfW68/SC0
 VxH/rlBShWlRMzg5pgyUGokGnsobd60XtnL7sbFHGa0PiiOyfD34pzbRhoCCxIcgF2deiXCAV
 zQ5vq6LA8UCYUuxptZaxNa4PUa0DOu/hsLpnVA==
Received-SPF: permerror client-ip=212.227.126.134;
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
 include/qemu/sockets.h |  2 ++
 net/net.c              | 62 ++++++++++++++++++++++--------------------
 2 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 038faa157f59..47194b9732f8 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -47,6 +47,8 @@ void socket_listen_cleanup(int fd, Error **errp);
 int socket_dgram(SocketAddress *remote, SocketAddress *local, Error **errp);
 
 /* Old, ipv4 only bits.  Don't use for new code. */
+int convert_host_port(struct sockaddr_in *saddr, const char *host,
+                      const char *port, Error **errp);
 int parse_host_port(struct sockaddr_in *saddr, const char *str,
                     Error **errp);
 int socket_init(void);
diff --git a/net/net.c b/net/net.c
index 2db160e0634d..d2288bd3a929 100644
--- a/net/net.c
+++ b/net/net.c
@@ -66,55 +66,57 @@ static QTAILQ_HEAD(, NetClientState) net_clients;
 /***********************************************************/
 /* network device redirectors */
 
-int parse_host_port(struct sockaddr_in *saddr, const char *str,
-                    Error **errp)
+int convert_host_port(struct sockaddr_in *saddr, const char *host,
+                      const char *port, Error **errp)
 {
-    gchar **substrings;
     struct hostent *he;
-    const char *addr, *p, *r;
-    int port, ret = 0;
+    const char *r;
+    long p;
 
     memset(saddr, 0, sizeof(*saddr));
 
-    substrings = g_strsplit(str, ":", 2);
-    if (!substrings || !substrings[0] || !substrings[1]) {
-        error_setg(errp, "host address '%s' doesn't contain ':' "
-                   "separating host from port", str);
-        ret = -1;
-        goto out;
-    }
-
-    addr = substrings[0];
-    p = substrings[1];
-
     saddr->sin_family = AF_INET;
-    if (addr[0] == '\0') {
+    if (host[0] == '\0') {
         saddr->sin_addr.s_addr = 0;
     } else {
-        if (qemu_isdigit(addr[0])) {
-            if (!inet_aton(addr, &saddr->sin_addr)) {
+        if (qemu_isdigit(host[0])) {
+            if (!inet_aton(host, &saddr->sin_addr)) {
                 error_setg(errp, "host address '%s' is not a valid "
-                           "IPv4 address", addr);
-                ret = -1;
-                goto out;
+                           "IPv4 address", host);
+                return -1;
             }
         } else {
-            he = gethostbyname(addr);
+            he = gethostbyname(host);
             if (he == NULL) {
-                error_setg(errp, "can't resolve host address '%s'", addr);
-                ret = -1;
-                goto out;
+                error_setg(errp, "can't resolve host address '%s'", host);
+                return -1;
             }
             saddr->sin_addr = *(struct in_addr *)he->h_addr;
         }
     }
-    port = strtol(p, (char **)&r, 0);
-    if (r == p) {
-        error_setg(errp, "port number '%s' is invalid", p);
+    if (qemu_strtol(port, &r, 0, &p) != 0) {
+        error_setg(errp, "port number '%s' is invalid", port);
+        return -1;
+    }
+    saddr->sin_port = htons(p);
+    return 0;
+}
+
+int parse_host_port(struct sockaddr_in *saddr, const char *str,
+                    Error **errp)
+{
+    gchar **substrings;
+    int ret;
+
+    substrings = g_strsplit(str, ":", 2);
+    if (!substrings || !substrings[0] || !substrings[1]) {
+        error_setg(errp, "host address '%s' doesn't contain ':' "
+                   "separating host from port", str);
         ret = -1;
         goto out;
     }
-    saddr->sin_port = htons(port);
+
+    ret = convert_host_port(saddr, substrings[0], substrings[1], errp);
 
 out:
     g_strfreev(substrings);
-- 
2.37.1


