Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8168263C4BA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 17:09:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p03AQ-0001Sg-OC; Tue, 29 Nov 2022 11:09:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p03AM-0001SB-PW
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 11:09:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p03AL-0007lr-1v
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 11:09:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669738140;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s02Q4RMyUQSNeCRrkCDcJGsMKY8GQ6u02qt9SOjPRic=;
 b=NO78zcdtxuikMTYcWDSaVWlGZTJIMBsQ56L5oOV/TmIyRuAfZ3AQ4tR4t6iwv0WygNxBHq
 70B/hCwbB34diAmwV/N/ccQpqgZs2f+7CN0Wf9z3MJYuNaoYED62EEERLoL187zja5SvYX
 CtDKUozIYyR5+I8Ev+CPDSbtjYtPb7I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-287-LGU1CUr0Nl6_fFaXebWEzw-1; Tue, 29 Nov 2022 11:08:53 -0500
X-MC-Unique: LGU1CUr0Nl6_fFaXebWEzw-1
Received: by mail-wm1-f69.google.com with SMTP id
 u9-20020a05600c00c900b003cfb12839d6so4917931wmm.5
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 08:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s02Q4RMyUQSNeCRrkCDcJGsMKY8GQ6u02qt9SOjPRic=;
 b=V8xf0a9Lmlh+QTVBFodGRAZVwXXM6u8AIgYC/MQf2RWKhy7t4qlkEHdS8c5Iplsrdw
 tiJUT1AmezwnEHWZRcOGqyG/zvh/ZsFFXDP+20s8ccgh1Xpkya5CqFJ/REoplRgpJhsb
 E4UFZp7x/Ati75NTSMWzRevR+NPXAFGOJLrUXIqPExJ2kaKSrEeLz8e8viZo9i4X7EUn
 Gbh7RNF0aEWGbtYDslbUe58De5R8Atrb/+uObrcLu2vUk11FnM9Y4NQA6Ps/kIrGJPyU
 GO6MiJci8NYjbi4/IphYpRYLzp6vfXs7dXTyiz8WGhW0OV8Uds7uDA0VOaQxu/jsROvD
 x2kQ==
X-Gm-Message-State: ANoB5pluX1Zoel6uzsuCxhbYoy12h4euLd+V/UHSTxW6wtG6gP+3ffya
 Vo/BNyYTk93IewlocQepT3C4isqV5pYHxzeMsjNqxT0bjrxp7qtJZL86Bz2SMSm5bQ0gviy49gO
 vMD1o8t9d+3S4WRA=
X-Received: by 2002:a05:600c:19cc:b0:3cf:7bdd:e014 with SMTP id
 u12-20020a05600c19cc00b003cf7bdde014mr36260682wmq.1.1669738131757; 
 Tue, 29 Nov 2022 08:08:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4RJ5JTmPaQANVpSCFbv+MMsetDN+w8NVRkay7sI/R90tmTRqdLfLfHJZTQBhsBdF3ChnnE8A==
X-Received: by 2002:a05:600c:19cc:b0:3cf:7bdd:e014 with SMTP id
 u12-20020a05600c19cc00b003cf7bdde014mr36260651wmq.1.1669738131362; 
 Tue, 29 Nov 2022 08:08:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c199100b003c7087f6c9asm2653822wmq.32.2022.11.29.08.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 08:08:50 -0800 (PST)
Message-ID: <3b971908-e3dc-b684-6374-4f440676e0c4@redhat.com>
Date: Tue, 29 Nov 2022 17:08:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for 7.2? V2] vhost: fix vq dirty bitmap syncing when
 vIOMMU is enabled
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Lei Yang <leiyang@redhat.com>,
 Yalan Zhang <yalzhang@redhat.com>
References: <20221129040232.10116-1-jasowang@redhat.com>
 <ea906777-1be5-70d7-5eb1-3f50169ac7a5@redhat.com>
 <20221129104311-mutt-send-email-mst@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221129104311-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Michael,

On 11/29/22 16:44, Michael S. Tsirkin wrote:
> On Tue, Nov 29, 2022 at 10:52:29AM +0100, Eric Auger wrote:
>> Hi Jason,
>>
>> On 11/29/22 05:02, Jason Wang wrote:
>>> When vIOMMU is enabled, the vq->used_phys is actually the IOVA not
>>> GPA. So we need to translate it to GPA before the syncing otherwise we
>>> may hit the following crash since IOVA could be out of the scope of
>>> the GPA log size. This could be noted when using virtio-IOMMU with
>>> vhost using 1G memory.
>>>
>>> Fixes: c471ad0e9bd46 ("vhost_net: device IOTLB support")
>>> Cc: qemu-stable@nongnu.org
>>> Tested-by: Lei Yang <leiyang@redhat.com>
>>> Reported-by: Yalan Zhang <yalzhang@redhat.com>
>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>> ---
>>> Changes since V1:
>>> - Fix the address calculation when used ring is not page aligned
>>> - Fix the length for each round of dirty bitmap syncing
>>> - Use LOG_GUEST_ERROR to log wrong used adddress
>>> - Various other tweaks
>>> ---
>>>  hw/virtio/vhost.c | 76 ++++++++++++++++++++++++++++++++++-------------
>>>  1 file changed, 56 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>> index d1c4c20b8c..0cd5f25fcb 100644
>>> --- a/hw/virtio/vhost.c
>>> +++ b/hw/virtio/vhost.c
>>> @@ -20,6 +20,7 @@
>>>  #include "qemu/range.h"
>>>  #include "qemu/error-report.h"
>>>  #include "qemu/memfd.h"
>>> +#include "qemu/log.h"
>>>  #include "standard-headers/linux/vhost_types.h"
>>>  #include "hw/virtio/virtio-bus.h"
>>>  #include "hw/virtio/virtio-access.h"
>>> @@ -106,6 +107,24 @@ static void vhost_dev_sync_region(struct vhost_dev *dev,
>>>      }
>>>  }
>>>  
>>> +static bool vhost_dev_has_iommu(struct vhost_dev *dev)
>>> +{
>>> +    VirtIODevice *vdev = dev->vdev;
>>> +
>>> +    /*
>>> +     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
>>> +     * incremental memory mapping API via IOTLB API. For platform that
>>> +     * does not have IOMMU, there's no need to enable this feature
>>> +     * which may cause unnecessary IOTLB miss/update transactions.
>>> +     */
>>> +    if (vdev) {
>>> +        return virtio_bus_device_iommu_enabled(vdev) &&
>>> +            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>>> +    } else {
>>> +        return false;
>>> +    }
>>> +}
>>> +
>>>  static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
>>>                                     MemoryRegionSection *section,
>>>                                     hwaddr first,
>>> @@ -137,8 +156,43 @@ static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
>>>              continue;
>>>          }
>>>  
>>> -        vhost_dev_sync_region(dev, section, start_addr, end_addr, vq->used_phys,
>>> -                              range_get_last(vq->used_phys, vq->used_size));
>>> +        if (vhost_dev_has_iommu(dev)) {
>>> +            IOMMUTLBEntry iotlb;
>>> +            hwaddr used_phys = vq->used_phys, used_size = vq->used_size;
>>> +            hwaddr phys, s;
>>> +
>>> +            while (used_size) {
>>> +                rcu_read_lock();
>>> +                iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
>>> +                                                      used_phys,
>>> +                                                      true, MEMTXATTRS_UNSPECIFIED);
>>> +                rcu_read_unlock();
>>> +
>>> +                if (!iotlb.target_as) {
>>> +                    qemu_log_mask(LOG_GUEST_ERROR, "translation "
>>> +                                  "failure for used_phys %"PRIx64"\n", used_phys);
>> looks weird to see translation of "used_phys" whereas it is an iova. At
>> least I would reword the msg
>>> +                    return -EINVAL;
>>> +                }
>>> +
>>> +                phys = iotlb.translated_addr + (used_phys & iotlb.addr_mask);
>> you may use a local variable storing this offset =
>>
>> used_phys & iotlb.addr_mask
>>
>>> +
>>> +                /* Distance from start of used ring until last byte of
>>> +                   IOMMU page */
>> you can avoid checkpatch warnings here
>>> +                s = iotlb.addr_mask - (used_phys & iotlb.addr_mask);
>>> +                /* Size of used ring, or of the part of it until end
>>> +                   of IOMMU page */
>> and here
>>
>> I would suggest to rewrite this into
>> s =iotlb.addr_mask - (used_phys & iotlb.addr_mask) + 1
>> s = MIN(s, used_size);
> This does not work - if iotlb.addr_mask - (used_phys & iotlb.addr_mask)
> is all-ones then + 1 gives you 0 and MIN gives you 0.
> Theoretical but worth being safe here IMHO.
Ah OK, I should have read your previous discussion more thoroughly ...
Maybe just add a short comment then to justify the gym below and avoid
tempting sbdy else to rewrite it in a more common but wrong way.

Thanks

Eric
>
>
>>> +                s = MIN(s, used_size - 1) + 1;
>>> +
>>> +                vhost_dev_sync_region(dev, section, start_addr, end_addr, phys,
>>> +                                      range_get_last(phys, s));
>>> +                used_size -= s;
>>> +                used_phys += s;
>>> +            }
>>> +        } else {
>>> +            vhost_dev_sync_region(dev, section, start_addr,
>>> +                                  end_addr, vq->used_phys,
>>> +                                  range_get_last(vq->used_phys, vq->used_size));
>>> +        }
>>>      }
>>>      return 0;
>>>  }
>>> @@ -306,24 +360,6 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
>>>      dev->log_size = size;
>>>  }
>>>  
>>> -static bool vhost_dev_has_iommu(struct vhost_dev *dev)
>>> -{
>>> -    VirtIODevice *vdev = dev->vdev;
>>> -
>>> -    /*
>>> -     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
>>> -     * incremental memory mapping API via IOTLB API. For platform that
>>> -     * does not have IOMMU, there's no need to enable this feature
>>> -     * which may cause unnecessary IOTLB miss/update transactions.
>>> -     */
>>> -    if (vdev) {
>>> -        return virtio_bus_device_iommu_enabled(vdev) &&
>>> -            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>>> -    } else {
>>> -        return false;
>>> -    }
>>> -}
>>> -
>>>  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
>>>                                hwaddr *plen, bool is_write)
>>>  {
>> Besides,
>>
>> Tested-by: Eric Auger <eric.auger@redhat.com>
>>
>> Eric


