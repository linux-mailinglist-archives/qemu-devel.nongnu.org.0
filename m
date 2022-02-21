Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884694BD4BE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 05:33:15 +0100 (CET)
Received: from localhost ([::1]:34024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM0Nu-00046c-Kf
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 23:33:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nM0Ma-0003EG-6N
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 23:31:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nM0MV-0003a2-LI
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 23:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645417905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvGCIMtrnG3EODnPYEKILLkWaV1Bp5PogayDrLO4T/M=;
 b=gN7hGbTQVmitqaJmSrFu1uZSeTf6RLjK/mJxeNNqcw9mVr02K95MMOAtpYrdrfl2+oHnrT
 BIQ96N43e5YIZ3yyMVe7KfN5T8YyWOxq0I7FX2d8E+bF7+4Sijs2fWscq8iu/wGVX5Zukm
 2d19+fGIbiKcVL2Y1QuciXhIxk4fCkA=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-bfT3hNBlPvyHOv4xPNtrFA-1; Sun, 20 Feb 2022 23:31:44 -0500
X-MC-Unique: bfT3hNBlPvyHOv4xPNtrFA-1
Received: by mail-pg1-f197.google.com with SMTP id
 a18-20020a656052000000b00371d6702c59so8789119pgp.15
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 20:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vvGCIMtrnG3EODnPYEKILLkWaV1Bp5PogayDrLO4T/M=;
 b=hxOP+1tIF+lBIYM7W7wRdc1gYrwe8dik424X2R17hhF6KPjdjAoMCBz7jwxE3AOlrN
 5zbfOptw/mmES36p/cs7wyhRCIAjof6LzjQWyYY7VO12DcpwrPrDrMwxDIMegb8p7fmd
 A48thvmKOErmQKAW/hUNvQpCv0wJVh5JDSMlq3tMjrM3mfnFppO/vEcZmAt2iF2q5UiZ
 krL7EntFijzsZ/3asc0z7AEIwb2WkCK7/UvXebpnjroYX5KX6DgUYhCT/kiY9f8fwTEW
 tuAeSx4XIhpZ7zM+kkuTtfm4E6zI+tYSMHWybOq9pWI6hYBfAX4KwibQBDGR93dTZxUb
 DWNQ==
X-Gm-Message-State: AOAM531+Co9O7dMnY7Dz0wwScqoDV0CT8wXxc4l2kvx00sMMXt1fYjiu
 jjUiC6Ta8keFkr/hH5Lxun0FqqJHHkyoMaCoiZVVGrh0Bp/bFGG0XK3vsQnRX2sX23rOMIqahEw
 Qp5os3kK9jrowaLw=
X-Received: by 2002:a05:6a00:124b:b0:4f0:eaa7:4677 with SMTP id
 u11-20020a056a00124b00b004f0eaa74677mr13628737pfi.85.1645417903633; 
 Sun, 20 Feb 2022 20:31:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziq/8cLi1xQJn8Ps1iiU797cSX6OD9JSsWOm3tdK8e0Cj+dbKVOKyta5N1K65b4DIPGb6syA==
X-Received: by 2002:a05:6a00:124b:b0:4f0:eaa7:4677 with SMTP id
 u11-20020a056a00124b00b004f0eaa74677mr13628712pfi.85.1645417903334; 
 Sun, 20 Feb 2022 20:31:43 -0800 (PST)
Received: from [10.72.12.96] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id v13sm11526222pfu.196.2022.02.20.20.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 20:31:42 -0800 (PST)
Message-ID: <681533f1-e2e6-fac2-c9a2-dadd07d1f7c4@redhat.com>
Date: Mon, 21 Feb 2022 12:31:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 2/2] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
To: Eugenio Perez Martin <eperezma@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220215072231.2498-1-gdawar@xilinx.com>
 <20220215072231.2498-3-gdawar@xilinx.com>
 <20220217023150-mutt-send-email-mst@kernel.org>
 <CAJaqyWcdv3jTP7FzZ9NP29K1YYFp8GYOQEt3s-ySz3bHQDfucQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWcdv3jTP7FzZ9NP29K1YYFp8GYOQEt3s-ySz3bHQDfucQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Martin Petrus Hubertus Habets <martinh@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, tanujk@xilinx.com, pabloc@xilinx.com,
 Gautam Dawar <gautam.dawar@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/18 下午6:22, Eugenio Perez Martin 写道:
> On Thu, Feb 17, 2022 at 8:32 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Tue, Feb 15, 2022 at 12:52:31PM +0530, Gautam Dawar wrote:
>>> This patch adds the ability to negotiate VIRTIO_F_IN_ORDER bit
>>> for vhost-vdpa backend when the underlying device supports this
>>> feature.
>>> This would aid in reaping performance benefits with HW devices
>>> that implement this feature. At the same time, it shouldn't have
>>> any negative impact as vhost-vdpa backend doesn't involve any
>>> userspace virtqueue operations.
>>>
>>> Signed-off-by: Gautam Dawar <gdawar@xilinx.com>
>> Having features that hardware implements but qemu does not
>> means we can't migrate between them.
>> So I'd rather see a userspace implementation.
>>
> While I totally agree the userspace implementation is a better option,
> would it be a problem if we implement it as a cmdline option as Jason
> proposed?
>
> I see other backends have similar issues with migration. For example
> it's possible to run qemu with
> -device=virtio-net-pci,...,indirect_desc=on and use a vhost-kernel
> backend without indirect support in their features. I also understand
> qemu emulated backend as "the base" somehow, but it should work
> similarly to my example if cmdline parameter is off by default.


We had a lot of issues with the command line compatibility like this 
(e.g qemu may silently clear a host feature) which is probably worth to 
fix in the future.


>
> On the other hand, It may be worth thinking if it's worth waiting for
> GSoC though, so we avoid this problem entirely at the moment. But I
> feel that is going to come back with a different feature set with the
> advent of more out of qemu devices and the fast adding of features of
> VirtIO.
>
> Thoughts?


Not sure we had sufficient resources on the Qemu/kernel implementation 
of in-order. But if we decide not to wait we can change the GSoC to 
implement other stuffs like e.g NOTIFICATION_DATA.

Thanks


>
> Thanks!
>
>>> ---
>>>   hw/net/virtio-net.c | 10 ++++++++++
>>>   net/vhost-vdpa.c    |  1 +
>>>   2 files changed, 11 insertions(+)
>>>
>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>> index cf8ab0f8af..a1089d06f6 100644
>>> --- a/hw/net/virtio-net.c
>>> +++ b/hw/net/virtio-net.c
>>> @@ -3507,11 +3507,21 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>>>       nc->rxfilter_notify_enabled = 1;
>>>
>>>      if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
>>> +        uint64_t features = BIT_ULL(VIRTIO_F_IN_ORDER);
>>>           struct virtio_net_config netcfg = {};
>>> +
>>>           memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
>>>           vhost_net_set_config(get_vhost_net(nc->peer),
>>>               (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTER);
>>> +
>>> +     /*
>>> +         * For vhost-vdpa, if underlying device supports IN_ORDER feature,
>>> +         * make it available for negotiation.
>>> +         */
>>> +     features = vhost_net_get_features(get_vhost_net(nc->peer), features);
>>> +     n->host_features |= features;
>>>       }
>>> +
>>>       QTAILQ_INIT(&n->rsc_chains);
>>>       n->qdev = dev;
>>>
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index 25dd6dd975..2886cba5ec 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -62,6 +62,7 @@ const int vdpa_feature_bits[] = {
>>>       VIRTIO_NET_F_CTRL_VQ,
>>>       VIRTIO_F_IOMMU_PLATFORM,
>>>       VIRTIO_F_RING_PACKED,
>>> +    VIRTIO_F_IN_ORDER,
>>>       VIRTIO_NET_F_RSS,
>>>       VIRTIO_NET_F_HASH_REPORT,
>>>       VIRTIO_NET_F_GUEST_ANNOUNCE,
>>> --
>>> 2.30.1


