Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD363C7556
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:52:59 +0200 (CEST)
Received: from localhost ([::1]:57780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LeU-0004dp-KW
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3LXf-0007O7-13
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:45:55 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3LXc-0008I8-LY
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:45:54 -0400
Received: by mail-ej1-x636.google.com with SMTP id o5so42709717ejy.7
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e+2QTsgDWMbYVZ1k9usTKdDYtySiUf2d6+/vVH5etHA=;
 b=HfzSf6dnAHzrY6QnKSzkB6DSG1WAPjG6Y4EHuyZexSZsMcc6FVwW62IoJxgE/zm/PR
 9jvS5CDH1bAekVuAHdFbBAJ7vfhDRkEPX4tKL2Tng/5elUrHpp+o4XC7Ey9r10Oh6x8t
 IkS1edNdiPzyG2yUoy7fotdb50O4HV+9MLsyrTVKQgakELjs5joLs+JyppxuYQSfqhVm
 J7n1/NyDV/A/8TMbxMynEL0ofqAA/veOxRraheuSziu9jxGCkX7RAHimXzLJhtnkWZSc
 5RoL/rJcGzEauSPRUk1Csgz4S6Lk9559CElr55ZpwPfcDbrP0ca1Ekh0LUB4i87k9YFm
 TM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e+2QTsgDWMbYVZ1k9usTKdDYtySiUf2d6+/vVH5etHA=;
 b=CD0cRILYyYcbyX57+4MVN3DNbCVCaDwjaCfEjn4Pt7BMTEBRGuJ/1dRm5FWg6zV5Mf
 +Btsq55UlngJTn0i87T7OriC7ohlw4swEWmrHh9Ff/PWr4YItIq/6Rk+dmKk6P1kaDLj
 30JTyp3kBkqqE4cQvvRdptcwyKWFm9Hu1rDLHww2VdphzAd5o2rgZHY8S63x4xH+7Gw3
 hy6xIvBGXV+GSCWeUoOeOLX1lJxHPIbPak7MFjioqanrSWMfD6qytWHOLYvyOdbZByZF
 dhBV/sfouT9SOnjU5BMiGBo2hWLSZ4kodn4N79sT5+9NJ1RpytE4u9zfGVZ7JqRmeZBc
 3g6w==
X-Gm-Message-State: AOAM531VsgTHU/LJAJfCx/SS9EMTz9ArwrhnAbi7j/MkJIH+8tcPMCFs
 qtsAwGBNGyj0ggOaTLlCd9bYGVDrx5Yx1R359VrOLA==
X-Google-Smtp-Source: ABdhPJx5legkBYLRSR4vrQisjg+phAgBEkOgUA7doBOa8EL8WyD5kd0OXkJEGMDG+KmUCRgBG1kk3UDSx53KYti+czc=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr6858828ejb.482.1626194750907; 
 Tue, 13 Jul 2021 09:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210707021815.45938-1-shashi.mallela@linaro.org>
 <20210707021815.45938-7-shashi.mallela@linaro.org>
In-Reply-To: <20210707021815.45938-7-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 17:45:11 +0100
Message-ID: <CAFEAcA_TpbKrV+XdkmWyRf45iVrX7hpRQZaJ9dGp0Go-i6Fd+g@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] hw/intc: GICv3 redistributor ITS processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Jul 2021 at 03:18, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Implemented lpi processing at redistributor to get lpi config info
> from lpi configuration table,determine priority,set pending state in
> lpi pending table and forward the lpi to cpuif.Added logic to invoke
> redistributor lpi processing with translated LPI which set/clear LPI
> from ITS device as part of ITS INT,CLEAR,DISCARD command and
> GITS_TRANSLATER processing.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>

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
> +    int i;
> +    uint64_t idbits;
> +
> +    idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
> +                 GICD_TYPER_IDBITS);
> +
> +    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
> +        !cs->gicr_pendbaser || (idbits < GICR_PROPBASER_IDBITS_THRESHOLD)) {

If you structure the loop below appropriately, you can avoid having to
explicitly check idbits against GICR_PROPBASER_IDBITS_THRESHOLD; see below.

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
> +    for (i = 0; i < pendt_size / 8; i++) {
> +        address_space_read(as, lpipt_baddr +
> +                (((GICV3_LPI_INTID_START + i) / 8) * sizeof(pend)),
> +                MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +
> +        if (!((1 << ((GICV3_LPI_INTID_START + i) % 8)) & pend)) {
> +            continue;
> +        }

I don't think this code is right. The pending table size includes one
bit for every interrupt ID, including the low ones below GICV3_LPID_INTID_START
(ie there's a spare 1K for IMPDEF purposes at the start). Here the
loop is iterating through the whole pending table with 'i' a byte
offset into it -- but then when we calculate the address to read we
add GICV3_LPI_INTID_START to it. The loop body seems to be written
as if 'i' is an intid, but the for() is not doing that.

Also, you read a byte of pending information, which tells you about
the pending state of 8 interrupts, but you only call
gicv3_redist_check_lpi_priority() for one of them.

> +
> +        gicv3_redist_check_lpi_priority(cs, GICV3_LPI_INTID_START + i);
> +    }

I think you probably want to structure the loop something like this:

for (offset = GICV3_LPI_INTID_START / 8; offset < pendt_size / 8; offset++) {
    read the byte at lpipt_baddr + offset;
    while (byte) {
        bit = ctz32(byte);
        gicv3_redist_check_lpi_priority(cs, offset * 8 + bit);
        byte &= ~(1 << bit);
    }
}

(this is why you don't need to explicitly check GICR_PROPBASER_IDBITS_THRESHOLD:
if idbits is too low then the loop condition is just always false and we
don't check any pending bits.)


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

You should ignore irq values less than GICV3_LPI_INTID_START here.
(We checked when we put the map into the ITE but this is an easy
way to get rid of the 1023 special case.)

> +
> +    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
> +         !cs->gicr_pendbaser || (idbits < GICR_PROPBASER_IDBITS_THRESHOLD) ||

You don't need to explicitly look for "idbits <
GICR_PROPBASER_IDBITS_THRESHOLD":
if that is true then the irq will always be greater than the maximum imposed by
idbits and we'll throw it out that way.

> +         (irq > (1ULL << (idbits + 1)))) {

This is off by one -- 1 << (bitcount) is not the largest permitted intID,
it is one greater than that.

> +        return;
> +    }
> +
> +    /* set/clear the pending bit for this irq */
> +    gicv3_redist_lpi_pending(cs, irq, level);
> +
> +    gicv3_redist_update(cs);
> +}

thanks
-- PMM

