Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C33AA5F4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:09:32 +0200 (CEST)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcmx-0004XJ-Qe
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1ltcgX-0000Jl-L9
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 17:02:54 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:44592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1ltcgS-00049L-3S
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 17:02:52 -0400
Received: by mail-qt1-x833.google.com with SMTP id d9so2987528qtp.11
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 14:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+wHhPF9KEzZpC6npIdsqiHtmlrvkPZr+7MQPyy5PfQ=;
 b=Ph9tjUTHJB39kB3PqIqyX0zNeA6BF+ZPQZM5Gujt+hlVwbTBgBgQip2JkxNlybuL6/
 BLBjzPeBDNvJ+G1eczt2nwCTXoi0BC1B6/JljK2FIcM/QLnlsQsBdFgt9mI3tp+ZgrNh
 TKtnunt/W6nB6G//BA1/ryiSLw/jcbTvCmZFvzWFD4zOAzCBW3swFpRs+Lt7BQvWQd98
 7qhgeagDy0sAmZFukaPwbtsTFjYbf6oayx150scCKCoL/DM0k4fbbNxDwm+5KQOopz5i
 H0Q5/DCv2m0XETwdw4nCNopBV2ym9iFDf4eQfAta32mBejnThuQLypfF2toLABJJt4bo
 KN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+wHhPF9KEzZpC6npIdsqiHtmlrvkPZr+7MQPyy5PfQ=;
 b=m7Ywo6B/oloESOqLozoBybVtt6vETg4wD+zp6hF6pN9tcBZg2V/Ltg5ORv9+tPkKwo
 VtNy9ga6xWuzqgLkpuWODhby04CZ+uV4nT55psEF4jf5mBEKXUQuctsSlrzp6kYlopWs
 CNANEYU1xfPMpUUH3ZQ8qZyZyH/6iUDFw42fziGNIZg4WKbfAuz2V0bl4NuZSU9pmoQJ
 U3CU3+9ieKjipWJ75I8N7Tkq6AMQ3p9i2ViPFxWPrDu7cdvQRHEbwRlfmOJQiVQVxTLS
 fm0n4j0huO8EqWYp0Mtl9tjqXKsvE/wGdTM2oGYheZRB/XUXwAeImVZNXo1jO9hOhn3Y
 EyZg==
X-Gm-Message-State: AOAM530jZxuoFyHxoWjhpQbkQsj6sivWfi3B8kBOUXcK+KDjaD6yguFb
 VZK1fXEsExbLaENhfnzGPQgb5w==
X-Google-Smtp-Source: ABdhPJw0kUNbu5J2dm4TglsMgXwMbnBOOHcTuHYX1IMvTMqfkH45q4u6823HqClUCAfE/R5U0O3MVw==
X-Received: by 2002:ac8:1285:: with SMTP id y5mr1799411qti.322.1623877366975; 
 Wed, 16 Jun 2021 14:02:46 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id f2sm1946712qtk.54.2021.06.16.14.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:02:46 -0700 (PDT)
Message-ID: <b491e28bf8c573af9ca2bf4cf08d2dfebc06e243.camel@linaro.org>
Subject: Re: [PATCH v4 6/8] hw/intc: GICv3 redistributor ITS processing
From: shashi.mallela@linaro.org
To: Eric Auger <eauger@redhat.com>, peter.maydell@linaro.org,
 leif@nuviainc.com,  rad@semihalf.com
Date: Wed, 16 Jun 2021 17:02:45 -0400
In-Reply-To: <1c9344ff-287b-6b95-06fe-e246cc0ace1a@redhat.com>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-7-shashi.mallela@linaro.org>
 <1c9344ff-287b-6b95-06fe-e246cc0ace1a@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x833.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

Have accepted all comments with responses inline (below):-

On Sun, 2021-06-13 at 18:26 +0200, Eric Auger wrote:
> Hi Shashi,
> 
> On 6/2/21 8:00 PM, Shashi Mallela wrote:
> > Implemented lpi processing at redistributor to get lpi config info
> s/Implemented/Implement here are elsewhere.
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
> >  hw/intc/arm_gicv3.c                |   9 ++
> >  hw/intc/arm_gicv3_common.c         |   1 +
> >  hw/intc/arm_gicv3_cpuif.c          |   7 +-
> >  hw/intc/arm_gicv3_its.c            |  14 ++-
> >  hw/intc/arm_gicv3_redist.c         | 145
> > +++++++++++++++++++++++++++++
> >  hw/intc/gicv3_internal.h           |  10 ++
> >  include/hw/intc/arm_gicv3_common.h |  10 ++
> >  7 files changed, 190 insertions(+), 6 deletions(-)
> > 
> > diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> > index d63f8af604..4d19190b9c 100644
> > --- a/hw/intc/arm_gicv3.c
> > +++ b/hw/intc/arm_gicv3.c
> > @@ -165,6 +165,15 @@ static void
> > gicv3_redist_update_noirqset(GICv3CPUState *cs)
> >          cs->hppi.grp = gicv3_irq_group(cs->gic, cs, cs->hppi.irq);
> >      }
> >  
> > +    if (cs->gic->lpi_enable && cs->lpivalid) {
> > +        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
> > +            cs->hppi.irq = cs->hpplpi.irq;
> > +            cs->hppi.prio = cs->hpplpi.prio;
> > +            cs->hppi.grp = cs->hpplpi.grp;
> > +            seenbetter = true;
> > +        }
> > +    }
> > +
> >      /* If the best interrupt we just found would preempt whatever
> >       * was the previous best interrupt before this update, then
> >       * we know it's definitely the best one now.
> > diff --git a/hw/intc/arm_gicv3_common.c
> > b/hw/intc/arm_gicv3_common.c
> > index 53dea2a775..223db16fec 100644
> > --- a/hw/intc/arm_gicv3_common.c
> > +++ b/hw/intc/arm_gicv3_common.c
> > @@ -435,6 +435,7 @@ static void arm_gicv3_common_reset(DeviceState
> > *dev)
> >          memset(cs->gicr_ipriorityr, 0, sizeof(cs-
> > >gicr_ipriorityr));
> >  
> >          cs->hppi.prio = 0xff;
> > +        cs->hpplpi.prio = 0xff;
> >  
> >          /* State in the CPU interface must *not* be reset here,
> > because it
> >           * is part of the CPU's reset domain, not the GIC
> > device's.
> > diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> > index 81f94c7f4a..5be3efaa3f 100644
> > --- a/hw/intc/arm_gicv3_cpuif.c
> > +++ b/hw/intc/arm_gicv3_cpuif.c
> > @@ -898,10 +898,12 @@ static void icc_activate_irq(GICv3CPUState
> > *cs, int irq)
> >          cs->gicr_iactiver0 = deposit32(cs->gicr_iactiver0, irq, 1,
> > 1);
> >          cs->gicr_ipendr0 = deposit32(cs->gicr_ipendr0, irq, 1, 0);
> >          gicv3_redist_update(cs);
> > -    } else {
> > +    } else if (irq < GICV3_LPI_INTID_START) {
> >          gicv3_gicd_active_set(cs->gic, irq);
> >          gicv3_gicd_pending_clear(cs->gic, irq);
> >          gicv3_update(cs->gic, irq, 1);
> > +    } else {
> > +        gicv3_redist_lpi_pending(cs, irq, 0);
> >      }
> >  }
> >  
> > @@ -1317,7 +1319,8 @@ static void icc_eoir_write(CPUARMState *env,
> > const ARMCPRegInfo *ri,
> >      trace_gicv3_icc_eoir_write(is_eoir0 ? 0 : 1,
> >                                 gicv3_redist_affid(cs), value);
> >  
> > -    if (irq >= cs->gic->num_irq) {
> > +    if ((irq >= cs->gic->num_irq) &&  (!(cs->gic->lpi_enable &&
> > +        (irq >= GICV3_LPI_INTID_START)))) {
> >          /* This handles two cases:
> >           * 1. If software writes the ID of a spurious interrupt
> > [ie 1020-1023]
> >           * to the GICC_EOIR, the GIC ignores that write.
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 0a978cf55b..e0fbd4041f 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -211,6 +211,7 @@ static MemTxResult process_int(GICv3ITSState
> > *s, uint64_t value,
> >      bool ite_valid = false;
> >      uint64_t cte = 0;
> >      bool cte_valid = false;
> > +    uint64_t rdbase;
> >      uint64_t itel = 0;
> >      uint32_t iteh = 0;
> >  
> > @@ -267,10 +268,15 @@ static MemTxResult process_int(GICv3ITSState
> > *s, uint64_t value,
> >           * command in the queue
> >           */
> >      } else {
> > -        /*
> > -         * Current implementation only supports rdbase == procnum
> > -         * Hence rdbase physical address is ignored
> > -         */
> > +        rdbase = (cte >> 1U) & RDBASE_PROCNUM_MASK;
> > +        assert(rdbase <= s->gicv3->num_cpu);
> > +
> > +        if ((cmd == CLEAR) || (cmd == DISCARD)) {
> > +            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase],
> > pIntid, 0);
> > +        } else {
> > +            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase],
> > pIntid, 1);
> > +        }
> > +
> >          if (cmd == DISCARD) {
> >              /* remove mapping from interrupt translation table */
> >              res = update_ite(s, eventid, dte, itel, iteh);
> > diff --git a/hw/intc/arm_gicv3_redist.c
> > b/hw/intc/arm_gicv3_redist.c
> > index fb9a4ee3cc..bfc6e4e9b9 100644
> > --- a/hw/intc/arm_gicv3_redist.c
> > +++ b/hw/intc/arm_gicv3_redist.c
> > @@ -255,6 +255,11 @@ static MemTxResult gicr_writel(GICv3CPUState
> > *cs, hwaddr offset,
> >          if (cs->gicr_typer & GICR_TYPER_PLPIS) {
> >              if (value & GICR_CTLR_ENABLE_LPIS) {
> >                  cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
> > +                /* Check for any pending interr in pending table
> > */
> > +                cs->lpivalid = false;
> > +                cs->hpplpi.prio = 0xff;
> > +                gicv3_redist_update_lpi(cs);
> > +                gicv3_redist_update(cs);
> >              } else {
> >                  cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
> >              }
> > @@ -534,6 +539,146 @@ MemTxResult gicv3_redist_write(void *opaque,
> > hwaddr offset, uint64_t data,
> >      return r;
> >  }
> >  
> > +void gicv3_redist_update_lpi(GICv3CPUState *cs)
> > +{
> > +    /*
> > +     * This function scans the LPI pending table and for each
> > pending
> > +     * LPI, reads the corresponding entry from LPI configuration
> > table
> > +     * to extract the priority info and determine if the LPI
> > priority
> > +     * is lower than the current high priority interrupt.If yes,
> > update> +     * high priority pending interrupt to that of LPI.
> 
> "update high priority pending interrupt to that of LPI" may need some
> rewording
Will do
> > +     */
> > +    AddressSpace *as = &cs->gic->dma_as;
> > +    uint64_t lpict_baddr, lpipt_baddr;
> > +    uint32_t pendt_size = 0;
> > +    uint8_t lpite;
> > +    uint8_t prio, pend;
> > +    int i;
> > +    uint64_t idbits;
> > +
> > +    idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
> > IDBITS),
> > +                 GICD_TYPER_IDBITS);
> > +
> > +    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs-
> > >gicr_propbaser ||
> > +        !cs->gicr_pendbaser || (idbits <
> > GICR_PROPBASER_IDBITS_THRESHOLD)) {
> > +        return;
> > +    }
> > +
> > +    lpict_baddr = cs->gicr_propbaser &
> > R_GICR_PROPBASER_PHYADDR_MASK;
> > +
> > +    lpipt_baddr = cs->gicr_pendbaser &
> > R_GICR_PENDBASER_PHYADDR_MASK;
> > +
> > +    /* Determine the highest priority pending interrupt among LPIs
> > */
> > +    pendt_size = (1ULL << (idbits + 1));
> > +
> > +    for (i = 0; i < pendt_size / 8; i++) {
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
> > +            if (!(lpite & LPI_CTE_ENABLED)) {
> > +                continue;
> > +            }
> > +
> > +            if (cs->gic->gicd_ctlr & GICD_CTLR_DS) {
> > +                prio = lpite & LPI_PRIORITY_MASK;
> > +            } else {
> > +                prio = lpite & LPI_SPRIORITY_MASK;
> > +            }
> > +
> > +            if (prio <= cs->hpplpi.prio) {
> > +                cs->hpplpi.irq = GICV3_LPI_INTID_START + i;
> > +                cs->hpplpi.prio = prio;
> > +                /* LPIs are always non-secure Grp1 interrupts */
> > +                cs->hpplpi.grp = GICV3_G1NS;
> > +                cs->lpivalid = true;
> > +            }
> > +        }
> > +    }
> > +}
> > +
> nit: add a comment to explain what the function does, that's not
> straightforward gievn its name.
Will do
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
> > +    lpipt_baddr = cs->gicr_pendbaser &
> > R_GICR_PENDBASER_PHYADDR_MASK;
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
> > +    cs->lpivalid = false;
> > +    cs->hpplpi.prio = 0xff;
> > +    gicv3_redist_update_lpi(cs);
> > +}
> > +
> > +void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int
> > level)
> > +{
> > +    AddressSpace *as = &cs->gic->dma_as;
> > +    uint64_t lpict_baddr;
> > +    uint8_t lpite;
> > +    uint64_t idbits;
> > +
> > +    idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
> > IDBITS),
> > +                 GICD_TYPER_IDBITS);
> > +
> > +    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs-
> > >gicr_propbaser ||
> > +         !cs->gicr_pendbaser || (idbits <
> > GICR_PROPBASER_IDBITS_THRESHOLD) ||
> > +         (irq > (1ULL << (idbits + 1)))) {
> > +        return;
> > +    }
> > +
> > +    lpict_baddr = cs->gicr_propbaser &
> > R_GICR_PROPBASER_PHYADDR_MASK;
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
> > diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> > index 91dbe01176..bcbccba573 100644
> > --- a/hw/intc/gicv3_internal.h
> > +++ b/hw/intc/gicv3_internal.h
> > @@ -308,6 +308,13 @@ FIELD(GITS_TYPER, CIL, 36, 1)
> >  
> >  #define L1TABLE_ENTRY_SIZE         8
> >  
> > +#define LPI_CTE_ENABLE_OFFSET      0
> > +#define LPI_CTE_ENABLED          VALID_MASK
> > +#define LPI_CTE_PRIORITY_OFFSET    2
> > +#define LPI_CTE_PRIORITY_MASK     ((1U << 6) - 1)
> > +#define LPI_PRIORITY_MASK         0xfc
> > +#define LPI_SPRIORITY_MASK        0x7e
> > +
> >  #define GITS_CMDQ_ENTRY_SIZE               32
> >  #define NUM_BYTES_IN_DW                     8
> >  
> > @@ -452,6 +459,9 @@ MemTxResult gicv3_redist_write(void *opaque,
> > hwaddr offset, uint64_t data,
> >                                 unsigned size, MemTxAttrs attrs);
> >  void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
> >  void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
> > +void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int
> > level);
> > +void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int
> > level);
> > +void gicv3_redist_update_lpi(GICv3CPUState *cs);
> >  void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq,
> > bool ns);
> >  void gicv3_init_cpuif(GICv3State *s);
> >  
> > diff --git a/include/hw/intc/arm_gicv3_common.h
> > b/include/hw/intc/arm_gicv3_common.h
> > index c1348cc60a..5d839da9c9 100644
> > --- a/include/hw/intc/arm_gicv3_common.h
> > +++ b/include/hw/intc/arm_gicv3_common.h
> > @@ -204,6 +204,16 @@ struct GICv3CPUState {
> >       * real state above; it doesn't need to be migrated.
> >       */
> >      PendingIrq hppi;
> > +
> > +    /*
> > +     * Current highest priority pending lpi for this CPU.
> > +     * This is cached information that can be recalculated from
> > the
> > +     * real state above; it doesn't need to be migrated.
> > +     */
> > +    PendingIrq hpplpi;
> > +
> > +    bool lpivalid; /* current highest priority lpi validity status
> > */
> > +
> >      /* This is temporary working state, to avoid a malloc in
> > gicv3_update() */
> >      bool seenbetter;
> >  };>
> 
> Thanks
> 
> Eric
> 


