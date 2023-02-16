Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7129699A7E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:51:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShTT-0001Tn-3Y; Thu, 16 Feb 2023 11:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShTR-0001T5-6x
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:51:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShTM-0005jk-JD
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676566263;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8KsWrEz7/lDVeWmi5VtQequBjBFbkqoGjfsEL1wfrY=;
 b=RL9hMimXSFI5/JEfafK9IvXWfsZcceH/v6wLrQnc+ymiLUJi0bFuryU0gm9SSB7pc4NKtH
 7UoOUQdDy01A7RlGjvo+FEfSffNI6AKekxIp6FbCAO/5mslxfrPEovmTIEj/0DW77/eZt9
 Kx062dT14wKol24cT5n9CdhZUI/VGOs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-kcOq3_0sM2WzZF6Ka2QKXQ-1; Thu, 16 Feb 2023 11:51:02 -0500
X-MC-Unique: kcOq3_0sM2WzZF6Ka2QKXQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 s4-20020ac85284000000b003b849aa2cd6so1515686qtn.15
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n8KsWrEz7/lDVeWmi5VtQequBjBFbkqoGjfsEL1wfrY=;
 b=jXcvgClcytPvO5PF4FNgdF+G11beY3k0+nkopboUMb78s3kDRhqyULEoSV3o72dTD8
 4naPmLbWZGpSdi93jTYirAajQDPKgG8abYpZrzRtpezciKYRSAWZv910mDMnaWg3+Ga0
 zVbr9Ztgqhtc1fX2vStEHc3Cys8LvO0cmqVsPHPj5c+mRHZLTJix9wmyEo1X6amTqQUL
 jecTD1zFKKvsoj7kB7bO6NB0PMgc/sxuUlH81nugijyakpCqi5t9EUQif6aVDSr0n2KC
 MBbXWYS8GnpEOdeWBhRKGXd0sL2xDAao6mrk9N7Ascaj51qRlAZM96cpfYAvYQp5NTKC
 I2Kw==
X-Gm-Message-State: AO0yUKUIlgLu0xXDvHHfQ6QE30aapuYVBAIHsx1CXSLBkwJQPmHpUlPz
 PZ98lBWvEgW39D18eJ9Tzt4Z0EZB3svS7v8yFbZnlAfz7f26tL/R4CJfBkdSOZ/P1AgTHomR/go
 jHpWz4Z4r1IVJ4LU=
X-Received: by 2002:a05:622a:1911:b0:3b9:bf43:fccd with SMTP id
 w17-20020a05622a191100b003b9bf43fccdmr11300128qtc.10.1676566261451; 
 Thu, 16 Feb 2023 08:51:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8+HEy6i6Et1CT47LC0VQaplzPakliQsd6NkhmGVN5jLxMM0GKh0rn1t+FlPoseeGzpLYbrgw==
X-Received: by 2002:a05:622a:1911:b0:3b9:bf43:fccd with SMTP id
 w17-20020a05622a191100b003b9bf43fccdmr11300104qtc.10.1676566261180; 
 Thu, 16 Feb 2023 08:51:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d17-20020ac800d1000000b003b9b8ec742csm1560040qtg.14.2023.02.16.08.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:51:00 -0800 (PST)
Message-ID: <bb8081f2-d816-c198-02cf-cf00d3b54fcd@redhat.com>
Date: Thu, 16 Feb 2023 17:50:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 05/16] hw/arm/smmuv3: Add page table walk for stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-6-smostafa@google.com>
 <4e248ff8-3032-0697-d50c-d3b62b072a82@redhat.com>
 <Y+4rDVGJdhnN+p9z@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y+4rDVGJdhnN+p9z@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/16/23 14:09, Mostafa Saleh wrote:
> Hi Eric,
>
> On Wed, Feb 15, 2023 at 05:52:39PM +0100, Eric Auger wrote:
>>> In preparation for adding stage-2 support. Add Stage-2 PTW code.
>>> Only Aarch64 fromat is supported as stage-1.
>> format
> I will update it.
>
>>> +        uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
>>> +        uint64_t mask = subpage_size - 1;
>>> +        uint32_t offset = iova_level_offset(iova, inputsize, level, granule_sz);
>>> +        uint64_t pte, gpa;
>>> +        dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
>>> +        uint8_t ap;
>>> +
>>> +        if (get_pte(baseaddr, offset, &pte, info)) {
>>> +                goto error;
>>> +        }
>>> +        trace_smmu_ptw_level(level, iova, subpage_size,
>>> +                             baseaddr, offset, pte);
>> I can the trace point names should be updated as well (and
>> differentiated between S1/S2)
> I was thinking we could leave those with stage argument, and only
> update trace_smmu_ptw_level to have stage argument as the others.
yes as far as the stage is properly populated that's fine.
>
>>> +        if (is_permission_fault_s2(ap, perm)) {
>>> +            info->type = SMMU_PTW_ERR_PERMISSION;
>> don't we have to different S1 versus S2 faults?
> Yes, I missed that, I see setting info->u.f_walk_eabt.s2 should be
> enough, this will set the S2 field in the fault event.
>
>>>  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>>>               SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>>>  {
>>> -    if (!cfg->aa64) {
>>> -        /*
>>> -         * This code path is not entered as we check this while decoding
>>> -         * the configuration data in the derived SMMU model.
>>> -         */
>>> -        g_assert_not_reached();
>> if that's still true for S2, maybe keep that check here upfront?
> Stage-2 is checked in STE parsing and throws BAD_STE if not aa64,
> which I believe is not correct, however I think we can just call
> g_assert_not_reached() during STE parsing, I don’t see added value for
> saving this field in SMMUTransCfg if we don’t use it.
I agree. I guess we provisionned for this field in the prospect of
completing the emulation but I don't think we care.
> I am not sure why this check exists for stage-1 as it is hardcoded in
> decode_cd anyway.
>
>>> +{
>>> +    uint64_t ret;
>>> +    /*
>>> +     * Get the number of bits handled by next levels, then any extra bits in
>>> +     * the address should index the concatenated tables. This relation can
>>> +     * deduced from tables in ARM ARM: D8.2.7-9
>>> +     */
>>> +    int shift = (SMMU_MAX_LEVELS - start_level) * (granule - 3) + granule;
>> can't we factorize anything with the S1 PTW?
>> indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
> Yes, I think we can refactor some of these in common functions/macros, I
> will do that in v2.
I guess that's a trade-off between beeing close enough to the spec and
maybe its pseudo-code and having both S1/S2 codes looking similar.

Eric
>
>
>>> @@ -28,6 +28,7 @@
>>>  #define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
>>>  
>>>  #define SMMU_MAX_VA_BITS      48
>>> +#define SMMU_MAX_LEVELS       4
>> can't this be reused as well with S1 PTW?
> I believe yes, I will update it.
>
> Thanks,
> Mostafa
>


