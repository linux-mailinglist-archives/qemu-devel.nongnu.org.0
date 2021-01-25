Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD722302314
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 10:01:35 +0100 (CET)
Received: from localhost ([::1]:52102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3xkb-0001nR-TI
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 04:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l3xiq-0001Mi-6j
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 03:59:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l3xik-0006eG-Lm
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 03:59:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611565177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8QrC6br+Eak3bdrj5L9A+GYTR/r1MqbbPEnZjr5eHk=;
 b=XW8drBbiYLSJ6cLTuJG5Xt9iSLmXHaanGYHueRv8naMaZOjCLQxpwd7Dd9xVxoH/kIw0nk
 9RbYhKIFjlrHcq4p1N3CqFfFVotT2R7icECR8TYC4URtjfADqJ6rCIU+M2t00XiwJS0qlr
 glg86Z/ddRby/DA8XC0EQ9lMu1HGzaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-CcoieVisPy2fRvQATmlMEA-1; Mon, 25 Jan 2021 03:59:33 -0500
X-MC-Unique: CcoieVisPy2fRvQATmlMEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57A918066E9;
 Mon, 25 Jan 2021 08:59:32 +0000 (UTC)
Received: from [10.72.13.250] (ovpn-13-250.pek2.redhat.com [10.72.13.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A7435D9DB;
 Mon, 25 Jan 2021 08:59:26 +0000 (UTC)
Subject: Re: [RFC PATCH v3 5/6] virtio-net: Added eBPF RSS to virtio-net.
To: Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20210114211612.387052-1-andrew@daynix.com>
 <20210114211612.387052-6-andrew@daynix.com>
 <266f9040-542e-199e-1903-fb871ae3ad81@redhat.com>
 <CAOEp5Oe0ZDRxSVaO4Q=YiJ3LTmXzcoUot1y1WhD97SsN=-oTgg@mail.gmail.com>
 <21d802e9-b8d9-61b0-b966-0843df2364e1@redhat.com>
 <CAOEp5Oc265Z7+yipfuGSFcVY_tt5oqyf4pkk1jjyxyVTNoCkmQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7706492d-4537-2fbd-41f5-fd1ad35c9681@redhat.com>
Date: Mon, 25 Jan 2021 16:59:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOEp5Oc265Z7+yipfuGSFcVY_tt5oqyf4pkk1jjyxyVTNoCkmQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>, Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/1/24 下午4:24, Yuri Benditovich wrote:
> Hi Jason,
>
> I've prepared a POC of graceful switch to 'vhost off' if respective
> features are acked by the guest.
> Such a way we do not need to silently clear RSS and hash report
> features in case of 'vhost on'.
> Can you please review it and provide your feedback?
>
> I think the only open question is what to do with cases of vhost-user
> and vhost-vdpa.
>
> https://github.com/qemu/qemu/pull/105
> This pull request is for reviews only.
>
> Thanks in advance


Will review it sometime this week.

Thanks


>
>
>
>
>
>
> On Mon, Jan 18, 2021 at 5:16 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On 2021/1/17 下午5:04, Yuri Benditovich wrote:
>>> On Fri, Jan 15, 2021 at 9:20 AM Jason Wang<jasowang@redhat.com>  wrote:
>>>> On 2021/1/15 上午5:16, Andrew Melnychenko wrote:
>>>>> From: Andrew<andrew@daynix.com>
>>>>>
>>>>> When RSS is enabled the device tries to load the eBPF program
>>>>> to select RX virtqueue in the TUN. If eBPF can be loaded
>>>>> the RSS will function also with vhost (works with kernel 5.8 and later).
>>>>> Software RSS is used as a fallback with vhost=off when eBPF can't be loaded
>>>>> or when hash population requested by the guest.
>>>>>
>>>>> Signed-off-by: Yuri Benditovich<yuri.benditovich@daynix.com>
>>>>> Signed-off-by: Andrew Melnychenko<andrew@daynix.com>
>>>>> ---
>>>>>     hw/net/vhost_net.c             |   2 +
>>>>>     hw/net/virtio-net.c            | 125 +++++++++++++++++++++++++++++++--
>>>>>     include/hw/virtio/virtio-net.h |   4 ++
>>>>>     net/vhost-vdpa.c               |   2 +
>>>>>     4 files changed, 129 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>>>>> index 24d555e764..16124f99c3 100644
>>>>> --- a/hw/net/vhost_net.c
>>>>> +++ b/hw/net/vhost_net.c
>>>>> @@ -71,6 +71,8 @@ static const int user_feature_bits[] = {
>>>>>         VIRTIO_NET_F_MTU,
>>>>>         VIRTIO_F_IOMMU_PLATFORM,
>>>>>         VIRTIO_F_RING_PACKED,
>>>>> +    VIRTIO_NET_F_RSS,
>>>>> +    VIRTIO_NET_F_HASH_REPORT,
>>>>>
>>>>>         /* This bit implies RARP isn't sent by QEMU out of band */
>>>>>         VIRTIO_NET_F_GUEST_ANNOUNCE,
>>>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>>>> index 09ceb02c9d..37016fc73a 100644
>>>>> --- a/hw/net/virtio-net.c
>>>>> +++ b/hw/net/virtio-net.c
>>>>> @@ -691,6 +691,19 @@ static void virtio_net_set_queues(VirtIONet *n)
>>>>>
>>>>>     static void virtio_net_set_multiqueue(VirtIONet *n, int multiqueue);
>>>>>
>>>>> +static uint64_t fix_ebpf_vhost_features(uint64_t features)
>>>>> +{
>>>>> +    /* If vhost=on & CONFIG_EBPF doesn't set - disable RSS feature */
>>>> I still think we should not clear feature silently. This may break
>>>> migraiton if the feature is cleared on destination.
>>> Do I understand it correctly that if we do not clear features silently
>>> and implement a graceful drop to vhost=off when we can't do what we
>>> need with vhost - then we do not need to add any migration blocker?
>>
>> Yes. I think we won't go with migration blocker since we need support
>> migration in the end.
>>
>> Thanks
>>
>>


