Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638CE57E6EB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 20:59:39 +0200 (CEST)
Received: from localhost ([::1]:38678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oExsA-0006hK-Bx
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 14:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExpt-0002VP-J2
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 14:57:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExpp-0008AL-F0
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 14:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658516230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUyRiT2VjEP7jMl2VMKLsOkl0nRLdH8dZVm9pIank9w=;
 b=JXh2nD2Ztvs9qU5UzvSn7+xY64U52YIxJRCw/tTEOXkY8R6kBZq8PI0syTJ2ltmYX68ALN
 CNBQ1xqU+Il09ASLOfwkDpP98LdzmzTMcPuYlIsCKw2JXLz5dUddK/Y0m4vCSvB/GWWUsv
 9ZhtGr+ZVljC1BaDfPFztxep8qWaXxI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-v34l8fFPN_aXAiXKGneYSg-1; Fri, 22 Jul 2022 14:57:08 -0400
X-MC-Unique: v34l8fFPN_aXAiXKGneYSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 866793C0E21C
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 18:57:08 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8B0F2026D64;
 Fri, 22 Jul 2022 18:57:06 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v6 02/14] net: remove the @errp argument of net_client_inits()
Date: Fri, 22 Jul 2022 20:56:49 +0200
Message-Id: <20220722185701.300449-3-lvivier@redhat.com>
In-Reply-To: <20220722185701.300449-1-lvivier@redhat.com>
References: <20220722185701.300449-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The only caller passes &error_fatal, so use this directly in the function.

It's what we do for -blockdev, -device, and -object.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 include/net/net.h |  2 +-
 net/net.c         | 20 +++++++-------------
 softmmu/vl.c      |  2 +-
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 523136c7acba..c53c64ac18c4 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -216,7 +216,7 @@ extern const char *host_net_devices[];
 /* from net.c */
 int net_client_parse(QemuOptsList *opts_list, const char *str);
 void show_netdevs(void);
-int net_init_clients(Error **errp);
+void net_init_clients(void);
 void net_check_clients(void);
 void net_cleanup(void);
 void hmp_host_net_add(Monitor *mon, const QDict *qdict);
diff --git a/net/net.c b/net/net.c
index d2288bd3a929..15958f881776 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1562,27 +1562,21 @@ out:
     return ret;
 }
 
-int net_init_clients(Error **errp)
+void net_init_clients(void)
 {
     net_change_state_entry =
         qemu_add_vm_change_state_handler(net_vm_change_state_handler, NULL);
 
     QTAILQ_INIT(&net_clients);
 
-    if (qemu_opts_foreach(qemu_find_opts("netdev"),
-                          net_init_netdev, NULL, errp)) {
-        return -1;
-    }
-
-    if (qemu_opts_foreach(qemu_find_opts("nic"), net_param_nic, NULL, errp)) {
-        return -1;
-    }
+    qemu_opts_foreach(qemu_find_opts("netdev"), net_init_netdev, NULL,
+                      &error_fatal);
 
-    if (qemu_opts_foreach(qemu_find_opts("net"), net_init_client, NULL, errp)) {
-        return -1;
-    }
+    qemu_opts_foreach(qemu_find_opts("nic"), net_param_nic, NULL,
+                      &error_fatal);
 
-    return 0;
+    qemu_opts_foreach(qemu_find_opts("net"), net_init_client, NULL,
+                      &error_fatal);
 }
 
 int net_client_parse(QemuOptsList *opts_list, const char *optarg)
diff --git a/softmmu/vl.c b/softmmu/vl.c
index aabd82e09a20..8f3f3bb74389 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1904,7 +1904,7 @@ static void qemu_create_late_backends(void)
         qtest_server_init(qtest_chrdev, qtest_log, &error_fatal);
     }
 
-    net_init_clients(&error_fatal);
+    net_init_clients();
 
     object_option_foreach_add(object_create_late);
 
-- 
2.37.1


