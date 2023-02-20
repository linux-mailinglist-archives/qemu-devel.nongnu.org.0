Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9EF69C562
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 07:37:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTzmM-0004wb-C4; Mon, 20 Feb 2023 01:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pTzm7-0004w7-Ec
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 01:35:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pTzm5-00014x-IT
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 01:35:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676874944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8MLx2+rnNctmUvlbrAQiG3fA5GIkOmb98UUo/wH6si0=;
 b=Rvt99PUpCOse+NyKKQ85rxMNmnRsmSWJxsrxYE6rKFxXWALXihuIvDKAz5TyaQdNZ9RGNz
 HppgugmbU/fD9Jn9Hb9lXuZL/E91qM4n+sjKihiK0xBLmPDPi4ba2CihU3TU/dLOjc6jlc
 KVghhDWctw9MQZgmeH3JpQJD7PVhoWY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-492-QrkN-GfNM6-O4zBlBa3XHA-1; Mon, 20 Feb 2023 01:35:42 -0500
X-MC-Unique: QrkN-GfNM6-O4zBlBa3XHA-1
Received: by mail-wr1-f72.google.com with SMTP id
 z6-20020a5d4406000000b002c54ce46094so135017wrq.17
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 22:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8MLx2+rnNctmUvlbrAQiG3fA5GIkOmb98UUo/wH6si0=;
 b=0egsqoei4uxx9eebPFw/pX9YZuY/sy6h5k4kcWx2JQyL7ll5drQwVX3suTvb2sjIUr
 vMA7hDBoOkxhmMVe7dOCOlKcT/Zm/PDzDaAgL5ZKIiINYlFESXZyMS82e6NS/ZQDqnpP
 TmEQ2p+NcOYoCLBh/8ypQr4iLOdqHcS14YEoGQSPpGjAK3mCYfhCf8hpgEmgt3u199nf
 1sQs6+MD6XLutbw/saU0wD1WF3E6+LsTZFbD27KYJsi9OCrssmAqaIkeGRdvYM2UE5ga
 wqUfscAsQX8Q4ChSmCk1TCnNP0AxLC6tPEkOrlQ8815AHJPDzdGcpt2rtTKfjE9h5TUc
 +SdA==
X-Gm-Message-State: AO0yUKWLwrrJiSczUS4wDV0O8nPH7JBeZUYbXIPRcgYVi4h+yECGUKel
 1zc6O2uF/wY5X6CA7YGDLVgmewgTn9D7vHHNu+rUNoh8uqZFPTH3wRI5iOjex7KIdarHJ+yLJnE
 67tJ+t3/WgR9GkHw=
X-Received: by 2002:a05:600c:4393:b0:3e2:8f1:7684 with SMTP id
 e19-20020a05600c439300b003e208f17684mr10993202wmn.33.1676874941480; 
 Sun, 19 Feb 2023 22:35:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8iWMA52F5F3vis9YGXQ6pi/5cQYruwadHGbGiBLHnb+55eB8M+AA3/vqdq/ZTJm5Y2qbIcGA==
X-Received: by 2002:a05:600c:4393:b0:3e2:8f1:7684 with SMTP id
 e19-20020a05600c439300b003e208f17684mr10993183wmn.33.1676874941179; 
 Sun, 19 Feb 2023 22:35:41 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 e1-20020a05600c4e4100b003e1fee8baacsm9214780wmq.25.2023.02.19.22.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Feb 2023 22:35:40 -0800 (PST)
Message-ID: <45496628-6a2b-cdfd-666f-a7a9dca887bd@redhat.com>
Date: Mon, 20 Feb 2023 07:35:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Vikram Garhwal <vikram.garhwal@amd.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Thomas Huth
 <huth@tuxfamily.org>, Francisco Iglesias <francisco.iglesias@amd.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jason Wang
 <jasowang@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>
References: <20230217141832.24777-1-philmd@linaro.org>
 <20230217215836.40328-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/2] hw/timer: Rename ptimer_state -> PTimer
In-Reply-To: <20230217215836.40328-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/02/2023 22.58, Philippe Mathieu-Daudé wrote:
> Remove a pointless cast in ptimer_tick() and rename 'ptimer_state'
> as 'PTimer' to follow the Structure naming convention.
> 
> See docs/devel/style.rst:
> 
>    Variables are lower_case_with_underscores; easy to type and
>    read.  Structured type names are in CamelCase; harder to type
>    but standing out.  Enum type names and function type names
>    should also be in CamelCase.  Scalar type names are
>    lower_case_with_underscores_ending_with_a_t, like the POSIX
>    uint64_t and family.
> 
> Mechanical change doing:
> 
>    $ sed -i -e s/ptimer_state/PTimer/g \
>        $(git grep -l ptimer_state)
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
...
> @@ -154,7 +154,7 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
>   
>   static void ptimer_tick(void *opaque)
>   {
> -    ptimer_state *s = (ptimer_state *)opaque;
> +    PTimer *s = opaque;

I like that you also removed the useless cast here.

>       bool trigger = true;
>   
>       /*
> @@ -198,7 +198,7 @@ static void ptimer_tick(void *opaque)
>       ptimer_transaction_commit(s);
>   }
>   
> -uint64_t ptimer_get_count(ptimer_state *s)
> +uint64_t ptimer_get_count(PTimer *s)
>   {
>       uint64_t counter;
>   
> @@ -294,7 +294,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
>       return counter;
>   }
>   
> -void ptimer_set_count(ptimer_state *s, uint64_t count)
> +void ptimer_set_count(PTimer *s, uint64_t count)
>   {
>       assert(s->in_transaction);
>       s->delta = count;
> @@ -303,7 +303,7 @@ void ptimer_set_count(ptimer_state *s, uint64_t count)
>       }
>   }
>   
> -void ptimer_run(ptimer_state *s, int oneshot)
> +void ptimer_run(PTimer *s, int oneshot)
>   {
>       bool was_disabled = !s->enabled;
>   
> @@ -323,7 +323,7 @@ void ptimer_run(ptimer_state *s, int oneshot)
>   
>   /* Pause a timer.  Note that this may cause it to "lose" time, even if it
>      is immediately restarted.  */
> -void ptimer_stop(ptimer_state *s)
> +void ptimer_stop(PTimer *s)
>   {
>       assert(s->in_transaction);
>   
> @@ -337,7 +337,7 @@ void ptimer_stop(ptimer_state *s)
>   }
>   
>   /* Set counter increment interval in nanoseconds.  */
> -void ptimer_set_period(ptimer_state *s, int64_t period)
> +void ptimer_set_period(PTimer *s, int64_t period)
>   {
>       assert(s->in_transaction);
>       s->delta = ptimer_get_count(s);
> @@ -349,7 +349,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
>   }
>   
>   /* Set counter increment interval from a Clock */
> -void ptimer_set_period_from_clock(ptimer_state *s, const Clock *clk,
> +void ptimer_set_period_from_clock(PTimer *s, const Clock *clk,
>                                     unsigned int divisor)
>   {
>       /*
> @@ -382,7 +382,7 @@ void ptimer_set_period_from_clock(ptimer_state *s, const Clock *clk,
>   }
>   
>   /* Set counter frequency in Hz.  */
> -void ptimer_set_freq(ptimer_state *s, uint32_t freq)
> +void ptimer_set_freq(PTimer *s, uint32_t freq)
>   {
>       assert(s->in_transaction);
>       s->delta = ptimer_get_count(s);
> @@ -395,7 +395,7 @@ void ptimer_set_freq(ptimer_state *s, uint32_t freq)
>   
>   /* Set the initial countdown value.  If reload is nonzero then also set
>      count = limit.  */
> -void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
> +void ptimer_set_limit(PTimer *s, uint64_t limit, int reload)
>   {
>       assert(s->in_transaction);
>       s->limit = limit;
> @@ -406,19 +406,19 @@ void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
>       }
>   }
>   
> -uint64_t ptimer_get_limit(ptimer_state *s)
> +uint64_t ptimer_get_limit(PTimer *s)
>   {
>       return s->limit;
>   }
>   
> -void ptimer_transaction_begin(ptimer_state *s)
> +void ptimer_transaction_begin(PTimer *s)
>   {
>       assert(!s->in_transaction);
>       s->in_transaction = true;
>       s->need_reload = false;
>   }
>   
> -void ptimer_transaction_commit(ptimer_state *s)
> +void ptimer_transaction_commit(PTimer *s)
>   {
>       assert(s->in_transaction);
>       /*
> @@ -442,27 +442,27 @@ const VMStateDescription vmstate_ptimer = {
>       .version_id = 1,
>       .minimum_version_id = 1,
>       .fields = (VMStateField[]) {
> -        VMSTATE_UINT8(enabled, ptimer_state),
> -        VMSTATE_UINT64(limit, ptimer_state),
> -        VMSTATE_UINT64(delta, ptimer_state),
> -        VMSTATE_UINT32(period_frac, ptimer_state),
> -        VMSTATE_INT64(period, ptimer_state),
> -        VMSTATE_INT64(last_event, ptimer_state),
> -        VMSTATE_INT64(next_event, ptimer_state),
> -        VMSTATE_TIMER_PTR(timer, ptimer_state),
> +        VMSTATE_UINT8(enabled, PTimer),
> +        VMSTATE_UINT64(limit, PTimer),
> +        VMSTATE_UINT64(delta, PTimer),
> +        VMSTATE_UINT32(period_frac, PTimer),
> +        VMSTATE_INT64(period, PTimer),
> +        VMSTATE_INT64(last_event, PTimer),
> +        VMSTATE_INT64(next_event, PTimer),
> +        VMSTATE_TIMER_PTR(timer, PTimer),
>           VMSTATE_END_OF_LIST()
>       }
>   };
>   
> -ptimer_state *ptimer_init(ptimer_cb callback, void *callback_opaque,
> +PTimer *ptimer_init(ptimer_cb callback, void *callback_opaque,
>                             uint8_t policy_mask)

Just a nit: In case you respin, please adjust the indentation here.

Reviewed-by: Thomas Huth <thuth@redhat.com>


