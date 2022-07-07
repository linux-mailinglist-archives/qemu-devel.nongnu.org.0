Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C1569C4D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 09:58:20 +0200 (CEST)
Received: from localhost ([::1]:50102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9MOw-0005ap-Lp
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 03:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLT-0002Wu-Tc
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLS-0007Ti-A6
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657180481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eW8tSnbUfFa7XU7Jv4TObIzh9o6O0ZI2mL9Ltg3gE6c=;
 b=Ky3eVkhtR/W9y9FAgCcVSDnOUgn17Sq/Has0uGGIH8P73/pwixnq7py0Vyrvs8OswtySfR
 yevRHEn3uvAhr9mTKspWsiFn8cKm1W2oYAfRCNmkh/qkXE8Q3Pxq5L4lDdGJBJsBvij8HD
 QdGVvQgz+ltaLtWdK63nThAZfqC89ww=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-yT_3L09COnG86a_K8Ih3Uw-1; Thu, 07 Jul 2022 03:54:38 -0400
X-MC-Unique: yT_3L09COnG86a_K8Ih3Uw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E88BF811E76;
 Thu,  7 Jul 2022 07:54:37 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 846C1400DFA6;
 Thu,  7 Jul 2022 07:54:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org,
	Eric Farman <farman@linux.ibm.com>
Subject: [PULL 05/18] pc-bios/s390-ccw/virtio-blkdev: Simplify/fix
 virtio_ipl_disk_is_valid()
Date: Thu,  7 Jul 2022 09:54:13 +0200
Message-Id: <20220707075426.1163210-6-thuth@redhat.com>
In-Reply-To: <20220707075426.1163210-1-thuth@redhat.com>
References: <20220707075426.1163210-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The s390-ccw bios fails to boot if the boot disk is a virtio-blk
disk with a sector size of 4096. For example:

 dasdfmt -b 4096 -d cdl -y -p -M quick /dev/dasdX
 fdasd -a /dev/dasdX
 install a guest onto /dev/dasdX1 using virtio-blk
 qemu-system-s390x -nographic -hda /dev/dasdX1

The bios then bails out with:

 ! Cannot read block 0 !

Looking at virtio_ipl_disk_is_valid() and especially the function
virtio_disk_is_scsi(), it does not really make sense that we expect
only such a limited disk geometry (like a block size of 512) for
our boot disks. Let's relax the check and allow everything that
remotely looks like a sane disk.

Message-Id: <20220704111903.62400-5-thuth@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/virtio.h        |  2 --
 pc-bios/s390-ccw/virtio-blkdev.c | 41 ++++++--------------------------
 2 files changed, 7 insertions(+), 36 deletions(-)

diff --git a/pc-bios/s390-ccw/virtio.h b/pc-bios/s390-ccw/virtio.h
index 9e410bde6f..241730effe 100644
--- a/pc-bios/s390-ccw/virtio.h
+++ b/pc-bios/s390-ccw/virtio.h
@@ -186,8 +186,6 @@ void virtio_assume_scsi(void);
 void virtio_assume_eckd(void);
 void virtio_assume_iso9660(void);
 
-extern bool virtio_disk_is_scsi(void);
-extern bool virtio_disk_is_eckd(void);
 extern bool virtio_ipl_disk_is_valid(void);
 extern int virtio_get_block_size(void);
 extern uint8_t virtio_get_heads(void);
diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-ccw/virtio-blkdev.c
index 6483307630..7e13155589 100644
--- a/pc-bios/s390-ccw/virtio-blkdev.c
+++ b/pc-bios/s390-ccw/virtio-blkdev.c
@@ -166,46 +166,19 @@ void virtio_assume_eckd(void)
         virtio_eckd_sectors_for_block_size(vdev->config.blk.blk_size);
 }
 
-bool virtio_disk_is_scsi(void)
-{
-    VDev *vdev = virtio_get_device();
-
-    if (vdev->guessed_disk_nature == VIRTIO_GDN_SCSI) {
-        return true;
-    }
-    switch (vdev->senseid.cu_model) {
-    case VIRTIO_ID_BLOCK:
-        return (vdev->config.blk.geometry.heads == 255)
-            && (vdev->config.blk.geometry.sectors == 63)
-            && (virtio_get_block_size()  == VIRTIO_SCSI_BLOCK_SIZE);
-    case VIRTIO_ID_SCSI:
-        return true;
-    }
-    return false;
-}
-
-bool virtio_disk_is_eckd(void)
+bool virtio_ipl_disk_is_valid(void)
 {
+    int blksize = virtio_get_block_size();
     VDev *vdev = virtio_get_device();
-    const int block_size = virtio_get_block_size();
 
-    if (vdev->guessed_disk_nature == VIRTIO_GDN_DASD) {
+    if (vdev->guessed_disk_nature == VIRTIO_GDN_SCSI ||
+        vdev->guessed_disk_nature == VIRTIO_GDN_DASD) {
         return true;
     }
-    switch (vdev->senseid.cu_model) {
-    case VIRTIO_ID_BLOCK:
-        return (vdev->config.blk.geometry.heads == 15)
-            && (vdev->config.blk.geometry.sectors ==
-                virtio_eckd_sectors_for_block_size(block_size));
-    case VIRTIO_ID_SCSI:
-        return false;
-    }
-    return false;
-}
 
-bool virtio_ipl_disk_is_valid(void)
-{
-    return virtio_disk_is_scsi() || virtio_disk_is_eckd();
+    return (vdev->senseid.cu_model == VIRTIO_ID_BLOCK ||
+            vdev->senseid.cu_model == VIRTIO_ID_SCSI) &&
+           blksize >= 512 && blksize <= 4096;
 }
 
 int virtio_get_block_size(void)
-- 
2.31.1


