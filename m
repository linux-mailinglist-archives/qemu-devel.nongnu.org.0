Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0B92C1B96
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 03:47:06 +0100 (CET)
Received: from localhost ([::1]:39594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khOMD-0001YU-UF
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 21:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khOJr-0008Hs-5n
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 21:44:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khOJp-000281-6n
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 21:44:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606185876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=Dj6qND8KUHYnGns/ra46a7m3rapbWc3KQkUtUfQE218=;
 b=C7pe7FYhzRhlqZi6+utZ1TbCzh7KSJQ3hQeekwDvsAvQ8ANWVG2WjWwixxYYlahO/o2/9g
 NUekGZZkWvndeEJxf1OJzoFslM2wEOxDNKOPSX4tYeCdwddvCwWFOg4HX+2UP/5py67Snl
 sJAYsrwCGp/OL+00S1TXin2CZo8/TMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-h2eeXb1_NhWsx0w0H5i0XA-1; Mon, 23 Nov 2020 21:44:32 -0500
X-MC-Unique: h2eeXb1_NhWsx0w0H5i0XA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32DA81007461;
 Tue, 24 Nov 2020 02:44:31 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-43.pek2.redhat.com
 [10.72.13.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 735F45D9CA;
 Tue, 24 Nov 2020 02:44:29 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 2/5] net: do not exit on "netdev_add help" monitor command
Date: Tue, 24 Nov 2020 10:44:20 +0800
Message-Id: <1606185863-25996-3-git-send-email-jasowang@redhat.com>
In-Reply-To: <1606185863-25996-1-git-send-email-jasowang@redhat.com>
References: <1606185863-25996-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

"netdev_add help" is causing QEMU to exit because the code that
invokes show_netdevs is shared between CLI and HMP processing.
Move the check to the callers so that exit(0) remains only
in the CLI flow.

"netdev_add help" is not fixed by this patch; that is left for
later work.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/net.h  |  1 +
 monitor/hmp-cmds.c |  6 +++++
 net/net.c          | 68 +++++++++++++++++++++++++++---------------------------
 3 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 897b2d7..778fc78 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -199,6 +199,7 @@ extern const char *host_net_devices[];
 
 /* from net.c */
 int net_client_parse(QemuOptsList *opts_list, const char *str);
+void show_netdevs(void);
 int net_init_clients(Error **errp);
 void net_check_clients(void);
 void net_cleanup(void);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index a6a6684..65d8ff4 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -24,6 +24,7 @@
 #include "qemu/option.h"
 #include "qemu/timer.h"
 #include "qemu/sockets.h"
+#include "qemu/help_option.h"
 #include "monitor/monitor-internal.h"
 #include "qapi/error.h"
 #include "qapi/clone-visitor.h"
@@ -1631,7 +1632,12 @@ void hmp_netdev_add(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
     QemuOpts *opts;
+    const char *type = qdict_get_try_str(qdict, "type");
 
+    if (type && is_help_option(type)) {
+        show_netdevs();
+        return;
+    }
     opts = qemu_opts_from_qdict(qemu_find_opts("netdev"), qdict, &err);
     if (err) {
         goto out;
diff --git a/net/net.c b/net/net.c
index 794c652..6362d30 100644
--- a/net/net.c
+++ b/net/net.c
@@ -44,6 +44,7 @@
 #include "qemu/config-file.h"
 #include "qemu/ctype.h"
 #include "qemu/iov.h"
+#include "qemu/qemu-print.h"
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
 #include "qapi/error.h"
@@ -1025,7 +1026,7 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
     return 0;
 }
 
-static void show_netdevs(void)
+void show_netdevs(void)
 {
     int idx;
     const char *available_netdevs[] = {
@@ -1055,9 +1056,9 @@ static void show_netdevs(void)
 #endif
     };
 
-    printf("Available netdev backend types:\n");
+    qemu_printf("Available netdev backend types:\n");
     for (idx = 0; idx < ARRAY_SIZE(available_netdevs); idx++) {
-        puts(available_netdevs[idx]);
+        qemu_printf("%s\n", available_netdevs[idx]);
     }
 }
 
@@ -1068,42 +1069,35 @@ static int net_client_init(QemuOpts *opts, bool is_netdev, Error **errp)
     int ret = -1;
     Visitor *v = opts_visitor_new(opts);
 
-    const char *type = qemu_opt_get(opts, "type");
-
-    if (is_netdev && type && is_help_option(type)) {
-        show_netdevs();
-        exit(0);
-    } else {
-        /* Parse convenience option format ip6-net=fec0::0[/64] */
-        const char *ip6_net = qemu_opt_get(opts, "ipv6-net");
+    /* Parse convenience option format ip6-net=fec0::0[/64] */
+    const char *ip6_net = qemu_opt_get(opts, "ipv6-net");
 
-        if (ip6_net) {
-            char *prefix_addr;
-            unsigned long prefix_len = 64; /* Default 64bit prefix length. */
+    if (ip6_net) {
+        char *prefix_addr;
+        unsigned long prefix_len = 64; /* Default 64bit prefix length. */
 
-            substrings = g_strsplit(ip6_net, "/", 2);
-            if (!substrings || !substrings[0]) {
-                error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "ipv6-net",
-                           "a valid IPv6 prefix");
-                goto out;
-            }
+        substrings = g_strsplit(ip6_net, "/", 2);
+        if (!substrings || !substrings[0]) {
+            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "ipv6-net",
+                       "a valid IPv6 prefix");
+            goto out;
+        }
 
-            prefix_addr = substrings[0];
+        prefix_addr = substrings[0];
 
-            /* Handle user-specified prefix length. */
-            if (substrings[1] &&
-                qemu_strtoul(substrings[1], NULL, 10, &prefix_len))
-            {
-                error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                           "ipv6-prefixlen", "a number");
-                goto out;
-            }
-
-            qemu_opt_set(opts, "ipv6-prefix", prefix_addr, &error_abort);
-            qemu_opt_set_number(opts, "ipv6-prefixlen", prefix_len,
-                                &error_abort);
-            qemu_opt_unset(opts, "ipv6-net");
+        /* Handle user-specified prefix length. */
+        if (substrings[1] &&
+            qemu_strtoul(substrings[1], NULL, 10, &prefix_len))
+        {
+            error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                       "ipv6-prefixlen", "a number");
+            goto out;
         }
+
+        qemu_opt_set(opts, "ipv6-prefix", prefix_addr, &error_abort);
+        qemu_opt_set_number(opts, "ipv6-prefixlen", prefix_len,
+                            &error_abort);
+        qemu_opt_unset(opts, "ipv6-net");
     }
 
     /* Create an ID for -net if the user did not specify one */
@@ -1421,6 +1415,12 @@ static int net_init_client(void *dummy, QemuOpts *opts, Error **errp)
 
 static int net_init_netdev(void *dummy, QemuOpts *opts, Error **errp)
 {
+    const char *type = qemu_opt_get(opts, "type");
+
+    if (type && is_help_option(type)) {
+        show_netdevs();
+        exit(0);
+    }
     return net_client_init(opts, true, errp);
 }
 
-- 
2.7.4


