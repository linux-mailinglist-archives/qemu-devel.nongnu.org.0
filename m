Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C26606859
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 20:41:47 +0200 (CEST)
Received: from localhost ([::1]:41218 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZAg-0003ZS-Sw
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:17:30 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYlu-0007o6-DE
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYN9-0004e9-NB
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:24 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:39135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYN7-0006y1-IL
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:19 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mi4un-1pGCHl181x-00e2E6; Thu, 20 Oct 2022 18:26:04 +0200
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
Subject: [PATCH v13 01/17] net: introduce convert_host_port()
Date: Thu, 20 Oct 2022 18:25:42 +0200
Message-Id: <20221020162558.123284-2-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020162558.123284-1-lvivier@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0VddrL/IWoNfb5+7GLUYLds5spMoo3C/CYSp1I7B6hUXsdE1UKm
 C4Yf4JExv4GzGZ4V6jMmjvL7+TK/3mfzNb4byr4gxM6zy28Oe2sSC1P3j9p+QwIzs+bm40o
 yI8J/cbdKuPeRcWXXY+OEzgxW2B+80v64HT/+/Sq5htczOGSraD4d7jMbv2zt1XHoW0Mkub
 CMwscsdx7XTebCVMW8qIw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SDpL1OGymeE=:08lJmWzlX6IK91eDTLcngi
 byBT1YxnKjxj/tcQB9GduEhVYBIzSsSrD7IXAryGu2nt5qmxoQNp4c9dhuqiLQ1y26W4IXCPv
 i+HPJLEUkDUJEKWA/eVxjqs/YpXKDt8MuksAiF2t3Rm0zfz5LmvssoCOW3Fh3VbgePducfdO3
 xEImC5SIud+rQ+GGs8v+sKvYKmT6pcxME7W5muguHS8zSIfmiqfWVoSkUbDAKV011IvkTKCb2
 zUg4IWJYlU0/mHg3tpRjztmBbeVpNsL2AAYytyPoj+6FxkZBX2w+dSeuGKFncy4C59CnohXfX
 6++tNPRD2SucsdNXgaz8xIQp7vjLvqGXOHQwqYdyRB/OeZiO9scX9Wkc63EYlr/VZdotZgykB
 XKG6quQ/A5+CsRS26ppDUS1DL8IWhp+mc7eotC6ftUzh8bT55GoFhgikEgG/QXit7VlKNZuEn
 y7eSWqbTVppqWn6umKEVctbtxm3YfN37xmUSXT3DqCdvQXriSfeE0LWkbTwJL7MnYZJNPeRRA
 /Uh0yFffT383Cm64KciWrgy0ynoEoR95GgO5xrV+ENMUIYoK4KWDjEeEtpstiBHe1PCq801zh
 bdsVRzOdS1aG7wLLOoyhk6/8PpIM7Q9NaYroGDQ33U9EBY1AOcAOTgoTvO9Zg28n6ISyq3HhX
 ZXjeXHgbfe0d0WICuz1mu5+2yj9bkewcahT4fmJEgsHXNZyrkBOpsnXxQJxCvGpAwKlYzLhyN
 oeyHzWbrT7JnUk/SP6L4/S9OaBI3IyFnhHq613rYa+hG5/C3ShL9+VWiDygztGTGBAllg30Zy
 zpwYJnz
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


