Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5827F223304
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 07:40:00 +0200 (CEST)
Received: from localhost ([::1]:48350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwJ6F-0005nc-F3
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 01:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jwJ5M-0005NF-7C
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 01:39:04 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25618
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jwJ5J-0006ot-On
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 01:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594964340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEn6H67qOHz7DTCiGNVC7qyVJhoFECI/NY8kmPVww4o=;
 b=d+6d5RRqAd5kXgn6+3W0VBHaMH9MQNX6wwT+XAs1xsw1DycKPhwKEq+wk/DUvPEWQf0jhg
 R8qRqqidW2A+TqKGFNaX865ZBZwy1DSKOb7mMomnS6QkuNLzARXfl/x//6+ALeE5hHZNBc
 ghiJB6UZ3O1LoO9z+6pWVUbwyJW4gDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-yZW8hqjpMm2BoVIZx061TA-1; Fri, 17 Jul 2020 01:38:56 -0400
X-MC-Unique: yZW8hqjpMm2BoVIZx061TA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 648461800D42;
 Fri, 17 Jul 2020 05:38:55 +0000 (UTC)
Received: from [10.72.12.157] (ovpn-12-157.pek2.redhat.com [10.72.12.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56F7F5C298;
 Fri, 17 Jul 2020 05:38:48 +0000 (UTC)
Subject: Re: [PATCH] e1000e: using bottom half to send packets
To: Li Qiang <liq3ea@gmail.com>
References: <20200716161453.61295-1-liq3ea@163.com>
 <281e3c85-b8eb-0c3e-afc3-41011861b8ea@redhat.com>
 <CAKXe6SLe_ZRqQQMi2hPFBkauWnbaOPKN27fwrdaTOymb-fTrFg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d9c249a1-5f63-7497-3783-3a3e8cf7b2da@redhat.com>
Date: Fri, 17 Jul 2020 13:38:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXe6SLe_ZRqQQMi2hPFBkauWnbaOPKN27fwrdaTOymb-fTrFg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/17 01:06:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Li Qiang <liq3ea@163.com>,
 Qemu Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/7/17 下午12:46, Li Qiang wrote:
> Jason Wang <jasowang@redhat.com> 于2020年7月17日周五 上午11:10写道：
>>
>> On 2020/7/17 上午12:14, Li Qiang wrote:
>>> Alexander Bulekov reported a UAF bug related e1000e packets send.
>>>
>>> -->https://bugs.launchpad.net/qemu/+bug/1886362
>>>
>>> This is because the guest trigger a e1000e packet send and set the
>>> data's address to e1000e's MMIO address. So when the e1000e do DMA
>>> it will write the MMIO again and trigger re-entrancy and finally
>>> causes this UAF.
>>>
>>> Paolo suggested to use a bottom half whenever MMIO is doing complicate
>>> things in here:
>>> -->https://lists.nongnu.org/archive/html/qemu-devel/2020-07/msg03342.html
>>>
>>> Reference here:
>>> 'The easiest solution is to delay processing of descriptors to a bottom
>>> half whenever MMIO is doing something complicated.  This is also better
>>> for latency because it will free the vCPU thread more quickly and leave
>>> the work to the I/O thread.'
>>
>> I think several things were missed in this patch (take virtio-net as a
>> reference), do we need the following things:
>>
> Thanks Jason,
> In fact I know this, I'm scared for touching this but I want to try.
> Thanks for your advice.
>
>> - Cancel the bh when VM is stopped.
> Ok. I think add a vm state change notifier for e1000e can address this.
>
>> - A throttle to prevent bh from executing too much timer?
> Ok, I think add a config timeout and add a timer in e1000e can address this.


Sorry, a typo. I meant we probably need a tx_burst as what virtio-net did.


>
>> - A flag to record whether or not this a pending tx (and migrate it?)
> Is just a flag enough? Could you explain more about the idea behind
> processing the virtio-net/e1000e using bh like this?


Virtio-net use a tx_waiting variable to record whether or not there's a 
pending bh. (E.g bh is cancelled due to vmstop, we need reschedule it 
after vmresume). Maybe we can do something simpler by just schecule bh 
unconditionally during vm resuming.


> For example, if the guest trigger a lot of packets send and if the bh
> is scheduled in IO thread. So will we lost packets?


We don't since we don't populate virtqueue which means packets are 
queued there.

Thanks


> How we avoid this in virtio-net.
>
> Thanks,
> Li Qiang
>
>
>
>> Thanks
>>
>>
>>> This patch fixes this UAF.
>>>
>>> Signed-off-by: Li Qiang <liq3ea@163.com>
>>> ---
>>>    hw/net/e1000e_core.c | 25 +++++++++++++++++--------
>>>    hw/net/e1000e_core.h |  2 ++
>>>    2 files changed, 19 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
>>> index bcd186cac5..6165b04b68 100644
>>> --- a/hw/net/e1000e_core.c
>>> +++ b/hw/net/e1000e_core.c
>>> @@ -2423,32 +2423,27 @@ e1000e_set_dbal(E1000ECore *core, int index, uint32_t val)
>>>    static void
>>>    e1000e_set_tctl(E1000ECore *core, int index, uint32_t val)
>>>    {
>>> -    E1000E_TxRing txr;
>>>        core->mac[index] = val;
>>>
>>>        if (core->mac[TARC0] & E1000_TARC_ENABLE) {
>>> -        e1000e_tx_ring_init(core, &txr, 0);
>>> -        e1000e_start_xmit(core, &txr);
>>> +        qemu_bh_schedule(core->tx[0].tx_bh);
>>>        }
>>>
>>>        if (core->mac[TARC1] & E1000_TARC_ENABLE) {
>>> -        e1000e_tx_ring_init(core, &txr, 1);
>>> -        e1000e_start_xmit(core, &txr);
>>> +        qemu_bh_schedule(core->tx[1].tx_bh);
>>>        }
>>>    }
>>>
>>>    static void
>>>    e1000e_set_tdt(E1000ECore *core, int index, uint32_t val)
>>>    {
>>> -    E1000E_TxRing txr;
>>>        int qidx = e1000e_mq_queue_idx(TDT, index);
>>>        uint32_t tarc_reg = (qidx == 0) ? TARC0 : TARC1;
>>>
>>>        core->mac[index] = val & 0xffff;
>>>
>>>        if (core->mac[tarc_reg] & E1000_TARC_ENABLE) {
>>> -        e1000e_tx_ring_init(core, &txr, qidx);
>>> -        e1000e_start_xmit(core, &txr);
>>> +        qemu_bh_schedule(core->tx[qidx].tx_bh);
>>>        }
>>>    }
>>>
>>> @@ -3322,6 +3317,16 @@ e1000e_vm_state_change(void *opaque, int running, RunState state)
>>>        }
>>>    }
>>>
>>> +static void e1000e_core_tx_bh(void *opaque)
>>> +{
>>> +    struct e1000e_tx *tx = opaque;
>>> +    E1000ECore *core = tx->core;
>>> +    E1000E_TxRing txr;
>>> +
>>> +    e1000e_tx_ring_init(core, &txr, tx - &core->tx[0]);
>>> +    e1000e_start_xmit(core, &txr);
>>> +}
>>> +
>>>    void
>>>    e1000e_core_pci_realize(E1000ECore     *core,
>>>                            const uint16_t *eeprom_templ,
>>> @@ -3340,6 +3345,8 @@ e1000e_core_pci_realize(E1000ECore     *core,
>>>        for (i = 0; i < E1000E_NUM_QUEUES; i++) {
>>>            net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner,
>>>                            E1000E_MAX_TX_FRAGS, core->has_vnet);
>>> +        core->tx[i].core = core;
>>> +        core->tx[i].tx_bh = qemu_bh_new(e1000e_core_tx_bh, &core->tx[i]);
>>>        }
>>>
>>>        net_rx_pkt_init(&core->rx_pkt, core->has_vnet);
>>> @@ -3367,6 +3374,8 @@ e1000e_core_pci_uninit(E1000ECore *core)
>>>        for (i = 0; i < E1000E_NUM_QUEUES; i++) {
>>>            net_tx_pkt_reset(core->tx[i].tx_pkt);
>>>            net_tx_pkt_uninit(core->tx[i].tx_pkt);
>>> +        qemu_bh_delete(core->tx[i].tx_bh);
>>> +        core->tx[i].tx_bh = NULL;
>>>        }
>>>
>>>        net_rx_pkt_uninit(core->rx_pkt);
>>> diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
>>> index aee32f7e48..94ddc6afc2 100644
>>> --- a/hw/net/e1000e_core.h
>>> +++ b/hw/net/e1000e_core.h
>>> @@ -77,6 +77,8 @@ struct E1000Core {
>>>            unsigned char sum_needed;
>>>            bool cptse;
>>>            struct NetTxPkt *tx_pkt;
>>> +        QEMUBH *tx_bh;
>>> +        E1000ECore *core;
>>>        } tx[E1000E_NUM_QUEUES];
>>>
>>>        struct NetRxPkt *rx_pkt;


