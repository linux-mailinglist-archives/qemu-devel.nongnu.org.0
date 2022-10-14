Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB60B5FEB81
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 11:27:18 +0200 (CEST)
Received: from localhost ([::1]:42396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojGyL-0002eB-4S
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 05:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ojGur-0006xl-FS
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 05:23:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ojGuo-00060r-Ag
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 05:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665739417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8vOSrhlu/0S3r4PuhLP2XjHew88NtV6iUswlny+3cRE=;
 b=Rh3+MOnqV5ZddfrgZivOxPY4k+b3GN77aP0LNxC0Ye+IdSemufnNAvCQHKArjkUCDaswm0
 wWMsfyKuOQvUzpGryOCzvL+FRmnFUoe/pplWmGn8FiacThF7aGP9yWqKWLA8K+iQDJEP5n
 JkUraBeFg/j2w9libSA7C/L3vXf+EHw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-7lxbN6OvMMuk3VwU1LIkoQ-1; Fri, 14 Oct 2022 05:23:36 -0400
X-MC-Unique: 7lxbN6OvMMuk3VwU1LIkoQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v125-20020a1cac83000000b003bd44dc5242so4375668wme.7
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 02:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8vOSrhlu/0S3r4PuhLP2XjHew88NtV6iUswlny+3cRE=;
 b=XJvSIh7NUXE7LvxrEzx83XSveKElN1159iR9rRnGrtTqZkwLCYa24BRQXjhBKHEp+H
 nz4NM0Pchw/T3jRhuxo8iRyiKtU/Jev3E+ReUt8WDU2DfAMwoplHD3vsyu5xdVqHUm2V
 eCjQIFlekPRYYjP+OIqq5vi5B8Jxi+p2645yejdLuKBCG45mp9QbdbZyjr411uIt05DM
 iPq/KqGOYb73df80UVYOgpvqCVsmWma25N4eOXJ5Yqp+tBuiZKLDO2DvjVj1oHzsNo75
 TjPstwS4rTvry7rJgkfYh6CIez2PoEL17RKOT9vjDKGclfx8udddwt5ub5/kVNTjDpea
 RsIQ==
X-Gm-Message-State: ACrzQf1qG2dKWlYrys0d8H5IBtE980SRSWHVu1epffjZADIu6FAm/Uns
 ueXRLM3qhxI2U5n38musEeluIEv5M0rtqAIk6FG0O4hoigZbeHg08g5FohDJU0NozzotMqIpMzK
 Y/nZWnsA3hz7jTpg=
X-Received: by 2002:a5d:526d:0:b0:22e:4f4d:2546 with SMTP id
 l13-20020a5d526d000000b0022e4f4d2546mr2700675wrc.464.1665739414578; 
 Fri, 14 Oct 2022 02:23:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5koDWu6hAkljiCmgowA4V8KX3H/6L7mgR9ynjGeMZJBYw/H9gJIa2FFZlqj1Jfa5QDFroiVA==
X-Received: by 2002:a5d:526d:0:b0:22e:4f4d:2546 with SMTP id
 l13-20020a5d526d000000b0022e4f4d2546mr2700662wrc.464.1665739414314; 
 Fri, 14 Oct 2022 02:23:34 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d6508000000b00228dff8d975sm1470611wru.109.2022.10.14.02.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 02:23:33 -0700 (PDT)
Message-ID: <e06a3836-1968-1366-802d-a8adecb07def@redhat.com>
Date: Fri, 14 Oct 2022 11:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH RFC] virtio-net: fix bottom-half packet TX on asynchronous
 completion
Content-Language: en-US
From: Laurent Vivier <lvivier@redhat.com>
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Stefano Brivio <sbrivio@redhat.com>, alex.williamson@redhat.com
References: <20221013140057.63575-1-lvivier@redhat.com>
 <20221013104724-mutt-send-email-mst@kernel.org>
 <CACGkMEsEhudE-yM7cZ5e9rXP-+w8-YTeL3MV73mghVh1uoF+9g@mail.gmail.com>
 <0b5a4db0-14e4-09cf-d68c-a0aca8c780c7@redhat.com>
In-Reply-To: <0b5a4db0-14e4-09cf-d68c-a0aca8c780c7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.25, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/22 09:06, Laurent Vivier wrote:
> On 10/14/22 05:10, Jason Wang wrote:
>> On Thu, Oct 13, 2022 at 10:48 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>
>>> On Thu, Oct 13, 2022 at 04:00:57PM +0200, Laurent Vivier wrote:
>>>> When virtio-net is used with the socket netdev backend, the backend
>>>> can be busy and not able to collect new packets.
>>>>
>>>> In this case, net_socket_receive() returns 0 and registers a poll function
>>>> to detect when the socket is ready again.
>>>>
>>>> In virtio_net_tx_bh(), virtio_net_flush_tx() forwards the 0, the virtio
>>>> notifications are disabled and the function is not rescheduled, waiting
>>>> for the backend to be ready.
>>>>
>>>> When the socket netdev backend is again able to send packets, the poll
>>>> function re-starts to flush remaining packets. This is done by
>>>> calling virtio_net_tx_complete(). It re-enables notifications and calls
>>>> again virtio_net_flush_tx().
>>>>
>>>> But it seems if virtio_net_flush_tx() reaches the tx_burst value all
>>>> the queue is not flushed and no new notification is sent to reschedule
>>>> virtio_net_tx_bh(). Nothing re-start to flush the queue and remaining packets
>>>> are stuck in the queue.
>>>>
>>>> To fix that, detect in virtio_net_tx_complete() if virtio_net_flush_tx()
>>>> has been stopped by tx_burst and if yes reschedule the bottom half
>>>> function virtio_net_tx_bh() to flush the remaining packets.
>>>>
>>>> This is what is done in virtio_net_tx_bh() when the virtio_net_flush_tx()
>>>> is synchronous, and completely by-passed when the operation needs to be
>>>> asynchronous.
>>>>
>>>> RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC
>>>>
>>>> Do we need to reschedule the function in the other case managed
>>>> in virtio_net_tx_bh() and by-passed when the completion is asynchronous?
>>>
>>>
>>> I am guessing no.
>>>
>>>>      /* If less than a full burst, re-enable notification and flush
>>>>       * anything that may have come in while we weren't looking.  If
>>>>       * we find something, assume the guest is still active and reschedule */
>>>>      virtio_queue_set_notification(q->tx_vq, 1);
>>>>      ret = virtio_net_flush_tx(q);
>>>>      if (ret == -EINVAL) {
>>>>          return;
>>>>      } else if (ret > 0) {
>>>>          virtio_queue_set_notification(q->tx_vq, 0);
>>>>          qemu_bh_schedule(q->tx_bh);
>>>>          q->tx_waiting = 1;
>>>>      }
>>>>
>>>> RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC
>>>>
>>>> Fixes: a697a334b3c4 ("virtio-net: Introduce a new bottom half packet TX")
>>>> Cc: alex.williamson@redhat.com
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>
>>> Looks ok superficially
>>>
>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>>
>>> Jason, your area.
>>>
>>>> ---
>>>>   hw/net/virtio-net.c | 13 ++++++++++++-
>>>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>>> index e9f696b4cfeb..1fbf2f3e19a7 100644
>>>> --- a/hw/net/virtio-net.c
>>>> +++ b/hw/net/virtio-net.c
>>>> @@ -2526,6 +2526,7 @@ static void virtio_net_tx_complete(NetClientState *nc, ssize_t len)
>>>>       VirtIONet *n = qemu_get_nic_opaque(nc);
>>>>       VirtIONetQueue *q = virtio_net_get_subqueue(nc);
>>>>       VirtIODevice *vdev = VIRTIO_DEVICE(n);
>>>> +    int ret;
>>>>
>>>>       virtqueue_push(q->tx_vq, q->async_tx.elem, 0);
>>>>       virtio_notify(vdev, q->tx_vq);
>>>> @@ -2534,7 +2535,17 @@ static void virtio_net_tx_complete(NetClientState *nc, ssize_t 
>>>> len)
>>>>       q->async_tx.elem = NULL;
>>>>
>>>>       virtio_queue_set_notification(q->tx_vq, 1);
>>>> -    virtio_net_flush_tx(q);
>>>> +    ret = virtio_net_flush_tx(q);
>>>> +    if (q->tx_bh && ret >= n->tx_burst) {
>>>> +        /*
>>>> +         * the flush has been stopped by tx_burst
>>>> +         * we will not receive notification for the
>>>> +         * remainining part, so re-schedule
>>>> +         */
>>>> +        virtio_queue_set_notification(q->tx_vq, 0);
>>>> +        qemu_bh_schedule(q->tx_bh);
>>>> +        q->tx_waiting = 1;
>>>> +    }
>>
>> Do we need to fix the case of tx timer or it doesn't suffer from this issue?
>>
> 
> I think tx_timer suffers the same issue.
> 
> I'm going to have a look to the tx timer fix.

It seems worst with tx timer as we have the tx_burst problem even in the synchronous case 
as the timer is not rearmed.

Thanks,
Laurent


