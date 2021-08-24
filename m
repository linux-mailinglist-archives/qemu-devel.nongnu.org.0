Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DA53F6015
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:20:41 +0200 (CEST)
Received: from localhost ([::1]:47856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXI2-0002vo-PX
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIXAD-0005qw-M3
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIXAA-0005YA-OA
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629814346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjVPj1eNKTQy5fwjblCd47XbInf1YqiKgdyKZG3IkLI=;
 b=MQQIpC/iZifnhRzTZrXVzwuV3oOVeOABBsA3A+ExtQsdRDFjynl/v7bodI7WJDixJQiWMX
 MmIUk1kCGw3ydhbrSF1r1Kb+9cwKpnuGKadR+KeQ5PZgiQt+dWlzYy39nQN0Hw5+qCkqgo
 skyy8sPgVVD9JxMjU5Uq9sLjXA11AZg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-v5xl1aWSNCiLTwoYzzHuXw-1; Tue, 24 Aug 2021 10:12:25 -0400
X-MC-Unique: v5xl1aWSNCiLTwoYzzHuXw-1
Received: by mail-wr1-f71.google.com with SMTP id
 h14-20020a056000000e00b001575b00eb08so1164247wrx.13
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wjVPj1eNKTQy5fwjblCd47XbInf1YqiKgdyKZG3IkLI=;
 b=ArlqFC4flWhOoiHsCIyD1HvKvXarClxeXNpbI7RGme+8ygr7Bhlng/qWuB9Igy9QMX
 OV91BWP0RT1mQBMszepY9ojH0mLmXAwnybKLQEEldqamHLzTl2P6QYKwDM9rZloZNKHe
 02472gUQlSxTlL1Px6izyh734+rqnPP1cOnZ/PVY7EHOTSzgOo0OwsZiY0vM4zZ+gvYO
 BFLj2nGNQ2OR9MpQWZ1bUu4Zj4+/1EyEY/YzEko/foeWfjV5yPLOrb1KDA7DoNzo8uF9
 NfUGcr68GrU/NrugEcrsgfaNK2QQFwhlufd/ZSniFzkmuHxtaH1lh5uS67uFqHgfxJ3w
 IL+Q==
X-Gm-Message-State: AOAM532ptqPlgXXchR1eIIcb2xw3vAq3qLj+AiCo6jcaClMviuTSBfga
 +pzy26DAWUwOg6jCkqvz9IKKdFzBHxhncK0XwhOr1OYWKViSZT5m7pfye+pq5RLTV3oxG2D9rfs
 p0/G0bGdPRmLDTZQ5dBzpI68nEQp7BKWZkxLHPGJIrCZwcZ0+exJRC1V72Y+xi9t6
X-Received: by 2002:a05:600c:21cd:: with SMTP id
 x13mr4267530wmj.20.1629814343523; 
 Tue, 24 Aug 2021 07:12:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeTRBh+ImxKQMXSnT8/PwHAp10tnbMe29s11g353WVUeJV4jEUnq+F+UxzVXH7Q/QPtR6DeQ==
X-Received: by 2002:a05:600c:21cd:: with SMTP id
 x13mr4267507wmj.20.1629814343368; 
 Tue, 24 Aug 2021 07:12:23 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 z2sm2390454wma.45.2021.08.24.07.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:12:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] util/vfio-helpers: Let qemu_vfio_do_mapping() propagate
 Error
Date: Tue, 24 Aug 2021 16:11:41 +0200
Message-Id: <20210824141142.1165291-9-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824141142.1165291-1-philmd@redhat.com>
References: <20210824141142.1165291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass qemu_vfio_do_mapping() an Error* argument so it can propagate
any error to callers. Replace error_report() which only report
to the monitor by the more generic error_setg_errno().

Reviewed-by: Fam Zheng <fam@euphon.net>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index f4c16e1dae5..613f3db3745 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -610,7 +610,7 @@ static IOVAMapping *qemu_vfio_add_mapping(QEMUVFIOState *s,
 
 /* Do the DMA mapping with VFIO. */
 static int qemu_vfio_do_mapping(QEMUVFIOState *s, void *host, size_t size,
-                                uint64_t iova)
+                                uint64_t iova, Error **errp)
 {
     struct vfio_iommu_type1_dma_map dma_map = {
         .argsz = sizeof(dma_map),
@@ -622,7 +622,7 @@ static int qemu_vfio_do_mapping(QEMUVFIOState *s, void *host, size_t size,
     trace_qemu_vfio_do_mapping(s, host, iova, size);
 
     if (ioctl(s->container, VFIO_IOMMU_MAP_DMA, &dma_map)) {
-        error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
+        error_setg_errno(errp, errno, "VFIO_MAP_DMA failed");
         return -errno;
     }
     return 0;
@@ -755,7 +755,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
 
             mapping = qemu_vfio_add_mapping(s, host, size, index + 1, iova0);
             assert(qemu_vfio_verify_mappings(s));
-            ret = qemu_vfio_do_mapping(s, host, size, iova0);
+            ret = qemu_vfio_do_mapping(s, host, size, iova0, errp);
             if (ret < 0) {
                 qemu_vfio_undo_mapping(s, mapping, NULL);
                 return ret;
@@ -766,7 +766,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
                 error_setg(errp, "iova range not found");
                 return -ENOMEM;
             }
-            ret = qemu_vfio_do_mapping(s, host, size, iova0);
+            ret = qemu_vfio_do_mapping(s, host, size, iova0, errp);
             if (ret < 0) {
                 return ret;
             }
-- 
2.31.1


