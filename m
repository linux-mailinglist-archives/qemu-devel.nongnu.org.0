Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8A244022E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 20:40:39 +0200 (CEST)
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgWnu-0004PI-JF
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 14:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWkg-0001dh-3n
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:37:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWke-0000Tv-89
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635532635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=njCNO4sG44aARsLfXZ27pz7GKj3w+8Zk8L76z4qVvxI=;
 b=Y+Qat3h2O37a2Ky1lZaBowEK6HjtPzYw9hRsHt+wDL0+O3xy0TNlVRV5gjafZ6X3Anwpac
 36yVDPxveeEkhv4u1SWYc2LKu5bSzogaYyiQuISrm/9YJDFWXLW0UCbuX7YoGIUQcBYGm5
 AHwFei9kDv4o9bXGLiTPWtXmT4BQ2kQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-4-ZFNx1OMeKVUrr5OxTbfA-1; Fri, 29 Oct 2021 14:37:12 -0400
X-MC-Unique: 4-ZFNx1OMeKVUrr5OxTbfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27756806688;
 Fri, 29 Oct 2021 18:37:11 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 504385D6CF;
 Fri, 29 Oct 2021 18:36:55 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 05/26] vhost: Add x-vhost-set-shadow-vq qmp
Date: Fri, 29 Oct 2021 20:35:04 +0200
Message-Id: <20211029183525.1776416-6-eperezma@redhat.com>
In-Reply-To: <20211029183525.1776416-1-eperezma@redhat.com>
References: <20211029183525.1776416-1-eperezma@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Command to set shadow virtqueue mode.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 qapi/net.json    | 22 ++++++++++++++++++++++
 net/vhost-vdpa.c |  6 ++++++
 2 files changed, 28 insertions(+)

diff --git a/qapi/net.json b/qapi/net.json
index 7fab2e7cd8..b191b6787b 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -79,6 +79,28 @@
 { 'command': 'netdev_del', 'data': {'id': 'str'},
   'allow-preconfig': true }
 
+##
+# @x-vhost-set-shadow-vq:
+#
+# Use vhost shadow virtqueue.
+#
+# @name: the device name of the VirtIO device
+#
+# @set: true to use the alternate shadow VQ notifications
+#
+# Returns: Always error, since SVQ is not implemented at the moment.
+#
+# Since: 6.2
+#
+# Example:
+#
+# -> { "execute": "x-vhost-set-shadow-vq",
+#     "arguments": { "name": "virtio-net", "set": false } }
+#
+##
+{ 'command': 'x-vhost-set-shadow-vq', 'data': {'name': 'str', 'set': 'bool'},
+  'if': 'CONFIG_VHOST_VDPA' }
+
 ##
 # @NetLegacyNicOptions:
 #
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 49ab322511..3b360da27d 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -18,6 +18,7 @@
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-net.h"
 #include <linux/vhost.h>
 #include <sys/ioctl.h>
 #include <err.h>
@@ -301,3 +302,8 @@ err:
 
     return -1;
 }
+
+void qmp_x_vhost_set_shadow_vq(const char *name, bool set, Error **errp)
+{
+    error_setg(errp, "Shadow virtqueue still not implemented");
+}
-- 
2.27.0


