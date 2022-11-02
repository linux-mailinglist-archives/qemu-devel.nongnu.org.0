Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EEA616898
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:23:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGKP-0000ZN-Nd; Wed, 02 Nov 2022 12:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKF-000081-67
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKD-000371-Mo
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o4ROciCLZ9i/1jI+qJP8SDYVOQK7gC8l6WXiDFJoS00=;
 b=UARRGO7q3D9dzfMYBK1cvmD8XSXdUBV02MhAHoBjtBNxayUJhNtvwj8EZfHlYl9C9kZhDV
 ZEqCea5eZ7dSSZsJhyImpkUHtV6iIteZ8h3b1JOYh5mhSKZZNW2i4O8Bi/Kv51kNFofLOa
 JS4zmELm570gnFsQbOcH9/8tJcBINTk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-oBsRS55tOVqrj5baSQXULQ-1; Wed, 02 Nov 2022 12:10:41 -0400
X-MC-Unique: oBsRS55tOVqrj5baSQXULQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso1260413wmk.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o4ROciCLZ9i/1jI+qJP8SDYVOQK7gC8l6WXiDFJoS00=;
 b=y0S1QuDni8USnikl6VfgNpm8qb2Xtd6jnsC7PqfS5zWPHR63fgb4vSIknoyDNOLFGp
 DpVYphbxQPKA0ul7t1Xe8kZRP1RiPEmcvI4fVAoY39MwKctHMmLr0ak2FrHU/wXyfnXK
 m7HSw4BnzmXA5p4VrCllcPbBM+Wg2fiMjiN3ikNywnH8oDDLhoDT2mmcziBtGDADCbTj
 gHTSF4SjBd+RhnoNUdWdw+IOIgsPuNyuFe2IpJHbAHsS1v0OdVCRXt05v4wp4P79xo1f
 Si4AwOxj4PKTR0kclbKS/J5WrBK8J4FM14ZDrE3ESNY0fStGePUm7XD81bgFdBtLF9fU
 bhOg==
X-Gm-Message-State: ACrzQf1tgfl0NpEgPEbHzHJa5kAhN6uAHdTVcEMBnc08hRI6DEhQ6mmk
 LqLg3Evvpm4ZCmQ7yeQPBh0ZuafvTkDbOIpfOsoosY5Mj28AYgzMLs0plkMJ+2tGqfQP+PtsRfV
 JP+EsJHcNxCVK+YkcVNdSotKEzYZ+QVrLaxARIJMD8RDWTGGN10QKLAyqOJ9H
X-Received: by 2002:a05:6000:15cd:b0:236:9701:7bad with SMTP id
 y13-20020a05600015cd00b0023697017badmr15476135wry.679.1667405438757; 
 Wed, 02 Nov 2022 09:10:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XkbQ8/RasoH3jq7JYidLmd1F/oVgLrArRa+bXaUrkAF/HJa7nFG2stuGXH2b0lu17I8eV1Q==
X-Received: by 2002:a05:6000:15cd:b0:236:9701:7bad with SMTP id
 y13-20020a05600015cd00b0023697017badmr15476104wry.679.1667405438452; 
 Wed, 02 Nov 2022 09:10:38 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c445000b003cf78aafdd7sm2746053wmn.39.2022.11.02.09.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:37 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 48/82] vhost: vhost-kernel: enable vq reset feature
Message-ID: <20221102160336.616599-49-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Add virtqueue reset feature for vhost-kernel.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-15-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/vhost_net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index f2ada02781..a6a130e1ae 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -47,6 +47,7 @@ static const int kernel_feature_bits[] = {
     VIRTIO_NET_F_MTU,
     VIRTIO_F_IOMMU_PLATFORM,
     VIRTIO_F_RING_PACKED,
+    VIRTIO_F_RING_RESET,
     VIRTIO_NET_F_HASH_REPORT,
     VHOST_INVALID_FEATURE_BIT
 };
-- 
MST


