Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF4B57B170
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 09:12:35 +0200 (CEST)
Received: from localhost ([::1]:57122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE3so-0005zE-Br
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 03:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oE3hY-0000Zd-Sv
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oE3hU-0006fc-R1
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658300451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cp2zLq3bcevT/MG61/g8Skxxn4aUUCgDhkYxNDEUkhs=;
 b=dzH0Jnd9xpQ88EmX9W+3qYZiZKZX52wanoz37msT55x3F/33OTHU+y9pX1x9m1VxD8T9Om
 sjDfp/RcsX7gWscLuaL8ez/h04nHmm7q/cFe/LAIRqYHw53V8khWGoXN/qN+Eo1xnDal2P
 Mz/PZszKtNayPpn/BfcVaVua+TddW24=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-7qSiZ6fCOlCvQF28hLurTw-1; Wed, 20 Jul 2022 03:00:47 -0400
X-MC-Unique: 7qSiZ6fCOlCvQF28hLurTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F73F3C01E10;
 Wed, 20 Jul 2022 07:00:46 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FA6190A11;
 Wed, 20 Jul 2022 07:00:43 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>,
 Eric Blake <eblake@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v6 16/21] vhost-net-vdpa: add stubs for when no virtio-net
 device is present
Date: Wed, 20 Jul 2022 08:59:41 +0200
Message-Id: <20220720065946.3122611-17-eperezma@redhat.com>
In-Reply-To: <20220720065946.3122611-1-eperezma@redhat.com>
References: <20220720065946.3122611-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

net/vhost-vdpa.c will need functions that are declared in
vhost-shadow-virtqueue.c, that needs functions of virtio-net.c.

Copy the vhost-vdpa-stub.c code so
only the constructor net_init_vhost_vdpa needs to be defined.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa-stub.c | 21 +++++++++++++++++++++
 net/meson.build       |  3 ++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 net/vhost-vdpa-stub.c

diff --git a/net/vhost-vdpa-stub.c b/net/vhost-vdpa-stub.c
new file mode 100644
index 0000000000..1732ed2443
--- /dev/null
+++ b/net/vhost-vdpa-stub.c
@@ -0,0 +1,21 @@
+/*
+ * vhost-vdpa-stub.c
+ *
+ * Copyright (c) 2022 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "clients.h"
+#include "net/vhost-vdpa.h"
+#include "qapi/error.h"
+
+int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
+                        NetClientState *peer, Error **errp)
+{
+    error_setg(errp, "vhost-vdpa requires frontend driver virtio-net-*");
+    return -1;
+}
diff --git a/net/meson.build b/net/meson.build
index 754e2d1d40..d1be76daf3 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -41,7 +41,8 @@ endif
 softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
 softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
 if have_vhost_net_vdpa
-  softmmu_ss.add(files('vhost-vdpa.c'))
+  softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost-vdpa.c'), if_false: files('vhost-vdpa-stub.c'))
+  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-vdpa-stub.c'))
 endif
 
 vmnet_files = files(
-- 
2.31.1


