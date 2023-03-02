Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E286A8DB2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 00:58:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXsnE-0002yT-Dl; Thu, 02 Mar 2023 18:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXsnC-0002xz-Ga
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 18:56:58 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXsnA-0006Ae-B5
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 18:56:57 -0500
Received: by mail-pl1-x635.google.com with SMTP id i3so990732plg.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 15:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677801414;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rWFaCKA+hIE53xwpQ3fq1g0pZqqbX2ad8ML/qKWDpT4=;
 b=E1mxlRYv8ftJhmdnfmG0CsboTT6953sOcfVtL7ODU9t1MxPV7exjDeX353zWn90ObH
 CTxXAeOf0YGYDgK3vCbPMC7T5P1Sz9EGSg1WvQk6YJoo2Is986UbWMuq5cqrQQtPTjW+
 3O5uRqcyVYnhmAmzIMFczhgaf7gAp43XNpOlUrX+wIqZzRDapCfbkyBMOIt45FFrhIRI
 Spe3j8iUflJaMF7SX5kqFL3dhNVYKbyJhNLpdeCNOvGZDgT5Nk2kIk46P68NWM+kprHf
 sjTRUt57FvDDndKVHCl+svpODN2GAjceW1MoCgpTPI3HRhvgXNaSwLtO5lYlNikHYrbO
 S5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677801414;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rWFaCKA+hIE53xwpQ3fq1g0pZqqbX2ad8ML/qKWDpT4=;
 b=pxZgIjVmv9F4B5wJBoq7hrbsco/dqrrMUUAd5KjdFoUC3n6ocTNbuoS+piT2hiMnJb
 LMFdENbJnOiCucfpuPcu1XanyS0UPjXtzkgUHtJXiBhxO4k046d5Wb216omx9N37Fo16
 Ln3c3dW7sMFDpMEebYRNx4sS6LefvZWAZRI9ftlo6y+FYmhPwrrHWFNsIeaiH8x4CvCk
 A5Te8ewABw15knc++DOLciP6xmUc5JiN8SbWUeONb8hxiD8ntN6lH04o4tgQ3cGAKWse
 OSU5H+Kh2bPpjIytKCfihhkA/RGZgvJDTGtOpSPtoy7MBAYsnwu4CN92OfNz8yF+a4MI
 LT5A==
X-Gm-Message-State: AO0yUKWPzWTKAStZ8Wa+IoN5dEAfeOZlMbRVG3NY5thB2DKgyxGRzTcB
 s8VL10uuuV9MipiHm2MJ8yGd8g==
X-Google-Smtp-Source: AK7set/qbUjRSl1q9gXEu8quNOLiO3Fw6gL9/+sUpyBLtC+6HU0DIKvQSE3Tr8ZP88lTFLv0g9r7rw==
X-Received: by 2002:a17:902:720b:b0:19c:171a:d346 with SMTP id
 ba11-20020a170902720b00b0019c171ad346mr20290plb.44.1677801414212; 
 Thu, 02 Mar 2023 15:56:54 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce?
 ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a170902ea0200b001992fc0a8eesm215792plg.174.2023.03.02.15.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 15:56:53 -0800 (PST)
Message-ID: <0aa0a803-6cc9-5b93-d192-ecc75a685626@linaro.org>
Date: Thu, 2 Mar 2023 15:56:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] gdbstub: attempt to split gdb into 32/64 bit targets
 [!WORKING PLZ HELP]
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230302192546.2617633-1-alex.bennee@linaro.org>
 <97d3a552-2bac-6cc8-345c-0b5a50a772e6@linaro.org>
In-Reply-To: <97d3a552-2bac-6cc8-345c-0b5a50a772e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 3/2/23 13:21, Richard Henderson wrote:
> On 3/2/23 09:25, Alex Bennée wrote:
>> -# These have to built to the target ABI
>> -specific_ss.add(files('syscalls.c'))
>> +# These have to built to the target ABI but are otherwise target
>> +# independent
>> +gdb32_ss = ss.source_set()
>> +gdb64_ss = ss.source_set()
>> +
>> +gdb32_ss.add(files('syscalls.c'))
>> +gdb64_ss.add(files('syscalls.c'))
>> +
>> +gdb32_ss = gdb32_ss.apply(config_host, strict: false)
>> +gdb64_ss = gdb64_ss.apply(config_host, strict: false)
> 
> You don't need the source sets.
> 
>> +libgdb32 = static_library('gdb32', gdb32_ss.sources(),
>> +                          name_suffix: 'fa',
>> +                          c_args: ['-DTARGET_LONG_BITS=32'])
>> +libgdb64 = static_library('gdb64', gdb64_ss.sources(),
>> +                          name_suffix: 'fa',
>> +                          c_args: ['-DTARGET_LONG_BITS=64'])
>> +
>> +gdb32 = declare_dependency(link_whole: libgdb32)
>> +gdb64 = declare_dependency(link_whole: libgdb64)
> 
> It appears to work with "link_with:".
> 
> Both comments apply here and to your gdb_user/gdb_softmmu libraries.

Hmm.  It worked for qemu-system-aarch64, but not qemu-system-avr.
I'm at a bit of a loss...


r~


