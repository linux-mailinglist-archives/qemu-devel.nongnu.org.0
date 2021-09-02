Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576A53FE9B9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:07:24 +0200 (CEST)
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgol-0002R7-Di
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiM-0000W0-1X
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:00:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiK-00080c-E0
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630566043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lm4MltjciLe1FvPMjz8J1KaGtyzlphex4Ajbbc6qJo=;
 b=SZHsT8bjzscam71LE8G4RXCK+ybUkvjHxFNnXSIdPcmB7r2VinrSYoF21X5gU+t+rji1Jp
 qfTgvtZTXEVpbG0Aw3cAnH2R8ym/ClW+oW8VIqFSo97up2s2wbrA6YjZZiCnyoM+rNB7q1
 FJqoR69pVMOcNxVsIz5ShWmPdXhOx9g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-7PUbHsJ-NP-d8_WXF5E0Cg-1; Thu, 02 Sep 2021 03:00:42 -0400
X-MC-Unique: 7PUbHsJ-NP-d8_WXF5E0Cg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r126-20020a1c4484000000b002e8858850abso346146wma.0
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lm4MltjciLe1FvPMjz8J1KaGtyzlphex4Ajbbc6qJo=;
 b=KQuNq/781C49BqSx6QkJcounGDa/+QsKnxPS6SOEC/xfdYis1eG2gG8k9aNKx9AuGq
 DZ7AH0qkg5bZKJmraRgoXlY8q4SJn1pnuElznyguPOtHlVm/0BGhtpVQfAk3HOZarsfR
 2gDBb/FI8ZjVZN/LcoBZ+ZkM+G7++Z5OdAfo7mY0qffm9iUoKPRk4PwtqNTRMidWst21
 ox06fCSGrM6QVqX+6cEfgj9Vf6HlUyDq7p98c1QyoS3XQ6vRgptDLSLjiUKHtkavUN+c
 tGQDvbLwQYbrDrI73LRDDae1DWewsy2Qwvap0wBXmXkQhwjSFaTOjGV+DQr8YvqUWkE0
 HiHw==
X-Gm-Message-State: AOAM532M54RS5jaRUeSuIs8gUDGJJlEsuOphIOrvCeW86D+xfSqHSb5u
 LNTldpXLygdj8YM2xlSnNsPGWZRONBjXzHZk18+GGQFCvYMvqctp3eW8H6XXUjxt8cHtEBlInQr
 y+srg/GLU9IS2+y2NNpe9G8xR2YLFQBssqkK3UWk++M+k5LjEIumT49B/FloEx5be
X-Received: by 2002:a1c:20d7:: with SMTP id g206mr1612456wmg.153.1630566041209; 
 Thu, 02 Sep 2021 00:00:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrJvsaNZnkBJWlG0OQYz1GUol6cYXAcSs8Fw2UXZXajEbYv+fWiTNPrnI6L8LhiEwKU5B70w==
X-Received: by 2002:a1c:20d7:: with SMTP id g206mr1612426wmg.153.1630566040915; 
 Thu, 02 Sep 2021 00:00:40 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id r10sm932883wrc.85.2021.09.02.00.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 00:00:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/11] util/vfio-helpers: Replace qemu_mutex_lock() calls
 with QEMU_LOCK_GUARD
Date: Thu,  2 Sep 2021 09:00:17 +0200
Message-Id: <20210902070025.197072-4-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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

Simplify qemu_vfio_dma_[un]map() handlers by replacing a pair of
qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
macro.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 1d149136299..d956866b4e9 100644
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


