Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1495441FCB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:08:23 +0100 (CET)
Received: from localhost ([::1]:40142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbjK-0002Mb-Lz
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb8w-0007hb-Fl
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:30:47 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:44946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb8r-000176-9C
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:30:46 -0400
Received: by mail-qt1-x82f.google.com with SMTP id j1so9307617qtq.11
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Bj5QQCv4pk6GjOYLYCz3g7uXW0+gKeDrPE5O4ktyRwo=;
 b=E0rbMGEHDJ90Om35DRVm/tsTZ1JSGUkp/Mci7lCm556RW255gK1M+sMddK5ARIkcM8
 jS7Y/SRNffvnhoavqusvbKpYwk3VcpvXAF1SZyYIlwAv+KU0r53twUVdReptd/rf1jLr
 2mnHX8EZksuBMCIo1A4EdX74gfYrpRe8H9yNqyvrU+05ULJSxeMWwyPxizQwNaCsWl9n
 KrWAsSfN/+hkb88C49ZPtxo13fZt4mZtTpDCrURKmRPpwhp4MEtbn29VrEAALxtaNRNd
 6nPGa92/JfDn6tJx189XBTEM6DdiPZEA5l4YOXLdC79qHA324HuIra9eryronhVvNNnc
 6tJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bj5QQCv4pk6GjOYLYCz3g7uXW0+gKeDrPE5O4ktyRwo=;
 b=UqOgyZjLOBLbGOTJXSwdUfErM2ggLvackqrUFMvkioluxL2RON+4rH7bRSCqJM5MoQ
 em31uq1j41rc/nJ+I0fSYyRQ6B+eBrZITMChfqVvOwcpVBBYWwJBKvrA8GP6s1bms5O6
 dLXgpuLEuFihHml5/UEA+7vT6bqXJGPlnkuRswuc+TqEfvAt0a+0I6lbPVQCZfjQ5gcv
 3N9FQmFPCFYZuIggvgJiUJFyX2rURy+otQ7eblpNbrc6fXVJZjicwA+LgLpHqHejBbbB
 ruU2sklRy7XLbAHl42wWX48z9z3yW99tFRU6NUocQ8s1kfj6XlAoeLh8sUA8DPsGbYF/
 SZaw==
X-Gm-Message-State: AOAM533FMI7EWjGoCj+M+pDppgNZfTxWrgBI3IViVsq4O+Gtxtga1pK0
 +CIXNq5ryHUPwsf0F6M+VHpAi+M8Paloeg==
X-Google-Smtp-Source: ABdhPJyW1LuTpk3byDDEEdsv26tRkGXULEPnU0GJyiZ94FttoJvB168nwj76FBuJiLoEmJKF5lgq9g==
X-Received: by 2002:ac8:7f11:: with SMTP id f17mr24384181qtk.389.1635787837712; 
 Mon, 01 Nov 2021 10:30:37 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id a124sm5065911qkc.64.2021.11.01.10.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:30:37 -0700 (PDT)
Subject: Re: [PATCH v6 23/66] target/arm: Implement arm_cpu_record_sigsegv
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-24-richard.henderson@linaro.org>
 <CAFEAcA-h7xhKFTjOKgOw22Le2wQPUaT2VxtFcNFMP=xHs2stFQ@mail.gmail.com>
 <c194f037-87dd-0b6a-2776-0724aef4b223@linaro.org>
 <CAFEAcA9wTNNdSzMNV5jyzNCOgJV26uvHQQb8MAG8_ane8kc1zA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0535d236-1e35-b832-91bf-063665f2c63e@linaro.org>
Date: Mon, 1 Nov 2021 13:30:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9wTNNdSzMNV5jyzNCOgJV26uvHQQb8MAG8_ane8kc1zA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: f4bug@amsat.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 imp@bsdimp.com, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 1:25 PM, Peter Maydell wrote:
> On Mon, 1 Nov 2021 at 17:09, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/1/21 12:30 PM, Peter Maydell wrote:
>>> We seem to be restricting tlb_fill to sysemu already.
>>
>> Not true:
>>
>>> -#endif /* !defined(CONFIG_USER_ONLY) */
>>> -
>>>   bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>>                         MMUAccessType access_type, int mmu_idx,
>>>                         bool probe, uintptr_t retaddr)
>>>   {
>>>       ARMCPU *cpu = ARM_CPU(cs);
>>>       ARMMMUFaultInfo fi = {};
>>> -
>>> -#ifdef CONFIG_USER_ONLY
> 
> Yes, that's restricting tlb_fill to sysemu only now (in this patch),
> not "later", right ?

Oh, I see what you mean, re

    "... and we'll be able to restrict
     the tlb_fill hook to sysemu later."

This was in reference to patch 41, "accel/tcg: Restrict TCGCPUOps::tlb_fill() to sysemu", 
where I remove the tlb_fill hook from TCGCPUOps for CONFIG_USER_ONLY.


r~

