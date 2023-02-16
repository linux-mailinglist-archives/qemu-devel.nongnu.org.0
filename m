Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA30699AC5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:08:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShif-00047S-Gq; Thu, 16 Feb 2023 12:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShiT-00046b-S6
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:06:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShiR-0003YE-AJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676567197;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iMI56UeYLJ0/JuaJKS00EMiHqlcOZdL/C1u16xQYgQs=;
 b=dUYwf7OZCEYHvFkKY4pSLbH0MWUvip0hkG+UsxeqyGLpQjWxPHpQxD9wGiuy7quhCD2zNm
 uybTkUV4p58myEEG7KHBB1+Tu35ZucomhJL6mICBqysQtiWq31WyRG6rIB3QdT9To2BCv4
 KT0TJPcxhWC9FSRArWmp25mjOJXbmQY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-sCwUxioBPuC2F1vSqupTMg-1; Thu, 16 Feb 2023 12:06:35 -0500
X-MC-Unique: sCwUxioBPuC2F1vSqupTMg-1
Received: by mail-qt1-f197.google.com with SMTP id
 v3-20020a05622a188300b003ba183e8272so1591213qtc.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:06:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iMI56UeYLJ0/JuaJKS00EMiHqlcOZdL/C1u16xQYgQs=;
 b=T2gX2CS3JXxAUJUJ/DY2oFELUSFD3gSJrfYCnR2u3nkurNonvx6H5qO7f6ZGPhaIds
 CB/rEofLOQ3ql2nj/ihv4lhp896h7C5bAueWOt51ONl2jDC3x3rzGj8R7WDMaageKhp6
 0dPC2zewHfrIOyEHdQXuPkd9aL88EB0eve1BktzkZWOg26DhMmVId4jm5rvofkrSzeHx
 +s1DNAbEUaht/ecHqH7xL4Oe+3vzMO7+Fikqlbpz/G6Gxrbb/RZqp7ISJgYvY+TYsEO6
 1kEypjg8qZQgfaT73A4KyR8h1WHzjA+5LgCKO+4l3gxKOdm6Nx9VsuBO8eRuOROu3lwD
 KXsw==
X-Gm-Message-State: AO0yUKXnvXBZlHjZZrX6iKP6ZwU4P3nq+GfdeC4fPAkQbxiWiiiMNeju
 Xcc876xra8DeK1oToDh9VCEqKNBQBjzoc00K6S5XSOx/5ahb13k0w1mUjDUBh/t1TP6EpRDdEQ0
 EQtNBSHGvPcj3l520sxAG
X-Received: by 2002:ac8:7f0e:0:b0:3bd:140:4f4e with SMTP id
 f14-20020ac87f0e000000b003bd01404f4emr9810037qtk.2.1676567193283; 
 Thu, 16 Feb 2023 09:06:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/FOV99sHMfmHwmTMgiIVyZ6WzDfbIh68UP/aCxJcJXtCAwIF2dgMJzYQzkaC7erxKPp+zI9w==
X-Received: by 2002:ac8:7f0e:0:b0:3bd:140:4f4e with SMTP id
 f14-20020ac87f0e000000b003bd01404f4emr9809995qtk.2.1676567192866; 
 Thu, 16 Feb 2023 09:06:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a05620a014f00b0073b399700adsm1564791qkn.3.2023.02.16.09.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 09:06:32 -0800 (PST)
Message-ID: <e537087d-a8ab-f30b-aeff-76750966a08b@redhat.com>
Date: Thu, 16 Feb 2023 18:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] target/arm: Add raw_writes ops for register whose
 write induce TLB maintenance
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, richard.henderson@linaro.org,
 pbonzini@redhat.com, qemu-devel@nongnu.org, philmd@linaro.org
References: <20230213183803.3239258-1-eric.auger@redhat.com>
 <CAFEAcA9sOykbFg=ZNvMRvjaSEJCEsn0MXODdu22zWSsyhDxAGQ@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA9sOykbFg=ZNvMRvjaSEJCEsn0MXODdu22zWSsyhDxAGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Peter,

On 2/16/23 14:51, Peter Maydell wrote:
> On Mon, 13 Feb 2023 at 18:38, Eric Auger <eric.auger@redhat.com> wrote:
>> Some registers whose 'cooked' writefns induce TLB maintenance do
>> not have raw_writefn ops defined. If only the writefn ops is set
>> (ie. no raw_writefn is provided), it is assumed the cooked also
>> work as the raw one. For those registers it is not obvious the
>> tlb_flush works on KVM mode so better/safer setting the raw write.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> ---
>>
>> v1 -> v2:
>> - do not add raw_writefn if type is set to ARM_CP_NO_RAW [Peter]
>>
>> I am not familiar with those callbacks. I am not sure whether
>> the .raw_writefn must be set only for registers only doing some
>> TLB maintenance or shall be set safely on other registers doing
>> TLB maintenance + other state settings.
>> ---
>>  target/arm/helper.c | 39 +++++++++++++++++++++++----------------
>>  1 file changed, 23 insertions(+), 16 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index c62ed05c12..0bd8806999 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -719,16 +719,20 @@ static const ARMCPRegInfo not_v7_cp_reginfo[] = {
>>       * the unified TLB ops but also the dside/iside/inner-shareable variants.
>>       */
>>      { .name = "TLBIALL", .cp = 15, .crn = 8, .crm = CP_ANY,
>> -      .opc1 = CP_ANY, .opc2 = 0, .access = PL1_W, .writefn = tlbiall_write,
>> +      .opc1 = CP_ANY, .opc2 = 0, .access = PL1_W,
>> +      .writefn = tlbiall_write, .raw_writefn = raw_write,
>>        .type = ARM_CP_NO_RAW },
>>      { .name = "TLBIMVA", .cp = 15, .crn = 8, .crm = CP_ANY,
>> -      .opc1 = CP_ANY, .opc2 = 1, .access = PL1_W, .writefn = tlbimva_write,
>> +      .opc1 = CP_ANY, .opc2 = 1, .access = PL1_W,
>> +      .writefn = tlbimva_write, .raw_writefn = raw_write,
>>        .type = ARM_CP_NO_RAW },
>>      { .name = "TLBIASID", .cp = 15, .crn = 8, .crm = CP_ANY,
>> -      .opc1 = CP_ANY, .opc2 = 2, .access = PL1_W, .writefn = tlbiasid_write,
>> +      .opc1 = CP_ANY, .opc2 = 2, .access = PL1_W,
>> +      .writefn = tlbiasid_write, .raw_writefn = raw_write,
>>        .type = ARM_CP_NO_RAW },
>>      { .name = "TLBIMVAA", .cp = 15, .crn = 8, .crm = CP_ANY,
>> -      .opc1 = CP_ANY, .opc2 = 3, .access = PL1_W, .writefn = tlbimvaa_write,
>> +      .opc1 = CP_ANY, .opc2 = 3, .access = PL1_W,
>> +      .writefn = tlbimvaa_write, .raw_writefn = raw_write,
>>        .type = ARM_CP_NO_RAW },
>>      { .name = "PRRR", .cp = 15, .crn = 10, .crm = 2,
>>        .opc1 = 0, .opc2 = 0, .access = PL1_RW, .type = ARM_CP_NOP },
> These are all type ARM_CP_NO_RAW, so don't want a raw_writefn.
damned, need to change my eyes :-(
>
>> @@ -4183,14 +4187,14 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
>>        .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 0,
>>        .access = PL1_RW, .accessfn = access_tvm_trvm,
>>        .fgt = FGT_TTBR0_EL1,
>> -      .writefn = vmsa_ttbr_write, .resetvalue = 0,
>> +      .writefn = vmsa_ttbr_write, .resetvalue = 0, .raw_writefn = raw_write,
>>        .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
>>                               offsetof(CPUARMState, cp15.ttbr0_ns) } },
>>      { .name = "TTBR1_EL1", .state = ARM_CP_STATE_BOTH,
>>        .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 1,
>>        .access = PL1_RW, .accessfn = access_tvm_trvm,
>>        .fgt = FGT_TTBR1_EL1,
>> -      .writefn = vmsa_ttbr_write, .resetvalue = 0,
>> +      .writefn = vmsa_ttbr_write, .resetvalue = 0, .raw_writefn = raw_write,
>>        .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
>>                               offsetof(CPUARMState, cp15.ttbr1_ns) } },
>>      { .name = "TCR_EL1", .state = ARM_CP_STATE_AA64,
>> @@ -4450,13 +4454,13 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
>>        .type = ARM_CP_64BIT | ARM_CP_ALIAS,
>>        .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
>>                               offsetof(CPUARMState, cp15.ttbr0_ns) },
>> -      .writefn = vmsa_ttbr_write, },
>> +      .writefn = vmsa_ttbr_write, .raw_writefn = raw_write },
>>      { .name = "TTBR1", .cp = 15, .crm = 2, .opc1 = 1,
>>        .access = PL1_RW, .accessfn = access_tvm_trvm,
>>        .type = ARM_CP_64BIT | ARM_CP_ALIAS,
>>        .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
>>                               offsetof(CPUARMState, cp15.ttbr1_ns) },
>> -      .writefn = vmsa_ttbr_write, },
>> +      .writefn = vmsa_ttbr_write, .raw_writefn = raw_write },
>>  };
>>
>>  static uint64_t aa64_fpcr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>> @@ -5899,12 +5903,12 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>>        .type = ARM_CP_IO,
>>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
>>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
>> -      .writefn = hcr_write },
>> +      .writefn = hcr_write, .raw_writefn = raw_write },
> These ones are OK.
>
>>      { .name = "HCR", .state = ARM_CP_STATE_AA32,
>>        .type = ARM_CP_ALIAS | ARM_CP_IO,
>>        .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
>>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
>> -      .writefn = hcr_writelow },
>> +      .writefn = hcr_writelow, .raw_writefn = raw_write },
> This is going to do the wrong thing on big-endian hosts, because
> the data value is the low 32 bits and the raw_writefn will
> write that to the whole 64-bit value. We could implement a
> special purpose raw write for this register which just writes
> the value to the low 32 bits, I guess.
>
> For KVM we could ignore this, though -- the register is EL2 only,
> and also is ARM_CP_ALIAS, which means we won't try to do anything
> with it for the KVM<->QEMU state sync or the migration codepaths.
OK so can I simply revert that change.
>
>>      { .name = "HACR_EL2", .state = ARM_CP_STATE_BOTH,
>>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 7,
>>        .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
>> @@ -5971,6 +5975,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>>      { .name = "TCR_EL2", .state = ARM_CP_STATE_BOTH,
>>        .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 2,
>>        .access = PL2_RW, .writefn = vmsa_tcr_el12_write,
>> +      .raw_writefn = raw_write,
>>        .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
>>      { .name = "VTCR", .state = ARM_CP_STATE_AA32,
>>        .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
>> @@ -5987,10 +5992,10 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>>        .type = ARM_CP_64BIT | ARM_CP_ALIAS,
>>        .access = PL2_RW, .accessfn = access_el3_aa32ns,
>>        .fieldoffset = offsetof(CPUARMState, cp15.vttbr_el2),
>> -      .writefn = vttbr_write },
>> +      .writefn = vttbr_write, .raw_writefn = raw_write },
>>      { .name = "VTTBR_EL2", .state = ARM_CP_STATE_AA64,
>>        .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 0,
>> -      .access = PL2_RW, .writefn = vttbr_write,
>> +      .access = PL2_RW, .writefn = vttbr_write, .raw_writefn = raw_write,
>>        .fieldoffset = offsetof(CPUARMState, cp15.vttbr_el2) },
>>      { .name = "SCTLR_EL2", .state = ARM_CP_STATE_BOTH,
>>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 0,
>> @@ -6002,7 +6007,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>>        .fieldoffset = offsetof(CPUARMState, cp15.tpidr_el[2]) },
>>      { .name = "TTBR0_EL2", .state = ARM_CP_STATE_AA64,
>>        .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 0,
>> -      .access = PL2_RW, .resetvalue = 0, .writefn = vmsa_tcr_ttbr_el2_write,
>> +      .access = PL2_RW, .resetvalue = 0,
>> +      .writefn = vmsa_tcr_ttbr_el2_write, .raw_writefn = raw_write,
>>        .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[2]) },
>>      { .name = "HTTBR", .cp = 15, .opc1 = 4, .crm = 2,
>>        .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
> These ones are all OK.
>
>> @@ -6139,7 +6145,7 @@ static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
>>        .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
>>        .access = PL2_RW,
>>        .fieldoffset = offsetofhigh32(CPUARMState, cp15.hcr_el2),
>> -      .writefn = hcr_writehigh },
>> +      .writefn = hcr_writehigh, .raw_writefn = raw_write },
> Similarly this would need a special purpose raw write function
> since we want to only touch the high 32 bits; and again for
> the KVM case we won't ever be doing a raw access to this register.

same question: can I simply revert that change?

>
>
>>  };
>>
>>  static CPAccessResult sel2_access(CPUARMState *env, const ARMCPRegInfo *ri,
>> @@ -6189,12 +6195,12 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>>      { .name = "SCR_EL3", .state = ARM_CP_STATE_AA64,
>>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
>>        .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.scr_el3),
>> -      .resetfn = scr_reset, .writefn = scr_write },
>> +      .resetfn = scr_reset, .writefn = scr_write, .raw_writefn = raw_write },
>>      { .name = "SCR",  .type = ARM_CP_ALIAS | ARM_CP_NEWEL,
>>        .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
>>        .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
>>        .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
>> -      .writefn = scr_write },
>> +      .writefn = scr_write, .raw_writefn = raw_write },
>>      { .name = "SDER32_EL3", .state = ARM_CP_STATE_AA64,
>>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 1,
>>        .access = PL3_RW, .resetvalue = 0,
>> @@ -7862,6 +7868,7 @@ static const ARMCPRegInfo vhe_reginfo[] = {
>>      { .name = "TTBR1_EL2", .state = ARM_CP_STATE_AA64,
>>        .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 1,
>>        .access = PL2_RW, .writefn = vmsa_tcr_ttbr_el2_write,
>> +      .raw_writefn = raw_write,
>>        .fieldoffset = offsetof(CPUARMState, cp15.ttbr1_el[2]) },
> These are OK.

Than you for the review!

Eric
>
>>  #ifndef CONFIG_USER_ONLY
>>      { .name = "CNTHV_CVAL_EL2", .state = ARM_CP_STATE_AA64,
>> --
>> 2.37.3
>>
> thanks
> -- PMM
>


