Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4A4613DDB
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 19:55:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opZug-0001cG-OV; Mon, 31 Oct 2022 14:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZu5-0001Cp-K9
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZu3-0003ku-SN
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667242375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nept1vz0xFGBfbWxI6LwgrRFU33FqGdn272TWraXgRU=;
 b=ei9W3nreYeddNo74Mf0sCsBKAcfJUfGRoJMziQNO8eZRqFXOyvm7icuy2vnm6aIK8P2cwJ
 sT7Vs9WwugxhiOJw4siiXAO8m9jiCHToB+3nnTO7AltDhLRramVuZvw6zRRMuq/UO+0YuP
 lynajd9SCj4g+wYIywRoRQm4vrK5M1s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-rlWDRHWMO4aNlSDkk6mKSQ-1; Mon, 31 Oct 2022 14:52:53 -0400
X-MC-Unique: rlWDRHWMO4aNlSDkk6mKSQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0ED2988434A;
 Mon, 31 Oct 2022 18:52:53 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F53340C6EC6;
 Mon, 31 Oct 2022 18:52:52 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Alberto Faria <afaria@redhat.com>
Subject: [PULL 1/3] block/blkio: Add virtio-blk-vfio-pci BlockDriver
Date: Mon, 31 Oct 2022 14:51:04 -0400
Message-Id: <20221031185106.28245-2-stefanha@redhat.com>
In-Reply-To: <20221031185106.28245-1-stefanha@redhat.com>
References: <20221031185106.28245-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Alberto Faria <afaria@redhat.com>

libblkio 1.1.0 [1] introduces a virtio-blk-vfio-pci driver, which
accesses a virtio-blk PCI device using VFIO. Add a corresponding
BlockDriver.

[1] https://gitlab.com/libblkio/libblkio/-/tree/v1.1.0

Signed-off-by: Alberto Faria <afaria@redhat.com>
Message-id: 20221028131635.710267-1-afaria@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qapi/block-core.json | 18 ++++++++++++++++++
 block/blkio.c        |  8 ++++++++
 2 files changed, 26 insertions(+)

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
-- 
2.38.1


