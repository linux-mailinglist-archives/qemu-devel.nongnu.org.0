Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7165116B4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 14:26:51 +0200 (CEST)
Received: from localhost ([::1]:52212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njgks-00006c-VT
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 08:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1njgjR-0007rD-K3
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 08:25:21 -0400
Received: from mga01.intel.com ([192.55.52.88]:24966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1njgjO-0003EZ-Gt
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 08:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651062318; x=1682598318;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=Zs8XDEU8bCWvbyiItch/Hlh2Vlxa+ziU7QswL+y76Nw=;
 b=mLsX2YleA8s2g27LcoCdAU/Ye/qbvwzKfibrVWU+ox9Q02vqMoYQ2sKi
 IGFNowITnMbBIbxOeYmB4x6i5zxwL8QKC9pEPtHXQX4/yOshDcYmKVGC/
 7IpnOmYXa9JjBu9KR5Ih1p0hcE/dMB2ClaxsbIR0OwbXWbz/BquQAFQ9E
 tT9k61RLLtVcHgmebgjsjf+bA80gMBbUFYYEziV4XMzRzTavcMHgABUjW
 YNC1X8oIGcsdlseDOi7vUP3//9qCdXFMvA0xUM+Zq2jplGqrAiYdEKU8D
 GgiQ7AWDGNON8O6p7LzTSYgUx0ovZPEZl2ttRdc7VqMUHZ2wjTxaXv2p0 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="291060625"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="291060625"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 05:25:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="533181569"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.249.168.121])
 ([10.249.168.121])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 05:24:59 -0700
Message-ID: <484a755f-f325-1258-3f18-a4c4c29a3198@intel.com>
Date: Wed, 27 Apr 2022 20:24:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
From: Chenyi Qiang <chenyi.qiang@intel.com>
Subject: Re: [PATCH v5 1/1] virtio: fix the condition for iommu_platform not
 supported
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Jakob Naucke <Jakob.Naucke@ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Brijesh Singh <brijesh.singh@amd.com>
References: <20220207112857.607829-1-pasic@linux.ibm.com>
 <0b85cc5f-9dc8-39a4-b5a5-4dbd8cc84343@intel.com>
Content-Language: en-US
In-Reply-To: <0b85cc5f-9dc8-39a4-b5a5-4dbd8cc84343@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chenyi.qiang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/22/2022 3:11 PM, Chenyi Qiang wrote:
> 
> 
> On 2/7/2022 7:28 PM, Halil Pasic wrote:
>> The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
>> unsupported") claims to fail the device hotplug when iommu_platform
>> is requested, but not supported by the (vhost) device. On the first
>> glance the condition for detecting that situation looks perfect, but
>> because a certain peculiarity of virtio_platform it ain't.
>>
>> In fact the aforementioned commit introduces a regression. It breaks
>> virtio-fs support for Secure Execution, and most likely also for AMD SEV
>> or any other confidential guest scenario that relies encrypted guest
>> memory.  The same also applies to any other vhost device that does not
>> support _F_ACCESS_PLATFORM.
>>
>> The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
>> "device can not access all of the guest RAM" and "iova != gpa, thus
>> device needs to translate iova".
>>
>> Confidential guest technologies currently rely on the device/hypervisor
>> offering _F_ACCESS_PLATFORM, so that, after the feature has been
>> negotiated, the guest  grants access to the portions of memory the
>> device needs to see. So in for confidential guests, generally,
>> _F_ACCESS_PLATFORM is about the restricted access to memory, but not
>> about the addresses used being something else than guest physical
>> addresses.
>>
>> This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
>> turn on VIRTIO_F_IOMMU_PLATFORM") fences _F_ACCESS_PLATFORM from the
>> vhost device that does not need it, because on the vhost interface it
>> only means "I/O address translation is needed".
>>
>> This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
>> VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
>> situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
>> by the device, and thus no device capability is needed. In this
>> situation claiming that the device does not support iommu_plattform=on
>> is counter-productive. So let us stop doing that!
>>
>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
>> Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
>> Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
>> unsupported")
>> Acked-by: Cornelia Huck <cohuck@redhat.com>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Cc: Kevin Wolf <kwolf@redhat.com>
>> Cc: qemu-stable@nongnu.org
>>
>> ---
>>
>> v4->v5:
>> * added back the return; so if somebody were to add code to the end of
>>    the function we are still good
>> v3->v4:
>> * Fixed commit message (thanks Connie)
>> * Removed counter-productive initialization (thanks Connie)
>> * Added tags
>> v2->v3:
>> * Caught a bug: I tired to check if vdev has the feature
>>     ACCESS_PLATFORM after we have forced it. Moved the check
>>     to a better place
>> v1->v2:
>> * Commit message tweaks. Most notably fixed commit SHA (Michael)
>>
>> ---
>> ---
>>   hw/virtio/virtio-bus.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>> index d23db98c56..0f69d1c742 100644
>> --- a/hw/virtio/virtio-bus.c
>> +++ b/hw/virtio/virtio-bus.c
>> @@ -48,6 +48,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, 
>> Error **errp)
>>       VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
>>       VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
>>       bool has_iommu = virtio_host_has_feature(vdev, 
>> VIRTIO_F_IOMMU_PLATFORM);
>> +    bool vdev_has_iommu;
>>       Error *local_err = NULL;
>>       DPRINTF("%s: plug device.\n", qbus->name);
>> @@ -69,11 +70,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, 
>> Error **errp)
>>           return;
>>       }
>> -    if (has_iommu && !virtio_host_has_feature(vdev, 
>> VIRTIO_F_IOMMU_PLATFORM)) {
>> -        error_setg(errp, "iommu_platform=true is not supported by the 
>> device");
>> -        return;
>> -    }
>> -
>>       if (klass->device_plugged != NULL) {
>>           klass->device_plugged(qbus->parent, &local_err);
>>       }
>> @@ -82,9 +78,15 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, 
>> Error **errp)
>>           return;
>>       }
>> +    vdev_has_iommu = virtio_host_has_feature(vdev, 
>> VIRTIO_F_IOMMU_PLATFORM);
>>       if (klass->get_dma_as != NULL && has_iommu) {
>>           virtio_add_feature(&vdev->host_features, 
>> VIRTIO_F_IOMMU_PLATFORM);
>>           vdev->dma_as = klass->get_dma_as(qbus->parent);
>> +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> 
> Hi Pasic,
> 
> When testing the virtio-fs in Intel TDX, I met the error report in this 
> check. Is it appropriate to compare the dma_as against the 
> address_space_memory to detect whether the IOMMU is enabled or not? Per 
> the commit ae4003738f(vhost: correctly detect the enabling IOMMU), we 
> should call virtio_bus_device_iommu_enabled(vdev) instead here, correct?
> 

Sorry for bothering.

Can virtio-fs work properly in AMD SEV?

IIUC, If get_dma_as() is implemented and in case of PCI, 
pci_get_address_space() is used and returns the bus master as. This 
would fail the check here.

>> +            error_setg(errp,
>> +                       "iommu_platform=true is not supported by the 
>> device");
>> +            return;
>> +        }
>>       } else {
>>           vdev->dma_as = &address_space_memory;
>>       }
>>
>> base-commit: 0d564a3e32ba8494014c67cdd2ebf0fb71860dff
> 

