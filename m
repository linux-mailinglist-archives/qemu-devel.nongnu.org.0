Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E0B4976E7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 02:42:05 +0100 (CET)
Received: from localhost ([::1]:54224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBoMt-0006l0-TS
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 20:42:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBoJi-0005zt-Vt
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:38:47 -0500
Received: from [2607:f8b0:4864:20::1030] (port=37811
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBoJh-0002ap-8m
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:38:46 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so14232423pju.2
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 17:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Drl/KqkMFaR+6Xl6L4izTwJEgZ+pFCVax2a1FnQYXXM=;
 b=RcAHindWlch61hnxGZakZwfA8yN47ZXZ78CBja4KyBIfTnQsdZJWaMKI3GHrXLSScg
 VxVhv6cPyOE9jgx2+uaKSDIx7lPHVLg4Ho6VPDfthkXM80uHhPaW0/j9/NdAZExDIKj8
 I2KrybmKE4CxGkVR29cl+wQJlk6YbYv8VRxsDzsHzXSZX1FtUS4g9/D6Pem/m1Ycd5xG
 g7M4fQMsF8PrO+HIgDohfsUJpGdNM08R/8lhqrVrNFT898O1oI9E6Kd13HvkcaIHRtPo
 QKB0Pl1LsWkRg+G5vuexMN/ytltJDXyriXVyJE+31mxQt6ZJO4B6F6WKeGbilOfRGDz0
 ttAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Drl/KqkMFaR+6Xl6L4izTwJEgZ+pFCVax2a1FnQYXXM=;
 b=UygCgLyaCopSxu2fjMYApCep9RI6Ty/YwJQfvynG7AQA3T1z6QK1JY0pL8aLnMtoqH
 aiBNVM6CNj9mv7N+NnmmjWGoF6rveT/aLCmCcUfcqjrkCX4famvUT8BwnWlLUOKnuBjS
 nKWEnNOuh7zTv+I2WMWs7SMQYJDXJtFvwnUAf3HtFi8QY/r8t5ff+Qi2Ge4uuEOUjh9e
 2d7yGBe/X+LnQNgMon/Nc2v+ztp0I055Onit+O8c2fstvljGc4oRXXIa85BpIvZx9pID
 UNknOrLbnmIhyRZfNZPsSOgZV7AsDqXS3i8qZuPdRMNVMsRU7IcZRISVOEUxfHBgysNK
 1IBw==
X-Gm-Message-State: AOAM533vS5lPIxh7rc16skXgFYYCCrJXo/3hZIlidzmfc7x4kJLwtgN5
 50mQICBb8ikR8q0ea7ku7Mvxww==
X-Google-Smtp-Source: ABdhPJyN8sBWj34MnxMDYBuMQYU0qrJs6+qC7vbS9s/dA7ioNiDPU12jZiq6e+h4B3TcQcYQd+srzg==
X-Received: by 2002:a17:90a:7e90:: with SMTP id
 j16mr10751153pjl.30.1642988323734; 
 Sun, 23 Jan 2022 17:38:43 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id me4sm17602892pjb.26.2022.01.23.17.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 17:38:43 -0800 (PST)
Subject: Re: [PATCH 10/30] bsd-user/signal.c: Implement signal_init()
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-11-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bddea574-4a35-51fa-f483-c15128f79082@linaro.org>
Date: Mon, 24 Jan 2022 12:38:38 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-11-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 3:19 AM, Warner Losh wrote:
> Initialize the signal state for the emulator. Setup a set of sane
> default signal handlers, mirroring the host's signals. For fatal signals
> (those that exit by default), establish our own set of signal
> handlers. Stub out the actual signal handler we use for the moment.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/qemu.h   |  1 +
>   bsd-user/signal.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 69 insertions(+)
> 
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 334f8b1d715..0e0b8db708b 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -97,6 +97,7 @@ typedef struct TaskState {
>       struct qemu_sigqueue sigqueue_table[MAX_SIGQUEUE_SIZE]; /* siginfo queue */
>       struct qemu_sigqueue *first_free; /* first free siginfo queue entry */
>       int signal_pending; /* non zero if a signal may be pending */
> +    sigset_t signal_mask;
>   
>       uint8_t stack[];
>   } __attribute__((aligned(16))) TaskState;
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index 7ea86149981..b2c91c39379 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -28,6 +28,9 @@
>    * fork.
>    */
>   
> +static struct target_sigaction sigact_table[TARGET_NSIG];
> +static void host_signal_handler(int host_sig, siginfo_t *info, void *puc);
> +
>   int host_to_target_signal(int sig)
>   {
>       return sig;
> @@ -47,6 +50,28 @@ void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
>       qemu_log_mask(LOG_UNIMP, "No signal queueing, dropping signal %d\n", sig);
>   }
>   
> +static int fatal_signal(int sig)
> +{
> +
> +    switch (sig) {
> +    case TARGET_SIGCHLD:
> +    case TARGET_SIGURG:
> +    case TARGET_SIGWINCH:
> +    case TARGET_SIGINFO:
> +        /* Ignored by default. */
> +        return 0;
> +    case TARGET_SIGCONT:
> +    case TARGET_SIGSTOP:
> +    case TARGET_SIGTSTP:
> +    case TARGET_SIGTTIN:
> +    case TARGET_SIGTTOU:
> +        /* Job control signals.  */
> +        return 0;
> +    default:
> +        return 1;
> +    }
> +}
> +
>   /*
>    * Force a synchronously taken QEMU_SI_FAULT signal. For QEMU the
>    * 'force' part is handled in process_pending_signals().
> @@ -64,8 +89,51 @@ void force_sig_fault(int sig, int code, abi_ulong addr)
>       queue_signal(env, sig, &info);
>   }
>   
> +static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
> +{
> +}
> +
>   void signal_init(void)
>   {
> +    TaskState *ts = (TaskState *)thread_cpu->opaque;
> +    struct sigaction act;
> +    struct sigaction oact;
> +    int i;
> +    int host_sig;
> +
> +    /* Set the signal mask from the host mask. */
> +    sigprocmask(0, 0, &ts->signal_mask);
> +
> +    /*
> +     * Set all host signal handlers. ALL signals are blocked during the
> +     * handlers to serialize them.
> +     */
> +    memset(sigact_table, 0, sizeof(sigact_table));
> +
> +    sigfillset(&act.sa_mask);
> +    act.sa_sigaction = host_signal_handler;
> +    act.sa_flags = SA_SIGINFO;
> +
> +    for (i = 1; i <= TARGET_NSIG; i++) {
> +        host_sig = target_to_host_signal(i);
> +        sigaction(host_sig, NULL, &oact);

Missing test for CONFIG_GPROF + SIGPROF.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

