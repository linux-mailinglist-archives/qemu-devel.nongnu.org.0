Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79DC605BA5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 11:58:54 +0200 (CEST)
Received: from localhost ([::1]:57272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSK6-0001sw-3E
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:58:52 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olRqp-000424-9t
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfV-0002Rm-E9
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:16:49 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:56539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfS-0005Ho-OX
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:16:49 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N2m7Q-1pFObn05SG-0137ju; Thu, 20 Oct 2022 11:16:35 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paul Durrant <paul@xen.org>, Stefan Weil <sw@weilnetz.de>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v12 02/17] net: remove the @errp argument of net_client_inits()
Date: Thu, 20 Oct 2022 11:16:09 +0200
Message-Id: <20221020091624.48368-3-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020091624.48368-1-lvivier@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GcI+SCNvkXqQLfBRQLhwGtXM3muJ7p0E+3r6yO9gVQ4zkONOeJ5
 r1rQyZXlUOg8IvOZqlTK2WrBGx9rl2Q5ngt3dEtTLfspvpad4W8KLrX6Gb/CXXAv3T3OYgw
 0rmwD7ybGZSopSkeHbwY1jVRN+erL7U14XNuby8q7WWa3MFUYGfyYpz7yLOMEFRXi+lm5hV
 KEeOsNHiJafL1Tuxh+jbg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HAC/78TLA1A=:1olf2L/xfqbx0inlXtevxY
 e0xuehDV1mOPVSJAzg0nb7C2svioJ/o1T8xEQ7LTD3wZGn9KdUavzr1BLg4i488hjdSG2l/kA
 SITd2V8g7SbW4QZkHLedsmSP2HwP7ewcO5bpw+nEQEVFJEcnO64qo43+d9SeXh/7lF6USnGuY
 Ctsh+Pgcpp5kLJ6LeY227sd1obkkoX6TQa4p+lzgiTmVQ+EmEsFW/fuRzlZeb+sTja7lMNxAD
 q55ZqYWgLuYHI8HSWwAc0A+8KladR13D2nwn5QfQ53TqqZ5MUtefuaXHPPIGP8GqnFqNX2SNG
 ZtKYKGIu3OWMdxP/wr3jVGwLxmBadDXmvyxFSRxSZg+UwWLV6aRB5+LYV4r3rAeSr4jDkp9lm
 GIyrZPVbsQc9QWdrPCn+RPM3BFYhCFqwhj+xcS+trKEdUBZLTYVgIwqpN2cw5+8pjpQrDlIeC
 5+ag9hkUY2/JHHAngwxHDTjKUFGI/xZWIJc6uMmehEmPVIu8R/YZGZ7pgGeOojJLxU+ICxMQ1
 RRTQ+ivJQM77YDE/Gz48uMXkCPt3fsWjqnHpi7jmGx9DJzHH+iXyg1a5nr41k8F6iy6KXINdn
 EWnzHS1SOscKLN2l0iCc++/+W8rXF4fG7NkxkXDc7oayMTw1BsA0/5L9L5MzGl6HR7PVx13zS
 5/E+BjYVjC1VVGZDA5z4w7BUXqrNRmBnmU9n0d+GN3/wq6G36bqefHACV1gjIqwsuklGcHbvj
 QFJ7AUvZTOxSNGmyg2LjGZKMXdSBUJ5mpqR0dDb8Pny0IOvWk7wUcUETbC4n8RzdK4LdqVExV
 I5EwEj0
Received-SPF: permerror client-ip=212.227.126.187;
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


