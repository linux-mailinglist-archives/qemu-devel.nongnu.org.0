Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDD345B5C5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:45:12 +0100 (CET)
Received: from localhost ([::1]:49432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmxr-0006zq-VH
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:45:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpmgb-0000bx-LO
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:27:21 -0500
Received: from [2a00:1450:4864:20::329] (port=53004
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpmgZ-0005Eu-El
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:27:21 -0500
Received: by mail-wm1-x329.google.com with SMTP id o29so1332863wms.2
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 23:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BA3Yz37TwYf9RKZnN0LW3DShqcW/SrqchS6xoJELhq4=;
 b=kPklsO43l/xXJVMRUShaugXeN4Vh0iHHm9ZMboabT+5dLOr1skpJUaBeeqNbzk99Q9
 7C8e3QdJSt0ShqfDk1gCPnvNYqQocmA75Nz1ocvabEt2+KUBDE7GCx9CDc02ecDmsFKk
 0aquAhHLgJlqfb1+sR44HQh5dUfEiLac3orYxFIUJUfqMdEEWegsAWZegGjPbQI+Ee8I
 5PGgj1CQNdQGqFfhPzb4SJta8CbN4M4PI23zDGF/MXtqSqtLX/amhjHRYyhUg0j4G4Zg
 zOuEMtV+HaQ7S8V8oKVkpZmL0c8UuJZ0lWsadg2rFHmojwN7JDiEz8YazG6yqonU02LG
 gYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BA3Yz37TwYf9RKZnN0LW3DShqcW/SrqchS6xoJELhq4=;
 b=AC4yP0JTpmntEMR/M+XGYa+ybszciuEtERtzp3I+YaKccMpAcCkO8tjPAZoETRA6aI
 1/nAx3IrYk8Xa044Oyc3yNKedW3LkuxwP9BXFOdDSV/jwqoFAAEVQQTNoOV4Q9MRDGOb
 H85valVi6lgM7nq0lkhj1sniaKJ4kSYWvzNpxpSBFOEKNYbkYmoZH29IUuoJ0hidORGD
 UaT3QJCZ5MvwTuuUeDlQoyGPXejK5sPXzXsPK63ndbH5SMRrZkMtSD2xhv0z3mNzZE9M
 2IUUXw98pda4sm3xypqFyEI5zA14s+mNujwW0TXPLXGjkTHTwgA0JeBMiue8xm6gpiGP
 f0Pg==
X-Gm-Message-State: AOAM533tZJRV1atET+VnqYdcuyKxKByGs9GzyqiwyTQ+mWOe+pumcWJs
 NbfllfXiYkyJjXlmZJaj1usD0g==
X-Google-Smtp-Source: ABdhPJxBNBbrCwszAwljwWP1EQtzQl/4QdG9EL5zZtQ+VVqNF+zvZqfEVq6KdC4TNKFIMP24aOOR3g==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr12149727wmb.1.1637738837759;
 Tue, 23 Nov 2021 23:27:17 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id l5sm3360011wml.20.2021.11.23.23.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 23:27:17 -0800 (PST)
Subject: Re: [PATCH v11 19/26] linux-user: Add LoongArch signal support
To: gaosong <gaosong@loongson.cn>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-20-git-send-email-gaosong@loongson.cn>
 <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
 <4b0f0b90-23c8-3609-fe2f-91b086dde081@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42490620-1333-42b3-f8bb-f0c5d24cd856@linaro.org>
Date: Wed, 24 Nov 2021 08:27:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4b0f0b90-23c8-3609-fe2f-91b086dde081@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 3:46 AM, gaosong wrote:
> Hi Richard,
> 
> On 2021/11/20 下午6:33, Richard Henderson wrote:
>> On 11/19/21 7:13 AM, Song Gao wrote:
>>>
>>> +
>>> +struct target_sigcontext {
>>> +    uint64_t   sc_pc;
>>> +    uint64_t   sc_gpr[32];
>>> +    uint64_t   sc_fpr[32];
>>> +    uint64_t   sc_fcc;
>>> +    uint32_t   sc_fcsr;
>>> +    uint32_t   sc_flags;
>>> +};
>>
>> Does not match
>> https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/include/uapi/asm/sigcontext.h 
>>
>>
> #define FPU_REG_WIDTH   256
> union fpureg {
>      uint32_t   val32[FPU_REG_WIDTH / 32];
>      uint64_t   val64[FPU_REG_WIDTH / 64];
> };
> 
> struct target_sigcontext {
>      uint64_t   sc_pc;
>      uint64_t   sc_regs[32];
>      uint32_t   sc_flags;
> 
>      uint32_t   sc_fcsr;
>      uint32_t   sc_vcsr;
>      uint64_t   sc_fcc;
>      uint64_t   scr[4];
>      union fpureg    sc_fpregs[32] __attribute__((aligned(32)));
> 
>      uint32_t   sc_reserved;
> };
> 
> Is this OK?

No, sc_reserved does not match.

> 
>>> +
>>> +struct target_ucontext {
>>> +    target_ulong tuc_flags;
>>> +    target_ulong tuc_link;
>>> +    target_stack_t tuc_stack;
>>> +    target_ulong pad0;
>>> +    struct target_sigcontext tuc_mcontext;
>>> +    target_sigset_t tuc_sigmask;
>>> +};
>>
>> Does not match
>> https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/include/uapi/asm/ucontext.h 
>>
>>
> struct target_ucontext {
>      target_ulong tuc_flags;
>      target_ulong tuc_link;
>      target_stack_t tuc_stack;
>      target_sigset_t tuc_sigmask;
>      target_ulong pad0;
>      struct target_sigcontext tuc_mcontext;
> };
> 
> Is this OK?

No, pad0 does not match __unused.


r~

