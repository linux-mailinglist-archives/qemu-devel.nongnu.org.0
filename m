Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9486A78E8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 02:37:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXXsI-0000Vm-RF; Wed, 01 Mar 2023 20:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXsF-0000Tn-0b
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:36:47 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXsD-0000EZ-2L
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:36:46 -0500
Received: by mail-pl1-x635.google.com with SMTP id p6so15157166plf.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 17:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677721002;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=HqDFB2VBBzpWmIvxg1rZfNFitoezq6+4U5Ka6e9Oj2w=;
 b=CRcH5Y17ckR4JyADPd8PxXTVlPlBa/EdDb18zeV4paQad2lUzqkaxMr1EP+Ck1HDLg
 RU+IxX7Fh3egNq04T2t4qpxZvfVyO3Ynl5drq4W1GvaNNhy5j40Da0uFIQnuLjKe6ghB
 V2RshNxoVkVp4QG0dPImdh5WEaqAUacdicL5XRh15Vi4px2njrQ8QFOnNCL4AmF/NMR7
 twmaj1lnrW5CPXoLc1z2MFdddDzf3779xAV6IEVb8VH1CeBYLmzqypGrM0h1cU1gS6nx
 0HyD9UaiPM/YAJfg/LumALkrDkXubPGD4YCEaB0uPys0Vy9Ywv1IpaIKMHvNviAEWyGM
 QIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677721002;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HqDFB2VBBzpWmIvxg1rZfNFitoezq6+4U5Ka6e9Oj2w=;
 b=ZG7mjn0zcvcOSBur1ZivlYzblQmopkfzufVX+gHfAUVKOYCfUB+pFnBxAAEwBE4NPt
 ztyQUPqnvH/2Hx2eKDJ4798sb+xe3p6jKIJXV2VtsY35hGURQoJ42nsDbYRBOjO4GRAe
 sjhPrh+0INqVfP/h/qDtKz+yACNjLKGGlSTaHj1barqeJf7YYQU4lEe35Eeefs5ngtGM
 inY322Ps6rAHwnb/EzouAd/IOTGZJ8K/vYWqpbrDVOgx2Pq1nT1IVjK8bqoD7djN/O7q
 iioNdE5UqO1zOUCExmmGLuE4H6Z+GWmUE8QnT4bmq4LqwxjDGRyYrW/c8EhMAQKzoSKy
 nlIQ==
X-Gm-Message-State: AO0yUKUiaBm2lPdRIXI4wOvf7bNGzoVz3nRtNN0z1U42NKDR9/CdVPh7
 g36F1uq6/4AZhJ1EWcYghSMJLA==
X-Google-Smtp-Source: AK7set/voda6FscIGzzjDiCgkOp6SHnbIRarutXC7icTfAubY3yRdzxxQ/738bTcur/gxjXqf1+nbA==
X-Received: by 2002:a17:902:7149:b0:19c:f1bd:e919 with SMTP id
 u9-20020a170902714900b0019cf1bde919mr6652090plm.65.1677721002459; 
 Wed, 01 Mar 2023 17:36:42 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 c5-20020a170902b68500b0019a7385079esm9014458pls.123.2023.03.01.17.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 17:36:41 -0800 (PST)
Date: Wed, 01 Mar 2023 17:36:41 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 17:30:25 PST (-0800)
Subject: Re: [PATCH 2/6] target/riscv: Fix the relationship of PBMTE/STCE
 fields between menvcfg and henvcfg
In-Reply-To: <9cf44206-76c3-0163-77b3-68fed20f886d@iscas.ac.cn>
CC: ajones@ventanamicro.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liweiwei@iscas.ac.cn
Message-ID: <mhng-3b93df46-5603-49a6-860d-8d315c632035@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 24 Feb 2023 04:36:43 PST (-0800), liweiwei@iscas.ac.cn wrote:
>
> On 2023/2/24 20:19, Andrew Jones wrote:
>> On Fri, Feb 24, 2023 at 12:08:48PM +0800, Weiwei Li wrote:
>>> henvcfg.PBMTE/STCE are read-only zero if menvcfg.PBMTE/STCE are zero.
>>>
>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>> ---
>>>   target/riscv/csr.c | 13 +++++++++----
>>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> index feae23cab0..02cb2c2bb7 100644
>>> --- a/target/riscv/csr.c
>>> +++ b/target/riscv/csr.c
>>> @@ -1956,7 +1956,11 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
>>>           return ret;
>>>       }
>>>
>>> -    *val = env->henvcfg;
>>> +    /*
>>> +     * henvcfg.pbmte is read_only 0 when menvcfg.pbmte = 0
>>> +     * henvcfg.stce is read_only 0 when menvcfg.stce = 0
>>> +     */
>>> +    *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) | env->menvcfg);
>>>       return RISCV_EXCP_NONE;
>>>   }
>>>
>>> @@ -1972,7 +1976,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>>>       }
>>>
>>>       if (riscv_cpu_mxl(env) == MXL_RV64) {
>>> -        mask |= HENVCFG_PBMTE | HENVCFG_STCE;
>>> +        mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);
>> nit:
>>
>>    While HENVCFG_PBMTE == MENVCFG_PBMTE, I'd prefer we use
>>    MENVCFG_* with menvcfg and HENVCFG_* with henvcfg.
>
> Yeah. I agree. However, I think this mask is finally used for henvcfg.
> We just use menvcfg to mask the  bits
>
> when the same bits are zero. So I didn't modify HENVCFG_* here.

I guess it's kind of bikeshedding because the bits are the same, but 
what's in the patch seems cleaner to me: we're writing the H state 
masked by the M state, so we should use the H definitions (even if it 
doesn't matter).

>
> Regards,
>
> Weiwei Li
>
>>
>>>       }
>>>
>>>       env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
>>> @@ -1990,14 +1994,15 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
>>>           return ret;
>>>       }
>>>
>>> -    *val = env->henvcfg >> 32;
>>> +    *val = (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) |
>>> +                            env->menvcfg)) >> 32;
>>>       return RISCV_EXCP_NONE;
>>>   }
>>>
>>>   static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
>>>                                     target_ulong val)
>>>   {
>>> -    uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
>>> +    uint64_t mask = env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);
>>>       uint64_t valh = (uint64_t)val << 32;
>>>       RISCVException ret;
>>>
>>> --
>>> 2.25.1
>>>
>>>
>> Thanks,
>> drew

