Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DA543E389
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 16:24:05 +0200 (CEST)
Received: from localhost ([::1]:45002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg6K4-0002U1-9o
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 10:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg6IR-00017P-JE
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:22:24 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg6IO-0004cb-Fp
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:22:23 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 k2-20020a17090ac50200b001a218b956aaso4856492pjt.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 07:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Uho2eIZBNhQEiZ/S7gFa42c6Uea0Qp8xV0kphgiYqKA=;
 b=TkkFql45783piEYznoTj0/pmrzwd1VdSccLvB7xcY0clg0WzLBXxctJ0y3JENSrHm4
 z2GljaG2UToef4jNB+wL4JIGLtr3/g9zZv0/s3+/P6oMpgcQ83sYqEIMWC1B7FyIJkc5
 ozt4jgkCTQui2CpMmPsm4RqoKslUt1Uhg6GV3ilfA4IhLEhpedM2FMtX56PBQGYPKT1m
 qIII4x94Vy6vIpqXqOprz/adkQrwVy/ZIXmH5YNb6at7xF8KooIzU8OuEUFxaEmgExjq
 AbuzMl4xozlk2vkYZ20tJXGx5oIYEbImNebeNsalvQYQRFx1jaZpSrvU2gbDJW41kF22
 HxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uho2eIZBNhQEiZ/S7gFa42c6Uea0Qp8xV0kphgiYqKA=;
 b=UwUK9iow0XzG3trpP8GBo1n/5R+N8Oy8GWsm51HV5KPDk9ciTHPTRCzx+0qMkdPOc9
 nIUrnednORFQKuCrwbblv6xIKp+1tp/gM+qyW1vtNPdpb9+DnOKBgmboZOXSm+IqaHGY
 PC7F4zhh082sWNrpk4w5S4WL3j/OwCv1hMfsJGi29ZselDlIqBOlwexds/rs4sduf+FS
 /ih2fc+kqRgiyiqTfUEZCOgTgzrWO+cSjY6qM18m0l6EnnYMYYi2dUJgOgFed6jJybFR
 ZN75GCgmxPIQ8LP3DfpF4kL1EK/TEmr2Sog9Rv6c0xpCEGMIFDDRJcBRVQ3w8SS2APpx
 5tIg==
X-Gm-Message-State: AOAM5305ZyWHTsoEHTmWED+RJIeXwHd03kL9znQWV4fRY/AgM8QH5D9F
 kRRDzP99XY9KrRvVWceEdxIC2pBuUNsA+g==
X-Google-Smtp-Source: ABdhPJz8LsG2bFUANhoBcEi2cpakn8VPQhasTns5/mduMhGhI7BX7kcaSnz12VrJ82JKo3WXJxTMYw==
X-Received: by 2002:a17:90b:1c92:: with SMTP id
 oo18mr13160614pjb.56.1635430938965; 
 Thu, 28 Oct 2021 07:22:18 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id f15sm4007513pfe.132.2021.10.28.07.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 07:22:18 -0700 (PDT)
Subject: Re: [PULL 16/18] target/riscv: change the api for RVF/RVD fmin/fmax
To: Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
 <20211028044342.3070385-17-alistair.francis@opensource.wdc.com>
 <CAE_xrPgiy+OrehPrzt0OZq97jkxGgnBSkEQWbKhROU+v65ac2A@mail.gmail.com>
 <CAKmqyKMHeqia5_1+VXd1+2RPq7-uqFVTfcFgDb7kVetgbXyNXQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c6f3c1b8-c288-aef7-d478-b65f63d7e849@linaro.org>
Date: Thu, 28 Oct 2021 07:22:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMHeqia5_1+VXd1+2RPq7-uqFVTfcFgDb7kVetgbXyNXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 4:30 AM, Alistair Francis wrote:
> On Thu, Oct 28, 2021 at 6:22 PM Frank Chang <frank.chang@sifive.com> wrote:
>>
>> On Thu, Oct 28, 2021 at 12:45 PM Alistair Francis <alistair.francis@opensource.wdc.com> wrote:
>>>
>>> From: Chih-Min Chao <chihmin.chao@sifive.com>
>>>
>>> The sNaN propagation behavior has been changed since
>>> cd20cee7 in https://github.com/riscv/riscv-isa-manual.
>>>
>>> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
>>> Signed-off-by: Frank Chang <frank.chang@sifive.com>
>>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>>> Message-id: 20211016085428.3001501-3-frank.chang@sifive.com
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>>   target/riscv/fpu_helper.c | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
>>> index 8700516a14..d62f470900 100644
>>> --- a/target/riscv/fpu_helper.c
>>> +++ b/target/riscv/fpu_helper.c
>>> @@ -174,14 +174,18 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>>>   {
>>>       float32 frs1 = check_nanbox_s(rs1);
>>>       float32 frs2 = check_nanbox_s(rs2);
>>> -    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
>>> +    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
>>> +                    float32_minnum(frs1, frs2, &env->fp_status) :
>>> +                    float32_minimum_number(frs1, frs2, &env->fp_status));
>>>   }
>>>
>>>   uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>>>   {
>>>       float32 frs1 = check_nanbox_s(rs1);
>>>       float32 frs2 = check_nanbox_s(rs2);
>>> -    return nanbox_s(float32_maxnum(frs1, frs2, &env->fp_status));
>>> +    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
>>> +                    float32_maxnum(frs1, frs2, &env->fp_status) :
>>> +                    float32_maximum_number(frs1, frs2, &env->fp_status));
>>>   }
>>>
>>>   uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
>>> @@ -283,12 +287,16 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>>>
>>>   uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>>>   {
>>> -    return float64_minnum(frs1, frs2, &env->fp_status);
>>> +    return env->priv_ver < PRIV_VERSION_1_11_0 ?
>>> +            float64_minnum(frs1, frs2, &env->fp_status) :
>>> +            float64_minimum_number(frs1, frs2, &env->fp_status);
>>>   }
>>>
>>>   uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>>>   {
>>> -    return float64_maxnum(frs1, frs2, &env->fp_status);
>>> +    return env->priv_ver < PRIV_VERSION_1_11_0 ?
>>> +            float64_maxnum(frs1, frs2, &env->fp_status) :
>>> +            float64_maximum_number(frs1, frs2, &env->fp_status);
>>>   }
>>>
>>>   uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
>>> --
>>> 2.31.1
>>>
>>
>> Hi Alistair,
>>
>> Did you pull the latest v5 patchset?
>> https://lists.nongnu.org/archive/html/qemu-riscv/2021-10/msg00557.html
> 
> Strange, I don't see it on the patches list. All I see is v4

It was one of the cases in which the cover didn't make it to qemu-devel.
The two patches are

https://lore.kernel.org/qemu-devel/20211021160847.2748577-2-frank.chang@sifive.com/
https://lore.kernel.org/qemu-devel/20211021160847.2748577-3-frank.chang@sifive.com/


r~

