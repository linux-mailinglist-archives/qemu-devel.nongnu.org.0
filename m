Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38BF38AAE4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:20:57 +0200 (CEST)
Received: from localhost ([::1]:58340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgjX-0007R2-KD
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgZB-0000ih-3Q
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:10:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgZ8-0004kY-Ob
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:10:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621509009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B2sGmsuzq6ssxzUGpyvhj2pP3TABHbW6gQF2vvqdbU8=;
 b=QHS/+nqp4jaZscfdDkjpcglFd2exjY4eLrQl463DHk30M/YDJWR3IbdUc1kGYNV/clgWXu
 bfS5As62ylIXXrUdJe8SGYu3kCC5D6U4yf29NX1StNDHD3y2bv7+dOMRYKZyeVSa9yADdM
 HamF2/y1804qjjDCJ6ZCmBVMwkKMa7w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-4Qb3L5ILOPSEvYNh3-YZcw-1; Thu, 20 May 2021 07:10:08 -0400
X-MC-Unique: 4Qb3L5ILOPSEvYNh3-YZcw-1
Received: by mail-wr1-f69.google.com with SMTP id
 i15-20020a5d558f0000b029011215b1cf5cso2138724wrv.22
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 04:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B2sGmsuzq6ssxzUGpyvhj2pP3TABHbW6gQF2vvqdbU8=;
 b=ksX8MHe45VnFDqqm0y5A1515qWQ85IATqMj0WcNYpjgNerq5rP4qLBWj4kNhfTZUIj
 ML/G6YFXJOfgKVsrAz5IqVM6tEB8gXc2iEH+PB40M9pm1uvEFtXhQZSrAWgBaJUeytPC
 3LBn4VTuYBdsokdbL3w7bxIk/9W7j6u7P32WE6o211/bk7gemRgUmRmVhKiqPcFAUJC9
 KzwTaGasalJ4V3Qgu/apiaXEVULGOs7lHjVYhhqLIRAUXhT6qxtmmQ/ChSHQu4ROPa/V
 XugdQ2dplFuVVV6cpzL/RyVRxqblFXlZXnJkrxIOm0prq/iTIe2IlxfeR8/WDv+uH2r9
 VqPQ==
X-Gm-Message-State: AOAM530QzUyq5EWue7XfGrYCfyXHD8a4hzBHDuGvo2mB4EgXh1S8iqtE
 g10xaxqfBt1hzUJ7IWvWaPQxy7czOfusXwPepiyjY1aVg29lWe52NCn9gLPG9piuOJ9Oh/FkYhB
 n2qPmEbS6QTjX4tWtTPxEgG6ReUkqeqrT8jxGD0Max2ROqNFC4VLDsHD9rIb654P7
X-Received: by 2002:a5d:58d0:: with SMTP id o16mr3688297wrf.420.1621509006561; 
 Thu, 20 May 2021 04:10:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzr1jKsgTU7z86XYAXdKX+v2p3GgjdQGU1xnatVqO28ldznpuvEBjfHYdTua9fyxEgVJdXhNg==
X-Received: by 2002:a5d:58d0:: with SMTP id o16mr3688266wrf.420.1621509006290; 
 Thu, 20 May 2021 04:10:06 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id j18sm2153364wmq.27.2021.05.20.04.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:10:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/12] hw/virtio: Extract
 virtio_lduw_phys_cached_with_attrs()
Date: Thu, 20 May 2021 13:09:17 +0200
Message-Id: <20210520110919.2483190-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210520110919.2483190-1-philmd@redhat.com>
References: <20210520110919.2483190-1-philmd@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to specify memory transaction attributes (such the
address alignment), extract virtio_lduw_phys_cached_with_attrs()
from virtio_lduw_phys_cached().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/virtio/virtio-access.h | 35 +++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index ae8c9feffc5..aebf0a088a0 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -156,14 +156,41 @@ static inline uint16_t virtio_tswap16(VirtIODevice *vdev, uint16_t s)
 #endif
 }
 
+/**
+ * virtio_ld*_phys_cached_with_attrs: load from a VirtIO cached #MemoryRegion
+ * virtio_st*_phys_cached_with_attrs: store to a VirtIO cached #MemoryRegion
+ *
+ * These functions perform a load or store of the byte, word,
+ * longword or quad to the specified address.  The address is
+ * a physical address in the VirtIO device AddressSpace, but it must lie within
+ * a #MemoryRegion that was mapped with address_space_cache_init.
+ *
+ * @vdev: virtio device accessed
+ * @cache: previously initialized #MemoryRegionCache to be accessed
+ * @pa: physical address within the address space
+ * @val: data value, for stores
+ * @attrs: memory transaction attributes
+ * @result: location to write the success/failure of the transaction;
+ *   if NULL, this information is discarded
+ */
+
+static inline uint16_t virtio_lduw_phys_cached_with_attrs(VirtIODevice *vdev,
+                                                MemoryRegionCache *cache,
+                                                hwaddr pa, MemTxAttrs attrs,
+                                                MemTxResult *result)
+{
+    if (virtio_access_is_big_endian(vdev)) {
+        return address_space_lduw_be_cached(cache, pa, attrs, result);
+    }
+    return address_space_lduw_le_cached(cache, pa, attrs, result);
+}
+
 static inline uint16_t virtio_lduw_phys_cached(VirtIODevice *vdev,
                                                MemoryRegionCache *cache,
                                                hwaddr pa)
 {
-    if (virtio_access_is_big_endian(vdev)) {
-        return lduw_be_phys_cached(cache, pa);
-    }
-    return lduw_le_phys_cached(cache, pa);
+    return virtio_lduw_phys_cached_with_attrs(vdev, cache, pa,
+                                              MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
 static inline uint32_t virtio_ldl_phys_cached(VirtIODevice *vdev,
-- 
2.26.3


