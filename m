Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E58605B56
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 11:40:19 +0200 (CEST)
Received: from localhost ([::1]:53386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olS2E-0005Ta-2A
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:40:18 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olRqs-0004CL-19
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfX-0002Wp-7v
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:16:51 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:48161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfV-0005Hh-6P
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:16:50 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MOiLv-1oT5Qu2ev1-00QETJ; Thu, 20 Oct 2022 11:16:31 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paul Durrant <paul@xen.org>, Stefan Weil <sw@weilnetz.de>,
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v12 01/17] net: introduce convert_host_port()
Date: Thu, 20 Oct 2022 11:16:08 +0200
Message-Id: <20221020091624.48368-2-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020091624.48368-1-lvivier@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:w7b7ew+XCKzAiNz98MdvY/X+FRrIVaZcwXchn++di0t+4lHR55J
 QMUTAMRUkKzYEwok+QgfhDJNqEEZFDulUNjrXxYNWfK6dhMZaXtVXn8IrjBYdv1ujSbM52j
 8y2Ai8TzcqOd0yhC7jtN8I9Wwnxisu7t1ChvZ2ICyw1NFZfyYUnsx4vUaLfvRB5CR+5oB/+
 LvXVkNO2l1KSYUHApLoZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hI15SSxCSiM=:I8hQqXJjf5XOelF9j214RG
 fXWFmJFM1zApl2umJyJou/JcG+4y+DKl6/dhnTgstHZfa0u598fi/tmGz/HzM6IANRALMc/eD
 6DwrM/xYp6UE/V2s38VeBrwb4dRW02QtlI3SbDIsMDo3U16SKdb7hmf0Z4F8e/xB/8STU7oAJ
 I/lz69i0JqHCjVt/wn3VwRDi/jxrz8yUumJj2iLZuKHfuLnIIAJwwF7NXSlntEhDmEm67yQ9P
 fRd8XrQ6cXjtouTXYZMBd8Coq7NCE8+bDJrtQSDEhdvHFeUQIlFYjSf3NrI0b7Z/UNOhtT7tZ
 hSNtv+4B66mcay5UGp9m3FbAAKK1Iw9+Xe0DMSRq9frr7zwBKCzLydXSy/IPc5z3ZDIO0pBZe
 s56fPDgeV/6PScq2ckvDlThV0F2K6y/GaQu7b8lJbiz9CDT9tVGIOOD/5g2UidNsbjxS4aYDP
 1IkzhGnpNXVPXNz1xjbqDfITTW1Fm83c9uLBYehEx8yM32D+JIMuk71/mtDORpK2mbcuFtZg/
 5lkHhN/vNJ68fzjUQxQHB6rVnCNXANvZ4yHdhXDj1rPfje+/pl/xLNUfppwhOIprymMZ4SEFB
 Ny0kwx+JA8tAnvNSlrQk7WkKYWM5Hrzklq6tHrqhS3DIKgzhub5NZwBW54ktbXeln71Rlfoxe
 HRe3hTvFluCAZ1eJG4SS679Z4PDWGiIaimjt1u1p2f7WvQCFoJY9iTk74T/yQLVBB8eTPiYqd
 G1v/jNDzJkllo8H7QdZmna98mHX6pps0xqoXvNt2LDhvviGJDhK7jDi24h6Lppoot0GrRYZAa
 Wsa5tWw
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


