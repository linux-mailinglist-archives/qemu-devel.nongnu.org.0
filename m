Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BF64D0B94
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:59:37 +0100 (CET)
Received: from localhost ([::1]:35900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMKG-0002tO-Ia
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:59:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6p-0007Ec-Af
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6n-0005bI-PH
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wqPGtWFCVDPRGhVgRp/c/kDyoLIXiZZqdrhcBaAKsjU=;
 b=GwcAekG9HLfY32Wtd0wvLq1CQcKs0snT95Nh61YGsllvrKbtOOtGPPwJqsl3XV3MlHjRee
 68y/RFE4TgXsT5eF/TixMcbH6JzNCIW4NCXwSMUep+MQfvXnCrira/J6RALQA3fCn0QR55
 ks+QyDVeGIAC3qidAm+Aeo6EYtstRpM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-ipo7KVlTN8uZpgxaQ-SDmw-1; Mon, 07 Mar 2022 17:45:40 -0500
X-MC-Unique: ipo7KVlTN8uZpgxaQ-SDmw-1
Received: by mail-wm1-f72.google.com with SMTP id
 3-20020a05600c230300b00384e15ceae4so248442wmo.7
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wqPGtWFCVDPRGhVgRp/c/kDyoLIXiZZqdrhcBaAKsjU=;
 b=bGcgPVlKELak4n9ozXwaxtdCVQpXMlw7CCwgqO46pLWk0gza9+TnQHOtm0Scrzygaf
 bRBO7Rb93HTnxQU88OswcowAEjabTYa0Z01nOmrn1gXGcuTOTpMY4mS8BsB0Pjq6I3Fv
 vnzAUQxAVsOflaxxPfn1cNoFrmK9rZnaipAGyH+clXCcs2OnTM+fmHvxqCS834iqCGSz
 kYyi9y9ubtdi0H2wpdYXBeJtthYeMWkuDNZG6PAm9QYCJx1TxOQrA0qJY3TUrFBnwRBe
 KIoNPegbkIhqUxmvrYabqLZiaMm80VLLKkSINoVjBb/nftOA9eNoVLLdU0fkvP+d7U8I
 8PrQ==
X-Gm-Message-State: AOAM5307I+2pk6FjbpW9cdKorj2c69DiAuK5BXZcMbSn9XfeofSKV4Zj
 6FbQiUO4J0CRSX/7cG89aQ640H13yFz0ERPKtJeLKbuWkJbMys0c+huHs6jyWvZAXNWS204rUcB
 nkzzzx1ydz2hPo/6Nu/qA11C2kjj3gwCySPbEuTJBXQjYwfPezYZO2tUylsdX
X-Received: by 2002:a5d:548b:0:b0:1ed:e0b2:188c with SMTP id
 h11-20020a5d548b000000b001ede0b2188cmr9615834wrv.122.1646693138614; 
 Mon, 07 Mar 2022 14:45:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAMoh1uXk1xvuI+oMV9z+qE+znv2aRFSjT6IrPy4mY9FBReidZ0D2drH3XI5FUSEwd1t8Jyg==
X-Received: by 2002:a5d:548b:0:b0:1ed:e0b2:188c with SMTP id
 h11-20020a5d548b000000b001ede0b2188cmr9615818wrv.122.1646693138279; 
 Mon, 07 Mar 2022 14:45:38 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 p16-20020adff210000000b001f062b80091sm11230268wro.34.2022.03.07.14.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:45:37 -0800 (PST)
Date: Mon, 7 Mar 2022 17:45:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 20/47] tests/qtest/virtio-iommu-test: Check bypass config
Message-ID: <20220307224357.682101-21-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The bypass config field should be initialized to 1 by default.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-Id: <20220214124356.872985-5-jean-philippe@linaro.org>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/virtio-iommu-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/virtio-iommu-test.c b/tests/qtest/virtio-iommu-test.c
index 47e68388a0..068e7a9e6c 100644
--- a/tests/qtest/virtio-iommu-test.c
+++ b/tests/qtest/virtio-iommu-test.c
@@ -31,11 +31,13 @@ static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
     uint64_t input_range_end = qvirtio_config_readq(dev, 16);
     uint32_t domain_range_start = qvirtio_config_readl(dev, 24);
     uint32_t domain_range_end = qvirtio_config_readl(dev, 28);
+    uint8_t bypass = qvirtio_config_readb(dev, 36);
 
     g_assert_cmpint(input_range_start, ==, 0);
     g_assert_cmphex(input_range_end, ==, UINT64_MAX);
     g_assert_cmpint(domain_range_start, ==, 0);
     g_assert_cmpint(domain_range_end, ==, UINT32_MAX);
+    g_assert_cmpint(bypass, ==, 1);
 }
 
 static int read_tail_status(struct virtio_iommu_req_tail *buffer)
-- 
MST


