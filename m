Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0920A4024F6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:17:39 +0200 (CEST)
Received: from localhost ([::1]:47574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWIT-0001HR-OV
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFa-0004zG-4h
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFY-0005yS-3J
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631002475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Z217EBN92D/0PCJMeZ1/Pib2j2Ln3Fdgndik+fQpxg=;
 b=RX7PjZq5r/0wE3u+ptK6a2C8ib2Yrt/AeKExUfREn2Z7bWnZ6cug6/lXDFMOnkZ+pXpe2W
 hTENAVbrAGDyG6Rej20PqSiVatWEKGqIsbe+llASA/j+XfZ4n7QnnrzipIvwDK+6kdDkDa
 RCLcmYpnKtEDWAIzwKL941rb7tBiAA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-9xTmU7nnMK6AcyVwzrHiqQ-1; Tue, 07 Sep 2021 04:14:32 -0400
X-MC-Unique: 9xTmU7nnMK6AcyVwzrHiqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F206C88CE52;
 Tue,  7 Sep 2021 08:14:19 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9971C5C25D;
 Tue,  7 Sep 2021 08:14:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/11] util/vfio-helpers: Simplify qemu_vfio_dma_map()
 returning directly
Date: Tue,  7 Sep 2021 09:14:01 +0100
Message-Id: <20210907081403.816404-10-stefanha@redhat.com>
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

To simplify qemu_vfio_dma_map():
- reduce 'ret' (returned value) scope by returning errno directly,
- remove the goto 'out' label.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210902070025.197072-10-philmd@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/vfio-helpers.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index b93a3d3578..66148bd381 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -748,7 +748,6 @@ static bool qemu_vfio_water_mark_reached(QEMUVFIOState *s, size_t size,
 int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
                       bool temporary, uint64_t *iova, Error **errp)
 {
-    int ret = 0;
     int index;
     IOVAMapping *mapping;
     uint64_t iova0;
@@ -761,32 +760,31 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
     if (mapping) {
         iova0 = mapping->iova + ((uint8_t *)host - (uint8_t *)mapping->host);
     } else {
+        int ret;
+
         if (qemu_vfio_water_mark_reached(s, size, errp)) {
-            ret = -ENOMEM;
-            goto out;
+            return -ENOMEM;
         }
         if (!temporary) {
             if (!qemu_vfio_find_fixed_iova(s, size, &iova0, errp)) {
-                ret = -ENOMEM;
-                goto out;
+                return -ENOMEM;
             }
 
             mapping = qemu_vfio_add_mapping(s, host, size, index + 1, iova0);
             assert(qemu_vfio_verify_mappings(s));
             ret = qemu_vfio_do_mapping(s, host, size, iova0);
-            if (ret) {
+            if (ret < 0) {
                 qemu_vfio_undo_mapping(s, mapping, NULL);
-                goto out;
+                return ret;
             }
             qemu_vfio_dump_mappings(s);
         } else {
             if (!qemu_vfio_find_temp_iova(s, size, &iova0, errp)) {
-                ret = -ENOMEM;
-                goto out;
+                return -ENOMEM;
             }
             ret = qemu_vfio_do_mapping(s, host, size, iova0);
-            if (ret) {
-                goto out;
+            if (ret < 0) {
+                return ret;
             }
         }
     }
@@ -794,8 +792,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
     if (iova) {
         *iova = iova0;
     }
-out:
-    return ret;
+    return 0;
 }
 
 /* Reset the high watermark and free all "temporary" mappings. */
-- 
2.31.1


