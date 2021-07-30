Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D843DBFE1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:38:01 +0200 (CEST)
Received: from localhost ([::1]:43810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9ZGa-0003oJ-VH
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1m9ZFa-00036g-NX
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:36:58 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:44018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1m9ZFY-0004PR-WD
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:36:58 -0400
Received: by mail-oi1-x235.google.com with SMTP id z26so14860380oih.10
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BuWJgynsW6+FpGDzQFebnl0GVOIvdvoyVRGmUkkxWLo=;
 b=g5gcJIq8VadQTYT+yO9kOTBaBIVGehtEmd+zRvdrsT0x+3RmXteT6OygVgfygsYEzK
 uZIuJ+dqw4oyTWWKNdtzkXh31IcypBSR+wAg8PZh9TzP6nWivUeEH4Vyi+l4+iRFnZZ1
 eCisl7/skUI6N6gjqw35X0TKnOyWB43jGo7jvE/U5KHC3KClKl96voh3gqCfGgFgn0kf
 Ovgg5hvLgVL6F6DEcs4fap9t//SQhj2Ivf0iW0sWGqeJY/17d7Yg8fzkqFc/q4X271xd
 bZpNo8qNGhBZGp/qU/Br3LNIC9ZLr4i1+vzXTux1fgnnYCopp7irAoob/2sTu1BjDLc7
 GtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BuWJgynsW6+FpGDzQFebnl0GVOIvdvoyVRGmUkkxWLo=;
 b=CAGPzv12yQ8T/ULXTOz62yg6OiIDF1RVcilqQJvgbiYmNDXWUg8UwYBkGi63oJX7iF
 C60HeUULdfrEL1PhCeztxL4mgcPT+bS0hCBpcGyiNuSgb7sXSrPNDCCk9kOdwWP0wcvH
 hPmxaiq6ZIJqp/prdPNAEmKDqNC/q/2yWp6jUrWvw3Inmsn+u/h/LaQsLowHY82dJ6O0
 EjNUyKjAtxqN7RO7ZsP138J7QPDOIOMpLv+iVQJK1FoQjM1CTwUGzpw2tfB35F09n8iT
 bgz8Rr/o9V76dmOvaU5EgWaaAeDjmPqizJ9XE2b3KLwC7/tUNHxn49P0QeIqLOpoPO6k
 izkQ==
X-Gm-Message-State: AOAM531xAUu4CXsZW3J1zKXA/LJeYZ9X8vHetO2XPoZlakB2++R+kw0t
 iObEkIj3q0KKVIofcTji4txdrw==
X-Google-Smtp-Source: ABdhPJxLulHu371gyQwX9+Nu2NA6fkQX5cPZcSkrxl8Dt6P/2vETTMERbGM50LKn14xXizmEz/Fk5w==
X-Received: by 2002:aca:3194:: with SMTP id x142mr3012019oix.93.1627677414169; 
 Fri, 30 Jul 2021 13:36:54 -0700 (PDT)
Received: from [192.168.86.154] ([136.62.4.88])
 by smtp.gmail.com with ESMTPSA id t144sm472108oih.57.2021.07.30.13.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:36:53 -0700 (PDT)
Subject: Re: [PATCH for-6.2 12/43] target/sh4: Implement do_unaligned_access
 for user-only
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "D. Jeff Dionne" <jeff@coresemi.io>, Rich Felker <dalias@libc.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-13-richard.henderson@linaro.org>
 <CAFEAcA9yrj7OZPkeZ2jUqAV4+ULVYm4++y6kXeK2_MC8gR3-bg@mail.gmail.com>
From: Rob Landley <rob@landley.net>
Message-ID: <10961631-89c0-1790-0628-c9106f6e19b1@landley.net>
Date: Fri, 30 Jul 2021 15:54:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9yrj7OZPkeZ2jUqAV4+ULVYm4++y6kXeK2_MC8gR3-bg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::235;
 envelope-from=rob@landley.net; helo=mail-oi1-x235.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/29/21 8:52 AM, Peter Maydell wrote:
> On Thu, 29 Jul 2021 at 02:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  linux-user/sh4/cpu_loop.c | 8 ++++++++
>>  target/sh4/cpu.c          | 2 +-
>>  target/sh4/op_helper.c    | 3 ---
>>  3 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
>> index 222ed1c670..21d97250a8 100644
>> --- a/linux-user/sh4/cpu_loop.c
>> +++ b/linux-user/sh4/cpu_loop.c
>> @@ -71,6 +71,14 @@ void cpu_loop(CPUSH4State *env)
>>              info._sifields._sigfault._addr = env->tea;
>>              queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>>              break;
>> +        case 0xe0:
>> +        case 0x100:
>> +            info.si_signo = TARGET_SIGBUS;
>> +            info.si_errno = 0;
>> +            info.si_code = TARGET_BUS_ADRALN;
>> +            info._sifields._sigfault._addr = env->tea;
>> +            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>> +            break;
> 
> sh4 kernel default for unaligned accesses seems to be "warn and fixup",
> not SIGBUS, unless the user changes that by writing to /proc/cpu/alignment
> or the process changes it via prctl().

It's still good to know, qemu-sh4 runs j-core binaries but that target doesn't
have unaligned interrupts yet. (I think it just masks off the bottom 2 bits to
do the next lowest aligned access? It's an sh2 variant and the plumbing to let
interrupts restart multi-clock instructions is only in the j32 branch so far, so
the j2 and ice40 targets don't generate interrupts for it. Todo item, in the
meantime we need to clean unaligned access out of application code so faulting
on it is good.)

> -- PMM

Thanks,

Rob

