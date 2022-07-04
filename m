Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687BF56532C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 13:21:55 +0200 (CEST)
Received: from localhost ([::1]:54364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8K9J-0007bW-C6
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 07:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8K6k-0004gU-Qu
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:19:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8K6i-00067X-Qg
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656933552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TTp4lGUtkHqYHBhS8voihx3ydO/ZWv4mIqTL6n8WAfU=;
 b=WZzA98jmTxFQ2u/CzVo0Fd2FWE7sqpi0gav+H2AE8hIiDdIW9jxBwmm9W5MATU/R0DHA+/
 1qw1uk5fJDT6EAog/8dUK0QmAXJ/kRb0c6g+vxiZJJkUjHzthVD5kMZwX8kwGc9FW1ETVo
 YQDVnI+zOIu95wCqWMD70XZBb1wmM+g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-yXOcFa-cOGaQXenwtqEN0g-1; Mon, 04 Jul 2022 07:19:11 -0400
X-MC-Unique: yXOcFa-cOGaQXenwtqEN0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE260185A7B2;
 Mon,  4 Jul 2022 11:19:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 582DF9D63;
 Mon,  4 Jul 2022 11:19:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org,
	Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 02/12] pc-bios/s390-ccw/virtio: Introduce a macro for the
 DASD block size
Date: Mon,  4 Jul 2022 13:18:53 +0200
Message-Id: <20220704111903.62400-3-thuth@redhat.com>
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

Use VIRTIO_DASD_DEFAULT_BLOCK_SIZE instead of the magic value 4096.

Reviewed-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/virtio.h        | 1 +
 pc-bios/s390-ccw/virtio-blkdev.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/pc-bios/s390-ccw/virtio.h b/pc-bios/s390-ccw/virtio.h
index 19fceb6495..9e410bde6f 100644
--- a/pc-bios/s390-ccw/virtio.h
+++ b/pc-bios/s390-ccw/virtio.h
@@ -198,6 +198,7 @@ extern int virtio_read_many(ulong sector, void *load_addr, int sec_num);
 #define VIRTIO_SECTOR_SIZE 512
 #define VIRTIO_ISO_BLOCK_SIZE 2048
 #define VIRTIO_SCSI_BLOCK_SIZE 512
+#define VIRTIO_DASD_DEFAULT_BLOCK_SIZE 4096
 
 static inline ulong virtio_sector_adjust(ulong sector)
 {
diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-ccw/virtio-blkdev.c
index 7d35050292..6483307630 100644
--- a/pc-bios/s390-ccw/virtio-blkdev.c
+++ b/pc-bios/s390-ccw/virtio-blkdev.c
@@ -155,7 +155,7 @@ void virtio_assume_eckd(void)
     vdev->config.blk.physical_block_exp = 0;
     switch (vdev->senseid.cu_model) {
     case VIRTIO_ID_BLOCK:
-        vdev->config.blk.blk_size = 4096;
+        vdev->config.blk.blk_size = VIRTIO_DASD_DEFAULT_BLOCK_SIZE;
         break;
     case VIRTIO_ID_SCSI:
         vdev->config.blk.blk_size = vdev->scsi_block_size;
-- 
2.31.1


