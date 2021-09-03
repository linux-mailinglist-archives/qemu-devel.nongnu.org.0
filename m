Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFC140073D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:05:25 +0200 (CEST)
Received: from localhost ([::1]:35566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGNI-00033H-F0
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG5j-0007ur-1L
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:47:15 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG5h-0005nj-0r
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:47:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id z4so398812wrr.6
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FSFLIWzYo+eaeCm/kfoXWz4Mr7tA3xK5UL+qzyALlLc=;
 b=ZVTVV2bvTs+zuexSuolnPG00IQWYPofnKYu8JpFOnApxZZr06JHjwvE/wBfC0K/EP2
 5Ehb/y8zcu4xg1h/Djk10pewOdt0V8saeRRtsIwaDb1onRfxSaF9wYQjcJlc2RYHdgSk
 e59JHHT2TwJcJo1hKh1oa0pdiYhEUyw9gVR0JenmDXIzg3Vmgo52nne/kF/OMBawLQpk
 3elDwcvhCppw/TjySSfoKLjPVv2RBcYlLoRWTXhOhNSO1RMRoJnhLTBKFdymxFFYtNk1
 gu64e2ELNaFELW0Ay5VkdSZ390mCl4zllXV/65PpqrDHZ1nOzb7p16vuPmNZgwMT1MDa
 digg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FSFLIWzYo+eaeCm/kfoXWz4Mr7tA3xK5UL+qzyALlLc=;
 b=p4TcUMJXHAc86WtO2WInhORUQ4g/SgxNB8W28t/lMePtnn7Bl/j5WYz6G8IQ3bY2Tk
 hTKgWgmGRtz2nRkY+fRnB9RaymIIJC3rqFjwf3Sz9ODfVCbsGNv+hsFNaPk2UIZ5udNC
 MWaJcEFBkaywGUsMmg6gw7kWlRu428949ZHsj/jfoyLmHcnCAZ9J5PRUFZ0o6nF84zJN
 saaSkfzSI8HMacSAZFH4cIhzjKdMiteUJJadG0PpTyOTqKG34zcAJPs8fp1p7Qk1QUAA
 f9jNxTggbDyh2s6k7Ug4rJkLwJWWwUYOCnYg0u8zimiJN/3BgHNKsE7OHLlBNLYpUa63
 LOdQ==
X-Gm-Message-State: AOAM533DrryZDbCfd9pYyQS7IpG4yRQdTz2FbW3n9lXhPOUyXv+nZN4i
 dQwJBOpPqTLONgdACzD7fG9UNd1tsCjz87Evol8=
X-Google-Smtp-Source: ABdhPJwDaaRUTrEiYCaLJ0fulL/l7vYnc1IJ0uB4NE3YoljzF37y6z4TXQxqtnp848ofIK+oQveQCw==
X-Received: by 2002:adf:f490:: with SMTP id l16mr905486wro.136.1630702031764; 
 Fri, 03 Sep 2021 13:47:11 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id m3sm347206wrg.45.2021.09.03.13.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:47:11 -0700 (PDT)
Subject: Re: [PATCH v3 29/30] target/xtensa: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210903181507.761808-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87c0ff6c-e351-3f2e-b8e9-41d3cf342584@linaro.org>
Date: Fri, 3 Sep 2021 22:47:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903181507.761808-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 8:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/xtensa/cpu.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
> index c1cbd03595e..f7c3f368737 100644
> --- a/target/xtensa/cpu.c
> +++ b/target/xtensa/cpu.c
> @@ -43,18 +43,19 @@ static void xtensa_cpu_set_pc(CPUState *cs, vaddr value)
>       cpu->env.pc = value;
>   }
>   
> +#ifndef CONFIG_USER_ONLY
> +
> +#if defined(CONFIG_TCG)
>   static bool xtensa_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


