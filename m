Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3725F5848
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 18:32:21 +0200 (CEST)
Received: from localhost ([::1]:38542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og7Jk-0008TL-U5
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 12:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og78y-0007Ep-4c
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:12 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:57033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og78u-0002nL-4u
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:11 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MTRIg-1oldQL3Fwy-00ThPq; Wed, 05 Oct 2022 18:20:58 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v10 02/17] net: remove the @errp argument of net_client_inits()
Date: Wed,  5 Oct 2022 18:20:36 +0200
Message-Id: <20221005162051.1120041-3-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005162051.1120041-1-lvivier@redhat.com>
References: <20221005162051.1120041-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OdenA11DsdouddbXZwvud80GTiH/Zx+EhrHZvYrM4QFqqJP/giS
 bxpKLTonGAkHCUCNo3WbSjtiqxWL0XKNSN139Hz0DbsAN88vl9PBftxndyMrea1HTRUVPk+
 J76gMOlyqOzj3Va5d7a20BcKBHg7NxazstzZdTNtY+OH/7nSG3NzdEwXKkiDcWmH1pe4sPM
 vlzS2WhlsIYaXvQBuUeuQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sQ66LQuHyCE=:J7GZ9o1dPj4TlFgRjYLkb3
 iC3D6krggT82/r6jSghN92Xy0+cb/kI0/+xqR7OestBw2Q/mcCCa3vJXeLZF9ORh4wE9bGNNi
 aNDtpYX9I5cwEODOUhPL4xPTrms3BmU7uhUq2vmZyTKE7nMxOLufT5vo0/JLw06rGwQM0a381
 dMV6RHWzZ6P3d6bMwqO0RSSoE+OShgUmUqAu4e0fD6BR2HHjhBPcyP/viosL95G0vmFHwh0Bx
 VKMswrjNfE44GmbjjD+Unt4ATV2DS9gvJSR7aoOWALgKS0s1wqUvmoyJFbJJswiGJ2Dm20DXB
 4DKixefDJJ3qpEb+VLaWDLZRupEMGyWHNZkeY9QCLiOAdSqOQ4gY1r9Wit/qplwdEcSAsi7b+
 nQjP9/KrxMXJAjEtQhmxiTOUQ1KsoSD7L2PXpm5d/rFzpmuJzerRjPVSmgfhjqcfOHc1hmhWe
 /lslbx12KGE8iZnIgcQzYBVeW5NPNDT54uXXHSILZDacl2527IE6NKqUtAuY7WwQfLQg0wF0p
 c17TrGeT1hfXD3yPUZfKgXlZ4ZIp2RiqsaHplkCMtrHf2BEfKdcnZFeLBiPA/m8G4UJOu/Dgb
 0E1q6J+PEKZWZ1dG2fqO8DCI3WxlsOc7r6AyFMzunK0XDAiWgNS+SMlBIc11AB37XccXOWB74
 495bVOFjeOG2SgYUPdB4UF3ap4oA4PzUGNeQfUT5QgARTgSlsGutlybYrZOVn27mM6cn5bZXQ
 w5LSlPgKWdsNRHuLVZ0/fBRGNBMer3ptu75lBqnTfi93hT2NrWXePQis+x8Kqj6NhvEcIF9+b
 dIYtyiY
Received-SPF: permerror client-ip=212.227.17.24;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_FAIL=0.001, SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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
index 9abadcc15051..351eab4cd5f1 100644
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


