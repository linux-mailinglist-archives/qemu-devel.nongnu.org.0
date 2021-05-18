Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5270387FFC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:53:54 +0200 (CEST)
Received: from localhost ([::1]:49348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4qn-000821-S4
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4cE-0003Jw-Sm
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4c7-0000Ja-Ue
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nkQ439nwJVtM0Q48vhAoZUVzUukLms9COugvSIGg64M=;
 b=MdkkxRbyjdiIHwPHuLDhSaQCE6eNKwqPNYhLiKfno6mQe1XCez6o8LBKw5swMBtVXbYCwe
 z6EC76kKRFziym4YlfnTtKycspQK5iT6lwWZSa8CjjIBcSATZbcWiA+CO6BX0We1daW9wE
 da/vo9vEkcRCuzqIXRYJhwrs9HMGcMQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-LgoJto_xMUinUzDNFHhajw-1; Tue, 18 May 2021 14:38:39 -0400
X-MC-Unique: LgoJto_xMUinUzDNFHhajw-1
Received: by mail-ej1-f70.google.com with SMTP id
 h4-20020a1709067184b02903cbbd4c3d8fso2743178ejk.6
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nkQ439nwJVtM0Q48vhAoZUVzUukLms9COugvSIGg64M=;
 b=NBLN4SQ9styQ3upePo0GeF2YHdbx1XB8WNgxH/I52JtMSt2Ge5/RDSsOU5UBBEoEA0
 UUwHzAIoZCUggvnZrObOSR0ZsI+3kCey8udrQopBYdkBjI9mrm7GfuIoqhK+0NvKG0/S
 NqMFySJ71MY9/ce5RMQE7X8sE4i8xumXEkEfF+LtD054tS5a2sVVrZzaEyybNyhp6qeK
 Wkr4RFu7S0LD6XA+4rHATDRscGiudB9Pmx0nQLftObGoB67FS16wuZXOABBZYxN9Vivg
 fSSnsjtsuNvPlgmuMrhs5ihKwqVMgSbGGkHe8qRd27EmNVxhr03w4wrvnj42WWrncil+
 Al1Q==
X-Gm-Message-State: AOAM530c/n8Y7I9XGHFRr0oMy0ABQi5bVj8EMA+H6BCzUBJS/a/dg4li
 zPKV5hE9DGJAZVsPlec1J6ib+ejL5d4nV8dB6R+QrnfsaUcX+8sSybDYz4eu+D3EvkRr4K8qKz/
 1w5xggBt0m7XQbM9ArTqvqdv6VzIRmBdvXS+p/ZFe+eha/wtI0jzm9rWn1cDZ3Jji
X-Received: by 2002:a05:6402:14c2:: with SMTP id
 f2mr8796495edx.69.1621363118421; 
 Tue, 18 May 2021 11:38:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvQtpgrJ5MmmBPxeO08o3LNXUyat80zCiU7ug+0l7vmM9WYlqOXbTeQWpLp/Pt0nYOPgfZvQ==
X-Received: by 2002:a05:6402:14c2:: with SMTP id
 f2mr8796471edx.69.1621363118255; 
 Tue, 18 May 2021 11:38:38 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v18sm1602931edc.76.2021.05.18.11.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:38:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 20/25] hw/virtio: Introduce VIRTIO_ST_CONVERT() macro
Date: Tue, 18 May 2021 20:36:50 +0200
Message-Id: <20210518183655.1711377-21-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
introduce the VIRTIO_ST_CONVERT() macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/virtio/virtio-access.h | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index 594247f6e35..a86819ef2fe 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -68,6 +68,38 @@ static inline rtype virtio_ld ## size ## _phys_cached(VirtIODevice *vdev,\
     return ld ## size ## _le_phys_cached(cache, pa);\
 }
 
+#define VIRTIO_ST_CONVERT(size, vtype)\
+static inline void virtio_st## size ## _p(VirtIODevice *vdev,\
+                                          void *ptr, vtype v)\
+{\
+    if (virtio_access_is_big_endian(vdev)) {\
+        st## size ## _be_p(ptr, v);\
+    } else {\
+        st## size ## _le_p(ptr, v);\
+    }\
+}\
+static inline void virtio_st## size ## _phys(VirtIODevice *vdev,\
+                                             hwaddr pa, vtype value)\
+{\
+    AddressSpace *dma_as = vdev->dma_as;\
+\
+    if (virtio_access_is_big_endian(vdev)) {\
+        st## size ## _be_phys(dma_as, pa, value);\
+    } else {\
+        st## size ## _le_phys(dma_as, pa, value);\
+    }\
+}\
+static inline void virtio_st ## size ## _phys_cached(VirtIODevice *vdev,\
+                                                     MemoryRegionCache *cache,\
+                                                     hwaddr pa, vtype value)\
+{\
+    if (virtio_access_is_big_endian(vdev)) {\
+        st ## size ## _be_phys_cached(cache, pa, value);\
+    } else {\
+        st ## size ## _le_phys_cached(cache, pa, value);\
+    }\
+}
+
 VIRTIO_LD_CONVERT(uw, uint16_t)
 
 static inline uint32_t virtio_ldl_phys(VirtIODevice *vdev, hwaddr pa)
-- 
2.26.3


