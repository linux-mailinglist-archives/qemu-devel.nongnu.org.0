Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15F869E7E5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 19:53:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUXkR-0004N8-Ra; Tue, 21 Feb 2023 13:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUXkL-0004M1-I5
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 13:52:13 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUXkA-00083A-Ev
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 13:52:13 -0500
Received: by mail-pj1-x1043.google.com with SMTP id
 co23-20020a17090afe9700b002341fadc370so5945566pjb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 10:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4J/R9/2n2j0CyXK47zLO5Uq0X3N2A8OyQZpqCLplJqw=;
 b=d3UZjPBk7zF9cCBz9P/0qaSBR5e5r9hp0fiRoJLmqak5Nzw3lf+/3YWf//GzG+W17b
 6ckZnlHhHqoxAnwWwpnFIuPSBz5Sh4F0yBcpyvzdfEmmZHtF3bfmZikt3jNRh0f+jBce
 BP/lrSVzQrNrIrC1REHP/4yW72WNCPGrCHsJXYQmrrYMpk6B2n8ZzKrPv9b+QzLcVdoC
 c04GPfC93nbmmKLlzN3sCZxBet2RcTzvlVZJYu0hd9lyLp84mAVWYnmacsArcB482UES
 et/XZ5ewB/GoZB0k/0xX41mLhZpTLKjHjb2mht/fsY6ToE5khMr6VWIWnaoi3yYvpvZq
 8ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4J/R9/2n2j0CyXK47zLO5Uq0X3N2A8OyQZpqCLplJqw=;
 b=kaDJFMCKVfc1ZeDXELGGkRx2u760lMXy0YjBQr9m++1GiJy/9N7PxRhjq4Ge84GGFI
 BlTjwcGIb3XZMiKAcBopyVXQ74zGxDs14kSDv0s1YsXAtWS31ODUe9lChDICDrCwUNk1
 m3JuwDoHInTWMHEBg6VEwFd978OcsYHj8MIZ3e3DrFUxbmodrt3UmwvOoXaa5tPSSegT
 uCUUlQtarDAk32OT1v/3xySslDZeg5WreFxc6MWA4AfspOz75M6sRW8/SPzR6jSK8hWI
 3irNlGE3x3emcAJYHRSvVaOPJG/Vr3wPISx6j/jPRMi65j7MzAPVSjyvAMQzR48IXl0Z
 SpRg==
X-Gm-Message-State: AO0yUKUVhRi61jBMZ3aC3iaKowSd3203V6vWyoBIbUriqbZzRKqFVTk8
 pvUhmB5KK1BooA2PSmv4V7Ohpw==
X-Google-Smtp-Source: AK7set/7eeVWRCEmW9dzVKgnrIItJ8q/O7KQb7FTGiFrzQae8HlWFPi+A0whgo02e3IOqpdDyl1nFA==
X-Received: by 2002:a05:6a20:3d11:b0:c7:6dac:aec0 with SMTP id
 y17-20020a056a203d1100b000c76dacaec0mr5294734pzi.27.1677005514685; 
 Tue, 21 Feb 2023 10:51:54 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 11-20020aa7910b000000b005a84de20c24sm9865572pfh.209.2023.02.21.10.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 10:51:54 -0800 (PST)
Message-ID: <663deab6-88ab-9780-ab4f-65de73eb5b0b@linaro.org>
Date: Tue, 21 Feb 2023 08:51:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PULL 0/7] tcg patch queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230220032338.5619-1-richard.henderson@linaro.org>
 <CAFEAcA_89gi6r-fmPSohpho2fOMu_oh-kBG6oQO+6uC0mZR1TQ@mail.gmail.com>
 <CAFEAcA_VqoEQKN4Guo=PVm_6usvz-HDW3Lb672P16rKNOEmf2g@mail.gmail.com>
 <CAFEAcA8-9EDDVz28WEbuKN7DyykiAvHY=5hY=NEp_S7POm+8SA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8-9EDDVz28WEbuKN7DyykiAvHY=5hY=NEp_S7POm+8SA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 2/21/23 05:52, Peter Maydell wrote:
>> It didn't happen on a rerun. But here's another one, clang-user build,
>> on the new test case:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/3806772115
>>
>> TEST linux-fork-trap-with-libsyscall.so on s390x
>> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> 
> This one fails consistently, so not an intermittent. Here's
> the retry job:
> https://gitlab.com/qemu-project/qemu/-/jobs/3807471447

Ah, the new linux-fork-trap test case is triggering a clang sanitizer abort within 
linux-user, i.e. exposing a latent bug:

https://gitlab.com/qemu-project/qemu/-/jobs/3807471447#L5064

I'll drop that one for a moment, and we can decide how to fix that later.


r~


