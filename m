Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391395EB1B9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 21:58:09 +0200 (CEST)
Received: from localhost ([::1]:55838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocuEx-0005h2-NF
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 15:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8E-0008L4-6K
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:11 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:60221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu87-0005vm-3Y
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:07 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MW9zm-1oj5552X8M-00XfYr; Mon, 26 Sep 2022 21:50:53 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v9 02/16] net: remove the @errp argument of net_client_inits()
Date: Mon, 26 Sep 2022 21:50:34 +0200
Message-Id: <20220926195048.487915-3-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926195048.487915-1-lvivier@redhat.com>
References: <20220926195048.487915-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:L5HH/5//5YPblixyLILw3nONIUtuN+gzL7+oqa6rg/dQiDPqlxM
 vLdeTTVlTqxKp4wt94JallzWsPaJWLfKmwALIqsyax0nwP82aSdAA2v4ruDLtNTpllHRWUw
 NqG0yeIdERg7uFdvXLFgxMvtmJvbIFEzft8U7s803SOnOz1uSXs2wg5hfZkDY//RKay4q+L
 Q/MdDUKKdcQ1/0qmD8yRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xd5ZWdTZ+wE=:pBrSuDHcfZPXfBn2F8Hvyb
 HHShfXSbKg4ulXvQg1mzfO/Incbe/TYPvkZG3JEIbEocuLz1kqzPaY7dkum8ZuUCz5Kwkd8en
 s1rUzCp314ARiBpzlQ+V67a7ajJhaXIy6jXEStas8WqwkUrdeuj7y91eqbXZT8eiBuwo+LMPY
 vd0C9lKpPeyY7T9TnvYb5HJmyuMDgnHxxldcQ1952mDxyardGclUMe9EonySVNmW/yKMUMJf2
 Ui5p6wvrOMworWZkEaigbsn4pauwREp91ppvY7ujdfTpTAs+WMtDFOMYPdwM+642DoWAa2rgt
 t8/Kvmze/Uk2qGysbJj44g53TKYe3CpiJOy8dRzqm6numDmcFgKC0TNqX+6qcK9BZ6GXiGuBt
 wpDhreWcxm3lPAU6zmOj5Ob/mfGoFb4m2i8Y3qxz5fomXQxKaEL1ylT+4+XABeNLTXyYWedsJ
 CUahVrLD+KsIi6qtkzHbibGGaVCDSfopXNTmX+Ht4kIa0u/HDz7GNS7n/RkDmH7ClQpmnrkF3
 U4niBg0IGFEFhHVyvWzHFm8TBnAwn7y2mTa6pLzMbaswP/kpcBFvZ2joZrvqbjU5/GU8fTRv7
 c8VR7j0QHTwz1g16LnpoTj6+1c8jsSA98fmFaP/1vN4ZKaAeGXQJJnhvJaW5LPMlTZf+mhPNG
 /Ae6F6W+RDffUpaaQF60SgE8oPG/hQY57RL/tcKG94u1OJCHR56LAV/e0tzDxt4URJczypZmg
 obBDGmQHKHwt2rcbKjgEho4U5rslChuzgDTbd3eR1MPXGYa2SijYkiusWKPz1Mt/jGDUXcPJo
 6+D3PBH
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
index e62b9cc35d75..b172134a62cb 100644
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


