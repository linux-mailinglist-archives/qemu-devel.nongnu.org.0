Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC033C7B44
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 04:02:11 +0200 (CEST)
Received: from localhost ([::1]:57000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3UDy-0003js-3l
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 22:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3UCu-00034j-Sl
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 22:01:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3UCr-0004J5-8j
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 22:01:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626228059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7NXMf3yrN1mUA+/zxLQUWmYhahKpiUcrFv/k21/KOV4=;
 b=GDRy+hANLIGAHI9XX2GYDBqpBeYSLc8fiNqDIuPQTBD0wBoeOPj/vzY5wcTnGLakZT/c+1
 MyQb58d1dAn9OTKv50lpkU/9DwLl+cQ6cF8ffndM5fPuiaDZrhNNXcE0LS0vlMKQcWtza6
 Ctsk1jWrLd/kCfGf1pz6+7haP1z8WZA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7--rE6gvknN7Cu8XIH0r9ZpQ-1; Tue, 13 Jul 2021 22:00:57 -0400
X-MC-Unique: -rE6gvknN7Cu8XIH0r9ZpQ-1
Received: by mail-pl1-f199.google.com with SMTP id
 p8-20020a1709028a88b029011c6ee150f3so496819plo.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 19:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7NXMf3yrN1mUA+/zxLQUWmYhahKpiUcrFv/k21/KOV4=;
 b=SfUUyp02Ea8xM6yzsEULX92yRO6l3zFLoB4Y2Za0mvqU4izZeiFk9uNi/JEhnwT17C
 UpvxRlvs3bncWdzaTEFEyjNKbwjKlQwOxoTwvHItJa59CsSh2ldhdgF0DGwHxSw9Vg/o
 cG9Ru3ac2oxA6WbUrLz7/LLWqHsHXZPySE8fpp5LaRVV31EsC94hsvovrv4We3gcQfGd
 kmBRkEJC1wmXMYDmi30FgDVAgvKIWrg0olAQvKK6eNrucQ86lE9wJFI2nXXN0Iv3stpJ
 TW3YD1zJz+Ds6crcinHgQ+ulYY9UHaRch79AYzL/BI4A8ndXn26E6pjlEfAMkJDHwoiw
 9s0Q==
X-Gm-Message-State: AOAM532rLhYjpWQ52R3QhsOwl5r0gTXVUOwtzDkWFONNqrXO58bwTCw+
 f3JN5xHoZo+VSZ++T+G9xYetILCPTpuZ5HDzt/BK5yQiiSel6zUDhdir4VaX0C9ioHwxP2YOBeP
 lFoqyU8ibQxXdHWU=
X-Received: by 2002:a17:903:2309:b029:12a:965b:333 with SMTP id
 d9-20020a1709032309b029012a965b0333mr5800461plh.31.1626228056781; 
 Tue, 13 Jul 2021 19:00:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyITy0gio7fuZAT5m6SWHHcIsKxMZgvSiQyhdjciQjfadKeDgNYamT/AVM+44qZCZr9NjwhXw==
X-Received: by 2002:a17:903:2309:b029:12a:965b:333 with SMTP id
 d9-20020a1709032309b029012a965b0333mr5800440plh.31.1626228056496; 
 Tue, 13 Jul 2021 19:00:56 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id f6sm432436pgl.2.2021.07.13.19.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 19:00:56 -0700 (PDT)
Subject: Re: [PATCH V2 00/18] vhost-vDPA multiqueue
To: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Zhu, Lingshan" <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 Eugenio Perez Martin <eperezma@redhat.com>
References: <20210706082717.37730-1-jasowang@redhat.com>
 <ce31242d-08a9-b1e4-f260-8c31ca4b49c0@redhat.com>
 <20210712091500-mutt-send-email-mst@kernel.org>
 <CACGkMEs_sNOqdsDvpMR+Mx7TXY2wW8p_NVALvHLPgeAsiWNTGA@mail.gmail.com>
 <20210713114825-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3a7964da-e367-6893-1590-17fee8f91650@redhat.com>
Date: Wed, 14 Jul 2021 10:00:48 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713114825-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/13 下午11:53, Michael S. Tsirkin 写道:
> On Tue, Jul 13, 2021 at 10:34:50AM +0800, Jason Wang wrote:
>> On Mon, Jul 12, 2021 at 9:15 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>> On Mon, Jul 12, 2021 at 01:44:45PM +0800, Jason Wang wrote:
>>>> 在 2021/7/6 下午4:26, Jason Wang 写道:
>>>>> Hi All:
>>>>>
>>>>> This patch implements the multiqueue support for vhost-vDPA. The most
>>>>> important requirement the control virtqueue support. The virtio-net
>>>>> and vhost-net core are tweak to support control virtqueue as if what
>>>>> data queue pairs are done: a dedicated vhost_net device which is
>>>>> coupled with the NetClientState is intrdouced so most of the existing
>>>>> vhost codes could be reused with minor changes. With the control
>>>>> virtqueue, vhost-vDPA are extend to support creating and destroying
>>>>> multiqueue queue pairs plus the control virtqueue.
>>>>>
>>>>> Tests are done via the vp_vdpa driver in L1 guest plus vdpa simulator
>>>>> on L0.
>>>>>
>>>>> Please reivew.
>>>>
>>>> If no objection, I will queue this for 6.1.
>>>>
>>>> Thanks
>>>
>>> Just to make sure I understand, this basically works by
>>> passing the cvq through to the guest right?
>>> Giving up on maintaining the state in qemu.
>> Yes, if I understand correctly. This is the conclusion since our last
>> discussion.
>>
>> We can handle migration by using shadow virtqueue on top (depends on
>> the Eugenio's work), and multiple IOTLB support on the vhost-vDPA.
>>
>> Thanks
> I still think it's wrong to force userspace to use shadow vq or multiple
> IOTLB. These should be implementation detail.


Stick to a virtqueue interface doesn't mean we need to force the vendor 
to implement the hardware control virtqueue. See below.


>
> Short term I'm inclined to say just switch to userspace emulation
> or to vhost for the duration of migration.
> Long term I think we should push commands to the kernel and have it
> pass them to the PF.


So the issues are, I think we've discussed several times but it's time 
to figure them out now:

1) There's no guarantee that the control virtqueue is implemented in PF
2) Something like pushing commands will bring extra issues:
2.1) duplicating all the existing control virtqueue command via another uAPI
2.2) no asynchronous support
3) can't work for virtio_vdpa
4) bring extra complications for the nested virtualization

If we manage to overcome 2.1 and 2.2 it's just a re-invention of control 
virtqueue.


>
> So it worries me a bit that we are pushing this specific way into QEMU.
> If you are sure it won't push other vendors in this direction and
> we'll be able to back out later then ok, I won't nack it.


Let me clarify, control virtqueue + multiple IOTLB is just the uAPI but 
not the implementation. Parent/vendor is free to implement those 
semantics in their comfortable way:

1) Having a consistent (or re-using) uAPI to work for all kinds of 
control virtqueue or event virtqueue

2) Fit for all kinds of the hardware implementation

2.1) Hardware doesn't have control virtqueue but using registers. Parent 
just decode the cvq commands and translate them to register commands
2.2) Hardware doesn't have control virtqueue but using other device (e.g 
PF) to implement the semantics. Parent just decode the cvq commands and 
send them to the device that implements the semantic (PF)
2.3) Hardware does have control virtqueue with transport specific ASID 
support. Parent just assign a different PASID to cvq, and let userspace 
to use that cvq directly.
2.4) Hardware does have control virtqueue with device specific ASID 
support. Parent just assign a different device specific ASID and let 
userspace to use that cvq directly.

The above 4 should covers all the vendor cases that I know that at least 
2.1 and 2.4 are supported by some vendors. Some vendors have the plan 
for 2.3.

Thanks


>
>>>>> Changes since V1:
>>>>>
>>>>> - validating all features that depends on ctrl vq
>>>>> - typo fixes and commit log tweaks
>>>>> - fix build errors because max_qps is used before it is introduced
>>>>>
>>>>> Thanks
>>>>>
>>>>> Jason Wang (18):
>>>>>     vhost_net: remove the meaningless assignment in vhost_net_start_one()
>>>>>     vhost: use unsigned int for nvqs
>>>>>     vhost_net: do not assume nvqs is always 2
>>>>>     vhost-vdpa: remove the unnecessary check in vhost_vdpa_add()
>>>>>     vhost-vdpa: don't cleanup twice in vhost_vdpa_add()
>>>>>     vhost-vdpa: fix leaking of vhost_net in vhost_vdpa_add()
>>>>>     vhost-vdpa: tweak the error label in vhost_vdpa_add()
>>>>>     vhost-vdpa: fix the wrong assertion in vhost_vdpa_init()
>>>>>     vhost-vdpa: remove the unncessary queue_index assignment
>>>>>     vhost-vdpa: open device fd in net_init_vhost_vdpa()
>>>>>     vhost-vdpa: classify one time request
>>>>>     vhost-vdpa: prepare for the multiqueue support
>>>>>     vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
>>>>>     net: introduce control client
>>>>>     vhost-net: control virtqueue support
>>>>>     virito-net: use "qps" instead of "queues" when possible
>>>>>     virtio-net: vhost control virtqueue support
>>>>>     vhost-vdpa: multiqueue support
>>>>>
>>>>>    hw/net/vhost_net.c             |  48 +++++++---
>>>>>    hw/net/virtio-net.c            | 165 ++++++++++++++++++---------------
>>>>>    hw/virtio/vhost-vdpa.c         |  55 ++++++++++-
>>>>>    include/hw/virtio/vhost-vdpa.h |   1 +
>>>>>    include/hw/virtio/vhost.h      |   2 +-
>>>>>    include/hw/virtio/virtio-net.h |   5 +-
>>>>>    include/net/net.h              |   5 +
>>>>>    include/net/vhost_net.h        |   7 +-
>>>>>    net/net.c                      |  24 ++++-
>>>>>    net/tap.c                      |   1 +
>>>>>    net/vhost-user.c               |   1 +
>>>>>    net/vhost-vdpa.c               | 156 ++++++++++++++++++++++++-------
>>>>>    12 files changed, 332 insertions(+), 138 deletions(-)
>>>>>


