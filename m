Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99DB40250A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:23:40 +0200 (CEST)
Received: from localhost ([::1]:37036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWOJ-0004nh-Ou
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFU-0004wY-I4
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFT-0005te-2O
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631002470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hNN7PPEs3xVOszyd4cdrMYFkm/QD494M6a2Ii9NVsH8=;
 b=gKjYTYxs9s+XisYOx99A0QD6oWUvKmBMUZnpBozmkeY4kBW/Pkka2cjZh8T/oLWdnlmxhN
 7Qgzxa76gEVQQ8FfQTsTKJCWongD/l8ysIPbRYDLgrQ1Top9JbHXrgpIuVFJxzwd06WhRQ
 KgpfF+VqgN7L1S4vArJrzLACGyHE8uI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-02Rf7tJrPnyN-LpcnB4s7A-1; Tue, 07 Sep 2021 04:14:28 -0400
X-MC-Unique: 02Rf7tJrPnyN-LpcnB4s7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB4A1824FAE;
 Tue,  7 Sep 2021 08:14:18 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 341346F13F;
 Tue,  7 Sep 2021 08:14:18 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/11] util/vfio-helpers: Use error_setg in
 qemu_vfio_find_[fixed/temp]_iova
Date: Tue,  7 Sep 2021 09:14:00 +0100
Message-Id: <20210907081403.816404-9-stefanha@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Both qemu_vfio_find_fixed_iova() and qemu_vfio_find_temp_iova()
return an errno which is unused (or overwritten). Have them propagate
eventual errors to callers, returning a boolean (which is what the
Error API recommends, see commit e3fe3988d78 "error: Document Error
API usage rules" for rationale).

Suggested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210902070025.197072-9-philmd@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/vfio-helpers.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 306b5a83e4..b93a3d3578 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -677,8 +677,8 @@ static bool qemu_vfio_verify_mappings(QEMUVFIOState *s)
     return true;
 }
 
-static int
-qemu_vfio_find_fixed_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
+static bool qemu_vfio_find_fixed_iova(QEMUVFIOState *s, size_t size,
+                                      uint64_t *iova, Error **errp)
 {
     int i;
 
@@ -693,14 +693,16 @@ qemu_vfio_find_fixed_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
             s->usable_iova_ranges[i].end - s->low_water_mark + 1 == 0) {
             *iova = s->low_water_mark;
             s->low_water_mark += size;
-            return 0;
+            return true;
         }
     }
-    return -ENOMEM;
+    error_setg(errp, "fixed iova range not found");
+
+    return false;
 }
 
-static int
-qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
+static bool qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size,
+                                     uint64_t *iova, Error **errp)
 {
     int i;
 
@@ -715,10 +717,12 @@ qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
             s->high_water_mark - s->usable_iova_ranges[i].start + 1 == 0) {
             *iova = s->high_water_mark - size;
             s->high_water_mark = *iova;
-            return 0;
+            return true;
         }
     }
-    return -ENOMEM;
+    error_setg(errp, "temporary iova range not found");
+
+    return false;
 }
 
 /**
@@ -762,7 +766,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
             goto out;
         }
         if (!temporary) {
-            if (qemu_vfio_find_fixed_iova(s, size, &iova0)) {
+            if (!qemu_vfio_find_fixed_iova(s, size, &iova0, errp)) {
                 ret = -ENOMEM;
                 goto out;
             }
@@ -776,7 +780,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
             }
             qemu_vfio_dump_mappings(s);
         } else {
-            if (qemu_vfio_find_temp_iova(s, size, &iova0)) {
+            if (!qemu_vfio_find_temp_iova(s, size, &iova0, errp)) {
                 ret = -ENOMEM;
                 goto out;
             }
-- 
2.31.1


