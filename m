Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A927402512
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:25:56 +0200 (CEST)
Received: from localhost ([::1]:43400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWQV-0000dC-Du
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFb-00051C-ES
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFZ-0005zl-Rv
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631002477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e/3whkJTrFbB+0ZrHaFpObf/KPohjSDNvAbENg1Wsas=;
 b=C6kBwoH/oDwKGhUwkkpIB3imzVGzPlhzVvQWadLKNU/PHAs02WzSPMtrxxgIhoYqglvx22
 71za7boaHY2sSU3IlUO3qXV0VwYYbNlG1UOwfWoxC/fb8Po7p/Ym7SlTH5gv/EZzuz9rgI
 J09oabf4lmt0o3h8SExIdmqlPql8Drw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-Pn9dAEKAOV-BfyTY9DHozQ-1; Tue, 07 Sep 2021 04:14:36 -0400
X-MC-Unique: Pn9dAEKAOV-BfyTY9DHozQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3E1956AD5;
 Tue,  7 Sep 2021 08:14:21 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 209937D45B;
 Tue,  7 Sep 2021 08:14:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/11] util/vfio-helpers: Let qemu_vfio_do_mapping() propagate
 Error
Date: Tue,  7 Sep 2021 09:14:02 +0100
Message-Id: <20210907081403.816404-11-stefanha@redhat.com>
In-Reply-To: <20210907081403.816404-1-stefanha@redhat.com>
References: <20210907081403.816404-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Pass qemu_vfio_do_mapping() an Error* argument so it can propagate
any error to callers. Replace error_report() which only report
to the monitor by the more generic error_setg_errno().

Reviewed-by: Fam Zheng <fam@euphon.net>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210902070025.197072-11-philmd@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/vfio-helpers.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 66148bd381..00a80431a0 100644
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


