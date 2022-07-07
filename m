Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58816569C4F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 09:58:41 +0200 (CEST)
Received: from localhost ([::1]:50678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9MPI-00063a-CQ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 03:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLT-0002W9-5O
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLR-0007TW-AS
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657180480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KRBEF1DR360edHdSTsFv2CkqPvujE2dOHGo2GkdBu8g=;
 b=ecOg8Qho8635lx89YBs7Yg0ISPCgJjEfuLBTmn+clmoS39DyCmOMnoD3ad+b//LvVdA6tK
 ElfIrkODmkfgtnhWTH3zHMEHFqdw8ZihNxWVEcdtX1lc8uA/xkq47SxJVzX3jRJjLtO2Jd
 7Efr9YsJgzL+p6AYh2ayaANJzIkuTwY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-MKsxLwvfPkKsu5LvlbGTog-1; Thu, 07 Jul 2022 03:54:35 -0400
X-MC-Unique: MKsxLwvfPkKsu5LvlbGTog-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 269911C006B3;
 Thu,  7 Jul 2022 07:54:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD2E240CFD0A;
 Thu,  7 Jul 2022 07:54:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PULL 03/18] pc-bios/s390-ccw/virtio: Introduce a macro for the DASD
 block size
Date: Thu,  7 Jul 2022 09:54:11 +0200
Message-Id: <20220707075426.1163210-4-thuth@redhat.com>
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

Use VIRTIO_DASD_DEFAULT_BLOCK_SIZE instead of the magic value 4096.

Message-Id: <20220704111903.62400-3-thuth@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
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


