Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B71397189
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 12:34:58 +0200 (CEST)
Received: from localhost ([::1]:59924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo1jd-0007Vm-DE
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 06:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lo1ie-0006pU-Ka
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:33:57 -0400
Received: from mail.ispras.ru ([83.149.199.84]:57890)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lo1ic-00012B-4O
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:33:56 -0400
Received: from [192.168.0.92] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id 8AA6340755C5;
 Tue,  1 Jun 2021 10:33:47 +0000 (UTC)
Subject: Re: [PATCH] replay: improve determinism of virtio-net
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <162125666020.1252655.9997723318921206001.stgit@pasha-ThinkPad-X280>
 <a0210fac-af32-8f1e-ae5f-237d773c32bf@redhat.com>
 <91370f34-5a37-1cb1-fa7e-c95e3b7521c4@ispras.ru>
 <63e36678-452e-7436-10b3-55f9994c069b@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <5f1a6233-bde2-d6b9-5801-8a8c3b036186@ispras.ru>
Date: Tue, 1 Jun 2021 13:33:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <63e36678-452e-7436-10b3-55f9994c069b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.591,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 31.05.2021 09:39, Jason Wang wrote:
> 
> 在 2021/5/31 下午2:35, Pavel Dovgalyuk 写道:
>> On 31.05.2021 07:55, Jason Wang wrote:
>>>
>>> 在 2021/5/17 下午9:04, Pavel Dovgalyuk 写道:
>>>> virtio-net device uses bottom halves for callbacks.
>>>> These callbacks should be deterministic, because they affect VM state.
>>>> This patch replaces BH invocations with corresponding replay functions,
>>>> making them deterministic in record/replay mode.
>>>> This patch also disables guest announce timers for record/replay,
>>>> because they break correct loadvm in deterministic mode.
>>>
>>>
>>> Virtio-net can be configured to work in tx timer mode. Do we need to 
>>> care about that?
>>
>> What does it mean? This patch fixes interaction with TX timer. Is it 
>> related to that mode?
> 
> 
> I meant is the timer used by virtio_net_handle_tx_timer() safe consider 
> you disable announce timer.

It is related to virtio queue. I looked through it and it looks safe to me.

> 
> Thanks
> 
> 
>>
>>>
>>>
>>>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>>>> ---
>>>>   hw/net/virtio-net.c |   13 +++++++++----
>>>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>>> index 6b7e8dd04e..e876363236 100644
>>>> --- a/hw/net/virtio-net.c
>>>> +++ b/hw/net/virtio-net.c
>>>> @@ -44,6 +44,7 @@
>>>>   #include "hw/pci/pci.h"
>>>>   #include "net_rx_pkt.h"
>>>>   #include "hw/virtio/vhost.h"
>>>> +#include "sysemu/replay.h"
>>>>   #define VIRTIO_NET_VM_VERSION    11
>>>> @@ -394,7 +395,7 @@ static void virtio_net_set_status(struct 
>>>> VirtIODevice *vdev, uint8_t status)
>>>>                   timer_mod(q->tx_timer,
>>>> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
>>>>               } else {
>>>> -                qemu_bh_schedule(q->tx_bh);
>>>> +                replay_bh_schedule_event(q->tx_bh);
>>>>               }
>>>>           } else {
>>>>               if (q->tx_timer) {
>>>> @@ -2546,7 +2547,7 @@ static void 
>>>> virtio_net_handle_tx_bh(VirtIODevice *vdev, VirtQueue *vq)
>>>>           return;
>>>>       }
>>>>       virtio_queue_set_notification(vq, 0);
>>>> -    qemu_bh_schedule(q->tx_bh);
>>>> +    replay_bh_schedule_event(q->tx_bh);
>>>
>>>
>>> Not familiar with replay but any chance to change qemu_bh_schedule() 
>>> instead?
>>
>> It would be better, but sometimes qemu_bh_schedule is used for the 
>> callbacks that are not related to the guest state change.
>>
>>>
>>> Thanks
>>>
>>>
>>>>   }
>>>>   static void virtio_net_tx_timer(void *opaque)
>>>> @@ -2602,7 +2603,7 @@ static void virtio_net_tx_bh(void *opaque)
>>>>       /* If we flush a full burst of packets, assume there are
>>>>        * more coming and immediately reschedule */
>>>>       if (ret >= n->tx_burst) {
>>>> -        qemu_bh_schedule(q->tx_bh);
>>>> +        replay_bh_schedule_event(q->tx_bh);
>>>>           q->tx_waiting = 1;
>>>>           return;
>>>>       }
>>>> @@ -2616,7 +2617,7 @@ static void virtio_net_tx_bh(void *opaque)
>>>>           return;
>>>>       } else if (ret > 0) {
>>>>           virtio_queue_set_notification(q->tx_vq, 0);
>>>> -        qemu_bh_schedule(q->tx_bh);
>>>> +        replay_bh_schedule_event(q->tx_bh);
>>>>           q->tx_waiting = 1;
>>>>       }
>>>>   }
>>>> @@ -3206,6 +3207,10 @@ static void 
>>>> virtio_net_device_realize(DeviceState *dev, Error **errp)
>>>>           n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
>>>>       }
>>>> +    if (replay_mode != REPLAY_MODE_NONE) {
>>>> +        n->host_features &= ~(1ULL << VIRTIO_NET_F_GUEST_ANNOUNCE);
>>>> +    }
>>>> +
>>>>       if (n->net_conf.duplex_str) {
>>>>           if (strncmp(n->net_conf.duplex_str, "half", 5) == 0) {
>>>>               n->net_conf.duplex = DUPLEX_HALF;
>>>>
>>>>
>>>
>>
> 


