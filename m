Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9587755D6C7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:17:25 +0200 (CEST)
Received: from localhost ([::1]:44224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6B5o-0005db-Ih
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzM-00046U-LN
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzK-0008Bb-PI
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656421842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IGrzPY8aGqDPPSEmgORDb+GlGw8RyeR1f3wjZ7kUTcc=;
 b=YwEtEJ5pD5wvQEKAlMW8GL68LG3uiR76Jr5/Ogm85hqoBeE5+up8EQg3KphG8ZlTruBRyx
 L2G+fDgIlAx2eP2gHGP41pJEr9KhvxMSSzzeJcnFO2DWTj+GGID/AdzTZv3a2SC2u2cX0a
 q1+4u53C+FVSec4jIm5bQqkstDdi2Sg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-VX24reZTNv6hAkFy8DX0Nw-1; Tue, 28 Jun 2022 09:10:37 -0400
X-MC-Unique: VX24reZTNv6hAkFy8DX0Nw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 304031C08969;
 Tue, 28 Jun 2022 13:10:37 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 048A0492C3B;
 Tue, 28 Jun 2022 13:10:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PATCH 02/12] pc-bios/s390-ccw/virtio: Introduce a macro for the DASD
 block size
Date: Tue, 28 Jun 2022 15:10:22 +0200
Message-Id: <20220628131032.213986-3-thuth@redhat.com>
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

Use VIRTIO_DASD_BLOCK_SIZE instead of the magic value 4096.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/virtio.h        | 1 +
 pc-bios/s390-ccw/virtio-blkdev.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/pc-bios/s390-ccw/virtio.h b/pc-bios/s390-ccw/virtio.h
index 19fceb6495..c2c17c29ca 100644
--- a/pc-bios/s390-ccw/virtio.h
+++ b/pc-bios/s390-ccw/virtio.h
@@ -198,6 +198,7 @@ extern int virtio_read_many(ulong sector, void *load_addr, int sec_num);
 #define VIRTIO_SECTOR_SIZE 512
 #define VIRTIO_ISO_BLOCK_SIZE 2048
 #define VIRTIO_SCSI_BLOCK_SIZE 512
+#define VIRTIO_DASD_BLOCK_SIZE 4096
 
 static inline ulong virtio_sector_adjust(ulong sector)
 {
diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-ccw/virtio-blkdev.c
index 7d35050292..49ed2b4bee 100644
--- a/pc-bios/s390-ccw/virtio-blkdev.c
+++ b/pc-bios/s390-ccw/virtio-blkdev.c
@@ -155,7 +155,7 @@ void virtio_assume_eckd(void)
     vdev->config.blk.physical_block_exp = 0;
     switch (vdev->senseid.cu_model) {
     case VIRTIO_ID_BLOCK:
-        vdev->config.blk.blk_size = 4096;
+        vdev->config.blk.blk_size = VIRTIO_DASD_BLOCK_SIZE;
         break;
     case VIRTIO_ID_SCSI:
         vdev->config.blk.blk_size = vdev->scsi_block_size;
-- 
2.31.1


