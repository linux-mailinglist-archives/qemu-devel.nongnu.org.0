Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D263757B3A7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 11:20:23 +0200 (CEST)
Received: from localhost ([::1]:49370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE5sU-0002VX-TM
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 05:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5cu-0000Xk-UK
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5ct-0001U6-9r
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658307854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bUvfCcXRQjAFdSJZ3vVShymwEkrzFknZ5YRHIAgOluw=;
 b=QDz2g6gUIoCppkpjA3HnUgTfzNmD/AKqUufBoDOCunasrM1sFRqvjVeM6hHpWfdrsBo76f
 NQKqwpnKLyaCA0YsXVezCKwk8k4c+Y65hqovJGVcDR3HDS9CfWqu9Rm6T3STa5vVVlfhg7
 tl9pPoOtMgPoNbyMc66fm/F2cDRG4/k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-uQNu3VTmOm6HvNQHh_3kJQ-1; Wed, 20 Jul 2022 05:04:07 -0400
X-MC-Unique: uQNu3VTmOm6HvNQHh_3kJQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A69D922B25;
 Wed, 20 Jul 2022 09:04:07 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-110.pek2.redhat.com
 [10.72.13.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EE4C401473;
 Wed, 20 Jul 2022 09:04:05 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 16/25] vhost-net-vdpa: add stubs for when no virtio-net
 device is present
Date: Wed, 20 Jul 2022 17:03:04 +0800
Message-Id: <20220720090313.55169-17-jasowang@redhat.com>
In-Reply-To: <20220720090313.55169-1-jasowang@redhat.com>
References: <20220720090313.55169-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Eugenio Pérez <eperezma@redhat.com>

net/vhost-vdpa.c will need functions that are declared in
vhost-shadow-virtqueue.c, that needs functions of virtio-net.c.

Copy the vhost-vdpa-stub.c code so
only the constructor net_init_vhost_vdpa needs to be defined.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/meson.build       |  3 ++-
 net/vhost-vdpa-stub.c | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 net/vhost-vdpa-stub.c

diff --git a/net/meson.build b/net/meson.build
index 754e2d1..d1be76d 100644
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
diff --git a/net/vhost-vdpa-stub.c b/net/vhost-vdpa-stub.c
new file mode 100644
index 0000000..1732ed2
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
-- 
2.7.4


