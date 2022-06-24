Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F16559649
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:18:45 +0200 (CEST)
Received: from localhost ([::1]:45672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fSe-0004gT-GR
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4f1l-0004SB-56
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:50:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4f1h-0000cl-Mk
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656060653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=55hGLXhOR2nDCAeVvl7yrXQsnj+f1eWR4ThmVybT+g4=;
 b=iSe1HSMBlW5tjFxj4CEsx5Y9lcmUawxEEEfQWuTzY0/HYORblgXkzAJMZf3Dc2wMJ4rzTx
 PieHqdFSmtXISj0Z9QD9He4YmLIHM/BUKrjGGCn3zTzXmpTs9C7hUDZTk1iTNcCSrB0CVK
 unSpDi2CffhgbLN8MSPLlDszk4jvGE8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-w_OGnBK3MAywTInPH4U8Zw-1; Fri, 24 Jun 2022 04:50:50 -0400
X-MC-Unique: w_OGnBK3MAywTInPH4U8Zw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5E981044561;
 Fri, 24 Jun 2022 08:50:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC2B0416171;
 Fri, 24 Jun 2022 08:50:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org,
	Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH 2/2] pc-bios/s390-ccw/virtio-blkdev: Remove
 virtio_assume_scsi()
Date: Fri, 24 Jun 2022 10:50:37 +0200
Message-Id: <20220624085037.612235-3-thuth@redhat.com>
In-Reply-To: <20220624085037.612235-1-thuth@redhat.com>
References: <20220624085037.612235-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

The virtio_assume_scsi() function is very questionable: First, it
is only called for virtio-blk, and not for virtio-scsi, so the naming
is already quite confusing. Second, it is called if we detected a
"invalid" IPL disk, trying to fix it by blindly setting a sector
size of 512. This of course won't work in most cases since disks
might have a different sector size for a reason.

Thus let's remove this strange function now. The calling code can
also be removed completely, since there is another spot in main.c
that does "IPL_assert(virtio_ipl_disk_is_valid(), ...)" to make
sure that we do not try to IPL from an invalid device.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/virtio-blkdev.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-ccw/virtio-blkdev.c
index b5506bb29d..9ba28c6f54 100644
--- a/pc-bios/s390-ccw/virtio-blkdev.c
+++ b/pc-bios/s390-ccw/virtio-blkdev.c
@@ -112,23 +112,6 @@ VirtioGDN virtio_guessed_disk_nature(void)
     return virtio_get_device()->guessed_disk_nature;
 }
 
-void virtio_assume_scsi(void)
-{
-    VDev *vdev = virtio_get_device();
-
-    switch (vdev->senseid.cu_model) {
-    case VIRTIO_ID_BLOCK:
-        vdev->guessed_disk_nature = VIRTIO_GDN_SCSI;
-        vdev->config.blk.blk_size = VIRTIO_SCSI_BLOCK_SIZE;
-        vdev->config.blk.physical_block_exp = 0;
-        vdev->blk_factor = 1;
-        break;
-    case VIRTIO_ID_SCSI:
-        vdev->scsi_block_size = VIRTIO_SCSI_BLOCK_SIZE;
-        break;
-    }
-}
-
 void virtio_assume_iso9660(void)
 {
     VDev *vdev = virtio_get_device();
@@ -247,13 +230,6 @@ int virtio_blk_setup_device(SubChannelId schid)
     switch (vdev->senseid.cu_model) {
     case VIRTIO_ID_BLOCK:
         sclp_print("Using virtio-blk.\n");
-        if (!virtio_ipl_disk_is_valid()) {
-            /* make sure all getters but blocksize return 0 for
-             * invalid IPL disk
-             */
-            memset(&vdev->config.blk, 0, sizeof(vdev->config.blk));
-            virtio_assume_scsi();
-        }
         break;
     case VIRTIO_ID_SCSI:
         IPL_assert(vdev->config.scsi.sense_size == VIRTIO_SCSI_SENSE_SIZE,
-- 
2.31.1


