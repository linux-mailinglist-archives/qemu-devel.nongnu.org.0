Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7A04BF286
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 08:23:46 +0100 (CET)
Received: from localhost ([::1]:35314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMPWT-0003Zq-Tq
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 02:23:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nMPRO-0008Qq-61
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:18:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nMPRJ-0002Cp-Og
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645514303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N605itsJ1wT+s8NNBskCBTCGqv0vzaQjw0MTSTM68tQ=;
 b=BWpGq8U7lA0R7agmUCVP9OCYLjKrMCBt6fIpNMK7zRViE0PEVXLqQTCiKxhRRslcZ/pgMm
 /TaoAhnYwZ9SqcAkv+gt9B1FcFFNciW8F2oSPDUIZ6iau8+Wlrjyhu4As1elfQrFrqxOz+
 lHf0H2G6kwEBSRVdWsOq0ncrny5+klw=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-fzrRiPfDO7imgihQ0y4yrA-1; Tue, 22 Feb 2022 02:18:19 -0500
X-MC-Unique: fzrRiPfDO7imgihQ0y4yrA-1
Received: by mail-pf1-f200.google.com with SMTP id
 y28-20020aa793dc000000b004e160274e3eso6462622pff.18
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 23:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N605itsJ1wT+s8NNBskCBTCGqv0vzaQjw0MTSTM68tQ=;
 b=7iv44638n8j+ujb7ryeUsBN0gdsTjqfFbUFUdqNdEXIb33q/i/Wdh6FN0U4X9ZcLfj
 pBfltu6GY6mmcpLrhQx4VPn1wlP81aCf1z87L9h2wR7KSsdOtPGEExOoBCjW2XeooaOS
 vKPoTY3XQOAclnVtb7H3Gk3N1m2VJ1qUgUSmAStJh4sm0dlFajo4brQHUxug/M5qk08k
 z4yDiJJrm3oiqkBKWv5/ERSB1+dAqLs1QQftfCjbM39RDhUpm7xRRV/WplweuNDu7Onu
 SeTEk9ISbquuJiaA7qfUQLtmDeF6LlVTaIR/LzwUVOw2+bTYAAVoI/1FTVnPwjznpODk
 J9sQ==
X-Gm-Message-State: AOAM530SzPAQwiurHhPAjCi52QVALp3/3e4rQIaydc0iOjpE8iG+mJTF
 KIiy1iTUvshIISn1xkidyeZMKIWT656T4xm2JQYFR4Ou0AUDgt4kUznSZ7bNIFEatbM/t6HgThj
 9+qxBzw6c7++6trM=
X-Received: by 2002:a17:90a:8689:b0:1b9:b23f:6c29 with SMTP id
 p9-20020a17090a868900b001b9b23f6c29mr2778183pjn.25.1645514298434; 
 Mon, 21 Feb 2022 23:18:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNWgMpGPWjCBoe++gVxooM30AEYuxsjbuPzJTeJ0uGVBhMK2g5R2yLPpYDB4Ah149taC6srQ==
X-Received: by 2002:a17:90a:8689:b0:1b9:b23f:6c29 with SMTP id
 p9-20020a17090a868900b001b9b23f6c29mr2778082pjn.25.1645514297129; 
 Mon, 21 Feb 2022 23:18:17 -0800 (PST)
Received: from [10.72.13.199] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id t137sm1186076pgc.49.2022.02.21.23.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 23:18:16 -0800 (PST)
Message-ID: <ca9fdd45-4650-883a-707b-0c96818ad8d1@redhat.com>
Date: Tue, 22 Feb 2022 15:18:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 09/31] vhost-vdpa: Take into account SVQ in
 vhost_vdpa_set_vring_call
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-10-eperezma@redhat.com>
 <cbfbd909-4ee8-8ad2-effd-4b9f60270581@redhat.com>
 <CAJaqyWda5sBw9VGBrz8g60OJ07Eeq45RRYu9vwgOPZFwten9rw@mail.gmail.com>
 <cbdf79c3-48ed-bac2-a9cc-e5c29729e4af@redhat.com>
 <CAJaqyWeisXmZ9+xw2Rj50K7aKx4khNZZjLZEz4MY97B9pQQm3w@mail.gmail.com>
 <bccdecdd-fa2d-48c0-43b8-7afe7b230b7b@redhat.com>
 <CAJaqyWc5uR70a=hTpVpomuahF9iZouLmRpXPnWidga5CFxJOpA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWc5uR70a=hTpVpomuahF9iZouLmRpXPnWidga5CFxJOpA@mail.gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/21 下午4:01, Eugenio Perez Martin 写道:
> On Mon, Feb 21, 2022 at 8:39 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/2/18 下午8:35, Eugenio Perez Martin 写道:
>>> On Tue, Feb 8, 2022 at 4:23 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> 在 2022/1/31 下午11:34, Eugenio Perez Martin 写道:
>>>>> On Sat, Jan 29, 2022 at 9:06 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>> ---
>>>>>>>      hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++--
>>>>>>>      1 file changed, 18 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>>>>> index 18de14f0fb..029f98feee 100644
>>>>>>> --- a/hw/virtio/vhost-vdpa.c
>>>>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>>>>> @@ -687,13 +687,29 @@ static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
>>>>>>>          }
>>>>>>>      }
>>>>>>>
>>>>>>> -static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>>>>>>> -                                       struct vhost_vring_file *file)
>>>>>>> +static int vhost_vdpa_set_vring_dev_call(struct vhost_dev *dev,
>>>>>>> +                                         struct vhost_vring_file *file)
>>>>>>>      {
>>>>>>>          trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
>>>>>>>          return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>>>>>>>      }
>>>>>>>
>>>>>>> +static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>>>>>>> +                                     struct vhost_vring_file *file)
>>>>>>> +{
>>>>>>> +    struct vhost_vdpa *v = dev->opaque;
>>>>>>> +
>>>>>>> +    if (v->shadow_vqs_enabled) {
>>>>>>> +        int vdpa_idx = vhost_vdpa_get_vq_index(dev, file->index);
>>>>>>> +        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
>>>>>>> +
>>>>>>> +        vhost_svq_set_guest_call_notifier(svq, file->fd);
>>>>>> Two questions here (had similar questions for vring kick):
>>>>>>
>>>>>> 1) Any reason that we setup the eventfd for vhost-vdpa in
>>>>>> vhost_vdpa_svq_setup() not here?
>>>>>>
>>>>> I'm not sure what you mean.
>>>>>
>>>>> The guest->SVQ call and kick fds are set here and at
>>>>> vhost_vdpa_set_vring_kick. The event notifier handler of the guest ->
>>>>> SVQ kick_fd is set at vhost_vdpa_set_vring_kick /
>>>>> vhost_svq_set_svq_kick_fd. The guest -> SVQ call fd has no event
>>>>> notifier handler since we don't poll it.
>>>>>
>>>>> On the other hand, the connection SVQ <-> device uses the same fds
>>>>> from the beginning to the end, and they will not change with, for
>>>>> example, call fd masking. That's why it's setup from
>>>>> vhost_vdpa_svq_setup. Delaying to vhost_vdpa_set_vring_call would make
>>>>> us add way more logic there.
>>>> More logic in general shadow vq code but less codes for vhost-vdpa
>>>> specific code I think.
>>>>
>>>> E.g for we can move the kick set logic from vhost_vdpa_svq_set_fds() to
>>>> here.
>>>>
>>> But they are different fds. vhost_vdpa_svq_set_fds sets the
>>> SVQ<->device. This function sets the SVQ->guest call file descriptor.
>>>
>>> To move the logic of vhost_vdpa_svq_set_fds here would imply either:
>>> a) Logic to know if we are receiving the first call fd or not.
>>
>> Any reason for this? I guess you meant multiqueue. If yes, it should not
>> be much difference since we have idx as the parameter.
>>
> With "first call fd" I meant "first time we receive the call fd", so
> we only set them once.
>
> I think this is going to be easier if I prepare a patch doing your way
> and we comment on it.


That would be helpful but if there's no issue with current code (see 
below), we can leave it as is and do optimization on top.


>
>>>    That
>>> code is not in the series at the moment, because setting at
>>> vhost_vdpa_dev_start tells the difference for free. Is just adding
>>> code, not moving.
>>> b) Logic to set again *the same* file descriptor to device, with logic
>>> to tell if we have missed calls. That logic is not implemented for
>>> device->SVQ call file descriptor, because we are assuming it never
>>> changes from vhost_vdpa_svq_set_fds. So this is again adding code.
>>>
>>> At this moment, we have:
>>> vhost_vdpa_svq_set_fds:
>>>     set SVQ<->device fds
>>>
>>> vhost_vdpa_set_vring_call:
>>>     set guest<-SVQ call
>>>
>>> vhost_vdpa_set_vring_kick:
>>>     set guest->SVQ kick.
>>>
>>> If I understood correctly, the alternative would be something like:
>>> vhost_vdpa_set_vring_call:
>>>     set guest<-SVQ call
>>>     if(!vq->call_set) {
>>>       - set SVQ<-device call.
>>>       - vq->call_set = true
>>>     }
>>>
>>> vhost_vdpa_set_vring_kick:
>>>     set guest<-SVQ call
>>>     if(!vq->dev_kick_set) {
>>>       - set guest->device kick.
>>>       - vq->dev_kick_set = true
>>>     }
>>>
>>> dev_reset / dev_stop:
>>> for vq in vqs:
>>>     vq->dev_kick_set = vq->dev_call_set = false
>>> ...
>>>
>>> Or have I misunderstood something?
>>
>> I wonder what happens if MSI-X is masking in guest. So if I understand
>> correctly, we don't disable the eventfd from device? If yes, this seems
>> suboptinal.
>>
> We cannot disable the device's call fd unless SVQ actively poll it. As
> I see it, if the guest masks the call fd, it could be because:
> a) it doesn't want to receive more calls because is processing buffers
> b) Is going to burn a cpu to poll it.
>
> The masking only affects SVQ->guest call. If we also mask device->SVQ,
> we're adding latency in the case a), and we're effectively disabling
> forwarding in case b).


Right, so we need leave a comment to explain this, then I'm totally fine 
with this approach.


>
> It only works if guest is effectively not interested in calls because
> is not going to retire used buffers, but in that case it doesn't hurt
> to simply maintain the device->call fd, the eventfds are going to be
> silent anyway.
>
> Thanks!


Yes.

Thanks


>
>> Thanks
>>
>>
>>> Thanks!
>>>
>>>> Thanks
>>>>
>>>>
>>>>>> 2) The call could be disabled by using -1 as the fd, I don't see any
>>>>>> code to deal with that.
>>>>>>
>>>>> Right, I didn't take that into account. vhost-kernel takes also -1 as
>>>>> kick_fd to unbind, so SVQ can be reworked to take that into account
>>>>> for sure.
>>>>>
>>>>> Thanks!
>>>>>
>>>>>> Thanks
>>>>>>
>>>>>>
>>>>>>> +        return 0;
>>>>>>> +    } else {
>>>>>>> +        return vhost_vdpa_set_vring_dev_call(dev, file);
>>>>>>> +    }
>>>>>>> +}
>>>>>>> +
>>>>>>>      /**
>>>>>>>       * Set shadow virtqueue descriptors to the device
>>>>>>>       *


