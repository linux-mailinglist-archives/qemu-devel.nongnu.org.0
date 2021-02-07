Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE19631275A
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 21:13:01 +0100 (CET)
Received: from localhost ([::1]:39492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8qQW-00072X-EJ
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 15:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8qPe-0006ZT-0K
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 15:12:06 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8qPc-00020K-9z
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 15:12:05 -0500
Received: by mail-pf1-x42c.google.com with SMTP id d26so7139745pfn.5
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 12:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AQuT60hvo/WsX+YvaaY78UGCFwQjqgd2Ua7kj7NuA9E=;
 b=dgFs/7WHVDdSe2svZyj1+IX5rduU1e48bz5I2SK78BPfUJEdIIxNsBLct3ffa6LCuO
 4ohI2fUXAxdNXVXGsRzICjIOk7TIJCzNws/XWiJ3VeyNxiJw9fFwYPpgWM/Ozse1CAco
 l37Ylpu+o0whmtHP1kriaUMyvWE5MyJj4Nixgy9uLD552geR2PWBhMQ7rnZOv1u1+C3R
 GDuAXUbUjchG+L7bofgVX2s9fWEI+ixlRBggZY3BCjewfaOX31CsYVb8KQY5yFVUI6j2
 J9A3wZNikYskTVhyEcgf4E3rWt2Mr5gCA/SGZFOYzdwSoCeynxD+fMDR5GPmgG5d76ex
 1tpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AQuT60hvo/WsX+YvaaY78UGCFwQjqgd2Ua7kj7NuA9E=;
 b=P+VcCCG/ElVg5xzfru2SZhmWdbfITP2L5BU6vq1tb0xY7AXG/5ttPctcWpz0fYsUl/
 4H3LarCyBk0eQcvfAZJesTmSTVAyF3fCn48kZf+14rZztkSNqYkCGbHbU4AWhWcZg2+g
 wo0KbJU3bqhQs4ZxHkqHu3fFAJYMCNX4c3KnW83zT69zMlv0OH+GUKzfz1oL/A1ayWaI
 0ONaTL/3ji9B47lLPCts9T7HR4kNmA+aOxp7kTxa5MMo9pr7BMQ39VdI+CfLpXFM96gd
 +RUxG0qdp+O0kPIbJ/PThMNx9AK2rGpfEsiYvIl682rZ2W0jq4QwNvSkaMNQ/S75CuOq
 /f6g==
X-Gm-Message-State: AOAM530a7eIn+Fxu0rE6WAMrnEUrGxFksO33WO4fwVmy83gpWICm9Nfx
 cAl5qU7htMNXAmyD2hG7tp4uqbIJ+i1+/w==
X-Google-Smtp-Source: ABdhPJxxAkvOetMWSv5ZbV8hcj3cXuj9enCqJ2z9mzSKXB6gtCCYbFNACVILKu4NurafdYLcuUz7jg==
X-Received: by 2002:aa7:8d0d:0:b029:1d7:3c52:e1f6 with SMTP id
 j13-20020aa78d0d0000b02901d73c52e1f6mr13877019pfe.39.1612728722757; 
 Sun, 07 Feb 2021 12:12:02 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 b129sm17006960pgc.52.2021.02.07.12.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Feb 2021 12:12:02 -0800 (PST)
Subject: Re: [PATCH v2 63/93] tcg/tci: Use ffi for calls
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-64-richard.henderson@linaro.org>
 <9d107cb2-ee8c-2a89-e004-9996a647a060@weilnetz.de>
 <9f552075-1783-dc8b-f338-23e12a138ffd@linaro.org>
 <CAFEAcA9TtuWaFo3cg_Qhxkg8gRqBNBkuHkSAJ-Lbxzbp23iR+w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <69d3bc09-aeb8-6a40-157e-bf0dc19c0035@linaro.org>
Date: Sun, 7 Feb 2021 12:12:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9TtuWaFo3cg_Qhxkg8gRqBNBkuHkSAJ-Lbxzbp23iR+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 11:52 AM, Peter Maydell wrote:
> On Sun, 7 Feb 2021 at 17:41, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 2/7/21 8:25 AM, Stefan Weil wrote:
>>>> +#include "qemu-common.h"
>>>> +#include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
>>>> +#include "exec/cpu_ldst.h"
>>>> +#include "tcg/tcg-op.h"
>>>> +#include "qemu/compiler.h"
>>>> +#include <ffi.h>
>>>> +
>>>
>>>
>>> ffi.h is not found on macOS with Homebrew.
>>>
>>> This can be fixed by using pkg-config to find the right compiler (and maybe
>>> also linker) flags:
>>>
>>> % pkg-config --cflags libffi
>>> -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ffi
>>> % pkg-config --libs libffi
>>> -lffi
>>
>>
>> Which is exactly what I do in the previous patch:
>>
>>
>>> +++ b/meson.build
>>> @@ -1901,7 +1901,14 @@ specific_ss.add(when: 'CONFIG_TCG', if_true: files(
>>>    'tcg/tcg-op.c',
>>>    'tcg/tcg.c',
>>>  ))
>>> -specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tcg/tci.c'))
>>> +
>>> +if get_option('tcg_interpreter')
>>> +  libffi = dependency('libffi', version: '>=3.0',
>>> +                      static: enable_static, method: 'pkg-config',
>>> +                      required: true)
>>> +  specific_ss.add(libffi)
>>> +  specific_ss.add(files('tcg/tci.c'))
>>> +endif
>>
>> Did you need a PKG_CONFIG_LIBDIR set for homebrew?
> 
> Is this the "meson doesn't actually add the cflags everywhere it should"
> bug again ?

I guess so.  I realized after sending this reply that PKG_CONFIG_LIBDIR can't
be the answer, since the original configure should have failed if pkg-config
didn't find ffi.

Was there a resolution to said meson bug?


r~

