Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AAA60C2C8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 06:51:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onBor-0000de-Li; Tue, 25 Oct 2022 00:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onBoj-0000cv-Gz
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:45:33 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onBob-0002WW-P0
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:45:28 -0400
Received: by mail-pf1-x42b.google.com with SMTP id f140so10844017pfa.1
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 21:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fuLgZism9SPUC/bMO9B3fQn8jwxm+eMlQ4FtulRoCwg=;
 b=FCZKtX2wtNFMkKghPkdIzn4zKbohlsuQOeKpGK6/3dXAmiEsFvNcCmX2p0bbPJZmuG
 9a02Q6uFMGDgo6md2dtuWbHZWdc/C7fa9VLMxVB1Otf1Mid0P65opgzw7hk5ZFuO2he4
 7yv8C2mjZe/jlZ38bf1/fP9KKN3xKdt2Ot3uWNeDxSDUA8B/MzuYFJvFcZDa/wZ7hvr7
 AdYutFPGBruccuoNmfExlDBAsNhitgtD5ttLiKTW0KqHAJ9dJymGdSZPd8Sm2lZ8qOkd
 arI/Dq2xibQjbPBrcKG7yTlnCdcErWz/cvoRUs/VY5DoIvmwaWWhQkoptIdpnv9OT4B3
 lxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fuLgZism9SPUC/bMO9B3fQn8jwxm+eMlQ4FtulRoCwg=;
 b=ncB/aJm50R5anxtf1Xuf4OvckzYBdwd8tzyERrtMF+5KscW4ayknQ1Lt/+28ssgWeD
 cjof2EPxjoaq5klRAtdvYdDR9ctKQaDb08pYV6HGsZFtfVSj2xk3Qia+oabsA7gMumsj
 5aZu6PojAaq6DDWtBBvut3s4gTVYYLcDUIgCXrXv8i8rvY3YHuFRsqzGdrQfDz1gliU3
 LJp5l2rhNF9mbdvMhaZlO/vHUWF/2P8VMSlfJg6b9hC+UxMpjID6spYZaq6ZzdTNg9Ya
 LdRy296UqdWP1h4mBY1+fFvvN5xAUeug4uQRk66Z1vnJv3cAXW1LKo3uYFNQDhMu3y4W
 8a/g==
X-Gm-Message-State: ACrzQf3OtfDw1LHHfxkn84CmNJNDodMniJoOL5fMpyM6sGNVJJ2tr8UA
 ajmqOSLI8eBnwS9u+5nuHM4v6g==
X-Google-Smtp-Source: AMsMyM7z5s+yGy36n3umDrQ/xFeCJCR2UGFWWjus/dlOhE48LuHh6z71xrDjKfxl/Et+rURlSkyg3g==
X-Received: by 2002:aa7:809a:0:b0:567:6e2c:2e2a with SMTP id
 v26-20020aa7809a000000b005676e2c2e2amr33872057pff.56.1666673123887; 
 Mon, 24 Oct 2022 21:45:23 -0700 (PDT)
Received: from ?IPV6:2400:4050:c360:8200:8ae8:3c4:c0da:7419?
 ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a632014000000b00460ea630c1bsm500172pgg.46.2022.10.24.21.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 21:45:23 -0700 (PDT)
Message-ID: <9074909e-04aa-b40d-09b6-3d5c066bb082@daynix.com>
Date: Tue, 25 Oct 2022 13:45:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC PATCH] main-loop: introduce WITH_QEMU_IOTHREAD_LOCK
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20221024171909.434818-1-alex.bennee@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20221024171909.434818-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi,

Thanks for your proposal. I always wanted to see the helper functions 
with block, which is really specific to Apple-related code are replaced 
with more QEMU-standard GLib infrastructure.

What about returning IoThreadLocked with qemu_iothread_auto_lock() and 
assign it to g_auto(IoThreadLocked)? I don't think the indirection by 
pointer is necessary in this case.

Regards,
Akihiko Odaki

On 2022/10/25 2:19, Alex Bennée wrote:
> This helper intends to ape our other auto-unlocking helpers with
> WITH_QEMU_LOCK_GUARD. The principle difference is the iothread lock
> is often nested needs a little extra book keeping to ensure we don't
> double lock or unlock a lock taken higher up the call chain.
> 
> Convert some of the common routines that follow this pattern to use
> the new wrapper.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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

