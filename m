Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F022277A6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 06:34:53 +0200 (CEST)
Received: from localhost ([::1]:46744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxjzQ-0000Wl-4x
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 00:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1jxjyh-0008WC-5U
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 00:34:07 -0400
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:45358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1jxjyf-0002G3-1o
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 00:34:06 -0400
Received: by mail-oo1-xc41.google.com with SMTP id a9so3660034oof.12
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 21:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EvCDm6lgU9Phun7Czg5/lJmhbtVqxty5GywKtm8N4jU=;
 b=M35x14MyAsCDTkGp3oKqtf9EYnz78CFdi+ZAyngJsTFK2Kqdhivrk5B6gu+Qhhuybh
 0r+IC0N7t0jH4dTO/HkTF9PPHsw4IA2pUTEiRjOGDRBuolO4eGNr9fiJOgdBRRS5aF+C
 Mn37k47e49obRq8iD8YAuE/pCgKS2mcdmKwF9kDacBGFPWhhXwn2wqeworsoff3YxvPb
 /SafeZ14VxgYz+Dxe2co2x+WEgz8TV1uXAbPrHr6wijubg5k2s++taEwHMrrWI1hUrCf
 R8+IgzIMyxSD+42FYo+vWDlaVZZnoLj+bYTY+sxLSK47xhjOXttJNyAbGi/o+xR+PWxh
 IMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EvCDm6lgU9Phun7Czg5/lJmhbtVqxty5GywKtm8N4jU=;
 b=gjJUHya3unrDXpgXijSS7A/EPq3pyUMeT475siERoMhfph5U32dARuU6H92LznJPp7
 NyqEO/M8xluKeDUP4vxMRYdl+LccvALPXAxPQ3mRzLj4HqE4Wc3noDj/HUJFZ2iYLLqU
 nhf4lmSapuzn/iSpbHYQbhTP9/t24ZJO1c9xU9pm7BLy+oZ13rd5UkqEqApt3LNBTxx1
 lLyrEwWxH5GWOg4S0SMSJlBnBfO9UQrEj+5jyl6ypUkIa3LbkgVIdB3qV575YaDlYtor
 pJB9f/uOq5JhUkZb8vMXtYD/bG2hTMbghStvCrqdYh+PCvFS5ebwZKVClHTyxHVjwpkV
 EM+A==
X-Gm-Message-State: AOAM533qiMtZHeAh5oZ4Mw1w5VShBY9vBgZmSTm7k1hjtrDnLnCqs34O
 q20WedsEasC1T2Fs/Di6UngByo6GbJi9sDbj6ns=
X-Google-Smtp-Source: ABdhPJzehizE3cpHkTGR+nbQOzfIseAhs46G2jLp+gghQzk0fnLH1Ppu0LWpiC28cAHRDE4VpjoGvxGxwHsZyoFbnz0=
X-Received: by 2002:a4a:8257:: with SMTP id t23mr22584932oog.60.1595306043634; 
 Mon, 20 Jul 2020 21:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200720164535.76559-1-liq3ea@163.com>
 <53b2e92c-e05b-46af-ffbc-a895a7cdcbe3@redhat.com>
In-Reply-To: <53b2e92c-e05b-46af-ffbc-a895a7cdcbe3@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Tue, 21 Jul 2020 12:33:27 +0800
Message-ID: <CAKXe6S+uojDRc_44-DP8bjKg++e2k0EEF5MUXh5YNTSpQfxMOQ@mail.gmail.com>
Subject: Re: [PATCH v2] e1000e: using bottom half to send packets
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=liq3ea@gmail.com; helo=mail-oo1-xc41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>, Li Qiang <liq3ea@163.com>,
 Qemu Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jason Wang <jasowang@redhat.com> =E4=BA=8E2020=E5=B9=B47=E6=9C=8821=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=8810:03=E5=86=99=E9=81=93=EF=BC=9A
>
>
> On 2020/7/21 =E4=B8=8A=E5=8D=8812:45, Li Qiang wrote:
> > Alexander Bulekov reported a UAF bug related e1000e packets send.
> >
> > -->https://bugs.launchpad.net/qemu/+bug/1886362
> >
> > This is because the guest trigger a e1000e packet send and set the
> > data's address to e1000e's MMIO address. So when the e1000e do DMA
> > it will write the MMIO again and trigger re-entrancy and finally
> > causes this UAF.
> >
> > Paolo suggested to use a bottom half whenever MMIO is doing complicate
> > things in here:
> > -->https://lists.nongnu.org/archive/html/qemu-devel/2020-07/msg03342.ht=
ml
> >
> > Reference here:
> > 'The easiest solution is to delay processing of descriptors to a bottom
> > half whenever MMIO is doing something complicated.  This is also better
> > for latency because it will free the vCPU thread more quickly and leave
> > the work to the I/O thread.'
> >
> > This patch fixes this UAF.
> >
> > Signed-off-by: Li Qiang <liq3ea@163.com>
> > ---
> > Change since v1:
> > Per Jason's review here:
> > -- https://lists.nongnu.org/archive/html/qemu-devel/2020-07/msg05368.ht=
ml
> > 1. Cancel and schedule the tx bh when VM is stopped or resume
> > 2. Add a tx_burst for e1000e configuration to throttle the bh execution
> > 3. Add a tx_waiting to record whether the bh is pending or not
> > Don't use BQL in the tx_bh handler as when tx_bh is executed, the BQL i=
s
> > acquired.
> >
> >   hw/net/e1000e.c      |   6 +++
> >   hw/net/e1000e_core.c | 106 ++++++++++++++++++++++++++++++++++--------=
-
> >   hw/net/e1000e_core.h |   8 ++++
> >   3 files changed, 98 insertions(+), 22 deletions(-)
> >
> > diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
> > index fda34518c9..24e35a78bf 100644
> > --- a/hw/net/e1000e.c
> > +++ b/hw/net/e1000e.c
> > @@ -77,10 +77,14 @@ typedef struct E1000EState {
> >
> >       bool disable_vnet;
> >
> > +    int32_t tx_burst;
> > +
> >       E1000ECore core;
> >
> >   } E1000EState;
> >
> > +#define TX_BURST 256
> > +
> >   #define E1000E_MMIO_IDX     0
> >   #define E1000E_FLASH_IDX    1
> >   #define E1000E_IO_IDX       2
> > @@ -263,6 +267,7 @@ static void e1000e_core_realize(E1000EState *s)
> >   {
> >       s->core.owner =3D &s->parent_obj;
> >       s->core.owner_nic =3D s->nic;
> > +    s->core.tx_burst =3D s->tx_burst;
> >   }
> >
> >   static void
> > @@ -665,6 +670,7 @@ static Property e1000e_properties[] =3D {
> >                           e1000e_prop_subsys_ven, uint16_t),
> >       DEFINE_PROP_SIGNED("subsys", E1000EState, subsys, 0,
> >                           e1000e_prop_subsys, uint16_t),
> > +    DEFINE_PROP_INT32("x-txburst", E1000EState, tx_burst, TX_BURST),
> >       DEFINE_PROP_END_OF_LIST(),
> >   };
> >
> > diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> > index bcd186cac5..0a38a50cca 100644
> > --- a/hw/net/e1000e_core.c
> > +++ b/hw/net/e1000e_core.c
> > @@ -909,19 +909,18 @@ e1000e_rx_ring_init(E1000ECore *core, E1000E_RxRi=
ng *rxr, int idx)
> >       rxr->i      =3D &i[idx];
> >   }
> >
> > -static void
> > -e1000e_start_xmit(E1000ECore *core, const E1000E_TxRing *txr)
> > +static int32_t
> > +e1000e_start_xmit(struct e1000e_tx *q)
> >   {
> > +    E1000ECore *core =3D q->core;
> >       dma_addr_t base;
> >       struct e1000_tx_desc desc;
> > -    bool ide =3D false;
> > -    const E1000E_RingInfo *txi =3D txr->i;
> > -    uint32_t cause =3D E1000_ICS_TXQE;
> > +    const E1000E_RingInfo *txi;
> > +    E1000E_TxRing txr;
> > +    int32_t num_packets =3D 0;
> >
> > -    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
> > -        trace_e1000e_tx_disabled();
> > -        return;
> > -    }
> > +    e1000e_tx_ring_init(core, &txr, q - &core->tx[0]);
> > +    txi =3D txr.i;
> >
> >       while (!e1000e_ring_empty(core, txi)) {
> >           base =3D e1000e_ring_head_descr(core, txi);
> > @@ -931,15 +930,17 @@ e1000e_start_xmit(E1000ECore *core, const E1000E_=
TxRing *txr)
> >           trace_e1000e_tx_descr((void *)(intptr_t)desc.buffer_addr,
> >                                 desc.lower.data, desc.upper.data);
> >
> > -        e1000e_process_tx_desc(core, txr->tx, &desc, txi->idx);
> > -        cause |=3D e1000e_txdesc_writeback(core, base, &desc, &ide, tx=
i->idx);
> > +        e1000e_process_tx_desc(core, txr.tx, &desc, txi->idx);
> > +        q->cause |=3D e1000e_txdesc_writeback(core, base, &desc,
> > +                                            &q->ide, txi->idx);
> >
> >           e1000e_ring_advance(core, txi, 1);
> > +        if (++num_packets >=3D core->tx_burst) {
> > +            break;
> > +        }
> >       }
> >
> > -    if (!ide || !e1000e_intrmgr_delay_tx_causes(core, &cause)) {
> > -        e1000e_set_interrupt_cause(core, cause);
> > -    }
> > +    return num_packets;
> >   }
> >
> >   static bool
> > @@ -2423,32 +2424,41 @@ e1000e_set_dbal(E1000ECore *core, int index, ui=
nt32_t val)
> >   static void
> >   e1000e_set_tctl(E1000ECore *core, int index, uint32_t val)
> >   {
> > -    E1000E_TxRing txr;
> >       core->mac[index] =3D val;
> >
> >       if (core->mac[TARC0] & E1000_TARC_ENABLE) {
> > -        e1000e_tx_ring_init(core, &txr, 0);
> > -        e1000e_start_xmit(core, &txr);
> > +        if (core->tx[0].tx_waiting) {
> > +            return;
> > +        }
> > +        core->tx[0].tx_waiting =3D 1;
> > +        if (!core->vm_running) {
> > +            return;
> > +        }
> > +        qemu_bh_schedule(core->tx[0].tx_bh);
> >       }
> >
> >       if (core->mac[TARC1] & E1000_TARC_ENABLE) {
> > -        e1000e_tx_ring_init(core, &txr, 1);
> > -        e1000e_start_xmit(core, &txr);
> > +        if (core->tx[1].tx_waiting) {
> > +            return;
> > +        }
> > +        core->tx[1].tx_waiting =3D 1;
> > +        if (!core->vm_running) {
> > +            return;
> > +        }
> > +        qemu_bh_schedule(core->tx[1].tx_bh);
> >       }
> >   }
> >
> >   static void
> >   e1000e_set_tdt(E1000ECore *core, int index, uint32_t val)
> >   {
> > -    E1000E_TxRing txr;
> >       int qidx =3D e1000e_mq_queue_idx(TDT, index);
> >       uint32_t tarc_reg =3D (qidx =3D=3D 0) ? TARC0 : TARC1;
> >
> >       core->mac[index] =3D val & 0xffff;
> >
> >       if (core->mac[tarc_reg] & E1000_TARC_ENABLE) {
> > -        e1000e_tx_ring_init(core, &txr, qidx);
> > -        e1000e_start_xmit(core, &txr);
> > +        qemu_bh_schedule(core->tx[qidx].tx_bh);
> >       }
> >   }
> >
> > @@ -3315,10 +3325,56 @@ e1000e_vm_state_change(void *opaque, int runnin=
g, RunState state)
> >           trace_e1000e_vm_state_running();
> >           e1000e_intrmgr_resume(core);
> >           e1000e_autoneg_resume(core);
> > +        core->vm_running =3D 1;
> > +
> > +        for (int i =3D 0; i < E1000E_NUM_QUEUES; i++) {
> > +            qemu_bh_schedule(core->tx[i].tx_bh);
>
>
> I guess the reason for the unconditional scheduling of bh is to make
> sure tx work after live migration since we don't migrate tx_waiting.
>
> If yes, better add a comment here.

Ok will do in next revision.

And do we need to clear tx_waiting here?

I think there is no need as the tx_bh handler will do this.

>
>
> > +        }
> > +
> >       } else {
> >           trace_e1000e_vm_state_stopped();
> > +
> > +        for (int i =3D 0; i < E1000E_NUM_QUEUES; i++) {
> > +            qemu_bh_cancel(core->tx[i].tx_bh);
> > +        }
> > +
> >           e1000e_autoneg_pause(core);
> >           e1000e_intrmgr_pause(core);
> > +        core->vm_running =3D 0;
> > +    }
> > +}
> > +
> > +
> > +static void e1000e_core_tx_bh(void *opaque)
> > +{
> > +    struct e1000e_tx *q =3D opaque;
> > +    E1000ECore *core =3D q->core;
> > +    int32_t ret;
> > +
> > +    if (!core->vm_running) {
> > +        assert(q->tx_waiting);
> > +        return;
> > +    }
> > +
> > +    q->tx_waiting =3D 0;
> > +
> > +    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
> > +        trace_e1000e_tx_disabled();
> > +        return;
> > +    }
> > +
> > +    q->cause =3D E1000_ICS_TXQE;
> > +    q->ide =3D false;
> > +
> > +    ret =3D e1000e_start_xmit(q);
> > +    if (ret >=3D core->tx_burst) {
> > +        qemu_bh_schedule(q->tx_bh);
> > +        q->tx_waiting =3D 1;
> > +        return;
> > +    }
> > +
> > +    if (!q->ide || !e1000e_intrmgr_delay_tx_causes(core, &q->cause)) {
> > +        e1000e_set_interrupt_cause(core, q->cause);
>
>
> So I think this will cause some delay of the interrupt delivering.

Exactly. if tx burst occurs, the interrupt won't be triggered in the
first tx_bh handler.
As we give the vcpu more time and this may acceptable?

It
> looks to be it's better to leave the set ics in e1000e_start_xmit().

I think let e1000e_start_xmit just send packets is more clean.
Leave setting ics in it will not improve the performance as far as I can se=
e.
What's your idea here to leave it in e1000e_start_xmit?

>
>
> >       }
> >   }
> >
> > @@ -3334,12 +3390,15 @@ e1000e_core_pci_realize(E1000ECore     *core,
> >                                          e1000e_autoneg_timer, core);
> >       e1000e_intrmgr_pci_realize(core);
> >
> > +    core->vm_running =3D runstate_is_running();
> >       core->vmstate =3D
> >           qemu_add_vm_change_state_handler(e1000e_vm_state_change, core=
);
> >
> >       for (i =3D 0; i < E1000E_NUM_QUEUES; i++) {
> >           net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner,
> >                           E1000E_MAX_TX_FRAGS, core->has_vnet);
> > +        core->tx[i].core =3D core;
> > +        core->tx[i].tx_bh =3D qemu_bh_new(e1000e_core_tx_bh, &core->tx=
[i]);
> >       }
> >
> >       net_rx_pkt_init(&core->rx_pkt, core->has_vnet);
> > @@ -3367,6 +3426,9 @@ e1000e_core_pci_uninit(E1000ECore *core)
> >       for (i =3D 0; i < E1000E_NUM_QUEUES; i++) {
> >           net_tx_pkt_reset(core->tx[i].tx_pkt);
> >           net_tx_pkt_uninit(core->tx[i].tx_pkt);
> > +        qemu_bh_cancel(core->tx[i].tx_bh);
> > +        qemu_bh_delete(core->tx[i].tx_bh);
> > +        core->tx[i].tx_bh =3D NULL;
> >       }
> >
> >       net_rx_pkt_uninit(core->rx_pkt);
> > diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
> > index aee32f7e48..0c16dce3a6 100644
> > --- a/hw/net/e1000e_core.h
> > +++ b/hw/net/e1000e_core.h
> > @@ -77,10 +77,18 @@ struct E1000Core {
> >           unsigned char sum_needed;
> >           bool cptse;
> >           struct NetTxPkt *tx_pkt;
> > +        QEMUBH *tx_bh;
> > +        uint32_t tx_waiting;
> > +        uint32_t cause;
> > +        bool ide;
> > +        E1000ECore *core;
> >       } tx[E1000E_NUM_QUEUES];
> >
> >       struct NetRxPkt *rx_pkt;
> >
> > +    int32_t tx_burst;
> > +
> > +    bool vm_running;
> >       bool has_vnet;
> >       int max_queue_num;
> >
>
>
> Do we need to cancel the bh and reset tx_waiting in e1000e_core_reset()?

I think we need. But why the virtio net doesn't do this? Maybe it also
lack of this?


Thanks,
Li Qiang

>
> Thanks
>

