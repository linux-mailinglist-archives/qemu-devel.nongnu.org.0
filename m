Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B9E3E5477
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 09:40:12 +0200 (CEST)
Received: from localhost ([::1]:60082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDMMt-0004zX-MD
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 03:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <narmstrong@baylibre.com>)
 id 1mDMIm-0001yn-OB
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 03:35:56 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <narmstrong@baylibre.com>)
 id 1mDMIj-0005Nl-BN
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 03:35:56 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h13so24924383wrp.1
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 00:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O2K2zeZ+W6q27phtASo7eF176IttFMejjUvEhVaeyek=;
 b=n4LFaMI7dFois2x/gI6bwVFFZ7oDaIm62km7V0433y0xYvdafmBcgAElohSnduuLqa
 s0lVjHQLlQSQllkQG+jIqJS6b9nrbC94NlKK+gNa7LI8vdxKnfwGleG3hTbz6v9W3S6A
 znpBvOBUVxEyhiWTjsUGNxY5UPYAoRsWzb2t3sGkq1mkiq+lXimR5PMSssq/9To8H3EF
 9rUG6Fv5XQyZkMqiI3PGnu4qklRxINIXHrSt2zVQmqlKXewqOo/5XH+NyYKLwtnw5iy9
 GNBnjcfFDdFscnh/0hU9s/TkMbtrwIyCGL1ya2ckwtQw4V8lJy3LaSWanNZ4XKUxMHU4
 T+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=O2K2zeZ+W6q27phtASo7eF176IttFMejjUvEhVaeyek=;
 b=YGt1Fnd5JSGQpuK1vgDYUvxIRUIAkXy62YH/J+8GmWOEiBC3jDWtQ2CuKUyMqXUGOR
 A/C4vMhHWOmnHwP9AblOVC8cFHpcZg4U4H9+5MgZMqYIo3jKKzOqEdZ1kOz2ZWSud5rV
 Xg4AcQmQ4oJuiCGvdubs0kvqMbxrmyipdmi5vRsavzZpX1nsZFi1SH4SxaIR52KFNzu3
 qtqp6oES+hch6liY0nTbLj4ImXAChkjA0iXjosm7YIAosLxvn0e0OhlUmSQnxqk+kBCl
 LG1vhPO1pjxJEAAppBPEiLUwjrTGv27pHJ3Jz9c3xqIwblo7MufZh6og++GbI47wjx47
 z5Jg==
X-Gm-Message-State: AOAM531fUmGFlzklzabghlUiiBNb2wdEuan7z3onhDtuyVmjBSfBWZ+8
 3SYvfwRAZ7Vs9eqyfs5zTYVYwJek+HPDjvbl
X-Google-Smtp-Source: ABdhPJyCqsqLoZsxp9Ov0qwZI2R+8iZDwcFUztW4pSkfWz8OS4uF8mg/2inIm0lblBuJj6Q9z4a9Jw==
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr29419004wrp.123.1628580951613; 
 Tue, 10 Aug 2021 00:35:51 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b710:2b6e:27aa:f0a0?
 ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
 by smtp.gmail.com with ESMTPSA id y4sm19888688wmi.22.2021.08.10.00.35.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 00:35:51 -0700 (PDT)
Subject: Re: [PATCH v7 06/10] hw/intc: GICv3 redistributor ITS processing
To: Shashi Mallela <shashi.mallela@linaro.org>, peter.maydell@linaro.org,
 leif@nuviainc.com, rad@semihalf.com, mst@redhat.com, imammedo@redhat.com
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-7-shashi.mallela@linaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <91ad667a-6a17-994c-8ec0-073b9d3b5c5c@baylibre.com>
Date: Tue, 10 Aug 2021 09:35:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805223002.144855-7-shashi.mallela@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=narmstrong@baylibre.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 06/08/2021 00:29, Shashi Mallela wrote:
> Implemented lpi processing at redistributor to get lpi config info
> from lpi configuration table,determine priority,set pending state in
> lpi pending table and forward the lpi to cpuif.Added logic to invoke
> redistributor lpi processing with translated LPI which set/clear LPI
> from ITS device as part of ITS INT,CLEAR,DISCARD command and
> GITS_TRANSLATER processing.
> 
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3.c                |  14 +++
>  hw/intc/arm_gicv3_common.c         |   1 +
>  hw/intc/arm_gicv3_cpuif.c          |   7 +-
>  hw/intc/arm_gicv3_its.c            |  23 +++++
>  hw/intc/arm_gicv3_redist.c         | 141 +++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h           |   9 ++
>  include/hw/intc/arm_gicv3_common.h |   7 ++
>  7 files changed, 200 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index d63f8af604..3f24707838 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -165,6 +165,16 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
>          cs->hppi.grp = gicv3_irq_group(cs->gic, cs, cs->hppi.irq);
>      }
>  
> +    if ((cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) && cs->gic->lpi_enable &&
> +        (cs->hpplpi.prio != 0xff)) {
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
> @@ -339,9 +349,13 @@ static void gicv3_set_irq(void *opaque, int irq, int level)
>  
>  static void arm_gicv3_post_load(GICv3State *s)
>  {
> +    int i;
>      /* Recalculate our cached idea of the current highest priority
>       * pending interrupt, but don't set IRQ or FIQ lines.
>       */
> +    for (i = 0; i < s->num_cpu; i++) {
> +        gicv3_redist_update_lpi(&s->cpu[i]);
> +    }
>      gicv3_full_update_noirqset(s);
>      /* Repopulate the cache of GICv3CPUState pointers for target CPUs */
>      gicv3_cache_all_target_cpustates(s);
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
> index a032d505f5..462a35f66e 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -899,10 +899,12 @@ static void icc_activate_irq(GICv3CPUState *cs, int irq)
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
> @@ -1318,7 +1320,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      trace_gicv3_icc_eoir_write(is_eoir0 ? 0 : 1,
>                                 gicv3_redist_affid(cs), value);
>  
> -    if (irq >= cs->gic->num_irq) {
> +    if ((irq >= cs->gic->num_irq) &&
> +        !(cs->gic->lpi_enable && (irq >= GICV3_LPI_INTID_START))) {
>          /* This handles two cases:
>           * 1. If software writes the ID of a spurious interrupt [ie 1020-1023]
>           * to the GICC_EOIR, the GIC ignores that write.
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 35308f1c32..efa43b0333 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -225,6 +225,7 @@ static MemTxResult process_its_cmd(GICv3ITSState *s, uint64_t value,
>      bool ite_valid = false;
>      uint64_t cte = 0;
>      bool cte_valid = false;
> +    uint64_t rdbase;
>  
>      if (cmd == NONE) {
>          devid = offset;
> @@ -285,6 +286,18 @@ static MemTxResult process_its_cmd(GICv3ITSState *s, uint64_t value,
>           * Current implementation only supports rdbase == procnum
>           * Hence rdbase physical address is ignored
>           */
> +        rdbase = (cte & GITS_CTE_RDBASE_PROCNUM_MASK) >> 1U;
> +
> +        if (rdbase > s->gicv3->num_cpu) {
> +            return res;
> +        }
> +
> +        if ((cmd == CLEAR) || (cmd == DISCARD)) {
> +            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
> +        } else {
> +            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
> +        }
> +
>          if (cmd == DISCARD) {
>              IteEntry ite = {};
>              /* remove mapping from interrupt translation table */
> @@ -602,6 +615,7 @@ static void process_cmdq(GICv3ITSState *s)
>      AddressSpace *as = &s->gicv3->dma_as;
>      MemTxResult res = MEMTX_OK;
>      uint8_t cmd;
> +    int i;
>  
>      if (!(s->ctlr & ITS_CTLR_ENABLED)) {
>          return;
> @@ -663,6 +677,15 @@ static void process_cmdq(GICv3ITSState *s)
>              break;
>          case GITS_CMD_INV:
>          case GITS_CMD_INVALL:
> +            /*
> +             * Current implementation doesn't cache any ITS tables,
> +             * but the calculated lpi priority information. We only
> +             * need to trigger lpi priority re-calculation to be in
> +             * sync with LPI config table or pending table changes.
> +             */
> +            for (i = 0; i < s->gicv3->num_cpu; i++) {
> +                gicv3_redist_update_lpi(&s->gicv3->cpu[i]);
> +            }
>              break;
>          default:
>              break;
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 2108abfe9c..7072bfcbb1 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -254,6 +254,9 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>          if (cs->gicr_typer & GICR_TYPER_PLPIS) {
>              if (value & GICR_CTLR_ENABLE_LPIS) {
>                  cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
> +                /* Check for any pending interr in pending table */
> +                gicv3_redist_update_lpi(cs);
> +                gicv3_redist_update(cs);
>              } else {
>                  cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
>              }
> @@ -532,6 +535,144 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
>      return r;
>  }
>  
> +static void gicv3_redist_check_lpi_priority(GICv3CPUState *cs, int irq)
> +{
> +    AddressSpace *as = &cs->gic->dma_as;
> +    uint64_t lpict_baddr;
> +    uint8_t lpite;
> +    uint8_t prio;
> +
> +    lpict_baddr = cs->gicr_propbaser & R_GICR_PROPBASER_PHYADDR_MASK;
> +
> +    address_space_read(as, lpict_baddr + ((irq - GICV3_LPI_INTID_START) *
> +                       sizeof(lpite)), MEMTXATTRS_UNSPECIFIED, &lpite,
> +                       sizeof(lpite));
> +
> +    if (!(lpite & LPI_CTE_ENABLED)) {
> +        return;
> +    }
> +
> +    if (cs->gic->gicd_ctlr & GICD_CTLR_DS) {
> +        prio = lpite & LPI_PRIORITY_MASK;
> +    } else {
> +        prio = ((lpite & LPI_PRIORITY_MASK) >> 1) | 0x80;
> +    }
> +
> +    if ((prio < cs->hpplpi.prio) ||
> +        ((prio == cs->hpplpi.prio) && (irq <= cs->hpplpi.irq))) {
> +        cs->hpplpi.irq = irq;
> +        cs->hpplpi.prio = prio;
> +        /* LPIs are always non-secure Grp1 interrupts */
> +        cs->hpplpi.grp = GICV3_G1NS;
> +    }
> +}
> +
> +void gicv3_redist_update_lpi(GICv3CPUState *cs)
> +{
> +    /*
> +     * This function scans the LPI pending table and for each pending
> +     * LPI, reads the corresponding entry from LPI configuration table
> +     * to extract the priority info and determine if the current LPI
> +     * priority is lower than the last computed high priority lpi interrupt.
> +     * If yes, replace current LPI as the new high priority lpi interrupt.
> +     */
> +    AddressSpace *as = &cs->gic->dma_as;
> +    uint64_t lpipt_baddr;
> +    uint32_t pendt_size = 0;
> +    uint8_t pend;
> +    int i, bit;
> +    uint64_t idbits;
> +
> +    idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
> +                 GICD_TYPER_IDBITS);
> +
> +    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
> +        !cs->gicr_pendbaser) {
> +        return;
> +    }
> +
> +    cs->hpplpi.prio = 0xff;
> +
> +    lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
> +
> +    /* Determine the highest priority pending interrupt among LPIs */
> +    pendt_size = (1ULL << (idbits + 1));
> +
> +    for (i = GICV3_LPI_INTID_START / 8; i < pendt_size / 8; i++) {
> +        address_space_read(as, lpipt_baddr + i, MEMTXATTRS_UNSPECIFIED, &pend,
> +                           sizeof(pend));
> +
> +        while (pend) {
> +            bit = ctz32(pend);
> +            gicv3_redist_check_lpi_priority(cs, i * 8 + bit);
> +            pend &= ~(1 << bit);
> +        }
> +    }
> +}
> +
> +void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
> +{
> +    /*
> +     * This function updates the pending bit in lpi pending table for
> +     * the irq being activated or deactivated.
> +     */
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
> +                       MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +
> +    ispend = extract32(pend, irq % 8, 1);
> +
> +    /* no change in the value of pending bit, return */
> +    if (ispend == level) {
> +        return;
> +    }
> +    pend = deposit32(pend, irq % 8, 1, level ? 1 : 0);
> +
> +    address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
> +                        MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +
> +    /*
> +     * check if this LPI is better than the current hpplpi, if yes
> +     * just set hpplpi.prio and .irq without doing a full rescan
> +     */
> +    if (level) {
> +        gicv3_redist_check_lpi_priority(cs, irq);
> +    } else {
> +        if (irq == cs->hpplpi.irq) {
> +            gicv3_redist_update_lpi(cs);
> +        }
> +    }
> +}
> +
> +void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
> +{
> +    uint64_t idbits;
> +
> +    idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
> +                 GICD_TYPER_IDBITS);
> +
> +    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
> +         !cs->gicr_pendbaser || (irq > (1ULL << (idbits + 1)) - 1) ||
> +         irq < GICV3_LPI_INTID_START) {
> +        return;
> +    }
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
> index 530d1c1789..a0369dace7 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -140,6 +140,8 @@ FIELD(GICR_PENDBASER, PHYADDR, 16, 36)
>  FIELD(GICR_PENDBASER, OUTERCACHE, 56, 3)
>  FIELD(GICR_PENDBASER, PTZ, 62, 1)
>  
> +#define GICR_PROPBASER_IDBITS_THRESHOLD          0xd
> +
>  #define ICC_CTLR_EL1_CBPR           (1U << 0)
>  #define ICC_CTLR_EL1_EOIMODE        (1U << 1)
>  #define ICC_CTLR_EL1_PMHE           (1U << 6)
> @@ -305,6 +307,9 @@ FIELD(GITS_TYPER, CIL, 36, 1)
>  
>  #define L1TABLE_ENTRY_SIZE         8
>  
> +#define LPI_CTE_ENABLED          TABLE_ENTRY_VALID_MASK
> +#define LPI_PRIORITY_MASK         0xfc
> +
>  #define GITS_CMDQ_ENTRY_SIZE               32
>  #define NUM_BYTES_IN_DW                     8
>  
> @@ -397,6 +402,7 @@ FIELD(MAPC, RDBASE, 16, 32)
>   * Valid = 1 bit,RDBase = 36 bits(considering max RDBASE)
>   */
>  #define GITS_CTE_SIZE                 (0x8ULL)
> +#define GITS_CTE_RDBASE_PROCNUM_MASK  MAKE_64BIT_MASK(1, RDBASE_PROCNUM_LENGTH)
>  
>  /* Special interrupt IDs */
>  #define INTID_SECURE 1020
> @@ -455,6 +461,9 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
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
> index c1348cc60a..aa4f0d6770 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -204,6 +204,13 @@ struct GICv3CPUState {
>       * real state above; it doesn't need to be migrated.
>       */
>      PendingIrq hppi;
> +
> +    /*
> +     * Cached information recalculated from LPI tables
> +     * in guest memory
> +     */
> +    PendingIrq hpplpi;
> +
>      /* This is temporary working state, to avoid a malloc in gicv3_update() */
>      bool seenbetter;
>  };
> 


Tested with in-review Zephyr ITS implementation at https://github.com/zephyrproject-rtos/zephyr/pull/37506

Tested-by: Neil Armstrong <narmstrong@baylibre.com>

