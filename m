Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AE55B682D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 08:54:38 +0200 (CEST)
Received: from localhost ([::1]:37154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXzoZ-0006p9-W2
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 02:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzg2-0000gL-MM
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:48 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:40237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzft-0004DJ-Bs
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:45 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MLzeb-1opvwl0kAT-00HyKV; Tue, 13 Sep 2022 08:40:06 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gregory Kurz <gregory.kurz@free.fr>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v8 01/14] net: introduce convert_host_port()
Date: Tue, 13 Sep 2022 08:39:47 +0200
Message-Id: <20220913064000.79353-2-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913064000.79353-1-lvivier@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ictT7U0uY63h1ynWZo3WH4EeAefT7CDlX+h92Cv548mYKNuW5nP
 GWjKQ7TX64s6CVxG9uDkiAdMmRqwVV+Nnbp15g9bQPwlll9Kfq6Nnn3/uIfQSrvE1AkJ47C
 5/0MYR/popEzhceKKWyeG/yj3cPMZwMdHT66geZIpP0uwDUuo3qsIJwywN4fr4pT3J5G1B6
 Tuo4eYlBx/ohuZ64Q2BvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zw2UR04/fdI=:uL7mUfxbngc9yAlL++W0GO
 Ln7gUWzGajA/nKSGXLyjSMgxk+yGNq1Jk4wdfebVchY8PsbCnFqbt4L57+Rp2lNdsluArxJW+
 Wl+GEDvT+CQ3sNfuf/EgfYaklv39jnM4gw0gd5cvLiFbiyHu72CgK7a6k0bLU5tTKUQWv9d+t
 OUYQ4WIUwdDS68J42be4CwzMrIniLDrYAvqGsUFNj9qdkFwg0is0swII5HGodnr7/WaC7q92h
 HO/1y+BpFE3Tk31YsPMAHgecsyDHSgyBXj1YCMuwGutDif/4RD7LfEau+9uZHEO3RRHFJz7DC
 6Ts33UdsAuP7eFD95kDuZgtYF4wLJTCQBuAseF7l+cQHYsuayF4OK844TD6TxwrNREdVcJ/oM
 cx75PYoGgbbFr1N7ONWsfczsaTXg1Po2AcavriuhQWBzDox7JDkx83ztEiSKPSLjLX6UFPlM2
 pQoJMjXcmmJjDL1ICotkF0SRFaOs+jmXUatBJsavV+k2gDdbPbvtXWAirbW45zShHM7SbE/wL
 qZd8V8XEF+hu1GEs3C1CGJGmprIiwyGxvE617J5GSM+FNWjsxyDohE51MUQIDgz0nAeRVNLUY
 xv+WocucBJ5cycH7t1eDq7+a/aij/yQGk3E0Ak0XrrubZNPPziIQN60fqRj1AacZsXp367jNV
 hKzeskXw/j/Fv9ZeEEQMM1ySafyG1UaUbnd5yW3cDEhXQdcT7KQ1ZEEpZrZgWGp8Bb5rCMS4q
 IxK/K2nJdQFJflX9lKv6RHadTZEuRsZ6cks0mzlLXOVhUiKYv67u84y/+TbIpxYwTHFzFzap4
 OuUlssk
Received-SPF: permerror client-ip=212.227.126.135;
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
2.37.3


