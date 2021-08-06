Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269C43E2B36
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 15:13:07 +0200 (CEST)
Received: from localhost ([::1]:48208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBzer-0005Na-PM
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 09:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <narmstrong@baylibre.com>)
 id 1mBvgU-0004po-Sx
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:58:30 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <narmstrong@baylibre.com>)
 id 1mBvgS-0006CX-Tc
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:58:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b11so10142401wrx.6
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 01:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sLkWoTMoONeEmWf4PhLqbQqgqpChjYXz9qRtUHbxN7A=;
 b=Aw99a3zVWjX15GYP5ymDpJcg57UwOdCcCrs0wxa+Tzgfxm2Z0AkFQrYBY/HJfrd4PX
 lZyjGUeJdfBQvQfINrXXj/C/uYh05Lk3OlwOpiE/zOAdWym0gy0vwjdmNC34ehDS4bIi
 lmJ8+6zCA28Qh1JUwvXmGFi2/dqdkM53RZJpZTGg/N4NWFxFLGFWpZMcLuavfEi+id/k
 4ekufKgLB4M3pz7Ayzzr3JjGVoQhJorGwkeld/6QTLYU7B6II2LYKpKq9tBDp/6eliSb
 RaBB/NoO0Tgb5+yD5otCXXlqSkLSBNNDoVHC5NTysZQV8YBP4PJJ1ySOE1J/5Vs/eoV4
 semg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=sLkWoTMoONeEmWf4PhLqbQqgqpChjYXz9qRtUHbxN7A=;
 b=YWxHmbaQoagggwsHJ+udp0YulHxIGxD60nI+1dK8ZvK5CagL0+J49bhaz6EemRudir
 07P3EDsMPNKEaw+Mv1MVNGAxIk/qyj/dHfn1xdt5Zvrw//cBUGDiCes5313ICsvHUKGu
 +H6z6OrCHXIzuJe664OSZrRR/0MHFBTvH4hyRa/2aMqv9bR2heBJjRqDiISNUHI7WyD7
 DI4dG5Xdq9cn87FuzOeU8PEcWgrE1qzJjO/dfocIAOhzxriXV5VJAocNPqZPZq1bMRQk
 6ticXlbk18RWVbnXdcXscBvVqXSOVCOjmz2wbzWx5WITdN77LHDKNn5OT+DIQm22AmMR
 XMDg==
X-Gm-Message-State: AOAM531IzR/I8T8TDA0VEDVbWUf7DmYY2rDVijnKKbya46a2ngnHj4oZ
 hdm4i5E+xuFdgwg1z0x42jf+4A==
X-Google-Smtp-Source: ABdhPJzEBdjaR3Q/ijfn7zd6jnWZlltVGLqv3ARdua/BUCrb0enAq2nP2smKjQHllnvm2uHTkc8a1w==
X-Received: by 2002:a5d:59ab:: with SMTP id p11mr9427582wrr.238.1628240305928; 
 Fri, 06 Aug 2021 01:58:25 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:8f97:78ad:435:3743?
 ([2001:861:44c0:66c0:8f97:78ad:435:3743])
 by smtp.gmail.com with ESMTPSA id q9sm11479062wmj.2.2021.08.06.01.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 01:58:25 -0700 (PDT)
Subject: Re: [PATCH v7 04/10] hw/intc: GICv3 ITS Command processing
To: Shashi Mallela <shashi.mallela@linaro.org>, peter.maydell@linaro.org,
 leif@nuviainc.com, rad@semihalf.com, mst@redhat.com, imammedo@redhat.com
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-5-shashi.mallela@linaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <ee0883cc-fffe-28cd-47e5-bc313263128d@baylibre.com>
Date: Fri, 6 Aug 2021 10:58:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805223002.144855-5-shashi.mallela@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=narmstrong@baylibre.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 06 Aug 2021 09:06:51 -0400
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 06/08/2021 00:29, Shashi Mallela wrote:
> Added ITS command queue handling for MAPTI,MAPI commands,handled ITS
> translation which triggers an LPI via INT command as well as write
> to GITS_TRANSLATER register,defined enum to differentiate between ITS
> command interrupt trigger and GITS_TRANSLATER based interrupt trigger.
> Each of these commands make use of other functionalities implemented to
> get device table entry,collection table entry or interrupt translation
> table entry required for their processing.
> 
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c            | 348 +++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h           |  12 +
>  include/hw/intc/arm_gicv3_common.h |   2 +
>  3 files changed, 362 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 8bdbebbeca..35308f1c32 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -29,6 +29,22 @@ struct GICv3ITSClass {
>      void (*parent_reset)(DeviceState *dev);
>  };
>  
> +/*
> + * This is an internal enum used to distinguish between LPI triggered
> + * via command queue and LPI triggered via gits_translater write.
> + */
> +typedef enum ItsCmdType {
> +    NONE = 0, /* internal indication for GITS_TRANSLATER write */
> +    CLEAR = 1,
> +    DISCARD = 2,
> +    INT = 3,
> +} ItsCmdType;
> +
> +typedef struct {
> +    uint32_t iteh;
> +    uint64_t itel;
> +} IteEntry;
> +
>  static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
>  {
>      uint64_t result = 0;
> @@ -50,6 +66,320 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
>      return result;
>  }
>  
> +static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
> +                    MemTxResult *res)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t l2t_addr;
> +    uint64_t value;
> +    bool valid_l2t;
> +    uint32_t l2t_id;
> +    uint32_t max_l2_entries;
> +
> +    if (s->ct.indirect) {
> +        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
> +
> +        value = address_space_ldq_le(as,
> +                                     s->ct.base_addr +
> +                                     (l2t_id * L1TABLE_ENTRY_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, res);
> +
> +        if (*res == MEMTX_OK) {
> +            valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
> +
> +            if (valid_l2t) {
> +                max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
> +
> +                l2t_addr = value & ((1ULL << 51) - 1);
> +
> +                *cte =  address_space_ldq_le(as, l2t_addr +
> +                                    ((icid % max_l2_entries) * GITS_CTE_SIZE),
> +                                    MEMTXATTRS_UNSPECIFIED, res);
> +           }
> +       }
> +    } else {
> +        /* Flat level table */
> +        *cte =  address_space_ldq_le(as, s->ct.base_addr +
> +                                     (icid * GITS_CTE_SIZE),
> +                                      MEMTXATTRS_UNSPECIFIED, res);
> +    }
> +
> +    return (*cte & TABLE_ENTRY_VALID_MASK) != 0;
> +}
> +
> +static MemTxResult update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
> +                              IteEntry ite)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t itt_addr;
> +    MemTxResult res = MEMTX_OK;
> +
> +    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >> GITS_DTE_ITTADDR_SHIFT;
> +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> +
> +    address_space_stq_le(as, itt_addr + (eventid * sizeof(uint64_t)),
> +                         ite.itel, MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res == MEMTX_OK) {
> +        address_space_stl_le(as, itt_addr + ((eventid + sizeof(uint64_t)) *
> +                             sizeof(uint32_t)), ite.iteh,
> +                             MEMTXATTRS_UNSPECIFIED, &res);

While adding support for ITS on Zephyr, I've spotted an issue with the ITE entry storage here.

From eventid 0 to 7, it goes well, but from 8 and all even eventids, the table gets trashed.

The actual storage is:

itel: itt_addr + (eventid * 8)
iteh: itt_addr + ((eventid + 8) * 4)

For the first eventIDs, the offsets are:

EvenID  itel    iteh
0	0	32
1	8	36
2	16	40
3	24	44
4	32	48
5	40	52
6	48	56
7	56	60
8	64	64	<= the entry 8 simply disappears
9	72	68
10	80	72	<= trashed 9
11	88	76
12	96	80	<= trashes 10

and so on.

The correct storage would be:

    address_space_stq_le(as, itt_addr + (eventid * (sizeof(uint64_t) + sizeof(uint32_t))),
                         itel, MEMTXATTRS_UNSPECIFIED, &res);

    if (res == MEMTX_OK) {
        address_space_stl_le(as, itt_addr + (eventid * (sizeof(uint64_t) + sizeof(uint32_t))) +
			 sizeof(uint32_t), iteh, MEMTXATTRS_UNSPECIFIED,
                             &res);
    }

To store iteh right after itel.

> +    }
> +   return res;
> +}
> +
> +static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
> +                    uint16_t *icid, uint32_t *pIntid, MemTxResult *res)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t itt_addr;
> +    bool status = false;
> +    IteEntry ite = {};
> +
> +    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >> GITS_DTE_ITTADDR_SHIFT;
> +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> +
> +    ite.itel = address_space_ldq_le(as, itt_addr +
> +                                    (eventid * sizeof(uint64_t)),
> +                                    MEMTXATTRS_UNSPECIFIED, res);
> +
> +    if (*res == MEMTX_OK) {
> +        ite.iteh = address_space_ldl_le(as, itt_addr + ((eventid +
> +                                    sizeof(uint64_t)) * sizeof(uint32_t)),
> +                                    MEMTXATTRS_UNSPECIFIED, res);

Same here:
    itel = address_space_ldq_le(as, itt_addr + (eventid * (sizeof(uint64_t) + sizeof(uint32_t))),
                                MEMTXATTRS_UNSPECIFIED, res);

    if (*res == MEMTX_OK) {
        iteh = address_space_ldl_le(as, itt_addr + (eventid * (sizeof(uint64_t) + sizeof(uint32_t))) + sizeof(uint32_t),
                                    MEMTXATTRS_UNSPECIFIED, res);

> +
> +        if (*res == MEMTX_OK) {
> +            if (ite.itel & TABLE_ENTRY_VALID_MASK) {
> +                if ((ite.itel >> ITE_ENTRY_INTTYPE_SHIFT) &
> +                    GITS_TYPE_PHYSICAL) {
> +                    *pIntid = (ite.itel & ITE_ENTRY_INTID_MASK) >>
> +                               ITE_ENTRY_INTID_SHIFT;
> +                    *icid = ite.iteh & ITE_ENTRY_ICID_MASK;
> +                    status = true;
> +                }
> +            }
> +        }
> +    }
> +    return status;
> +}
> +

This fixes the issue I see when mapping multiple eventIDs, then trying to exercise them with the INT command.

Thanks,
Neil

