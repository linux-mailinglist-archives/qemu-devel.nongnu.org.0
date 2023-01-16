Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F259D66B78A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 07:38:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHJ7G-0000qJ-Pm; Mon, 16 Jan 2023 01:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHJ7E-0000nk-N3
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 01:37:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHJ7C-0005n2-J0
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 01:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673851025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2YLxGIdZcB8xjFYk56iQ0mPykRwr3/OIMbKDqGGh/wc=;
 b=OFg6czc2KgKvRRX8p5TfrYqjPw8XNwWJxNsC/SFTuT8+636XuDagfUyJ8/WuJlQjAbc3Vg
 iXC41ttmA1pmK/XG4bEhSAjIck3/sq9OZoYgXnvEd9Bs+u+TxVww20wUjaXQrvKvExmVCq
 C5kTKrVvY0iRqyxvV5lqHe2uZSGfehw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-q4TsEP0FNLukb4q63FCnrg-1; Mon, 16 Jan 2023 01:37:02 -0500
X-MC-Unique: q4TsEP0FNLukb4q63FCnrg-1
Received: by mail-pj1-f72.google.com with SMTP id
 i9-20020a17090a64c900b002297ffd390fso448872pjm.0
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 22:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2YLxGIdZcB8xjFYk56iQ0mPykRwr3/OIMbKDqGGh/wc=;
 b=58ao6wdjyQmSHiOwJuRh4iG/F0tORwDouCsj6sWUHkft1emfLJInGo61tFSqCQV0mr
 oT2J7waHkuxc9/O/dnxamW72M4My73xiqyPe9Yaj2WVUGaQprFlNnL7gvrRpHYtuC9Ib
 dsJ3F9SxzzrMenT7Ci5n2DKzRgSDCugruSX3avpvpxymzuLnRqnAznDQJZHnsJ0+GMqt
 HbUWcCnMKIuaJMQ0SusaaIOoumrMVmHAGtvDLhGbpsWdGpMnee5+NOetg/c7YdKG+i42
 vS6n/R3r72pdB8ouZ6wI7fAeiQUJKbnmvEx2VPz+7SiNStvqdZ5dogFJfV6AV3bpXa3b
 IMeQ==
X-Gm-Message-State: AFqh2kr0FQPz5Nw6DJVtFGjMNogEtw7FaSPvgQij4dDFeGlSbsjWpvwr
 ifu+pNwn+ycwujW4Y7rEDimbxR4oox1cUmHT0d1n4TypF+8wEOc8Mnt/JB+OC2tKy96dgOs8IhO
 RvWnmL4jpDpJYkGI=
X-Received: by 2002:a17:90a:730a:b0:225:a132:f193 with SMTP id
 m10-20020a17090a730a00b00225a132f193mr90107016pjk.6.1673851021648; 
 Sun, 15 Jan 2023 22:37:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtknY0Pv2BaJsRpJvljmvoO+jlGHhXhHkcMpHjhvWofMFIjAxSbwn8xVd8qF/75ghgowQnd1w==
X-Received: by 2002:a17:90a:730a:b0:225:a132:f193 with SMTP id
 m10-20020a17090a730a00b00225a132f193mr90106983pjk.6.1673851021284; 
 Sun, 15 Jan 2023 22:37:01 -0800 (PST)
Received: from [10.72.13.212] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a17090a2bc200b002294da6c092sm2878156pje.27.2023.01.15.22.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 22:37:00 -0800 (PST)
Message-ID: <0aae4d77-2c03-7ba2-8496-024b5a683449@redhat.com>
Date: Mon, 16 Jan 2023 14:36:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v2 06/13] vhost: delay set_vring_ready after DRIVER_OK
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-7-eperezma@redhat.com>
 <CACGkMEvvjvhFrd5DJOMM0d7OWm0=9t6-YPzsZLZ8ZeZ4RU6PQw@mail.gmail.com>
 <CAJaqyWdePpv_htcrQ1TuEcz99x9Ri7ysFJz3+L7PuaLaPzNZjw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWdePpv_htcrQ1TuEcz99x9Ri7ysFJz3+L7PuaLaPzNZjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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


在 2023/1/13 16:19, Eugenio Perez Martin 写道:
> On Fri, Jan 13, 2023 at 5:36 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Fri, Jan 13, 2023 at 1:25 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>> To restore the device at the destination of a live migration we send the
>>> commands through control virtqueue. For a device to read CVQ it must
>>> have received the DRIVER_OK status bit.
>> This probably requires the support from the parent driver and requires
>> some changes or fixes in the parent driver.
>>
>> Some drivers did:
>>
>> parent_set_status():
>> if (DRIVER_OK)
>>      if (queue_enable)
>>          write queue_enable to the device
>>
>> Examples are IFCVF or even vp_vdpa at least. MLX5 seems to be fine.
>>
> I don't get your point here. No device should start reading CVQ (or
> any other VQ) without having received DRIVER_OK.


If I understand the code correctly:

For CVQ, we do SET_VRING_ENABLE before DRIVER_OK, that's fine.

For datapath_vq, we do SET_VRING_ENABLE after DRIVER_OK, this requires 
parent driver support (explained above)


>
> Some parent drivers do not support sending the queue enable command
> after DRIVER_OK, usually because they clean part of the state like the
> set by set_vring_base. Even vdpa_net_sim needs fixes here.


Yes, so the question is:

Do we need another backend feature for this? (otherwise thing may break 
silently)


>
> But my understanding is that it should be supported so I consider it a
> bug.


Probably, we need fine some proof in the spec, e.g in 3.1.1:

"""

7.Perform device-specific setup, including discovery of virtqueues for 
the device, optional per-bus setup, reading and possibly writing the 
device’s virtio configuration space, and population of virtqueues.
8.Set the DRIVER_OK status bit. At this point the device is “live”.

"""

So if my understanding is correct, "discovery of virtqueues for the 
device" implies queue_enable here which is expected to be done before 
DRIVER_OK. But it doesn't say anything regrading to the behaviour of 
setting queue ready after DRIVER_OK.

I'm not sure it's a real bug or not, may Michael and comment on this.


>   Especially after queue_reset patches. Is that what you mean?


We haven't supported queue_reset yet in Qemu. But it allows to write 1 
to queue_enable after DRIVER_OK for sure.


>
>>> However this opens a window where the device could start receiving
>>> packets in rx queue 0 before it receives the RSS configuration. To avoid
>>> that, we will not send vring_enable until all configuration is used by
>>> the device.
>>>
>>> As a first step, run vhost_set_vring_ready for all vhost_net backend after
>>> all of them are started (with DRIVER_OK). This code should not affect
>>> vdpa.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>   hw/net/vhost_net.c | 17 ++++++++++++-----
>>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>>> index c4eecc6f36..3900599465 100644
>>> --- a/hw/net/vhost_net.c
>>> +++ b/hw/net/vhost_net.c
>>> @@ -399,6 +399,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>>           } else {
>>>               peer = qemu_get_peer(ncs, n->max_queue_pairs);
>>>           }
>>> +        r = vhost_net_start_one(get_vhost_net(peer), dev);
>>> +        if (r < 0) {
>>> +            goto err_start;
>>> +        }
>>> +    }
>>> +
>>> +    for (int j = 0; j < nvhosts; j++) {
>>> +        if (j < data_queue_pairs) {
>>> +            peer = qemu_get_peer(ncs, j);
>>> +        } else {
>>> +            peer = qemu_get_peer(ncs, n->max_queue_pairs);
>>> +        }
>> I fail to understand why we need to change the vhost_net layer? This
>> is vhost-vDPA specific, so I wonder if we can limit the changes to e.g
>> vhost_vdpa_dev_start()?
>>
> The vhost-net layer explicitly calls vhost_set_vring_enable before
> vhost_dev_start, and this is exactly the behavior we want to avoid.
> Even if we make changes to vhost_dev, this change is still needed.


Note that the only user of vhost_set_vring_enable() is vhost-user where 
the semantic is different:

It uses that to changes the number of active queues:

static int peer_attach(VirtIONet *n, int index)

         if (nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
=>      vhost_set_vring_enable(nc->peer, 1);
     }

This is not the semantic of vhost-vDPA that tries to be complaint with 
virtio-spec. So I'm not sure how it can help here.


>
> And we want to explicitly enable CVQ first, which "only" vhost_net
> knows which is.


This should be known by net/vhost-vdpa.c.


> To perform that in vhost_vdpa_dev_start would require
> quirks, involving one or more of:
> * Ignore vq enable calls if the device is not the CVQ one. How to
> signal what is the CVQ? Can we trust it will be the last one for all
> kind of devices?
> * Enable queues that do not belong to the last vhost_dev from the enable call.
> * Enable the rest of the queues from the last enable in reverse order.
> * Intercalate the "net load" callback between enabling the last
> vhost_vdpa device and enabling the rest of devices.
> * Add an "enable priority" order?


Haven't had time in thinking through, but it would be better if we can 
limit the changes in vhost-vdpa layer. E.g currently the 
VHOST_VDPA_SET_VRING_ENABLE is done at vhost_dev_start().

Thanks


>
> Thanks!
>
>> Thanks
>>
>>>           if (peer->vring_enable) {
>>>               /* restore vring enable state */
>>> @@ -408,11 +420,6 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>>                   goto err_start;
>>>               }
>>>           }
>>> -
>>> -        r = vhost_net_start_one(get_vhost_net(peer), dev);
>>> -        if (r < 0) {
>>> -            goto err_start;
>>> -        }
>>>       }
>>>
>>>       return 0;
>>> --
>>> 2.31.1
>>>


