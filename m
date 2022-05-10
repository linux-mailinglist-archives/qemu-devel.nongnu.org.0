Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A6F520E2D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 08:54:35 +0200 (CEST)
Received: from localhost ([::1]:41600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noJlR-0000EF-Ut
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 02:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1noJiu-00079g-L3
 for qemu-devel@nongnu.org; Tue, 10 May 2022 02:51:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1noJir-0001P2-F0
 for qemu-devel@nongnu.org; Tue, 10 May 2022 02:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652165511;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DP2piwxUgQrunPRJKq8MgqTTTot5/VOKK/aVg2H9TDc=;
 b=UOR9r+jew93+FkIxnWtFZXj/OKX8ynu9oZtQ4Rr+l53347F9efhhl9BYb+azzvgWfrmFiT
 9mOGzMYVU/N1mdcvStwkiq1GO4mnNxgil8U+Vuak2m+OPEmcpZHa7qA4tNsP6MzmHZAmP9
 VWiWiwj6fvf2h1FS8sz24cyLkQHNVoc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-TqVp67mXMoWw2Pvz8GwHKQ-1; Tue, 10 May 2022 02:51:50 -0400
X-MC-Unique: TqVp67mXMoWw2Pvz8GwHKQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v17-20020a056000163100b0020c9b0e9039so5614439wrb.18
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 23:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DP2piwxUgQrunPRJKq8MgqTTTot5/VOKK/aVg2H9TDc=;
 b=GHrIvI8EfUVxKWMf0yMbz0tyKDIiYQC6lNDI75YwYkvwzXa54AoW1b8EUgH4ZLhRty
 +cfiqUiJTi9yvtA9lUZL3DT4fAQAtDWNA5jdVI7NT6RHcm/mJ+MnXGwaW22vlC4Lh8eR
 KybtrcuYyUyi2T2xcVRdRFD6fnls4PP5S0v2pizg9IIlKc3sq/NEtj60N1AWRdugPB2O
 w/YhTUSxdfnib53mCZhuZMSguYzGCb5hZdRO0+J856M8fvC13/6orvdD3EaQ4xwoWyRa
 uNSM/raHXvqZOB0kAeGU72TQ7QWBsQPEGGA0wcwpmtnQYjnDh86546RfS1G7zNBGy3Xt
 0Pqw==
X-Gm-Message-State: AOAM531uAieI4NGJe3tw1PeoIR7QAXWRjDgbjRwXWco+ic7fajbyPyRU
 Q7CyXB+i8uCkKvaMte7QzFSt/SgwEFdt1Fjh8FO0nDYaLO1IpsjuY8NibCyb510/z2ehat3mbDS
 8crF1ZsT50LidApI=
X-Received: by 2002:a05:600c:4e05:b0:394:8955:839a with SMTP id
 b5-20020a05600c4e0500b003948955839amr11668685wmq.28.1652165506809; 
 Mon, 09 May 2022 23:51:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLkKWIzsFygKuwcetfNYenSE7NwJJluGTLLeDEm3O52poU+xby0OLO3xZ0oMzX/PvC0iTcrg==
X-Received: by 2002:a05:600c:4e05:b0:394:8955:839a with SMTP id
 b5-20020a05600c4e0500b003948955839amr11668652wmq.28.1652165506569; 
 Mon, 09 May 2022 23:51:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a5d6912000000b0020c5253d913sm12928292wru.95.2022.05.09.23.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 23:51:45 -0700 (PDT)
Message-ID: <720d56c8-da84-5e4d-f1f8-0e1878473b93@redhat.com>
Date: Tue, 10 May 2022 08:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
Content-Language: en-US
To: Yi Liu <yi.l.liu@intel.com>, Zhangfei Gao <zhangfei.gao@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "chao.p.peng@intel.com" <chao.p.peng@intel.com>,
 "yi.y.sun@intel.com" <yi.y.sun@intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <4f920d463ebf414caa96419b625632d5@huawei.com>
 <be8aa86a-25d1-d034-5e3b-6406aa7ff897@redhat.com>
 <4ac4956cfe344326a805966535c1dc43@huawei.com>
 <20220426103507.5693a0ca.alex.williamson@redhat.com>
 <66f4af24-b76e-9f9a-a86d-565c0453053d@linaro.org>
 <0d9bd05e-d82b-e390-5763-52995bfb0b16@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <0d9bd05e-d82b-e390-5763-52995bfb0b16@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Hi, Zhangfei,

On 5/10/22 05:17, Yi Liu wrote:
> Hi Zhangfei,
>
> On 2022/5/9 22:24, Zhangfei Gao wrote:
>> Hi, Alex
>>
>> On 2022/4/27 上午12:35, Alex Williamson wrote:
>>> On Tue, 26 Apr 2022 12:43:35 +0000
>>> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
>>>
>>>>> -----Original Message-----
>>>>> From: Eric Auger [mailto:eric.auger@redhat.com]
>>>>> Sent: 26 April 2022 12:45
>>>>> To: Shameerali Kolothum Thodi
>>>>> <shameerali.kolothum.thodi@huawei.com>; Yi
>>>>> Liu <yi.l.liu@intel.com>; alex.williamson@redhat.com;
>>>>> cohuck@redhat.com;
>>>>> qemu-devel@nongnu.org
>>>>> Cc: david@gibson.dropbear.id.au; thuth@redhat.com;
>>>>> farman@linux.ibm.com;
>>>>> mjrosato@linux.ibm.com; akrowiak@linux.ibm.com; pasic@linux.ibm.com;
>>>>> jjherne@linux.ibm.com; jasowang@redhat.com; kvm@vger.kernel.org;
>>>>> jgg@nvidia.com; nicolinc@nvidia.com; eric.auger.pro@gmail.com;
>>>>> kevin.tian@intel.com; chao.p.peng@intel.com; yi.y.sun@intel.com;
>>>>> peterx@redhat.com; Zhangfei Gao <zhangfei.gao@linaro.org>
>>>>> Subject: Re: [RFC 00/18] vfio: Adopt iommufd
>>>> [...]
>>>>> https://lore.kernel.org/kvm/0-v1-e79cd8d168e8+6-iommufd_jgg@nvidia.com
>>>>>
>>>>>>> /
>>>>>>> [2] https://github.com/luxis1999/iommufd/tree/iommufd-v5.17-rc6
>>>>>>> [3]
>>>>>>> https://github.com/luxis1999/qemu/tree/qemu-for-5.17-rc6-vm-rfcv1
>>>>>> Hi,
>>>>>>
>>>>>> I had a go with the above branches on our ARM64 platform trying to
>>>>> pass-through
>>>>>> a VF dev, but Qemu reports an error as below,
>>>>>>
>>>>>> [    0.444728] hisi_sec2 0000:00:01.0: enabling device (0000 ->
>>>>>> 0002)
>>>>>> qemu-system-aarch64-iommufd: IOMMU_IOAS_MAP failed: Bad address
>>>>>> qemu-system-aarch64-iommufd: vfio_container_dma_map(0xaaaafeb40ce0,
>>>>> 0x8000000000, 0x10000, 0xffffb40ef000) = -14 (Bad address)
>>>>>> I think this happens for the dev BAR addr range. I haven't
>>>>>> debugged the
>>>>> kernel
>>>>>> yet to see where it actually reports that.
>>>>> Does it prevent your assigned device from working? I have such errors
>>>>> too but this is a known issue. This is due to the fact P2P DMA is not
>>>>> supported yet.
>>>> Yes, the basic tests all good so far. I am still not very clear how
>>>> it works if
>>>> the map() fails though. It looks like it fails in,
>>>>
>>>> iommufd_ioas_map()
>>>>    iopt_map_user_pages()
>>>>     iopt_map_pages()
>>>>     ..
>>>>       pfn_reader_pin_pages()
>>>>
>>>> So does it mean it just works because the page is resident()?
>>> No, it just means that you're not triggering any accesses that require
>>> peer-to-peer DMA support.  Any sort of test where the device is only
>>> performing DMA to guest RAM, which is by far the standard use case,
>>> will work fine.  This also doesn't affect vCPU access to BAR space.
>>> It's only a failure of the mappings of the BAR space into the IOAS,
>>> which is only used when a device tries to directly target another
>>> device's BAR space via DMA.  Thanks,
>>
>> I also get this issue when trying adding prereg listenner
>>
>> +    container->prereg_listener = vfio_memory_prereg_listener;
>> +    memory_listener_register(&container->prereg_listener,
>> +                            &address_space_memory);
>>
>> host kernel log:
>> iommufd_ioas_map 1 iova=8000000000, iova1=8000000000,
>> cmd->iova=8000000000, cmd->user_va=9c495000, cmd->length=10000
>> iopt_alloc_area input area=859a2d00 iova=8000000000
>> iopt_alloc_area area=859a2d00 iova=8000000000
>> pin_user_pages_remote rc=-14
>>
>> qemu log:
>> vfio_prereg_listener_region_add
>> iommufd_map iova=0x8000000000
>> qemu-system-aarch64: IOMMU_IOAS_MAP failed: Bad address
>> qemu-system-aarch64: vfio_dma_map(0xaaaafb96a930, 0x8000000000,
>> 0x10000, 0xffff9c495000) = -14 (Bad address)
>> qemu-system-aarch64: (null)
>> double free or corruption (fasttop)
>> Aborted (core dumped)
>>
>> With hack of ignoring address 0x8000000000 in map and unmap, kernel
>> can boot.
>
> do you know if the iova 0x8000000000 guest RAM or MMIO? Currently,
> iommufd kernel part doesn't support mapping device BAR MMIO. This is a
> known gap.
In qemu arm virt machine this indeed matches the PCI MMIO region.

Thanks

Eric


