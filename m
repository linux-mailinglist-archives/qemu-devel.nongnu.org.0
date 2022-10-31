Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD665613709
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:54:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUI7-0000UX-Q8; Mon, 31 Oct 2022 08:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHZ-0005WP-I7
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHW-0002qR-O9
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X2sP/TSK1XCsdD9F2S14hcxXjNio5ZBGNNU6Wjh7pYE=;
 b=HWxQKHn+0GA6bMLSriLsHplgpmoQ29Il5qdl3++h/ookYRop1VZpVLYt7uwPU1Lb03aNoK
 LD5qxSK+mughGDwcl37Kknl84jE4jKur5EkXqbeXlG+phsacCQ1krkM7Aa8OXAWLztswTL
 udjaK0eAwLkF3bTqN0iYRVd+YsIamSQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-9dsi42jEP1CVQLY3OIaTfA-1; Mon, 31 Oct 2022 08:52:42 -0400
X-MC-Unique: 9dsi42jEP1CVQLY3OIaTfA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f26-20020a7bcc1a000000b003c03db14864so2569792wmh.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X2sP/TSK1XCsdD9F2S14hcxXjNio5ZBGNNU6Wjh7pYE=;
 b=b9Y0xYJiP4DuPanxQ2j2heweTjaP7rf/fZ47oVCGE8DWFEMizq3WlDb6UDInL3aQR6
 yQY8JD/C8KnFTtmaRrZFPe2F4G0GqQUP1dyBSz1MEZVLT8yn3PRPsxEjzCkp8JRZGFEn
 lvGJHIAXGH3cckHHZqMHtbju4c61mUDQStOTfk5FkMHhMqEJCI8GfGlBuz3HOKZXf8/K
 UaGYJgyH2ucfYkGYKZg20p+tqzOFSWil84wpjIr7mL0wjyK/X+AmlOW1ZRYi2t2gFhvy
 /T6REbsi+kYdOjNmYIhnCbY10mIoF9xXtmCLV7eSlZyKrvItobjkH1RBR+q2+xblW2JT
 oJFw==
X-Gm-Message-State: ACrzQf0dYAwdJb4IDiZSnT4oDN5Wrg3kwANvFRq1vcCS4eeVBe0FsSf4
 BDpDnRX6Myf1LVhD+ADtxp/8ec7EKOV5So9LdVNPjFmTXFGUuZr2o8uxDwJ7Iy6SBi2c7GzJTMo
 q7UZ4/0p2QFma+EjmoDo+BvrwUZypxDCB7nHjVKo45SLhVMSs06bt2S0kZvrW
X-Received: by 2002:a5d:4048:0:b0:236:659b:260e with SMTP id
 w8-20020a5d4048000000b00236659b260emr7644933wrp.445.1667220760895; 
 Mon, 31 Oct 2022 05:52:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5eOiR6dWM4rOzoXBEtNj+izPeL+vdriB+L76sI9NmKcvqZcNBxFbzL4E4GnFjdL24Rt0J/ew==
X-Received: by 2002:a5d:4048:0:b0:236:659b:260e with SMTP id
 w8-20020a5d4048000000b00236659b260emr7644909wrp.445.1667220760643; 
 Mon, 31 Oct 2022 05:52:40 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c4f8200b003b4c979e6bcsm7266747wmq.10.2022.10.31.05.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:40 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 40/86] virtio: core: vq reset feature negotation support
Message-ID: <20221031124928.128475-41-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

A a new command line parameter "queue_reset" is added.

Meanwhile, the vq reset feature is disabled for pre-7.2 machines.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-5-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h | 4 +++-
 hw/core/machine.c          | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 5cd7861aeb..18a8920cc0 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -313,7 +313,9 @@ typedef struct VirtIORNGConf VirtIORNGConf;
     DEFINE_PROP_BIT64("iommu_platform", _state, _field, \
                       VIRTIO_F_IOMMU_PLATFORM, false), \
     DEFINE_PROP_BIT64("packed", _state, _field, \
-                      VIRTIO_F_RING_PACKED, false)
+                      VIRTIO_F_RING_PACKED, false), \
+    DEFINE_PROP_BIT64("queue_reset", _state, _field, \
+                      VIRTIO_F_RING_RESET, true)
 
 hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
 bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index aa520e74a8..907fa78ff0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -40,7 +40,9 @@
 #include "hw/virtio/virtio-pci.h"
 #include "qom/object_interfaces.h"
 
-GlobalProperty hw_compat_7_1[] = {};
+GlobalProperty hw_compat_7_1[] = {
+    { "virtio-device", "queue_reset", "false" },
+};
 const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
 
 GlobalProperty hw_compat_7_0[] = {
-- 
MST


