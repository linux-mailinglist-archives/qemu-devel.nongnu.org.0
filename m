Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FEE4024FB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:18:35 +0200 (CEST)
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWJO-0002kl-FP
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFN-0004pH-O7
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFK-0005mT-Bb
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631002461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93rYJKlNrN2jvApOZPJ4Zj4TVrJ6PatDI633zamzLMQ=;
 b=O4tB/SkeBX7nr+zyVz4sDtrSrY0f0JqsuMwBBpQgX14NBcWH2BZpgTNIw6l1TZl3wBjjIR
 0RgLFGNZmbvTyRBXpK4NVZ7T4Jqre02SaKCqQwDvvVv+liLJ/xxfogKd46SFUoAS0Mgv3h
 UzkIX333Sq20NUu9w6Iecc0Va/cYZf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-TLs9K12_P4e1YhaVcvgxMQ-1; Tue, 07 Sep 2021 04:14:20 -0400
X-MC-Unique: TLs9K12_P4e1YhaVcvgxMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F76383DC26;
 Tue,  7 Sep 2021 08:14:11 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BD6B7AB7B;
 Tue,  7 Sep 2021 08:14:09 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/11] util/vfio-helpers: Replace qemu_mutex_lock() calls with
 QEMU_LOCK_GUARD
Date: Tue,  7 Sep 2021 09:13:55 +0100
Message-Id: <20210907081403.816404-4-stefanha@redhat.com>
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

Simplify qemu_vfio_dma_[un]map() handlers by replacing a pair of
qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
macro.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210902070025.197072-4-philmd@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/vfio-helpers.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 1d14913629..d956866b4e 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -735,7 +735,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
     assert(QEMU_PTR_IS_ALIGNED(host, qemu_real_host_page_size));
     assert(QEMU_IS_ALIGNED(size, qemu_real_host_page_size));
     trace_qemu_vfio_dma_map(s, host, size, temporary, iova);
-    qemu_mutex_lock(&s->lock);
+    QEMU_LOCK_GUARD(&s->lock);
     mapping = qemu_vfio_find_mapping(s, host, &index);
     if (mapping) {
         iova0 = mapping->iova + ((uint8_t *)host - (uint8_t *)mapping->host);
@@ -778,7 +778,6 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
         *iova = iova0;
     }
 out:
-    qemu_mutex_unlock(&s->lock);
     return ret;
 }
 
@@ -813,14 +812,12 @@ void qemu_vfio_dma_unmap(QEMUVFIOState *s, void *host)
     }
 
     trace_qemu_vfio_dma_unmap(s, host);
-    qemu_mutex_lock(&s->lock);
+    QEMU_LOCK_GUARD(&s->lock);
     m = qemu_vfio_find_mapping(s, host, &index);
     if (!m) {
-        goto out;
+        return;
     }
     qemu_vfio_undo_mapping(s, m, NULL);
-out:
-    qemu_mutex_unlock(&s->lock);
 }
 
 static void qemu_vfio_reset(QEMUVFIOState *s)
-- 
2.31.1


