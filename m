Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0ED40251B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:26:31 +0200 (CEST)
Received: from localhost ([::1]:44506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWR3-0001RG-82
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFS-0004vQ-Ts
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFQ-0005qZ-B9
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631002466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXpFeGMVgxi61M/SQMqA46qcKx93VZOyZUrQKfOfgAA=;
 b=JbYjWn+LMgIzbEJ1uJv+ugGY18zX9BaUroA2oV8hhrJSxw3IwrDPKgr56r9rKoUXf/jFvo
 rguY+dnn/23qOLs2H1CXzb/mvnsbFXwRGGeUnc/1R2FPspzgCUtkHxTXA8R5Vsn3DcxPXD
 fpj7Ta7q+m0p7C0q6uIsTiTpMPm0Yrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-02Z_m-cdPgmgbPDOxSXSgw-1; Tue, 07 Sep 2021 04:14:25 -0400
X-MC-Unique: 02Z_m-cdPgmgbPDOxSXSgw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DA8689841C;
 Tue,  7 Sep 2021 08:14:17 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAF575C25D;
 Tue,  7 Sep 2021 08:14:16 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/11] util/vfio-helpers: Extract qemu_vfio_water_mark_reached()
Date: Tue,  7 Sep 2021 09:13:59 +0100
Message-Id: <20210907081403.816404-8-stefanha@redhat.com>
In-Reply-To: <20210907081403.816404-1-stefanha@redhat.com>
References: <20210907081403.816404-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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

Extract qemu_vfio_water_mark_reached() for readability,
and have it provide an error hint it its Error* handle.

Suggested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210902070025.197072-8-philmd@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/vfio-helpers.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 77cdec845d..306b5a83e4 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -721,6 +721,21 @@ qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
     return -ENOMEM;
 }
 
+/**
+ * qemu_vfio_water_mark_reached:
+ *
+ * Returns %true if high watermark has been reached, %false otherwise.
+ */
+static bool qemu_vfio_water_mark_reached(QEMUVFIOState *s, size_t size,
+                                         Error **errp)
+{
+    if (s->high_water_mark - s->low_water_mark + 1 < size) {
+        error_setg(errp, "iova exhausted (water mark reached)");
+        return true;
+    }
+    return false;
+}
+
 /* Map [host, host + size) area into a contiguous IOVA address space, and store
  * the result in @iova if not NULL. The caller need to make sure the area is
  * aligned to page size, and mustn't overlap with existing mapping areas (split
@@ -742,7 +757,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
     if (mapping) {
         iova0 = mapping->iova + ((uint8_t *)host - (uint8_t *)mapping->host);
     } else {
-        if (s->high_water_mark - s->low_water_mark + 1 < size) {
+        if (qemu_vfio_water_mark_reached(s, size, errp)) {
             ret = -ENOMEM;
             goto out;
         }
-- 
2.31.1


