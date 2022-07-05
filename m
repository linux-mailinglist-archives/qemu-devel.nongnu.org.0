Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9ED567658
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:24:12 +0200 (CEST)
Received: from localhost ([::1]:57710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nDX-0004pq-R1
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o8n8w-0007Xk-FX
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:19:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o8n8u-00013X-BH
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657045163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xm1FjZtjme8xAk5vk3LZdimcXR7rSNE7RA4/YN+6j0s=;
 b=UczDcjuR8lX2hvoIL2WHl7ArqFWUJYLute0PNtze35Q1+OHahtAxvyTi9s/j7My3uKTAwM
 h8iJGM2w6FtphGx3dMkL3yrrDfKHjPz/GX8FlLNOdlREE+KzDrAFJRryLkxdJtubo2MyER
 PvZLRJ4XlBYbQ7cuBXVrSxb4fDvF3T0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-mDruW-U6M66erD5WK2U1Sg-1; Tue, 05 Jul 2022 14:19:15 -0400
X-MC-Unique: mDruW-U6M66erD5WK2U1Sg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75A241C01B38
 for <qemu-devel@nongnu.org>; Tue,  5 Jul 2022 18:19:15 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 069C940CFD05;
 Tue,  5 Jul 2022 18:19:13 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v6 02/13] net: remove the @errp argument of net_client_inits()
Date: Tue,  5 Jul 2022 20:18:57 +0200
Message-Id: <20220705181908.1375601-3-lvivier@redhat.com>
In-Reply-To: <20220705181908.1375601-1-lvivier@redhat.com>
References: <20220705181908.1375601-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
index 3f264d4b0930..0142341e06e5 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1899,7 +1899,7 @@ static void qemu_create_late_backends(void)
         qtest_server_init(qtest_chrdev, qtest_log, &error_fatal);
     }
 
-    net_init_clients(&error_fatal);
+    net_init_clients();
 
     object_option_foreach_add(object_create_late);
 
-- 
2.36.1


