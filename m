Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E253E387FF1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:51:42 +0200 (CEST)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4of-0002Rb-W0
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4c2-0003Cz-Ut
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bz-0000Cw-P6
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKxZ1RkYCEJSma5qBZ02Ppnbq2NTdPs4znREVtD8AU8=;
 b=GK+bUFYkkWCbjP4xcpz0mbHbqH4yXNObrcRKGNJ4db4RqrQ2acu0MwspDvkXHDRynAMvyO
 eqhrM3nKe0N8DmZDoRySLxJGpGJDDTTjYtBCbJi2lM50QicbN0prhe4gOjjYk9hE3N/E05
 ALOEDSXv9H+1H2KFCiJZ7BpVa8izqHE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-M9azxUuOMjeMdgwPYzdVRQ-1; Tue, 18 May 2021 14:38:29 -0400
X-MC-Unique: M9azxUuOMjeMdgwPYzdVRQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 gt39-20020a1709072da7b02903a8f7736a08so2757744ejc.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LKxZ1RkYCEJSma5qBZ02Ppnbq2NTdPs4znREVtD8AU8=;
 b=JN1n/oTt4IUgxH+6qnlmUPQUr/KdLv02pHP3UMgG3Yi5ub2Z5JmXyNPfRPNg795+IR
 GaxA9NXsCXLzDoru14DzwfHeDv+qeQo8yMBs23ZALeZ/1fqowgpXGmFUYkeOCm6TnBgv
 Re7YfwLamKa0mj9kwhD6tXnSQ98bASgG8jXIhj15Tb0BLH3qvDlh0LULJp+trcDqO8aF
 e7fwfIOYqhXTEM5S78TzZdXhlo99XNVwH3n3sPn4prCvI7wF02VQN3O1uCPzVKPhv7ro
 vP1SlX1wpSxqSs08mhSzIIp4h7ASJti/x8QU+v73sWhqH8JSBizyTs/rYb/7qbxlqq1V
 /yaw==
X-Gm-Message-State: AOAM531L189FZ8ISN9ppmomwMf+B/sQD2lEz5y1owt8s5dG+UWwx77e2
 QhnVeQXUpjETxwGXAHOLnL4DvdNQYPAcerExFvaVbtkhblaADcDbk8ykx4kUW0TpbUV7vGUsGL5
 XHtuTAoPYO6m+3mqVM2/fEWHxaC8pJyykvyXbm+1Cuny7IH3JSoUnlzv0faleq2RJ
X-Received: by 2002:a17:907:2067:: with SMTP id
 qp7mr582653ejb.333.1621363108404; 
 Tue, 18 May 2021 11:38:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDq8kPq1/z50t99c/q+5VxS17+gOp3H9+HpTLmfVKghxsdfy9W3DV6faWOHuSaTiAFdDL8TQ==
X-Received: by 2002:a17:907:2067:: with SMTP id
 qp7mr582631ejb.333.1621363108234; 
 Tue, 18 May 2021 11:38:28 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id jt11sm10633010ejb.83.2021.05.18.11.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:38:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 18/25] hw/virtio: Introduce VIRTIO_LD_CONVERT() macro
Date: Tue, 18 May 2021 20:36:48 +0200
Message-Id: <20210518183655.1711377-19-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518183655.1711377-1-philmd@redhat.com>
References: <20210518183655.1711377-1-philmd@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to add more load/store operations,
introduce the VIRTIO_LD_CONVERT() macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/virtio/virtio-access.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index ae8c9feffc5..37e1e6ea535 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -39,6 +39,35 @@ static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
 #endif
 }
 
+#define VIRTIO_LD_CONVERT(size, rtype)\
+static inline rtype virtio_ld ## size ## _phys(VirtIODevice *vdev, hwaddr pa)\
+{\
+    AddressSpace *dma_as = vdev->dma_as;\
+\
+    if (virtio_access_is_big_endian(vdev)) {\
+        return ld ## size ## _be_phys(dma_as, pa);\
+    }\
+    return ld ## size ## _le_phys(dma_as, pa);\
+}\
+static inline rtype virtio_ld ## size ## _p(VirtIODevice *vdev,\
+                                            const void *ptr)\
+{\
+    if (virtio_access_is_big_endian(vdev)) {\
+        return ld ## size ## _be_p(ptr);\
+    } else {\
+        return ld ## size ## _le_p(ptr);\
+    }\
+}\
+static inline rtype virtio_ld ## size ## _phys_cached(VirtIODevice *vdev,\
+                                                      MemoryRegionCache *cache,\
+                                                      hwaddr pa)\
+{\
+    if (virtio_access_is_big_endian(vdev)) {\
+        return ld ## size ## _be_phys_cached(cache, pa);\
+    }\
+    return ld ## size ## _le_phys_cached(cache, pa);\
+}
+
 static inline uint16_t virtio_lduw_phys(VirtIODevice *vdev, hwaddr pa)
 {
     AddressSpace *dma_as = vdev->dma_as;
-- 
2.26.3


