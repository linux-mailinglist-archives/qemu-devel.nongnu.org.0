Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5FE6109E4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:53:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIFG-0007JM-T6; Fri, 28 Oct 2022 01:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIEp-00073B-W1
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIEo-0007LO-56
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGhVqMZkWBBR+IZPuIg5BKqRoP7WF89qAIOJUndZMn4=;
 b=f9flb37ZKPFzZfAkezjiQmb9YD0NpkTrk76TjWaWkWIXjLpVs2Sgy1X99PnXnX8vDn2PZu
 7RcKMlRIGFuUuy2NduH4xj3VeGZ2yvSmYUTxUjNcKA+R1GS7X7VJc9lUnlAlrb09AEFfxJ
 uBlJdoZbWchcXzdRGLpnfBm68jYLYcI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-6-mE4bS7OyqBwIu3uLCu2A-1; Fri, 28 Oct 2022 01:48:56 -0400
X-MC-Unique: 6-mE4bS7OyqBwIu3uLCu2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E1FE185A78F;
 Fri, 28 Oct 2022 05:48:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A58DC15BA8;
 Fri, 28 Oct 2022 05:48:53 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: Si-Wei Liu <si-wei.liu@oracle.com>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 05/26] vhost-vdpa: allow passing opened vhostfd to vhost-vdpa
Date: Fri, 28 Oct 2022 13:48:14 +0800
Message-Id: <20221028054835.29674-6-jasowang@redhat.com>
In-Reply-To: <20221028054835.29674-1-jasowang@redhat.com>
References: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Si-Wei Liu <si-wei.liu@oracle.com>

Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
backend as another parameter to instantiate vhost-vdpa net client.
This would benefit the use case where only open file descriptors, as
opposed to raw vhost-vdpa device paths, are accessible from the QEMU
process.

(qemu) netdev_add type=vhost-vdpa,vhostfd=61,id=vhost-vdpa1

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 25 ++++++++++++++++++++-----
 qapi/net.json    |  3 +++
 qemu-options.hx  |  6 ++++--
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 6d64000..9c1b25d 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -634,14 +634,29 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
-    if (!opts->vhostdev) {
-        error_setg(errp, "vdpa character device not specified with vhostdev");
+    if (!opts->has_vhostdev && !opts->has_vhostfd) {
+        error_setg(errp,
+                   "vhost-vdpa: neither vhostdev= nor vhostfd= was specified");
         return -1;
     }
 
-    vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
-    if (vdpa_device_fd == -1) {
-        return -errno;
+    if (opts->has_vhostdev && opts->has_vhostfd) {
+        error_setg(errp,
+                   "vhost-vdpa: vhostdev= and vhostfd= are mutually exclusive");
+        return -1;
+    }
+
+    if (opts->has_vhostdev) {
+        vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
+        if (vdpa_device_fd == -1) {
+            return -errno;
+        }
+    } else if (opts->has_vhostfd) {
+        vdpa_device_fd = monitor_fd_param(monitor_cur(), opts->vhostfd, errp);
+        if (vdpa_device_fd == -1) {
+            error_prepend(errp, "vhost-vdpa: unable to parse vhostfd: ");
+            return -1;
+        }
     }
 
     r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
diff --git a/qapi/net.json b/qapi/net.json
index dd088c0..926ecc8 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -442,6 +442,8 @@
 # @vhostdev: path of vhost-vdpa device
 #            (default:'/dev/vhost-vdpa-0')
 #
+# @vhostfd: file descriptor of an already opened vhost vdpa device
+#
 # @queues: number of queues to be created for multiqueue vhost-vdpa
 #          (default: 1)
 #
@@ -456,6 +458,7 @@
 { 'struct': 'NetdevVhostVDPAOptions',
   'data': {
     '*vhostdev':     'str',
+    '*vhostfd':      'str',
     '*queues':       'int',
     '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index eb38e5d..876a70a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2790,8 +2790,10 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                configure a vhost-user network, backed by a chardev 'dev'\n"
 #endif
 #ifdef __linux__
-    "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
+    "-netdev vhost-vdpa,id=str[,vhostdev=/path/to/dev][,vhostfd=h]\n"
     "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
+    "                use 'vhostdev=/path/to/dev' to open a vhost vdpa device\n"
+    "                use 'vhostfd=h' to connect to an already opened vhost vdpa device\n"
 #endif
 #ifdef CONFIG_VMNET
     "-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n"
@@ -3296,7 +3298,7 @@ SRST
              -netdev type=vhost-user,id=net0,chardev=chr0 \
              -device virtio-net-pci,netdev=net0
 
-``-netdev vhost-vdpa,vhostdev=/path/to/dev``
+``-netdev vhost-vdpa[,vhostdev=/path/to/dev][,vhostfd=h]``
     Establish a vhost-vdpa netdev.
 
     vDPA device is a device that uses a datapath which complies with
-- 
2.7.4


