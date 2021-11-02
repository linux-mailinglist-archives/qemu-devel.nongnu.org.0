Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0CD4439E8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:42:10 +0100 (CET)
Received: from localhost ([::1]:59264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi3Ps-0001y9-PA
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi3LN-0008SP-DN
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 19:37:29 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:40642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi3LK-0002vp-AX
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 19:37:28 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id b11so727686qvm.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 16:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=higN3TA3bhO5AwRXdd7DWxRGHM5dSrbbhXXx+VgKykg=;
 b=xnmcPtRAj8g5wJxu/M9skbLQ+iCUTfiWceTTPEmYukW2GpYZPy89IjEqKI0u/btwfW
 VgWCgne3gJTl4pJgOV0FrqbuzL5fsfSgM8u7I/jPIxdhlLbANrhLSwiNrO+/50dOeMYs
 lUvsIJ2KsC3W9Ym1NAgTx5n12H4rTWm4A0JjIVORricM9gR2a1EH24di/atJ3E9UNUK9
 tqByRKf+QUTsSlSaN/+u78VlZ0DX9H0+7YlYQU4glQVAn1wc1xatdknuFYC7RdjhxabK
 LsXPZM37Y9QchjumymcYw4fobYaHypCY9r1fI29tRdD8f5RxWSqo/auGixkv1Lr8Zbj7
 zuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=higN3TA3bhO5AwRXdd7DWxRGHM5dSrbbhXXx+VgKykg=;
 b=T4AtiTBxJwHjmGbW6gIwkjzDiHmfeV9kZy12aYDdxDq/qddmq1IhNsRnmjiLYXlluR
 /7NZozGwzWtIH5RNfKgZNQT/Njdc3tu0hl76uqNscBF+cZGEK7NdjeZoYcZSkuKiprUZ
 pIaPVWoN5Pq3TlNRl+M41EoEJOx8Jn77Evp3g7GgsP1ef4EFOZ1PV8ywtVhht7zjyRHR
 XozICXSVIun9s7iukApOrd4S0X8s/BuUrjeIgdl9IIsoxYtVnbqEalB6REgr2APD1ZEh
 eYKFne3HXZKy8+eDqLg2c2cxT10+Drzjm6nPn5XACCt6X5YdGDZTjh7Wi+rfcDpoG2iI
 ZkuA==
X-Gm-Message-State: AOAM530WQUQjL3bfJy4CAloYZQk2s6wQaRNM3efZ4cqM04EX8/xMoeTm
 UkEP4Lron+QQxT3TOEDufWwyIw==
X-Google-Smtp-Source: ABdhPJxyq/qwAQempDIoKWy1ardqK5hn8jzbfJPXqJo/TNn3IP3wHBRNzh58rmYSxFhl0VCs0eY56A==
X-Received: by 2002:ac8:5f88:: with SMTP id j8mr40963848qta.275.1635896245506; 
 Tue, 02 Nov 2021 16:37:25 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id v7sm311961qkd.41.2021.11.02.16.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 16:37:24 -0700 (PDT)
Subject: Re: [PATCH v2 01/30] bsd-user: Add stubs for new signal routines
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3a4d91dc-5726-ff89-a837-faefdff45a92@linaro.org>
Date: Tue, 2 Nov 2021 19:37:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-2-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 6:52 PM, Warner Losh wrote:
> Until the signal support is merged from the bsd-user fork, we need stubs
> for cpu_loop_exit_sigsegv and cpu_loop_exit_sigbus to link. These call
> abort after logging a message. Since singals aren't supported here
> yet, this is sufficient.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/signal.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index 0c1093deb1..05b277c642 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -20,6 +20,11 @@
>   #include "qemu/osdep.h"
>   #include "qemu.h"
>   
> +/*
> + * Stubbed out routines until we merge signal support from bsd-user
> + * fork.
> + */
> +
>   /*
>    * Queue a signal so that it will be send to the virtual CPU as soon as
>    * possible.
> @@ -36,3 +41,19 @@ void signal_init(void)
>   void process_pending_signals(CPUArchState *cpu_env)
>   {
>   }
> +
> +void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
> +                           MMUAccessType access_type, bool maperr, uintptr_t ra)
> +{
> +    qemu_log_mask(LOG_UNIMP, "No signal support for SIGSEGV\n");
> +    /* unreachable */
> +    abort();
> +}
> +
> +void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
> +                          MMUAccessType access_type, uintptr_t ra)
> +{
> +    qemu_log_mask(LOG_UNIMP, "No signal support for SIGBUS\n");
> +    /* unreachable */
> +    abort();
> +}
> 

I'm going to apply this directly to master as a build fix.
Sorry about that.


r~

