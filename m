Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A8D66B7B6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 08:04:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHJW4-0007OI-5x; Mon, 16 Jan 2023 02:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHJVz-0007MS-2I
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 02:02:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHJVw-0001md-UH
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 02:02:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673852559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5a2FTvNVOkn4F/z3o9bDj4uY+osdyBHXt3Knc1J2xo=;
 b=GsPwlL6blhIFh4yVrqHmBKW4csAn4Hb4PN1WMe20nyzRSTznFi+XCQ8UoNMx+5k3nS6778
 Vf8LtBx6h69hRroRCxaMCOCgZLlTowsnjZNT+V/aipY2RpZZyyv1tQO3S1dq3OEeR3a5NY
 zLki+9beqaLmtFcvi4TrVlbWFWAmfuQ=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-KPYzFpUMMXWtfXVcswgDYw-1; Mon, 16 Jan 2023 02:02:37 -0500
X-MC-Unique: KPYzFpUMMXWtfXVcswgDYw-1
Received: by mail-pl1-f200.google.com with SMTP id
 s14-20020a17090302ce00b00192d831a155so19511406plk.11
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 23:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t5a2FTvNVOkn4F/z3o9bDj4uY+osdyBHXt3Knc1J2xo=;
 b=KCKEsEnlGRgKKnv4nEY65Yw4llxkiukSUW9AT87g9TRVKwSydc69aNCrTO74ZzfHwt
 L0pS1XRkzk1BCnoSR9iNf9ftlNRzN+aiWrHNydc3keAEjiNtVhhjtOd0EsivsUlg54Hy
 Z0DxIfDL9PTMh6+51st2rL5mPJVS5V9Bb4QoDehBrf8WMj/n/slvqERqDLwaS2/5Kau7
 2qGJX4y+JlGa3eJudc3SZYSTu3YGOxQ1pcVHt6cpFkZIpd2N0sGmL2+moDUKCnZJI8yK
 duKNO6BwUFQa5U8Zu5NFLu8ORZRy9a5olrbWBXBnoEc7cpI3AZwzHjb1BHAqrb9SAjjz
 dGmQ==
X-Gm-Message-State: AFqh2krSqXI0GSx5e38g44roG2IYbLg+Qoq6CpbxRZqa2+qqZ8IlwNBM
 ygk5CiaWa3PBnKAiAQfGnBmH2Imq12iFIUnq06nHWMC6kt3oM+7OzczL9QfZJ7SuGEXq4CZPheT
 FgRzUmB3TAMdQpO4=
X-Received: by 2002:a17:902:9884:b0:194:7a99:d5fd with SMTP id
 s4-20020a170902988400b001947a99d5fdmr8646448plp.10.1673852556366; 
 Sun, 15 Jan 2023 23:02:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvkjmGJzC1OtoQzhPtd6rSpT4K6DWi9KQy0gCqiDwfeELYkyFfg4+NHjTGoSQt/189LlfSJOA==
X-Received: by 2002:a17:902:9884:b0:194:7a99:d5fd with SMTP id
 s4-20020a170902988400b001947a99d5fdmr8646420plp.10.1673852556079; 
 Sun, 15 Jan 2023 23:02:36 -0800 (PST)
Received: from [10.72.13.212] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170902b18700b0019335832ee9sm14179278plr.179.2023.01.15.23.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 23:02:35 -0800 (PST)
Message-ID: <bd62f070-4c0c-0cc6-dabf-ceb251ffc444@redhat.com>
Date: Mon, 16 Jan 2023 15:02:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v2 12/13] vdpa: preemptive kick at enable
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, qemu-devel@nongnu.org,
 si-wei.liu@oracle.com, Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-13-eperezma@redhat.com>
 <CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vrM4m-uGMiPA@mail.gmail.com>
 <7438853f-8d5e-33fb-1e53-b4a0036f0b7d@intel.com>
 <CACGkMEtwcjExouCbnMrQ3TcAkXJH4mv63ud-ROEUu6mH+53C6Q@mail.gmail.com>
 <CAJaqyWfijv2doQ8OAiiWdYvrWtmLPwJcnFtO+aUuoTa0jSL73A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWfijv2doQ8OAiiWdYvrWtmLPwJcnFtO+aUuoTa0jSL73A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2023/1/13 17:06, Eugenio Perez Martin 写道:
> On Fri, Jan 13, 2023 at 4:39 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Fri, Jan 13, 2023 at 11:25 AM Zhu, Lingshan <lingshan.zhu@intel.com> wrote:
>>>
>>>
>>> On 1/13/2023 10:31 AM, Jason Wang wrote:
>>>> On Fri, Jan 13, 2023 at 1:27 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>>>> Spuriously kick the destination device's queue so it knows in case there
>>>>> are new descriptors.
>>>>>
>>>>> RFC: This is somehow a gray area. The guest may have placed descriptors
>>>>> in a virtqueue but not kicked it, so it might be surprised if the device
>>>>> starts processing it.
>>>> So I think this is kind of the work of the vDPA parent. For the parent
>>>> that needs this trick, we should do it in the parent driver.
>>> Agree, it looks easier implementing this in parent driver,
>>> I can implement it in ifcvf set_vq_ready right now
>> Great, but please check whether or not it is really needed.
>>
>> Some device implementation could check the available descriptions
>> after DRIVER_OK without waiting for a kick.
>>
> So IIUC we can entirely drop this from the series (and I hope we can).
> But then, what with the devices that does *not* check for them?


It needs mediation in the vDPA parent driver.


>
> If we drop it it seems to me we must mandate devices to check for
> descriptors at queue_enable. The queue could stall if not, isn't it?


I'm not sure, did you see real issue with this? (Note that we don't do 
this for vhost-user-(vDPA))

Btw, the code can result of kick before DRIVER_OK, which seems racy.

Thanks


>
> Thanks!
>
>> Thanks
>>
>>> Thanks
>>> Zhu Lingshan
>>>> Thanks
>>>>
>>>>> However, that information is not in the migration stream and it should
>>>>> be an edge case anyhow, being resilient to parallel notifications from
>>>>> the guest.
>>>>>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> ---
>>>>>    hw/virtio/vhost-vdpa.c | 5 +++++
>>>>>    1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>>> index 40b7e8706a..dff94355dd 100644
>>>>> --- a/hw/virtio/vhost-vdpa.c
>>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>>> @@ -732,11 +732,16 @@ static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, int ready)
>>>>>        }
>>>>>        trace_vhost_vdpa_set_vring_ready(dev);
>>>>>        for (i = 0; i < dev->nvqs; ++i) {
>>>>> +        VirtQueue *vq;
>>>>>            struct vhost_vring_state state = {
>>>>>                .index = dev->vq_index + i,
>>>>>                .num = 1,
>>>>>            };
>>>>>            vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>>>> +
>>>>> +        /* Preemptive kick */
>>>>> +        vq = virtio_get_queue(dev->vdev, dev->vq_index + i);
>>>>> +        event_notifier_set(virtio_queue_get_host_notifier(vq));
>>>>>        }
>>>>>        return 0;
>>>>>    }
>>>>> --
>>>>> 2.31.1
>>>>>


