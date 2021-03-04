Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B917C32CFD5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 10:39:41 +0100 (CET)
Received: from localhost ([::1]:53624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHkSK-0004kx-Qu
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 04:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lHkQT-00045c-0W
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 04:37:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lHkQR-0000rg-7C
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 04:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614850661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4b/qGCuoqjPE/6wqhmxJ+LOFBx60XaZ7nYjnHxKtA6M=;
 b=Hm7/wgab3YUmDHqDQuIKMFRW44TnN2qcdW3jJcdOHqdSxZCQ1+mGxdVwFoK/NbkVWvZoZ3
 s7UBwo1v7Vy0oNXHqHDiEzr4fUPFDGI9aDBLxs6BxdYhV/IXZWaXBszfGThUSQtIk554ue
 xuFhwF37M083FSg+d+WY7s2zXHXIM7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-NQJn4t4aO7KyWtrI98iu-g-1; Thu, 04 Mar 2021 04:37:40 -0500
X-MC-Unique: NQJn4t4aO7KyWtrI98iu-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 347B7108BD0A;
 Thu,  4 Mar 2021 09:37:39 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-64.pek2.redhat.com
 [10.72.12.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AE741001901;
 Thu,  4 Mar 2021 09:37:29 +0000 (UTC)
Subject: Re: [PATCH v1] vhost-vdpa: Set discarding of RAM broken when
 initializing the backend
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Xie Yongji <xieyongji@bytedance.com>
References: <20210302162129.52912-1-david@redhat.com>
 <81c675cd-1573-7555-7d20-07b0ed950ebb@redhat.com>
 <886ed3b7-e48c-7200-e5e6-ce8b0adc589c@redhat.com>
 <e8916626-4dfd-f8a1-0028-771f27882632@redhat.com>
 <2cd5c10c-0c85-b5a4-de06-30d7ee30661a@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <58b4e30e-d9ed-395b-2a23-03a04fb58060@redhat.com>
Date: Thu, 4 Mar 2021 17:37:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2cd5c10c-0c85-b5a4-de06-30d7ee30661a@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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


On 2021/3/4 5:34 下午, David Hildenbrand wrote:
> On 04.03.21 10:32, Jason Wang wrote:
>>
>> On 2021/3/3 6:26 下午, David Hildenbrand wrote:
>>> On 03.03.21 03:53, Jason Wang wrote:
>>>>
>>>> On 2021/3/3 12:21 上午, David Hildenbrand wrote:
>>>>> Similar to VFIO, vDPA will go ahead an map+pin all guest memory. 
>>>>> Memory
>>>>> that used to be discarded will get re-populated and if we
>>>>> discard+re-access memory after mapping+pinning, the pages mapped
>>>>> into the
>>>>> vDPA IOMMU will go out of sync with the actual pages mapped into the
>>>>> user
>>>>> space page tables.
>>>>>
>>>>> Set discarding of RAM broken such that:
>>>>> - virtio-mem and vhost-vdpa run mutually exclusive
>>>>> - virtio-balloon is inhibited and no memory discards will get issued
>>>>>
>>>>> In the future, we might be able to support coordinated discarding of
>>>>> RAM
>>>>> as used by virtio-mem and as planned for VFIO.
>>>>>
>>>>> Cc: Jason Wang <jasowang@redhat.com>
>>>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>>>> Cc: Cindy Lu <lulu@redhat.com>
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>
>>>>
>>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>>>
>>>>
>>>>> ---
>>>>>
>>>>> Note: I was not actually able to reproduce/test as I fail to get the
>>>>> vdpa_sim/vdpa_sim_net running on upstream Linux (whetever vdpa,
>>>>> vhost_vdpa,
>>>>> vdpa_sim, vdpa_sim_net modules I probe, and in which order, no vdpa
>>>>> devices
>>>>> appear under /sys/bus/vdpa/devices/ or /dev/).
>>>>
>>>>
>>>> The device creation was switched to use vdpa tool that is integrated
>>>> with iproue2[1].
>>>>
>>>> [1]
>>>> https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=143610383da51e1f868c6d5a2a5e2fb552293d18 
>>>>
>>>>
>>>
>>> It would be great to document that somewhere if not already done. I
>>> only found older RH documentations that were not aware of that. I'll
>>> give it a try - thanks!
>>
>>
>> Will think about this. Which RH doc do you refer here? Is this the
>> redhat blog?
>
> https://www.redhat.com/en/blog/hands-vdpa-what-do-you-do-when-you-aint-got-hardware 
>
>
> As it's supposed to be from October 14, 2020 I was surprised to not 
> get it running (even with older kernels IIRC).


Right, the mgmt API is just merged. Will try to see if we can fix the blog.

Thanks



