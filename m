Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387385FBC05
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:27:18 +0200 (CEST)
Received: from localhost ([::1]:56922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiLqO-0006o2-AL
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLVt-0006P3-Eg
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:07 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:60945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLVr-0003jx-Dl
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:05 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTi9N-1oaKFb04YX-00U0LJ; Tue, 11 Oct 2022 22:05:46 +0200
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
Subject: [PATCH v11 01/17] net: introduce convert_host_port()
Date: Tue, 11 Oct 2022 22:05:23 +0200
Message-Id: <20221011200539.1486809-2-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011200539.1486809-1-lvivier@redhat.com>
References: <20221011200539.1486809-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2rCa7hLvyE2m+t/FaH4OXrdNULbkjAfH/Ah10xH5vvl+unpLrqE
 iJz/zdsuYim5ODAiHNt8oZk5AWyiFAMp25IrzAl9owmBMxhOqcGnBf/5S/lhDm0JxYqkSBF
 u5fD92MXtc9tWCXkNKMxvyKHEcG00uFe9DFNVrxEvaySMRN6bjOIyxzE3m7hIx9M2/lEQhZ
 VDelg4186j/qJJegiJ2Uw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uM0fSt3TyeI=:l62C1NPiRHzV4ufs46Iv6B
 gEkdbu9QwdXpeDLTOr2oi0SXgDBcCCYWzhYFumSAsyHYO4U7wJ8YTykA0Hu9v34ST/5mnzDLP
 n5MVoKEY7MQ3LylWHVyU+zH4U29uthuS61luX6bnNCNO7F2f7g+XdLmlhbX2TUpzOvMjDHADq
 6rjLrL8KHsIEBR04chw90svrnPY26QZvpMlZYsFgFKaTkF9WDL0UgM8Oyt2AwoJHa5BZxoQp1
 zjSKmiz3SqJbdf4UETIL2le8dH2Bb0zsAYZnfRB42hphsra32wc+l0WG7KQ90XOkz8hBQC5cS
 5SsLDADD8OBh0vN1sEmHhSMVeVuCbUJhvfhcsN2tPIcmN2ejbxMtmCzT75lGcMX8A354A4LoV
 dhTDVaq9w9SvemmWSYnl3ETgj0nW6tAmkPcKoMcy1lc52H6FeKZybGCT2INViqSFhnoIs1iTf
 SJFt1JWj/KRrPQ+NXpdENq1m71lcInfVuNJyBWQ0jlMflqp5xlaZCQIt7jHcZcxUZq8Gy+HV0
 NlrE/xL7wu2e+ukC0fF/ir788VljFSeUhbGkvLbfHlJJASsBQK0oO3746dDIV5LSChBV7W9oG
 5rblpRyJpWg/0oHDQ5Zhxk4tPRRRlud3krPldEahD04sv5MFc6P/sDA+OsXRetVSP8HUO7DfF
 cUfOaRRXxwFBmIBKktas39YtVECFPoi0m7ITU+SDPh0hNKb6ru3OoPR5vBf/jznNCE4Ax5XGd
 r44JzaS2li+3VluASmyoD0psLDH5F14CB6LwTA823gNhIi8FQ3U9cQjo44yWN5V/DRBTwzjfL
 q7rEg6U
Received-SPF: permerror client-ip=212.227.126.135;
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
---
 include/qemu/sockets.h |  2 ++
 net/net.c              | 62 ++++++++++++++++++++++--------------------
 2 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 036745e58653..db4bedb6fa20 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -65,6 +65,8 @@ void socket_listen_cleanup(int fd, Error **errp);
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
2.37.3


