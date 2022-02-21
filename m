Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753D34BD764
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 08:44:24 +0100 (CET)
Received: from localhost ([::1]:42474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM3Mt-0008Kb-7q
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 02:44:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nM3IY-0007OI-41
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 02:39:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nM3IU-0004XE-RP
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 02:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645429190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=euif6hZnu8n4lnHw4rXa9aanECut0B89Uu6Ed07JMYU=;
 b=cJsfcGqRJjsbgV90HN52Kd0zp52Gp7YnGdIjjNaxoDlpj3feZxMqWI/uvH30E3MEawJ2Rm
 cvVEtVoJnZ2kiooXMtYHoJWCzxVHxG3Rhjv7KBKw5X3tSC+m03KjZvmvilCA0eCTVifOPg
 z79yleROkfOw7uaRISrhzgaU8JADr6g=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557--hFD4lPgNpubB8tUKmP-QQ-1; Mon, 21 Feb 2022 02:39:48 -0500
X-MC-Unique: -hFD4lPgNpubB8tUKmP-QQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 k6-20020a63d846000000b00365088c8f6aso9021809pgj.6
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 23:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=euif6hZnu8n4lnHw4rXa9aanECut0B89Uu6Ed07JMYU=;
 b=0sxWAqwvDKCUwGuO5qQ+FOF3+coPIVowth8J8m9qkDcS9zTzA0BzfxIM6Q5DpdH5UY
 WhZyXOQVtxYYRa5sLZw5ICOG77rfB6MUyC7M7C6NKEatDEmJjJ3wOalJzJHwrCrkN26N
 NvJfjO9Xgo5xEKq7D8fUBPRY6qNmSLM1rOjx5K2cNVPceisDmlhas7Cls8XF+TzI2/KL
 8aoBtPlRZ0l51hcBKHem9vgwxIeNS3XB1GkNJZceKabWhuH+fXui49ij7vgB+Q/0VxXK
 aDR/u1aKPeHEBgLx1OIACf/xr+XPiXQa4IoXNgtyntmoyfIpWOGRawqq0svf78/WyZnj
 hoDQ==
X-Gm-Message-State: AOAM531L3bGzjWyHCSVxlQX6YBlSwrJgwF6xiAD/hPW0/jGH1MkwgiU7
 iqfnamyZ+U5GOUlFoMZaXDbyT07g7hJ0+N5aG57GmmNTOZZpWgww8ErjFH6ZJv2hXcjQR48kY6Z
 p0b/2BfTDi9M1oSg=
X-Received: by 2002:a17:902:9b8b:b0:14c:cbb8:cfb3 with SMTP id
 y11-20020a1709029b8b00b0014ccbb8cfb3mr17434596plp.64.1645429187677; 
 Sun, 20 Feb 2022 23:39:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0GdZ8NX2+bT1lQEqm5524QB8sCv8aZjBVuXw3mT46uudvhnkSx19VhBPENncMF+R0pBBNAQ==
X-Received: by 2002:a17:902:9b8b:b0:14c:cbb8:cfb3 with SMTP id
 y11-20020a1709029b8b00b0014ccbb8cfb3mr17434563plp.64.1645429187382; 
 Sun, 20 Feb 2022 23:39:47 -0800 (PST)
Received: from [10.72.12.96] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id n37sm18265204pgl.48.2022.02.20.23.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 23:39:46 -0800 (PST)
Message-ID: <bccdecdd-fa2d-48c0-43b8-7afe7b230b7b@redhat.com>
Date: Mon, 21 Feb 2022 15:39:37 +0800
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
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWeisXmZ9+xw2Rj50K7aKx4khNZZjLZEz4MY97B9pQQm3w@mail.gmail.com>
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


在 2022/2/18 下午8:35, Eugenio Perez Martin 写道:
> On Tue, Feb 8, 2022 at 4:23 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/1/31 下午11:34, Eugenio Perez Martin 写道:
>>> On Sat, Jan 29, 2022 at 9:06 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> ---
>>>>>     hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++--
>>>>>     1 file changed, 18 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>>> index 18de14f0fb..029f98feee 100644
>>>>> --- a/hw/virtio/vhost-vdpa.c
>>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>>> @@ -687,13 +687,29 @@ static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
>>>>>         }
>>>>>     }
>>>>>
>>>>> -static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>>>>> -                                       struct vhost_vring_file *file)
>>>>> +static int vhost_vdpa_set_vring_dev_call(struct vhost_dev *dev,
>>>>> +                                         struct vhost_vring_file *file)
>>>>>     {
>>>>>         trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
>>>>>         return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>>>>>     }
>>>>>
>>>>> +static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>>>>> +                                     struct vhost_vring_file *file)
>>>>> +{
>>>>> +    struct vhost_vdpa *v = dev->opaque;
>>>>> +
>>>>> +    if (v->shadow_vqs_enabled) {
>>>>> +        int vdpa_idx = vhost_vdpa_get_vq_index(dev, file->index);
>>>>> +        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
>>>>> +
>>>>> +        vhost_svq_set_guest_call_notifier(svq, file->fd);
>>>> Two questions here (had similar questions for vring kick):
>>>>
>>>> 1) Any reason that we setup the eventfd for vhost-vdpa in
>>>> vhost_vdpa_svq_setup() not here?
>>>>
>>> I'm not sure what you mean.
>>>
>>> The guest->SVQ call and kick fds are set here and at
>>> vhost_vdpa_set_vring_kick. The event notifier handler of the guest ->
>>> SVQ kick_fd is set at vhost_vdpa_set_vring_kick /
>>> vhost_svq_set_svq_kick_fd. The guest -> SVQ call fd has no event
>>> notifier handler since we don't poll it.
>>>
>>> On the other hand, the connection SVQ <-> device uses the same fds
>>> from the beginning to the end, and they will not change with, for
>>> example, call fd masking. That's why it's setup from
>>> vhost_vdpa_svq_setup. Delaying to vhost_vdpa_set_vring_call would make
>>> us add way more logic there.
>>
>> More logic in general shadow vq code but less codes for vhost-vdpa
>> specific code I think.
>>
>> E.g for we can move the kick set logic from vhost_vdpa_svq_set_fds() to
>> here.
>>
> But they are different fds. vhost_vdpa_svq_set_fds sets the
> SVQ<->device. This function sets the SVQ->guest call file descriptor.
>
> To move the logic of vhost_vdpa_svq_set_fds here would imply either:
> a) Logic to know if we are receiving the first call fd or not.


Any reason for this? I guess you meant multiqueue. If yes, it should not 
be much difference since we have idx as the parameter.


>   That
> code is not in the series at the moment, because setting at
> vhost_vdpa_dev_start tells the difference for free. Is just adding
> code, not moving.
> b) Logic to set again *the same* file descriptor to device, with logic
> to tell if we have missed calls. That logic is not implemented for
> device->SVQ call file descriptor, because we are assuming it never
> changes from vhost_vdpa_svq_set_fds. So this is again adding code.
>
> At this moment, we have:
> vhost_vdpa_svq_set_fds:
>    set SVQ<->device fds
>
> vhost_vdpa_set_vring_call:
>    set guest<-SVQ call
>
> vhost_vdpa_set_vring_kick:
>    set guest->SVQ kick.
>
> If I understood correctly, the alternative would be something like:
> vhost_vdpa_set_vring_call:
>    set guest<-SVQ call
>    if(!vq->call_set) {
>      - set SVQ<-device call.
>      - vq->call_set = true
>    }
>
> vhost_vdpa_set_vring_kick:
>    set guest<-SVQ call
>    if(!vq->dev_kick_set) {
>      - set guest->device kick.
>      - vq->dev_kick_set = true
>    }
>
> dev_reset / dev_stop:
> for vq in vqs:
>    vq->dev_kick_set = vq->dev_call_set = false
> ...
>
> Or have I misunderstood something?


I wonder what happens if MSI-X is masking in guest. So if I understand 
correctly, we don't disable the eventfd from device? If yes, this seems 
suboptinal.

Thanks


>
> Thanks!
>
>> Thanks
>>
>>
>>>> 2) The call could be disabled by using -1 as the fd, I don't see any
>>>> code to deal with that.
>>>>
>>> Right, I didn't take that into account. vhost-kernel takes also -1 as
>>> kick_fd to unbind, so SVQ can be reworked to take that into account
>>> for sure.
>>>
>>> Thanks!
>>>
>>>> Thanks
>>>>
>>>>
>>>>> +        return 0;
>>>>> +    } else {
>>>>> +        return vhost_vdpa_set_vring_dev_call(dev, file);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>>     /**
>>>>>      * Set shadow virtqueue descriptors to the device
>>>>>      *


