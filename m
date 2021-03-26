Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F2B34A427
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 10:20:47 +0100 (CET)
Received: from localhost ([::1]:58326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPie0-0004oC-IT
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 05:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lPic7-00044Y-8P
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:18:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lPic3-000660-0T
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616750318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtTDmfQbYYqqRZD3Jlsl/SCm40Dyq82G8Vau9UwrWlQ=;
 b=XDP0E9SqezonhGxxZqwoc9PW3Lc+/4iFVALP6NWgVQQ0LtkaL9eMzRrmixCuKSIrGauGa9
 R+STdJr5an5zWUwkrkGAPxc8dVUxId8UYGp5024r4ynN1PmkpQmZU5jYiOVCudHkPyid89
 PwtcrRlQSHHdW9EZZjx56bHNZOVoWCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-doQmLfb5O-6xcUXvldS50Q-1; Fri, 26 Mar 2021 05:18:34 -0400
X-MC-Unique: doQmLfb5O-6xcUXvldS50Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CA461009E3E;
 Fri, 26 Mar 2021 09:18:33 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-10.pek2.redhat.com
 [10.72.13.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09F2C36807;
 Fri, 26 Mar 2021 09:18:27 +0000 (UTC)
Subject: Re: [RFC PATCH v2 0/3] virtio-net: graceful drop of vhost for TAP
To: Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20210322122452.369750-1-yuri.benditovich@daynix.com>
 <aa33a355-5980-5ff5-7264-02d6fc7f5f9d@redhat.com>
 <CAOEp5Od+jPYdmFdD3z3hVjs5t6QXgmEoOTPHO5cLVyifjmjgRQ@mail.gmail.com>
 <e3971d80-6b7c-2e47-9ee9-41f08d0a9df9@redhat.com>
 <CAOEp5OfBpq_DjD4k_enGCuDkV9d738wyW9ye6Uk9vsnD+jS7eA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a7088e13-559b-560e-67e1-a2b8a3fed19e@redhat.com>
Date: Fri, 26 Mar 2021 17:18:26 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAOEp5OfBpq_DjD4k_enGCuDkV9d738wyW9ye6Uk9vsnD+jS7eA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Yan Vugenfirer <yan@daynix.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/3/26 下午5:09, Yuri Benditovich 写道:
> On Fri, Mar 26, 2021 at 10:51 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/3/25 下午5:00, Yuri Benditovich 写道:
>>> Hi Jason,
>>>
>>> This was discussed earlier on the previous series of patches.
>>> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg01829.html
>>> There were strong objections from both Daniel and Michael and I feel
>>> that the series was rejected.
>>> There was Michael's claim:
>>> "We did what this patch is trying to change for years now, in
>>> particular KVM also seems to happily disable CPU features not supported
>>> by kernel so I wonder why we can't keep doing it, with tweaks for some
>>> corner cases."
>>
>> So for cpu feautres, it works since the management have other tool to
>> the cpuid. Then management will make sure the migration happens amongs
>> the hosts that is compatibile with the same cpuid sets.
>>
>> For vhost, we don't have such capabilities, that's why I think we need
>> to have fallback.
>>
> Hi Jason,
> What, from your POV was the result of v1 discussion?


It looks to me we don't have an agreement on that, sorry.


> IMO, there was one critical comment that the patch does not address
> 'forcevhost' properly (indeed).
> IMO, there are many comments from Daniel and Michael that in the sum
> say that this change is not what they would like.
> If I'm mistaken please let me know.


I think I will open a new thread and summarize the different approaches 
and then we can come a conclusion.


>
> I have no problem to send v3 = v1 + handling of ''forcevhost'
> If this is what you want, please let me know also.
>
>>> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg03187.html
>>> And it was Michael's question:
>>> "Can we limit the change to when a VM is migrated in?"
>>> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg03163.html
>>> So I'm trying to suggest another approach:
>>> - In case of conflicting features (for example RSS and vhost) we in
>>> qemu we do not have enough information to prefer one or another.
>>> - If we drop to userspace in the first set_features we say: "vhost is
>>> less important than other requested features"
>>> - This series keeps backward compatibility, i.e. if you start with
>>> vhost and some features are not available - they are silently cleared.
>>> - But in case the features are available on source machine - they are used
>>> - In case of migration this series says: "We prefer successful
>>> migration even if for that we need to drop to userspace"
>>> - On the migration back to the 1st system we again work with all the
>>> features and with vhost as all the features are available.
>>
>> One issue for this approach is that. Consider we had two drivers:
>>
>> 1) Driver A that supports split only
>> 2) Driver B that supports packed
>>
>> Consider src support packed but dest doesn't
>>
>> So switching driver A to driver B works without migration. But if we
>> switch driver from A to B after migration it won't work?
> I assume that  both src and dest started with vhost=on.
>
> As driver B supports both packed and split, you can switch from driver
> A to driver B after migration
> and driver B will work with split. Exactly as it does today.
>
> The key question is what is more important - vhost or features that
> vhost does not support?
> current code says: vhost is more important always
> v1 patch says: features are more important always.
> v2 patch says: vhost is more important at init time, features are more
> important at migration time.
> Because we are able to drop vhost but we can't drop features when we
> have a running driver.
> Do you agree?


I think what came from cli is the most important. So if I understand 
correclty:

- vhost=on means "turn on vhost when possible" it implies that fallback 
is allowed (we had already had fallback codes)
- vhostforce=on means "turn on vhost unconditonally" it implies that we 
can't do fallback

So my understanding is that:

- "vhost=on, packed=on", we can fallback to userspace but must keep 
packed virtqueue works
- "vhost=on,vhostforce=on,packed=on", we can't fallback and must keep 
both vhost and packed virtqueue work, if we can't we need to fail

Thanks


>
>> Thanks
>>
>>
>>> Thanks,
>>> Yuri
>>>
>>>
>>>
>>> On Thu, Mar 25, 2021 at 8:59 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> 在 2021/3/22 下午8:24, Yuri Benditovich 写道:
>>>>> Allow fallback to userspace only upon migration, only for specific features
>>>>> and only if 'vhostforce' is not requested.
>>>>>
>>>>> Changes from v1:
>>>>> Patch 1 dropeed (will be submitted in another series)
>>>>> Added device callback in case the migration should fail due to missing features
>>>> Hi Yuri:
>>>>
>>>> Have a quick glance at the series. A questions is why we need to do the
>>>> fallback only during load?
>>>>
>>>> I think we should do it in the device initializating. E.g when the vhost
>>>> features can not satisfy, we should disable vhost since there.
>>>>
>>>> Thanks
>>>>
>>>>
>>>>> Yuri Benditovich (3):
>>>>>      net: add ability to hide (disable) vhost_net
>>>>>      virtio: introduce 'missing_features_migrated' device callback
>>>>>      virtio-net: implement missing_features_migrated callback
>>>>>
>>>>>     hw/net/vhost_net.c         |  4 ++-
>>>>>     hw/net/virtio-net.c        | 51 ++++++++++++++++++++++++++++++++++++++
>>>>>     hw/virtio/virtio.c         |  8 ++++++
>>>>>     include/hw/virtio/virtio.h |  8 ++++++
>>>>>     include/net/net.h          |  1 +
>>>>>     5 files changed, 71 insertions(+), 1 deletion(-)
>>>>>


