Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A466A84A6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 15:52:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkI6-0004s6-7W; Thu, 02 Mar 2023 09:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pXkI3-0004qB-PU
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:52:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pXkI2-0000kO-8g
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677768732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yUn0Rz5R2TjiNyHeFGFFUmi7CZa7t3CdZpIXPepLQ1E=;
 b=ZQTSBRlQHVMaZT2EzDSWJuvHsMeYW7722d2yU6GrQZu6gOy+I7L2uz8bHQFN+BYjbzYd1a
 /hvSJjiZds8AfA0JSLv80oBIU4sh6ZkJP2bpUFjgyTO6OLWPGidR+j+4RgZ+LrjEYg7B80
 +i2rI4Mru87KuM+uxSXYgBrcHGELqFc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-lTsAbz0TMI204qC-bK--Gw-1; Thu, 02 Mar 2023 09:52:11 -0500
X-MC-Unique: lTsAbz0TMI204qC-bK--Gw-1
Received: by mail-wr1-f71.google.com with SMTP id
 bh3-20020a05600005c300b002c70d6e2014so3301853wrb.10
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 06:52:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yUn0Rz5R2TjiNyHeFGFFUmi7CZa7t3CdZpIXPepLQ1E=;
 b=1hwX/QQwGYXijSrXJt2ZQzCqBKMEn8sZpxgAxEiUkLdTbUVwNcwaKnN+pGXanqWsfH
 dULsG8GWpkOQsEFZHARFi87wTjnWs1876B+R1ynZWxAsoP6RImnHePNwt47BGGglV9io
 C8Qs/lTcArmInHQwBBiIZy8S+ecY36HDMRk51k30VUxTSlJK5x4f3aZUzagSkvYvXwI7
 HviMuRQ69wTdrjPd+DVBLSLk2OvCaayRjzlQ6tFzTbRoRDvV5x/PDdrc4F5A0OTHEVr0
 bQ9TITXu26NmvKkgWhvCdq/lcl/Kj5xoNuW7YUqLcYduXz8WtDKEqk5zrLkfmNruZMNP
 FwXA==
X-Gm-Message-State: AO0yUKWStYmwp996RyrGrzmdUk4C5eNupo7UYaM7nlXBYwAIcJyY32n9
 soeenywOhDCv9KBRuFzJd7/iAzruTHYMpMQjrnQrH7DgR58SyiwzA+0NSIifvBniPDObqDHBmUv
 fUmTFrL6sTYKL0YQ=
X-Received: by 2002:a05:600c:713:b0:3ea:f883:4ce with SMTP id
 i19-20020a05600c071300b003eaf88304cemr7952063wmn.20.1677768730656; 
 Thu, 02 Mar 2023 06:52:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8WzvdThhEVvzNp2b3BC9QmVn5C74tSvpp58jC+0IpncD0yyhEHuuf6hdEGvVHJnXbKzD+4vg==
X-Received: by 2002:a05:600c:713:b0:3ea:f883:4ce with SMTP id
 i19-20020a05600c071300b003eaf88304cemr7952030wmn.20.1677768730372; 
 Thu, 02 Mar 2023 06:52:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c359500b003e0238d9101sm3469645wmq.31.2023.03.02.06.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 06:52:09 -0800 (PST)
Message-ID: <306ae516-54cd-6b63-4bdc-6cac17148c62@redhat.com>
Date: Thu, 2 Mar 2023 15:52:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/20] vfio/common: Add VFIOBitmap and (de)alloc
 functions
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, Avihai Horon <avihaih@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
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
 Tarun Gupta <targupta@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-8-avihaih@nvidia.com>
 <55b623e9-3f5a-1353-280c-e6012b5924e6@redhat.com>
 <8b8e68bb-7c22-e782-f2eb-4c423ae5d3b5@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <8b8e68bb-7c22-e782-f2eb-4c423ae5d3b5@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hello Joao,

On 3/2/23 14:24, Joao Martins wrote:
> On 27/02/2023 14:09, Cédric Le Goater wrote:
>> On 2/22/23 18:49, Avihai Horon wrote:
>>> --- a/hw/vfio/common.c
>>> +++ b/hw/vfio/common.c
>>> @@ -320,6 +320,41 @@ const MemoryRegionOps vfio_region_ops = {
>>>     * Device state interfaces
>>>     */
>>>    +typedef struct {
>>> +    unsigned long *bitmap;
>>> +    hwaddr size;
>>> +    hwaddr pages;
>>> +} VFIOBitmap;
>>> +
>>> +static VFIOBitmap *vfio_bitmap_alloc(hwaddr size)
>>> +{
>>> +    VFIOBitmap *vbmap = g_try_new0(VFIOBitmap, 1);
>>
>> I think using g_malloc0() for the VFIOBitmap should be fine. If QEMU can
>> not allocate a couple of bytes, we are in trouble anyway.
>>
> 
> OOM situations are rather unpredictable, and switching to g_malloc0 means we
> will exit ungracefully in the middle of fetching dirty bitmaps. And this
> function (vfio_bitmap_alloc) overall will be allocating megabytes for terabyte
> guests.
> 
> It would be ok if we are initializing, but this is at runtime when we do
> migration. I think we should stick with g_try_new0. exit on failure should be
> reserved to failure to switch the kernel migration state whereby we are likely
> to be dealing with a hardware failure and thus requires something more drastic.

I agree for large allocation :

     vbmap->bitmap = g_try_malloc0(vbmap->size);

but not for the smaller ones, like VFIOBitmap. You would have to
convert some other g_malloc0() calls, like the one allocating 'unmap'
in vfio_dma_unmap_bitmap(), to be consistent.

Given the size of VFIOBitmap, I think it could live on the stack in
routine vfio_dma_unmap_bitmap() and routine vfio_get_dirty_bitmap()
since the reference is not kept.

The 'vbmap' attribute of vfio_giommu_dirty_notifier does not need
to be a pointer either.

vfio_bitmap_alloc(hwaddr size) could then become
vfio_bitmap_init(VFIOBitmap *vbmap, hwaddr size).

Anyhow, this is minor. It would simplify a bit the exit path
and error handling.

Thanks,

C.




