Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F32E5B68A3
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:26:56 +0200 (CEST)
Received: from localhost ([::1]:33794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY0Jr-0006ng-HQ
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzg4-0000g5-BS
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:52 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:48917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzft-0004Dc-Br
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:44 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MsrV2-1pRCdr0KYy-00tE1O; Tue, 13 Sep 2022 08:40:07 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gregory Kurz <gregory.kurz@free.fr>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v8 02/14] net: remove the @errp argument of net_client_inits()
Date: Tue, 13 Sep 2022 08:39:48 +0200
Message-Id: <20220913064000.79353-3-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913064000.79353-1-lvivier@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ysPGVZCGBMRbSs6boDDn9nfIapJGr6oCRuSD7zVeN+Fm+U0+52i
 JWFyIeOmcpyUP5GBnk7kCW8DrenfWUNagI0JvtLHyneRIBUe4inD3uQKEau53RtKcl1fqpO
 8rVAGzyZC62v6i2gOEFCp3cJ5MhHVaGMekKC7XZKdVH1sQCGf8h/xmIVLDEYRbARDJ1sqVX
 UILiw9hSOsBCW8/DxLEUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3TfG2zi6IZw=:/TR+tqvYlnk6vpK7zZLbR5
 TXNDEMT2sWZYAHruFRLlb7PfVtPmU2cr+Uh3jCcwg6PSrbfgh61Ba2ts9QbSQ3yHG4W9GUSWe
 3mD2KgDT7KLVvIeGmCEW7K+CYQ8s83/MlL1+A/uqaeBuk0T/KnUf7SvlsMvD1rO3daWmyQ/fe
 3s9aHqiJljVuiyMaGttfUcHHASCfaqznVWOsOdk3nW96fptkwEbyfYnMKjLQoNjLWPQp32t+b
 4i5ywx9xSxKtQtAoqB33y1jXppHW+t6DdBuENbNUBMN4UrqlgJfDYpbJZukTpvHKfdlmES8Wa
 9fmQBpqIPCjC2ZUuqekUod/J6NVe0MSgetq+famcjlRmbtiE47HoGUrflmkg7ekm3m57NpkLX
 u3ipBjKlQAO60sSYg8EJbj3ym8PYq9W4pX//P7E8Th9B6/n+awB42HsMgORYUVJOvSj/Dr5e1
 Jp4PsCRWqsCUjIAsFc0kbkTeaugsdmsqwFkSHfLua/wiw10SIcME3LmgwSXKa2vxdXx0QG9zh
 C/bnrFhBbFA4F8ssosdkrnql4iZqaaYHomGd/bLOwbSRQS3IlLeIlvo5n2XpJ+e7fn0UVMYbu
 buW+WHtN2GLkDMaxwy3+yhvfdDsUIJvwWzfhpAXOGCuKjwwJi5xfF8BRNkTtxDSfBSloMAlJe
 dVj17Ir28axpQpSYYcm1jC6ZdX90FYg4tPYO/IM7RuCIAic/I4/g7/ZV+8vAtyk4I6ay6CyUY
 iGBg4Tz2U5RFGY1RYw8H2McefdkSGMgyO/d89b08c3nq6vnIw/zGck8BS80btVBVta0T7+TLE
 mcIWSIZ
Received-SPF: permerror client-ip=212.227.126.130;
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
index 81d0b21defce..c1c34a58f849 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -222,7 +222,7 @@ extern const char *host_net_devices[];
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
index dea4005e4791..1fe8b5c5a120 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1906,7 +1906,7 @@ static void qemu_create_late_backends(void)
         qtest_server_init(qtest_chrdev, qtest_log, &error_fatal);
     }
 
-    net_init_clients(&error_fatal);
+    net_init_clients();
 
     object_option_foreach_add(object_create_late);
 
-- 
2.37.3


