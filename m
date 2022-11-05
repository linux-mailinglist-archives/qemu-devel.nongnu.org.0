Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF2E61DC6E
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:28:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMqA-0000ND-Bt; Sat, 05 Nov 2022 13:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnG-0006yW-Iu
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnE-0007SK-TX
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jg7sLjcWB6HtPU5UAogQs3DHq9iDs+lY62icnGItUKg=;
 b=TBoOW04w80rOWv8KSiG2cBDmXauFx1j0RJqGU1agNl8pZmd/mjEeUvv7vHTPDpvXe4cBqf
 q+9q0aNpX2oAnzHS6RGds/Y2vW35lfL+0d6nz8H/61W7thTkhxCVX/gjKsdn4Enjavv9jm
 OyY42560XSUsY1Q1JUdWtKIkMOxXXuc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-323-leR-B_XiMvKJwZXgTZ_pgA-1; Sat, 05 Nov 2022 13:17:14 -0400
X-MC-Unique: leR-B_XiMvKJwZXgTZ_pgA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v125-20020a1cac83000000b003cfa148576dso898797wme.3
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jg7sLjcWB6HtPU5UAogQs3DHq9iDs+lY62icnGItUKg=;
 b=JCCN+8PFTcBmfpFfgickPpehJJC/5dSULaThGNz/8xdeLBQZy3kvvu3/PJYNxST9WO
 hIiIy+JaJcq8/Xt94b/T2a0uSE1H8D++5pO06jPQx9vk1yW+TsQt6bMppETekv/BdZzl
 JwPgZhZ+Yd5z+pBmABHB8HodBBSiZBmZnKs70+3IVzaZqgb3rXPt8zOKISYAlsBggl6r
 K/Y1IIIab8FVeezJOAGGSp8nujx0UYW6pAcTF5GiQhU3w8lrSK2LoyVJRbTEO9YoBPRX
 s3Cy4ipuPVm/FZdSYL0b+0ZLeZi77mPni0ul5PpfCb7Pl60QJzSQOwws/AisIIpI21TS
 hnCQ==
X-Gm-Message-State: ACrzQf0r6eJy3b3XplehzK8An3muH2STRbK94Ay0p7ywB4WFQSL7kbE1
 s95VrEByPOJ7b8L7At63XkFGaxKYXm2BrewsmiI+5m6DoIpkc57S78hihUkjlWlgXf5MRXuO+tA
 /iaSXHajiSIXJsl/5zhfveKbWcv975Uwa6K35HQxT4kFAoC1u9eE/4xiVOecB
X-Received: by 2002:a05:600c:29a:b0:3cf:8e62:66f1 with SMTP id
 26-20020a05600c029a00b003cf8e6266f1mr9723078wmk.39.1667668632548; 
 Sat, 05 Nov 2022 10:17:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Rk8SZfCJhhvjyscg17QuXuTIGDJHhTwiidMqDSCO+1XDt4utiifqx3vDWnEmtSVJmKDSu6Q==
X-Received: by 2002:a05:600c:29a:b0:3cf:8e62:66f1 with SMTP id
 26-20020a05600c029a00b003cf8e6266f1mr9723065wmk.39.1667668632308; 
 Sat, 05 Nov 2022 10:17:12 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 l27-20020a05600c1d1b00b003b95ed78275sm3211417wms.20.2022.11.05.10.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:11 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL v3 35/81] virtio: core: vq reset feature negotation support
Message-ID: <20221105171116.432921-36-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index b00b3fcf31..1423dba379 100644
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


