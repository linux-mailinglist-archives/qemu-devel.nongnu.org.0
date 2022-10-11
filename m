Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3AD5FBBE3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:11:47 +0200 (CEST)
Received: from localhost ([::1]:54004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiLbO-0003YJ-Du
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLVs-0006P2-MJ
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:07 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:39477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLVq-0003k2-RA
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:04 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MAwoL-1ot65S1nlB-00BN1x; Tue, 11 Oct 2022 22:05:47 +0200
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
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org
Subject: [PATCH v11 02/17] net: remove the @errp argument of net_client_inits()
Date: Tue, 11 Oct 2022 22:05:24 +0200
Message-Id: <20221011200539.1486809-3-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011200539.1486809-1-lvivier@redhat.com>
References: <20221011200539.1486809-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oGEBk+kOtZqR+pDtNXAb1wihBVS+zvLLwV9nHiBb/Vn9T82eAsh
 LINI2qKGCfVw+EfpiB7OZsISLobzstbA+38KHNTbHbJgfC6MvWXPmhZ7219Qg0COGXO86TQ
 hE+MqoQLFDPn3/+LcUAq2qvMZ5/ttWbdkGjmOU8wg9H0ZPstU1XLoosnE6elRaLIsO094Wj
 C+lvOUPNJLM5S7TJdO69A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5DVblCvFshk=:7yIAdecSFiVuIgVKYNPA1a
 WRgwAPtFkLmTM4oGZtX/JM/AaIndu/QH5NpQnWsT5g2c44qY3klDkgNhRK+v6V5kJRFMQAQnx
 enuT98/PX2VGMNZ3bsdmDzOEKBxWdReqHo6iQD7ii7j2bwD2ipw+kzDBxO+o/DFLtkt/6SLz1
 R5JH9i9cdghjPCe7eNm/GO24z4NoeahEuugcqyb8IWWm3ZQOrHdIDph0cTFRjG9yqs9aer4/h
 mYKzS6ObaMLeR7HqYk4slXxqrg5qDR3A3bT5i4S3aKf1a5QwaRFA6w2oUQYCWgzribiOz/lK3
 faJ/kYu/aZ4E+20k9aCdaBHYVLnWZ3UhHoHo68cVsB7AEixxHnKwFAfRV/P0YXYOdzbWC+Inh
 lmGXqa6QtOUchQH1NXqqbG2N92ygu7ToYzPypKR3N5YdLmratEith5SEgx/NqaJY8S+dLrfKt
 pAAU+yV8utccsFyl7k/mIGbTe+nZwMSbmDW+DYRvbMa5iXTyCJSSd/QmBoPup+9qqvtuPqUq6
 adi2oF5V04ClxguiyKRlUzaEyWEr9to/Bs32Ayb6NQsYidT8VgwMfqhZYCS/YP5gPbOlnOZUW
 scYQP57lXVHEHpuogBtn4Ywxm0tuK1I7P9e6pEZh2/5r9mtD/2XH8im6k7qCgVjkAnoB3K9NB
 BOJdLRU3A8yjHfZrJsDvTHRxVndX6ulEk5dniCqgg4I+ahsrHcCcuFhbXEARzXVI71n3hXM9p
 /vzLZjO/ynFWaNVwjNR5U4wqlc21pzcxWJKh1qHdrnkZCVhE6SJO4vs7IqeUx218I01/JuOOU
 olo6Huz
Received-SPF: permerror client-ip=212.227.126.130;
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

The only caller passes &error_fatal, so use this directly in the function.

It's what we do for -blockdev, -device, and -object.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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
index b464da25bcde..a4ae131e4d61 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1904,7 +1904,7 @@ static void qemu_create_late_backends(void)
         qtest_server_init(qtest_chrdev, qtest_log, &error_fatal);
     }
 
-    net_init_clients(&error_fatal);
+    net_init_clients();
 
     object_option_foreach_add(object_create_late);
 
-- 
2.37.3


