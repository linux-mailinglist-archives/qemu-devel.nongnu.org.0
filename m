Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC0C33BDD6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:50:12 +0100 (CET)
Received: from localhost ([::1]:39366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLoXq-0003Bt-R3
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLoWW-0002g0-4u
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:48:48 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLoWT-0001h0-U0
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:48:47 -0400
Received: by mail-wr1-x432.google.com with SMTP id a18so8810563wrc.13
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 07:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Atkhcv+Z1akE4ETbiNk/Ptzvx2rP0Y9dDYZsavyetd0=;
 b=gTHsDPD3lg8v9vrVuSjMx1/iL914FpWDHBSATKqT5FW6zZ03E1vHyalMlf51pb7dqJ
 QXz8U+4n5k5T5gqdFJSL4823Zz6G43UdJCZ9aqistEefEKbqyJGhbiM0OblO1JRVN61B
 TXHbHFpHcccBlbyFxmQ+JPBAUmh7l7SR1oa3o8Zz3Ji2W6fB9pkBCpgy2M+YOnRInA43
 HI21PYPGXU45BWv4aIW9/xovI/dgumA2vAKrlfLTnzGbg5Temv3ctuq+2HMP+eCuxj+y
 MpxFE9rEhDjVSERVjAp0eq9ZI1GqY0ASapqVdls5CWgnUuBafmJSuVm0BYcBlQpEkB0K
 ArvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Atkhcv+Z1akE4ETbiNk/Ptzvx2rP0Y9dDYZsavyetd0=;
 b=oAZqGV419taNWq3QVCpgmN+Zwc66YWYscSwNo0/rfNdcP5NlOwa0twEAy/cLfzySXs
 gOnIFfj0eIEON7gmUWoZZHRAs1SkKTKP2dfTJJ6tE8Y/TJDcTlKUV1IOXtRNOHzAg6k2
 2qguOhJzIb7y3AMTgejEaxxVuX/LPfYQ4d4KRguTo/374PJ8g8U5wqXeQIfvkYcgxI35
 kuZYhFpEQzxiCScdlCOpMJpwgM5Nwz38Wh85BzicSnWcLT+7f3SDhhyF3HaqINq9mQh/
 F5TqgSoICSJZSlkAUbP6dePdC9toHf2Z1eXHtSrCimRR1+EN3owZpqBlyE5XPTLn2VC2
 BvvA==
X-Gm-Message-State: AOAM530xGdG2KJ6ehTp3oRVxxQpqEDQLPUPyCir4qg9r2yBYZRr/gCHT
 NWydfFrtfOGC9YIL5SLcD8I=
X-Google-Smtp-Source: ABdhPJzqIykG/r+Ns2gcr639hoCnX0GmeFUbFTNANjJBA4cfsPPqW/48mIHVbx9aQl2uFOKTo1Hulw==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr74028wrr.118.1615819724139;
 Mon, 15 Mar 2021 07:48:44 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c9sm12239052wml.42.2021.03.15.07.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 07:48:43 -0700 (PDT)
Subject: Re: [PATCH 3/6] accel/tcg: Restrict tb_gen_code() from other
 accelerators
To: Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-4-f4bug@amsat.org>
 <7359d7bd-ed7d-71ad-3610-b839c9c99fd5@suse.de>
 <d9e691d9-9e87-6a47-c06d-ce2376f370f8@linaro.org>
 <0baee669-a6c1-2e25-5272-c654689fe6b7@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <07edfd36-0a54-0ffe-cd0f-09a146da083f@amsat.org>
Date: Mon, 15 Mar 2021 15:48:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <0baee669-a6c1-2e25-5272-c654689fe6b7@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 2:52 PM, Claudio Fontana wrote:
> On 1/21/21 7:06 AM, Richard Henderson wrote:
>> On 1/17/21 11:12 PM, Claudio Fontana wrote:
>>> On 1/17/21 5:48 PM, Philippe Mathieu-Daudé wrote:
>>>> tb_gen_code() is only called within TCG accelerator,
>>>> declare it locally.
>>>
>>> Is this used only in accel/tcg/cpu-exec.c ? Should it be a static function there?
>>
>> Possibly, but there's a *lot* of code that would have to be moved.  For now,
>> queuing a slightly modified version of the patch.
>>
>>>> --- a/accel/tcg/user-exec.c
>>>> +++ b/accel/tcg/user-exec.c
>>>> @@ -28,6 +28,7 @@
>>>>  #include "qemu/atomic128.h"
>>>>  #include "trace/trace-root.h"
>>>>  #include "trace/mem.h"
>>>> +#include "internal.h"
>>
>> Not needed by this patch.
>>
>>
>> r~
>>
> 
> Hello,
> 
> resurrecting this, and in reference to its commit: "c03f041f128301c6a6c32242846be08719cd4fc3",
> 
> the name "internal.h" ends up polluting the include paths,
> so that when working for example on s390x, including "internal.h" ends up including this instead of the file in target/s390x/.
> 
> I am not sure what exactly the right solution is, for this specific problem,
> and if we should look at the include paths settings in detail,
> 
> but in my view calling files just "internal.h" or "internals.h" in general is not a good idea.
> 
> I can see two issues with this naming:
> 
> 1) it describes nothing about the actual intended contents, other that they should be "internal".
> Rather it would be better to know what the file is intended to contain, or we end up (as we end up) with very large files containing completely unrelated content.
> 
> 2) we end up with clashes in our include paths if we are not super careful.
> 
> Probably in this case, the target/s390x/internal.h could be given another name (s390x-internal.h) and then split up in the future (there is a whole bunch of unrelated suff).
> 
> For accel/tcg/internal.h, maybe renaming it, or removing it altogether could both be good options?

I think something like commit ed5bad39e57 is required, restricting
the scope of:

  add_project_arguments('-iquote',
                        meson.current_source_dir() / 'tcg' / tcg_arch,

... to tcg, and ...
                        '-iquote',
                        meson.current_source_dir() / 'accel/tcg',

to accel.

                        language: ['c', 'cpp', 'objc'])

