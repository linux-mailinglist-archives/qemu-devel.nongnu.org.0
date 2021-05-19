Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DA63893DC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:35:55 +0200 (CEST)
Received: from localhost ([::1]:36500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPAo-000235-LZ
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP50-0002Tj-2g
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:29:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP4x-0005CO-4t
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:29:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VetRo+0BKe9xyEK8yuAfA4AJjKiZmn+zmiMLp+Fzc74=;
 b=fFPurX1hen2LsZ8cUrZ5mgIVRn5vnfb4HdA9CpA+BR95x4fB8PllZEub5YA5hqyDDFRmB4
 PBJ6ZULr5bGucWZhp/3/3tokJM0E1W29aRlgbKvoY8Pb+JdCyiVzZiNzAM0gjPIaxMtwW2
 zXDCOOoidUbSG4NbOMclOeNbmFtdetg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-1FGdS7b7P2iYSOKUeJoUjw-1; Wed, 19 May 2021 12:29:47 -0400
X-MC-Unique: 1FGdS7b7P2iYSOKUeJoUjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3530F801106;
 Wed, 19 May 2021 16:29:46 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74DF35D6AC;
 Wed, 19 May 2021 16:29:42 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 04/29] vhost: Add x-vhost-enable-shadow-vq qmp
Date: Wed, 19 May 2021 18:28:38 +0200
Message-Id: <20210519162903.1172366-5-eperezma@redhat.com>
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Command to enable shadow virtqueue looks like:

{ "execute": "x-vhost-enable-shadow-vq",
  "arguments": { "name": "dev0", "enable": true } }

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 qapi/net.json     | 22 ++++++++++++++++++++++
 hw/virtio/vhost.c |  6 ++++++
 2 files changed, 28 insertions(+)

diff --git a/qapi/net.json b/qapi/net.json
index c31748c87f..660feafdd2 100644
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
+# Since: 6.1
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
index 40f9f64ebd..c4c1f80661 100644
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


