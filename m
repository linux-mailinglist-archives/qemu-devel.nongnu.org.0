Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA62A380DE4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:15:02 +0200 (CEST)
Received: from localhost ([::1]:40764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaSr-0004LD-Mt
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaLc-000478-Fm
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:07:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaLa-0007Vz-Qk
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:07:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z6/vEA+i4paY/RqNIqLBRDb+FPp4ZLN89GOA4Mb7wvk=;
 b=gkKkXOu9Y2hSYeqn+USOSVJ5VGGnabBtT17l92B/vfrqavwr5BhBo7ZOxIKgCez+NrCoLo
 5M1f7Juf1Fde93KRtbGiZo0AWSxYLCqgKM1UbooJD8TGC/amq9q0WqVqJQcNxhD5tXcfzR
 +CONxowTplCnfthRwVLYYMgxbXrRREU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-12Htccp1MuOt9ETnfpVf7g-1; Fri, 14 May 2021 12:04:53 -0400
X-MC-Unique: 12Htccp1MuOt9ETnfpVf7g-1
Received: by mail-wr1-f69.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so12879046wre.18
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z6/vEA+i4paY/RqNIqLBRDb+FPp4ZLN89GOA4Mb7wvk=;
 b=Z1pCTK/vgRyDyLyX/IhvGSqhP+1UfNFv1S+BiZRRt9m/WHAiwyHtBeuh9ZZYaTdRvF
 +/0qZ75alZF9DYDzHFr5qyWCIhW0kJTHbrhE3QGdnn27RwSRG9f1kPJIp3f3z1MXnWq2
 kypgZWAHWl7oL9jCEe0t+MrK+Z6Fpa5eI0o/f/abVLl4liTdolcHRH/pbLbnLbS3EhoX
 ZmOuFxYWIVpRZbxy1EAvT943X3ELpk2GsiCXuwCzzCpUK2LmDJe4NvJdDf4LDC/6aIML
 vSE7OhsyT3oMEMtcImj+Q1AuyelaeIDhWJxqOS3kr9go8CHcEID18zXyxRX4iZBjxbiM
 nXdA==
X-Gm-Message-State: AOAM533A5CMfYHnfZI97+xNyblw6w1KQXFw3fy34Crf+eUH3/U2aNED0
 RstNCY89W/Y7PY9rl9UYd1nsQdVtRwQSsWJdFdpFoo+wi74faSixnau5rOPZYQlVeWQDgf3pOMA
 6N4Fnzw6vBor5D6hmbfGWEmXSgfsr62+byqN08UhrRqy791JQdVX+Jnzbu/9t
X-Received: by 2002:a05:600c:4242:: with SMTP id
 r2mr10201879wmm.140.1621008291772; 
 Fri, 14 May 2021 09:04:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYMaCFp5aqbB1qgSRfBidcZarQcXNaQr+bDAhPwmGCuTuVzWj18bWy1bBuRLuww81O55RTzA==
X-Received: by 2002:a05:600c:4242:: with SMTP id
 r2mr10201862wmm.140.1621008291589; 
 Fri, 14 May 2021 09:04:51 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id h15sm5494541wmq.4.2021.05.14.09.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:51 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/16] hw/virtio: enable ioeventfd configuring for mmio
Message-ID: <20210514160245.91918-15-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch adds ioeventfd flag for virtio-mmio configuration.
It allows switching ioeventfd on and off.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <161700379211.1135943.8859209566937991305.stgit@pasha-ThinkPad-X280>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-mmio.h |  5 +++++
 hw/virtio/virtio-mmio.c         | 11 ++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-mmio.h b/include/hw/virtio/virtio-mmio.h
index d4c4c386ab..090f7730e7 100644
--- a/include/hw/virtio/virtio-mmio.h
+++ b/include/hw/virtio/virtio-mmio.h
@@ -49,12 +49,17 @@ typedef struct VirtIOMMIOQueue {
     uint32_t used[2];
 } VirtIOMMIOQueue;
 
+#define VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD_BIT 1
+#define VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD \
+        (1 << VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD_BIT)
+
 struct VirtIOMMIOProxy {
     /* Generic */
     SysBusDevice parent_obj;
     MemoryRegion iomem;
     qemu_irq irq;
     bool legacy;
+    uint32_t flags;
     /* Guest accessible state needing migration and reset */
     uint32_t host_features_sel;
     uint32_t guest_features_sel;
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 342c918ea7..5952471b38 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -36,7 +36,9 @@
 
 static bool virtio_mmio_ioeventfd_enabled(DeviceState *d)
 {
-    return kvm_eventfds_enabled();
+    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
+
+    return (proxy->flags & VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD) != 0;
 }
 
 static int virtio_mmio_ioeventfd_assign(DeviceState *d,
@@ -720,6 +722,8 @@ static Property virtio_mmio_properties[] = {
     DEFINE_PROP_BOOL("format_transport_address", VirtIOMMIOProxy,
                      format_transport_address, true),
     DEFINE_PROP_BOOL("force-legacy", VirtIOMMIOProxy, legacy, true),
+    DEFINE_PROP_BIT("ioeventfd", VirtIOMMIOProxy, flags,
+                    VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD_BIT, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -731,6 +735,11 @@ static void virtio_mmio_realizefn(DeviceState *d, Error **errp)
     qbus_create_inplace(&proxy->bus, sizeof(proxy->bus), TYPE_VIRTIO_MMIO_BUS,
                         d, NULL);
     sysbus_init_irq(sbd, &proxy->irq);
+
+    if (!kvm_eventfds_enabled()) {
+        proxy->flags &= ~VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD;
+    }
+
     if (proxy->legacy) {
         memory_region_init_io(&proxy->iomem, OBJECT(d),
                               &virtio_legacy_mem_ops, proxy,
-- 
MST


