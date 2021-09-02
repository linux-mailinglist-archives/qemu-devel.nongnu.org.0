Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9C83FE9AA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:04:04 +0200 (CEST)
Received: from localhost ([::1]:58684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLglX-0004u1-TN
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiq-00017z-ML
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:01:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgil-0008QI-Az
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630566070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1OPgrDUvQgAnd9+SePpUbnTbT2KxXBfqSZ8bPzA2WI=;
 b=e9LMjlmNb+yU6iYuQt9hJNgD1Ml3iTvAE+MXFjP+oovNI1Ja9j4R1QZXr8Pk3jaFLkcAQW
 Q1GGuj7/GrrmQMCWDg14vHDphktwg/+KnOo0b/1M29Ks8vte7X0UMfMsaYEmEdJgDtCvQ2
 8UirQ49+OOTwFAl9lw09EU5fxIpK6P4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-b_iuLneFNuuSFYz84riO1w-1; Thu, 02 Sep 2021 03:01:09 -0400
X-MC-Unique: b_iuLneFNuuSFYz84riO1w-1
Received: by mail-wm1-f69.google.com with SMTP id
 m22-20020a7bcb96000000b002f7b840d9dcso278913wmi.1
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V1OPgrDUvQgAnd9+SePpUbnTbT2KxXBfqSZ8bPzA2WI=;
 b=CBVmYDJLd3CNI+Ev6F6mE3pCN2d8FV+yfii0vpBXjO8VT+TKcJ33VWESNPh91Hqp+C
 VmeCu1+0/zqXshfraEjc+kAX9i5hbsMlTUFHxZG6zFZOSLTHhWoT6lXzFBGkClWOwOUW
 iUrVAscGmdvf7FLhocZ+kOX4WLZ/txjae80GzYlda6lq0HSMOXTGDSc5+RD9aW7XQPi8
 iA+J7tWzdm8xGZMO8L4yt05Gn/uIHgsUZ/lEZ7+FIdu0K2F5m3tQjWyD5lavjMAbrQXE
 KHSkknMtMiGrB3KoZDwa7vqA/cMNy+91tejhCLhmsopsyi5cmVc784xye6yJTldRaoxO
 0YdA==
X-Gm-Message-State: AOAM5300SF/vAaMpMu1uTFiJKwYZzg6E9TkqojrdNzSptTK4lJGiXCeM
 5QAZ7q39ScN15oaTcMZkF3tOkGZnqVi88mG1lHdXlIbOldwJ2tXMhGCQSLGwL1d9aTLC45NfOSX
 5wxHx4sg9yKqJp+SB2QionBXxKtHZlMOyNMYqc9a8sIZKDa5PJIhQE1dxYhtaaYop
X-Received: by 2002:a05:600c:1990:: with SMTP id
 t16mr1549679wmq.45.1630566068150; 
 Thu, 02 Sep 2021 00:01:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBnaLQDBmhgZ52vkNdpL6UJBhePOKuAx2drr4XNe1mHiArDuZ0H19Lhu0W8yeNO3ZfeW7bLQ==
X-Received: by 2002:a05:600c:1990:: with SMTP id
 t16mr1549640wmq.45.1630566067939; 
 Thu, 02 Sep 2021 00:01:07 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a6sm917585wrh.97.2021.09.02.00.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 00:01:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/11] util/vfio-helpers: Simplify qemu_vfio_dma_map()
 returning directly
Date: Thu,  2 Sep 2021 09:00:23 +0200
Message-Id: <20210902070025.197072-10-philmd@redhat.com>
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

To simplify qemu_vfio_dma_map():
- reduce 'ret' (returned value) scope by returning errno directly,
- remove the goto 'out' label.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index b93a3d35787..66148bd381c 100644
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


