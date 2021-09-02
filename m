Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C225C3FE9CF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:13:04 +0200 (CEST)
Received: from localhost ([::1]:52370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLguF-0003FL-Si
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiw-0001KT-6l
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:01:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgip-0008Ud-Fu
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630566074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CveArVIYmhyoj6c5Fi4UZZ4/p/tOfu6mARhUZq6eESQ=;
 b=TvdvEbKGR5neCYZ1td5WpHJBMMLEKNqLPFLIoMMOXpKz9JA3eKRmMseIAxXho2tW+SdP/z
 gsyponFJbm5p+5bKqyqk9MCY3PHmLzZ8GMP5wyeTi5hQgyp51TumMedlu3bDyV9N/GGjwW
 r4aKqiPy65hfx6G//jdpT4W4Aw+SJno=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-e513l6CnPiCe4-0-h083mw-1; Thu, 02 Sep 2021 03:01:14 -0400
X-MC-Unique: e513l6CnPiCe4-0-h083mw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so328889wma.4
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CveArVIYmhyoj6c5Fi4UZZ4/p/tOfu6mARhUZq6eESQ=;
 b=Bzl8g7KwptICodFNOnEWzxcji2/ea4G1AD3+9bHyWSKLXofvtHip1gQNPUNYZXp5B0
 S0YKRhpPd9GDVgSKXx0nAnG/JDV8ShCnWQPdCiFqGv/upx0KqhmeVC4lZscvoElSK9/y
 ngNtkgCOS4GHw+2pwVEOiYMbWMH+Cq6hFiKLI5kTzPpDaa1sGwGpi9lbMZ60kMurq8sH
 DNiPm4OZIMadLhxMH55deWl7nm8V7bin6I6syd7rR4gpm34TTIYdtqk7UNx6s9qdaxTo
 58qC+PGvfUyuFaee41x7DK6qCvlyzXAUnWVnPGphIOvMpdK5Ck4apCLQc9iH95ZGci+L
 /O0g==
X-Gm-Message-State: AOAM530QBfdunZJkrj8ex1lIgwMjC7zoB8Eq+MDu2JEKpPP4WM80/zKT
 0S2RzA4yO3hyZ61mb96Tsepil1ZiShFEkc9gXWpQSa8FBAGy86M9pWSOz7bGAU4mA05HgYFineC
 w5OstFBlqn7CJ0pGtaucG3VzFgxAqDw4oAmofX+hnon8f+GUuTJh6F6ZpFG37F6+U
X-Received: by 2002:adf:80eb:: with SMTP id 98mr1809821wrl.370.1630566072575; 
 Thu, 02 Sep 2021 00:01:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4cCgFXqYbqpIcYIDGgAkPdhj+JBLV5vosy8EkcujXb1DylNVuH1toQDPYsHXqMoUFzUH9OA==
X-Received: by 2002:adf:80eb:: with SMTP id 98mr1809790wrl.370.1630566072379; 
 Thu, 02 Sep 2021 00:01:12 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id u23sm778635wmc.24.2021.09.02.00.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 00:01:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/11] util/vfio-helpers: Let qemu_vfio_do_mapping()
 propagate Error
Date: Thu,  2 Sep 2021 09:00:24 +0200
Message-Id: <20210902070025.197072-11-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902070025.197072-1-philmd@redhat.com>
References: <20210902070025.197072-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass qemu_vfio_do_mapping() an Error* argument so it can propagate
any error to callers. Replace error_report() which only report
to the monitor by the more generic error_setg_errno().

Reviewed-by: Fam Zheng <fam@euphon.net>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 66148bd381c..00a80431a09 100644
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
@@ -772,7 +772,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
 
             mapping = qemu_vfio_add_mapping(s, host, size, index + 1, iova0);
             assert(qemu_vfio_verify_mappings(s));
-            ret = qemu_vfio_do_mapping(s, host, size, iova0);
+            ret = qemu_vfio_do_mapping(s, host, size, iova0, errp);
             if (ret < 0) {
                 qemu_vfio_undo_mapping(s, mapping, NULL);
                 return ret;
@@ -782,7 +782,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
             if (!qemu_vfio_find_temp_iova(s, size, &iova0, errp)) {
                 return -ENOMEM;
             }
-            ret = qemu_vfio_do_mapping(s, host, size, iova0);
+            ret = qemu_vfio_do_mapping(s, host, size, iova0, errp);
             if (ret < 0) {
                 return ret;
             }
-- 
2.31.1


