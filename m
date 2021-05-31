Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A58D395589
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 08:41:19 +0200 (CEST)
Received: from localhost ([::1]:55584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnbby-0002O7-3K
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 02:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lnbaQ-0001il-Cf
 for qemu-devel@nongnu.org; Mon, 31 May 2021 02:39:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lnbaN-00059L-9Z
 for qemu-devel@nongnu.org; Mon, 31 May 2021 02:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622443178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ovotK7bzt2MevNmP+fxhgdZwfbGAAqhB0mxJSARd3QM=;
 b=XFVcdlHxla013XlB/xJhiZ32b+doVTrCtm6J7hvFpJgTCG0v3MxgAchx++dk7pcdZt6Pvc
 GR70pqLpaFK722Pj8ymCBR4GtnVKh81oYlhj8pNvEi0uyU5Pexe5JTBMwl42Dr2CWbW4uX
 rzKJ1aTeZYb0iQf4WKAwjIqy5TkFkyo=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-exp2R3t9OO-kvQvu86z1cA-1; Mon, 31 May 2021 02:39:36 -0400
X-MC-Unique: exp2R3t9OO-kvQvu86z1cA-1
Received: by mail-pg1-f199.google.com with SMTP id
 s14-20020a63450e0000b029021f631b8861so4014417pga.20
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 23:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ovotK7bzt2MevNmP+fxhgdZwfbGAAqhB0mxJSARd3QM=;
 b=QY69lm2aScXGlI/rbgpK92SgHv6KiKucThZP3Wj2jjjHSgqLGAskFPWTMm/m2PDxnl
 2QBxzYXUsNLaqywQ//+W2+FfO/wUV6VYQHRAYnVq8bZ98Daz2x0rOhv1oEYOTz1you+5
 +lH6gC3NcKy4OFOLjkygZLD7vihl8m6gcBS3wUbjWXc3IMqbm5E7+ZhF7NF1XQmcCH5x
 /xROV4mfj1S0f+Iq8n5ZMLz4ftC06gk2BYrnuNk8bWUtvrdP25l2mV73nTSWo1oxt00V
 iIqodD+WEByX0S65LJx+fPK5GUjpVEFMwVJ58yNL3KB4A9OEsLUamZSqKCiOXvbmMf+o
 0TXQ==
X-Gm-Message-State: AOAM53116biWhifeV8Su76+fCRJlqfLCsghKM9W18OasplxAJMCcR5Ul
 o16Waa4U+j/eEtH/+160Vr83A27pTyOMqRtxy7rmx4a9iUksPgDqa7+wAZuvuCL8J2rH//+8w/3
 t2kLJJUwba/t3uTk=
X-Received: by 2002:a17:902:ed41:b029:102:d012:e432 with SMTP id
 y1-20020a170902ed41b0290102d012e432mr7703510plb.61.1622443175378; 
 Sun, 30 May 2021 23:39:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxryBJC5saLwFDG7M0nyuZ/enuURlKTprDDjLUQzJQvGaq5OwnW0CBFxYg367P+D9CAoya7WQ==
X-Received: by 2002:a17:902:ed41:b029:102:d012:e432 with SMTP id
 y1-20020a170902ed41b0290102d012e432mr7703496plb.61.1622443175107; 
 Sun, 30 May 2021 23:39:35 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w14sm4636232pjf.12.2021.05.30.23.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 May 2021 23:39:34 -0700 (PDT)
Subject: Re: [PATCH] replay: improve determinism of virtio-net
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <162125666020.1252655.9997723318921206001.stgit@pasha-ThinkPad-X280>
 <a0210fac-af32-8f1e-ae5f-237d773c32bf@redhat.com>
 <91370f34-5a37-1cb1-fa7e-c95e3b7521c4@ispras.ru>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <63e36678-452e-7436-10b3-55f9994c069b@redhat.com>
Date: Mon, 31 May 2021 14:39:30 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <91370f34-5a37-1cb1-fa7e-c95e3b7521c4@ispras.ru>
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
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.618, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/31 下午2:35, Pavel Dovgalyuk 写道:
> On 31.05.2021 07:55, Jason Wang wrote:
>>
>> 在 2021/5/17 下午9:04, Pavel Dovgalyuk 写道:
>>> virtio-net device uses bottom halves for callbacks.
>>> These callbacks should be deterministic, because they affect VM state.
>>> This patch replaces BH invocations with corresponding replay functions,
>>> making them deterministic in record/replay mode.
>>> This patch also disables guest announce timers for record/replay,
>>> because they break correct loadvm in deterministic mode.
>>
>>
>> Virtio-net can be configured to work in tx timer mode. Do we need to 
>> care about that?
>
> What does it mean? This patch fixes interaction with TX timer. Is it 
> related to that mode?


I meant is the timer used by virtio_net_handle_tx_timer() safe consider 
you disable announce timer.

Thanks


>
>>
>>
>>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>>> ---
>>>   hw/net/virtio-net.c |   13 +++++++++----
>>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>> index 6b7e8dd04e..e876363236 100644
>>> --- a/hw/net/virtio-net.c
>>> +++ b/hw/net/virtio-net.c
>>> @@ -44,6 +44,7 @@
>>>   #include "hw/pci/pci.h"
>>>   #include "net_rx_pkt.h"
>>>   #include "hw/virtio/vhost.h"
>>> +#include "sysemu/replay.h"
>>>   #define VIRTIO_NET_VM_VERSION    11
>>> @@ -394,7 +395,7 @@ static void virtio_net_set_status(struct 
>>> VirtIODevice *vdev, uint8_t status)
>>>                   timer_mod(q->tx_timer,
>>> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
>>>               } else {
>>> -                qemu_bh_schedule(q->tx_bh);
>>> +                replay_bh_schedule_event(q->tx_bh);
>>>               }
>>>           } else {
>>>               if (q->tx_timer) {
>>> @@ -2546,7 +2547,7 @@ static void 
>>> virtio_net_handle_tx_bh(VirtIODevice *vdev, VirtQueue *vq)
>>>           return;
>>>       }
>>>       virtio_queue_set_notification(vq, 0);
>>> -    qemu_bh_schedule(q->tx_bh);
>>> +    replay_bh_schedule_event(q->tx_bh);
>>
>>
>> Not familiar with replay but any chance to change qemu_bh_schedule() 
>> instead?
>
> It would be better, but sometimes qemu_bh_schedule is used for the 
> callbacks that are not related to the guest state change.
>
>>
>> Thanks
>>
>>
>>>   }
>>>   static void virtio_net_tx_timer(void *opaque)
>>> @@ -2602,7 +2603,7 @@ static void virtio_net_tx_bh(void *opaque)
>>>       /* If we flush a full burst of packets, assume there are
>>>        * more coming and immediately reschedule */
>>>       if (ret >= n->tx_burst) {
>>> -        qemu_bh_schedule(q->tx_bh);
>>> +        replay_bh_schedule_event(q->tx_bh);
>>>           q->tx_waiting = 1;
>>>           return;
>>>       }
>>> @@ -2616,7 +2617,7 @@ static void virtio_net_tx_bh(void *opaque)
>>>           return;
>>>       } else if (ret > 0) {
>>>           virtio_queue_set_notification(q->tx_vq, 0);
>>> -        qemu_bh_schedule(q->tx_bh);
>>> +        replay_bh_schedule_event(q->tx_bh);
>>>           q->tx_waiting = 1;
>>>       }
>>>   }
>>> @@ -3206,6 +3207,10 @@ static void 
>>> virtio_net_device_realize(DeviceState *dev, Error **errp)
>>>           n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
>>>       }
>>> +    if (replay_mode != REPLAY_MODE_NONE) {
>>> +        n->host_features &= ~(1ULL << VIRTIO_NET_F_GUEST_ANNOUNCE);
>>> +    }
>>> +
>>>       if (n->net_conf.duplex_str) {
>>>           if (strncmp(n->net_conf.duplex_str, "half", 5) == 0) {
>>>               n->net_conf.duplex = DUPLEX_HALF;
>>>
>>>
>>
>


