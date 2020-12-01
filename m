Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD62CACF4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:05:52 +0100 (CET)
Received: from localhost ([::1]:49094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBuJ-0003DS-9V
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkBsX-0002gq-An
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:04:01 -0500
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:37641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkBsV-0001xf-Cf
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:04:01 -0500
Received: by mail-il1-x144.google.com with SMTP id k8so2920345ilr.4
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 12:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B9T2wSu62VAzZwEkFsr14SY5wLpo66in3S6WhczcAz0=;
 b=UnSGKRqL3XB6Qvbp18eCp0sRiK4zbEXE3wPVPqbCZuY8QiqSo7hmkA6IlZ1o60lYZ2
 DCpxZQvqjzyGGtQHNBcxzb+oRMrUl1UdJ1TcE+Y+HB9Sre7767jo+DCWLRD62fjv5EEj
 ovRblzaQvNjVyYW9254eanAhDwOcl5fI79t3qAg2enI47njWaq5JtOf/iZW/DTopys3j
 PPRcpd827I0GdGW3MBWckJ5mLdBnp50xMsJmRXEQY/VjvvG87F2L6gGyP7GXgHliiA91
 gmTCslXvBWy+5SAzojJ4xXHLhz9SZUtNKMmq+CcBIhbHFUDXvLvblyhZhnsy7+Bsxt8Y
 YYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B9T2wSu62VAzZwEkFsr14SY5wLpo66in3S6WhczcAz0=;
 b=bVP91VKpVJ42Lo2soxiwcOlpFqa9lqtxxtarRWzfneXD8eSXV66f+UF694xVt3w4lF
 4EXWVTpWzS8LVyepVoGVey6yQbBMb+k0nBoQPfytUTOIEr6Qi0zqY1u1BGkq4znCNFBT
 Zfeb5C4kNpxIPXWxxBQGIdztRov47rbzTU+v5vMl7WmMNdxkH3gFy+HTRX6+ZlxAPVo0
 kEnlPDZWghqpZaps5EQPZ1OzRWuVWWzQXXRA8fzyDI0h5clqHpwBT6LLQot6SzSidzpM
 tBuowQt7OZudUQvzzFlK9phPWDM5GYedFRyssh+8gti8/u6k3p8WmruezLh/8f1wqHli
 +w2w==
X-Gm-Message-State: AOAM531b6ATqT0a6JREfGRZfwRkAeUJROfi3l6uKJ5vyXChX6cD60wbX
 tjJo4+lYGz3KsC+DgqxWZh65AuckB988FKcdZagpaw==
X-Google-Smtp-Source: ABdhPJxpF4wzzUtlzU83VEo/qmVnivmtmHBuEwHY6h8wpUgDnei9POor6S3F55cniEjJjHcwo72HM63Ueny6CnBJig0=
X-Received: by 2002:a92:351c:: with SMTP id c28mr3943687ila.61.1606853038097; 
 Tue, 01 Dec 2020 12:03:58 -0800 (PST)
MIME-Version: 1.0
References: <20201201082142.649007-1-pcc@google.com>
 <5b691ccb-43bb-5955-d47a-cae39c59522c@csgraf.de>
In-Reply-To: <5b691ccb-43bb-5955-d47a-cae39c59522c@csgraf.de>
From: Peter Collingbourne <pcc@google.com>
Date: Tue, 1 Dec 2020 12:03:46 -0800
Message-ID: <CAMn1gO5i7CGet6rDVMwYf40vCMU61n7b=TTTTZzWSDbn+FGL1w@mail.gmail.com>
Subject: Re: [PATCH] arm/hvf: Optimize and simplify WFI handling
To: Alexander Graf <agraf@csgraf.de>
Cc: Frank Yang <lfy@google.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=pcc@google.com; helo=mail-il1-x144.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 1, 2020 at 8:26 AM Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 01.12.20 09:21, Peter Collingbourne wrote:
> > Sleep on WFx until the VTIMER is due but allow ourselves to be woken
> > up on IPI.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> > Alexander Graf wrote:
> >> I would love to take a patch from you here :). I'll still be stuck for a
> >> while with the sysreg sync rework that Peter asked for before I can look
> >> at WFI again.
> > Okay, here's a patch :) It's a relatively straightforward adaptation
> > of what we have in our fork, which can now boot Android to GUI while
> > remaining at around 4% CPU when idle.
> >
> > I'm not set up to boot a full Linux distribution at the moment so I
> > tested it on upstream QEMU by running a recent mainline Linux kernel
> > with a rootfs containing an init program that just does sleep(5)
> > and verified that the qemu process remains at low CPU usage during
> > the sleep. This was on top of your v2 plus the last patch of your v1
> > since it doesn't look like you have a replacement for that logic yet.
>
>
> How about something like this instead?
>
>
> Alex
>
>
> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> index 4360f64671..50384013ea 100644
> --- a/accel/hvf/hvf-cpus.c
> +++ b/accel/hvf/hvf-cpus.c
> @@ -337,16 +337,18 @@ static int hvf_init_vcpu(CPUState *cpu)
>       cpu->hvf = g_malloc0(sizeof(*cpu->hvf));
>
>       /* init cpu signals */
> -    sigset_t set;
>       struct sigaction sigact;
>
>       memset(&sigact, 0, sizeof(sigact));
>       sigact.sa_handler = dummy_signal;
>       sigaction(SIG_IPI, &sigact, NULL);
>
> -    pthread_sigmask(SIG_BLOCK, NULL, &set);
> -    sigdelset(&set, SIG_IPI);
> -    pthread_sigmask(SIG_SETMASK, &set, NULL);
> +    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->sigmask);
> +    sigdelset(&cpu->hvf->sigmask, SIG_IPI);
> +    pthread_sigmask(SIG_SETMASK, &cpu->hvf->sigmask, NULL);
> +
> +    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->sigmask_ipi);
> +    sigaddset(&cpu->hvf->sigmask_ipi, SIG_IPI);

There's no reason to unblock SIG_IPI while not in pselect and it can
easily lead to missed wakeups. The whole point of pselect is so that
you can guarantee that only one part of your program sees signals
without a possibility of them being missed.

>
>   #ifdef __aarch64__
>       r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t
> **)&cpu->hvf->exit, NULL);
> diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
> index c56baa3ae8..6e237f2db0 100644
> --- a/include/sysemu/hvf_int.h
> +++ b/include/sysemu/hvf_int.h
> @@ -62,8 +62,9 @@ extern HVFState *hvf_state;
>   struct hvf_vcpu_state {
>       uint64_t fd;
>       void *exit;
> -    struct timespec ts;
>       bool sleeping;
> +    sigset_t sigmask;
> +    sigset_t sigmask_ipi;
>   };
>
>   void assert_hvf_ok(hv_return_t ret);
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 0c01a03725..350b845e6e 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -320,20 +320,24 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>
>   void hvf_kick_vcpu_thread(CPUState *cpu)
>   {
> -    if (cpu->hvf->sleeping) {
> -        /*
> -         * When sleeping, make sure we always send signals. Also, clear the
> -         * timespec, so that an IPI that arrives between setting
> hvf->sleeping
> -         * and the nanosleep syscall still aborts the sleep.
> -         */
> -        cpu->thread_kicked = false;
> -        cpu->hvf->ts = (struct timespec){ };
> +    if (qatomic_read(&cpu->hvf->sleeping)) {
> +        /* When sleeping, send a signal to get out of pselect */
>           cpus_kick_thread(cpu);
>       } else {
>           hv_vcpus_exit(&cpu->hvf->fd, 1);
>       }
>   }
>
> +static void hvf_block_sig_ipi(CPUState *cpu)
> +{
> +    pthread_sigmask(SIG_SETMASK, &cpu->hvf->sigmask_ipi, NULL);
> +}
> +
> +static void hvf_unblock_sig_ipi(CPUState *cpu)
> +{
> +    pthread_sigmask(SIG_SETMASK, &cpu->hvf->sigmask, NULL);
> +}
> +
>   static int hvf_inject_interrupts(CPUState *cpu)
>   {
>       if (cpu->interrupt_request & CPU_INTERRUPT_FIQ) {
> @@ -354,6 +358,7 @@ int hvf_vcpu_exec(CPUState *cpu)
>       ARMCPU *arm_cpu = ARM_CPU(cpu);
>       CPUARMState *env = &arm_cpu->env;
>       hv_vcpu_exit_t *hvf_exit = cpu->hvf->exit;
> +    const uint32_t irq_mask = CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ;
>       hv_return_t r;
>       int ret = 0;
>
> @@ -491,8 +496,8 @@ int hvf_vcpu_exec(CPUState *cpu)
>               break;
>           }
>           case EC_WFX_TRAP:
> -            if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
> -                (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> +            if (!(syndrome & WFX_IS_WFE) &&
> +                !(cpu->interrupt_request & irq_mask)) {
>                   uint64_t cval, ctl, val, diff, now;

I don't think the access to cpu->interrupt_request is safe because it
is done while not under the iothread lock. That's why to avoid these
types of issues I would prefer to hold the lock almost all of the
time.

>                   /* Set up a local timer for vtimer if necessary ... */
> @@ -515,9 +520,7 @@ int hvf_vcpu_exec(CPUState *cpu)
>
>                   if (diff < INT64_MAX) {
>                       uint64_t ns = diff * gt_cntfrq_period_ns(arm_cpu);
> -                    struct timespec *ts = &cpu->hvf->ts;
> -
> -                    *ts = (struct timespec){
> +                    struct timespec ts = {
>                           .tv_sec = ns / NANOSECONDS_PER_SECOND,
>                           .tv_nsec = ns % NANOSECONDS_PER_SECOND,
>                       };
> @@ -526,27 +529,31 @@ int hvf_vcpu_exec(CPUState *cpu)
>                        * Waking up easily takes 1ms, don't go to sleep
> for smaller
>                        * time periods than 2ms.
>                        */
> -                    if (!ts->tv_sec && (ts->tv_nsec < (SCALE_MS * 2))) {
> +                    if (!ts.tv_sec && (ts.tv_nsec < (SCALE_MS * 2))) {
>                           advance_pc = true;
>                           break;
>                       }
>
> +                    /* block SIG_IPI for the sleep */
> +                    hvf_block_sig_ipi(cpu);
> +                    cpu->thread_kicked = false;
> +
>                       /* Set cpu->hvf->sleeping so that we get a SIG_IPI
> signal. */
> -                    cpu->hvf->sleeping = true;
> -                    smp_mb();
> +                    qatomic_set(&cpu->hvf->sleeping, true);

This doesn't protect against races because another thread could call
kvf_vcpu_kick_thread() at any time between when we return from
hv_vcpu_run() and when we set sleeping = true and we would miss the
wakeup (due to kvf_vcpu_kick_thread() seeing sleeping = false and
calling hv_vcpus_exit() instead of pthread_kill()). I don't think it
can be fixed by setting sleeping to true earlier either because no
matter how early you move it, there will always be a window where we
are going to pselect() but sleeping is false, resulting in a missed
wakeup.

Peter

>
> -                    /* Bail out if we received an IRQ meanwhile */
> -                    if (cpu->thread_kicked || (cpu->interrupt_request &
> -                        (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> -                        cpu->hvf->sleeping = false;
> +                    /* Bail out if we received a kick meanwhile */
> +                    if (qatomic_read(&cpu->interrupt_request) & irq_mask) {
> + qatomic_set(&cpu->hvf->sleeping, false);
> +                        hvf_unblock_sig_ipi(cpu);
>                           break;
>                       }
>
> -                    /* nanosleep returns on signal, so we wake up on
> kick. */
> -                    nanosleep(ts, NULL);
> +                    /* pselect returns on kick signal and consumes it */
> +                    pselect(0, 0, 0, 0, &ts, &cpu->hvf->sigmask);
>
>                       /* Out of sleep - either naturally or because of a
> kick */
> -                    cpu->hvf->sleeping = false;
> +                    qatomic_set(&cpu->hvf->sleeping, false);
> +                    hvf_unblock_sig_ipi(cpu);
>                   }
>
>                   advance_pc = true;
>

