Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97E86202CA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:56:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAwa-0000qU-MR; Mon, 07 Nov 2022 17:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwU-0000oI-VC
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwS-0003ZH-Fk
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jg7sLjcWB6HtPU5UAogQs3DHq9iDs+lY62icnGItUKg=;
 b=Hyqi8ywmxwhSDjMIRE/snvbwpokXZeUbxykF4jNgiCU5EP3OBTfsrsf1R/9dn49PyykGvW
 7F1oi6AsW644/xRascXDq5zrT+wBqMgJjQWZ+or06pdjb3moIibCmjuRemQomIeRfyUdFZ
 BAqGayP1T6xZN2AA3WyGU+BgEOd1n7g=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-112-y0RQjPtlMIu8lvYLN9-Ulg-1; Mon, 07 Nov 2022 17:50:06 -0500
X-MC-Unique: y0RQjPtlMIu8lvYLN9-Ulg-1
Received: by mail-qt1-f198.google.com with SMTP id
 cd6-20020a05622a418600b003a54cb17ad9so9098518qtb.0
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:50:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jg7sLjcWB6HtPU5UAogQs3DHq9iDs+lY62icnGItUKg=;
 b=1sLiIJTcfyl78JCw5gHyF0a/aCUKuhKxDhWWq6ArF+x+VMpZ8NAs10QsrmrMiOsFPk
 J2CmPKDdip3DmLkmnldKP/i4+kmbd5rrUeoLB2VHzENYqTnil88TCO0MKEL1mGa9tn+G
 ivYTl28cgD/BGHa9CKiPmVPMmtZ3Iz1GS+oIw29mBw1ej5FDQWQ3qdceWpsnjhx9Ms7M
 q+itufNnG/jxiwzGGQ1JP2+iSmOEpj+gn6i0u5ld0Exm34w1yhXVK0O6xdaKTI7kQYvQ
 4NnDTH4bysR1jUtWPpuM2/iV4SHQYcDOzgamA9C3NRdCAb7vI8tpvp42lBnGC0KSBo79
 7hbA==
X-Gm-Message-State: ACrzQf3UHlhcwTs9ztsr3/VAmWeZrHSIPGO+AI6Bxeyh+ZyGktDc724A
 vCmGxhDaVYwOIp0I/GT5CAQw+DSVGvEuoZbaW54Alkzj2HtVal1PF2viohhxnaqoGeqKZ6zPM++
 VOxnCIID6DFzTOsOfHth5/vtHBAF5Qti1ocxxs77gggXsRJDGFUuv09i9XPIo
X-Received: by 2002:ac8:57c8:0:b0:3a5:456c:c0fe with SMTP id
 w8-20020ac857c8000000b003a5456cc0femr23274696qta.445.1667861406189; 
 Mon, 07 Nov 2022 14:50:06 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6uauUy8WB/Y3zzwveDJbX/Apoj42vEPOcQTTOBMqhyc1LdVnyYaTWxAVnfdlctCuy68i+mcA==
X-Received: by 2002:ac8:57c8:0:b0:3a5:456c:c0fe with SMTP id
 w8-20020ac857c8000000b003a5456cc0femr23274667qta.445.1667861405863; 
 Mon, 07 Nov 2022 14:50:05 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 j3-20020a05620a288300b006faac3c33b8sm7630461qkp.27.2022.11.07.14.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:50:05 -0800 (PST)
Date: Mon, 7 Nov 2022 17:50:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL v4 30/83] virtio: core: vq reset feature negotation support
Message-ID: <20221107224600.934080-31-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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


