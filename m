Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD039E8C1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:53:57 +0200 (CEST)
Received: from localhost ([::1]:49280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqMFv-0003hf-PB
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqMF0-00030h-EG
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:52:58 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:33645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqMEy-0002qM-OD
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:52:58 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso587830pjz.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 13:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gv+u6nzFJ7SPpBY9RouvEvxyfeXIJ1zG9e/GdE5vDlc=;
 b=tQBq9b7MVvFJQWlzCYXUr+kX7CGyn5xvioBp0ozoWgdaS1giL6Fe4XXm6lgdWZlbpX
 ALHNXpOPZhA7fusFVVEvyamy9i0jVp9aEOP/ZN6Rgfj9kBIMCmCn8AE+3UdLKMrq2cd8
 atTzKYPP1jOeIjNe7x1yxZOWHz/PmVrFM8i3zxLb1Vl+EvohHkpIciKUheYHJvi80vXw
 Cmjfq+/ZTSg0U0Zh/lLQ15E4uBN1fBRdlV1sxvzZEY5/MzYXP2AU1fR+ouX156VuUMms
 RSQsidgjM8oioZiqP/w9I8jO1+cq5CGgEBt3p5OvTFJ4lzyt/ugZafBi+47e5Ifv2Erz
 RMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gv+u6nzFJ7SPpBY9RouvEvxyfeXIJ1zG9e/GdE5vDlc=;
 b=GShnGBIzLlPCMJ0AjpYEnjkMc4DynkZ0do0Zy7Ls08wKEwU0P//F1+xQyjIhAJsmz5
 MEvbWmIVubqX/nNi/MNZ/JGjIRcN4SPv9ffCsVNAqpga7yornRk8fQ7O3Q7FJZNn6Vtv
 /GRIRqhgVhG3qfk5FPGWrarr8MGho2h3FfsNKuHBBvFwzBnvrAhmcJQ2P9vwswCqhTtn
 6LBeOluPK9ZGiYsuq76rQac3NcTFnc7S5+Nv7Mw74RpVCcREJp0JCDW4vTfTvM7+4Rnf
 hKVT2jOUEYu8wLrUek7H3RgUpgiwQrcs+I1pZSQ005j620O0Gp3mrFXFWWFqxpfVhk/F
 hK8Q==
X-Gm-Message-State: AOAM533DQfXmfMc4Ffv3sa9XpHSH5XgI2dN2oAmzrOQcOvsJc1d+QZl8
 SpG0y6AUqQrnKs9aRJ011vgzcQ==
X-Google-Smtp-Source: ABdhPJw78Lb8ifOEqzorQa1i9+T4zZQWGn7M42TnvQ2rmw1Quo5Qq7VmualppJ+KB2IXCU1pi1efow==
X-Received: by 2002:a17:902:fe86:b029:10e:7898:331c with SMTP id
 x6-20020a170902fe86b029010e7898331cmr19658037plm.22.1623099174357; 
 Mon, 07 Jun 2021 13:52:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y14sm272476pjr.51.2021.06.07.13.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 13:52:53 -0700 (PDT)
Subject: Re: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-4-richard.henderson@linaro.org>
 <871r9dod1w.fsf@linaro.org> <31a70d8a-0b1c-9641-e2bf-3625690fa6b6@linaro.org>
 <87pmwxmw0i.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d66f57e-7ff0-4d57-22e1-d5156665e2fb@linaro.org>
Date: Mon, 7 Jun 2021 13:52:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87pmwxmw0i.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: mmorrell@tachyum.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 10:19 AM, Alex Bennée wrote:
>> If you've got a better ordering of operations for this, do tell.
> 
> What I really want is to know which instructions translate into the if
> (s->flush_inputs_to_zero) and verifying that is only checked once. Maybe
> I'm just suspicious of compilers ability to optimise things away...




>   Dump of assembler code for function float32_mul:
>      0x0000000000895d60 <+0>:	movzbl 0x1(%rdx),%eax
>      0x0000000000895d64 <+4>:	test   $0x10,%al
>      0x0000000000895d66 <+6>:	je     0x895e30 <float32_mul+208>

s->float_exception_flags & float_flag_inexact

>      0x0000000000895d6c <+12>:	cmpb   $0x0,(%rdx)
>      0x0000000000895d6f <+15>:	jne    0x895e30 <float32_mul+208>

s->float_rounding_mode == float_round_nearest_even

>      0x0000000000895d75 <+21>:	test   $0x7f800000,%edi
>      0x0000000000895d7b <+27>:	jne    0x895da0 <float32_mul+64>
>      0x0000000000895d7d <+29>:	test   $0x7fffffff,%edi
>      0x0000000000895d83 <+35>:	je     0x895da0 <float32_mul+64>

float32_is_denormal

>      0x0000000000895d85 <+37>:	cmpb   $0x0,0x5(%rdx)
>      0x0000000000895d89 <+41>:	je     0x895e60 <float32_mul+256>

s->flush_inputs_to_zero

>      0x0000000000895d8f <+47>:	or     $0x40,%eax
>      0x0000000000895d92 <+50>:	and    $0x80000000,%edi
>      0x0000000000895d98 <+56>:	mov    %al,0x1(%rdx)

flush-to-zero and set iflush_denormal

>      0x0000000000895da0 <+64>:	test   $0x7f800000,%esi
>      0x0000000000895da6 <+70>:	jne    0x895dd0 <float32_mul+112>
>      0x0000000000895da8 <+72>:	test   $0x7fffffff,%esi
>      0x0000000000895dae <+78>:	je     0x895dd0 <float32_mul+112>

float32_is_denormal (second operand)

>      0x0000000000895db0 <+80>:	cmpb   $0x0,0x5(%rdx)
>      0x0000000000895db4 <+84>:	movzbl 0x1(%rdx),%eax
>      0x0000000000895db8 <+88>:	je     0x895e50 <float32_mul+240>
>      0x0000000000895dbe <+94>:	or     $0x40,%eax
>      0x0000000000895dc1 <+97>:	and    $0x80000000,%esi

s->flush_inputs_to_zero,
flush-to-zero,
set iflush_denormal.

...

>      0x0000000000895e50 <+240>:	or     $0x20,%eax
>      0x0000000000895e53 <+243>:	mov    %al,0x1(%rdx)
>      0x0000000000895e56 <+246>:	jmpq   0x895dd0 <float32_mul+112>

set inorm_denormal (second operand)

>      0x0000000000895e60 <+256>:	or     $0x20,%eax
>      0x0000000000895e63 <+259>:	mov    %al,0x1(%rdx)
>      0x0000000000895e66 <+262>:	jmpq   0x895da0 <float32_mul+64>

set inorm_denormal (first operand)

There do seem to be 3 reads/writes to exception_flags for float_raise.


r~

