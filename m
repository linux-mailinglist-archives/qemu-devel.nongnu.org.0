Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADB841E817
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 09:14:06 +0200 (CEST)
Received: from localhost ([::1]:50210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWCk9-0005sr-Qo
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 03:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCfX-0006nY-4X
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:09:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCfU-0002a0-8z
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633072155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XBGobM44EFS3izwe6BQDokWeZytbVyZqepmR96WPwI=;
 b=hcCn6rhe5r244QzYAJczyoryb43N4vTotogJlnNUPvqVajtz/5Q8ZadB6ngDLTImF2fBuk
 xCTahV0YTujao+JtcdKgAq/pO5SGrO4uXLX9KrXme7XOEwQyzQeu4a4ZC16q0zzRblNNHh
 ksA3lv1OqjBvO9/FDZ9MimOMaC9tx64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-TQIMso0iPBeVRjzMI1HCmg-1; Fri, 01 Oct 2021 03:09:08 -0400
X-MC-Unique: TQIMso0iPBeVRjzMI1HCmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 960FE5074C;
 Fri,  1 Oct 2021 07:09:07 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7502652A3;
 Fri,  1 Oct 2021 07:08:48 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 05/20] vhost: Add x-vhost-enable-shadow-vq qmp
Date: Fri,  1 Oct 2021 09:05:48 +0200
Message-Id: <20211001070603.307037-6-eperezma@redhat.com>
In-Reply-To: <20211001070603.307037-1-eperezma@redhat.com>
References: <20211001070603.307037-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Command to enable shadow virtqueue.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 qapi/net.json          | 23 +++++++++++++++++++++++
 hw/virtio/vhost-vdpa.c |  8 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/qapi/net.json b/qapi/net.json
index 7fab2e7cd8..a2c30fd455 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -79,6 +79,29 @@
 { 'command': 'netdev_del', 'data': {'id': 'str'},
   'allow-preconfig': true }
 
+##
+# @x-vhost-enable-shadow-vq:
+#
+# Use vhost shadow virtqueue.
+#
+# @name: the device name of the VirtIO device
+#
+# @enable: true to use the alternate shadow VQ notifications
+#
+# Returns: Always error, since SVQ is not implemented at the moment.
+#
+# Since: 6.2
+#
+# Example:
+#
+# -> { "execute": "x-vhost-enable-shadow-vq",
+#     "arguments": { "name": "virtio-net", "enable": false } }
+#
+##
+{ 'command': 'x-vhost-enable-shadow-vq',
+  'data': {'name': 'str', 'enable': 'bool'},
+  'if': 'defined(CONFIG_VHOST_KERNEL)' }
+
 ##
 # @NetLegacyNicOptions:
 #
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 4fa414feea..c63e311d7c 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -23,6 +23,8 @@
 #include "cpu.h"
 #include "trace.h"
 #include "qemu-common.h"
+#include "qapi/qapi-commands-net.h"
+#include "qapi/error.h"
 
 static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
 {
@@ -656,6 +658,12 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
     return true;
 }
 
+
+void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error **errp)
+{
+    error_setg(errp, "Shadow virtqueue still not implemented");
+}
+
 const VhostOps vdpa_ops = {
         .backend_type = VHOST_BACKEND_TYPE_VDPA,
         .vhost_backend_init = vhost_vdpa_init,
-- 
2.27.0


