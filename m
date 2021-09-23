Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13834417210
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:42:19 +0200 (CEST)
Received: from localhost ([::1]:38970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkWw-00068g-4F
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjse-0007ER-42
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:40 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:38516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsb-0003UL-EP
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:38 -0400
Received: by mail-qk1-x72a.google.com with SMTP id q81so24008735qke.5
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1K3C7wpdh6xsCLOHq2i6VXUiejwqN8/CiE6ajEtPp3A=;
 b=NZGN6ohGA/6rpePUm5JNB4V6OW3lV7ne0GH6+UCGZrTLuJO9UfiMvGaI4OhYwkc7gk
 3ewZ0/1L9Q/giuWwFpDi5hAGxBynnoZ2B7G0Cf31AtoRrHlks4RXItv6G/dDixkaDjLt
 5k+mL2CzC/SNAiDrl1h7ZDuZX3bSptxC7nFO6iQXs9OIxN+H15nCPE1XlK0X1UuqKO+X
 FN0F8bzz7ScyimRoH3Ut7ed8to0Y68gn6Do7PelODhJx0MN8LGuF9YPf2fddYI++Lzku
 9xh6OIIpI3Mi3bCVuVhMx1btThxepuuwXDzdcjuvLiqxU7/nYfrsUKQF5cPpNIjw9uMt
 ihzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1K3C7wpdh6xsCLOHq2i6VXUiejwqN8/CiE6ajEtPp3A=;
 b=G8SoKscpoUuzxcAsRyDwQTQSMWnfJtlpF43fiRlHrDeCVYd8HvqKqBVykqsouvBFSH
 o7AgVsEg05cdUYuH09dNLb/BARjMN8K/fsBuHRMu/H+/Nw/tvD5342g7x+OwCDSO4BaG
 UvgwXB9vio74hN+bNxORFDvG6uB+sDFwfQ+r3/0ZLGT+iIiMxuUKIrwFElZNiQ4Pjg93
 CKHzbQlTRtd+N61c9qDIxuGPGT907uEAZ/exW7kDPx7O5kjOV3N2diEGajhxuSUU87Zh
 R7SZX9rCGKqdManE54cE/ed8RhaB+OWd1sme5T+RXXRLn3TYfA1nJcaoGNIQQYVNKWiz
 7ZpA==
X-Gm-Message-State: AOAM530hlXih1jhUY9dOkdWJCaSQtcPXtgAQogNMYKM+NNLEfDhCcJD6
 Ee+9k5WiXLRCKLP44rf1VXGG6w==
X-Google-Smtp-Source: ABdhPJyzussc2whQmGho6a1CAJe/6hI7zl6Fb2QeufB2PtPYGjjFG4BXfosQsHCWl3no2psShcx+zw==
X-Received: by 2002:ae9:e90a:: with SMTP id x10mr10111625qkf.308.1632484836502; 
 Fri, 24 Sep 2021 05:00:36 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id b14sm4797049qtk.64.2021.09.24.05.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:36 -0700 (PDT)
Subject: Re: [PATCH 14/14] bsd-user/signal: Create a dummy signal queueing
 function
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-15-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f21d9a3-fe08-22e7-45f9-27dae0c1c6ba@linaro.org>
Date: Thu, 23 Sep 2021 11:13:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922061438.27645-15-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:14 PM, Warner Losh wrote:
> Create dummy signal queueing function so we can start to integrate other
> architectures (at the cost of signals remaining broken) to tame the
> dependency graph a bit and to bring in signals in a more controlled
> fashion.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/qemu.h   | 1 +
>   bsd-user/signal.c | 8 ++++++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 5a2fd87e44..85d1f8fd2a 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -209,6 +209,7 @@ void process_pending_signals(CPUArchState *cpu_env);
>   void signal_init(void);
>   long do_sigreturn(CPUArchState *env);
>   long do_rt_sigreturn(CPUArchState *env);
> +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
>   abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
>   
>   /* mmap.c */
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index ad6d935569..4e7f618944 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -19,6 +19,14 @@
>   #include "qemu/osdep.h"
>   
>   #include "qemu.h"
> +/*

Whacky whitespace.

> + * Queue a signal so that it will be send to the virtual CPU as soon as
> + * possible.
> + */
> +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
> +{
> +    return 1;
> +}

Both here and in linux-user, there are no error conditions.  We should change the return 
to void.

Also, consider folding in the signal-common.h cleanup soon.
But don't let either hold you up too much with rebasing.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

