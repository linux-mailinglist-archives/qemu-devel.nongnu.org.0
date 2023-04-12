Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2AD6DF1D7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:20:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXZy-00048Z-20; Wed, 12 Apr 2023 06:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmXZv-00048Q-Ug
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:19:51 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmXZu-00016t-47
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:19:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v6so10324278wrv.8
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 03:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681294788; x=1683886788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MdMRVQyikzgklP5HeD0JaNCKv9EjjKEECDuNidbOaWU=;
 b=re7J+kpKqbqwYAfuCeZpmnkotwcvaEXakWvLPAFhGGnFXqBrZHLDomK+MYIOe235UH
 jQ1p4T4v/jJl8dk/K8U3p6bRbzRjxahkWHoO2S/6N5u7/uo13qgWygGtashU/KVvW7Zp
 /SyJ814crqrKb5EXG5aUFQfzHrfvoc8YJVirtXKLHyrtzOMKXBoFHerk+N+VtqqjDb03
 YgmmwkjtpXc7viFf3EwY9OHFe4miCb8LQPoxu83ml/YpLfzL7QyiqlbxxAwnrLW3ekJs
 V0WVPbWYQRiplY4bo0zropYwq7dGm9Rxu1yKj3//qpxmGnmmkcMa97IuJ/SkrinuUFZ2
 3kUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681294789; x=1683886789;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MdMRVQyikzgklP5HeD0JaNCKv9EjjKEECDuNidbOaWU=;
 b=LY1tTujWkBWRNBxT9V7APYDegZA2gN3e4IMSuMmlm/3jt5s90vB8UkmDb3YvQD4fvd
 e3a0Ulf2UMSMfyPVm6qWqFVHzY1CAE/XW/H8oqnXxEfSCAbNXE7ldmyYFV4Lygtempsj
 1jbuuNZYCx9FzzhyPRPon/88+22XKRPUceNTVWldDP4VJefItS16O0t1dkxkmN4Qy6/z
 QNpQnC3Z2RvKw/wBQtZxilZd/so7kpr39X3yAGu5uS3aNfDlAVXNxdRkY9Y8YlcSER2e
 d2c/e6HXCEwFUbbfXfJfpRs5eIrhGzIRbpETvjAZUSiJNNZuEx9bTCuZMUNt+OlF+XJK
 JZzw==
X-Gm-Message-State: AAQBX9fjf7bzOFeP9P79wWHCmdRcnQMLhZG/NB2OtbYkzYw092iZIDEj
 wLWzkesxdwdieJ7LnnKARGUX6w==
X-Google-Smtp-Source: AKy350bJwjU3/4IklcsuztuVaecKuk/4DL29jdt4pKo9bk7qTIc4GaSqJjsT5Q5lWnftKnLNYbik9w==
X-Received: by 2002:adf:ce05:0:b0:2e5:1da2:2a06 with SMTP id
 p5-20020adfce05000000b002e51da22a06mr4325364wrn.5.1681294788750; 
 Wed, 12 Apr 2023 03:19:48 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.216.226])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a5d6905000000b002efb4f2d240sm12828060wru.87.2023.04.12.03.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 03:19:48 -0700 (PDT)
Message-ID: <3d4d8f73-d96c-6616-0dc7-d839c84162bc@linaro.org>
Date: Wed, 12 Apr 2023 12:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: xen bits broke x32 build
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>
Cc: Joao Martins <joao.m.martins@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>, David Woodhouse <dwmw@amazon.co.uk>
References: <b7796732-6334-c68b-3baa-2354644152f8@msgid.tls.msk.ru>
 <7739b40d-d8ba-ccde-cc6c-5d9f2c93a663@msgid.tls.msk.ru>
 <CAFEAcA8DyTixWoeRpt3R7MHmLEwnvX5Y6ciCDaVj1n7K6GnOeQ@mail.gmail.com>
 <095a184b-a289-8807-efe8-882155b729c4@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <095a184b-a289-8807-efe8-882155b729c4@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 11/4/23 19:30, Michael Tokarev wrote:
> 11.04.2023 15:09, Peter Maydell wrote:
> ..
>> Frankly I would prefer to just say "we don't support x32".
>> It's a weird non-standard configuration that as far as I'm
>> aware is very little used. Its stats in the debian
>> popularity-contest graphs peaked at 18 users in 2017, and
>> have mostly been fluctuating between 1 and 3 for the last
>> couple of years:
>> https://popcon.debian.org/stat/sub-x32.png
> 
> x32 was a nice idea but it lacked some final steps for it
> to fly.

I used to use a FreeRTOS POSIX/ucontext port compiled in x32.
This was useful to mimic FreeRTOS baremetal ARM32 memory footprint.

I see having a x32 QEMU binary as a masochist experiment =)

> In my opinion anyway.  Its compactness and speed
> are fantastic, - qemu build is about 10..15% faster with
> x32 gcc than it is with x86_64 gcc.
> 
> At the time debian picked it up, it was not very usable
> b/c too many things didn't work and needed care.  Today,
> much more software actually works on x32. It is more,
> today with debian multiarch setup, it is possible to install
> some *parts* of the system to be x32 while the rest being
> x86_64, either for parts which benefits from x32 the most,
> or the other way around, main x32 and some parts x86_64.
> But it *still* lacks some infrastructure in debian, so it
> is possible to do with stable or testing distribution, -
> right now it is possible with unstable only.  Maybe we
> can change that for bookworm+.
> 
> The thing is that now, it is much more complete than it
> was in 2017, and it'd be really sad if it goes away.
> 
> x32 reveals some interesting problems in the code such
> as type misuse, it already helped to find and fix some
> bugs in some software, - for example in samba, where
> a pointer was misused to store a time_t (which would
> break with past-2038 time_t).

Why wasn't this caught by other 32-bit target?

> qemu never said it supports x32, and no one demanded
> such support from it. It's interesting to have it working
> there still, I *think*, as long as it does not require
> extra efforts.
> 
> I'm fine to maintain the change required to keep it at
> least buildable on x32 in debian - again as long as it
> does not require huge efforts.
> 
>> We're currently planning to deprecate-and-drop 32-bit x86
>> hosts, which are much more widely used than this. I see
>> no reason why we should care about this oddball failed
>> experiment of an ABI...
> 
> Thanks,
> 
> /mjt
> 


