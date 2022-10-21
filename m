Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BDA607436
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:38:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloTY-0001nR-PS
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:38:00 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo2X-0003if-3T
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2D-0003GV-Eu
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:09:46 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2A-0001QS-DP
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:09:45 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M2wXK-1op7Po2PFM-003KhQ; Fri, 21 Oct 2022 11:09:28 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v14 02/17] net: remove the @errp argument of net_client_inits()
Date: Fri, 21 Oct 2022 11:09:07 +0200
Message-Id: <20221021090922.170074-3-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021090922.170074-1-lvivier@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tXshrKVL+pGTR64qZzdDP2mgssWy1XD4N5JLIlGU4LQUuEupVwC
 6Hv53zCa79ErbrYWRyuwZ6Zb3npWe+TZCCzKsbFf2vHGaKHBcjZ07zaJiqvhrjyiG2LsWYo
 MvvItkTUGQ78LwP3Oe67eQXJa7mVHIu9kaVzfwTZYpQ4YtxRzjafpO6EQx21pWtj+Zb4MYU
 OVKCUTKs1om02e5AF0c0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yh17WmPlzdo=:ZrtEojMwzm5gUGxZ5oS2y1
 dS6Q/ZaN1X7zaqbjNcFyzDoCJ06/DQp0jG60URfoXiMJzbCLSbtCzxrY2c49MvYsu9v48ZiNy
 hv5IKcr2fjF0cue9raRghSRmBgugbLDe4qkIn7gyApUZwqBX/ZHU6PvBoCGowiwGgBMQz8UP5
 PT1YEvho0ej11ikypGW+48BcWjYantXzw703V3+QzpHV5YFBpte5Pf1AQtXxs2hVhmCHhTjTE
 3YZzphZ5TRFaYC4fxNE5hPjgqaEWU/g4OpwnLglck57PuKQZfsIQ081ITf75RExgPh1LuhjeA
 Jyfo3fpXuJX1zlb1JPLnlJRK6RrlWPVB3h0oMV0Q5X6IAKgsaZmmbQ0TY4DCVrZEsmKozqjy1
 xGvYxYfbr93VPPZ9vEXHV8cJKIj7fXkLm0ziBy89gXdz261jM71hYhDTCXPJ6ykHXO+zJR2w3
 PiAZ5gQc4/935X/+Dd96WuFkZnQ5vp5AulzKXzeV+aBDUrToYFtgLncS8eHcSijOHinpHfX0I
 9DBE5bv/8RbRq/dJzmfyD5FoQsCCKD8cUI6qFzl5IfBzMpq2YnnogOvfQIxFlTUZ+FNXUixxI
 41cG1egq0DMmv/1zZxuiij36Wa7XmHj715GfgIu2bL/SAEGH6MSxEz+80vVEkw9zBAf6lQ0ei
 DDGyT558YAVOnSt/sJNC528iBkq3rvJqiv7HJIUmso5UYN7POHBoNSpHrsW77ELz8NW+ocruE
 owzJNfsELDBFFctnXKInCJJnXvZ3D30Y5BaOcgl157Eoy3pswvRQP/h/JZcZG4l3+fBlX7SGq
 Zm8q12M
Received-SPF: permerror client-ip=212.227.17.13;
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


