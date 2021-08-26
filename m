Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA093F8F50
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 21:56:21 +0200 (CEST)
Received: from localhost ([::1]:36242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLU4-0006xx-Tr
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 15:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOn-0005no-Dw
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOk-0003Cq-Oc
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630007449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPAeN1ELfe7bdUEPxcVE2xQF9fAx3P6/HJ2p3gjANPc=;
 b=ZuOz7KVif5nkt449h2mQ/YaVYx1mRE1a2euaXKDNzvAW70chFU9iMEWzJlLugg0w7ZHBQJ
 OofAaPrhFFKO9eznjf4kofTFVu3jvmEuHxASCETrqP+BLW14jkoBc7e5H1KH6fuMDGWSWd
 fHECCQenahQQ66QopxprdVFXp6BIlwM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-y76H7EQ3MQ2xpapEH-K2hA-1; Thu, 26 Aug 2021 15:50:48 -0400
X-MC-Unique: y76H7EQ3MQ2xpapEH-K2hA-1
Received: by mail-wm1-f69.google.com with SMTP id
 x125-20020a1c3183000000b002e73f079eefso3459009wmx.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 12:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yPAeN1ELfe7bdUEPxcVE2xQF9fAx3P6/HJ2p3gjANPc=;
 b=YhJwuivAOjeo3K+ADJgdegqdQyfOFDAMoGJRWmHY6sZjMf7stzAkdpO62hALRyVydY
 VkNJ1tnq3AzvjSq1OG26CALFm4jv0x2y/Si+RLNKSSWOqqg6wiaaMvvu8zKMeOibQLCo
 PlvWFRQtlDhKGu+kymOUkjUkr8Bwnu7yHigdmqXzm0iElcP2EA0Otxe/CxcMyGt8sdBJ
 jAT/sI5IDdz7wXD4PQnHI71Uqg6r05AZYjILUNKFFoB+Ouf05akc2CisOAzQ53PBuxl0
 Ds66bt+NVerrA5Aw0B/BdB5ewuyI2mmqRmpAOUtfVFLScmR1QgITuZip/e28cLmBcjG/
 INJg==
X-Gm-Message-State: AOAM533h+i0te/uZRcY80WANXIibV/p0ChTr9nc2Aq9kva6ZvTCgcrbE
 uOSShmCRy96Nq6Rc86ftOsUyGpQvCJlVyFOI7fm55VzWKFXsrgsHvbEukGOd+WRnHc7ms2kUkAp
 NxdhpzJTIrL48/dkQrKG0GXfcBVB9p3sreKnyunni7LB4nt6XgwiDfLY/8xwRfIKn
X-Received: by 2002:a1c:2209:: with SMTP id i9mr5245168wmi.92.1630007447217;
 Thu, 26 Aug 2021 12:50:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvwCtxIeyv/Wa8uD6Rfs62sxbIWRS5/+E5nqnpvvnuaWK1lYYpSxcT7NwU5XrhcIvrR8GOWw==
X-Received: by 2002:a1c:2209:: with SMTP id i9mr5245143wmi.92.1630007447016;
 Thu, 26 Aug 2021 12:50:47 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 z137sm9522151wmc.14.2021.08.26.12.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:50:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/11] util/vfio-helpers: Extract
 qemu_vfio_water_mark_reached()
Date: Thu, 26 Aug 2021 21:50:10 +0200
Message-Id: <20210826195014.2180369-8-philmd@redhat.com>
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

Extract qemu_vfio_water_mark_reached() for readability,
and have it provide an error hint it its Error* handle.

Suggested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 77cdec845d9..306b5a83e48 100644
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


