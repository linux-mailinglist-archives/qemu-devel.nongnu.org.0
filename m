Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B0A6A447E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:34:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeZg-0003Uh-HH; Mon, 27 Feb 2023 09:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pWeVs-0006TB-2K
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:30:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pWeVn-0004kP-St
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677508194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cB7b4NOzsdHJaCJmtX53q4cv1maiCDZThMwjoVeIMBk=;
 b=QFLUIOzMkJWtmrzSoXj/mAYpgqtHJzMhwv55Yf7W2GYitncPZCCTGvl775ePb6VesARkXs
 J7S1Q+lN9cgfHQIUd8SVEoN1dft63b7muGTKXrMc3ktjvNtb3GtTzJkgAFcNvjtsBidnAL
 +r+YqM/uyDZmmTMXq+hMEFyo0jSn/KY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-xXUSV909OYSik0BtzNGiEw-1; Mon, 27 Feb 2023 09:29:53 -0500
X-MC-Unique: xXUSV909OYSik0BtzNGiEw-1
Received: by mail-qv1-f72.google.com with SMTP id
 jh21-20020a0562141fd500b0053c23b938a0so3424862qvb.17
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:29:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cB7b4NOzsdHJaCJmtX53q4cv1maiCDZThMwjoVeIMBk=;
 b=V3TJUS0IH0/oBAqslJqUIT1pOvi5TzqYwYnfD61nlgAZWhrBBuN09rdmjoPqm0ssrt
 mKPIAfofde15m/hzKqpz8uuIr1EgqDBuYiqG7f1kIMahoXdSMjC5eVi9K6Ynn8NL9Z+l
 5twVoL1hs3beTDNsDxdH+jDjLzP0qwbhZzXqixzUakT8l5t4Gh9rKyFwHR1g86EkHJuc
 XpF1E3tzh2p6NjKGVLn+q704j/zKNM558Aw9plg4vNSxL9CTlvmINotnjEBidy1AJewf
 lT09VCjqz2hLmojXvfIXFT3sm1UJ70QEzFyFObHkGStf+EV0S+w6V2EhUj4c5YBuHprB
 w/bw==
X-Gm-Message-State: AO0yUKXBnOalr2Pq024E5skg4hPLMXASJPKgTGL6AKwdHXUB3SMOFEF9
 faIQd0vOvHF/oXZkHIexQEkaf4EIgCyURI5otBxBng9Wnc5HF9i6VIrXKlTuvlkAqu7+nuVZTzg
 NDGA8OdfWuzhof3k=
X-Received: by 2002:a05:6214:d84:b0:56e:9f19:71f9 with SMTP id
 e4-20020a0562140d8400b0056e9f1971f9mr16024308qve.17.1677508192622; 
 Mon, 27 Feb 2023 06:29:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8Zrl+nG6bnPnjnDh41u2QUyIPSE2FRHDtUIRiiot7VvTT81z7TnmByT6lGqaNA46MkwVVWzw==
X-Received: by 2002:a05:6214:d84:b0:56e:9f19:71f9 with SMTP id
 e4-20020a0562140d8400b0056e9f1971f9mr16024273qve.17.1677508192307; 
 Mon, 27 Feb 2023 06:29:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a05620a205900b0073d873df3fesm5004197qka.30.2023.02.27.06.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 06:29:51 -0800 (PST)
Message-ID: <72f9f389-88ac-3320-3707-ae02eedf6075@redhat.com>
Date: Mon, 27 Feb 2023 15:29:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 20/20] docs/devel: Document VFIO device dirty page
 tracking
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-21-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230222174915.5647-21-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/22/23 18:49, Avihai Horon wrote:
> Adjust the VFIO dirty page tracking documentation and add a section to
> describe device dirty page tracking.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   docs/devel/vfio-migration.rst | 50 ++++++++++++++++++++++-------------
>   1 file changed, 32 insertions(+), 18 deletions(-)
> 
> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
> index ba80b9150d..a432cda081 100644
> --- a/docs/devel/vfio-migration.rst
> +++ b/docs/devel/vfio-migration.rst
> @@ -71,22 +71,37 @@ System memory dirty pages tracking
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
> @@ -97,10 +112,9 @@ System memory dirty pages tracking when vIOMMU is enabled
>   ---------------------------------------------------------
>   
>   With vIOMMU, an IO virtual address range can get unmapped while in pre-copy
> -phase of migration. In that case, the unmap ioctl returns any dirty pages in
> -that range and QEMU reports corresponding guest physical pages dirty. During
> -stop-and-copy phase, an IOMMU notifier is used to get a callback for mapped
> -pages and then dirty pages bitmap is fetched from VFIO IOMMU modules for those
> +phase of migration. In that case, dirty page bitmap for this range is queried
> +and synced with QEMU. During stop-and-copy phase, an IOMMU notifier is used to
> +get a callback for mapped pages and then dirty page bitmap is fetched for those
>   mapped ranges.
>   
>   Flow of state changes during Live migration


