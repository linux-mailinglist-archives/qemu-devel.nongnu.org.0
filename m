Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96B742126E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 17:14:27 +0200 (CEST)
Received: from localhost ([::1]:41202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXPfd-0006BY-RE
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 11:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mXPZM-0006bV-Ah; Mon, 04 Oct 2021 11:07:56 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:34830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mXPZH-0003zW-9q; Mon, 04 Oct 2021 11:07:56 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 7C14E2E1A55;
 Mon,  4 Oct 2021 18:07:42 +0300 (MSK)
Received: from myt6-76f0a6db1a7e.qloud-c.yandex.net
 (2a02:6b8:c12:422d:0:640:76f0:a6db [2a02:6b8:c12:422d:0:640:76f0:a6db])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 9onb2P5kB8-7gt4gK1b; Mon, 04 Oct 2021 18:07:42 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1633360062; bh=NUkgCkrI/qClBYJz68V2MGeBe90XZE+fc7O4XdL6a90=;
 h=Message-Id:References:Date:Subject:To:From:In-Reply-To:Cc;
 b=oiybj6r6m4EHTWBdIesD3v7wFeS4WvM9IIh24hiPcW0N89L465tQNKwaMnpRCTZD2
 4GedI03u/25r4c9nFspm2gxesjBBdFpUmC8bZagdabkXWShyRD12dr8LrMpqNxGzK5
 pJdJXM0sBRSl/WzUd+WNQHB1LGFX0ZcwmdsHwxpQ=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from den-plotnikov-w.yandex-team.ru (2a02:6b8:b081:8009::1:11
 [2a02:6b8:b081:8009::1:11])
 by myt6-76f0a6db1a7e.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 AnWxZOr920-7f0aPOMn; Mon, 04 Oct 2021 18:07:42 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v0 1/2] vhost-user-blk: add a new vhost-user-virtio-blk type
Date: Mon,  4 Oct 2021 18:07:30 +0300
Message-Id: <20211004150731.191270-2-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
References: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, mst@redhat.com, yc-core@yandex-team.ru,
 qemu-block@nongnu.org, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main reason of adding a new type is to make cross-device live migration
between "virtio-blk" and "vhost-user-blk" devices possible in both directions.

It might be useful for the cases when a slow block layer should be replaced
with a more performant one on running VM without stopping, i.e. with very low
downtime comparable with the one on migration.

It's possible to achive that for two reasons:

1.The VMStates of "virtio-blk" and "vhost-user-blk" are almost the same.
  They consist of the identical VMSTATE_VIRTIO_DEVICE and differs from
  each other in the values of migration service fields only.
2.The device driver used in the guest is the same: virtio-blk

The new type uses virtio-blk VMState instead of vhost-user-blk specific
VMstate, also it implements migration save/load callbacks to be compatible
with migration stream produced by "virtio-blk" device.

Adding the new vhost-user-blk type instead of modifying the existing one
is convenent. It ease to differ the new virtio-blk-compatible vhost-user-blk
device from the existing non-compatible one using qemu machinery without any
other modifiactions. That gives all the variety of qemu device related
constraints out of box.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
---
 hw/block/vhost-user-blk.c          | 63 ++++++++++++++++++++++++++++++
 include/hw/virtio/vhost-user-blk.h |  2 +
 2 files changed, 65 insertions(+)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index ba13cb87e520..877fe54e891f 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -30,6 +30,7 @@
 #include "hw/virtio/virtio-access.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
+#include "migration/qemu-file-types.h"
 
 #define REALIZE_CONNECTION_RETRIES 3
 
@@ -612,9 +613,71 @@ static const TypeInfo vhost_user_blk_info = {
     .class_init = vhost_user_blk_class_init,
 };
 
+/*
+ * this is the same as vmstate_virtio_blk
+ * we use it to allow virtio-blk <-> vhost-user-virtio-blk migration
+ */
+static const VMStateDescription vmstate_vhost_user_virtio_blk = {
+    .name = "virtio-blk",
+    .minimum_version_id = 2,
+    .version_id = 2,
+    .fields = (VMStateField[]) {
+        VMSTATE_VIRTIO_DEVICE,
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void vhost_user_virtio_blk_save(VirtIODevice *vdev, QEMUFile *f)
+{
+    /*
+     * put a zero byte in the stream to be compatible with virtio-blk
+     */
+    qemu_put_sbyte(f, 0);
+}
+
+static int vhost_user_virtio_blk_load(VirtIODevice *vdev, QEMUFile *f,
+                                      int version_id)
+{
+    if (qemu_get_sbyte(f)) {
+        /*
+         * on virtio-blk -> vhost-user-virtio-blk migration we don't expect
+         * to get any infilght requests in the migration stream because
+         * we can't load them yet.
+         * TODO: consider putting those inflight requests to inflight region
+         */
+        error_report("%s: can't load in-flight requests",
+                     TYPE_VHOST_USER_VIRTIO_BLK);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static void vhost_user_virtio_blk_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    /* override vmstate of vhost_user_blk */
+    dc->vmsd = &vmstate_vhost_user_virtio_blk;
+
+    /* adding callbacks to be compatible with virtio-blk migration stream */
+    vdc->save = vhost_user_virtio_blk_save;
+    vdc->load = vhost_user_virtio_blk_load;
+}
+
+static const TypeInfo vhost_user_virtio_blk_info = {
+    .name = TYPE_VHOST_USER_VIRTIO_BLK,
+    .parent = TYPE_VHOST_USER_BLK,
+    .instance_size = sizeof(VHostUserBlk),
+    /* instance_init is the same as in parent type */
+    .class_init = vhost_user_virtio_blk_class_init,
+};
+
 static void virtio_register_types(void)
 {
     type_register_static(&vhost_user_blk_info);
+    type_register_static(&vhost_user_virtio_blk_info);
 }
 
 type_init(virtio_register_types)
diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost-user-blk.h
index 7c91f15040eb..d81f18d22596 100644
--- a/include/hw/virtio/vhost-user-blk.h
+++ b/include/hw/virtio/vhost-user-blk.h
@@ -23,6 +23,8 @@
 #include "qom/object.h"
 
 #define TYPE_VHOST_USER_BLK "vhost-user-blk"
+#define TYPE_VHOST_USER_VIRTIO_BLK "vhost-user-virtio-blk"
+
 OBJECT_DECLARE_SIMPLE_TYPE(VHostUserBlk, VHOST_USER_BLK)
 
 #define VHOST_USER_BLK_AUTO_NUM_QUEUES UINT16_MAX
-- 
2.25.1


