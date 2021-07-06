Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B013BCA40
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:41:29 +0200 (CEST)
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iW8-0000eS-J0
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1m0hwS-0006IH-MD
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1m0hwQ-0003lG-L1
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:04:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJJceEmAClfEaqpSBpPvAAhjBFwWqKbO3lvyK8Nr51I=;
 b=CCUib0W25irYwFz+JV5Osmd+4swvBVspXh3u53DyA9uwCopaWspNG2sIUPAcPUhF7a/d6F
 /jAIlV6tYy9ip+Z8vP43lMXetSBfR6zjDblB6nTwQe9ySSi0qnDDapN1kAJqLjB+i+/anF
 1jV41VDTevI5Dk8azpghEpCvuRGu43o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-XngMU9ynMz6lxCLjDA771g-1; Tue, 06 Jul 2021 06:04:30 -0400
X-MC-Unique: XngMU9ynMz6lxCLjDA771g-1
Received: by mail-wm1-f69.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so692413wmh.9
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sJJceEmAClfEaqpSBpPvAAhjBFwWqKbO3lvyK8Nr51I=;
 b=OAss2JyATnYCWqPqijRkN/3Ui8pZlxRV+V8EvTHwqzn5iA87EbsHNjBYMGaD0rW1Zt
 vQ7pcUC/jXErZwTURXN0zin+YI2N8D6H3AChwtEwJhNWX+giqC/gAMUPeixuxJ293JAO
 qA4CfDGeEKVn7DN/dW8ZMlsgYmD5j5P2YhEKpPY+FGY5JZvSfmyiuFmYV092cju75ajd
 jqEB2Y6Oc3QMYRPkLnSSAVsfUsxPI/iq4KyRunWtBBixAqkpQLVYwjBBrxeprF6MI6+L
 MkSTQRk/lnupHSFIiEyIhmAjuv8BpWzjpFQgukQ34m0pQfFN17iZE9ljx4B3UMgocgvw
 GzKw==
X-Gm-Message-State: AOAM530n9d6LfyInFiOxvRqo9/bH8yFLcfRaI2i2TiYFEy6hl4cs5+HT
 dORsqcaW5lXJcS4wdoo7LVrmH4V2lGgSsPG0nQ74+XTzlbzTt6znCmfop/LfkcUgZVQgro6sB4w
 SnQgBEgymdzVWUuk=
X-Received: by 2002:a05:600c:2281:: with SMTP id
 1mr19959285wmf.114.1625565869216; 
 Tue, 06 Jul 2021 03:04:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhBIGxZR8794Loxd98Ljobw6VqttaODC7mjXuaXTz5bzwdszJ1SHBn2gXkvH9+kBMVOZyv6Q==
X-Received: by 2002:a05:600c:2281:: with SMTP id
 1mr19959256wmf.114.1625565869008; 
 Tue, 06 Jul 2021 03:04:29 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id x1sm1026193wmc.0.2021.07.06.03.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 03:04:28 -0700 (PDT)
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
To: shashi.mallela@linaro.org, Peter Maydell <peter.maydell@linaro.org>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
 <CAFEAcA-ZeKEMTp5X0VWXu+hip9ryzQLTLNwd_bsKQybyT_k7CQ@mail.gmail.com>
 <bbb32d79ed60fb90128b3662ec925f60ca258e8a.camel@linaro.org>
 <287eb50c0b99a3daec986ec29ede33cb2bdfd025.camel@linaro.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <7a9b8b4a-537d-c302-b7d1-40d26e95a8c5@redhat.com>
Date: Tue, 6 Jul 2021 12:04:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <287eb50c0b99a3daec986ec29ede33cb2bdfd025.camel@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Hi Shashi, Peter,

On 7/6/21 5:25 AM, shashi.mallela@linaro.org wrote:
> On Mon, 2021-07-05 at 20:47 -0400, shashi.mallela@linaro.org wrote:
>> On Mon, 2021-07-05 at 15:54 +0100, Peter Maydell wrote:
>>> On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <
>>> shashi.mallela@linaro.org> wrote:
>>>> Added ITS command queue handling for MAPTI,MAPI commands,handled
>>>> ITS
>>>> translation which triggers an LPI via INT command as well as
>>>> write
>>>> to GITS_TRANSLATER register,defined enum to differentiate between
>>>> ITS
>>>> command interrupt trigger and GITS_TRANSLATER based interrupt
>>>> trigger.
>>>> Each of these commands make use of other functionalities
>>>> implemented to
>>>> get device table entry,collection table entry or interrupt
>>>> translation
>>>> table entry required for their processing.
>>>>
>>>> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
>>>> ---
>>>> +static MemTxResult process_mapti(GICv3ITSState *s, uint64_t
>>>> value,
>>>> +                                 uint32_t offset, bool
>>>> ignore_pInt)
>>>> +{
>>>> +    AddressSpace *as = &s->gicv3->dma_as;
>>>> +    uint32_t devid, eventid;
>>>> +    uint32_t pIntid = 0;
>>>> +    uint32_t max_eventid, max_Intid;
>>>> +    bool dte_valid;
>>>> +    MemTxResult res = MEMTX_OK;
>>>> +    uint16_t icid = 0;
>>>> +    uint64_t dte = 0;
>>>> +    IteEntry ite;
>>>> +    uint32_t int_spurious = INTID_SPURIOUS;
>>>> +    uint64_t idbits;
>>>> +
>>>> +    devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
>>>> +    offset += NUM_BYTES_IN_DW;
>>>> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
>>>> +                                 MEMTXATTRS_UNSPECIFIED, &res);
>>>> +
>>>> +    if (res != MEMTX_OK) {
>>>> +        return res;
>>>> +    }
>>>> +
>>>> +    eventid = (value & EVENTID_MASK);
>>>> +
>>>> +    if (!ignore_pInt) {
>>>> +        pIntid = ((value & pINTID_MASK) >> pINTID_SHIFT);
>>>> +    }
>>>> +
>>>> +    offset += NUM_BYTES_IN_DW;
>>>> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
>>>> +                                 MEMTXATTRS_UNSPECIFIED, &res);
>>>> +
>>>> +    if (res != MEMTX_OK) {
>>>> +        return res;
>>>> +    }
>>>> +
>>>> +    icid = value & ICID_MASK;
>>>> +
>>>> +    dte = get_dte(s, devid, &res);
>>>> +
>>>> +    if (res != MEMTX_OK) {
>>>> +        return res;
>>>> +    }
>>>> +    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
>>>> +
>>>> +    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
>>>> +
>>>> +    if (!ignore_pInt) {
>>>> +        idbits = MIN(FIELD_EX64(s->gicv3->cpu->gicr_propbaser,
>>>> GICR_PROPBASER,
>>>> +                                IDBITS), GICD_TYPER_IDBITS);
>>>
>>> I missed this the first time around, but I don't think this is
>>> right.
>>> Different CPUs could have different GICR_PROPBASER values, so
>>> checking
>>> against just one of them is wrong. 

"5.1.1 LPI configuration tables" says

"
It is IMPLEMENTATION DEFINED whether GICR_PROPBASER can be set to
different values on different
Redistributors. GICR_TYPER.CommonLPIAff indicates which Redistributors
must have GICR_PROPBASER set
to the same value whenever GICR_CTLR.EnableLPIs == 1.
"

So we can choose to set CommonLPIAff to 0 if we do not need to emulate
everything. This is what KVM does

Thanks

Eric


The pseudocode only tests
>>> LPIOutOfRange()
>>> which is documented as testing "larger than GICD_TYPER.IDbits or
>>> not
>>> in
>>> the LPI range and not 1023". So I don't think we should be looking
>>> at the GICR_PROPBASER field here.
>>>
>>> More generally, "s->gicv3->cpu->something" is usually going to be
>>> wrong, because it is implicitly looking at CPU 0; often either
>>> there
>>> should be something else telling is which CPU to use (as in
>>> &s->gicv3->cpu[rdbase] where the CTE told us which redistributor),
>>> or we might need to operate on all CPUs/redistributors. The only
>>> exception is where we can guarantee that all the CPUs are the same
>>> (eg when looking at GICR_TYPER.PLPIS.)
>> In that case,the validation of IDBITS(in case of ITS enabled) could
>> be
>> done during the write of gicr_propbaser register value itself(in
>> arm_gicv3_redist.c) and the its command processing code here can just
>> extract the idbits for its use.
>>> thanks
>>> -- PMM
> Hi Peter
> 
> Please ignore my last comment.
> 
> To address this scenario,i think the feasible option would be to call
> get_cte() to get the rdbase corresponding to icid value passed to mapti
> command.Since each icid is mapped to a rdbase(by virtue of calling MAPC
> command),if the collection table has a valid mapping for this icid we
> continue processing this MAPTI command using &s->gicv3->cpu[rdbase]
> applicable propbaser value to validate idbits, else return without
> further processing.
> 
> Thanks
> Shashi  
> 
> 


