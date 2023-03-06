Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B526AC9BE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:22:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZEX7-00075N-Hm; Mon, 06 Mar 2023 12:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZEX4-0006vd-NL
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:21:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZEX2-0007ap-VY
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678123312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQMfELcYkhQkl6bPhRh8e6dV4w2Vxq0s8+j7TmYxHwc=;
 b=EsJvxyFx3v7a1p+Zn6Qzii3ntEqG2IaKgLM+KBHI8VoTVDNjdsdVcAabvH2Kflj3ggK9nK
 IPnN01mfXADxZgi9qpOsf+uPjVlmXKQjyYYb6of4YAO4NU3+GHOQw0aoUlGz+oPi672T6W
 hoCuhGGRzInlh15Z0JE5cZcY14f9S2M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-X6U14sloP2uW6pVZh8nIJw-1; Mon, 06 Mar 2023 12:21:47 -0500
X-MC-Unique: X6U14sloP2uW6pVZh8nIJw-1
Received: by mail-wr1-f72.google.com with SMTP id
 m10-20020adfe94a000000b002cdc5eac0d0so1658576wrn.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 09:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678123305;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gQMfELcYkhQkl6bPhRh8e6dV4w2Vxq0s8+j7TmYxHwc=;
 b=a8D9Uu8M3TyQavrNZhlIJrhfig/S04ifNHQVf4BJvEcU4RtlSbwBqwUh46SsWeLD3H
 WIKoc/Pq/hNEHhCzJlSftqF7oZzM/2laT44dPolpHM7FOtyIup4VzbrhKwog7ceW+e2t
 ttfc0JVVtcTouzx04mVteqhUBo7B/L4o+VFsK38QncScm9xt39RTiv5Pd5Mh1rpXuLMR
 1+V7P7VajOqojZBl7i/Tj7D1udtNf0FGHWsPr6xlYP001d21u3wgRfuAbmr+ATEjFkCK
 s83bJ35JEgL0xFby/WbY7Um6wOUmaPQZF3RvlcHAZePbzrsps+y9EDGi3c1z9QUwC/7A
 uZtA==
X-Gm-Message-State: AO0yUKVnj+iA18ge+IATIU+vSHM94BzktrV5eUe+yPixdTIbUe7+gypE
 Lf9OQlODnGlAk+GTxRBPIq4KDdQkSsMVkM0muZqeiWisbzizMNOKFI/YyxY+1pf6pQFrIneZSZS
 5fUKLEYJYYHg+HQg=
X-Received: by 2002:a5d:4b8a:0:b0:2c9:9b81:11de with SMTP id
 b10-20020a5d4b8a000000b002c99b8111demr8262483wrt.20.1678123305620; 
 Mon, 06 Mar 2023 09:21:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/QnVJAoAWhRL5glFB9fiKqYBMdOmjPvR4ZXkHBgdVz/OepuqAsevvP5G6G+c2aMtANhCsQ1A==
X-Received: by 2002:a5d:4b8a:0:b0:2c9:9b81:11de with SMTP id
 b10-20020a5d4b8a000000b002c99b8111demr8262469wrt.20.1678123305350; 
 Mon, 06 Mar 2023 09:21:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a5d658a000000b002c70851fdd8sm10407309wru.75.2023.03.06.09.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 09:21:45 -0800 (PST)
Message-ID: <2a6ba9a1-59b0-c54c-3b70-fe7b930e1e60@redhat.com>
Date: Mon, 6 Mar 2023 18:21:44 +0100
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
 <6ac284df-144d-a71d-5d65-6b14969fdf7b@redhat.com>
 <58e2daab-d8da-a572-6297-807cecc2852c@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <58e2daab-d8da-a572-6297-807cecc2852c@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
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

On 3/6/23 18:18, Joao Martins wrote:
> 
> 
> On 06/03/2023 17:15, Cédric Le Goater wrote:
>> On 3/4/23 02:43, Joao Martins wrote:
>>> From: Avihai Horon <avihaih@nvidia.com>
>>>
>>> Adjust the VFIO dirty page tracking documentation and add a section to
>>> describe device dirty page tracking.
>>>
>>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>>> ---
>>>    docs/devel/vfio-migration.rst | 46 +++++++++++++++++++++++------------
>>>    1 file changed, 31 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
>>> index c214c73e2818..1b68ccf11529 100644
>>> --- a/docs/devel/vfio-migration.rst
>>> +++ b/docs/devel/vfio-migration.rst
>>> @@ -59,22 +59,37 @@ System memory dirty pages tracking
>>>    ----------------------------------
>>>      A ``log_global_start`` and ``log_global_stop`` memory listener callback
>>> informs
>>> -the VFIO IOMMU module to start and stop dirty page tracking. A ``log_sync``
>>> -memory listener callback marks those system memory pages as dirty which are
>>> -used for DMA by the VFIO device. The dirty pages bitmap is queried per
>>> -container. All pages pinned by the vendor driver through external APIs have to
>>> -be marked as dirty during migration. When there are CPU writes, CPU dirty page
>>> -tracking can identify dirtied pages, but any page pinned by the vendor driver
>>> -can also be written by the device. There is currently no device or IOMMU
>>> -support for dirty page tracking in hardware.
>>> +the VFIO dirty tracking module to start and stop dirty page tracking. A
>>> +``log_sync`` memory listener callback queries the dirty page bitmap from the
>>> +dirty tracking module and marks system memory pages which were DMA-ed by the
>>> +VFIO device as dirty. The dirty page bitmap is queried per container.
>>> +
>>> +Currently there are two ways dirty page tracking can be done:
>>> +(1) Device dirty tracking:
>>> +In this method the device is responsible to log and report its DMAs. This
>>> +method can be used only if the device is capable of tracking its DMAs.
>>> +Discovering device capability, starting and stopping dirty tracking, and
>>> +syncing the dirty bitmaps from the device are done using the DMA logging uAPI.
>>> +More info about the uAPI can be found in the comments of the
>>> +``vfio_device_feature_dma_logging_control`` and
>>> +``vfio_device_feature_dma_logging_report`` structures in the header file
>>> +linux-headers/linux/vfio.h.
>>> +
>>> +(2) VFIO IOMMU module:
>>> +In this method dirty tracking is done by IOMMU. However, there is currently no
>>> +IOMMU support for dirty page tracking. For this reason, all pages are
>>> +perpetually marked dirty, unless the device driver pins pages through external
>>> +APIs in which case only those pinned pages are perpetually marked dirty.
>>> +
>>> +If the above two methods are not supported, all pages are perpetually marked
>>> +dirty by QEMU.
>>>      By default, dirty pages are tracked during pre-copy as well as stop-and-copy
>>> -phase. So, a page pinned by the vendor driver will be copied to the destination
>>> -in both phases. Copying dirty pages in pre-copy phase helps QEMU to predict if
>>> -it can achieve its downtime tolerances. If QEMU during pre-copy phase keeps
>>> -finding dirty pages continuously, then it understands that even in stop-and-copy
>>> -phase, it is likely to find dirty pages and can predict the downtime
>>> -accordingly.
>>> +phase. So, a page marked as dirty will be copied to the destination in both
>>> +phases. Copying dirty pages in pre-copy phase helps QEMU to predict if it can
>>> +achieve its downtime tolerances. If QEMU during pre-copy phase keeps finding
>>> +dirty pages continuously, then it understands that even in stop-and-copy phase,
>>> +it is likely to find dirty pages and can predict the downtime accordingly.
>>>      QEMU also provides a per device opt-out option
>>> ``pre-copy-dirty-page-tracking``
>>>    which disables querying the dirty bitmap during pre-copy phase. If it is set to
>>> @@ -89,7 +104,8 @@ phase of migration. In that case, the unmap ioctl returns
>>> any dirty pages in
>>>    that range and QEMU reports corresponding guest physical pages dirty. During
>>>    stop-and-copy phase, an IOMMU notifier is used to get a callback for mapped
>>>    pages and then dirty pages bitmap is fetched from VFIO IOMMU modules for those
>>> -mapped ranges.
>>> +mapped ranges. If device dirty tracking is enabled with vIOMMU, live migration
>>> +will be blocked.
>>
>> There is a limitation with multiple devices also.
>>
> I'm aware. I just didn't write it because the section I am changing is specific
> to vIOMMU.


Ah OK. I didn't check, sorry.

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.



