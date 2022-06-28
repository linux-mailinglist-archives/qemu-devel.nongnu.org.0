Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29EB55D6DF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:17:33 +0200 (CEST)
Received: from localhost ([::1]:44422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6B5w-0005ly-Ut
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzO-0004A6-3i
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzM-0008CP-Fi
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656421843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMIicO4yDew7/zf+cvNo9y8HU+zssfMRVMaa4uB70BE=;
 b=Xje6F/MjkPNj+7N7lK3jOP539v3cfKpTYZMSmilMvzmOFXzNdOb2pjGBM+qBl0gEPbDM5E
 4yDWhO91+rGwspD6rEqku6LT2C7U+oDQb+zt6KG2W/iwtQtI6wAnB2NPxfdVYwa/5JQ08Y
 O3ZyldcqcH8iai/9YayDBOq39qCghP8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-qGdzqe5wPMCmPpWgVChvjA-1; Tue, 28 Jun 2022 09:10:40 -0400
X-MC-Unique: qGdzqe5wPMCmPpWgVChvjA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67C68101A58D;
 Tue, 28 Jun 2022 13:10:40 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87FA0492C3B;
 Tue, 28 Jun 2022 13:10:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PATCH 05/12] pc-bios/s390-ccw/virtio-blkdev: Remove
 virtio_assume_scsi()
Date: Tue, 28 Jun 2022 15:10:25 +0200
Message-Id: <20220628131032.213986-6-thuth@redhat.com>
In-Reply-To: <20220628131032.213986-1-thuth@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
 pc-bios/s390-ccw/virtio.h        |  1 -
 pc-bios/s390-ccw/virtio-blkdev.c | 24 ------------------------
 2 files changed, 25 deletions(-)

diff --git a/pc-bios/s390-ccw/virtio.h b/pc-bios/s390-ccw/virtio.h
index 8f917d47a9..303438f159 100644
--- a/pc-bios/s390-ccw/virtio.h
+++ b/pc-bios/s390-ccw/virtio.h
@@ -182,7 +182,6 @@ enum guessed_disk_nature_type {
 typedef enum guessed_disk_nature_type VirtioGDN;
 
 VirtioGDN virtio_guessed_disk_nature(void);
-void virtio_assume_scsi(void);
 void virtio_assume_eckd(void);
 void virtio_assume_iso9660(void);
 
diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-ccw/virtio-blkdev.c
index b14cbc3d9e..11820754f3 100644
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


