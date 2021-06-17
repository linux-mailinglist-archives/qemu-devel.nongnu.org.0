Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8953AB60F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 16:36:10 +0200 (CEST)
Received: from localhost ([::1]:43780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltt7p-0006rj-9m
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 10:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5Q-0004Aj-1j
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:40 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:46726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5N-0001M5-2S
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:39 -0400
Received: by mail-lf1-x136.google.com with SMTP id m21so10854743lfg.13
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RnZNig+HPYwjDLIZM8d7KTBP8pyS6/2dSByH2E+4cpE=;
 b=Wd48rUV/P9HHJTNKw1lBKQXExQN5p1XzlGq9AueG8iZ/OLqHVSjwbaVVWoHGF4e+KK
 g8qWrJZlSazm7qrpe74lruQkj6pLMG58hb6ZLgxnSaX5K1e6P9FSW6XZ/qQLPQm+u3ST
 lVHVjlL4ZkIB9KJmO5/MFPSBoFXLSbQGJRI4dtjmEp4fN8DioeVhK8Nh2CWXAr0Y4jJs
 uJBb5vKW5vZ7/ZbY3fzrcIOgcnySUymvwJHXmv1fwNwT3XkKk4FhZiSEhunh8o7GiFTJ
 9jiYyaN3Fui731GNu1H7WFDeOi3ozn7/tMNhlCTM8sgtdGZK+B6LuNMn0iu06zdVClpD
 hdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RnZNig+HPYwjDLIZM8d7KTBP8pyS6/2dSByH2E+4cpE=;
 b=LXAfyoze19TO2aVRUBmHGUtZaC8VOvhL2FYZpkdSh8O42UihyE17t8GUJ75kdrdMXh
 kQKJm2DUcy3gJcNHWQjyxXtt6MEMp/BkljiHvvLIn7Eo/gf2gIBPanAUJrn2tgZ66ChT
 PpL7HOpQjDE/yLKJzPP9XA0pKcE62pmWgFxCxmpYRx9bmPUlKNwtz4fRHfvbB7G8uENz
 t856ojl9EW8N5dhJ7U0lbRxAqKjV7kqSuURA1HVmt13IgN+r8XmABY4YP106Eflnn+Mr
 RqMo3gUOZRNv7MwY+oX/Mt20SByAfcqIhURQUXqykh66vgi2hoKzI5kSiG3f/DypFqac
 ftqA==
X-Gm-Message-State: AOAM533myAqJ8tpzUeNX4gznasA2/PKq9snvU32U4AXKKcFA0HfZcsHy
 fU81pXVCIVnSCk8Zv7zxtp0yEjmtEKLP1JhM
X-Google-Smtp-Source: ABdhPJwnK2YP1JtIccgY1ci8qnVgV+FMX40AQM/jbPefhy1EmqTPNSLxDzFH3HFFma32S8SQ/DAUYA==
X-Received: by 2002:a05:6512:239f:: with SMTP id
 c31mr4290334lfv.233.1623940415083; 
 Thu, 17 Jun 2021 07:33:35 -0700 (PDT)
Received: from localhost.localdomain ([5.18.249.207])
 by smtp.gmail.com with ESMTPSA id d9sm597406lfv.47.2021.06.17.07.33.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jun 2021 07:33:34 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] net/vmnet: add new netdevs to qapi/net
Date: Thu, 17 Jun 2021 17:32:41 +0300
Message-Id: <20210617143246.55336-3-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
References: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jasowang@redhat.com, r.bolshakov@yadro.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Created separate netdev per each vmnet operating mode
because they use quite different settings. Especially since
macOS 11.0 (vmnet.framework API gets lots of updates)

Three new netdevs are added:
- vmnet-host
- vmnet-shared
- vmnet-bridged

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 net/clients.h |  11 +++++-
 net/net.c     |  10 +++--
 net/vmnet.c   |  14 ++++++-
 qapi/net.json | 100 ++++++++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 126 insertions(+), 9 deletions(-)

diff --git a/net/clients.h b/net/clients.h
index ac19843aab..c9157789f2 100644
--- a/net/clients.h
+++ b/net/clients.h
@@ -64,7 +64,14 @@ int net_init_vhost_user(const Netdev *netdev, const char *name,
 int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp);
 #ifdef CONFIG_VMNET
-int net_init_vmnet(const Netdev *netdev, const char *name,
+int net_init_vmnet_host(const Netdev *netdev, const char *name,
                           NetClientState *peer, Error **errp);
-#endif
+
+int net_init_vmnet_shared(const Netdev *netdev, const char *name,
+                          NetClientState *peer, Error **errp);
+
+int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
+                          NetClientState *peer, Error **errp);
+#endif /* CONFIG_VMNET */
+
 #endif /* QEMU_NET_CLIENTS_H */
diff --git a/net/net.c b/net/net.c
index 645c52ef6e..87a6f96665 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1002,8 +1002,10 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
         [NET_CLIENT_DRIVER_L2TPV3]    = net_init_l2tpv3,
 #endif
 #ifdef CONFIG_VMNET
-        [NET_CLIENT_DRIVER_VMNET] = net_init_vmnet,
-#endif
+        [NET_CLIENT_DRIVER_VMNET_HOST] = net_init_vmnet_host,
+        [NET_CLIENT_DRIVER_VMNET_SHARED] = net_init_vmnet_shared,
+        [NET_CLIENT_DRIVER_VMNET_BRIDGED] = net_init_vmnet_bridged,
+#endif /* CONFIG_VMNET */
 };
 
 
@@ -1091,7 +1093,9 @@ void show_netdevs(void)
         "vhost-vdpa",
 #endif
 #ifdef CONFIG_VMNET
-        "vmnet",
+        "vmnet-host",
+        "vmnet-shared",
+        "vmnet-bridged",
 #endif
     };
 
diff --git a/net/vmnet.c b/net/vmnet.c
index f8b64e2a27..3f25afd7e8 100644
--- a/net/vmnet.c
+++ b/net/vmnet.c
@@ -15,7 +15,19 @@
 
 #include <vmnet/vmnet.h>
 
-int net_init_vmnet(const Netdev *netdev, const char *name,
+int net_init_vmnet_host(const Netdev *netdev, const char *name,
+                    NetClientState *peer, Error **errp) {
+  error_setg(errp, "vmnet is not implemented yet");
+  return -1;
+}
+
+int net_init_vmnet_shared(const Netdev *netdev, const char *name,
+                    NetClientState *peer, Error **errp) {
+  error_setg(errp, "vmnet is not implemented yet");
+  return -1;
+}
+
+int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
                     NetClientState *peer, Error **errp) {
   error_setg(errp, "vmnet is not implemented yet");
   return -1;
diff --git a/qapi/net.json b/qapi/net.json
index c5de234e2c..a548d7a7f4 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -452,6 +452,89 @@
     '*vhostdev':     'str',
     '*queues':       'int' } }
 
+##
+# @NetdevVmnetHostOptions:
+#
+# vmnet (host mode) network backend.
+#
+# Allows the vmnet interface to communicate with
+# other vmnet interfaces that are in host mode and also with the native host.
+#
+# @dhcpstart: The starting IPv4 address to use for the interface. Must be in the
+#             private IP range (RFC 1918). Must be specified along
+#             with @dhcpend and @subnetmask.
+#             This address is used as the gateway address. The subsequent address
+#             up to and including dhcpend are  placed in the DHCP pool.
+#
+# @dhcpend: The DHCP IPv4 range end address to use for the interface. Must be in
+#           the private IP range (RFC 1918). Must be specified along
+#           with @dhcpstart and @subnetmask.
+#
+# @subnetmask: The IPv4 subnet mask to use on the interface. Must be specified
+#              along with @dhcpstart and @subnetmask.
+#
+#
+# Since: 6.1,
+##
+{ 'struct': 'NetdevVmnetHostOptions',
+  'data': {
+    '*dhcpstart':   'str',
+    '*dhcpend':     'str',
+    '*subnetmask':  'str'
+  },
+  'if': 'defined(CONFIG_VMNET)' }
+
+##
+# @NetdevVmnetSharedOptions:
+#
+# vmnet (shared mode) network backend.
+#
+# Allows traffic originating from the vmnet interface to reach the
+# Internet through a network address translator (NAT). The vmnet interface
+# can also communicate with the native host. By default, the vmnet interface
+# is able to communicate with other shared mode interfaces. If a subnet range
+# is specified, the vmnet interface can communicate with other shared mode
+# interfaces on the same subnet.
+#
+# @dhcpstart: The starting IPv4 address to use for the interface. Must be in the
+#             private IP range (RFC 1918). Must be specified along
+#             with @dhcpend and @subnetmask.
+#             This address is used as the gateway address. The subsequent address
+#             up to and including dhcpend are  placed in the DHCP pool.
+#
+# @dhcpend: The DHCP IPv4 range end address to use for the interface. Must be in
+#           the private IP range (RFC 1918). Must be specified along
+#           with @dhcpstart and @subnetmask.
+#
+# @subnetmask: The IPv4 subnet mask to use on the interface. Must be specified
+#              along with @dhcpstart and @subnetmask.
+#
+#
+# Since: 6.1,
+##
+{ 'struct': 'NetdevVmnetSharedOptions',
+  'data': {
+    '*dhcpstart':    'str',
+    '*dhcpend':      'str',
+    '*subnetmask':   'str'
+  },
+  'if': 'defined(CONFIG_VMNET)' }
+
+##
+# @NetdevVmnetBridgedOptions:
+#
+# vmnet (bridged mode) network backend.
+#
+# Bridges the vmnet interface with a physical network interface.
+#
+# @ifname: The name of the physical interface to be bridged.
+#
+# Since: 6.1
+##
+{ 'struct': 'NetdevVmnetBridgedOptions',
+  'data': { 'ifname': 'str' },
+  'if': 'defined(CONFIG_VMNET)' }
+
 ##
 # @NetClientDriver:
 #
@@ -460,11 +543,16 @@
 # Since: 2.7
 #
 #        @vhost-vdpa since 5.1
-#        @vmnet since 6.1
+#        @vmnet-host since 6.1
+#        @vmnet-shared since 6.1
+#        @vmnet-bridged since 6.1
 ##
 { 'enum': 'NetClientDriver',
   'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
-            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa', 'vmnet' ] }
+            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
+            { 'name': 'vmnet-host', 'if': 'defined(CONFIG_VMNET)' },
+            { 'name': 'vmnet-shared', 'if': 'defined(CONFIG_VMNET)' },
+            { 'name': 'vmnet-bridged', 'if': 'defined(CONFIG_VMNET)' }] }
 
 ##
 # @Netdev:
@@ -478,6 +566,9 @@
 # Since: 1.2
 #
 #        'l2tpv3' - since 2.1
+#        'vmnet-host' - since 6.1
+#        'vmnet-shared' - since 6.1
+#        'vmnet-bridged' - since 6.1
 ##
 { 'union': 'Netdev',
   'base': { 'id': 'str', 'type': 'NetClientDriver' },
@@ -493,7 +584,10 @@
     'hubport':  'NetdevHubPortOptions',
     'netmap':   'NetdevNetmapOptions',
     'vhost-user': 'NetdevVhostUserOptions',
-    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
+    'vhost-vdpa': 'NetdevVhostVDPAOptions',
+    'vmnet-host': 'NetdevVmnetHostOptions',
+    'vmnet-shared': 'NetdevVmnetSharedOptions',
+    'vmnet-bridged': 'NetdevVmnetBridgedOptions' } }
 
 ##
 # @RxState:
-- 
2.23.0


