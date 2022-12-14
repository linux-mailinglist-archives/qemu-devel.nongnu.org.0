Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2857264C479
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 08:49:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MUO-0003Ti-Ud; Wed, 14 Dec 2022 02:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUL-0003Rh-Ua
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUI-0003ev-OT
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r16/niz33SX+1pcXp7WfpLVhQ74c5lUkm/rPQhupUdk=;
 b=DOZvpw/vLyPZ0otJr5u/ZZacaILnHK08IXIZ6RPGUHFVu0+T86cWH1IWOKSvr76c/6jUIQ
 UTmPE2KFyqZHG40l5lXWMmTSkkZhT63o9S7xqudnZXH4eNstK8twouBYxu8SaXqkm+rXP6
 syEOXq3FP62Xu4y9X5E7Bu6MWgfmbJ0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-sv3I-SGoN5GtzkCCDmqofQ-1; Wed, 14 Dec 2022 02:47:32 -0500
X-MC-Unique: sv3I-SGoN5GtzkCCDmqofQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 051B63814593;
 Wed, 14 Dec 2022 07:47:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC1222166B26;
 Wed, 14 Dec 2022 07:47:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 93BA621E60CD; Wed, 14 Dec 2022 08:47:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 28/30] qapi virtio: Elide redundant has_FOO in generated C
Date: Wed, 14 Dec 2022 08:47:19 +0100
Message-Id: <20221214074721.731441-31-armbru@redhat.com>
In-Reply-To: <20221214074721.731441-1-armbru@redhat.com>
References: <20221214074721.731441-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/virtio.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221104160712.3005652-29-armbru@redhat.com>
---
 hw/virtio/virtio.c     | 1 -
 monitor/hmp-cmds.c     | 4 ++--
 scripts/qapi/schema.py | 1 -
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index eb6347ab5d..2118efbe72 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4701,7 +4701,6 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     status->disable_legacy_check = vdev->disable_legacy_check;
     status->bus_name = g_strdup(vdev->bus_name);
     status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
-    status->has_vhost_dev = vdev->vhost_started;
 
     if (vdev->vhost_started) {
         VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 263b7762ab..b847b26041 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2549,7 +2549,7 @@ void hmp_virtio_status(Monitor *mon, const QDict *qdict)
 
     monitor_printf(mon, "%s:\n", path);
     monitor_printf(mon, "  device_name:             %s %s\n",
-                   s->name, s->has_vhost_dev ? "(vhost)" : "");
+                   s->name, s->vhost_dev ? "(vhost)" : "");
     monitor_printf(mon, "  device_id:               %d\n", s->device_id);
     monitor_printf(mon, "  vhost_started:           %s\n",
                    s->vhost_started ? "true" : "false");
@@ -2585,7 +2585,7 @@ void hmp_virtio_status(Monitor *mon, const QDict *qdict)
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


