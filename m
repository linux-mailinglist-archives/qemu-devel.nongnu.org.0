Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0367B44E3B4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 10:18:01 +0100 (CET)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlSh6-0005RM-3K
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 04:18:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mlSe2-0001z1-0T
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:14:50 -0500
Received: from [2a00:1450:4864:20::129] (port=39451
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mlSdz-0000pX-MK
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:14:49 -0500
Received: by mail-lf1-x129.google.com with SMTP id f18so20781056lfv.6
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 01:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yXldErOT0CqmaZDauAKyCejL9ob32Awf5qissE87w+s=;
 b=QPWhs9uCk0vGWvz/pTbBS2aNneld+2HcUain6ArsSImG/kuvAwdsBETILa/QwuAml/
 dgJiL/kvltACQlSnlyy/5gq/fYaefUjvvIaH0J4DwP5jF/6oy5TSytnxN1Yda3R8WiDo
 83Au6lrMEVV9b8tnoGuxs7W48dubmOCfsgXG1J6J0A9iC//kDBwO4LXueAmjcNA5i2Wq
 lJev+sjs9q+QtiNrPDIZDx3DATsRncr1daOdjErMFuakyyChUKVnvHxlZ27hgynNNG3r
 fZlOqn8UHj1/fiqsc+sV0+1bBZc7wHwUP6J418pmHOM7jbpkLVYZ9VZ4COnAJhlD7AYb
 yY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yXldErOT0CqmaZDauAKyCejL9ob32Awf5qissE87w+s=;
 b=0Z5tliP9+Zs7AKIxtymNd/rciR+mv0T0nWB71ntTk7w8CU/xjlhI9lqUMfMjawGjor
 XGMceE17dTTZDtvJPr3xyMtIbXQWO4pQTGXB62fa0cZ5ekgwxvvWZPhwae2kwx9+YQBs
 KXA8zuH9CJ1mBUuk/nnYQUXFNwgXExsDqOzvCmsGCxwDXOeyNiCz3lxz2Hod6Qo03SXz
 42tTYgjI9imePGgMklQGpOo/WRmeXikdZa6uoGpB9hErLsrtqDN9ntYoTe7yKN1j/PID
 kkds7jJbtqw65rqvT0brNdkCtbxr11DbBDz3orscQABlziYgpKy7oEC+mAq3XvMsFX9f
 ctjg==
X-Gm-Message-State: AOAM532GV8hj++qN9nvhxg4OtMWstqInUUW4WoVJWX+ezOvHJVEF+RnN
 h6t5hgNOez7M4wsI5gVw9x5zZrJSthldRA==
X-Google-Smtp-Source: ABdhPJwObeg+nvdShp9FdJNEXcFCI3w81T5cHi8WRTrsN6djF5j0W9b5aMOgZ0hTZ7LSfFQQ8HNCgA==
X-Received: by 2002:a05:6512:32c8:: with SMTP id
 f8mr12516803lfg.669.1636708485886; 
 Fri, 12 Nov 2021 01:14:45 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2d:d7c7:95ac:c963:ac2e:68f])
 by smtp.gmail.com with ESMTPSA id j11sm570134ljc.9.2021.11.12.01.14.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Nov 2021 01:14:45 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/6] net/vmnet: add vmnet backends to qapi/net
Date: Fri, 12 Nov 2021 12:14:10 +0300
Message-Id: <20211112091414.34223-3-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
References: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::129
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create separate netdevs for each vmnet operating mode:
- vmnet-host
- vmnet-shared
- vmnet-bridged

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 net/clients.h       |  11 ++++
 net/meson.build     |   7 +++
 net/net.c           |  10 ++++
 net/vmnet-bridged.m |  25 +++++++++
 net/vmnet-common.m  |  20 +++++++
 net/vmnet-host.c    |  24 +++++++++
 net/vmnet-shared.c  |  25 +++++++++
 net/vmnet_int.h     |  25 +++++++++
 qapi/net.json       | 127 +++++++++++++++++++++++++++++++++++++++++++-
 9 files changed, 272 insertions(+), 2 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h

diff --git a/net/clients.h b/net/clients.h
index 92f9b59aed..c9157789f2 100644
--- a/net/clients.h
+++ b/net/clients.h
@@ -63,4 +63,15 @@ int net_init_vhost_user(const Netdev *netdev, const char *name,
 
 int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp);
+#ifdef CONFIG_VMNET
+int net_init_vmnet_host(const Netdev *netdev, const char *name,
+                          NetClientState *peer, Error **errp);
+
+int net_init_vmnet_shared(const Netdev *netdev, const char *name,
+                          NetClientState *peer, Error **errp);
+
+int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
+                          NetClientState *peer, Error **errp);
+#endif /* CONFIG_VMNET */
+
 #endif /* QEMU_NET_CLIENTS_H */
diff --git a/net/meson.build b/net/meson.build
index 847bc2ac85..00a88c4951 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -42,4 +42,11 @@ softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
 softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
 softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true: files('vhost-vdpa.c'))
 
+vmnet_files = files(
+  'vmnet-common.m',
+  'vmnet-bridged.m',
+  'vmnet-host.c',
+  'vmnet-shared.c'
+)
+softmmu_ss.add(when: vmnet, if_true: vmnet_files)
 subdir('can')
diff --git a/net/net.c b/net/net.c
index f0d14dbfc1..1dbb64b935 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1021,6 +1021,11 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
 #ifdef CONFIG_L2TPV3
         [NET_CLIENT_DRIVER_L2TPV3]    = net_init_l2tpv3,
 #endif
+#ifdef CONFIG_VMNET
+        [NET_CLIENT_DRIVER_VMNET_HOST] = net_init_vmnet_host,
+        [NET_CLIENT_DRIVER_VMNET_SHARED] = net_init_vmnet_shared,
+        [NET_CLIENT_DRIVER_VMNET_BRIDGED] = net_init_vmnet_bridged,
+#endif /* CONFIG_VMNET */
 };
 
 
@@ -1106,6 +1111,11 @@ void show_netdevs(void)
 #endif
 #ifdef CONFIG_VHOST_VDPA
         "vhost-vdpa",
+#endif
+#ifdef CONFIG_VMNET
+        "vmnet-host",
+        "vmnet-shared",
+        "vmnet-bridged",
 #endif
     };
 
diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
new file mode 100644
index 0000000000..4e42a90391
--- /dev/null
+++ b/net/vmnet-bridged.m
@@ -0,0 +1,25 @@
+/*
+ * vmnet-bridged.m
+ *
+ * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-types-net.h"
+#include "vmnet_int.h"
+#include "clients.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+
+#include <vmnet/vmnet.h>
+
+int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
+                           NetClientState *peer, Error **errp)
+{
+  error_setg(errp, "vmnet-bridged is not implemented yet");
+  return -1;
+}
diff --git a/net/vmnet-common.m b/net/vmnet-common.m
new file mode 100644
index 0000000000..532d152840
--- /dev/null
+++ b/net/vmnet-common.m
@@ -0,0 +1,20 @@
+/*
+ * vmnet-common.m - network client wrapper for Apple vmnet.framework
+ *
+ * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+ * Copyright(c) 2021 Phillip Tennen <phillip@axleos.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-types-net.h"
+#include "vmnet_int.h"
+#include "clients.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+
+#include <vmnet/vmnet.h>
+
diff --git a/net/vmnet-host.c b/net/vmnet-host.c
new file mode 100644
index 0000000000..4a5ef99dc7
--- /dev/null
+++ b/net/vmnet-host.c
@@ -0,0 +1,24 @@
+/*
+ * vmnet-host.c
+ *
+ * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-types-net.h"
+#include "vmnet_int.h"
+#include "clients.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+
+#include <vmnet/vmnet.h>
+
+int net_init_vmnet_host(const Netdev *netdev, const char *name,
+                        NetClientState *peer, Error **errp) {
+  error_setg(errp, "vmnet-host is not implemented yet");
+  return -1;
+}
diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
new file mode 100644
index 0000000000..f8c4a4f3b8
--- /dev/null
+++ b/net/vmnet-shared.c
@@ -0,0 +1,25 @@
+/*
+ * vmnet-shared.c
+ *
+ * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-types-net.h"
+#include "vmnet_int.h"
+#include "clients.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+
+#include <vmnet/vmnet.h>
+
+int net_init_vmnet_shared(const Netdev *netdev, const char *name,
+                          NetClientState *peer, Error **errp)
+{
+  error_setg(errp, "vmnet-shared is not implemented yet");
+  return -1;
+}
diff --git a/net/vmnet_int.h b/net/vmnet_int.h
new file mode 100644
index 0000000000..c5982259a4
--- /dev/null
+++ b/net/vmnet_int.h
@@ -0,0 +1,25 @@
+/*
+ * vmnet_int.h
+ *
+ * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+#ifndef VMNET_INT_H
+#define VMNET_INT_H
+
+#include "qemu/osdep.h"
+#include "vmnet_int.h"
+#include "clients.h"
+
+#include <vmnet/vmnet.h>
+
+typedef struct VmnetCommonState {
+  NetClientState nc;
+
+} VmnetCommonState;
+
+
+#endif /* VMNET_INT_H */
diff --git a/qapi/net.json b/qapi/net.json
index 7fab2e7cd8..665ef82a0d 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -452,6 +452,117 @@
     '*vhostdev':     'str',
     '*queues':       'int' } }
 
+##
+# @NetdevVmnetHostOptions:
+#
+# vmnet (host mode) network backend.
+#
+# Allows the vmnet interface to communicate with other vmnet
+# interfaces that are in host mode and also with the native host.
+#
+# @dhcpstart: The starting IPv4 address to use for the interface.
+#             Must be in the private IP range (RFC 1918). Must be
+#             specified along with @dhcpend and @subnet-mask.
+#             This address is used as the gateway address. The
+#             subsequent address up to and including dhcpend are
+#             placed in the DHCP pool.
+#
+# @dhcpend: The DHCP IPv4 range end address to use for the
+#           interface. Must be in the private IP range (RFC 1918).
+#           Must be specified along with @dhcpstart and @subnet-mask.
+#
+# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
+#               be specified along with @dhcpstart and @subnet-mask.
+#
+# @isolated: Enable isolation for this interface. Interface isolation
+#            ensures that network communication between multiple
+#            vmnet interfaces instances is not possible.
+#
+# @net-uuid: The identifier (UUID) to uniquely identify the network.
+#            If provided, no DHCP service is provided on this network
+#            and the interface is added to an isolated network with
+#            the specified identifier.
+#
+# Since: 7.0
+##
+{ 'struct': 'NetdevVmnetHostOptions',
+  'data': {
+    '*dhcpstart':   'str',
+    '*dhcpend':     'str',
+    '*subnet-mask': 'str',
+    '*isolated':    'bool',
+    '*net-uuid':    'str'
+  },
+  'if': 'CONFIG_VMNET' }
+
+##
+# @NetdevVmnetSharedOptions:
+#
+# vmnet (shared mode) network backend.
+#
+# Allows traffic originating from the vmnet interface to reach the
+# Internet through a network address translator (NAT).
+# The vmnet interface can communicate with the native host and with
+# other shared mode interfaces on the same subnet. If no DHCP
+# settings, subnet mask and IPv6 prefix specified, the interface can
+# communicate with any of other interfaces in shared mode.
+#
+# @dhcpstart: The starting IPv4 address to use for the interface.
+#             Must be in the private IP range (RFC 1918). Must be
+#             specified along with @dhcpend and @subnet-mask.
+#             This address is used as the gateway address. The
+#             subsequent address up to and including dhcpend are
+#             placed in the DHCP pool.
+#
+# @dhcpend: The DHCP IPv4 range end address to use for the
+#           interface. Must be in the private IP range (RFC 1918).
+#           Must be specified along with @dhcpstart and @subnet-mask.
+#
+# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
+#                be specified along with @dhcpstart and @subnet-mask.
+#
+# @isolated: Enable isolation for this interface. Interface isolation
+#            ensures that network communication between multiple
+#            vmnet interfaces instances is not possible.
+#
+# @nat66-prefix: The IPv6 prefix to use into guest network. Must be a
+#                unique local address i.e. start with fd00::/8 and have
+#                length of 64.
+#
+# Since: 7.0
+##
+{ 'struct': 'NetdevVmnetSharedOptions',
+  'data': {
+    '*dhcpstart':    'str',
+    '*dhcpend':      'str',
+    '*subnet-mask':  'str',
+    '*isolated':     'bool',
+    '*nat66-prefix': 'str'
+  },
+  'if': 'CONFIG_VMNET' }
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
+# @isolated: Enable isolation for this interface. Interface isolation
+#            ensures that network communication between multiple
+#            vmnet interfaces instances is not possible.
+#
+# Since: 7.0
+##
+{ 'struct': 'NetdevVmnetBridgedOptions',
+  'data': {
+    'ifname':     'str',
+    '*isolated':  'str'
+  },
+  'if': 'CONFIG_VMNET' }
+
 ##
 # @NetClientDriver:
 #
@@ -460,10 +571,16 @@
 # Since: 2.7
 #
 #        @vhost-vdpa since 5.1
+#        @vmnet-host since 7.0
+#        @vmnet-shared since 7.0
+#        @vmnet-bridged since 7.0
 ##
 { 'enum': 'NetClientDriver',
   'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
-            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
+            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
+            { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
+            { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
+            { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
 
 ##
 # @Netdev:
@@ -477,6 +594,9 @@
 # Since: 1.2
 #
 #        'l2tpv3' - since 2.1
+#        'vmnet-host' - since 7.0
+#        'vmnet-shared' - since 7.0
+#        'vmnet-bridged' - since 7.0
 ##
 { 'union': 'Netdev',
   'base': { 'id': 'str', 'type': 'NetClientDriver' },
@@ -492,7 +612,10 @@
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


