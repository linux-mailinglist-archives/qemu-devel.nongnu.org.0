Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873CD4184DC
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 00:16:33 +0200 (CEST)
Received: from localhost ([::1]:36986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUFyC-0000u0-3t
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 18:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicholas@ngai.me>) id 1mUFgU-0005LK-HM
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 17:58:14 -0400
Received: from 066-214-204-005.res.spectrum.com ([66.214.204.5]:57322
 helo=mail-pedantry.hopto.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nicholas@ngai.me>) id 1mUFgR-0002tY-NL
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 17:58:13 -0400
Received: from mail.pedantry.org (30.111.83.34.bc.googleusercontent.com
 [34.83.111.30])
 by mail-pedantry.hopto.org (Postfix) with ESMTPSA id 943F43E74A;
 Sat, 25 Sep 2021 22:48:50 +0100 (BST)
Received: from localhost.localdomain (unknown [185.202.221.174])
 by mail.pedantry.org (Postfix) with ESMTPSA id B0513A081A;
 Sat, 25 Sep 2021 21:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ngai.me; s=mail;
 t=1632606529; bh=A6sVyS5Ga8pC1+z17R+U+lCCjebAxUVhuXNRW1BKvSg=;
 h=From:To:Cc:Subject:Date:From;
 b=kyWWreMf9515ydsSXkLSapk43f9Mgz659hhZti+KrLrYVzcL5ah6tcImWosvc69+n
 de2+FQPNLfRXoS66lgsyAT7w17GW9Hjb1gkWeqeIVGte/XI3YxduYcTPVLnSmS+K8Z
 6Cm8eMfBB0e7B0SA/PJzQgnMJbsqaAvSXG0OaWqq2nx+wCXwSNvKGBgP8JbeXSeRLK
 0il+KwSfXlsjCRHzGfeeAYc5nlSCgdmeDtJycdbRSC/AFoXcrame2tRbrOvnrFQXXE
 3IWLLPQnxsBUiN/zilK10kpe6nvwK1/ymDGnkhqdkrYA4xXPbU8IYNpN4q+LCYlnhA
 xJ5Vkjr0RFp9Q==
From: Nicholas Ngai <nicholas@ngai.me>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Nicholas Ngai <nicholas@ngai.me>
Subject: [PATCH] net/slirp: Use newer slirp_*_hostxfwd API
Date: Sat, 25 Sep 2021 14:48:20 -0700
Message-Id: <20210925214820.18078-1-nicholas@ngai.me>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.214.204.5; envelope-from=nicholas@ngai.me;
 helo=mail-pedantry.hopto.org
X-Spam_score_int: 22
X-Spam_score: 2.2
X-Spam_bar: ++
X-Spam_report: (2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_RDNS_DYNAMIC_FP=0.001,
 RCVD_IN_PBL=3.335, RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_RCVD_IP=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 25 Sep 2021 18:14:43 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

libslirp provides a newer slirp_*_hostxfwd API meant for
address-agnostic forwarding instead of the is_udp parameter which is
limited to just TCP/UDP.

Signed-off-by: Nicholas Ngai <nicholas@ngai.me>
---
 net/slirp.c | 64 +++++++++++++++++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 22 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index ad3a838e0b..49ae01a2f0 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -643,12 +643,17 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *id)
 
 void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
 {
-    struct in_addr host_addr = { .s_addr = INADDR_ANY };
-    int host_port;
+    struct sockaddr_in host_addr = {
+        .sin_family = AF_INET,
+        .sin_addr = {
+            .s_addr = INADDR_ANY,
+        },
+    };
+    int port;
+    int flags = 0;
     char buf[256];
     const char *src_str, *p;
     SlirpState *s;
-    int is_udp = 0;
     int err;
     const char *arg1 = qdict_get_str(qdict, "arg1");
     const char *arg2 = qdict_get_try_str(qdict, "arg2");
@@ -670,9 +675,9 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
     }
 
     if (!strcmp(buf, "tcp") || buf[0] == '\0') {
-        is_udp = 0;
+        /* Do nothing; already TCP. */
     } else if (!strcmp(buf, "udp")) {
-        is_udp = 1;
+        flags |= SLIRP_HOSTFWD_UDP;
     } else {
         goto fail_syntax;
     }
@@ -680,15 +685,17 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
     if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
         goto fail_syntax;
     }
-    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
+    if (buf[0] != '\0' && !inet_aton(buf, &host_addr.sin_addr)) {
         goto fail_syntax;
     }
 
-    if (qemu_strtoi(p, NULL, 10, &host_port)) {
+    if (qemu_strtoi(p, NULL, 10, &port)) {
         goto fail_syntax;
     }
+    host_addr.sin_port = htons(port);
 
-    err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
+    err = slirp_remove_hostxfwd(s->slirp, (struct sockaddr *) &host_addr,
+            sizeof(host_addr), flags);
 
     monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
                    err ? "not found" : "removed");
@@ -700,12 +707,22 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
 
 static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
 {
-    struct in_addr host_addr = { .s_addr = INADDR_ANY };
-    struct in_addr guest_addr = { .s_addr = 0 };
-    int host_port, guest_port;
+    struct sockaddr_in host_addr = {
+        .sin_family = AF_INET,
+        .sin_addr = {
+            .s_addr = INADDR_ANY,
+        },
+    };
+    struct sockaddr_in guest_addr = {
+        .sin_family = AF_INET,
+        .sin_addr = {
+            .s_addr = 0,
+        },
+    };
+    int flags = 0;
+    int port;
     const char *p;
     char buf[256];
-    int is_udp;
     char *end;
     const char *fail_reason = "Unknown reason";
 
@@ -715,9 +732,9 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
         goto fail_syntax;
     }
     if (!strcmp(buf, "tcp") || buf[0] == '\0') {
-        is_udp = 0;
+        /* Do nothing; already TCP. */
     } else if (!strcmp(buf, "udp")) {
-        is_udp = 1;
+        flags |= SLIRP_HOSTFWD_UDP;
     } else {
         fail_reason = "Bad protocol name";
         goto fail_syntax;
@@ -727,7 +744,7 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
         fail_reason = "Missing : separator";
         goto fail_syntax;
     }
-    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
+    if (buf[0] != '\0' && !inet_aton(buf, &host_addr.sin_addr)) {
         fail_reason = "Bad host address";
         goto fail_syntax;
     }
@@ -736,29 +753,32 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
         fail_reason = "Bad host port separator";
         goto fail_syntax;
     }
-    host_port = strtol(buf, &end, 0);
-    if (*end != '\0' || host_port < 0 || host_port > 65535) {
+    port = strtol(buf, &end, 0);
+    if (*end != '\0' || port < 0 || port > 65535) {
         fail_reason = "Bad host port";
         goto fail_syntax;
     }
+    host_addr.sin_port = htons(port);
 
     if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
         fail_reason = "Missing guest address";
         goto fail_syntax;
     }
-    if (buf[0] != '\0' && !inet_aton(buf, &guest_addr)) {
+    if (buf[0] != '\0' && !inet_aton(buf, &guest_addr.sin_addr)) {
         fail_reason = "Bad guest address";
         goto fail_syntax;
     }
 
-    guest_port = strtol(p, &end, 0);
-    if (*end != '\0' || guest_port < 1 || guest_port > 65535) {
+    port = strtol(p, &end, 0);
+    if (*end != '\0' || port < 1 || port > 65535) {
         fail_reason = "Bad guest port";
         goto fail_syntax;
     }
+    guest_addr.sin_port = htons(port);
 
-    if (slirp_add_hostfwd(s->slirp, is_udp, host_addr, host_port, guest_addr,
-                          guest_port) < 0) {
+    if (slirp_add_hostxfwd(s->slirp, (struct sockaddr *) &host_addr,
+                           sizeof(host_addr), (struct sockaddr *) &guest_addr,
+                           sizeof(guest_addr), flags) < 0) {
         error_setg(errp, "Could not set up host forwarding rule '%s'",
                    redir_str);
         return -1;
-- 
2.33.0


