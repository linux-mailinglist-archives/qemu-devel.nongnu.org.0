Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A234CD63C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:21:43 +0100 (CET)
Received: from localhost ([::1]:43516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8oQ-0005V5-63
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:21:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8AX-0002sm-S6
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8AW-0000vj-9F
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wqPGtWFCVDPRGhVgRp/c/kDyoLIXiZZqdrhcBaAKsjU=;
 b=JT+J2VJZxIsYuaooEigUjycdSWnbOwMzOF57Pdx2da1ZzjWu2Ue6+9pWSfXGXeTUuVe6wy
 sHl6qyd80vVmTN1d+8nSvx9jwevhv6w4oFbzkpJ8LwA8nIbZj6nS5zVKQaKOGzBBV/Y4Pi
 ij+JZ50QXzl7aLySRaw41zAfk7E0r10=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-bGopWifKNZKn-Inm9pKhqQ-1; Fri, 04 Mar 2022 08:40:26 -0500
X-MC-Unique: bGopWifKNZKn-Inm9pKhqQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 z16-20020adff1d0000000b001ef7dc78b23so3371545wro.12
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wqPGtWFCVDPRGhVgRp/c/kDyoLIXiZZqdrhcBaAKsjU=;
 b=ibd19zB4/iwjnc2HGl2i/LnqULBA39VtdNJPO4cJeeuUyC0oQ/Oh7WSVMCWEp2kWQB
 H0ad/Q2LUZd46UpG83OycLzuebv7UTKHWpJlEN25OyAnb6mjmJIBgqKApFIKiSOHHWAh
 jqZrrYLrp5cGUGt2Fi33psUYQLl/JcvjAXT+OBzvxZsX//zS4iIyKW4MI9MON+NY6jh1
 OwwefgiiVKM4Vv8DH6qCY674G2FMMSVbcNeJ3FpgqrH1K3Vq6hET6rhwslP8o1IM/vm3
 EIfz6VflsHOJLjNQpZfgXn4vHtg2ZD+M3RyNq46X7BoVFIVga25VMU9zJAOD2sq5sd9Y
 ylbQ==
X-Gm-Message-State: AOAM533MUouvc08ezDH+RAf4CTGVCt8H5fW9KMsBe0+Gk5ukQnlyFWpj
 e0iRZP00HZ02xuIwH9sxdEfK6Bab7/6K1jjvTF9Jadw0IdOFSzMu4gF9M6miC8K0SjedwT+q2xA
 6kyDnG0No13rJZLlREH/4enJOG/HBXznfijxB2Yoto8Kv8AV2zNL+yhCjiGRq
X-Received: by 2002:a5d:6d8e:0:b0:1f0:3594:c3e with SMTP id
 l14-20020a5d6d8e000000b001f035940c3emr9401239wrs.44.1646401225238; 
 Fri, 04 Mar 2022 05:40:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6xoWAtNCxVRPx4XYKP2blsCaZb1H27Us8mPQEDtdeUN0PVQ8WTShLTIk6qQ2nT2ZT19USGw==
X-Received: by 2002:a5d:6d8e:0:b0:1f0:3594:c3e with SMTP id
 l14-20020a5d6d8e000000b001f035940c3emr9401219wrs.44.1646401225013; 
 Fri, 04 Mar 2022 05:40:25 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 s17-20020adfbc11000000b001f023d197b8sm4614847wrg.68.2022.03.04.05.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:40:20 -0800 (PST)
Date: Fri, 4 Mar 2022 08:40:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/45] tests/qtest/virtio-iommu-test: Check bypass config
Message-ID: <20220304133556.233983-25-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


