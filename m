Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84E83E5AB1
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:07:40 +0200 (CEST)
Received: from localhost ([::1]:34530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDRTn-00012M-Pt
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDRSm-0007y0-Dn; Tue, 10 Aug 2021 09:06:36 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:55282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDRSk-0001MC-Ka; Tue, 10 Aug 2021 09:06:36 -0400
Received: by mail-pj1-x1033.google.com with SMTP id a8so32998518pjk.4;
 Tue, 10 Aug 2021 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=45MRU4ypzwpzSHQ94Z1Ywu7Sq85CXo//9CRb3beno4Y=;
 b=AmCXvs9nUm3BS4UyQXghVaz0Z54VxpCLb387IT41d6NmmYFHbTyVbsbCi885GSDAwk
 DSSR1tu0fgCk4T45E/EKg3jZf+oJ6PXqMM+HaC3bqEzV+jL9FPD8iWDUbiZZREkdq4et
 frBtUxzIGLcLNqeecUKniZplZTnQWjop0DuWzuRcnRgMW71hkYtcD2mRhiQHeo3MC6Lu
 kPEsUxAdVf73Fm1/3bqZIlKMCljXvRpuxnHFFyyn5h41VYCtndf4txM23gQPXm5JeB1c
 eOSRY/PtJZv8xg83N5SG6vd4JmYXkxBdj2+k7HQWCPS1Q8gtc933YyqXvBjjN38CPnfo
 Lo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=45MRU4ypzwpzSHQ94Z1Ywu7Sq85CXo//9CRb3beno4Y=;
 b=s/ddjCzpZeYkHsX0xyUDibKMQfqfNMrQxPvzieIWNbof9Tr8F64q80EKRbFvXeODOu
 qEyaxN8jOTcAKOpm1UCP62F0GdD+2ivdQbRZagHMxSQVRDo2UZHPnWZMlkgmObBv7G+s
 M7YQsF9V0NpJfj/QBSAnDDfMtraLVnNcxuue1B0XHCT/kwcvak8DNwtvZm9YtBYoHrul
 sOjfb1U83cat4IjIqngzhrVGO3cvlBBu0ayjDG9+awgYzykWEgMoxiwxzNeB/STKVJ+k
 dCd2MWba3HzRMhzP0azn9UhCLpQOSH/n45bvjSsQERRHVuGCaZ7hMxgnniQ9pvfa/oQ3
 ngFg==
X-Gm-Message-State: AOAM531uGe+e6cxBSExcTc2KGQijAly+zHTKtQoertzJcrbn5SLOkFH0
 9GLr2QPKk4qOU5LVxkmHMDM=
X-Google-Smtp-Source: ABdhPJwrZh0QrR0iuccnRCacoV0LBIe5nbkjuVXOiJ/4AJhnsqaJc1hL3bKAVLnq6BqQ08E6ENzluA==
X-Received: by 2002:a05:6a00:1a0e:b029:3c2:ee2f:b236 with SMTP id
 g14-20020a056a001a0eb02903c2ee2fb236mr28937356pfv.80.1628600792721; 
 Tue, 10 Aug 2021 06:06:32 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id o22sm23312019pfu.87.2021.08.10.06.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 06:06:32 -0700 (PDT)
Subject: Re: [PATCH 01/19] target/ppc: add exclusive Book3S PMU reg read/write
 functions
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-2-danielhb413@gmail.com> <YRHwQ8BiO+cFlgqF@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <6cd4510a-8290-dba5-1c31-326c816fa9ed@gmail.com>
Date: Tue, 10 Aug 2021 10:06:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRHwQ8BiO+cFlgqF@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=danielhb413@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/10/21 12:19 AM, David Gibson wrote:
> On Mon, Aug 09, 2021 at 10:10:39AM -0300, Daniel Henrique Barboza wrote:
>> The PowerPC PMU, as described by PowerISA v3.1, has a lot of functions
>> that freezes, resets and sets counters to specific values depending on
>> the circuntances. Some of these are trigged based on read/value of the
>> PMU registers (MMCR0, MMCR1, MMCR2, MMCRA and PMC counters).
>>
>> Having to handle the PMU logic using the generic read/write functions
>> can impact all other registers that has nothing to do with the PMU that
>> uses these functions. This patch creates two new functions,
>> spr_read_pmu_generic() and spr_write_pmu_generic, that will be used later
>> on to handle PMU logic together with the read/write of PMU registers.
>>
>> We're not ready to add specific PMU logic in these new functions yet, so
>> for now these are just stubs that calls spr_read/write_generic(). No
>> functional change is made.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/cpu_init.c  | 24 ++++++++++++------------
>>   target/ppc/spr_tcg.h   |  2 ++
>>   target/ppc/translate.c | 12 ++++++++++++
>>   3 files changed, 26 insertions(+), 12 deletions(-)
>>
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index 505a0ed6ac..021c1bc750 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -6821,47 +6821,47 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
>>   {
>>       spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>> -                     &spr_read_generic, &spr_write_generic,
>> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
> 
> So... this seems dubiousd to me.  Surely when you go to implement the
> specifics of these registers you'll need separate logic for each of
> them.
> 
> Why call a common "read_pmu" function that will then have to multiplex
> to different logic for each register, when you could just dispatch
> directly to a helper for that specific register.

Now that I have an idea of which registers I'll end up reading/writing,
I believe that we can cut a few of those early patches and expose the
logic in a "register-centric" manner.


Daniel





> 
>>                        KVM_REG_PPC_MMCR0, 0x00000000);
>>       spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>> -                     &spr_read_generic, &spr_write_generic,
>> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>>                        KVM_REG_PPC_MMCR1, 0x00000000);
>>       spr_register_kvm(env, SPR_POWER_MMCRA, "MMCRA",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>> -                     &spr_read_generic, &spr_write_generic,
>> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>>                        KVM_REG_PPC_MMCRA, 0x00000000);
>>       spr_register_kvm(env, SPR_POWER_PMC1, "PMC1",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>> -                     &spr_read_generic, &spr_write_generic,
>> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>>                        KVM_REG_PPC_PMC1, 0x00000000);
>>       spr_register_kvm(env, SPR_POWER_PMC2, "PMC2",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>> -                     &spr_read_generic, &spr_write_generic,
>> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>>                        KVM_REG_PPC_PMC2, 0x00000000);
>>       spr_register_kvm(env, SPR_POWER_PMC3, "PMC3",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>> -                     &spr_read_generic, &spr_write_generic,
>> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>>                        KVM_REG_PPC_PMC3, 0x00000000);
>>       spr_register_kvm(env, SPR_POWER_PMC4, "PMC4",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>> -                     &spr_read_generic, &spr_write_generic,
>> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>>                        KVM_REG_PPC_PMC4, 0x00000000);
>>       spr_register_kvm(env, SPR_POWER_PMC5, "PMC5",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>> -                     &spr_read_generic, &spr_write_generic,
>> +                     &spr_read_pmu_generic, spr_write_pmu_generic,
>>                        KVM_REG_PPC_PMC5, 0x00000000);
>>       spr_register_kvm(env, SPR_POWER_PMC6, "PMC6",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>> -                     &spr_read_generic, &spr_write_generic,
>> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>>                        KVM_REG_PPC_PMC6, 0x00000000);
>>       spr_register_kvm(env, SPR_POWER_SIAR, "SIAR",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>> -                     &spr_read_generic, &spr_write_generic,
>> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>>                        KVM_REG_PPC_SIAR, 0x00000000);
>>       spr_register_kvm(env, SPR_POWER_SDAR, "SDAR",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>> -                     &spr_read_generic, &spr_write_generic,
>> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>>                        KVM_REG_PPC_SDAR, 0x00000000);
>>   }
>>   
>> @@ -6941,7 +6941,7 @@ static void register_power8_pmu_sup_sprs(CPUPPCState *env)
>>   {
>>       spr_register_kvm(env, SPR_POWER_MMCR2, "MMCR2",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>> -                     &spr_read_generic, &spr_write_generic,
>> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>>                        KVM_REG_PPC_MMCR2, 0x00000000);
>>       spr_register_kvm(env, SPR_POWER_MMCRS, "MMCRS",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
>> index 0be5f347d5..2aab5878a0 100644
>> --- a/target/ppc/spr_tcg.h
>> +++ b/target/ppc/spr_tcg.h
>> @@ -25,6 +25,8 @@
>>   void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
>>   void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
>>   void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
>> +void spr_read_pmu_generic(DisasContext *ctx, int gprn, int sprn);
>> +void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn);
>>   void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
>>   void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
>>   void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 171b216e17..c8f3878002 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -385,6 +385,12 @@ void spr_read_generic(DisasContext *ctx, int gprn, int sprn)
>>       spr_load_dump_spr(sprn);
>>   }
>>   
>> +void spr_read_pmu_generic(DisasContext *ctx, int gprn, int sprn)
>> +{
>> +    /* For now it's just a call to spr_read_generic() */
>> +    spr_read_generic(ctx, gprn, sprn);
>> +}
>> +
>>   static void spr_store_dump_spr(int sprn)
>>   {
>>   #ifdef PPC_DUMP_SPR_ACCESSES
>> @@ -400,6 +406,12 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
>>       spr_store_dump_spr(sprn);
>>   }
>>   
>> +void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn)
>> +{
>> +    /* For now it's just a call to spr_write_generic() */
>> +    spr_write_generic(ctx, sprn, gprn);
>> +}
>> +
>>   #if !defined(CONFIG_USER_ONLY)
>>   void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
>>   {
> 

