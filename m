Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2D233C72E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:55:41 +0100 (CET)
Received: from localhost ([::1]:36616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtJU-0003u0-Tt
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtDJ-0005LJ-To
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtDI-0003xv-2w
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615837755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gnqt716CWo5WYbtfXADF/wHUjv+rzznj/YbrsIdB6Tc=;
 b=CdIFahaeeFZPjJJ0YSR1y3Y2w3FHyHf7kaGbiQ9K+B9kWdccHaAtYID7TX+wzQX+arOoic
 G1xHlSFpEaSFSeYKZHqXghrRZqI6Iod6ygj47lWZEGQGSdgxVkkPjg1ZAiMi5ByfSvWR1t
 Pi7/tC/rcHDLNjkbYwNjQMpbdOQ+zic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-yhMKRI4WOzCTrJOZxSstmQ-1; Mon, 15 Mar 2021 15:49:13 -0400
X-MC-Unique: yhMKRI4WOzCTrJOZxSstmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C46992502;
 Mon, 15 Mar 2021 19:49:12 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-173.ams2.redhat.com
 [10.36.112.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88D5B5F706;
 Mon, 15 Mar 2021 19:49:05 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 04/13] vhost: Add x-vhost-enable-shadow-vq qmp
Date: Mon, 15 Mar 2021 20:48:33 +0100
Message-Id: <20210315194842.277740-5-eperezma@redhat.com>
In-Reply-To: <20210315194842.277740-1-eperezma@redhat.com>
References: <20210315194842.277740-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Guru Prasad <guru.prasad@broadcom.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Command to enable shadow virtqueue looks like:

{ "execute": "x-vhost-enable-shadow-vq", "arguments": { "name": "dev0", "enable": true } }

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 qapi/net.json     | 22 ++++++++++++++++++++++
 hw/virtio/vhost.c |  6 ++++++
 2 files changed, 28 insertions(+)

diff --git a/qapi/net.json b/qapi/net.json
index c31748c87f..4c5f65d021 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -77,6 +77,28 @@
 ##
 { 'command': 'netdev_del', 'data': {'id': 'str'} }
 
+##
+# @x-vhost-enable-shadow-vq:
+#
+# Use vhost shadow virtqueue.
+#
+# @name: the device name of the VirtIO device
+#
+# @enable: true to use he alternate shadow VQ notification path
+#
+# Returns: Error if failure, or 'no error' for success. Not found if vhost is not enabled.
+#
+# Since: 6.0
+#
+# Example:
+#
+# -> { "execute": "x-vhost-enable-shadow-vq", "arguments": { "name": "virtio-net", "enable": false } }
+#
+##
+{ 'command': 'x-vhost-enable-shadow-vq',
+  'data': {'name': 'str', 'enable': 'bool'},
+  'if': 'defined(CONFIG_VHOST_KERNEL)' }
+
 ##
 # @NetLegacyNicOptions:
 #
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 4680c0cfcf..97f1bcfa42 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -15,6 +15,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-net.h"
 #include "hw/virtio/vhost.h"
 #include "qemu/atomic.h"
 #include "qemu/range.h"
@@ -1831,3 +1832,8 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
 
     return -1;
 }
+
+void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error **errp)
+{
+    error_setg(errp, "Shadow virtqueue still not implemented");
+}
-- 
2.27.0


