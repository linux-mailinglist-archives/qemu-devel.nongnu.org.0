Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA9E693340
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 20:13:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQvIS-0002lK-A7; Sat, 11 Feb 2023 14:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQvIQ-0002l9-Gy
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 14:12:26 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQvIO-0000aj-G5
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 14:12:26 -0500
Received: by mail-pj1-x1042.google.com with SMTP id bx22so8498621pjb.3
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 11:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lZlWtMHUWDFC0BFLnXD4oTDcnSYbYwmZTJvf1Dog69A=;
 b=e1yR4x4PY74BRqJ3Oww/raPmEUXSVApwdkvVUVPtvTK8D5uy/iVkd/5NsfDDLwPDOJ
 b/4eYyLhD81shn7VYQpsaEhAz7Kc81eXA9dNaFxrkKPKvcEWMJXEaZ3wQzA2AjnJRpKA
 Gm4xFIRYN0kLCGWpzi59HViV8ipBFQxsc2xTZjUE1Mtjbbj6HXuLcx7XK888XSMGFpOy
 ojR19xYJlRuCV9T34IpYmEuDqxMbBl8pRHWM6Uavmjpofl6QdAve2egtprrc+YZjratC
 AaQgwQUWhpMjdLBQUP8NLSJHdvFKe26hV54t3RXfZY1khtPRhe5uTby+SrQxQAi6BAfJ
 Rmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lZlWtMHUWDFC0BFLnXD4oTDcnSYbYwmZTJvf1Dog69A=;
 b=zyqcDPmXLEA7sFGxCxuTyNvAHn5TQaNRcPmnwLE+dhgUbn8ZOaQQoeFzXm3pFOWhMY
 U1X2z/We7SiHiKx+sbIALi1VA4Ra0IoReXMMVdr1FDQtUkQQhBktQOVQZgROo3xb4pV9
 5vtSPXGmPQLCMGLrb8BFRdWtyhZE3MN9ISwLc8yrbOy8RnvozrSJ591WgLvJedWq35+V
 95HjHagET0qUDkZyTr0CWjb4l5TGyzVWopq/ECSGEoOh7hhVd42wa4VmS8WK1H3C9Axv
 1p1iIPaWpyFt5N6E/b6N0JOzrfqQPOkR/gwfAKzF4L336fS0/FGX7lpZZ85/TFTyRRTc
 BwGw==
X-Gm-Message-State: AO0yUKUS5cjPdWJSR0waFrm5InwVkTBsAb/HCNYx+ZdAisUX1JA0Ls+P
 rPrYcQSf+4BDpPM5krIN4Oto1A==
X-Google-Smtp-Source: AK7set9RJwVkSfq/cV0WypkpTUy8gGTq7iyFE6tjkXAFLFawgJamBPOHmLV7PR7ZmsCtsuX97/l04g==
X-Received: by 2002:a17:903:247:b0:198:f0ec:18ad with SMTP id
 j7-20020a170903024700b00198f0ec18admr21726958plh.60.1676142742213; 
 Sat, 11 Feb 2023 11:12:22 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 jd17-20020a170903261100b00194caf3e975sm5317101plb.208.2023.02.11.11.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 11:12:21 -0800 (PST)
Message-ID: <ddbb80da-2062-e77c-992a-93e8d47e842b@linaro.org>
Date: Sat, 11 Feb 2023 09:12:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/9] bsd-user: Don't truncate the return value from
 freebsd_syscall
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Doug Rabson <dfr@rabson.org>
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210231829.39476-2-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 13:18, Warner Losh wrote:
> From: Doug Rabson <dfr@rabson.org>
> 
> System call return values on FreeBSD are in a register (which is spelled
> api_long in qemu). This was being assigned into an int variable which

s/api/abi/

> causes problems for 64bit targets.
> 
> Resolves: https://github.com/qemu-bsd-user/qemu-bsd-user/issues/40
> Signed-off-by: Doug Rabson <dfr@rabson.org>
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> [ Edited commit message for upstreaming into qemu-project ]
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-syscall.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
> index 57996cad8ae..b4a663fc021 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -512,7 +512,7 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
>                               abi_long arg8)
>   {
>       CPUState *cpu = env_cpu(cpu_env);
> -    int ret;
> +    abi_long ret;
>   
>       trace_guest_user_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
>       if (do_strace) {


