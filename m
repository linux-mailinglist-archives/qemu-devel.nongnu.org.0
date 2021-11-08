Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF6044982B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:26:25 +0100 (CET)
Received: from localhost ([::1]:51850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6XQ-0008Lj-B6
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:26:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mk6WE-0007YE-EJ
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:25:10 -0500
Received: from [2a00:1450:4864:20::231] (port=34560
 helo=mail-lj1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mk6WB-0007SS-Om
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:25:10 -0500
Received: by mail-lj1-x231.google.com with SMTP id h11so30259202ljk.1
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 07:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZZBMT7KaPEDjsQLPAkhl/ke7movWDy0TCQFZpD+4u60=;
 b=RJ9CRzpg5xX+6aVwPTpUzPJuDjl7VPwqTfX1m+sTRTM1R+rTmbnSzejiQA/KQH7uTG
 yyTpnHCMlGRbscHLou2dFkKHAy4VHIvXDCxK6Cw1HxhcjfYfEJxxWdOZAxaBazzIVXiK
 A/zc2saPGMspJnCWleweVtU3U9a3qvSWmJsX0vRGlmYJptX/O/ODY2tTY9glD9Od9NNf
 lDFcNn3WpLc9gw3dpUX4Gg+0OoqqbgujDzrXY6nDqL58L+tUBV2rg6xNK/PaLM8OQ4GX
 ZTX/PViZY/GEJcxaG0LTR83DPZaxGGbBuOuPtL9xysYpOQ7ntMQiEoLZEjrWxuY/NRBK
 tcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZZBMT7KaPEDjsQLPAkhl/ke7movWDy0TCQFZpD+4u60=;
 b=GkcO9B5gy69HjDFFDSU+aRd9f42md0CRCp7srDJ2R7uq+YjulRTFIkse3gW42/wnq1
 SMDwPU2IP6QuIIBeUQ0aNWTGMfvGMLYNqhjW9UtUxDbetz7t2hiz3EZ3DNaiJK4YS98h
 0/33X0aNMDMU/b14YPzJ8oR5UN7CPIDOh9YtqyUx0QtsIW2bIGUmh4p4VE3tl5eOcOq6
 a3a9TMLwE8b7jYximW+oewjkAVQhhBBZj/A3qkaY/Ee1dDL0N/DjHVUlZvuA/M2sZABt
 I6aCRDFVqqd6dNt2f0G0t/uS0ER+jPlNXotWbTp+9Fj46ARdcoGZVAMkQoyMSLbmgLoo
 K04A==
X-Gm-Message-State: AOAM533B+RpAfMGJ/OlLaVlekrvu8sXE7QhAGy0KV/9CxZB3/W1PxfEC
 Nlm7FgOVbBeCUwG8vFlbq9xRUw+AcDl6mA==
X-Google-Smtp-Source: ABdhPJyUoAouL/FT9XNrFZOawOZPyUZdFK9FXNU3LziTdia4cqbiihaINJvojB9TswFBBEggBak2qQ==
X-Received: by 2002:a2e:a5c8:: with SMTP id n8mr437246ljp.367.1636384734443;
 Mon, 08 Nov 2021 07:18:54 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id z13sm1312776lfd.139.2021.11.08.07.18.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:18:54 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/6] net/vmnet: add vmnet backends to qapi/net
Date: Mon,  8 Nov 2021 18:17:00 +0300
Message-Id: <20211108151704.65611-3-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
References: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::231
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x231.google.com
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
 net/vmnet-common.m  |  20 ++++++++
 net/vmnet-host.c    |  24 +++++++++
 net/vmnet-shared.c  |  25 +++++++++
 net/vmnet_int.h     |  25 +++++++++
 qapi/net.json       | 122 +++++++++++++++++++++++++++++++++++++++++++-
 9 files changed, 267 insertions(+), 2 deletions(-)
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
index 7fab2e7cd8..087cdf0546 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -452,6 +452,112 @@
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
+#             specified along with @dhcpend and @subnetmask.
+#             This address is used as the gateway address. The
+#             subsequent address up to and including dhcpend are
+#             placed in the DHCP pool.
+#
+# @dhcpend: The DHCP IPv4 range end address to use for the
+#           interface. Must be in the private IP range (RFC 1918).
+#           Must be specified along with @dhcpstart and @subnetmask.
+#
+# @subnetmask: The IPv4 subnet mask to use on the interface. Must
+#              be specified along with @dhcpstart and @subnetmask.
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
+# Since: 6.2
+##
+{ 'struct': 'NetdevVmnetHostOptions',
+  'data': {
+    '*dhcpstart':   'str',
+    '*dhcpend':     'str',
+    '*subnetmask':  'str',
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
+# Internet through a network address translator (NAT). The vmnet
+# interface can also communicate with the native host. By default,
+# the vmnet interface is able to communicate with other shared mode
+# interfaces. If a subnet range is specified, the vmnet interface can
+# communicate with other shared mode interfaces on the same subnet.
+#
+# @dhcpstart: The starting IPv4 address to use for the interface.
+#             Must be in the private IP range (RFC 1918). Must be
+#             specified along with @dhcpend and @subnetmask.
+#             This address is used as the gateway address. The
+#             subsequent address up to and including dhcpend are
+#             placed in the DHCP pool.
+#
+# @dhcpend: The DHCP IPv4 range end address to use for the
+#           interface. Must be in the private IP range (RFC 1918).
+#           Must be specified along with @dhcpstart and @subnetmask.
+#
+# @subnetmask: The IPv4 subnet mask to use on the interface. Must
+#              be specified along with @dhcpstart and @subnetmask.
+#
+# @isolated: Enable isolation for this interface. Interface isolation
+#            ensures that network communication between multiple
+#            vmnet interfaces instances is not possible.
+#
+# Since: 6.2
+##
+{ 'struct': 'NetdevVmnetSharedOptions',
+  'data': {
+    '*dhcpstart':    'str',
+    '*dhcpend':      'str',
+    '*subnetmask':   'str',
+    '*isolated':     'bool'
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
+# Since: 6.2
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
@@ -460,10 +566,16 @@
 # Since: 2.7
 #
 #        @vhost-vdpa since 5.1
+#        @vmnet-host since 6.2
+#        @vmnet-shared since 6.2
+#        @vmnet-bridged since 6.2
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
@@ -477,6 +589,9 @@
 # Since: 1.2
 #
 #        'l2tpv3' - since 2.1
+#        'vmnet-host' - since 6.2
+#        'vmnet-shared' - since 6.2
+#        'vmnet-bridged' - since 6.2
 ##
 { 'union': 'Netdev',
   'base': { 'id': 'str', 'type': 'NetClientDriver' },
@@ -492,7 +607,10 @@
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


