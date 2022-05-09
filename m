Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351DE51FFA7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:29:08 +0200 (CEST)
Received: from localhost ([::1]:54226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4Nn-0006MX-2r
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1no4K4-00021Q-Kf
 for qemu-devel@nongnu.org; Mon, 09 May 2022 10:25:16 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1no4K0-0002DR-4j
 for qemu-devel@nongnu.org; Mon, 09 May 2022 10:25:16 -0400
Received: by mail-pl1-x632.google.com with SMTP id j14so13992609plx.3
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=esr4tTyMGQYS9iZhHBLbSoF2JuPSqZeC4sOkMM2A0gU=;
 b=GBkc//XR5ZlTYm1U7UCUDTWNnzNJiXHRObE2OWJ5/Rdc69/QwmOqNea0kRJAmxOvNp
 jgHayw/G3C4FJrAaYWfynwfu9nc4sSK+/saNkAu7Hog80gKpX1XfcxxHg3jY1EdQRlOR
 /MvavxkWBcMhZVzMNpFl9VyiPuro+Ws4gS55ewtaK9A9F1CKBe4DYQCpXRayiklUjYJD
 Pv0yqmnP6w3i/CgYjvz2pJ+gI8TBEEcai+yUAKEUKtrNBOiptln2fHFBW5iu6NkkZPiF
 qqMbKt/g8C0PDfmFGCIA7Z161X9xgo9fTfBNbShYCAdsYVh56UC/3TApmRrZnSvwai+/
 gp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=esr4tTyMGQYS9iZhHBLbSoF2JuPSqZeC4sOkMM2A0gU=;
 b=2sd/ho0AlpcS3CmGI324Sf4bMSdJsYfP7stKHSxMvt8pQUactETBq+OPZ2S0oMxzqg
 aYD6Es02a+oJBmtH8L7ugQ5ZfmDfNASt0RTatuTrX0pc9sDND1fGpXakg4HLyki9uE1C
 GPzuS4Qru7A4ZIpQ06oJw9QTDC/3YgmQQLQfkgRzartyW53U99v7q7grc7L32GTC373i
 hLiUfJzw5RtReM25FsmuYu3iQM+JsksvI/KPyeZMFHZ6CYSgL0pEJVWpxsa4hEZUNXug
 M10+73tAEtk6YtzvByErWGxnQxgeSKlSk0JRCncJE6v2OKXBvPYhwBvcBdEz4jmUggTS
 g66A==
X-Gm-Message-State: AOAM532ZQCXEjA1X1Pae80AUhZcMLqD2j/w5DW7NXCMOPWQd1sVtWdSR
 WJ/MzmqZGmToLIg5nV68U4tgfA==
X-Google-Smtp-Source: ABdhPJx5cRmEXIODkVbh8wLjurG7hSrmGJ2BAIYZLOKgk1e8+jWdAJUB/GrbHP0fCl9uB7fndMXQ8w==
X-Received: by 2002:a17:90a:a385:b0:1cb:bfa8:ae01 with SMTP id
 x5-20020a17090aa38500b001cbbfa8ae01mr18227945pjp.116.1652106309105; 
 Mon, 09 May 2022 07:25:09 -0700 (PDT)
Received: from [10.47.0.6] ([94.177.118.62]) by smtp.gmail.com with ESMTPSA id
 v21-20020a170902ca9500b0015e8d4eb2a8sm7071165pld.242.2022.05.09.07.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 07:25:08 -0700 (PDT)
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
To: Alex Williamson <alex.williamson@redhat.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
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
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Message-ID: <66f4af24-b76e-9f9a-a86d-565c0453053d@linaro.org>
Date: Mon, 9 May 2022 22:24:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220426103507.5693a0ca.alex.williamson@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=zhangfei.gao@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Alex

On 2022/4/27 上午12:35, Alex Williamson wrote:
> On Tue, 26 Apr 2022 12:43:35 +0000
> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
>
>>> -----Original Message-----
>>> From: Eric Auger [mailto:eric.auger@redhat.com]
>>> Sent: 26 April 2022 12:45
>>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>; Yi
>>> Liu <yi.l.liu@intel.com>; alex.williamson@redhat.com; cohuck@redhat.com;
>>> qemu-devel@nongnu.org
>>> Cc: david@gibson.dropbear.id.au; thuth@redhat.com; farman@linux.ibm.com;
>>> mjrosato@linux.ibm.com; akrowiak@linux.ibm.com; pasic@linux.ibm.com;
>>> jjherne@linux.ibm.com; jasowang@redhat.com; kvm@vger.kernel.org;
>>> jgg@nvidia.com; nicolinc@nvidia.com; eric.auger.pro@gmail.com;
>>> kevin.tian@intel.com; chao.p.peng@intel.com; yi.y.sun@intel.com;
>>> peterx@redhat.com; Zhangfei Gao <zhangfei.gao@linaro.org>
>>> Subject: Re: [RFC 00/18] vfio: Adopt iommufd
>> [...]
>>   
>>>>>   
>>> https://lore.kernel.org/kvm/0-v1-e79cd8d168e8+6-iommufd_jgg@nvidia.com
>>>>> /
>>>>> [2] https://github.com/luxis1999/iommufd/tree/iommufd-v5.17-rc6
>>>>> [3] https://github.com/luxis1999/qemu/tree/qemu-for-5.17-rc6-vm-rfcv1
>>>> Hi,
>>>>
>>>> I had a go with the above branches on our ARM64 platform trying to
>>> pass-through
>>>> a VF dev, but Qemu reports an error as below,
>>>>
>>>> [    0.444728] hisi_sec2 0000:00:01.0: enabling device (0000 -> 0002)
>>>> qemu-system-aarch64-iommufd: IOMMU_IOAS_MAP failed: Bad address
>>>> qemu-system-aarch64-iommufd: vfio_container_dma_map(0xaaaafeb40ce0,
>>> 0x8000000000, 0x10000, 0xffffb40ef000) = -14 (Bad address)
>>>> I think this happens for the dev BAR addr range. I haven't debugged the
>>> kernel
>>>> yet to see where it actually reports that.
>>> Does it prevent your assigned device from working? I have such errors
>>> too but this is a known issue. This is due to the fact P2P DMA is not
>>> supported yet.
>>>    
>> Yes, the basic tests all good so far. I am still not very clear how it works if
>> the map() fails though. It looks like it fails in,
>>
>> iommufd_ioas_map()
>>    iopt_map_user_pages()
>>     iopt_map_pages()
>>     ..
>>       pfn_reader_pin_pages()
>>
>> So does it mean it just works because the page is resident()?
> No, it just means that you're not triggering any accesses that require
> peer-to-peer DMA support.  Any sort of test where the device is only
> performing DMA to guest RAM, which is by far the standard use case,
> will work fine.  This also doesn't affect vCPU access to BAR space.
> It's only a failure of the mappings of the BAR space into the IOAS,
> which is only used when a device tries to directly target another
> device's BAR space via DMA.  Thanks,

I also get this issue when trying adding prereg listenner

+    container->prereg_listener = vfio_memory_prereg_listener;
+    memory_listener_register(&container->prereg_listener,
+                            &address_space_memory);

host kernel log:
iommufd_ioas_map 1 iova=8000000000, iova1=8000000000, 
cmd->iova=8000000000, cmd->user_va=9c495000, cmd->length=10000
iopt_alloc_area input area=859a2d00 iova=8000000000
iopt_alloc_area area=859a2d00 iova=8000000000
pin_user_pages_remote rc=-14

qemu log:
vfio_prereg_listener_region_add
iommufd_map iova=0x8000000000
qemu-system-aarch64: IOMMU_IOAS_MAP failed: Bad address
qemu-system-aarch64: vfio_dma_map(0xaaaafb96a930, 0x8000000000, 0x10000, 
0xffff9c495000) = -14 (Bad address)
qemu-system-aarch64: (null)
double free or corruption (fasttop)
Aborted (core dumped)

With hack of ignoring address 0x8000000000 in map and unmap, kernel can 
boot.

Thanks


