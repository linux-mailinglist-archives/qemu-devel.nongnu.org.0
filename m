Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CB2569CB1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:09:59 +0200 (CEST)
Received: from localhost ([::1]:40070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9MaE-0001XT-Mq
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLj-0002xR-0Z
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLg-0007Xo-TO
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657180496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lb02Zao7ZfGS2GKoxxaDVMTqi+ys9erL6eopfgoaY+Q=;
 b=RuVipyjqJ3QpxERnkTOkvZkgJu3GNJx+4/VQ32VbnPWFeFosq/cxwWhsrl4UEOKv+DKOnB
 i4sZK9WR5AqfVUjW2X4doTflpPX8cwwDsTEgwm//Q53swLfl/ys72rclVCWAY1kxjnR+dq
 1LrcHMgnd79uxvuWmh10qr9I58ahLR8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-kmWVM0AIMlKX1PeaB5sduQ-1; Thu, 07 Jul 2022 03:54:47 -0400
X-MC-Unique: kmWVM0AIMlKX1PeaB5sduQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F26FF101A586;
 Thu,  7 Jul 2022 07:54:46 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 068F540CFD0A;
 Thu,  7 Jul 2022 07:54:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org
Subject: [PULL 11/18] pc-bios/s390-ccw/virtio-blkdev: Request the right
 feature bits
Date: Thu,  7 Jul 2022 09:54:19 +0200
Message-Id: <20220707075426.1163210-12-thuth@redhat.com>
In-Reply-To: <20220707075426.1163210-1-thuth@redhat.com>
References: <20220707075426.1163210-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

The virtio-blk code uses the block size and geometry fields in the
config area. According to the virtio-spec, these have to be negotiated
with the right feature bits during initialization, otherwise they
might not be available. QEMU is so far very forgiving and always
provides them, but we should not rely on this behavior, so let's
better request them properly via the VIRTIO_BLK_F_GEOMETRY and
VIRTIO_BLK_F_BLK_SIZE feature bits.

Message-Id: <20220704111903.62400-11-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/virtio-blkdev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-ccw/virtio-blkdev.c
index c175b66a47..8271c47296 100644
--- a/pc-bios/s390-ccw/virtio-blkdev.c
+++ b/pc-bios/s390-ccw/virtio-blkdev.c
@@ -13,6 +13,9 @@
 #include "virtio.h"
 #include "virtio-scsi.h"
 
+#define VIRTIO_BLK_F_GEOMETRY   (1 << 4)
+#define VIRTIO_BLK_F_BLK_SIZE   (1 << 6)
+
 static int virtio_blk_read_many(VDev *vdev, ulong sector, void *load_addr,
                                 int sec_num)
 {
@@ -223,6 +226,7 @@ int virtio_blk_setup_device(SubChannelId schid)
 {
     VDev *vdev = virtio_get_device();
 
+    vdev->guest_features[0] = VIRTIO_BLK_F_GEOMETRY | VIRTIO_BLK_F_BLK_SIZE;
     vdev->schid = schid;
     virtio_setup_ccw(vdev);
 
-- 
2.31.1


