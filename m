Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCCE55BFB5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:12:19 +0200 (CEST)
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67Gc-0002Ma-Ld
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o673d-0004Z0-Qj
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:58:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o673Y-0000sZ-W2
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656406727;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpeCbsArzQqWwSTbVAKR1IJL1iNT7iTbnKRmPlVeCE4=;
 b=LPro0bI/ZV/2HXp4oe/sah0beOAvbJ1voLa3sbueWdx8+pXR6J3c97Jptv3fbyNaz729N8
 Evfv9eZQPR1WeLx4nwN+MIqWm+tFzxXqWGJJWcNc+RraBbACkmNcxBeVL26Q+E6ywZhgcg
 mIfYTDBqghXht4P9IM2LkmC0AQ63HCA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-hGJNDKDoPDa0pvt3H4M4oQ-1; Tue, 28 Jun 2022 04:58:45 -0400
X-MC-Unique: hGJNDKDoPDa0pvt3H4M4oQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 h125-20020a1c2183000000b003a03a8475c6so4323035wmh.8
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 01:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VpeCbsArzQqWwSTbVAKR1IJL1iNT7iTbnKRmPlVeCE4=;
 b=pYp7gInALs9ds0l2TjbtnoJuICsPDh0euNcd8vMXw8CEkXSArt84RaeApT52fbUQPa
 fmYf2y9DxNYDhhKk0ZXrcqm2Psrq6pUsOj38CwRLRI0UgFUOMbpLXCsUUtiTVGx8oMkT
 NkJxVDrgyGpNZz/YhJigxH+UYIKMkQ8syfmO1NGdUPP7K9v6cuvS46A11nynJN/OZAHj
 mVmuN8gnS2Y/FfQN/wyyXjLuRF5DYa4okArPXJA9j2gGEDc7puc7S06WSZ+whwxNuaXO
 EEFnNyNfRq3DnDH/cxJ+FjagNs0+PuemZsmf3DvmLmoQaJz+/Iy3HQbjPm/RTEIglGL0
 x5MA==
X-Gm-Message-State: AJIora87L5eoIx+EG6ml4kAfAj3vAW2kiccOpCQi4VzUc84ImGBsuH/h
 OzD/0CiEhfJDRDXxqjf+JEj9vnJlajzfylYNCodJuuM2x8pgM27W+Bg/eytjw8sBkt6TPtLk6YX
 wwwc78Cmj3N63TF4=
X-Received: by 2002:adf:e752:0:b0:21b:80ae:9d7a with SMTP id
 c18-20020adfe752000000b0021b80ae9d7amr16459123wrn.362.1656406724495; 
 Tue, 28 Jun 2022 01:58:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vnMWyLgVmpPdfheZLiOHjzA0U6ngGkTJ7I4E70o3qbHTCxvd7F8znytYzeFWU+ClBMuhaawQ==
X-Received: by 2002:adf:e752:0:b0:21b:80ae:9d7a with SMTP id
 c18-20020adfe752000000b0021b80ae9d7amr16459081wrn.362.1656406724204; 
 Tue, 28 Jun 2022 01:58:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5-20020a05600c230500b0039c8a22554bsm16152199wmo.27.2022.06.28.01.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 01:58:43 -0700 (PDT)
Message-ID: <25ba2a75-9db6-9160-9ed4-2563c8f27d46@redhat.com>
Date: Tue, 28 Jun 2022 10:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
Content-Language: en-US
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Yi Liu <yi.l.liu@intel.com>,
 "zhangfei.gao@foxmail.com" <zhangfei.gao@foxmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
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
 <720d56c8-da84-5e4d-f1f8-0e1878473b93@redhat.com>
 <29475423-33ad-bdd2-2d6a-dcd484d257a7@linaro.org>
 <20220510124554.GY49344@nvidia.com>
 <637b3992-45d9-f472-b160-208849d3d27a@intel.com>
 <tencent_5823CCB7CFD4C49A90D3CC1A183AB406EB09@qq.com>
 <tencent_B5689033C2703B476DA909302DA141A0A305@qq.com>
 <faff3515-896c-a445-ebbe-f7077cb52dd4@intel.com>
 <tencent_C3C342C7F0605284FB368A1A63534B5A4806@qq.com>
 <24cb7ff5-dec8-3c84-b23e-4170d331a4d2@intel.com>
 <c1ee978d787b4e43af4619fb4ef0bfc1@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <c1ee978d787b4e43af4619fb4ef0bfc1@huawei.com>
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

Hi Shameer,

On 6/28/22 10:14, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Yi Liu [mailto:yi.l.liu@intel.com]
>> Sent: 18 May 2022 15:01
>> To: zhangfei.gao@foxmail.com; Jason Gunthorpe <jgg@nvidia.com>;
>> Zhangfei Gao <zhangfei.gao@linaro.org>
>> Cc: eric.auger@redhat.com; Alex Williamson <alex.williamson@redhat.com>;
>> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>> cohuck@redhat.com; qemu-devel@nongnu.org;
>> david@gibson.dropbear.id.au; thuth@redhat.com; farman@linux.ibm.com;
>> mjrosato@linux.ibm.com; akrowiak@linux.ibm.com; pasic@linux.ibm.com;
>> jjherne@linux.ibm.com; jasowang@redhat.com; kvm@vger.kernel.org;
>> nicolinc@nvidia.com; eric.auger.pro@gmail.com; kevin.tian@intel.com;
>> chao.p.peng@intel.com; yi.y.sun@intel.com; peterx@redhat.com
>> Subject: Re: [RFC 00/18] vfio: Adopt iommufd
>>
>> On 2022/5/18 15:22, zhangfei.gao@foxmail.com wrote:
>>>
>>> On 2022/5/17 下午4:55, Yi Liu wrote:
>>>> Hi Zhangfei,
>>>>
>>>> On 2022/5/12 17:01, zhangfei.gao@foxmail.com wrote:
>>>>> Hi, Yi
>>>>>
>>>>> On 2022/5/11 下午10:17, zhangfei.gao@foxmail.com wrote:
>>>>>>
>>>>>> On 2022/5/10 下午10:08, Yi Liu wrote:
>>>>>>> On 2022/5/10 20:45, Jason Gunthorpe wrote:
>>>>>>>> On Tue, May 10, 2022 at 08:35:00PM +0800, Zhangfei Gao wrote:
>>>>>>>>> Thanks Yi and Eric,
>>>>>>>>> Then will wait for the updated iommufd kernel for the PCI MMIO
>> region.
>>>>>>>>> Another question,
>>>>>>>>> How to get the iommu_domain in the ioctl.
>>>>>>>> The ID of the iommu_domain (called the hwpt) it should be returned
>> by
>>>>>>>> the vfio attach ioctl.
>>>>>>> yes, hwpt_id is returned by the vfio attach ioctl and recorded in
>>>>>>> qemu. You can query page table related capabilities with this id.
>>>>>>>
>>>>>>>
>> https://lore.kernel.org/kvm/20220414104710.28534-16-yi.l.liu@intel.com/
>>>>>> Thanks Yi,
>>>>>>
>>>>>> Do we use iommufd_hw_pagetable_from_id in kernel?
>>>>>>
>>>>>> The qemu send hwpt_id via ioctl.
>>>>>> Currently VFIOIOMMUFDContainer has hwpt_list,
>>>>>> Which member is good to save hwpt_id, IOMMUTLBEntry?
>>>>> Can VFIOIOMMUFDContainer  have multi hwpt?
>>>> yes, it is possible
>>> Then how to get hwpt_id in map/unmap_notify(IOMMUNotifier *n,
>> IOMMUTLBEntry
>>> *iotlb)
>> in map/unmap, should use ioas_id instead of hwpt_id
>>
>>>>> Since VFIOIOMMUFDContainer has hwpt_list now.
>>>>> If so, how to get specific hwpt from map/unmap_notify in hw/vfio/as.c,
>>>>> where no vbasedev can be used for compare.
>>>>>
>>>>> I am testing with a workaround, adding VFIOIOASHwpt *hwpt in
>>>>> VFIOIOMMUFDContainer.
>>>>> And save hwpt when vfio_device_attach_container.
>>>>>
>>>>>> In kernel ioctl: iommufd_vfio_ioctl
>>>>>> @dev: Device to get an iommu_domain for
>>>>>> iommufd_hw_pagetable_from_id(struct iommufd_ctx *ictx, u32 pt_id,
>>>>>> struct device *dev)
>>>>>> But iommufd_vfio_ioctl seems no para dev?
>>>>> We can set dev=Null since IOMMUFD_OBJ_HW_PAGETABLE does not
>> need dev.
>>>>> iommufd_hw_pagetable_from_id(ictx, hwpt_id, NULL)
>>>> this is not good. dev is passed in to this function to allocate domain
>>>> and also check sw_msi things. If you pass in a NULL, it may even unable
>>>> to get a domain for the hwpt. It won't work I guess.
>>> The iommufd_hw_pagetable_from_id can be used for
>>> 1, allocate domain, which need para dev
>>> case IOMMUFD_OBJ_IOAS
>>> hwpt = iommufd_hw_pagetable_auto_get(ictx, ioas, dev);
>> this is used when attaching ioas.
>>
>>> 2. Just return allocated domain via hwpt_id, which does not need dev.
>>> case IOMMUFD_OBJ_HW_PAGETABLE:
>>> return container_of(obj, struct iommufd_hw_pagetable, obj);
>> yes, this would be the usage in nesting. you may check my below
>> branch. It's for nesting integration.
>>
>> https://github.com/luxis1999/iommufd/tree/iommufd-v5.18-rc4-nesting
>>
>>> By the way, any plan of the nested mode?
>> I'm working with Eric, Nic on it. Currently, I've got the above kernel
>> branch, QEMU side is also WIP.
> Hi Yi/Eric,
>
> I had a look at the above nesting kernel and Qemu branches and as mentioned
> in the cover letter it is not working on ARM yet.
>
> IIUC, to get it working via the iommufd the main thing is we need a way to configure
> the phys SMMU in nested mode and setup the mappings for the stage 2. The
> Cache/PASID related changes looks more straight forward. 
>
> I had quite a few hacks to get it working on ARM, but still a WIP. So just wondering
> do you guys have something that can be shared yet?

I am working on the respin based on latest iommufd kernel branches and
qemu RFC v2 but it is still WIP.

I will share as soon as possible.

Eric
>
> Please let me know.
>
> Thanks,
> Shameer


