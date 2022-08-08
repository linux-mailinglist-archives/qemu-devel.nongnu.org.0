Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEEA58C2B1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 07:08:03 +0200 (CEST)
Received: from localhost ([::1]:50702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKuzh-0007Ot-Lf
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 01:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKuxE-0003b5-Ah
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:05:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKuxC-0001LS-Hf
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659935125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zmj30+CXON8xCJp3OWQkxjilFKmifFXx8ZQSpn/6NV4=;
 b=Vd+u8elR6U1aqzT5cvOUXPn1S7PsHgg6iHB0MosCV3wSeU7eAmkKyQVUKDqOGCRuN19rQ8
 5wOpWVG3oDbNcZaeXT22i8rl/rG9ya/OIW5vR8Xj5HwumXpb8Y4joaAwekzTwyITCoQhR0
 RLU8dXaWkHuf4lERGi4TxN9snF7h1/w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-eo61kUTaPu-DFLpEMhaXdw-1; Mon, 08 Aug 2022 01:05:20 -0400
X-MC-Unique: eo61kUTaPu-DFLpEMhaXdw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7BC380391B;
 Mon,  8 Aug 2022 05:05:19 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F163C492C3B;
 Mon,  8 Aug 2022 05:05:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: [PULL 1/4] pc-bios/s390-ccw: Fix booting with logical block size <
 physical block size
Date: Mon,  8 Aug 2022 07:05:12 +0200
Message-Id: <20220808050515.1283174-2-thuth@redhat.com>
In-Reply-To: <20220808050515.1283174-1-thuth@redhat.com>
References: <20220808050515.1283174-1-thuth@redhat.com>
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

For accessing single blocks during boot, it's the logical block size that
matters. (Physical block sizes are rather interesting e.g. for creating
file systems with the correct alignment for speed reasons etc.).
So the s390-ccw bios has to use the logical block size for calculating
sector numbers during the boot phase, the "physical_block_exp" shift
value must not be taken into account. This change fixes the boot process
when the guest hast been installed on a disk where the logical block size
differs from the physical one, e.g. if the guest has been installed
like this:

 qemu-system-s390x -nographic -accel kvm -m 2G \
  -drive if=none,id=d1,file=fedora.iso,format=raw,media=cdrom \
  -device virtio-scsi -device scsi-cd,drive=d1 \
  -drive if=none,id=d2,file=test.qcow2,format=qcow2
  -device virtio-blk,drive=d2,physical_block_size=4096,logical_block_size=512

Linux correctly uses the logical block size of 512 for the installation,
but the s390-ccw bios tries to boot from a disk with 4096 block size so
far, as long as this patch has not been applied yet (well, it used to work
by accident in the past due to the virtio_assume_scsi() hack that used to
enforce 512 byte sectors on all virtio-block disks, but that hack has been
well removed in commit 5447de2619050a0a4d to fix other scenarios).

Fixes: 5447de2619 ("pc-bios/s390-ccw/virtio-blkdev: Remove virtio_assume_scsi()")
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2112303
Message-Id: <20220805094214.285223-1-thuth@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/virtio-blkdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-ccw/virtio-blkdev.c
index 8271c47296..794f99b42c 100644
--- a/pc-bios/s390-ccw/virtio-blkdev.c
+++ b/pc-bios/s390-ccw/virtio-blkdev.c
@@ -173,7 +173,7 @@ int virtio_get_block_size(void)
 
     switch (vdev->senseid.cu_model) {
     case VIRTIO_ID_BLOCK:
-        return vdev->config.blk.blk_size << vdev->config.blk.physical_block_exp;
+        return vdev->config.blk.blk_size;
     case VIRTIO_ID_SCSI:
         return vdev->scsi_block_size;
     }
-- 
2.31.1


