Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BD5534CA6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 11:43:45 +0200 (CEST)
Received: from localhost ([::1]:50832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuA1w-00020Q-QX
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 05:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nu9w4-0006gv-HV
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:37:40 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nu9vx-00049P-2V
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:37:40 -0400
Received: by mail-ej1-x62f.google.com with SMTP id m20so1860076ejj.10
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 02:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hGuyL6Ixwy7jfARGW7TtdGQ4RXXaQ69r5ul6qRueis8=;
 b=YSijjWgejzAMgSrrDoEr3QdA+B1p9GVbi0bbVVUMPYM+QdRBMd5Avpl4CQtDObUuVV
 /M7yeeCBvLCkka8pzeIsLQ/AcJqz8JmodJN5uOkQ56yV1REqpIYxKkRUW6J+m8F4AMZR
 Raa0sz/viOqFeqWzen1+mUQHQiyw7QGa7vpCgpUaLMo2pL9te3lV8V0aXhFKhNuNGptR
 CMqN/FfQeZ+U7lhw4qBAOKkU+hPlUeZ7L5Swj3H2ttFlkFD6gIqBL/TW/GPHB/+GFbvJ
 U2cjXJfmRc6rVZ4hneEoXThInqTI941puef9r6duFSQcbalO0X+4/JXCcjl/oNJ1exUa
 6VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hGuyL6Ixwy7jfARGW7TtdGQ4RXXaQ69r5ul6qRueis8=;
 b=g4xKcyupWnQVERAG8G/3Kn92gEDDHpNtueqld+dXPODvWhQzLebZsZFQjJP962D9dO
 npXOCqmzRQkDCmWIImOFS2am4bQE2GdWIMKbC61RdJg+6Nq8ELOer20CwsvbddvXTFmo
 pM8EzpnZhn0B4ttLz3HfLX4bNSWLo/71+eBh34RsmDwkqhLscDx7scYB2YUGd9XmML5M
 /E/yMvvE6h9CeDbepTtcxSLcqqPfRjsSR2JvNq6vVI7a8MXvgpUyQSBDzzqjLSiWUyFV
 wJhmD+lbEl5GiQ6BrQhBv3qfFHbwz+TykPyZoEe5ML24rnL4hrfxGa/QPiTkdu4WuTHA
 Jr3A==
X-Gm-Message-State: AOAM530J7nCb1Cv5hxA2xYvADA1D+wkCBfmIrhYh2NLIAPb4DMDFiNgI
 wBWHHt+j0QiHLDFVRolRnSw=
X-Google-Smtp-Source: ABdhPJygLwkpsiv6EcxbVwMWrB9GUheKdujgok3EdIP3TMDAy/Fti6lz+jejEkoj1p/RYrDaZlR7uA==
X-Received: by 2002:a17:906:22ce:b0:6fe:9403:a4c0 with SMTP id
 q14-20020a17090622ce00b006fe9403a4c0mr32616831eja.528.1653557850010; 
 Thu, 26 May 2022 02:37:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 y8-20020a056402358800b0042617ba63b3sm577429edc.61.2022.05.26.02.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 02:37:29 -0700 (PDT)
Message-ID: <7a7d78b5-5c8a-3817-ec7c-27789586076f@redhat.com>
Date: Thu, 26 May 2022 11:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 2/9] replay: notify vCPU when BH is scheduled
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, crosa@redhat.com, f4bug@amsat.org
References: <165355470196.533615.1219754093587154582.stgit@pasha-ThinkPad-X280>
 <165355471287.533615.6762485479325805298.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <165355471287.533615.6762485479325805298.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/22 10:45, Pavel Dovgalyuk wrote:
> vCPU execution should be suspended when new BH is scheduled.
> This is needed to avoid guest timeouts caused by the long cycles
> of the execution. In replay mode execution may hang when
> vCPU sleeps and block event comes to the queue.
> This patch adds notification which wakes up vCPU or interrupts
> execution of guest code.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

At least aio_bh_schedule_oneshot_full should have the same effect, so 
should this be done at a lower level, in aio_bh_enqueue() or even 
aio_notify()?

Paolo

> --
> 
> v2: changed first_cpu to current_cpu (suggested by Richard Henderson)
> ---
>   include/sysemu/cpu-timers.h |    1 +
>   softmmu/icount.c            |    8 ++++++++
>   stubs/icount.c              |    4 ++++
>   util/async.c                |    8 ++++++++
>   4 files changed, 21 insertions(+)
> 
> diff --git a/include/sysemu/cpu-timers.h b/include/sysemu/cpu-timers.h
> index ed6ee5c46c..2e786fe7fb 100644
> --- a/include/sysemu/cpu-timers.h
> +++ b/include/sysemu/cpu-timers.h
> @@ -59,6 +59,7 @@ int64_t icount_round(int64_t count);
>   /* if the CPUs are idle, start accounting real time to virtual clock. */
>   void icount_start_warp_timer(void);
>   void icount_account_warp_timer(void);
> +void icount_notify_exit(void);
>   
>   /*
>    * CPU Ticks and Clock
> diff --git a/softmmu/icount.c b/softmmu/icount.c
> index 5ca271620d..1cafec5014 100644
> --- a/softmmu/icount.c
> +++ b/softmmu/icount.c
> @@ -486,3 +486,11 @@ void icount_configure(QemuOpts *opts, Error **errp)
>                      qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
>                      NANOSECONDS_PER_SECOND / 10);
>   }
> +
> +void icount_notify_exit(void)
> +{
> +    if (icount_enabled() && current_cpu) {
> +        qemu_cpu_kick(current_cpu);
> +        qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
> +    }
> +}
> diff --git a/stubs/icount.c b/stubs/icount.c
> index f13c43568b..6df8c2bf7d 100644
> --- a/stubs/icount.c
> +++ b/stubs/icount.c
> @@ -43,3 +43,7 @@ void icount_account_warp_timer(void)
>   {
>       abort();
>   }
> +
> +void icount_notify_exit(void)
> +{
> +}
> diff --git a/util/async.c b/util/async.c
> index 554ba70cca..75f50f47c4 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -33,6 +33,7 @@
>   #include "block/raw-aio.h"
>   #include "qemu/coroutine_int.h"
>   #include "qemu/coroutine-tls.h"
> +#include "sysemu/cpu-timers.h"
>   #include "trace.h"
>   
>   /***********************************************************/
> @@ -185,6 +186,13 @@ void qemu_bh_schedule_idle(QEMUBH *bh)
>   void qemu_bh_schedule(QEMUBH *bh)
>   {
>       aio_bh_enqueue(bh, BH_SCHEDULED);
> +    /*
> +     * Workaround for record/replay.
> +     * vCPU execution should be suspended when new BH is set.
> +     * This is needed to avoid guest timeouts caused
> +     * by the long cycles of the execution.
> +     */
> +    icount_notify_exit();
>   }
>   
>   /* This func is async.
> 
> 


