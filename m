Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FE73E2B31
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 15:10:15 +0200 (CEST)
Received: from localhost ([::1]:45522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBzc6-0003MT-8f
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 09:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mBzYa-0006Vy-FZ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 09:06:36 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:35631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mBzYY-0004g0-Ef
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 09:06:36 -0400
Received: by mail-qk1-x731.google.com with SMTP id a19so9780552qkg.2
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I5ChVtxWi1bByyOCXddmCseZqnCQC0fOxH+ruiCSu+g=;
 b=SVCEIQy+jOQ92PmaOP/BpzEgBBkB/JqopPb6P0aiXp6s4bnXJtGjPmxkvhOsz2yrbV
 OKblw/7cToLHbSCcc5hId0202tn9Vo0trr539qmLsGU3bX2PrWwPuiM+6nj3lT5KutbJ
 h/rvxJHsw0Lao+BivN8gQr6TNnsHkDCgWaAavh7R5DU8PyyUUPXPkiBApQSSdnUcs85N
 HLTv0Ee0Z5BZIHwwvqmAc6eInYASzq5+14L8hYSDdDnlg4+F30G1PA5UEwFyk0rH1nHn
 xmH5tyGj+pwVcr3rVz5ISFNGse69vMBJdEUUtv+y39wkyGD6GJ6vUMVyBCiWSaa/cA62
 XJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I5ChVtxWi1bByyOCXddmCseZqnCQC0fOxH+ruiCSu+g=;
 b=U63sojwFvc7nltK+q1Khl60qUmuBG6j8M7weBeDhMYnDBlo9T2GZEaD2z29quO2kxY
 bHA/zEIlE/7cZYyoVl6yAZoMLsucL29/wpJEkL8Iy64/bAgfMbzIMP08KcuRjc+6V779
 8ofvRg41ugSmZe1JvHtYoZxRs/2NwcL5MMrbc9STcAoaRgWR6WLdfkoWr4gxBfV8p8p9
 ZC3LbeP36RT+/FsrgvUdabq6sik+ZNzyV3SI8duxV564Icetm1995zwVKmbWNnIYErvA
 mZQXPLSwljBKwfXqEbaVH4zHynEUcEOwiMlNhaF93102fZx7e9DFh5uJsdnhVWuq07Qc
 ZdXQ==
X-Gm-Message-State: AOAM5312JMpc1syBIptgrMZQ7DF635Xcs+3xYwn0T2y96pZjS5Kt49Po
 HJ6WFv9At06IiK5wdqxmg53Ncg==
X-Google-Smtp-Source: ABdhPJxVCtAQERXqalr3C+ltaJQpcSGvvFzNgX3bLtgmsfhVVYRaD1Ovm2z9Q3662RQ+DNlFjZF6UA==
X-Received: by 2002:a37:a00b:: with SMTP id j11mr4885311qke.457.1628255192998; 
 Fri, 06 Aug 2021 06:06:32 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id r4sm3552835qtc.66.2021.08.06.06.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 06:06:32 -0700 (PDT)
Message-ID: <1c51f2a19b2327d9e7681fcff505c6afbc02244a.camel@linaro.org>
Subject: Re: [PATCH v7 04/10] hw/intc: GICv3 ITS Command processing
From: shashi.mallela@linaro.org
To: Neil Armstrong <narmstrong@baylibre.com>, peter.maydell@linaro.org, 
 leif@nuviainc.com, rad@semihalf.com, mst@redhat.com, imammedo@redhat.com
Date: Fri, 06 Aug 2021 09:06:31 -0400
In-Reply-To: <ee0883cc-fffe-28cd-47e5-bc313263128d@baylibre.com>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-5-shashi.mallela@linaro.org>
 <ee0883cc-fffe-28cd-47e5-bc313263128d@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for sharing the observations Neil.
Will take care of it in the next patch-set.

On Fri, 2021-08-06 at 10:58 +0200, Neil Armstrong wrote:
> Hi,
> 
> On 06/08/2021 00:29, Shashi Mallela wrote:
> > Added ITS command queue handling for MAPTI,MAPI commands,handled
> > ITS
> > translation which triggers an LPI via INT command as well as write
> > to GITS_TRANSLATER register,defined enum to differentiate between
> > ITS
> > command interrupt trigger and GITS_TRANSLATER based interrupt
> > trigger.
> > Each of these commands make use of other functionalities
> > implemented to
> > get device table entry,collection table entry or interrupt
> > translation
> > table entry required for their processing.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_its.c            | 348
> > +++++++++++++++++++++++++++++
> >  hw/intc/gicv3_internal.h           |  12 +
> >  include/hw/intc/arm_gicv3_common.h |   2 +
> >  3 files changed, 362 insertions(+)
> > 
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 8bdbebbeca..35308f1c32 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -29,6 +29,22 @@ struct GICv3ITSClass {
> >      void (*parent_reset)(DeviceState *dev);
> >  };
> >  
> > +/*
> > + * This is an internal enum used to distinguish between LPI
> > triggered
> > + * via command queue and LPI triggered via gits_translater write.
> > + */
> > +typedef enum ItsCmdType {
> > +    NONE = 0, /* internal indication for GITS_TRANSLATER write */
> > +    CLEAR = 1,
> > +    DISCARD = 2,
> > +    INT = 3,
> > +} ItsCmdType;
> > +
> > +typedef struct {
> > +    uint32_t iteh;
> > +    uint64_t itel;
> > +} IteEntry;
> > +
> >  static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
> >  {
> >      uint64_t result = 0;
> > @@ -50,6 +66,320 @@ static uint64_t baser_base_addr(uint64_t value,
> > uint32_t page_sz)
> >      return result;
> >  }
> >  
> > +static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t
> > *cte,
> > +                    MemTxResult *res)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t l2t_addr;
> > +    uint64_t value;
> > +    bool valid_l2t;
> > +    uint32_t l2t_id;
> > +    uint32_t max_l2_entries;
> > +
> > +    if (s->ct.indirect) {
> > +        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
> > +
> > +        value = address_space_ldq_le(as,
> > +                                     s->ct.base_addr +
> > +                                     (l2t_id *
> > L1TABLE_ENTRY_SIZE),
> > +                                     MEMTXATTRS_UNSPECIFIED, res);
> > +
> > +        if (*res == MEMTX_OK) {
> > +            valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
> > +
> > +            if (valid_l2t) {
> > +                max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
> > +
> > +                l2t_addr = value & ((1ULL << 51) - 1);
> > +
> > +                *cte =  address_space_ldq_le(as, l2t_addr +
> > +                                    ((icid % max_l2_entries) *
> > GITS_CTE_SIZE),
> > +                                    MEMTXATTRS_UNSPECIFIED, res);
> > +           }
> > +       }
> > +    } else {
> > +        /* Flat level table */
> > +        *cte =  address_space_ldq_le(as, s->ct.base_addr +
> > +                                     (icid * GITS_CTE_SIZE),
> > +                                      MEMTXATTRS_UNSPECIFIED,
> > res);
> > +    }
> > +
> > +    return (*cte & TABLE_ENTRY_VALID_MASK) != 0;
> > +}
> > +
> > +static MemTxResult update_ite(GICv3ITSState *s, uint32_t eventid,
> > uint64_t dte,
> > +                              IteEntry ite)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t itt_addr;
> > +    MemTxResult res = MEMTX_OK;
> > +
> > +    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >>
> > GITS_DTE_ITTADDR_SHIFT;
> > +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> > +
> > +    address_space_stq_le(as, itt_addr + (eventid *
> > sizeof(uint64_t)),
> > +                         ite.itel, MEMTXATTRS_UNSPECIFIED, &res);
> > +
> > +    if (res == MEMTX_OK) {
> > +        address_space_stl_le(as, itt_addr + ((eventid +
> > sizeof(uint64_t)) *
> > +                             sizeof(uint32_t)), ite.iteh,
> > +                             MEMTXATTRS_UNSPECIFIED, &res);
> 
> While adding support for ITS on Zephyr, I've spotted an issue with
> the ITE entry storage here.
> 
> From eventid 0 to 7, it goes well, but from 8 and all even eventids,
> the table gets trashed.
> 
> The actual storage is:
> 
> itel: itt_addr + (eventid * 8)
> iteh: itt_addr + ((eventid + 8) * 4)
> 
> For the first eventIDs, the offsets are:
> 
> EvenID  itel    iteh
> 0	0	32
> 1	8	36
> 2	16	40
> 3	24	44
> 4	32	48
> 5	40	52
> 6	48	56
> 7	56	60
> 8	64	64	<= the entry 8 simply disappears
> 9	72	68
> 10	80	72	<= trashed 9
> 11	88	76
> 12	96	80	<= trashes 10
> 
> and so on.
> 
> The correct storage would be:
> 
>     address_space_stq_le(as, itt_addr + (eventid * (sizeof(uint64_t)
> + sizeof(uint32_t))),
>                          itel, MEMTXATTRS_UNSPECIFIED, &res);
> 
>     if (res == MEMTX_OK) {
>         address_space_stl_le(as, itt_addr + (eventid *
> (sizeof(uint64_t) + sizeof(uint32_t))) +
> 			 sizeof(uint32_t), iteh,
> MEMTXATTRS_UNSPECIFIED,
>                              &res);
>     }
> 
> To store iteh right after itel.
> 
> > +    }
> > +   return res;
> > +}
> > +
> > +static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t
> > dte,
> > +                    uint16_t *icid, uint32_t *pIntid, MemTxResult
> > *res)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t itt_addr;
> > +    bool status = false;
> > +    IteEntry ite = {};
> > +
> > +    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >>
> > GITS_DTE_ITTADDR_SHIFT;
> > +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> > +
> > +    ite.itel = address_space_ldq_le(as, itt_addr +
> > +                                    (eventid * sizeof(uint64_t)),
> > +                                    MEMTXATTRS_UNSPECIFIED, res);
> > +
> > +    if (*res == MEMTX_OK) {
> > +        ite.iteh = address_space_ldl_le(as, itt_addr + ((eventid +
> > +                                    sizeof(uint64_t)) *
> > sizeof(uint32_t)),
> > +                                    MEMTXATTRS_UNSPECIFIED, res);
> 
> Same here:
>     itel = address_space_ldq_le(as, itt_addr + (eventid *
> (sizeof(uint64_t) + sizeof(uint32_t))),
>                                 MEMTXATTRS_UNSPECIFIED, res);
> 
>     if (*res == MEMTX_OK) {
>         iteh = address_space_ldl_le(as, itt_addr + (eventid *
> (sizeof(uint64_t) + sizeof(uint32_t))) + sizeof(uint32_t),
>                                     MEMTXATTRS_UNSPECIFIED, res);
> 
> > +
> > +        if (*res == MEMTX_OK) {
> > +            if (ite.itel & TABLE_ENTRY_VALID_MASK) {
> > +                if ((ite.itel >> ITE_ENTRY_INTTYPE_SHIFT) &
> > +                    GITS_TYPE_PHYSICAL) {
> > +                    *pIntid = (ite.itel & ITE_ENTRY_INTID_MASK) >>
> > +                               ITE_ENTRY_INTID_SHIFT;
> > +                    *icid = ite.iteh & ITE_ENTRY_ICID_MASK;
> > +                    status = true;
> > +                }
> > +            }
> > +        }
> > +    }
> > +    return status;
> > +}
> > +
> 
> This fixes the issue I see when mapping multiple eventIDs, then
> trying to exercise them with the INT command.
> 
> Thanks,
> Neil


