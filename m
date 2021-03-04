Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878EF32CFB5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 10:33:32 +0100 (CET)
Received: from localhost ([::1]:48772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHkMM-0002On-92
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 04:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lHkLP-0001yV-0I
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 04:32:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lHkLL-00077Y-Kf
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 04:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614850345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xw44eYHvOwXx4IiaQTEVJiukTO8yhHkPjbFFfx+28Cw=;
 b=YNwTPkAqcYNumG+ZD4o4iD1h+u8UkJWkdbsSJvg4sYNS2QfCyvV7GQjRDvYWRGQKozMb6F
 pGxQNrfKTEpsxXQRdNHEyEgsSkfp7TTP9jA3P6KIGfShc8Frdb+QNM5ij+8+321XEvtCPC
 jKWwsFG1hCMbntyBvUV8ner2/c+DDrM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-ND75OaX6MrGqp1JA0ifUCg-1; Thu, 04 Mar 2021 04:32:23 -0500
X-MC-Unique: ND75OaX6MrGqp1JA0ifUCg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9310B83DD20;
 Thu,  4 Mar 2021 09:32:22 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-64.pek2.redhat.com
 [10.72.12.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4708019C48;
 Thu,  4 Mar 2021 09:32:11 +0000 (UTC)
Subject: Re: [PATCH v1] vhost-vdpa: Set discarding of RAM broken when
 initializing the backend
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Xie Yongji <xieyongji@bytedance.com>
References: <20210302162129.52912-1-david@redhat.com>
 <81c675cd-1573-7555-7d20-07b0ed950ebb@redhat.com>
 <886ed3b7-e48c-7200-e5e6-ce8b0adc589c@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e8916626-4dfd-f8a1-0028-771f27882632@redhat.com>
Date: Thu, 4 Mar 2021 17:32:09 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <886ed3b7-e48c-7200-e5e6-ce8b0adc589c@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cindy Lu <lulu@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/3/3 6:26 下午, David Hildenbrand wrote:
> On 03.03.21 03:53, Jason Wang wrote:
>>
>> On 2021/3/3 12:21 上午, David Hildenbrand wrote:
>>> Similar to VFIO, vDPA will go ahead an map+pin all guest memory. Memory
>>> that used to be discarded will get re-populated and if we
>>> discard+re-access memory after mapping+pinning, the pages mapped 
>>> into the
>>> vDPA IOMMU will go out of sync with the actual pages mapped into the 
>>> user
>>> space page tables.
>>>
>>> Set discarding of RAM broken such that:
>>> - virtio-mem and vhost-vdpa run mutually exclusive
>>> - virtio-balloon is inhibited and no memory discards will get issued
>>>
>>> In the future, we might be able to support coordinated discarding of 
>>> RAM
>>> as used by virtio-mem and as planned for VFIO.
>>>
>>> Cc: Jason Wang <jasowang@redhat.com>
>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>> Cc: Cindy Lu <lulu@redhat.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>
>>
>> Acked-by: Jason Wang <jasowang@redhat.com>
>>
>>
>>> ---
>>>
>>> Note: I was not actually able to reproduce/test as I fail to get the
>>> vdpa_sim/vdpa_sim_net running on upstream Linux (whetever vdpa, 
>>> vhost_vdpa,
>>> vdpa_sim, vdpa_sim_net modules I probe, and in which order, no vdpa 
>>> devices
>>> appear under /sys/bus/vdpa/devices/ or /dev/).
>>
>>
>> The device creation was switched to use vdpa tool that is integrated
>> with iproue2[1].
>>
>> [1]
>> https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=143610383da51e1f868c6d5a2a5e2fb552293d18 
>>
>
> It would be great to document that somewhere if not already done. I 
> only found older RH documentations that were not aware of that. I'll 
> give it a try - thanks!


Will think about this. Which RH doc do you refer here? Is this the 
redhat blog?


>
>>
>>
>>>
>>> ---
>>>    hw/virtio/vhost-vdpa.c | 13 +++++++++++++
>>>    1 file changed, 13 insertions(+)
>>>
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 01d2101d09..86058d4041 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -278,6 +278,17 @@ static int vhost_vdpa_init(struct vhost_dev 
>>> *dev, void *opaque)
>>>        uint64_t features;
>>>        assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>>>        trace_vhost_vdpa_init(dev, opaque);
>>> +    int ret;
>>> +
>>> +    /*
>>> +     * Similar to VFIO, we end up pinning all guest memory and have to
>>> +     * disable discarding of RAM.
>>> +     */
>>> +    ret = ram_block_discard_disable(true);
>>> +    if (ret) {
>>> +        error_report("Cannot set discarding of RAM broken");
>>> +        return ret;
>>> +    }
>>
>>
>> vDPA will support non pinning (shared VM) backend soon[2]. So I guess we
>> need a flag to be advertised to usersapce then we can conditionly enable
>> the discard here.
>
> I thought that was already the default (because I stumbled over 
> enforcing guest IOMMU) but was surprised when I had a look at the 
> implementation.
>
> Having a flag sounds good.
>
> BTW: I assume iommu support is not fully working yet, right? I don't 
> see special casing for iommu regions, including registering the 
> listener and updating the mapping.


It's not yet implemented. Yes, it's something like what VFIO did right 
now, e.g to use IOMMU notifiers.

Thanks



