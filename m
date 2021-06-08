Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C874A39F84C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:00:26 +0200 (CEST)
Received: from localhost ([::1]:44094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcHJ-0002LS-R5
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqcFa-0007zP-Kz
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:58:38 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqcFX-0003Dd-K1
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:58:38 -0400
Received: by mail-ed1-x52c.google.com with SMTP id r7so10224274edv.12
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 06:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=834298Gw/zibEh7v0BnVyZyaOuvaq5pQeQ6C9+8mGyo=;
 b=mIk828B9fG5nKLRculm72iOWeUDN/PedsDOWcAQTcca2GjxHBar0UrXh/Jh3EI91od
 R+pw36HDKT9LGMXg/leaLpmaWRCiL5k9wy6sS57cUWeeGjiLY9bQVHqdYp3SvsqntBlv
 A5yBluewDLrs0sMWpk8guQDPE+ugzh0U6x2OXDl1P2gIEK2jrkTp/sXp2SjiWLdEuJYL
 WF6+AR5L2nRpIMSPGk6rEyf/ZXjILjW55X4prnicCHbNgL6sVdMTPStxXMj2EjK4LTuj
 0y0+lo7nz+2z6DHXOmhS9rOiRxQweCxWeFdcWuxtDgbZYtr55sF8lB4zC+e+yXwORlTf
 DEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=834298Gw/zibEh7v0BnVyZyaOuvaq5pQeQ6C9+8mGyo=;
 b=RXC2D5H14OwQerdsYtcMz4GsbYPtWq1qWQ10JDVRTazbwcZbRRvSVVUUyDUkNBQ6vE
 Lc3kMsRTcpOpnBoagdpmsEJLCtMXWc4fO/Rpjum4f8kyxPcEI5/zUVzwyFxVFJu0vveg
 wdQ/BPqfkVzXekAB4NWCI8EvIv83W7U/b3s5LuBS0Uxki0KIuin43kmnurcD+92fy4nG
 kLeYEU811gzxgCInY9OJeo4xZ05cI3qWUTVTWLNQTjCWx0/Oq1xg4r0FRKwrEq5N/4nO
 yndMP12nhA50WrrHaxXY1fQVtQ7So2XOXhzUcVKt+TK6RwYdAV629ipGD7BqRcDkwubQ
 u6hA==
X-Gm-Message-State: AOAM533L8oxS9IiUrfWAzxhVveTd7IZt7fRcj9fyQH3ru5awYpjq/iBT
 ghMu4/HL9ci4Qez3CZhYzVomy5IaJKyy3vSkTwl+LQ==
X-Google-Smtp-Source: ABdhPJwz5FMlDa4G9wp5UB/EE8fH66qkIaK66LGgd3rStty6wbd5ixSC5ujArAFUOfQZH+jjXu+cmeMqOWErBIaJIF4=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr25624761edv.204.1623160712213; 
 Tue, 08 Jun 2021 06:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-7-shashi.mallela@linaro.org>
In-Reply-To: <20210602180042.111347-7-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 14:57:58 +0100
Message-ID: <CAFEAcA-=w8WA5o-nnR4VuEDV28n65aCzM9M0Km8yTDGy=NHL+A@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] hw/intc: GICv3 redistributor ITS processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Implemented lpi processing at redistributor to get lpi config info
> from lpi configuration table,determine priority,set pending state in
> lpi pending table and forward the lpi to cpuif.Added logic to invoke
> redistributor lpi processing with translated LPI which set/clear LPI
> from ITS device as part of ITS INT,CLEAR,DISCARD command and
> GITS_TRANSLATER processing.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3.c                |   9 ++
>  hw/intc/arm_gicv3_common.c         |   1 +
>  hw/intc/arm_gicv3_cpuif.c          |   7 +-
>  hw/intc/arm_gicv3_its.c            |  14 ++-
>  hw/intc/arm_gicv3_redist.c         | 145 +++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h           |  10 ++
>  include/hw/intc/arm_gicv3_common.h |  10 ++
>  7 files changed, 190 insertions(+), 6 deletions(-)

The code for finding/updating the best pending LPI looks a lot
better in this version -- thanks for working through that.

An important thing which I hadn't realized previously:
the hpplpi information counts as information cached from the
LPI configuration tables (because it is based on the priority
and enable-bit information from those tables). That means that when
the guest sends the ITS INV or INVALL command we need to throw it
away and recalculate by calling gicv3_redist_update_lpi().
(The idea here is that the guest can validly raise the priority
of an interrupt by the sequence "write to table; INVALL; SYNC",
and we need to correctly figure out that that might mean that
that LPI is now the interrupt we should be taking.)

> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index d63f8af604..4d19190b9c 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -165,6 +165,15 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
>          cs->hppi.grp = gicv3_irq_group(cs->gic, cs, cs->hppi.irq);
>      }
>
> +    if (cs->gic->lpi_enable && cs->lpivalid) {

You don't need a separate lpivalid flag -- you can use
hpplpi.prio == 0xff as your "no pending LPI" indication.
This is how the existing cs->hppi works.
(irqbetter() will always return false if passed an 0xff priority,
so you don't need to special case check anything here.)

> +        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
> +            cs->hppi.irq = cs->hpplpi.irq;
> +            cs->hppi.prio = cs->hpplpi.prio;
> +            cs->hppi.grp = cs->hpplpi.grp;
> +            seenbetter = true;
> +        }
> +    }
> +
>      /* If the best interrupt we just found would preempt whatever
>       * was the previous best interrupt before this update, then
>       * we know it's definitely the best one now.
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 53dea2a775..223db16fec 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -435,6 +435,7 @@ static void arm_gicv3_common_reset(DeviceState *dev)
>          memset(cs->gicr_ipriorityr, 0, sizeof(cs->gicr_ipriorityr));
>
>          cs->hppi.prio = 0xff;
> +        cs->hpplpi.prio = 0xff;
>
>          /* State in the CPU interface must *not* be reset here, because it
>           * is part of the CPU's reset domain, not the GIC device's.
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 81f94c7f4a..5be3efaa3f 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -898,10 +898,12 @@ static void icc_activate_irq(GICv3CPUState *cs, int irq)
>          cs->gicr_iactiver0 = deposit32(cs->gicr_iactiver0, irq, 1, 1);
>          cs->gicr_ipendr0 = deposit32(cs->gicr_ipendr0, irq, 1, 0);
>          gicv3_redist_update(cs);
> -    } else {
> +    } else if (irq < GICV3_LPI_INTID_START) {
>          gicv3_gicd_active_set(cs->gic, irq);
>          gicv3_gicd_pending_clear(cs->gic, irq);
>          gicv3_update(cs->gic, irq, 1);
> +    } else {
> +        gicv3_redist_lpi_pending(cs, irq, 0);
>      }
>  }
>
> @@ -1317,7 +1319,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      trace_gicv3_icc_eoir_write(is_eoir0 ? 0 : 1,
>                                 gicv3_redist_affid(cs), value);
>
> -    if (irq >= cs->gic->num_irq) {
> +    if ((irq >= cs->gic->num_irq) &&  (!(cs->gic->lpi_enable &&
> +        (irq >= GICV3_LPI_INTID_START)))) {

Please put the line break after the first &&, not the second. That means
that you avoid linebreaking in the middle of a () expression.
Also you don't need the () on the outside of the !.

>          /* This handles two cases:
>           * 1. If software writes the ID of a spurious interrupt [ie 1020-1023]
>           * to the GICC_EOIR, the GIC ignores that write.
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 0a978cf55b..e0fbd4041f 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -211,6 +211,7 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
>      bool ite_valid = false;
>      uint64_t cte = 0;
>      bool cte_valid = false;
> +    uint64_t rdbase;
>      uint64_t itel = 0;
>      uint32_t iteh = 0;
>
> @@ -267,10 +268,15 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
>           * command in the queue
>           */
>      } else {
> -        /*
> -         * Current implementation only supports rdbase == procnum
> -         * Hence rdbase physical address is ignored
> -         */
> +        rdbase = (cte >> 1U) & RDBASE_PROCNUM_MASK;
> +        assert(rdbase <= s->gicv3->num_cpu);

We just read cte from guest memory. We mustn't allow guests to
trigger assert()s in QEMU, so if the value is out of range then
we need to handle it by treating the command as invalid, not by crashing.

Also, your bounds-check is off by one; it should be "<", not "<=".

> +
> +        if ((cmd == CLEAR) || (cmd == DISCARD)) {
> +            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
> +        } else {
> +            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
> +        }
> +
>          if (cmd == DISCARD) {
>              /* remove mapping from interrupt translation table */
>              res = update_ite(s, eventid, dte, itel, iteh);
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index fb9a4ee3cc..bfc6e4e9b9 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -255,6 +255,11 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>          if (cs->gicr_typer & GICR_TYPER_PLPIS) {
>              if (value & GICR_CTLR_ENABLE_LPIS) {
>                  cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
> +                /* Check for any pending interr in pending table */
> +                cs->lpivalid = false;
> +                cs->hpplpi.prio = 0xff;
> +                gicv3_redist_update_lpi(cs);
> +                gicv3_redist_update(cs);
>              } else {
>                  cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
>              }
> @@ -534,6 +539,146 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
>      return r;
>  }
>
> +void gicv3_redist_update_lpi(GICv3CPUState *cs)
> +{
> +    /*
> +     * This function scans the LPI pending table and for each pending
> +     * LPI, reads the corresponding entry from LPI configuration table
> +     * to extract the priority info and determine if the LPI priority
> +     * is lower than the current high priority interrupt.If yes, update

Missing space after ".".

> +     * high priority pending interrupt to that of LPI.
> +     */
> +    AddressSpace *as = &cs->gic->dma_as;
> +    uint64_t lpict_baddr, lpipt_baddr;
> +    uint32_t pendt_size = 0;
> +    uint8_t lpite;
> +    uint8_t prio, pend;
> +    int i;
> +    uint64_t idbits;

You should set hpplpi.prio = 0xff; here, so you don't need to do
it at every callsite.

That is, what you're really doing in this function is "recalculate the
hpplpi information from scratch".

> +
> +    idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
> +                 GICD_TYPER_IDBITS);
> +
> +    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||

This is the set of missing brackets that clang complains about: it should
be "!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS)" because ! has higher priority
than &.

> +        !cs->gicr_pendbaser || (idbits < GICR_PROPBASER_IDBITS_THRESHOLD)) {
> +        return;
> +    }
> +
> +    lpict_baddr = cs->gicr_propbaser & R_GICR_PROPBASER_PHYADDR_MASK;
> +
> +    lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
> +
> +    /* Determine the highest priority pending interrupt among LPIs */
> +    pendt_size = (1ULL << (idbits + 1));
> +
> +    for (i = 0; i < pendt_size / 8; i++) {
> +        address_space_read(as, lpipt_baddr +
> +                (((GICV3_LPI_INTID_START + i) / 8) * sizeof(pend)),
> +                MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +
> +        if ((1 << ((GICV3_LPI_INTID_START + i) % 8)) & pend) {

Better written as "if (the pend bit is not set) continue;"

> +            address_space_read(as, lpict_baddr + (i * sizeof(lpite)),
> +                      MEMTXATTRS_UNSPECIFIED, &lpite, sizeof(lpite));
> +
> +            if (!(lpite & LPI_CTE_ENABLED)) {
> +                continue;
> +            }
> +
> +            if (cs->gic->gicd_ctlr & GICD_CTLR_DS) {
> +                prio = lpite & LPI_PRIORITY_MASK;
> +            } else {
> +                prio = lpite & LPI_SPRIORITY_MASK;

This isn't the right calculation. When reading a priority value
when GICD_CTLR.DS is zero, you need to shift it right by one
and set bit 7:
    prio = ((lpite & LPI_PRIORITY_MASK) >> 1) & 0x80;

> +            }
> +
> +            if (prio <= cs->hpplpi.prio) {
> +                cs->hpplpi.irq = GICV3_LPI_INTID_START + i;
> +                cs->hpplpi.prio = prio;
> +                /* LPIs are always non-secure Grp1 interrupts */
> +                cs->hpplpi.grp = GICV3_G1NS;
> +                cs->lpivalid = true;
> +            }
> +        }
> +    }
> +}
> +
> +void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
> +{
> +    AddressSpace *as = &cs->gic->dma_as;
> +    uint64_t lpipt_baddr;
> +    bool ispend = false;
> +    uint8_t pend;
> +
> +    /*
> +     * get the bit value corresponding to this irq in the
> +     * lpi pending table
> +     */
> +    lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
> +
> +    address_space_read(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
> +                         MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +    ispend = ((pend >> (irq % 8)) & 0x1);
> +
> +    if (ispend) {
> +        if (!level) {
> +            /*
> +             * clear the pending bit and update the lpi pending table
> +             */
> +            pend &= ~(1 << (irq % 8));
> +
> +            address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
> +                                 MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +        }
> +    } else {
> +        if (level) {
> +            /*
> +             * if pending bit is not already set for this irq,turn-on the
> +             * pending bit and update the lpi pending table
> +             */
> +            pend |= (1 << (irq % 8));
> +
> +            address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
> +                                 MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +        }
> +    }

You can simplify this code a bit:

    address_space_read(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
                       MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
    ispend = extract32(pend, irq % 8, 1);
    if (ispend == level) {
        return;
    }
    pend = deposit32(pend, irq % 8, 1, level ? 1 : 0);
    address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
                        MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));


> +    cs->lpivalid = false;
> +    cs->hpplpi.prio = 0xff;
> +    gicv3_redist_update_lpi(cs);

You can avoid doing a full update a lot of the time:
 * if this LPI is worse than the current value in hpplpi
   (where by "worse" I mean lower-priority by the same kind of
   comparison irqbetter() does) then we haven't changed the best-available
   pending LPI, so we don't need to do an update
 * if we set the pending bit to 1 and the LPI is enabled and the priority
   of this LPI is better than the current hpplpi, then we know this LPI
   is now the best, so we can just set hpplpi.prio and .irq without
   doing a full rescan
 * if we didn't actually change the value of the pending bit, we
   don't need to do an update (you get this for free if you take the
   simplification suggestion I make above, which does an early-return
   in the "no change" case)

> +}
> +
> +void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
> +{
> +    AddressSpace *as = &cs->gic->dma_as;
> +    uint64_t lpict_baddr;
> +    uint8_t lpite;
> +    uint64_t idbits;
> +
> +    idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
> +                 GICD_TYPER_IDBITS);
> +
> +    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||

This is the other set of missing brackets that clang complains about.

> +         !cs->gicr_pendbaser || (idbits < GICR_PROPBASER_IDBITS_THRESHOLD) ||
> +         (irq > (1ULL << (idbits + 1)))) {
> +        return;
> +    }
> +
> +    lpict_baddr = cs->gicr_propbaser & R_GICR_PROPBASER_PHYADDR_MASK;
> +
> +    /* get the lpi config table entry corresponding to this irq */
> +    address_space_read(as, lpict_baddr + ((irq - GICV3_LPI_INTID_START) *
> +                        sizeof(lpite)), MEMTXATTRS_UNSPECIFIED,
> +                        &lpite, sizeof(lpite));
> +
> +    /* check if this irq is enabled before proceeding further */
> +    if (!(lpite & LPI_CTE_ENABLED)) {
> +        return;
> +    }

I don't think you need to make this check -- you can just set/clear
the pending status of the LPI. If the LPI is not enabled then it will
be ignored by gicv3_redist_update_lpi(). This is how non-LPI interrupts
work and I think that LPIs behave the same way. (But it's a big spec,
so I might have missed something -- if I'm wrong, please say so.)

> +
> +    /* set/clear the pending bit for this irq */
> +    gicv3_redist_lpi_pending(cs, irq, level);
> +
> +    gicv3_redist_update(cs);
> +}
> +
>  void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
>  {
>      /* Update redistributor state for a change in an external PPI input line */
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index 91dbe01176..bcbccba573 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -308,6 +308,13 @@ FIELD(GITS_TYPER, CIL, 36, 1)
>
>  #define L1TABLE_ENTRY_SIZE         8
>
> +#define LPI_CTE_ENABLE_OFFSET      0
> +#define LPI_CTE_ENABLED          VALID_MASK
> +#define LPI_CTE_PRIORITY_OFFSET    2
> +#define LPI_CTE_PRIORITY_MASK     ((1U << 6) - 1)
> +#define LPI_PRIORITY_MASK         0xfc
> +#define LPI_SPRIORITY_MASK        0x7e
> +
>  #define GITS_CMDQ_ENTRY_SIZE               32
>  #define NUM_BYTES_IN_DW                     8
>
> @@ -452,6 +459,9 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
>                                 unsigned size, MemTxAttrs attrs);
>  void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
>  void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
> +void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
> +void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
> +void gicv3_redist_update_lpi(GICv3CPUState *cs);
>  void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
>  void gicv3_init_cpuif(GICv3State *s);
>
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index c1348cc60a..5d839da9c9 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -204,6 +204,16 @@ struct GICv3CPUState {
>       * real state above; it doesn't need to be migrated.
>       */
>      PendingIrq hppi;
> +
> +    /*
> +     * Current highest priority pending lpi for this CPU.
> +     * This is cached information that can be recalculated from the
> +     * real state above; it doesn't need to be migrated.

This comment is true for hppi, but not for hpplpi. For hpplpi
it is "cached information that can be recalculated from the LPI
tables in guest memory".

This means that we need either to:
 (1) call gicv3_redist_update_lpi() in an appropriate post-load function
so that the field gets re-calculated on the destination end of a migration
 (2) migrate the hpplpi fields

Option 1 is what we do for hppi: arm_gicv3_post_load() calls
gicv3_full_update_noirqset(), which does a full recalculation of the
GIC state. Calling gicv3_redist_update_lpi() in arm_gicv3_post_load()
before it calls gicv3_full_update_noirqset() is probably the best thing.

> +     */
> +    PendingIrq hpplpi;
> +
> +    bool lpivalid; /* current highest priority lpi validity status */
> +
>      /* This is temporary working state, to avoid a malloc in gicv3_update() */
>      bool seenbetter;
>  };
> --
> 2.27.0
>

thanks
-- PMM

