Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9D5399877
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 05:13:35 +0200 (CEST)
Received: from localhost ([::1]:51838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lodna-0001yU-JJ
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 23:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lodmV-0000xH-JE
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:12:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lodmP-0003pH-H2
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622689939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SFoKK+EC51c+l97246xTlvBZUhCQaLSTmUMS8zlQcZk=;
 b=iqVxoi6aZSzI25GKxN9wOR/AS6BnAngo2u2PhwAoj22wOGtuNvtVDhj2hgPWNxakgI6GzB
 aE8w+O7mSm3VDy/+Gk1gxo6vgKSS3r2Wr4oX0uZTLHyorIYoVFWKVEf765UhYGUOuues3G
 CCY/+cwURxXTCAOLrFfrd32hZXFjb/Y=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-EZ3f6FWkPkOFwOZu3WgB3w-1; Wed, 02 Jun 2021 23:12:17 -0400
X-MC-Unique: EZ3f6FWkPkOFwOZu3WgB3w-1
Received: by mail-pl1-f198.google.com with SMTP id
 d13-20020a170903208db0290107a6d5fc80so2008099plc.16
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 20:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SFoKK+EC51c+l97246xTlvBZUhCQaLSTmUMS8zlQcZk=;
 b=c29EShhkW4UqpYPGVsryBstvaPDRAcD1Q/hSwmbuuz6sdd763R/XiTHa9MYwNIzvCq
 3zBgRbWVYbham1EMGwFtqqmokO+estK82/c/2MMizJZE27nz8IWJtDXmyXaQVeMhi1SE
 89oFDs5/IloJv1OaTkORvraT3rdzmSXa7haUIrsoZ8s+GOPmFMJgKWxjSKxNZIQglX6E
 mI3ynjfN1z5c87iQnW3MymWYofl7Lqpa83Iz9TAsckAmlQwj1+HPKhC/cmax+uU/4xCN
 f56QQoCeqBXO5PNd5BD++o8M0UJK8PE11XOC16bmnvwOT4HcE2mRsov9QwHW4lFxYOHW
 mK+w==
X-Gm-Message-State: AOAM533sPzP41SgjraB+73m7Zb+aP+K5TK3h5aGhrSt4T3++jmwZ8/HZ
 NC4B7cVGJ3HULR1tIPFewjAANcW85N94HfGto+MBGCnhQ3NuVqd1lhRC27EH7VbgZxgXjoWmUyd
 1rVDgXUv/DdnPpOg=
X-Received: by 2002:a62:92cd:0:b029:28f:29e6:449 with SMTP id
 o196-20020a6292cd0000b029028f29e60449mr30324435pfd.75.1622689936210; 
 Wed, 02 Jun 2021 20:12:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkn2v8Zrup0MBnXn4X+oF/0R4owcwDUsFQap52pM8H4wQ8OK2VUJyp6BRfCEq9v0xsTdxLtg==
X-Received: by 2002:a62:92cd:0:b029:28f:29e6:449 with SMTP id
 o196-20020a6292cd0000b029028f29e60449mr30324415pfd.75.1622689935924; 
 Wed, 02 Jun 2021 20:12:15 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p26sm778208pfw.178.2021.06.02.20.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 20:12:14 -0700 (PDT)
Subject: Re: [RFC v3 06/29] virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-7-eperezma@redhat.com>
 <e64b9813-66e5-2417-3feb-65f0376db7e0@redhat.com>
 <4146c924-e871-5a94-253e-e9e09456f74b@redhat.com>
 <CAJaqyWeV+za=xeKHb9vn=Y+0mfekCb8w5dmWNMgzQ6uOtU3jxw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <16776ace-38eb-7a9f-366c-26e650badef3@redhat.com>
Date: Thu, 3 Jun 2021 11:12:05 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAJaqyWeV+za=xeKHb9vn=Y+0mfekCb8w5dmWNMgzQ6uOtU3jxw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Harpreet Singh Anand <hanand@xilinx.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/1 下午3:13, Eugenio Perez Martin 写道:
> On Wed, May 26, 2021 at 3:10 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/5/26 上午9:06, Jason Wang 写道:
>>> 在 2021/5/20 上午12:28, Eugenio Pérez 写道:
>>>> So the guest can stop and start net device. It implements the RFC
>>>> https://lists.oasis-open.org/archives/virtio-comment/202012/msg00027.html
>>>>
>>>>
>>>> To stop (as "pause") the device is required to migrate status and vring
>>>> addresses between device and SVQ.
>>>>
>>>> This is a WIP commit: as with VIRTIO_F_QUEUE_STATE, is introduced in
>>>> virtio_config.h before of even proposing for the kernel, with no feature
>>>> flag, and, with no checking in the device. It also needs a modified
>>>> vp_vdpa driver that supports to set and retrieve status.
>>>>
>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>> ---
>>>>    include/standard-headers/linux/virtio_config.h | 2 ++
>>>>    hw/net/virtio-net.c                            | 4 +++-
>>>>    2 files changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/standard-headers/linux/virtio_config.h
>>>> b/include/standard-headers/linux/virtio_config.h
>>>> index 59fad3eb45..b3f6b1365d 100644
>>>> --- a/include/standard-headers/linux/virtio_config.h
>>>> +++ b/include/standard-headers/linux/virtio_config.h
>>>> @@ -40,6 +40,8 @@
>>>>    #define VIRTIO_CONFIG_S_DRIVER_OK    4
>>>>    /* Driver has finished configuring features */
>>>>    #define VIRTIO_CONFIG_S_FEATURES_OK    8
>>>> +/* Device is stopped */
>>>> +#define VIRTIO_CONFIG_S_DEVICE_STOPPED 32
>>>>    /* Device entered invalid state, driver must reset it */
>>>>    #define VIRTIO_CONFIG_S_NEEDS_RESET    0x40
>>>>    /* We've given up on this device. */
>>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>>> index 96a3cc8357..2d3caea289 100644
>>>> --- a/hw/net/virtio-net.c
>>>> +++ b/hw/net/virtio-net.c
>>>> @@ -198,7 +198,9 @@ static bool virtio_net_started(VirtIONet *n,
>>>> uint8_t status)
>>>>    {
>>>>        VirtIODevice *vdev = VIRTIO_DEVICE(n);
>>>>        return (status & VIRTIO_CONFIG_S_DRIVER_OK) &&
>>>> -        (n->status & VIRTIO_NET_S_LINK_UP) && vdev->vm_running;
>>>> +        (!(n->status & VIRTIO_CONFIG_S_DEVICE_STOPPED)) &&
>>>> +        (n->status & VIRTIO_NET_S_LINK_UP) &&
>>>> +        vdev->vm_running;
>>>>    }
>>>>      static void virtio_net_announce_notify(VirtIONet *net)
>>>
>>> It looks to me this is only the part of pause.
> For SVQ we need to switch vring addresses, and a full reset of the
> device is required for that. Actually, the pause is just used to
> recover
>
> If you prefer this could be sent as a separate series where the full
> pause/resume cycle is implemented, and then SVQ uses the pause part.
> However there are no use for the resume part at the moment.


That would be fine if you can send it in another series.


>
>> And even for pause, I don't see anything that prevents rx/tx from being
>> executed? (E.g virtio_net_handle_tx_bh or virtio_net_handle_rx).
>>
> virtio_net_started is called from virtio_net_set_status. If
> _S_DEVICE_STOPPED is true, the former return false, and variable
> queue_started is false in the latter:
>    queue_started =
>              virtio_net_started(n, queue_status) && !n->vhost_started;
>
> After that, it should work like a regular device reset or link down if
> I'm not wrong, and the last part of virtio_net_set_status should
> delete timer or cancel bh.


You are right.

Thanks


>
>> Thanks
>>
>>
>>> We still need the resume?
>>>
>>> Thanks
>>>
>>>


