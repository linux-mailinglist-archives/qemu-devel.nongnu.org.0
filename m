Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90083FE9C2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:09:43 +0200 (CEST)
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgr0-0007VE-VN
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgii-0000kn-LY
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgig-0008Lb-OS
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630566066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0uOWhp+saqCNjYYeu2/7aRiyZ5BV70RG+ybspQ5dAak=;
 b=ewaTWZtUNOLrO4qqtkvZB5t2rX3VGyLMSIKQYvIEvlRj0Q+DPMIqne6bmqYA0b86SJBnoF
 lr09AfjILXxNZepEEbSkJrn3PGsBZc0ySvnzgvWlLeNMDagSfDxNvqrdUSIS/RoiOKHQ/6
 hTDSGma0qnTumWgBQ2xFk9PBP3YDgzQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-5xrTkssoM4Kv3emRi-uAcQ-1; Thu, 02 Sep 2021 03:01:05 -0400
X-MC-Unique: 5xrTkssoM4Kv3emRi-uAcQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 h1-20020a05600c350100b002e751bf6733so337042wmq.8
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0uOWhp+saqCNjYYeu2/7aRiyZ5BV70RG+ybspQ5dAak=;
 b=nKAK7edVDhvBBVyKGMLqJ18K0dx7j7RnN1igzFkcpkFKKokv1pimNzDLnjWQs/ry5y
 vKjkDqJfHdNyeRAufRMydDUofoy1a6VQcZcVn5ev75HcIsYZKtlmUVW1oFGlBUe5NUmW
 jE1azuw0THpU5/tDa6SHJcJgKCEJaMGfd+w3vYga3smsPWVGsKMlDNfAYpaRP8yxO75f
 XSPzfyIUZKXdZVCf2yMnNQbXEIO5Q078MyYYR0A/f40s/zjT1+J+cY5ZsVv1GEb1hkKx
 q2iDqGrum9ugdSf/xJH5jmUhyLrtYJCur5t/9m3eV29KZbp9nYi+AdxLQ2HMjwY45eV4
 WZkA==
X-Gm-Message-State: AOAM533+lLOZkjEaS1BnW9c4JK1jsvSf8UASp6OCdeKGrXoaG55oI4ya
 WQ/QE4y0LkvQCwuP/M7EgqCI4luXp+6efI0NPk3z6rOlYrHCwHR+G5vf1yOYML3V8s3jijQfTMl
 hryLVzhjPpc5CP3N6MfjGX1eAkBOFjIhTn3okFUWFwQEeOCB5roqqgYJOnHSe/lC+
X-Received: by 2002:a1c:4686:: with SMTP id t128mr1478497wma.183.1630566063790; 
 Thu, 02 Sep 2021 00:01:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7uRnvl5NMiCgo8fd31zdmpgDUNAKhX/1UQ81e7SxZUCKxXZXSyeA8FZuRhep03yUFE+Oi4g==
X-Received: by 2002:a1c:4686:: with SMTP id t128mr1478470wma.183.1630566063545; 
 Thu, 02 Sep 2021 00:01:03 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w9sm748568wmc.19.2021.09.02.00.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 00:01:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/11] util/vfio-helpers: Use error_setg in
 qemu_vfio_find_[fixed/temp]_iova
Date: Thu,  2 Sep 2021 09:00:22 +0200
Message-Id: <20210902070025.197072-9-philmd@redhat.com>
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

Both qemu_vfio_find_fixed_iova() and qemu_vfio_find_temp_iova()
return an errno which is unused (or overwritten). Have them propagate
eventual errors to callers, returning a boolean (which is what the
Error API recommends, see commit e3fe3988d78 "error: Document Error
API usage rules" for rationale).

Suggested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 306b5a83e48..b93a3d35787 100644
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


