Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A5863E351
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 23:21:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0VRX-0007AU-1L; Wed, 30 Nov 2022 17:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0VRC-00073e-HD
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:20:33 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0VR7-0004JQ-G1
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:20:15 -0500
Received: by mail-pj1-x102f.google.com with SMTP id k5so95002pjo.5
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 14:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xi2JyIcc0MEikhXCLrphlkqFjAGO+ZhaaSCztTtYFZ8=;
 b=RNDCdxH7Vf/djJBcCocllQ0hftt7nocKoApZPNZyK0CT4RJaZERqkvCY0gUbZTGmcz
 D2K7EJg4wDZrNv18OLdJaY2+zMOuIc+m1tITl2qCi2crgnmCmfuovkToSBJU7pFWB+Q6
 Vdq+MMlWN3XQ3kE4ZUMG1cPDOQjL4IZSaxMFbDbZ51gKF8Qu3Se4y44y7EMAUmjbL2Me
 okhrfApKissZBxzoQvBeE0NOeQQa213kVvRgEjaPE0/ks7q0OmJRiquuzmEXe+Uvw7WW
 +F6GjfvB9pZXrDXaleNMx5/7ub2tp8Le3cIDAlGzjUe7+728uHhmfbShKCD7LNykKioO
 h8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xi2JyIcc0MEikhXCLrphlkqFjAGO+ZhaaSCztTtYFZ8=;
 b=v3UD4w3KC1IqSoJub/IvTijAL0BnI+kMymq74bwIlZbzgg5GilNlujb27Ol9nXM2fP
 5/VpxE8FfiCe5iege9q7kpmGx+4bjurOAE0VPosuPE319BezQ+rwf/7kkN9Do5nAa0TI
 5+ATX+/8S2wftsFyJPfcpDWFE1G5isG/Ju4DG1SSGGW+pow/pv9ttSqO3NbHN+JR9rXE
 UKmLy/H6sShnNoQnI6dwuPxiItXzr0AZ7KRmB7gQH0H6D+OZFKosJZ9cCL4eCv1F+Sow
 J19V01IfFergMn0LNSTzO+Ckc6GdgiruXWbrHI36lyJf4Sw/iN4Hck9EWBdWySvWSEkw
 Z19Q==
X-Gm-Message-State: ANoB5plHVcJSfko28zOc4D4pVNgltD+u2mIY1x9hVUY7BAflTSw1f5ND
 NGkQyiX7BAlHZrnTXw1z3wlQJw==
X-Google-Smtp-Source: AA0mqf6NpkHi5zPC5I6TGGYiSKtfdHfPNRsVEym9BbM7wHNRGxeaJrWuJrxXRU2pg71AF2f6+2KEvA==
X-Received: by 2002:a17:902:c186:b0:189:7644:c46d with SMTP id
 d6-20020a170902c18600b001897644c46dmr23269594pld.155.1669846812038; 
 Wed, 30 Nov 2022 14:20:12 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 b207-20020a621bd8000000b00562677968aesm1860549pfb.72.2022.11.30.14.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 14:20:11 -0800 (PST)
Message-ID: <85dd7855-da03-fec7-cafe-e233fec135d9@linaro.org>
Date: Wed, 30 Nov 2022 14:20:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 4/5] cpu: Move cpu_abort() to common code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>
References: <20221130135241.85060-1-philmd@linaro.org>
 <20221130135241.85060-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221130135241.85060-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 11/30/22 05:52, Philippe Mathieu-Daudé wrote:
> This code is not target-specific.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   cpu.c         | 38 --------------------------------------
>   cpus-common.c | 38 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/cpu.c b/cpu.c
> index 385e72e140..d6936a536b 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -31,11 +31,9 @@
>   #endif
>   #include "sysemu/tcg.h"
>   #include "sysemu/kvm.h"
> -#include "sysemu/replay.h"
>   #include "exec/cpu-common.h"
>   #include "exec/exec-all.h"
>   #include "exec/translate-all.h"
> -#include "exec/log.h"
>   #include "hw/core/accel-cpu.h"
>   #include "trace/trace-root.h"
>   #include "qemu/accel.h"
> @@ -270,42 +268,6 @@ void cpu_single_step(CPUState *cpu, int enabled)
>       }
>   }
>   
> -void cpu_abort(CPUState *cpu, const char *fmt, ...)
> -{
> -    va_list ap;
> -    va_list ap2;
> -
> -    va_start(ap, fmt);
> -    va_copy(ap2, ap);
> -    fprintf(stderr, "qemu: fatal: ");
> -    vfprintf(stderr, fmt, ap);
> -    fprintf(stderr, "\n");
> -    cpu_dump_state(cpu, stderr, CPU_DUMP_FPU | CPU_DUMP_CCOP);
> -    if (qemu_log_separate()) {
> -        FILE *logfile = qemu_log_trylock();
> -        if (logfile) {
> -            fprintf(logfile, "qemu: fatal: ");
> -            vfprintf(logfile, fmt, ap2);
> -            fprintf(logfile, "\n");
> -            cpu_dump_state(cpu, logfile, CPU_DUMP_FPU | CPU_DUMP_CCOP);
> -            qemu_log_unlock(logfile);
> -        }
> -    }
> -    va_end(ap2);
> -    va_end(ap);
> -    replay_finish();
> -#if defined(CONFIG_USER_ONLY)
> -    {
> -        struct sigaction act;
> -        sigfillset(&act.sa_mask);
> -        act.sa_handler = SIG_DFL;
> -        act.sa_flags = 0;
> -        sigaction(SIGABRT, &act, NULL);
> -    }
> -#endif
> -    abort();
> -}
> -
>   /* physical memory access (slow version, mainly for debug) */
>   #if defined(CONFIG_USER_ONLY)
>   int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
> diff --git a/cpus-common.c b/cpus-common.c
> index 8fdb34740e..38af2ab840 100644
> --- a/cpus-common.c
> +++ b/cpus-common.c
> @@ -21,9 +21,11 @@
>   #include "qemu/main-loop.h"
>   #include "exec/cpu-common.h"
>   #include "exec/memory.h"
> +#include "exec/log.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/core/cpu.h"
>   #include "sysemu/cpus.h"
> +#include "sysemu/replay.h"
>   #include "qemu/lockable.h"
>   #include "trace/trace-root.h"
>   
> @@ -485,3 +487,39 @@ void cpu_breakpoint_remove_all(CPUState *cpu, int mask)
>           }
>       }
>   }
> +
> +void cpu_abort(CPUState *cpu, const char *fmt, ...)
> +{
> +    va_list ap;
> +    va_list ap2;
> +
> +    va_start(ap, fmt);
> +    va_copy(ap2, ap);
> +    fprintf(stderr, "qemu: fatal: ");
> +    vfprintf(stderr, fmt, ap);
> +    fprintf(stderr, "\n");
> +    cpu_dump_state(cpu, stderr, CPU_DUMP_FPU | CPU_DUMP_CCOP);
> +    if (qemu_log_separate()) {
> +        FILE *logfile = qemu_log_trylock();
> +        if (logfile) {
> +            fprintf(logfile, "qemu: fatal: ");
> +            vfprintf(logfile, fmt, ap2);
> +            fprintf(logfile, "\n");
> +            cpu_dump_state(cpu, logfile, CPU_DUMP_FPU | CPU_DUMP_CCOP);
> +            qemu_log_unlock(logfile);
> +        }
> +    }
> +    va_end(ap2);
> +    va_end(ap);
> +    replay_finish();
> +#if defined(CONFIG_USER_ONLY)

CONFIG_USER_ONLY is build specific.

r~

