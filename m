Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F1C227895
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 08:06:37 +0200 (CEST)
Received: from localhost ([::1]:52728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxlQC-0004Q8-6u
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 02:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jxlPN-0003rI-NM
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 02:05:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31454
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jxlPL-0000ZJ-87
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 02:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595311542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SlFX7HDMAnyyKS59ppPMFBMiUtPa0D0TL8Shf11KGlI=;
 b=G4/lkUlG9yw68EiXBXz9jSvRoxd9cW7B+1F7VrrZd55MzVJx9Zd2vm0+sf9eScJgijaUiI
 Y8SzjggP9kFjJbA3giCt30G7/CEzV828FPtQbnCA8G13DcaCqfyzwvbxpYvDF5PPRaxVSn
 RbethZC84Ee+juzqkK9qDmbnJ0ptg+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-imC26jodPXSXHU5RyUCcgA-1; Tue, 21 Jul 2020 02:05:37 -0400
X-MC-Unique: imC26jodPXSXHU5RyUCcgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 780AE106B205;
 Tue, 21 Jul 2020 06:05:36 +0000 (UTC)
Received: from [10.72.12.202] (ovpn-12-202.pek2.redhat.com [10.72.12.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70C555D9CA;
 Tue, 21 Jul 2020 06:05:33 +0000 (UTC)
Subject: Re: [PATCH v2] e1000e: using bottom half to send packets
To: Li Qiang <liq3ea@gmail.com>
References: <20200720164535.76559-1-liq3ea@163.com>
 <53b2e92c-e05b-46af-ffbc-a895a7cdcbe3@redhat.com>
 <CAKXe6S+uojDRc_44-DP8bjKg++e2k0EEF5MUXh5YNTSpQfxMOQ@mail.gmail.com>
 <a5bed895-a712-f3d9-4309-954ca98dc9e1@redhat.com>
 <CAKXe6SJWwt0LkFdh_HPcWen5f_yRywt8ttM3V9fBr_kkQmOSJQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8b88150f-8c74-3fe9-319b-2cc837dae224@redhat.com>
Date: Tue, 21 Jul 2020 14:05:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXe6SJWwt0LkFdh_HPcWen5f_yRywt8ttM3V9fBr_kkQmOSJQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 01:46:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>, Li Qiang <liq3ea@163.com>,
 Qemu Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/7/21 下午1:59, Li Qiang wrote:
> Jason Wang <jasowang@redhat.com> 于2020年7月21日周二 下午1:30写道：
>>
>> On 2020/7/21 下午12:33, Li Qiang wrote:
>>> Jason Wang <jasowang@redhat.com> 于2020年7月21日周二 上午10:03写道：
>>>> On 2020/7/21 上午12:45, Li Qiang wrote:
>>>>> Alexander Bulekov reported a UAF bug related e1000e packets send.
>>>>>
>>>>> -->https://bugs.launchpad.net/qemu/+bug/1886362
>>>>>
>>>>> This is because the guest trigger a e1000e packet send and set the
>>>>> data's address to e1000e's MMIO address. So when the e1000e do DMA
>>>>> it will write the MMIO again and trigger re-entrancy and finally
>>>>> causes this UAF.
>>>>>
>>>>> Paolo suggested to use a bottom half whenever MMIO is doing complicate
>>>>> things in here:
>>>>> -->https://lists.nongnu.org/archive/html/qemu-devel/2020-07/msg03342.html
>>>>>
>>>>> Reference here:
>>>>> 'The easiest solution is to delay processing of descriptors to a bottom
>>>>> half whenever MMIO is doing something complicated.  This is also better
>>>>> for latency because it will free the vCPU thread more quickly and leave
>>>>> the work to the I/O thread.'
>>>>>
>>>>> This patch fixes this UAF.
>>>>>
>>>>> Signed-off-by: Li Qiang <liq3ea@163.com>
>>>>> ---
>>>>> Change since v1:
>>>>> Per Jason's review here:
>>>>> -- https://lists.nongnu.org/archive/html/qemu-devel/2020-07/msg05368.html
>>>>> 1. Cancel and schedule the tx bh when VM is stopped or resume
>>>>> 2. Add a tx_burst for e1000e configuration to throttle the bh execution
>>>>> 3. Add a tx_waiting to record whether the bh is pending or not
>>>>> Don't use BQL in the tx_bh handler as when tx_bh is executed, the BQL is
>>>>> acquired.
>>>>>
>>>>>     hw/net/e1000e.c      |   6 +++
>>>>>     hw/net/e1000e_core.c | 106 ++++++++++++++++++++++++++++++++++---------
>>>>>     hw/net/e1000e_core.h |   8 ++++
>>>>>     3 files changed, 98 insertions(+), 22 deletions(-)
>>>>>
>>>>> diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
>>>>> index fda34518c9..24e35a78bf 100644
>>>>> --- a/hw/net/e1000e.c
>>>>> +++ b/hw/net/e1000e.c
>>>>> @@ -77,10 +77,14 @@ typedef struct E1000EState {
>>>>>
>>>>>         bool disable_vnet;
>>>>>
>>>>> +    int32_t tx_burst;
>>>>> +
>>>>>         E1000ECore core;
>>>>>
>>>>>     } E1000EState;
>>>>>
>>>>> +#define TX_BURST 256
>>>>> +
>>>>>     #define E1000E_MMIO_IDX     0
>>>>>     #define E1000E_FLASH_IDX    1
>>>>>     #define E1000E_IO_IDX       2
>>>>> @@ -263,6 +267,7 @@ static void e1000e_core_realize(E1000EState *s)
>>>>>     {
>>>>>         s->core.owner = &s->parent_obj;
>>>>>         s->core.owner_nic = s->nic;
>>>>> +    s->core.tx_burst = s->tx_burst;
>>>>>     }
>>>>>
>>>>>     static void
>>>>> @@ -665,6 +670,7 @@ static Property e1000e_properties[] = {
>>>>>                             e1000e_prop_subsys_ven, uint16_t),
>>>>>         DEFINE_PROP_SIGNED("subsys", E1000EState, subsys, 0,
>>>>>                             e1000e_prop_subsys, uint16_t),
>>>>> +    DEFINE_PROP_INT32("x-txburst", E1000EState, tx_burst, TX_BURST),
>>>>>         DEFINE_PROP_END_OF_LIST(),
>>>>>     };
>>>>>
>>>>> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
>>>>> index bcd186cac5..0a38a50cca 100644
>>>>> --- a/hw/net/e1000e_core.c
>>>>> +++ b/hw/net/e1000e_core.c
>>>>> @@ -909,19 +909,18 @@ e1000e_rx_ring_init(E1000ECore *core, E1000E_RxRing *rxr, int idx)
>>>>>         rxr->i      = &i[idx];
>>>>>     }
>>>>>
>>>>> -static void
>>>>> -e1000e_start_xmit(E1000ECore *core, const E1000E_TxRing *txr)
>>>>> +static int32_t
>>>>> +e1000e_start_xmit(struct e1000e_tx *q)
>>>>>     {
>>>>> +    E1000ECore *core = q->core;
>>>>>         dma_addr_t base;
>>>>>         struct e1000_tx_desc desc;
>>>>> -    bool ide = false;
>>>>> -    const E1000E_RingInfo *txi = txr->i;
>>>>> -    uint32_t cause = E1000_ICS_TXQE;
>>>>> +    const E1000E_RingInfo *txi;
>>>>> +    E1000E_TxRing txr;
>>>>> +    int32_t num_packets = 0;
>>>>>
>>>>> -    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
>>>>> -        trace_e1000e_tx_disabled();
>>>>> -        return;
>>>>> -    }
>>>>> +    e1000e_tx_ring_init(core, &txr, q - &core->tx[0]);
>>>>> +    txi = txr.i;
>>>>>
>>>>>         while (!e1000e_ring_empty(core, txi)) {
>>>>>             base = e1000e_ring_head_descr(core, txi);
>>>>> @@ -931,15 +930,17 @@ e1000e_start_xmit(E1000ECore *core, const E1000E_TxRing *txr)
>>>>>             trace_e1000e_tx_descr((void *)(intptr_t)desc.buffer_addr,
>>>>>                                   desc.lower.data, desc.upper.data);
>>>>>
>>>>> -        e1000e_process_tx_desc(core, txr->tx, &desc, txi->idx);
>>>>> -        cause |= e1000e_txdesc_writeback(core, base, &desc, &ide, txi->idx);
>>>>> +        e1000e_process_tx_desc(core, txr.tx, &desc, txi->idx);
>>>>> +        q->cause |= e1000e_txdesc_writeback(core, base, &desc,
>>>>> +                                            &q->ide, txi->idx);
>>>>>
>>>>>             e1000e_ring_advance(core, txi, 1);
>>>>> +        if (++num_packets >= core->tx_burst) {
>>>>> +            break;
>>>>> +        }
>>>>>         }
>>>>>
>>>>> -    if (!ide || !e1000e_intrmgr_delay_tx_causes(core, &cause)) {
>>>>> -        e1000e_set_interrupt_cause(core, cause);
>>>>> -    }
>>>>> +    return num_packets;
>>>>>     }
>>>>>
>>>>>     static bool
>>>>> @@ -2423,32 +2424,41 @@ e1000e_set_dbal(E1000ECore *core, int index, uint32_t val)
>>>>>     static void
>>>>>     e1000e_set_tctl(E1000ECore *core, int index, uint32_t val)
>>>>>     {
>>>>> -    E1000E_TxRing txr;
>>>>>         core->mac[index] = val;
>>>>>
>>>>>         if (core->mac[TARC0] & E1000_TARC_ENABLE) {
>>>>> -        e1000e_tx_ring_init(core, &txr, 0);
>>>>> -        e1000e_start_xmit(core, &txr);
>>>>> +        if (core->tx[0].tx_waiting) {
>>>>> +            return;
>>>>> +        }
>>>>> +        core->tx[0].tx_waiting = 1;
>>>>> +        if (!core->vm_running) {
>>>>> +            return;
>>>>> +        }
>>>>> +        qemu_bh_schedule(core->tx[0].tx_bh);
>>>>>         }
>>>>>
>>>>>         if (core->mac[TARC1] & E1000_TARC_ENABLE) {
>>>>> -        e1000e_tx_ring_init(core, &txr, 1);
>>>>> -        e1000e_start_xmit(core, &txr);
>>>>> +        if (core->tx[1].tx_waiting) {
>>>>> +            return;
>>>>> +        }
>>>>> +        core->tx[1].tx_waiting = 1;
>>>>> +        if (!core->vm_running) {
>>>>> +            return;
>>>>> +        }
>>>>> +        qemu_bh_schedule(core->tx[1].tx_bh);
>>>>>         }
>>>>>     }
>>>>>
>>>>>     static void
>>>>>     e1000e_set_tdt(E1000ECore *core, int index, uint32_t val)
>>>>>     {
>>>>> -    E1000E_TxRing txr;
>>>>>         int qidx = e1000e_mq_queue_idx(TDT, index);
>>>>>         uint32_t tarc_reg = (qidx == 0) ? TARC0 : TARC1;
>>>>>
>>>>>         core->mac[index] = val & 0xffff;
>>>>>
>>>>>         if (core->mac[tarc_reg] & E1000_TARC_ENABLE) {
>>>>> -        e1000e_tx_ring_init(core, &txr, qidx);
>>>>> -        e1000e_start_xmit(core, &txr);
>>>>> +        qemu_bh_schedule(core->tx[qidx].tx_bh);
>>>>>         }
>>>>>     }
>>>>>
>>>>> @@ -3315,10 +3325,56 @@ e1000e_vm_state_change(void *opaque, int running, RunState state)
>>>>>             trace_e1000e_vm_state_running();
>>>>>             e1000e_intrmgr_resume(core);
>>>>>             e1000e_autoneg_resume(core);
>>>>> +        core->vm_running = 1;
>>>>> +
>>>>> +        for (int i = 0; i < E1000E_NUM_QUEUES; i++) {
>>>>> +            qemu_bh_schedule(core->tx[i].tx_bh);
>>>> I guess the reason for the unconditional scheduling of bh is to make
>>>> sure tx work after live migration since we don't migrate tx_waiting.
>>>>
>>>> If yes, better add a comment here.
>>> Ok will do in next revision.
>>>
>>> And do we need to clear tx_waiting here?
>>>
>>> I think there is no need as the tx_bh handler will do this.
>>
>> Yes.
>>
>>
>>>>> +        }
>>>>> +
>>>>>         } else {
>>>>>             trace_e1000e_vm_state_stopped();
>>>>> +
>>>>> +        for (int i = 0; i < E1000E_NUM_QUEUES; i++) {
>>>>> +            qemu_bh_cancel(core->tx[i].tx_bh);
>>>>> +        }
>>>>> +
>>>>>             e1000e_autoneg_pause(core);
>>>>>             e1000e_intrmgr_pause(core);
>>>>> +        core->vm_running = 0;
>>>>> +    }
>>>>> +}
>>>>> +
>>>>> +
>>>>> +static void e1000e_core_tx_bh(void *opaque)
>>>>> +{
>>>>> +    struct e1000e_tx *q = opaque;
>>>>> +    E1000ECore *core = q->core;
>>>>> +    int32_t ret;
>>>>> +
>>>>> +    if (!core->vm_running) {
>>>>> +        assert(q->tx_waiting);
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    q->tx_waiting = 0;
>>>>> +
>>>>> +    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
>>>>> +        trace_e1000e_tx_disabled();
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    q->cause = E1000_ICS_TXQE;
>>>>> +    q->ide = false;
>>>>> +
>>>>> +    ret = e1000e_start_xmit(q);
>>>>> +    if (ret >= core->tx_burst) {
>>>>> +        qemu_bh_schedule(q->tx_bh);
>>>>> +        q->tx_waiting = 1;
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    if (!q->ide || !e1000e_intrmgr_delay_tx_causes(core, &q->cause)) {
>>>>> +        e1000e_set_interrupt_cause(core, q->cause);
>>>> So I think this will cause some delay of the interrupt delivering.
>>> Exactly. if tx burst occurs, the interrupt won't be triggered in the
>>> first tx_bh handler.
>>> As we give the vcpu more time and this may acceptable?
>>
>> I think not, e1000e has its own interrupt delay mechanism, let's keep it
>> work as much as possible.
>>
>>
>>> It
>>>> looks to be it's better to leave the set ics in e1000e_start_xmit().
>>> I think let e1000e_start_xmit just send packets is more clean.
>>> Leave setting ics in it will not improve the performance as far as I can see.
>>> What's your idea here to leave it in e1000e_start_xmit?
>>
>> I just worry about the delay of the interrupt if you do it in
>> e1000e_core_tx_bh() and just let e1000e_start_xmit() return the number
>> of packets transmitted and keep most of its code untouched.
> Sorry here let's make sure I got your meaning.
> 'The set ics' is meaning 'set interrupt cause' , in code:
>
> +    if (!q->ide || !e1000e_intrmgr_delay_tx_causes(core, &q->cause)) {
> +        e1000e_set_interrupt_cause(core, q->cause);
>
> Do you mean we should leave it in the 'e1000e_start_xmit'? My
> understanding is this.
> if it is this, we should also add following code in it:
>
> +    if (ret >= core->tx_burst) {
> +        qemu_bh_schedule(q->tx_bh);
> +        q->tx_waiting = 1;
> +        return;
> +    }
>
> Then the tx_bh handler just call 'e1000e_start_xmit'. Right?


This should work.


>
>
>
>>
>>>>>         }
>>>>>     }
>>>>>
>>>>> @@ -3334,12 +3390,15 @@ e1000e_core_pci_realize(E1000ECore     *core,
>>>>>                                            e1000e_autoneg_timer, core);
>>>>>         e1000e_intrmgr_pci_realize(core);
>>>>>
>>>>> +    core->vm_running = runstate_is_running();
>>>>>         core->vmstate =
>>>>>             qemu_add_vm_change_state_handler(e1000e_vm_state_change, core);
>>>>>
>>>>>         for (i = 0; i < E1000E_NUM_QUEUES; i++) {
>>>>>             net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner,
>>>>>                             E1000E_MAX_TX_FRAGS, core->has_vnet);
>>>>> +        core->tx[i].core = core;
>>>>> +        core->tx[i].tx_bh = qemu_bh_new(e1000e_core_tx_bh, &core->tx[i]);
>>>>>         }
>>>>>
>>>>>         net_rx_pkt_init(&core->rx_pkt, core->has_vnet);
>>>>> @@ -3367,6 +3426,9 @@ e1000e_core_pci_uninit(E1000ECore *core)
>>>>>         for (i = 0; i < E1000E_NUM_QUEUES; i++) {
>>>>>             net_tx_pkt_reset(core->tx[i].tx_pkt);
>>>>>             net_tx_pkt_uninit(core->tx[i].tx_pkt);
>>>>> +        qemu_bh_cancel(core->tx[i].tx_bh);
>>>>> +        qemu_bh_delete(core->tx[i].tx_bh);
>>>>> +        core->tx[i].tx_bh = NULL;
>>>>>         }
>>>>>
>>>>>         net_rx_pkt_uninit(core->rx_pkt);
>>>>> diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
>>>>> index aee32f7e48..0c16dce3a6 100644
>>>>> --- a/hw/net/e1000e_core.h
>>>>> +++ b/hw/net/e1000e_core.h
>>>>> @@ -77,10 +77,18 @@ struct E1000Core {
>>>>>             unsigned char sum_needed;
>>>>>             bool cptse;
>>>>>             struct NetTxPkt *tx_pkt;
>>>>> +        QEMUBH *tx_bh;
>>>>> +        uint32_t tx_waiting;
>>>>> +        uint32_t cause;
>>>>> +        bool ide;
>>>>> +        E1000ECore *core;
>>>>>         } tx[E1000E_NUM_QUEUES];
>>>>>
>>>>>         struct NetRxPkt *rx_pkt;
>>>>>
>>>>> +    int32_t tx_burst;
>>>>> +
>>>>> +    bool vm_running;
>>>>>         bool has_vnet;
>>>>>         int max_queue_num;
>>>>>
>>>> Do we need to cancel the bh and reset tx_waiting in e1000e_core_reset()?
>>> I think we need. But why the virtio net doesn't do this? Maybe it also
>>> lack of this?
>>
>> Ok, so I think the current code is probably OK.
> So my next revision will do following:
> 1. add comment for the tx_bh schdule when VM resume.
> 2. Leave some code in the 'e1000e_start_xmit'
> 3. cancel the tx_bh and reset tx_waiting in e1000e_core_reset
>
> If I lost/misunderstanding anything please let me know.


Your understanding is correct.

Thanks


>
> Thanks,
> Li Qiang
>
>> virtio-net check DRIVER_OK and the code here check  TCTL_EN.
>>
>> Thanks
>>
>>
>>> Thanks,
>>> Li Qiang
>>>
>>>> Thanks
>>>>


