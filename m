Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A065D3BBE8A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 16:56:54 +0200 (CEST)
Received: from localhost ([::1]:34952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Q1l-0000x2-LK
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 10:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0Q02-00072C-5p
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:55:06 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0Pzv-0004J1-8d
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:55:05 -0400
Received: by mail-ej1-x62a.google.com with SMTP id ga42so12089857ejc.6
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 07:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mC62o+nN3O268cbYbKjrXdyM/wNQNYWzNHZH7mE/ZUg=;
 b=GbsfF2FIVZV9dMKCeVJcVG7pN+5Gbg5aHrmz6YH6Uw3W/tb8/a2m4sE93iWVL4cz3Z
 YJj6AdXr/CTNGv/cHuLEUkcUb9G64QdrXrd8OqicimPVHy6dzeuMaMW9ZlGjIeEMh7NV
 9BoR5LA3ILx6o6IoOqr6ds6AOQwPkBNNmpC+NrgCW/Pk+SQLN+tllME/STng+ptiHdwg
 cD2AJvXWbZ2XrRv/t3zDak/koCjaVQQsArtnXlTrUatbZ+9KfVZY3AAobsVzlZyPA55a
 SdNQe5nXDvaKevQm0X8RaoIrYXhAaqIbs9Rkkbki5+1Q3CrO/LUc7sAZfQ1Oqce0Jhdw
 SPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mC62o+nN3O268cbYbKjrXdyM/wNQNYWzNHZH7mE/ZUg=;
 b=fD3B4BkDCS8qR0rPrL83aFbKc/s9jSgLHlyzZB/fhyqEri+UwEL8VVM+GVYGvMf9RX
 tJVlTgt88neJZ35lHT5p+576KWVe7+l4x/L7xjEMYj1ET4JKC7TzYbmAgEcngGcByYk5
 4BD6Nf7mDYGIgl8yb3LAQirp4zEvRLA83/pg87ONbRctB+b4F7bXOmV/yWUt2f1sl5by
 ST1I7dH++TyTgS0ZOc/EARXZ0BKds1AfAvyEYOiFGG9wK8PPFsvDXsG6BQL4fDILHXRh
 AfyAD5KX2MyTOhYClojm5KwPVXFkggSfQ6yAFAkyw9RW9gu8HVaX3riaMqAyryZ72jvc
 xgcA==
X-Gm-Message-State: AOAM530UVEzRUlWAz1e0AgPoNogEb00j5B7N6H6X3KbvBpuo7wS5Lf53
 t+Xa6sCFUfpKEPXHMKR7emWInyLJMoyFvVhxvhVBfQ==
X-Google-Smtp-Source: ABdhPJy7KxjmJD2osg53iWHvbI82iOP0vpJ2sHRA1HanaxJ+XltPfBpMGGNejUC23b7A/fPlYUu9WqqyLcyzx17hIjc=
X-Received: by 2002:a17:906:491a:: with SMTP id
 b26mr7200286ejq.85.1625496897471; 
 Mon, 05 Jul 2021 07:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
In-Reply-To: <20210630153156.9421-5-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 15:54:19 +0100
Message-ID: <CAFEAcA-ZeKEMTp5X0VWXu+hip9ryzQLTLNwd_bsKQybyT_k7CQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added ITS command queue handling for MAPTI,MAPI commands,handled ITS
> translation which triggers an LPI via INT command as well as write
> to GITS_TRANSLATER register,defined enum to differentiate between ITS
> command interrupt trigger and GITS_TRANSLATER based interrupt trigger.
> Each of these commands make use of other functionalities implemented to
> get device table entry,collection table entry or interrupt translation
> table entry required for their processing.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---

> +static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
> +                                 uint32_t offset, bool ignore_pInt)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint32_t devid, eventid;
> +    uint32_t pIntid = 0;
> +    uint32_t max_eventid, max_Intid;
> +    bool dte_valid;
> +    MemTxResult res = MEMTX_OK;
> +    uint16_t icid = 0;
> +    uint64_t dte = 0;
> +    IteEntry ite;
> +    uint32_t int_spurious = INTID_SPURIOUS;
> +    uint64_t idbits;
> +
> +    devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    eventid = (value & EVENTID_MASK);
> +
> +    if (!ignore_pInt) {
> +        pIntid = ((value & pINTID_MASK) >> pINTID_SHIFT);
> +    }
> +
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    icid = value & ICID_MASK;
> +
> +    dte = get_dte(s, devid, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
> +
> +    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
> +
> +    if (!ignore_pInt) {
> +        idbits = MIN(FIELD_EX64(s->gicv3->cpu->gicr_propbaser, GICR_PROPBASER,
> +                                IDBITS), GICD_TYPER_IDBITS);

I missed this the first time around, but I don't think this is right.
Different CPUs could have different GICR_PROPBASER values, so checking
against just one of them is wrong. The pseudocode only tests LPIOutOfRange()
which is documented as testing "larger than GICD_TYPER.IDbits or not in
the LPI range and not 1023". So I don't think we should be looking
at the GICR_PROPBASER field here.

More generally, "s->gicv3->cpu->something" is usually going to be
wrong, because it is implicitly looking at CPU 0; often either there
should be something else telling is which CPU to use (as in
&s->gicv3->cpu[rdbase] where the CTE told us which redistributor),
or we might need to operate on all CPUs/redistributors. The only
exception is where we can guarantee that all the CPUs are the same
(eg when looking at GICR_TYPER.PLPIS.)

thanks
-- PMM

