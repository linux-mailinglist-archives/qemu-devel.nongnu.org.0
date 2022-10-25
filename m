Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29F060CC78
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:50:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJK6-0001Ki-U9; Tue, 25 Oct 2022 08:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onJJa-00011n-OX
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onJJJ-0003O9-Ix
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:45:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666701936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dosdjlv4VFrM6JM2sKUh+t5+WPlyRVuBS+rMWiomFmU=;
 b=DBD2yiz7tFToVg3wOLIn+cdVPALW6jjUKzBiSv4m1gHp/83ruSsSae5rYSIQMNUzohk5ce
 Pokk0+PhO9Kjaej7+VjMqLZUu8mKL2SOVkQJkj1EhCNoXcogcyphREe9XtpQxdgGqw0IqF
 1okM5MnlWjxIsbI6l9ZfX7yKNQZEzgE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-B4sHJD4eNxGcvAFDFozX5w-1; Tue, 25 Oct 2022 08:45:33 -0400
X-MC-Unique: B4sHJD4eNxGcvAFDFozX5w-1
Received: by mail-qk1-f198.google.com with SMTP id
 n13-20020a05620a294d00b006cf933c40feso11478479qkp.20
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 05:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dosdjlv4VFrM6JM2sKUh+t5+WPlyRVuBS+rMWiomFmU=;
 b=PQCZVPIzWphFxMN2D8smtB+9/jxDSWhupSLMgPUIVkRhvtw6GEKgYxLefduXcbo5T7
 BPvMhrXoY2zi5lXNZ2notColnLBuLFgrK2fVDMsn07M6OrEfrkJCeypVpwxXxMX8B9LX
 5zTyaxPL1pJnC/B58q1tP6WDbNHxcszSv1H+0xB2DxqZyB0slWJCU9uzDXhBDTTBVSu2
 9Wpn1XeqCmQXvGY+a7edeRVHHV8dwap5FxekPkPX28Ww22YzYM3KsMrmWNwhJT5WqOLH
 tad9Ng8emrRQAHrdnaeqawmmGF2LSQYUL5mEFVNYK7JJWOfCuLF6oW0rV+xDWY7uor90
 6crQ==
X-Gm-Message-State: ACrzQf1grZYOqZ1FihIHiT/2qY/70+2syyXD475VICV+j6hHE82b47Pc
 +50vo8X8G/GEwjPXW3iQerKrHGC5cxnyYCiOsL3vjTk4YBKXjjKOPyRs0lpFnGlvP/GK6UDYaIn
 6VqkSWxPekqKBFOQ=
X-Received: by 2002:a05:622a:489:b0:3a4:b9dd:7af6 with SMTP id
 p9-20020a05622a048900b003a4b9dd7af6mr802121qtx.511.1666701932777; 
 Tue, 25 Oct 2022 05:45:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4k/f4TumDvXk7Afug/BBlEUxjifFf3Qs+Fs7kmxtmVTkg7j6z6eTjVrQfblt0tI9Fjreospg==
X-Received: by 2002:a05:622a:489:b0:3a4:b9dd:7af6 with SMTP id
 p9-20020a05622a048900b003a4b9dd7af6mr802098qtx.511.1666701932487; 
 Tue, 25 Oct 2022 05:45:32 -0700 (PDT)
Received: from [10.201.49.36] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.googlemail.com with ESMTPSA id
 y21-20020a05620a44d500b006eed75805a2sm2018520qkp.126.2022.10.25.05.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 05:45:31 -0700 (PDT)
Message-ID: <b5317dc1-30fe-c59f-2a41-a47e7346a616@redhat.com>
Date: Tue, 25 Oct 2022 14:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [RFC PATCH] main-loop: introduce WITH_QEMU_IOTHREAD_LOCK
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20221024171909.434818-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221024171909.434818-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/24/22 19:19, Alex Bennée wrote:
> This helper intends to ape our other auto-unlocking helpers with
> WITH_QEMU_LOCK_GUARD. The principle difference is the iothread lock
> is often nested needs a little extra book keeping to ensure we don't
> double lock or unlock a lock taken higher up the call chain.
> 
> Convert some of the common routines that follow this pattern to use
> the new wrapper.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Looks good, but having to check whether the lock is taken is a bit of an 
antipattern.

What do you think about having both WITH_QEMU_IOTHREAD_LOCK() and 
MAYBE_WITH_QEMU_IOTHREAD_LOCK()?

Also lots of bonus points for finally renaming these functions to 
"*_main_thread" rather than "*_iothread" since, confusingly, iothreads 
(plural) are the only ones that do not and cannot take the "iothread lock".

Paolo

> ---
>   include/qemu/main-loop.h | 41 ++++++++++++++++++++++++++++++++++++++++
>   hw/core/cpu-common.c     | 10 ++--------
>   util/rcu.c               | 40 ++++++++++++++++-----------------------
>   ui/cocoa.m               | 18 ++++--------------
>   4 files changed, 63 insertions(+), 46 deletions(-)
> 
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index aac707d073..604e1823da 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -341,6 +341,47 @@ void qemu_mutex_lock_iothread_impl(const char *file, int line);
>    */
>   void qemu_mutex_unlock_iothread(void);
>   
> +/**
> + * WITH_QEMU_IOTHREAD_LOCK - nested lock of iothread
> + *
> + * This is a specialised form of WITH_QEMU_LOCK_GUARD which is used to
> + * safely encapsulate code that needs the BQL. The main difference is
> + * the BQL is often nested so we need to save the state of it on entry
> + * so we know if we need to free it once we leave the scope of the gaurd.
> + */
> +
> +typedef struct {
> +    bool taken;
> +} IoThreadLocked;
> +
> +static inline IoThreadLocked * qemu_iothread_auto_lock(IoThreadLocked *x)
> +{
> +    bool locked = qemu_mutex_iothread_locked();
> +    if (!locked) {
> +        qemu_mutex_lock_iothread();
> +        x->taken = true;
> +    }
> +    return x;
> +}
> +
> +static inline void qemu_iothread_auto_unlock(IoThreadLocked *x)
> +{
> +    if (x->taken) {
> +        qemu_mutex_unlock_iothread();
> +    }
> +}
> +
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(IoThreadLocked, qemu_iothread_auto_unlock)
> +
> +#define WITH_QEMU_IOTHREAD_LOCK_(var) \
> +    for (g_autoptr(IoThreadLocked) var = \
> +             qemu_iothread_auto_lock(&(IoThreadLocked) {}); \
> +         var; \
> +         qemu_iothread_auto_unlock(var), var = NULL)
> +
> +#define WITH_QEMU_IOTHREAD_LOCK \
> +    WITH_QEMU_IOTHREAD_LOCK_(glue(qemu_lockable_auto, __COUNTER__))
> +
>   /*
>    * qemu_cond_wait_iothread: Wait on condition for the main loop mutex
>    *
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index f9fdd46b9d..0a60f916a9 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -70,14 +70,8 @@ CPUState *cpu_create(const char *typename)
>    * BQL here if we need to.  cpu_interrupt assumes it is held.*/
>   void cpu_reset_interrupt(CPUState *cpu, int mask)
>   {
> -    bool need_lock = !qemu_mutex_iothread_locked();
> -
> -    if (need_lock) {
> -        qemu_mutex_lock_iothread();
> -    }
> -    cpu->interrupt_request &= ~mask;
> -    if (need_lock) {
> -        qemu_mutex_unlock_iothread();
> +    WITH_QEMU_IOTHREAD_LOCK {
> +        cpu->interrupt_request &= ~mask;
>       }
>   }
>   
> diff --git a/util/rcu.c b/util/rcu.c
> index b6d6c71cff..02e7491de1 100644
> --- a/util/rcu.c
> +++ b/util/rcu.c
> @@ -320,35 +320,27 @@ static void drain_rcu_callback(struct rcu_head *node)
>   void drain_call_rcu(void)
>   {
>       struct rcu_drain rcu_drain;
> -    bool locked = qemu_mutex_iothread_locked();
>   
>       memset(&rcu_drain, 0, sizeof(struct rcu_drain));
>       qemu_event_init(&rcu_drain.drain_complete_event, false);
>   
> -    if (locked) {
> -        qemu_mutex_unlock_iothread();
> -    }
> -
> -
> -    /*
> -     * RCU callbacks are invoked in the same order as in which they
> -     * are registered, thus we can be sure that when 'drain_rcu_callback'
> -     * is called, all RCU callbacks that were registered on this thread
> -     * prior to calling this function are completed.
> -     *
> -     * Note that since we have only one global queue of the RCU callbacks,
> -     * we also end up waiting for most of RCU callbacks that were registered
> -     * on the other threads, but this is a side effect that shoudn't be
> -     * assumed.
> -     */
> -
> -    qatomic_inc(&in_drain_call_rcu);
> -    call_rcu1(&rcu_drain.rcu, drain_rcu_callback);
> -    qemu_event_wait(&rcu_drain.drain_complete_event);
> -    qatomic_dec(&in_drain_call_rcu);
> +    WITH_QEMU_IOTHREAD_LOCK {
> +        /*
> +         * RCU callbacks are invoked in the same order as in which they
> +         * are registered, thus we can be sure that when 'drain_rcu_callback'
> +         * is called, all RCU callbacks that were registered on this thread
> +         * prior to calling this function are completed.
> +         *
> +         * Note that since we have only one global queue of the RCU callbacks,
> +         * we also end up waiting for most of RCU callbacks that were registered
> +         * on the other threads, but this is a side effect that shoudn't be
> +         * assumed.
> +         */
>   
> -    if (locked) {
> -        qemu_mutex_lock_iothread();
> +        qatomic_inc(&in_drain_call_rcu);
> +        call_rcu1(&rcu_drain.rcu, drain_rcu_callback);
> +        qemu_event_wait(&rcu_drain.drain_complete_event);
> +        qatomic_dec(&in_drain_call_rcu);
>       }
>   
>   }
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 660d3e0935..f8bd315bdd 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -115,27 +115,17 @@ static void cocoa_switch(DisplayChangeListener *dcl,
>   
>   static void with_iothread_lock(CodeBlock block)
>   {
> -    bool locked = qemu_mutex_iothread_locked();
> -    if (!locked) {
> -        qemu_mutex_lock_iothread();
> -    }
> -    block();
> -    if (!locked) {
> -        qemu_mutex_unlock_iothread();
> +    WITH_QEMU_IOTHREAD_LOCK {
> +        block();
>       }
>   }
>   
>   static bool bool_with_iothread_lock(BoolCodeBlock block)
>   {
> -    bool locked = qemu_mutex_iothread_locked();
>       bool val;
>   
> -    if (!locked) {
> -        qemu_mutex_lock_iothread();
> -    }
> -    val = block();
> -    if (!locked) {
> -        qemu_mutex_unlock_iothread();
> +    WITH_QEMU_IOTHREAD_LOCK {
> +      val = block();
>       }
>       return val;
>   }


