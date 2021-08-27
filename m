Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8243F93C0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:40:54 +0200 (CEST)
Received: from localhost ([::1]:45126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTfc-0001pU-V6
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJTec-00018a-Lv
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:39:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJTeY-0008M0-Mf
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:39:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so4109904wmi.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 21:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C/HqQCv5m3gUulihyo1T7uzp/nahsAE5UbvLNY/zSBU=;
 b=jxgdkJfFaEbNC/um8kou9OG7Wv0uLR7GPT6C84uuyDgCvL4L74vGfUrRfWnncgR8Br
 bwchsCkWiVOqlrqtqZRRFgF2ORf4viBZ0RWBwJ3ZtdqsXtGypPBXni+Tq0Jrbpy8Gyf6
 YdhY+p1can9Rgkl1mbDFqwtWbzNHXjm1CxfPVVQsjn7Ca35u+ZUwwWojt4uI5K4mHd+/
 pm52tO5SDJ2q36sYLS5pAMoeifF8rjvBd1qYy+3wd1kJNGIYPAA4YWf2Mkh6uEv39bsc
 V4mymC4AolZZtzVuTsXdf8h9pI5GUU/2TSH4GiuH/W03k4BhON5s212ZJJOnIom7x4Da
 bsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C/HqQCv5m3gUulihyo1T7uzp/nahsAE5UbvLNY/zSBU=;
 b=WnF0xc/FGVNX7qtjYGN1CZLIVgYO0VtQpxWL+XApP+ANW1bv+lPBjI7rT+HVkyP5yt
 iSDfw1QBPbXl+klCaXTydAgLdihvr045Fe2QyvFB473Kl7gopO9uix9r4rGv42yGcTju
 s2ih18SR2RnuaiIgrqTAl2VunrHhABhFWyvhNG02vvNC318FjwF0Eftmk0m8qVycxVVv
 RfhusC+wmo8gZLudtmNdLsZXEDSl35Ez6+e3yMMaKt38IeFJV8DrlnEG5ARDGTY6W37W
 5yQ5plhOecg0o9WIHJK40vEVMKF+y0BTeM/OG96xDJZSCjwyiMsp54ElD5cVn7Yu/ime
 2M+Q==
X-Gm-Message-State: AOAM533+fLS1UEkHBqCkyNkLTY+SixaoUuwMW47BBAxnpkl8eUEb/2Dt
 WSgjawXhEsf+BE/0baabZ3s=
X-Google-Smtp-Source: ABdhPJwjz16RhXmaCoqk0wgH3mIo7/PvGi13qRsOouovum0uue8D5rLuTXvdfu689cUA2tJTgEAm8g==
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr17516989wmg.162.1630039181122; 
 Thu, 26 Aug 2021 21:39:41 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id v5sm5390781wru.37.2021.08.26.21.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 21:39:40 -0700 (PDT)
Subject: Re: [PATCH v2 19/43] bsd-user: start to move target CPU functions to
 target_arch*
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-20-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1ff44d80-c62d-d844-b548-e1c6075c71eb@amsat.org>
Date: Fri, 27 Aug 2021 06:39:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826211201.98877-20-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
> From: Warner Losh <imp@FreeBSD.org>
> 
> Move the CPU functons into target_arch_cpu.c that are unique to each

Typo "functions"

> CPU. These are defined in target_arch.h.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/i386/target_arch.h       | 31 +++++++++++++
>  bsd-user/i386/target_arch_cpu.c   | 75 +++++++++++++++++++++++++++++++
>  bsd-user/main.c                   | 12 -----
>  bsd-user/x86_64/target_arch.h     | 31 +++++++++++++
>  bsd-user/x86_64/target_arch_cpu.c | 75 +++++++++++++++++++++++++++++++
>  configure                         |  7 +--
>  meson.build                       |  8 +++-
>  7 files changed, 219 insertions(+), 20 deletions(-)
>  create mode 100644 bsd-user/i386/target_arch.h
>  create mode 100644 bsd-user/i386/target_arch_cpu.c
>  create mode 100644 bsd-user/x86_64/target_arch.h
>  create mode 100644 bsd-user/x86_64/target_arch_cpu.c

> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index f7e1df5da5..7b3550898d 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -72,13 +72,6 @@ void gemu_log(const char *fmt, ...)
>      va_end(ap);
>  }
>  
> -#if defined(TARGET_I386)
> -int cpu_get_pic_interrupt(CPUX86State *env)
> -{
> -    return -1;
> -}
> -#endif

Let's avoid that using a stub.

> diff --git a/meson.build b/meson.build
> index f2e148eaf9..5fe6b4aae6 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2560,9 +2560,13 @@ foreach target : target_dirs
>      if 'CONFIG_LINUX_USER' in config_target
>        base_dir = 'linux-user'
>        target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
> -    else
> +    endif
> +    if 'CONFIG_BSD_USER' in config_target
>        base_dir = 'bsd-user'
> -      target_inc += include_directories('bsd-user/freebsd')
> +      target_inc += include_directories('bsd-user/' / targetos)
> +#     target_inc += include_directories('bsd-user/host/' / config_host['ARCH'])

Left-over?

> +      dir = base_dir / abi
> +      arch_srcs += files(dir / 'target_arch_cpu.c')
>      endif
>      target_inc += include_directories(
>        base_dir,
> 


