Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FDE56538A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 13:32:34 +0200 (CEST)
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8KJd-0005Aa-PM
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 07:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8K71-0005Ki-GO
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8K6z-0006Bd-Ur
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656933569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SlRGPnIUys9DZlFlBUzlEZyOS18xHUancL7tVyGiXDE=;
 b=Gc6dysZkabue0TfiUb2X/nY+WdTv+Nug4OAulevwc9RSJg6xGjUuk8ATGSRPLdHspGLH2G
 WZNU6bfABmA0HL6vzjMlVuYDHF2QDMrQ3hGhSkPvofV/pVXpPfbtB3VPB8Qr0E82pU+hFH
 UgW0DAM0i79/FpXYKNQU40hdC3FCd00=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-PEisRZZpOsqzhifgM4LNjA-1; Mon, 04 Jul 2022 07:19:25 -0400
X-MC-Unique: PEisRZZpOsqzhifgM4LNjA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0746D3800C26;
 Mon,  4 Jul 2022 11:19:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7D0B111F5;
 Mon,  4 Jul 2022 11:19:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org,
	Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 10/12] pc-bios/s390-ccw/virtio-blkdev: Request the right
 feature bits
Date: Mon,  4 Jul 2022 13:19:01 +0200
Message-Id: <20220704111903.62400-11-thuth@redhat.com>
In-Reply-To: <20220704111903.62400-1-thuth@redhat.com>
References: <20220704111903.62400-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The virtio-blk code uses the block size and geometry fields in the
config area. According to the virtio-spec, these have to be negotiated
with the right feature bits during initialization, otherwise they
might not be available. QEMU is so far very forgiving and always
provides them, but we should not rely on this behavior, so let's
better request them properly via the VIRTIO_BLK_F_GEOMETRY and
VIRTIO_BLK_F_BLK_SIZE feature bits.

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


