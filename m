Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910A7366D08
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 15:42:38 +0200 (CEST)
Received: from localhost ([::1]:47406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZD7k-0001db-OO
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 09:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZD6e-000174-Cr
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 09:41:28 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZD6c-0002G6-D6
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 09:41:28 -0400
Received: by mail-ed1-x52a.google.com with SMTP id z5so12912318edr.11
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 06:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r4aOj4857a6LjiJ5O6tzWiXr53EGfDvJT65Jn2vk7wk=;
 b=FCEhksa3r/NqOBs4WjYAkIsYV+g11ktFUW0qBTdblbmrAMeE0q/IzXWXVNlJ8MmtnR
 EdWsithN+yigEkPb9wAR1n0ewdihLwk96P2FUr1b2qO6R9V01rVo3PWvF65JxnFY1De9
 QKCmMWlGunAfc3oYMTI4zLegwzPDfhfFMsOf9nBarD6PHl6clWqiagGnbYcPYBeF8Dfe
 CXYHyEC4dqiik7JAuAgBLh9K4H1h4z+tJyhpZXFGiyp+SG+Xk8MfDwdVOLwwmDVyrDht
 tRLgifq5QlokFrk7QKdHePfYhobY5hCz+WA3QT8BUBluKHIhVivRR4oGpJZwdrdTKyQH
 R6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r4aOj4857a6LjiJ5O6tzWiXr53EGfDvJT65Jn2vk7wk=;
 b=CByq0BSixm4KwIuXJV4i+ptEMN7H+c1kXH9o9JEfJsmkFGr5V8dRy0G1myeFXz4fqP
 iSr32LoUARWcdkKodEHG2EDuYZ5UXSLLFq4ZtJuLDsaS9TPcptH/EK7C0oi05/oZ8uFA
 ndXLvs/AnPWZ49KAuY7zc9ptU65hYuM6+oOZglOqdlGBUqykXOF83Ni7esk7eb0SU2hB
 HEuqg0VDd8ehdGQLnOHKGshomW6DBuMhJ/caIrYuQCFF5vcKnSm+uIA+1quPL+Jq4XIO
 SneJ1QVvsrG0Kqj0UCHckMMoDcIpFfq6xI25rohh6O1kxILc4OxOx9GkdRONJkPMIXqs
 7Hdg==
X-Gm-Message-State: AOAM531y226dRxjTb8S6ywXWxJEaCtEkhVtWPRHWkK1SjSvQ9exQmjGx
 ks6QC2tZGC2cYmEAuVksik4=
X-Google-Smtp-Source: ABdhPJy86sepQ+KjhzBeBkmXlPSa6brrnQSq0ML2iTomdRrngDJzACgY9afxJkC0Yv5iJLA+wzfgcg==
X-Received: by 2002:aa7:c707:: with SMTP id i7mr38683881edq.261.1619012484873; 
 Wed, 21 Apr 2021 06:41:24 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id lb18sm2451148ejc.6.2021.04.21.06.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 06:41:24 -0700 (PDT)
Subject: Re: [RFC PATCH] tests/tcg: add a multiarch signals test to stress
 test signal delivery
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20210421132931.11127-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <946cf021-4f1d-40f7-f8a9-d22a1e1cf48e@amsat.org>
Date: Wed, 21 Apr 2021 15:41:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421132931.11127-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Laurent

On 4/21/21 3:29 PM, Alex Bennée wrote:
> This adds a simple signal test that combines the POSIX timer_create
> with signal delivery across multiple threads.
> 
> [AJB: So I wrote this in an attempt to flush out issues with the
> s390x-linux-user handling. However I suspect I've done something wrong
> or opened a can of signal handling worms.
> 
> Nominally this runs fine on real hardware but I variously get failures
> when running it under translation and while debugging QEMU running the
> test. I've also exposed a shortcomming with the gdb stub when dealing
> with guest TLS data so yay ;-). So I post this as an RFC in case
> anyone else can offer insight or can verify they are seeing the same
> strange behaviour?]
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/multiarch/signals.c       | 149 ++++++++++++++++++++++++++++
>  tests/tcg/multiarch/Makefile.target |   2 +
>  2 files changed, 151 insertions(+)
>  create mode 100644 tests/tcg/multiarch/signals.c
> 
> diff --git a/tests/tcg/multiarch/signals.c b/tests/tcg/multiarch/signals.c
> new file mode 100644
> index 0000000000..998c8fdefd
> --- /dev/null
> +++ b/tests/tcg/multiarch/signals.c
> @@ -0,0 +1,149 @@
> +/*
> + * linux-user signal handling tests.
> + *
> + * Copyright (c) 2021 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include <stdarg.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include <pthread.h>
> +#include <string.h>
> +#include <signal.h>
> +#include <time.h>
> +#include <sys/time.h>
> +
> +static void error1(const char *filename, int line, const char *fmt, ...)
> +{
> +    va_list ap;
> +    va_start(ap, fmt);
> +    fprintf(stderr, "%s:%d: ", filename, line);
> +    vfprintf(stderr, fmt, ap);
> +    fprintf(stderr, "\n");
> +    va_end(ap);
> +    exit(1);
> +}
> +
> +static int __chk_error(const char *filename, int line, int ret)
> +{
> +    if (ret < 0) {
> +        error1(filename, line, "%m (ret=%d, errno=%d/%s)",
> +               ret, errno, strerror(errno));
> +    }
> +    return ret;
> +}
> +
> +#define error(fmt, ...) error1(__FILE__, __LINE__, fmt, ## __VA_ARGS__)
> +
> +#define chk_error(ret) __chk_error(__FILE__, __LINE__, (ret))
> +
> +/*
> + * Thread handling
> + */
> +typedef struct ThreadJob ThreadJob;
> +
> +struct ThreadJob {
> +    int number;
> +    int sleep;
> +    int count;
> +};
> +
> +static pthread_t *threads;
> +static int max_threads = 10;
> +__thread int signal_count;
> +int total_signal_count;
> +
> +static void *background_thread_func(void *arg)
> +{
> +    ThreadJob *job = (ThreadJob *) arg;
> +
> +    printf("thread%d: started\n", job->number);
> +    while (total_signal_count < job->count) {
> +        usleep(job->sleep);
> +    }
> +    printf("thread%d: saw %d alarms from %d\n", job->number,
> +           signal_count, total_signal_count);
> +    return NULL;
> +}
> +
> +static void spawn_threads(void)
> +{
> +    int i;
> +    threads = calloc(sizeof(pthread_t), max_threads);
> +
> +    for (i = 0; i < max_threads; i++) {
> +        ThreadJob *job = calloc(sizeof(ThreadJob), 1);
> +        job->number = i;
> +        job->sleep = i * 1000;
> +        job->count = i * 100;
> +        pthread_create(threads + i, NULL, background_thread_func, job);
> +    }
> +}
> +
> +static void close_threads(void)
> +{
> +    int i;
> +    for (i = 0; i < max_threads; i++) {
> +        pthread_join(threads[i], NULL);
> +    }
> +    free(threads);
> +    threads = NULL;
> +}
> +
> +static void sig_alarm(int sig, siginfo_t *info, void *puc)
> +{
> +    if (sig != SIGRTMIN) {
> +        error("unexpected signal");
> +    }
> +    signal_count++;
> +    __atomic_fetch_add(&total_signal_count, 1, __ATOMIC_SEQ_CST);
> +}
> +
> +static void test_signals(void)
> +{
> +    struct sigaction act;
> +    struct itimerspec it;
> +    timer_t tid;
> +    struct sigevent sev;
> +
> +    /* Set up SIG handler */
> +    act.sa_sigaction = sig_alarm;
> +    sigemptyset(&act.sa_mask);
> +    act.sa_flags = SA_SIGINFO;
> +    chk_error(sigaction(SIGRTMIN, &act, NULL));
> +
> +    /* Create POSIX timer */
> +    sev.sigev_notify = SIGEV_SIGNAL;
> +    sev.sigev_signo = SIGRTMIN;
> +    sev.sigev_value.sival_ptr = &tid;
> +    chk_error(timer_create(CLOCK_REALTIME, &sev, &tid));
> +
> +    it.it_interval.tv_sec = 0;
> +    it.it_interval.tv_nsec = 1000000;
> +    it.it_value.tv_sec = 0;
> +    it.it_value.tv_nsec = 1000000;
> +    chk_error(timer_settime(tid, 0, &it, NULL));
> +
> +    spawn_threads();
> +
> +    do {
> +        usleep(1000);
> +    } while (total_signal_count < 2000);
> +
> +    printf("shutting down after: %d signals\n", total_signal_count);
> +
> +    close_threads();
> +
> +    chk_error(timer_delete(tid));
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    test_signals();
> +    return 0;
> +}
> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
> index a3a751723d..3f283eabe6 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -30,6 +30,8 @@ testthread: LDFLAGS+=-lpthread
>  
>  threadcount: LDFLAGS+=-lpthread
>  
> +signals: LDFLAGS+=-lrt -lpthread
> +
>  # We define the runner for test-mmap after the individual
>  # architectures have defined their supported pages sizes. If no
>  # additional page sizes are defined we only run the default test.
> 

