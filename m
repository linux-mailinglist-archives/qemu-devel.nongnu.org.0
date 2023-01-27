Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA2067F24C
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 00:38:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLYHj-0003LT-P0; Fri, 27 Jan 2023 18:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pLYHf-0003LC-HQ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:37:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pLYHd-0003FB-Ky
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674862644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wm1btNP9Qlkq4UOn/UHvZ3pa5JMW10SEl0/wX5AKrL8=;
 b=N6cOOTyiJFLTKsecvGW3Rv0JEVHhB/IaWljHHARJdxbGecduAhfGfqZILoajTimCgfhe3O
 DzjIS0SKw2/vhVl6c0Ii1IBL0l6fUCeAhX5mVxmxbddv+hHsW+SYGgKAIdg2jTh2XUVMGF
 G/NdzhAjrmiRdvNPQTu5shoB8+Z9R+U=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-juw6_qDkPbWSBhA--ptFAw-1; Fri, 27 Jan 2023 18:37:23 -0500
X-MC-Unique: juw6_qDkPbWSBhA--ptFAw-1
Received: by mail-il1-f200.google.com with SMTP id
 j7-20020a056e02014700b00310d217f518so1173951ilr.2
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 15:37:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wm1btNP9Qlkq4UOn/UHvZ3pa5JMW10SEl0/wX5AKrL8=;
 b=eJ5KGTah8BqfjRfaX+HpQfXGDe1R7nCP8DCHB3hMd1HiHajppad6Ior+EDzBhr68II
 /5XjPzqzkIn3NZuFvtVTpTCntbMGDYEClwbzkm65KQSsx+Kh+u8LqyAv3MdYR6FMJsPw
 SyNyKor39Ko+WBucCpd5OGWCXXGMf26XspGmUoebWiWkbfzwmqKVJWIny8BmeMUNTxmw
 TXyFjPKe6Pq+ST0dS8C0UJS3GyoLkSdPr4WbJF0j49VCGv/E7Onln2A/iU4VB9VVHFMC
 jZH1PtQSMH6QWDkE/V4UdPfLR+IWT7fe/lKn2ygVv/N/XBXSdjE7nmqqQ5jaMzhpOpDZ
 YPxg==
X-Gm-Message-State: AO0yUKVowB0T1qLmTho1NDINjbvguVkJ3fCT/KwEfcbvkVmsPPMe8cAP
 bIJg01Udmz50OWAmItFoaE2+/bEwAsrheC+FJHoxZdKTh5yI/XypOSLGk2QzvRtQ6tr9EF+Elfw
 YNWPuOqd84pIvNzc=
X-Received: by 2002:a05:6e02:1b81:b0:310:be09:7aa6 with SMTP id
 h1-20020a056e021b8100b00310be097aa6mr5496341ili.13.1674862642607; 
 Fri, 27 Jan 2023 15:37:22 -0800 (PST)
X-Google-Smtp-Source: AK7set8L3WeyzSnT6Ml5hRxYQ4MCcHOCU3SZc92QiwtXDlMc8TPIK7D7ZQ6ehb4ADp5G/3P2laROOA==
X-Received: by 2002:a05:6e02:1b81:b0:310:be09:7aa6 with SMTP id
 h1-20020a056e021b8100b00310be097aa6mr5496321ili.13.1674862642316; 
 Fri, 27 Jan 2023 15:37:22 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g1-20020a056e02130100b0031097a03904sm1662451ilr.32.2023.01.27.15.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 15:37:21 -0800 (PST)
Date: Fri, 27 Jan 2023 16:37:19 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu
 <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Paolo Bonzini" <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "David Hildenbrand" <david@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 11/18] vfio/common: Add device dirty page bitmap sync
Message-ID: <20230127163719.43e8729c.alex.williamson@redhat.com>
In-Reply-To: <20230126184948.10478-12-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-12-avihaih@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Thu, 26 Jan 2023 20:49:41 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Add device dirty page bitmap sync functionality. This uses the device
> DMA logging uAPI to sync dirty page bitmap from the device.
> 
> Device dirty page bitmap sync is used only if all devices within a
> container support device dirty page tracking.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  hw/vfio/common.c | 93 ++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 82 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 3caa73d6f7..0003f2421d 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -355,6 +355,9 @@ static void vfio_bitmap_dealloc(VFIOBitmap *vbmap)
>      g_free(vbmap);
>  }
>  
> +static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
> +                                 uint64_t size, ram_addr_t ram_addr);
> +
>  bool vfio_mig_active(void)
>  {
>      VFIOGroup *group;
> @@ -582,10 +585,19 @@ static int vfio_dma_unmap(VFIOContainer *container,
>          .iova = iova,
>          .size = size,
>      };
> +    int ret;
>  
> -    if (iotlb && container->dirty_pages_supported &&
> -        vfio_devices_all_running_and_mig_active(container)) {
> -        return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
> +    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
> +        if (!vfio_devices_all_device_dirty_tracking(container) &&
> +            container->dirty_pages_supported) {
> +            return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
> +        }
> +
> +        ret = vfio_get_dirty_bitmap(container, iova, size,
> +                                    iotlb->translated_addr);
> +        if (ret) {
> +            return ret;
> +        }

Isn't the ordering backwards here?  Only after the range is unmapped
can we know that this container can no longer dirty pages within the
range.  Thanks,

Alex


