Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3EE308EF5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 22:06:14 +0100 (CET)
Received: from localhost ([::1]:52796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ay5-0008BT-BV
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 16:06:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5anc-0007J5-Sq
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:55:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5anW-0002o2-AU
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611953717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wpSdDkjyWAlZskTjDdmXKJZjLeOlOlAuRgxfbF3Zhs=;
 b=Bk/PYGzePuUf8LW68tafCIQA4uh8CWpD5+flWVI3Ii6yIpgJtQQoH6g/Io60T7jQrpJFZf
 9rvmg3jYhZyS5VeRvC+UiC+FtZFFYItsph0Wjuln6zsxyVdqWA+/9IQT9JfiO3J5Ncios3
 tBFo9mAuK6bvlNSb7t43l9pO2SYqFuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-VnsqSw8oNt2azPYvvXFcvw-1; Fri, 29 Jan 2021 15:55:15 -0500
X-MC-Unique: VnsqSw8oNt2azPYvvXFcvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97C80107ACE3;
 Fri, 29 Jan 2021 20:55:13 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-115.ams2.redhat.com
 [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FB0C272CF;
 Fri, 29 Jan 2021 20:55:10 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 08/10] vhost: Add x-vhost-enable-shadow-vq qmp
Date: Fri, 29 Jan 2021 21:54:13 +0100
Message-Id: <20210129205415.876290-9-eperezma@redhat.com>
In-Reply-To: <20210129205415.876290-1-eperezma@redhat.com>
References: <20210129205415.876290-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Command to enable shadow virtqueue looks like:

{ "execute": "x-vhost-enable-shadow-vq", "arguments": { "name": "dev0", "enable": true } }

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 qapi/net.json     | 23 +++++++++++++++++++++++
 hw/virtio/vhost.c |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/qapi/net.json b/qapi/net.json
index c31748c87f..6170d69798 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -77,6 +77,29 @@
 ##
 { 'command': 'netdev_del', 'data': {'id': 'str'} }
 
+##
+# @x-vhost-enable-shadow-vq:
+#
+# Use vhost shadow virtqueue.
+#
+# @name: the device name of the virtual network adapter
+#
+# @enable: true to use he alternate shadow VQ notification path
+#
+# Returns: Error if failure, or 'no error' for success
+#
+# Since: 5.3
+#
+# Example:
+#
+# -> { "execute": "x-vhost_enable_shadow_vq", "arguments": {"enable": true} }
+# <- { "return": { "enabled" : true } }
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
index 040f68ff2e..42836e45f3 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -15,6 +15,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-net.h"
 #include "hw/virtio/vhost.h"
 #include "qemu/atomic.h"
 #include "qemu/range.h"
@@ -1841,3 +1842,8 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
 
     return -1;
 }
+
+void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error **errp)
+{
+    error_setg(errp, "Shadow virtqueue still not implemented.");
+}
-- 
2.27.0


