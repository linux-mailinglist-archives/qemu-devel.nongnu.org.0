Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB06A3F8F63
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 22:00:52 +0200 (CEST)
Received: from localhost ([::1]:48400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLYM-0006kj-Mz
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 16:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLP4-000648-KU
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:51:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLP2-0003Mj-5S
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630007465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bIzUg2n6cWwWuyxJa1hqTDlzAZlGw1TJMvDOruqrhIU=;
 b=gMRidvcnLTNxILEOGBIwcnFV4+cfOI/QMus2jRP5njxl1o1x3UfCY6GFCdiDqEXLhCB/aM
 vy1rUBNK/OGT6umR+zsBiENfEgmFiyJJ7Rt8IaDEPjbE6Hsx9cZNtfADuLh8rh3vejcF8h
 4hj5QY02HqlWqeDCRewqZjVF0T8DJDQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-5r6s8bnkNfCRPnNtDJSdkg-1; Thu, 26 Aug 2021 15:51:04 -0400
X-MC-Unique: 5r6s8bnkNfCRPnNtDJSdkg-1
Received: by mail-wr1-f72.google.com with SMTP id
 p1-20020adfcc81000000b001576cccf12cso1214877wrj.6
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 12:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bIzUg2n6cWwWuyxJa1hqTDlzAZlGw1TJMvDOruqrhIU=;
 b=APIhWluheJC0gzUC6kYAlYli/FJ1riiqGMmrw2LjLV9+c0bEoXHHaFOWcpq20PP+DV
 bDD6Yb0rbsSdZ2xXLQA/L1mlahCvfRmPW3RWib/4Uvu6qCfvomF8ykr4S06KiDLiO4KS
 eews2Ir5eoIfEof2gKpKBPbqdbOjg7DKrO/NpnoAg/TRgSc7CJ2XcBZkFjnbvbIUvePc
 MLKsT/ObNn5vWwmcrbR2ITVbrTgYHq/ERo8TA7jvJTG59VCe/r8mPmMFnvdlxZ534+Is
 Mjz36J3PzhKAolLpM6fJAq3NmuuT43eXnflZtD9J2W3/M4OscrUt/Cqh7kxTjfQ3pMoZ
 dQ7Q==
X-Gm-Message-State: AOAM530sEw+cvH/bFRf6lDYTsCiI2a09w17+AP5SfsQz6E++k18P/W3w
 mmK1vxd1N+nTzcBxwl4J4LSzNJX5o8J82ibasSghat4eoknirL5ct2C/MGYktplb8bzqQDR2jYg
 cpDOd1B5dyGwKVO6qm/P9cc5LJaEHPf7GM66UQjI2a1Nved9GY7HkASRytCY7d6da
X-Received: by 2002:adf:e449:: with SMTP id t9mr5856714wrm.135.1630007460281; 
 Thu, 26 Aug 2021 12:51:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypfB0khH35T8LBtMh71Lwudql1ndIwhOb+rF6A0wR8+745Q2L5H/jEZtVH9bG+6Nl4wPnv/Q==
X-Received: by 2002:adf:e449:: with SMTP id t9mr5856688wrm.135.1630007460069; 
 Thu, 26 Aug 2021 12:51:00 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 p13sm4146951wro.8.2021.08.26.12.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:50:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/11] util/vfio-helpers: Let qemu_vfio_do_mapping()
 propagate Error
Date: Thu, 26 Aug 2021 21:50:13 +0200
Message-Id: <20210826195014.2180369-11-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826195014.2180369-1-philmd@redhat.com>
References: <20210826195014.2180369-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 48b4384e8c8..0c011b3dbc8 100644
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
@@ -774,7 +774,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
 
             mapping = qemu_vfio_add_mapping(s, host, size, index + 1, iova0);
             assert(qemu_vfio_verify_mappings(s));
-            ret = qemu_vfio_do_mapping(s, host, size, iova0);
+            ret = qemu_vfio_do_mapping(s, host, size, iova0, errp);
             if (ret < 0) {
                 qemu_vfio_undo_mapping(s, mapping, NULL);
                 return ret;
@@ -784,7 +784,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
             if (qemu_vfio_find_temp_iova(s, size, &iova0, errp)) {
                 return -ENOMEM;
             }
-            ret = qemu_vfio_do_mapping(s, host, size, iova0);
+            ret = qemu_vfio_do_mapping(s, host, size, iova0, errp);
             if (ret < 0) {
                 return ret;
             }
-- 
2.31.1


