Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B0F4F6C54
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 23:14:03 +0200 (CEST)
Received: from localhost ([::1]:49702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncCyY-0000DY-LM
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 17:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncCwf-0006cC-Tu
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 17:12:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncCwe-0004kj-BN
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 17:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649279523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FgcfXjrvJer0JVW/CZeVkZHv48jUQO407BOciY2GhX8=;
 b=gl19ZuJpwjS3u9sc164x3qej0n4RFlaQuFSGX9MvF1jbNNMKNmAzA8B9FNuYigiMto3+do
 fKBJacRMw+yrxXNkZdYTuWC5KWaWy3XbwR5dfOSZjIWDEXqS3c5kUEG1JqDihdpTRh8X0y
 00d0nY0Gzb63uJafSmxpdJ8I4CBXG+w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-R_Nsf5k4MpmviIFT-LZDig-1; Wed, 06 Apr 2022 17:12:02 -0400
X-MC-Unique: R_Nsf5k4MpmviIFT-LZDig-1
Received: by mail-wm1-f70.google.com with SMTP id
 o35-20020a05600c512300b0038e83a52c71so950868wms.7
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 14:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FgcfXjrvJer0JVW/CZeVkZHv48jUQO407BOciY2GhX8=;
 b=VAnNGh3Fk+xm8VPEBC9nDDKCuxXNTkQ134NcpjhxoZk9HGQisL8nn2ISQosPF6Pwz0
 UgNUV1fXJ3FPFeBuaj3qrjbMzxKvX2OXRDJtB3JN+FplWnKoGD3Sbs/EHm+7jL3S2HC8
 hRwli9QVClTieEbmD7YUhmdOQ2zOkfDsFJx9vPFMUSNu6YmwhjSbPJfagJVEk5jl8C7f
 Dp5vLjFrbWNqScr/soWrqcssGd+rXPEcgfXnsJi99D/et5XYfzbPaHeW4M7k7PUSApO2
 k39YIB0ALm60f97S85KS11cDd4pgWwZ0s/djNecz2A8X02nOIXr4Dv4/g3G6tQsNO9V+
 VW/Q==
X-Gm-Message-State: AOAM532+U+E9TzMLSsOEgaixZb891uruQDHt6MnH0Fnur0Pd5GRCQZgm
 k1TwfUAYaTvOstIAozrONtmtDkhYQ4rkkwmE2gF88p8EmSmdBqWgnYNCvv0mStT5L3Ay4sUt+bf
 KxBO/eLbbIIbT7L6POi+DdvWAifmawL9QYvL2Tga1Vz7K1mCWXaXi7AFxROOZ
X-Received: by 2002:a7b:c841:0:b0:389:864c:e715 with SMTP id
 c1-20020a7bc841000000b00389864ce715mr9007641wml.72.1649279521267; 
 Wed, 06 Apr 2022 14:12:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrQwDzLm2Y4Hpa4vKPPxf59khHZXhrHPgl4SftYnfUtTiylUhs8bC94aJxCk9/mgcZf+Cgow==
X-Received: by 2002:a7b:c841:0:b0:389:864c:e715 with SMTP id
 c1-20020a7bc841000000b00389864ce715mr9007617wml.72.1649279520837; 
 Wed, 06 Apr 2022 14:12:00 -0700 (PDT)
Received: from redhat.com ([2.52.15.99]) by smtp.gmail.com with ESMTPSA id
 p16-20020a5d48d0000000b00205cf199abcsm15122209wrs.46.2022.04.06.14.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:12:00 -0700 (PDT)
Date: Wed, 6 Apr 2022 17:11:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] virtio-iommu: use-after-free fix
Message-ID: <20220406211137.38840-4-mst@redhat.com>
References: <20220406211137.38840-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220406211137.38840-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Wentao Liang <Wentao_Liang_g@163.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wentao Liang <Wentao_Liang_g@163.com>

A potential Use-after-free was reported in virtio_iommu_handle_command
when using virtio-iommu:

> I find a potential Use-after-free in QEMU 6.2.0, which is in
> virtio_iommu_handle_command() (./hw/virtio/virtio-iommu.c).
>
>
> Specifically, in the loop body, the variable 'buf' allocated at line 639 can be
> freed by g_free() at line 659. However, if the execution path enters the loop
> body again and the if branch takes true at line 616, the control will directly
> jump to 'out' at line 651. At this time, 'buf' is a freed pointer, which is not
> assigned with an allocated memory but used at line 653. As a result, a UAF bug
> is triggered.
>
>
>
> 599     for (;;) {
> ...
> 615         sz = iov_to_buf(iov, iov_cnt, 0, &head, sizeof(head));
> 616         if (unlikely(sz != sizeof(head))) {
> 617             tail.status = VIRTIO_IOMMU_S_DEVERR;
> 618             goto out;
> 619         }
> ...
> 639             buf = g_malloc0(output_size);
> ...
> 651 out:
> 652         sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
> 653                           buf ? buf : &tail, output_size);
> ...
> 659         g_free(buf);
>
> We can fix it by set ‘buf‘ to NULL after freeing it:
>
>
> 651 out:
> 652         sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
> 653                           buf ? buf : &tail, output_size);
> ...
> 659         g_free(buf);
> +++ buf = NULL;
> 660     }

Fix as suggested by the reporter.

Signed-off-by: Wentao Liang <Wentao_Liang_g@163.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20220406040445-mutt-send-email-mst@kernel.org>
---
 hw/virtio/virtio-iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 239fe97b12..2b1d21edd1 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -683,6 +683,7 @@ out:
         virtio_notify(vdev, vq);
         g_free(elem);
         g_free(buf);
+        buf = NULL;
     }
 }
 
-- 
MST


