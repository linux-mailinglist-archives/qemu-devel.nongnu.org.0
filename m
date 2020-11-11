Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62DE2AEF01
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 11:53:55 +0100 (CET)
Received: from localhost ([::1]:43010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcnlD-000653-1f
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 05:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcnjq-0005Jk-5a
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 05:52:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcnjo-0004pe-Bd
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 05:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605091946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/uGSmxSqMrTtpOfE0DFExH9rUxwfDNtBKQEHx+pzDV4=;
 b=DiZ356TVDzIHZRLAOJCVwxnG2vH4g5eR9FPl1gVXCDViZbAzHY3oEIgchT/WbxfsAKllvl
 y87OhC6UaqaVXtxH/zfDAm9Kn+1oUXI150efARkyZjSUKDcSn/uGfmuRhg8KHSYWZGs5DA
 89EyQbndKLkSAdI1SshgJuqND8OyR7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-7Je9wnAcOHyphVCHkfKRSA-1; Wed, 11 Nov 2020 05:52:24 -0500
X-MC-Unique: 7Je9wnAcOHyphVCHkfKRSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79DC71016CE0
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 10:52:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C0266EF4A;
 Wed, 11 Nov 2020 10:52:23 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] net: do not exit on "netdev_add help" monitor command
Date: Wed, 11 Nov 2020 05:52:22 -0500
Message-Id: <20201111105222.1179861-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jasowang@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"netdev_add help" is causing QEMU to exit because the code that
invokes show_netdevs is shared between CLI and HMP processing.
Move the check to the callers so that exit(0) remains only
in the CLI flow.

"netdev_add help" is not fixed by this patch; that is left for
later work.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/net/net.h  |  1 +
 monitor/hmp-cmds.c |  6 ++++
 net/net.c          | 68 +++++++++++++++++++++++-----------------------
 3 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 897b2d7595..778fc787ca 100644
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
index a6a6684df1..65d8ff4849 100644
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
index 794c652282..6362d3077c 100644
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
2.26.2


