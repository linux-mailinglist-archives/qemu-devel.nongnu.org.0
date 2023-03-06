Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533186AC994
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:16:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZERI-000245-2p; Mon, 06 Mar 2023 12:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZERB-00021z-45
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:15:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZER9-0005i7-DQ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:15:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678122946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+O0fU7wnprllsTYtZ8XsaUgPcIX8iIiCmBTy+dCjP0s=;
 b=Otg/sr478Eob0VTjKB649BOOWG400TEcyy47cBvvYJmsKFZl/7fTq4UqyyTXIHntzZJ4mS
 /u3xkkKkh3uEuTIBC1r3oaiAsMp5GaJtxr8anJRrxQpC/3c3a/UJ0XcufZp9dRJoLzZtW0
 +I9dAGvoVvtWBTRRf6d0vl1a6rJxLVY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-crY0MPXVPYyqHgGeUAZGDw-1; Mon, 06 Mar 2023 12:15:44 -0500
X-MC-Unique: crY0MPXVPYyqHgGeUAZGDw-1
Received: by mail-wr1-f70.google.com with SMTP id
 n6-20020a5d51c6000000b002ca3c48ba46so1641090wrv.4
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 09:15:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678122943;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+O0fU7wnprllsTYtZ8XsaUgPcIX8iIiCmBTy+dCjP0s=;
 b=Bu8kRpTHoG1KXgWfNcvSL1ZfZ9y8Xc5GUMShsC6wxeqFhtLYrEGADiUnP8IDT9xgD/
 XLTaHvVQGNokJoqZHvTDlR4agr1U0KL5y18zgsGsO2AtCbglCN+zlMKA6/AglMJhLc2x
 WZgRbMACQsKHVCK/bxZVOTwji3PnY4dM07xslgsfxVBujABlc16tAh7ouJ2t+wluzAhO
 lNJKm/ik1y+wohqicTbjrlPZbLzyWInrj7VWheOPULjxoru2JULDZqCIDSD9a2yguE8P
 tLRAZmU4rnYMSXC4hcWL3fXCOKx8f1CtUsIH0RgvIH/Wbht31BN6LiXtqQdsnAqLcYR+
 CGaQ==
X-Gm-Message-State: AO0yUKVnIY6upaIcHek5wOHHoMgcx0qoLDZX4xpvv4KhW5wh6KsJHiAk
 0Vs2axrq6B0jsz04ZTlIQnXwUUxOjRUr2CoBJfAO4J56aAMg6AAq80Eqj1ZgfNIKmsrKnXBdQs0
 ztnNLpNi0jToaxiQ=
X-Received: by 2002:adf:fcc9:0:b0:2c7:15fc:9262 with SMTP id
 f9-20020adffcc9000000b002c715fc9262mr7715979wrs.3.1678122943206; 
 Mon, 06 Mar 2023 09:15:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9f8h9nd2cr+1F35dNWF7iPJOMh+FYkaqEZkxeXpaOgchujyqVNGj69xMXrPJ9eRLy8cr9Udg==
X-Received: by 2002:adf:fcc9:0:b0:2c7:15fc:9262 with SMTP id
 f9-20020adffcc9000000b002c715fc9262mr7715957wrs.3.1678122942900; 
 Mon, 06 Mar 2023 09:15:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 f9-20020adfdb49000000b002c59c6abc10sm10577150wrj.115.2023.03.06.09.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 09:15:42 -0800 (PST)
Message-ID: <6ac284df-144d-a71d-5d65-6b14969fdf7b@redhat.com>
Date: Mon, 6 Mar 2023 18:15:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 13/13] docs/devel: Document VFIO device dirty page
 tracking
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-14-joao.m.martins@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230304014343.33646-14-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/4/23 02:43, Joao Martins wrote:
> From: Avihai Horon <avihaih@nvidia.com>
> 
> Adjust the VFIO dirty page tracking documentation and add a section to
> describe device dirty page tracking.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>   docs/devel/vfio-migration.rst | 46 +++++++++++++++++++++++------------
>   1 file changed, 31 insertions(+), 15 deletions(-)
> 
> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
> index c214c73e2818..1b68ccf11529 100644
> --- a/docs/devel/vfio-migration.rst
> +++ b/docs/devel/vfio-migration.rst
> @@ -59,22 +59,37 @@ System memory dirty pages tracking
>   ----------------------------------
>   
>   A ``log_global_start`` and ``log_global_stop`` memory listener callback informs
> -the VFIO IOMMU module to start and stop dirty page tracking. A ``log_sync``
> -memory listener callback marks those system memory pages as dirty which are
> -used for DMA by the VFIO device. The dirty pages bitmap is queried per
> -container. All pages pinned by the vendor driver through external APIs have to
> -be marked as dirty during migration. When there are CPU writes, CPU dirty page
> -tracking can identify dirtied pages, but any page pinned by the vendor driver
> -can also be written by the device. There is currently no device or IOMMU
> -support for dirty page tracking in hardware.
> +the VFIO dirty tracking module to start and stop dirty page tracking. A
> +``log_sync`` memory listener callback queries the dirty page bitmap from the
> +dirty tracking module and marks system memory pages which were DMA-ed by the
> +VFIO device as dirty. The dirty page bitmap is queried per container.
> +
> +Currently there are two ways dirty page tracking can be done:
> +(1) Device dirty tracking:
> +In this method the device is responsible to log and report its DMAs. This
> +method can be used only if the device is capable of tracking its DMAs.
> +Discovering device capability, starting and stopping dirty tracking, and
> +syncing the dirty bitmaps from the device are done using the DMA logging uAPI.
> +More info about the uAPI can be found in the comments of the
> +``vfio_device_feature_dma_logging_control`` and
> +``vfio_device_feature_dma_logging_report`` structures in the header file
> +linux-headers/linux/vfio.h.
> +
> +(2) VFIO IOMMU module:
> +In this method dirty tracking is done by IOMMU. However, there is currently no
> +IOMMU support for dirty page tracking. For this reason, all pages are
> +perpetually marked dirty, unless the device driver pins pages through external
> +APIs in which case only those pinned pages are perpetually marked dirty.
> +
> +If the above two methods are not supported, all pages are perpetually marked
> +dirty by QEMU.
>   
>   By default, dirty pages are tracked during pre-copy as well as stop-and-copy
> -phase. So, a page pinned by the vendor driver will be copied to the destination
> -in both phases. Copying dirty pages in pre-copy phase helps QEMU to predict if
> -it can achieve its downtime tolerances. If QEMU during pre-copy phase keeps
> -finding dirty pages continuously, then it understands that even in stop-and-copy
> -phase, it is likely to find dirty pages and can predict the downtime
> -accordingly.
> +phase. So, a page marked as dirty will be copied to the destination in both
> +phases. Copying dirty pages in pre-copy phase helps QEMU to predict if it can
> +achieve its downtime tolerances. If QEMU during pre-copy phase keeps finding
> +dirty pages continuously, then it understands that even in stop-and-copy phase,
> +it is likely to find dirty pages and can predict the downtime accordingly.
>   
>   QEMU also provides a per device opt-out option ``pre-copy-dirty-page-tracking``
>   which disables querying the dirty bitmap during pre-copy phase. If it is set to
> @@ -89,7 +104,8 @@ phase of migration. In that case, the unmap ioctl returns any dirty pages in
>   that range and QEMU reports corresponding guest physical pages dirty. During
>   stop-and-copy phase, an IOMMU notifier is used to get a callback for mapped
>   pages and then dirty pages bitmap is fetched from VFIO IOMMU modules for those
> -mapped ranges.
> +mapped ranges. If device dirty tracking is enabled with vIOMMU, live migration
> +will be blocked.

There is a limitation with multiple devices also.

Thanks,

C.

>   
>   Flow of state changes during Live migration
>   ===========================================


