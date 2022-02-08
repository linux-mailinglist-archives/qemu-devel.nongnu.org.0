Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52EB4ACFC4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 04:27:45 +0100 (CET)
Received: from localhost ([::1]:41792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHHAO-0002rj-93
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 22:27:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHH6S-0008Tg-BU
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:23:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHH6O-00086B-1X
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:23:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644290606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydJczILdVavz3y35yyfKxSQ2SCCP72HFF5+MVLBFHVE=;
 b=XGa5cxP//WY8r1RFHI1LEo5jpiUa7dB/XhceD1ALoRTQBbTYLilA6LKRp/iAK8HMS8E+Fb
 0HtEYmIzqNKintk0r5jCuClGM94/X/C07Sf1I5FSVU+QdVew6tydB5jBE1vX6Ey5CyekTE
 XdZmeglktzGjzB29qwYOXJjD4j96OeQ=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-TpwKIT88OVOqkZbI75uzOA-1; Mon, 07 Feb 2022 22:23:25 -0500
X-MC-Unique: TpwKIT88OVOqkZbI75uzOA-1
Received: by mail-pf1-f200.google.com with SMTP id
 i8-20020a628708000000b004c8b9764ac9so8657772pfe.6
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 19:23:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ydJczILdVavz3y35yyfKxSQ2SCCP72HFF5+MVLBFHVE=;
 b=qBNcFaKHEkp7bFXoL3J6JWmsnXJat4e+9AdMBerV7V3LUbYp1bGBGaTmCG7NE8Alnm
 QNDJGP+2OQgpJNBlkNeLoTLbpOTnAyu0LW0JOE5JCNMvuMzaqboV2EzjzJFsnF8OsUq8
 ynF1K2P6MBM+bl8bis85xQ2QtuUEjH94I40iFkbzIjscAondhCcg121sSHpp/G+NNUvR
 jpsoGEvk7byf0Pi5r/DI9e4O1pJ7wntjihjyowdcns/yfK10+xd4yh4aAD0z9RX5sgpl
 Ho8L65OVv0L83+/erkjkNitMvE0rO8CzKEM+l3Aw4Ye78iKcxlogRBnHEdFJ9562gQT2
 9iVA==
X-Gm-Message-State: AOAM533WYIOjyj2tRESpGb54MUQBZ0uEhBhsY56x/opFdoFimvnBex6F
 O2UUcP4ZjZCjsMF2VDhKLB79VoQCDrg+nV9+hEHXUJgdncXOBXoFl/oDnJDVkI2OWF79rSjTzN2
 z8FMHixhtXXwn9DY=
X-Received: by 2002:a65:63d2:: with SMTP id n18mr1960755pgv.245.1644290604408; 
 Mon, 07 Feb 2022 19:23:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoGEqQinxLg0CYnNJ3JeX18vhIGryha7tSpEUCdT8hNPv8pOIZ40M8QwLioug68xQXM3G7PA==
X-Received: by 2002:a65:63d2:: with SMTP id n18mr1960731pgv.245.1644290604127; 
 Mon, 07 Feb 2022 19:23:24 -0800 (PST)
Received: from [10.72.13.233] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id k16sm9136136pgh.45.2022.02.07.19.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 19:23:23 -0800 (PST)
Message-ID: <cbdf79c3-48ed-bac2-a9cc-e5c29729e4af@redhat.com>
Date: Tue, 8 Feb 2022 11:23:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 09/31] vhost-vdpa: Take into account SVQ in
 vhost_vdpa_set_vring_call
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-10-eperezma@redhat.com>
 <cbfbd909-4ee8-8ad2-effd-4b9f60270581@redhat.com>
 <CAJaqyWda5sBw9VGBrz8g60OJ07Eeq45RRYu9vwgOPZFwten9rw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWda5sBw9VGBrz8g60OJ07Eeq45RRYu9vwgOPZFwten9rw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


在 2022/1/31 下午11:34, Eugenio Perez Martin 写道:
> On Sat, Jan 29, 2022 at 9:06 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++--
>>>    1 file changed, 18 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 18de14f0fb..029f98feee 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -687,13 +687,29 @@ static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
>>>        }
>>>    }
>>>
>>> -static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>>> -                                       struct vhost_vring_file *file)
>>> +static int vhost_vdpa_set_vring_dev_call(struct vhost_dev *dev,
>>> +                                         struct vhost_vring_file *file)
>>>    {
>>>        trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
>>>        return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>>>    }
>>>
>>> +static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>>> +                                     struct vhost_vring_file *file)
>>> +{
>>> +    struct vhost_vdpa *v = dev->opaque;
>>> +
>>> +    if (v->shadow_vqs_enabled) {
>>> +        int vdpa_idx = vhost_vdpa_get_vq_index(dev, file->index);
>>> +        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
>>> +
>>> +        vhost_svq_set_guest_call_notifier(svq, file->fd);
>>
>> Two questions here (had similar questions for vring kick):
>>
>> 1) Any reason that we setup the eventfd for vhost-vdpa in
>> vhost_vdpa_svq_setup() not here?
>>
> I'm not sure what you mean.
>
> The guest->SVQ call and kick fds are set here and at
> vhost_vdpa_set_vring_kick. The event notifier handler of the guest ->
> SVQ kick_fd is set at vhost_vdpa_set_vring_kick /
> vhost_svq_set_svq_kick_fd. The guest -> SVQ call fd has no event
> notifier handler since we don't poll it.
>
> On the other hand, the connection SVQ <-> device uses the same fds
> from the beginning to the end, and they will not change with, for
> example, call fd masking. That's why it's setup from
> vhost_vdpa_svq_setup. Delaying to vhost_vdpa_set_vring_call would make
> us add way more logic there.


More logic in general shadow vq code but less codes for vhost-vdpa 
specific code I think.

E.g for we can move the kick set logic from vhost_vdpa_svq_set_fds() to 
here.

Thanks


>
>> 2) The call could be disabled by using -1 as the fd, I don't see any
>> code to deal with that.
>>
> Right, I didn't take that into account. vhost-kernel takes also -1 as
> kick_fd to unbind, so SVQ can be reworked to take that into account
> for sure.
>
> Thanks!
>
>> Thanks
>>
>>
>>> +        return 0;
>>> +    } else {
>>> +        return vhost_vdpa_set_vring_dev_call(dev, file);
>>> +    }
>>> +}
>>> +
>>>    /**
>>>     * Set shadow virtqueue descriptors to the device
>>>     *


