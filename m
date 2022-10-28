Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCD5611286
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:19:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPEz-0006cm-Rf; Fri, 28 Oct 2022 09:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ooPEb-0006Uu-FH
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:17:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ooPEZ-0004YW-I0
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=BFsjf3WN/U56cMeI/58uCwxW18d1K8/0mQR+BTkJKNg=;
 b=VAJG4ugjl00dozORnJv1OWdb1IZUeSc05Kggr13shqwhIOHmIrL+J3ATlmldFFpFWAOUli
 LlEqoDqprF+IwqVJ6emtLs50k+Qmkuv7MweHiKkB+W7H197XL7SlqC1HSJbIpC1q5cTh+I
 ODJHunPmymZ2+gmq3/7oAjwu+ZkjhKw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-HincVAoTNtStx6Z6e34Wuw-1; Fri, 28 Oct 2022 09:17:13 -0400
X-MC-Unique: HincVAoTNtStx6Z6e34Wuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 882051C1A577;
 Fri, 28 Oct 2022 13:16:57 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DFBB4024A62;
 Fri, 28 Oct 2022 13:16:35 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Alberto Faria <afaria@redhat.com>
Subject: [PATCH] block/blkio: Add virtio-blk-vfio-pci BlockDriver
Date: Fri, 28 Oct 2022 14:16:35 +0100
Message-Id: <20221028131635.710267-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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

libblkio 1.1.0 [1] introduces a virtio-blk-vfio-pci driver, which
accesses a virtio-blk PCI device using VFIO. Add a corresponding
BlockDriver.

[1] https://gitlab.com/libblkio/libblkio/-/tree/v1.1.0

Signed-off-by: Alberto Faria <afaria@redhat.com>
---

This is dependent on a pending libblkio fix [2], so we may want to wait
for a new libblkio release before queueing this.

[2] https://gitlab.com/libblkio/libblkio/-/merge_requests/140

 block/blkio.c        |  8 ++++++++
 qapi/block-core.json | 18 ++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/block/blkio.c b/block/blkio.c
index 82f26eedd2..f55eb774b4 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -25,6 +25,7 @@
  */
 #define DRIVER_IO_URING "io_uring"
 #define DRIVER_NVME_IO_URING "nvme-io_uring"
+#define DRIVER_VIRTIO_BLK_VFIO_PCI "virtio-blk-vfio-pci"
 #define DRIVER_VIRTIO_BLK_VHOST_USER "virtio-blk-vhost-user"
 #define DRIVER_VIRTIO_BLK_VHOST_VDPA "virtio-blk-vhost-vdpa"
 
@@ -704,6 +705,8 @@ static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
         ret = blkio_io_uring_open(bs, options, flags, errp);
     } else if (strcmp(blkio_driver, DRIVER_NVME_IO_URING) == 0) {
         ret = blkio_nvme_io_uring(bs, options, flags, errp);
+    } else if (strcmp(blkio_driver, DRIVER_VIRTIO_BLK_VFIO_PCI) == 0) {
+        ret = blkio_virtio_blk_common_open(bs, options, flags, errp);
     } else if (strcmp(blkio_driver, DRIVER_VIRTIO_BLK_VHOST_USER) == 0) {
         ret = blkio_virtio_blk_common_open(bs, options, flags, errp);
     } else if (strcmp(blkio_driver, DRIVER_VIRTIO_BLK_VHOST_VDPA) == 0) {
@@ -989,6 +992,10 @@ static BlockDriver bdrv_nvme_io_uring = BLKIO_DRIVER(
     .bdrv_needs_filename = true,
 );
 
+static BlockDriver bdrv_virtio_blk_vfio_pci = BLKIO_DRIVER(
+    DRIVER_VIRTIO_BLK_VFIO_PCI
+);
+
 static BlockDriver bdrv_virtio_blk_vhost_user = BLKIO_DRIVER(
     DRIVER_VIRTIO_BLK_VHOST_USER
 );
@@ -1001,6 +1008,7 @@ static void bdrv_blkio_init(void)
 {
     bdrv_register(&bdrv_io_uring);
     bdrv_register(&bdrv_nvme_io_uring);
+    bdrv_register(&bdrv_virtio_blk_vfio_pci);
     bdrv_register(&bdrv_virtio_blk_vhost_user);
     bdrv_register(&bdrv_virtio_blk_vhost_vdpa);
 }
diff --git a/qapi/block-core.json b/qapi/block-core.json
index cb5079e645..81bbb0b893 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2960,6 +2960,7 @@
             'raw', 'rbd',
             { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
             'ssh', 'throttle', 'vdi', 'vhdx',
+            { 'name': 'virtio-blk-vfio-pci', 'if': 'CONFIG_BLKIO' },
             { 'name': 'virtio-blk-vhost-user', 'if': 'CONFIG_BLKIO' },
             { 'name': 'virtio-blk-vhost-vdpa', 'if': 'CONFIG_BLKIO' },
             'vmdk', 'vpc', 'vvfat' ] }
@@ -3711,6 +3712,20 @@
   'data': { 'filename': 'str' },
   'if': 'CONFIG_BLKIO' }
 
+##
+# @BlockdevOptionsVirtioBlkVfioPci:
+#
+# Driver specific block device options for the virtio-blk-vfio-pci backend.
+#
+# @path: path to the PCI device's sysfs directory (e.g.
+#        /sys/bus/pci/devices/0000:00:01.0).
+#
+# Since: 7.2
+##
+{ 'struct': 'BlockdevOptionsVirtioBlkVfioPci',
+  'data': { 'path': 'str' },
+  'if': 'CONFIG_BLKIO' }
+
 ##
 # @BlockdevOptionsVirtioBlkVhostUser:
 #
@@ -4390,6 +4405,9 @@
       'throttle':   'BlockdevOptionsThrottle',
       'vdi':        'BlockdevOptionsGenericFormat',
       'vhdx':       'BlockdevOptionsGenericFormat',
+      'virtio-blk-vfio-pci':
+                    { 'type': 'BlockdevOptionsVirtioBlkVfioPci',
+                      'if': 'CONFIG_BLKIO' },
       'virtio-blk-vhost-user':
                     { 'type': 'BlockdevOptionsVirtioBlkVhostUser',
                       'if': 'CONFIG_BLKIO' },
-- 
2.37.3


