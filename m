Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB13260C6F9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:53:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFVT-0000ZD-41; Tue, 25 Oct 2022 04:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwy-0004i0-Mc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwY-0007uw-05
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666685147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54tPZKho5BvyVxvP3gzN0PCYLSwS8vWyxEiLl8ciOF4=;
 b=cvL1xDzsVuHiSjOx9MIDNQ2+pHZMZCK8x/qpj+x7LIBc6nl3+B+6S0MCtXiL+giM8rgMrV
 S0mkNZRgUEKTqzeAE3/cIBmpC0aID5Mbfo/8GxQjaFg7CMDNKSoYXQYUV0tfSAiwSFEZ3L
 xiWmLq74JYpzloWMii6grhcNtFmlMpM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-o-YBB0tOPemRuKqUSmLzuQ-1; Tue, 25 Oct 2022 04:05:45 -0400
X-MC-Unique: o-YBB0tOPemRuKqUSmLzuQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EECCF3811F38;
 Tue, 25 Oct 2022 08:05:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC9AF112C064;
 Tue, 25 Oct 2022 08:05:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5944D21E60CE; Tue, 25 Oct 2022 10:05:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Laurent Vivier <lvivier@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 26/28] qapi virtio: Elide redundant has_FOO in generated C
Date: Tue, 25 Oct 2022 10:05:39 +0200
Message-Id: <20221025080541.271547-27-armbru@redhat.com>
In-Reply-To: <20221025080541.271547-1-armbru@redhat.com>
References: <20221025080541.271547-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/virtio.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221018062849.3420573-27-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/virtio.c     | 1 -
 monitor/hmp-cmds.c     | 4 ++--
 scripts/qapi/schema.py | 1 -
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 808446b4c9..883bc7064d 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4664,7 +4664,6 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     status->disable_legacy_check = vdev->disable_legacy_check;
     status->bus_name = g_strdup(vdev->bus_name);
     status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
-    status->has_vhost_dev = vdev->vhost_started;
 
     if (vdev->vhost_started) {
         VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 5285d7f2fe..cbbd9bdc6d 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2570,7 +2570,7 @@ void hmp_virtio_status(Monitor *mon, const QDict *qdict)
 
     monitor_printf(mon, "%s:\n", path);
     monitor_printf(mon, "  device_name:             %s %s\n",
-                   s->name, s->has_vhost_dev ? "(vhost)" : "");
+                   s->name, s->vhost_dev ? "(vhost)" : "");
     monitor_printf(mon, "  device_id:               %d\n", s->device_id);
     monitor_printf(mon, "  vhost_started:           %s\n",
                    s->vhost_started ? "true" : "false");
@@ -2606,7 +2606,7 @@ void hmp_virtio_status(Monitor *mon, const QDict *qdict)
     monitor_printf(mon, "  Backend features:\n");
     hmp_virtio_dump_features(mon, s->backend_features);
 
-    if (s->has_vhost_dev) {
+    if (s->vhost_dev) {
         monitor_printf(mon, "  VHost:\n");
         monitor_printf(mon, "    nvqs:           %d\n",
                        s->vhost_dev->nvqs);
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index fd18f8249b..b2df148e01 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/virtio.json',
             'qga/qapi-schema.json']
         if self.info and any(self.info.fname.endswith(mod)
                              for mod in opt_out):
-- 
2.37.3


