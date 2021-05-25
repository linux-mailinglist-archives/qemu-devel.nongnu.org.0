Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D82390848
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:59:41 +0200 (CEST)
Received: from localhost ([::1]:43682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbLA-0002g7-3U
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1llbJe-0000dI-JB
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:58:06 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:37837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1llbJb-0004Ez-17
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:58:06 -0400
Received: by mail-qk1-x72b.google.com with SMTP id i67so31291201qkc.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 10:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cWYKrMXHchbwLe8syGiiZhEEaZJks81DwILrO/00W6M=;
 b=GMaQiYNAN5DqGtKXbgIn7iJn80wi6gPZbuOLtPMYfuQfNikzXJ0e3uU03Y/DBpx/2r
 FxtdU5IxpWeZScNj1pZSvEp14lU5CBqqLLhRzIC8UB54Ij+GAIj0XJvH8Ozn2TE1G1en
 lQjthL8+xdHAsnGXn4PSUOTolkJOWaW5L1NSpLuJ5sGa5TZucdhMIUaGJ6B5aa0xaRPg
 7xGtHnpDLNNN+6W7dTGbZi8wCM1Ijd9AU205digvLyeXixud/MolM/th/KR58MuXtvQB
 mQwITxQ5CYg+LtQcxSi3+3yDbt2ASXri4OdrViaomKHvTMB2ZGGR9gEEDVQoql6X6jHj
 K/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cWYKrMXHchbwLe8syGiiZhEEaZJks81DwILrO/00W6M=;
 b=OdiEUvePbzpevi/bv9JDNVvW+SL2eyG9r0x+/l2Wj8lK3yzUhYmLvYO5csltlhPmqp
 f/KgNv8JA8EQBgZOzynCXT8z810TFcA+gcUGw9xIcoUAMcPsNhwPic/Hgu0fRGihQzad
 6vGlHnRd74JIZs+F4TBzlcHKb/tQCNkhvKog7Qt+3FuljrbBQ/7gqT23iIEOSpju7b9R
 LcJY4KWasky1QMqIvbbDXEjy2yvkTXpHNjqFEFF7OABjhG0svc0/K8d7+TXa9UoQQDA+
 G+bjnJx2ibHF6C5++TGljJosrp8FIXsl9VuYgsDqOnUmorC2PGC4STozKIV0ZiTre0h6
 Lq3A==
X-Gm-Message-State: AOAM531ZeXpODi5tJm1oAr1w1d8AKHVstWAkP52jSIrDOxbJ/PVLis6J
 GORqwwB7XU6xzQH7xOO1GKN9nQ==
X-Google-Smtp-Source: ABdhPJwE3TzfeXbr8UvxhmoFQ8MD2+K7uDmYy9FAQAa+/oi6PDl8BWXQvnkeYoXmEV/ew1Wjh5cQrw==
X-Received: by 2002:a05:620a:52f:: with SMTP id
 h15mr36532247qkh.40.1621965481927; 
 Tue, 25 May 2021 10:58:01 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id j62sm5608842qkf.125.2021.05.25.10.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 10:58:01 -0700 (PDT)
Message-ID: <729f736c48b51023a0c85bb83f223915bef53898.camel@linaro.org>
Subject: Re: [PATCH v3 6/8] hw/intc: GICv3 redistributor ITS processing
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 13:58:00 -0400
In-Reply-To: <CAFEAcA_GhRkfYgNpu+QDZEKr-HNUCx5Zq5JTF+DrWsKLd+p3PA@mail.gmail.com>
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <20210429234201.125565-7-shashi.mallela@linaro.org>
 <CAFEAcA_GhRkfYgNpu+QDZEKr-HNUCx5Zq5JTF+DrWsKLd+p3PA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have taken care of all comments ,except one with my inline response

On Thu, 2021-05-20 at 12:01 +0100, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <
> shashi.mallela@linaro.org> wrote:
> > Implemented lpi processing at redistributor to get lpi config info
> > from lpi configuration table,determine priority,set pending state
> > in
> > lpi pending table and forward the lpi to cpuif.Added logic to
> > invoke
> > redistributor lpi processing with translated LPI which set/clear
> > LPI
> > from ITS device as part of ITS INT,CLEAR,DISCARD command and
> > GITS_TRANSLATER processing.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3.c        |   6 ++
> >  hw/intc/arm_gicv3_cpuif.c  |  20 ++++--
> >  hw/intc/arm_gicv3_its.c    |  12 ++--
> >  hw/intc/arm_gicv3_redist.c | 133
> > +++++++++++++++++++++++++++++++++++++
> >  hw/intc/gicv3_internal.h   |   9 +++
> >  5 files changed, 171 insertions(+), 9 deletions(-)
> > 
> > diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> > index 66eaa97198..618fa1af95 100644
> > --- a/hw/intc/arm_gicv3.c
> > +++ b/hw/intc/arm_gicv3.c
> > @@ -166,6 +166,12 @@ static void
> > gicv3_redist_update_noirqset(GICv3CPUState *cs)
> >          cs->hppi.grp = gicv3_irq_group(cs->gic, cs, cs->hppi.irq);
> >      }
> > 
> > +    if (cs->gic->lpi_enable) {
> > +        if (gicv3_redist_update_lpi(cs)) {
> > +            seenbetter = true;
> > +        }
> > +    }
> > +
> 
> I'm not sure if this call is in the right place. This function
> (gicv3_redist_update_noirqset()) is specifically for when state
> in the *redistributor* has changed, and it is trying to be a fast
> path for "we know that only the redistributor state has changed,
> so we might be able to find the new best interrupt by looking only
> at the redistributor state". It has a fallback case at the bottom
> of the function for "the redistributor state changed such that
> we have to actually look at the whole of the GIC state to find
> the new best interrupt".
>
> The placement of this call is along the lines of SGI,PPI interrupt
> handling in the redistributor wherein at the end of each of PPI.SGI 
> (and also gicv3_redist_process_lpi())interrupt functions 
> gicv3_redist_update() is called which internally calls 
> gicv3_redist_update_noirqset() to determine the highest priority 
> interrupt between SGI,PPI.So,i added this call here so that LPIs are 
> also included in determining the highest priority interrupt between 
> pending SGI,PPI,LPI.
> On the other hand if LPI pending interrupt was deferred until whole 
> GIC scan,in the current implementation the whole GIC scanning 
> fallback case could be skipped when either of SGI or PPI are 
> found,thereby not even considering LPI interrupt priorities.
>
> 
> >      /* If the best interrupt we just found would preempt whatever
> >       * was the previous best interrupt before this update, then
> >       * we know it's definitely the best one now.
> > diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> > index 43ef1d7a84..11b1df5b6b 100644
> > --- a/hw/intc/arm_gicv3_cpuif.c
> > +++ b/hw/intc/arm_gicv3_cpuif.c
> > @@ -899,9 +899,14 @@ static void icc_activate_irq(GICv3CPUState
> > *cs, int irq)
> >          cs->gicr_ipendr0 = deposit32(cs->gicr_ipendr0, irq, 1, 0);
> >          gicv3_redist_update(cs);
> >      } else {
> > -        gicv3_gicd_active_set(cs->gic, irq);
> > -        gicv3_gicd_pending_clear(cs->gic, irq);
> > -        gicv3_update(cs->gic, irq, 1);
> > +        if (irq >= GICV3_LPI_INTID_START) {
> > +            gicv3_redist_lpi_pending(cs, irq, 0);
> > +            gicv3_redist_update(cs);
> > +        } else {
> > +            gicv3_gicd_active_set(cs->gic, irq);
> > +            gicv3_gicd_pending_clear(cs->gic, irq);
> > +            gicv3_update(cs->gic, irq, 1);
> > +        }
> 
> Don't nest this if(), instead write the whole ladder at the same
> nesting depth:
>     if (irq < GIC_INTERNAL) {
>         handle internal irq;
>     } else if (irq < GICV3_LPI_INTID_START) {
>         handle normal irq;
>     } else {
>         handle LPI;
>     }
> 
> >      }
> >  }
> > 
> > @@ -1328,7 +1333,8 @@ static void icc_eoir_write(CPUARMState *env,
> > const ARMCPRegInfo *ri,
> >          }
> >      }
> > 
> > -    if (irq >= cs->gic->num_irq) {
> > +    if ((irq >= cs->gic->num_irq) && (!(cs->gic->lpi_enable &&
> > +        (irq >= GICV3_LPI_INTID_START)))) {
> >          /* This handles two cases:
> >           * 1. If software writes the ID of a spurious interrupt
> > [ie 1020-1023]
> >           * to the GICC_EOIR, the GIC ignores that write.
> > @@ -1348,7 +1354,11 @@ static void icc_eoir_write(CPUARMState *env,
> > const ARMCPRegInfo *ri,
> > 
> >      if (!icc_eoi_split(env, cs)) {
> >          /* Priority drop and deactivate not split: deactivate irq
> > now */
> > -        icc_deactivate_irq(cs, irq);
> > +        if (irq >= GICV3_LPI_INTID_START) {
> > +            gicv3_update(cs->gic, irq, 1);
> 
> This doesn't look right. You're not actually doing anything here for
> an LPI interrupt, so you shouldn't need to call gicv3_update().
> 
> > +        } else {
> > +            icc_deactivate_irq(cs, irq);
> > +        }
> >      }
> >  }
> > 
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 98c984dd22..28da2d1d77 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -219,6 +219,7 @@ static MemTxResult process_int(GICv3ITSState
> > *s, uint64_t value,
> >      bool ite_valid = false;
> >      uint64_t cte = 0;
> >      bool cte_valid = false;
> > +    uint64_t rdbase;
> >      uint64_t itel = 0;
> >      uint32_t iteh = 0;
> > 
> > @@ -275,10 +276,13 @@ static MemTxResult process_int(GICv3ITSState
> > *s, uint64_t value,
> >           * command in the queue
> >           */
> >      } else {
> > -        /*
> > -         * Current implementation only supports rdbase == procnum
> > -         * Hence rdbase physical address is ignored
> > -         */
> > +        rdbase = (cte >> 1U) & RDBASE_PROCNUM_MASK;
> > +        if ((cmd == CLEAR) || (cmd == DISCARD)) {
> > +            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase],
> > pIntid, 0);
> > +        } else {
> > +            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase],
> > pIntid, 1);
> > +        }
> 
> You need to check that rdbase is actually within the range of the
> number of CPUs here, otherwise you might access the cpu[] array
> out of bounds.
> 
> > +
> >          if (cmd == DISCARD) {
> >              /* remove mapping from interrupt translation table */
> >              res = update_ite(s, eventid, dte, itel, iteh);
> > diff --git a/hw/intc/arm_gicv3_redist.c
> > b/hw/intc/arm_gicv3_redist.c
> > index 7604ccdc83..82ca9d71e5 100644
> > --- a/hw/intc/arm_gicv3_redist.c
> > +++ b/hw/intc/arm_gicv3_redist.c
> > @@ -256,6 +256,8 @@ static MemTxResult gicr_writel(GICv3CPUState
> > *cs, hwaddr offset,
> >          if (cs->gicr_typer & GICR_TYPER_PLPIS) {
> >              if (value & GICR_CTLR_ENABLE_LPIS) {
> >                  cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
> > +                /* Check for any pending interr in pending table
> > */
> > +                gicv3_redist_update(cs);
> >              } else {
> >                  cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
> >              }
> > @@ -546,6 +548,137 @@ MemTxResult gicv3_redist_write(void *opaque,
> > hwaddr offset, uint64_t data,
> >      return r;
> >  }
> > 
> > +bool gicv3_redist_update_lpi(GICv3CPUState *cs)
> > +{
> > +    /*
> > +     * This function scans the LPI pending table and for each
> > pending
> > +     * LPI, reads the corresponding entry from LPI configuration
> > table
> > +     * to extract the priority info and determine if the LPI
> > priority
> > +     * is lower than the current high priority interrupt.If yes,
> > update
> > +     * high priority pending interrupt to that of LPI.
> > +     */
> 
> I would still like to see some profiling of whether we spend a
> significant
> amount of time in this function...
> 
> > +    AddressSpace *as = &cs->gic->dma_as;
> > +    uint64_t lpict_baddr, lpipt_baddr;
> > +    uint32_t pendt_size = 0;
> > +    uint8_t lpite;
> > +    uint8_t prio, pend;
> > +    int i;
> > +    bool seenbetter = false;
> > +
> > +    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs-
> > >gicr_propbaser ||
> > +        !cs->gicr_pendbaser || (FIELD_EX64(cs->gicr_propbaser,
> > GICR_PROPBASER,
> > +        IDBITS) < GICR_PROPBASER_IDBITS_THRESHOLD)) {
> > +        return seenbetter;
> > +    }
> > +
> > +    lpict_baddr = FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
> > PHYADDR);
> > +    lpict_baddr <<= R_GICR_PROPBASER_PHYADDR_SHIFT;
> > +
> > +    lpipt_baddr =  FIELD_EX64(cs->gicr_pendbaser, GICR_PENDBASER,
> > PHYADDR);
> > +    lpipt_baddr <<= R_GICR_PENDBASER_PHYADDR_SHIFT;
> > +
> > +    /* Determine the highest priority pending interrupt among LPIs
> > */
> > +    pendt_size = (1UL << (FIELD_EX64(cs->gicr_propbaser,
> > GICR_PROPBASER,
> > +                          IDBITS) - 1));
> > +
> > +    for (i = 0; i < pendt_size; i++) {
> > +        address_space_read(as, lpipt_baddr +
> > +                (((GICV3_LPI_INTID_START + i) / 8) *
> > sizeof(pend)),
> > +                MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> > +
> > +        if ((1 << ((GICV3_LPI_INTID_START + i) % 8)) & pend) {
> > +            address_space_read(as, lpict_baddr + (i *
> > sizeof(lpite)),
> > +                      MEMTXATTRS_UNSPECIFIED, &lpite,
> > sizeof(lpite));
> > +
> > +            prio = ((lpite >> LPI_CTE_PRIORITY_OFFSET) &
> > +                     LPI_CTE_PRIORITY_MASK);
> > +            prio &= LPI_PRIORITY_MASK;
> 
> The priority field interpretation depends on whether GICD_CTLR.DS is
> 0 or 1,
> (see section 5.1.1 in the GICv3 spec).
> 
> > +
> > +            if (prio < cs->hppi.prio) {
> > +                cs->hppi.irq = GICV3_LPI_INTID_START + i;
> > +                cs->hppi.prio = prio;
> > +                /* LPIs are always non-secure Grp1 interrupts */
> > +                cs->hppi.grp = GICV3_G1NS;
> > +                seenbetter = true;
> > +            }
> > +        }
> > +    }
> > +    return seenbetter;
> > +}
> > +
> > +void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int
> > level)
> > +{
> > +    AddressSpace *as = &cs->gic->dma_as;
> > +    uint64_t lpipt_baddr;
> > +    bool ispend = false;
> > +    uint8_t pend;
> > +
> > +    /*
> > +     * get the bit value corresponding to this irq in the
> > +     * lpi pending table
> > +     */
> > +    lpipt_baddr = FIELD_EX64(cs->gicr_pendbaser, GICR_PENDBASER,
> > PHYADDR);
> > +    lpipt_baddr <<= R_GICR_PENDBASER_PHYADDR_SHIFT;
> 
> You can write
>   lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
> 
> because the register is laid out deliberately so that bits [51:16] in
> the
> register specify bits [51:16] of the address.
> 
> > +
> > +    address_space_read(as, lpipt_baddr + ((irq / 8) *
> > sizeof(pend)),
> > +                         MEMTXATTRS_UNSPECIFIED, &pend,
> > sizeof(pend));
> > +    ispend = ((pend >> (irq % 8)) & 0x1);
> > +
> > +    if (ispend) {
> > +        if (!level) {
> > +            /*
> > +             * clear the pending bit and update the lpi pending
> > table
> > +             */
> > +            pend &= ~(1 << (irq % 8));
> > +
> > +            address_space_write(as, lpipt_baddr + ((irq / 8) *
> > sizeof(pend)),
> > +                                 MEMTXATTRS_UNSPECIFIED, &pend,
> > sizeof(pend));
> > +        }
> > +    } else {
> > +        if (level) {
> > +            /*
> > +             * if pending bit is not already set for this
> > irq,turn-on the
> > +             * pending bit and update the lpi pending table
> > +             */
> > +            pend |= (1 << (irq % 8));
> > +
> > +            address_space_write(as, lpipt_baddr + ((irq / 8) *
> > sizeof(pend)),
> > +                                 MEMTXATTRS_UNSPECIFIED, &pend,
> > sizeof(pend));
> > +        }
> > +    }
> > +}
> > +
> > +void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int
> > level)
> > +{
> > +    AddressSpace *as = &cs->gic->dma_as;
> > +    uint64_t lpict_baddr;
> > +    uint8_t lpite;
> > +
> > +    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs-
> > >gicr_propbaser ||
> > +         !cs->gicr_pendbaser || (FIELD_EX64(cs->gicr_propbaser,
> > GICR_PROPBASER,
> > +         IDBITS) < GICR_PROPBASER_IDBITS_THRESHOLD)) {
> > +        return;
> > +    }
> 
> Something needs to be checking for "attempt to work with an interrupt
> number that is too large according to either GICR_PROPBASER.IDbits or
> GICD_TYPER.IDbits". You could do it either in this function or in the
> callers; doing it here is probably as good as anywhere.
> 
> > +    lpict_baddr = FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
> > PHYADDR);
> > +    lpict_baddr <<= R_GICR_PROPBASER_PHYADDR_SHIFT;
> > +
> > +    /* get the lpi config table entry corresponding to this irq */
> > +    address_space_read(as, lpict_baddr + ((irq -
> > GICV3_LPI_INTID_START) *
> > +                        sizeof(lpite)), MEMTXATTRS_UNSPECIFIED,
> > +                        &lpite, sizeof(lpite));
> > +
> > +    /* check if this irq is enabled before proceeding further */
> > +    if (!(lpite & LPI_CTE_ENABLED)) {
> > +        return;
> > +    }
> > +
> > +    /* set/clear the pending bit for this irq */
> > +    gicv3_redist_lpi_pending(cs, irq, level);
> > +
> > +    gicv3_redist_update(cs);
> > +}
> > +
> >  void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
> >  {
> >      /* Update redistributor state for a change in an external PPI
> > input line */
> 
> thanks
> -- PMM


