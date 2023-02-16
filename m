Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C047698D6C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:54:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSY9q-0006nX-PN; Thu, 16 Feb 2023 01:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSY9p-0006n6-2F
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:54:17 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSY9m-00008r-Qf
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:54:16 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 fu4-20020a17090ad18400b002341fadc370so4886950pjb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 22:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pp6gz1kUyNZkuHAGZwAD9E51lDzY6E8wd3YDJ3dUFDU=;
 b=WMte8tLjaasOYw//hcUcCXr65yeJ8FCE242xJcWH0jXh/olntWnCXDOazZ2FY2sBeo
 TGW22/FSh1HJsARkfXH0QuD8p3C5ie5OottFTm+llrQHfNY9WjoiB7sEEJ/Ivazyp5ZG
 IHjkLYSsfepaN7B2c1bAo5dhTzUf0paHHlK+/BrMlX0tNWb5X54Lle0XRdnNstjcppc0
 I3O8ZlkqUTtKnF5jUUuVt+NCyZ5xa1GSbksH6YAQ8z7S7CllKHh8aJ3duM4zT8IDJIf/
 BEjB2ZiNls2W6DK0DsicYJO+E7IPKt/RspIMgtTs0lh5ir5DXAl0h/xJqW+XNl6+RjE4
 B0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pp6gz1kUyNZkuHAGZwAD9E51lDzY6E8wd3YDJ3dUFDU=;
 b=D2VHQ52FZHPfi9AJjH5paupt2WKQNF4jEYeyPu+R4w2I5Gajxyw7nGbfVv5hA2SsQo
 UqwSGJlaRk6CE9nqScaH2vevHnStPs8a3HrGL9KpwViiWK+NugNhz5mdLAHKgxNd+/Cd
 MHcNfVw8n2GgOWzckoAbar69BTK3IDd01y+nKzxFyH2pwAY7GYsqlB1nVQnhsHntDwCn
 UVga2YAcU8x3b9eFW9Aei1BOuewmHZ0kpyYQdGYI6KtVvuY6d0eb7l5ZTWGHSPdWvCDr
 vm5oP8qbo6uTE2+2DbabYYJnIrQs/NuipI+5M1g7Tj9ykxBtux7fqA8urEjgSqOfYC9J
 pGfQ==
X-Gm-Message-State: AO0yUKWnYGOi4S86DMJwoFexFFOAGJgFiNhR5A1hMHhkOiWABUmfoH/N
 QFdeNucfd0i5DaSUiAhkZTWqDydrXF/N8NcD/Jk=
X-Google-Smtp-Source: AK7set9McXJ6XHZe3qDBxq+NHREM4shUZ/ArQjIHZBRmez+yZqPOFjGxWfizQ8qkIf9HYUv3Wc8P+A==
X-Received: by 2002:a17:902:f548:b0:19a:7479:c14f with SMTP id
 h8-20020a170902f54800b0019a7479c14fmr6413286plf.65.1676530453227; 
 Wed, 15 Feb 2023 22:54:13 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 jb14-20020a170903258e00b0019468fe44d3sm500399plb.25.2023.02.15.22.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 22:54:12 -0800 (PST)
Message-ID: <6e33fe85-c914-6e08-7154-749bb57c5c56@linaro.org>
Date: Wed, 15 Feb 2023 20:54:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/4] target/arm: Cache ARMVAParameters
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anders.roxell@linaro.org, qemu-arm@nongnu.org
References: <20230202075242.260793-1-richard.henderson@linaro.org>
In-Reply-To: <20230202075242.260793-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping.

r~

On 2/1/23 21:52, Richard Henderson wrote:
> Hi Anders,
> 
> I'm not well versed on tuxrun, and how to make that work with a qemu
> binary outside of the container, so I'm not sure if I'm comparing
> apples to bananas.  Can you look and see if this fixes the kselftest
> slowdown you reported?
> 
> Anyway, for a boot and shutdown of your rootfs, I see:
> 
> Before:
>      11.13%  [.] aa64_va_parameters
>       8.38%  [.] helper_lookup_tb_ptr
>       7.37%  [.] pauth_computepac
>       3.79%  [.] qht_lookup_custom
> 
> After:
>       9.17%  [.] helper_lookup_tb_ptr
>       8.05%  [.] pauth_computepac
>       4.22%  [.] qht_lookup_custom
>       3.68%  [.] pauth_addpac
>       ...
>       1.67%  [.] aa64_va_parameters
> 
> 
> This is all due to the heavy use pauth makes of aa64_va_parameters.
> It "only" needs 2 parameters, tsz and tbi, but tsz is probably the
> most expensive part of aa64_va_parameters -- do anything about that
> and we might as well cache the whole thing.
> 
> The change from struct+bitfields to uint32_t+FIELD is meant to combat
> some really ugly code that gcc produced.  Seems like they should have
> compiled to the same thing, more or less, but alas.
> 
> 
> r~
> 
> 
> Richard Henderson (4):
>    target/arm: Flush only required tlbs for TCR_EL[12]
>    target/arm: Store tbi for both insns and data in ARMVAParameters
>    target/arm: Use FIELD for ARMVAParameters
>    target/arm: Cache ARMVAParameters
> 
>   target/arm/cpu.h          |  30 +++++++
>   target/arm/internals.h    |  21 +----
>   target/arm/helper.c       | 177 ++++++++++++++++++++++++++++----------
>   target/arm/pauth_helper.c |  39 +++++----
>   target/arm/ptw.c          |  57 ++++++------
>   5 files changed, 217 insertions(+), 107 deletions(-)
> 


