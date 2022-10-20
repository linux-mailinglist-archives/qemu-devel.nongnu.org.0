Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F5D6066C6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:10:29 +0200 (CEST)
Received: from localhost ([::1]:49926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZ3D-00067X-Pd
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:09:49 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYlr-0007g9-Bl
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNB-0004eC-0Q
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:24 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:33401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYN8-0006yA-OJ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:20 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MgzWP-1pJV8S2xun-00hKYA; Thu, 20 Oct 2022 18:26:05 +0200
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
 Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH v13 02/17] net: remove the @errp argument of net_client_inits()
Date: Thu, 20 Oct 2022 18:25:43 +0200
Message-Id: <20221020162558.123284-3-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020162558.123284-1-lvivier@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GsfI6RvnqAPoi252FyIUNn4nrvKzSHVW4VDMFcxUD46p3AqP+wp
 zJdtbqQVG05EowWfwq5p9I9eoNapMEqATDWxMcozscQCpFn1Rsmoo1gtKI8XoigLHN5RwFR
 mkkpNztKH6r6VU+6zvQKdKy8wHbcEMkP3NQaaVomtzkSO0IV3jK1ledrMbaW9uDAO/ydejt
 SMdRUVMpznrx6MW73Bj1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NCp2iwlkHCc=:rTqAiebf3Pf0A86HNm+XJH
 +hq2T4y3M6/CZqjmc4jXek+0YrwTvugpNnm9DK0bptkMRx6HuFLMqbXpCAIq2JFk+263XF5Jl
 NB4377TJq4IShpgurbUkucidR8tsz43AxsHNFjtICEPYCBLrODQDUt+t1/UID4M//eJcaJRdI
 eP5eHTkwVMtW1zKVuhPM4YZ/spvlbDjqIMpMKwtqNAkoncBBcuKq+sopZ9T7r5Vz+vPHosgFE
 MSn4iQZt8J2BVLFA6YuYa1W3FbQAZeAoOfRJhuatP2gJHNWdYrmbpWAL2CD5XTF3cTly7OVWC
 xuDa1QPdH++5Ai27Di137h4LAN3eEcQ13u2z4/k1t5qik5+8E6P5rNCyH3aQXu8BTywt5kRpP
 HV3KzHJ9Q4YRNJ3i+JTY4CbMyuNk3d1k3ulzCPsiL+SjR4t4BfVlHKT606V95hQZNNoOPl0W3
 VaEpMJwqaTxb9U8AjWddw29DkfQA2Cp5oyY0WJHyh41m3zfq0TcGRoy0PtG2Dsuj53o3+hex8
 3kQh8dZPNLWgeOxmBHNr+wh0+yk1SXNdNumvyrai9H+xVwDqjnKeFuBmivCLlM7KPVGfIKjAb
 To1Eq4feT4rpwDr9ph+I7rA0SVNajGCkjZgkk7jsf6UkeZlng7JPatpoaEwmmIkf25BPqchtB
 4gjYGHdcu2BopNMTKuX4coG9tDO8z8aaEsmYuSjjpXBF0VOq6xXM5CCZdFyynIvbL9q1dNiZt
 yJmMbfov7kmu+g2girhCb6W+nMC9d5o/7CWZvhaM4P1M4D1whFhky5B6BBCamUcs5tw23vH4A
 YHbNR5d
Received-SPF: permerror client-ip=212.227.126.134;
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


