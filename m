Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0DA31EA7C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 14:35:09 +0100 (CET)
Received: from localhost ([::1]:33232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCjSV-00058Z-W6
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 08:35:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lCjQd-0004TP-Qe
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 08:33:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lCjQa-0006Yd-BV
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 08:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613655186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIqM+1Y3C+7K/AyI2+LtiRPKxNzed9FDsMA4LcbKJaM=;
 b=hS7JkVRXegoqG87NOrDlModD8YmcRm28JLw3FAiy5rHXe31+hOSlyJJcagjrGh/6Qq9tg6
 c+ZjPBvOdXv8ZKKjgoLK5yxu7DcZatGmd87gFSGuRQ7YUKYnPm/4SdjqykD40/g5ZfRRuI
 sSN0RCWFUHFdOFCc6Yng/BTzYYtSEt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-whpZ8bfuPa6lhQZLqWkg4A-1; Thu, 18 Feb 2021 08:33:03 -0500
X-MC-Unique: whpZ8bfuPa6lhQZLqWkg4A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A9F21020C20;
 Thu, 18 Feb 2021 13:33:01 +0000 (UTC)
Received: from [10.36.114.34] (ovpn-114-34.ams2.redhat.com [10.36.114.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EFFD67CC0;
 Thu, 18 Feb 2021 13:32:50 +0000 (UTC)
Subject: Re: [RFC v7 26/26] vfio/pci: Implement return_page_response page
 response callback
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
 <20201116181349.11908-27-eric.auger@redhat.com>
 <494e4bdf5ecd4b528a016d4545d45f71@huawei.com>
 <f11ef533-da64-3d6a-24f5-79d5e7a205da@redhat.com>
 <5f85d8999c0c40a29c32ac63b8730fa8@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <679c5696-c73f-517d-f555-90ec2c767fbb@redhat.com>
Date: Thu, 18 Feb 2021 14:32:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5f85d8999c0c40a29c32ac63b8730fa8@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "tn@semihalf.com" <tn@semihalf.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vivek.gautam@arm.com" <vivek.gautam@arm.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "zhangfei.gao@gmail.com" <zhangfei.gao@gmail.com>,
 yuzenghui <yuzenghui@huawei.com>, qubingbing <qubingbing@hisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Shameer,

On 2/18/21 12:46 PM, Shameerali Kolothum Thodi wrote:
> 
> Hi Eric,
> 
>> -----Original Message-----
>> From: Auger Eric [mailto:eric.auger@redhat.com]
>> Sent: 18 February 2021 10:42
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>> eric.auger.pro@gmail.com; qemu-devel@nongnu.org; qemu-arm@nongnu.org;
>> alex.williamson@redhat.com
>> Cc: peter.maydell@linaro.org; jacob.jun.pan@linux.intel.com; Zengtao (B)
>> <prime.zeng@hisilicon.com>; jean-philippe@linaro.org; tn@semihalf.com;
>> peterx@redhat.com; nicoleotsuka@gmail.com; vivek.gautam@arm.com;
>> yi.l.liu@intel.com; zhangfei.gao@gmail.com; yuzenghui
>> <yuzenghui@huawei.com>; qubingbing <qubingbing@hisilicon.com>
>> Subject: Re: [RFC v7 26/26] vfio/pci: Implement return_page_response page
>> response callback
>>
> [...]
> 
>>> Also, I just noted that this patch breaks the dev hot add/del functionality.
>>> device_add works fine but device_del is not removing the dev cleanly.Thank
>> you for reporting this!
>>
>> The test matrix becomes bigger and bigger :-( I Need to write some
>> avocado-vt tests or alike.
>>
>> I am currently working on the respin. At the moment I investigate the
>> DPDK issue that you reported and I was able to reproduce.
> 
> Ok. Good to know that it is reproducible.
> 
>> I intend to rebase on top of Jean-Philippe's
>> [PATCH v12 00/10] iommu: I/O page faults for SMMUv3
>>
>> Is that good enough for your SVA integration or do you want I prepare a
>> rebase on some extended code?
> 
> Could you please try to base it on https://jpbrucker.net/git/linux/log/?h=sva/current

OK. At least I will provide a branch.

Eric
> 
> I think that has the latest from Jean-Philippe and will be easy to add
> uacce/zip specific patches to test SVA/vSVA.
> 
> Thanks,
> Shameer
> 
>  
>> Thanks
>>
>> Eric
>>>
>>> The below one fixes it. Please check.
>>>
>>> Thanks,
>>> Shameer
>>>
>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>> index 797acd9c73..92c1d48316 100644
>>> --- a/hw/vfio/pci.c
>>> +++ b/hw/vfio/pci.c
>>> @@ -3470,6 +3470,7 @@ static void vfio_instance_finalize(Object *obj)
>>>      vfio_display_finalize(vdev);
>>>      vfio_bars_finalize(vdev);
>>>      vfio_region_finalize(&vdev->dma_fault_region);
>>> +    vfio_region_finalize(&vdev->dma_fault_response_region);
>>>      g_free(vdev->emulated_config_bits);
>>>      g_free(vdev->rom);
>>>      /*
>>> @@ -3491,6 +3492,7 @@ static void vfio_exitfn(PCIDevice *pdev)
>>>      vfio_unregister_err_notifier(vdev);
>>>      vfio_unregister_ext_irq_notifiers(vdev);
>>>      vfio_region_exit(&vdev->dma_fault_region);
>>> +    vfio_region_exit(&vdev->dma_fault_response_region);
>>>      pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
>>>      if (vdev->irqchip_change_notifier.notify) {
>>>
>> kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_not
>>>
>>>
>>>
> 


