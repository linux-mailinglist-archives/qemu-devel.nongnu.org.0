Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5232CFC3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 10:35:13 +0100 (CET)
Received: from localhost ([::1]:50930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHkO0-0003IZ-If
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 04:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHkN4-0002tN-HF
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 04:34:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHkN2-0007uK-Va
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 04:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614850452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TQFfEwUjij0Bf/Iqxq4ZJ6tEQ88iR1RUEXY97mUk4RI=;
 b=gdvrxPVcpm4KHHCPjyg7CTtdX0GeLRRXT+0k1IQuaoG5vs6hJhaOQeXOVZ4wD5c+khIhBh
 MxHHspoDCFuus/nI6mq5aXLkkT5aYH6JnX8C7xL12EvzyWS+gNgtAinWibk3CJta+Oo9B+
 r0zoeCbVUG99muYvIsoyx9H2HLWRAYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-xa_d-IdBPGSqjctqEdF4Ug-1; Thu, 04 Mar 2021 04:34:10 -0500
X-MC-Unique: xa_d-IdBPGSqjctqEdF4Ug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74AC21842142;
 Thu,  4 Mar 2021 09:34:09 +0000 (UTC)
Received: from [10.36.113.171] (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38B292C6FA;
 Thu,  4 Mar 2021 09:34:05 +0000 (UTC)
Subject: Re: [PATCH v1] vhost-vdpa: Set discarding of RAM broken when
 initializing the backend
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Xie Yongji <xieyongji@bytedance.com>
References: <20210302162129.52912-1-david@redhat.com>
 <81c675cd-1573-7555-7d20-07b0ed950ebb@redhat.com>
 <886ed3b7-e48c-7200-e5e6-ce8b0adc589c@redhat.com>
 <e8916626-4dfd-f8a1-0028-771f27882632@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <2cd5c10c-0c85-b5a4-de06-30d7ee30661a@redhat.com>
Date: Thu, 4 Mar 2021 10:34:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e8916626-4dfd-f8a1-0028-771f27882632@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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

On 04.03.21 10:32, Jason Wang wrote:
> 
> On 2021/3/3 6:26 下午, David Hildenbrand wrote:
>> On 03.03.21 03:53, Jason Wang wrote:
>>>
>>> On 2021/3/3 12:21 上午, David Hildenbrand wrote:
>>>> Similar to VFIO, vDPA will go ahead an map+pin all guest memory. Memory
>>>> that used to be discarded will get re-populated and if we
>>>> discard+re-access memory after mapping+pinning, the pages mapped
>>>> into the
>>>> vDPA IOMMU will go out of sync with the actual pages mapped into the
>>>> user
>>>> space page tables.
>>>>
>>>> Set discarding of RAM broken such that:
>>>> - virtio-mem and vhost-vdpa run mutually exclusive
>>>> - virtio-balloon is inhibited and no memory discards will get issued
>>>>
>>>> In the future, we might be able to support coordinated discarding of
>>>> RAM
>>>> as used by virtio-mem and as planned for VFIO.
>>>>
>>>> Cc: Jason Wang <jasowang@redhat.com>
>>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>>> Cc: Cindy Lu <lulu@redhat.com>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>
>>>
>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>>
>>>
>>>> ---
>>>>
>>>> Note: I was not actually able to reproduce/test as I fail to get the
>>>> vdpa_sim/vdpa_sim_net running on upstream Linux (whetever vdpa,
>>>> vhost_vdpa,
>>>> vdpa_sim, vdpa_sim_net modules I probe, and in which order, no vdpa
>>>> devices
>>>> appear under /sys/bus/vdpa/devices/ or /dev/).
>>>
>>>
>>> The device creation was switched to use vdpa tool that is integrated
>>> with iproue2[1].
>>>
>>> [1]
>>> https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=143610383da51e1f868c6d5a2a5e2fb552293d18
>>>
>>
>> It would be great to document that somewhere if not already done. I
>> only found older RH documentations that were not aware of that. I'll
>> give it a try - thanks!
> 
> 
> Will think about this. Which RH doc do you refer here? Is this the
> redhat blog?

https://www.redhat.com/en/blog/hands-vdpa-what-do-you-do-when-you-aint-got-hardware

As it's supposed to be from October 14, 2020 I was surprised to not get 
it running (even with older kernels IIRC).

-- 
Thanks,

David / dhildenb


