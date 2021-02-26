Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9902D326417
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 15:31:51 +0100 (CET)
Received: from localhost ([::1]:59556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFe9m-00073B-4C
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 09:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFe86-0006NF-7Y
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 09:30:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFe82-0004tG-H1
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 09:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614349800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GM70o2P4ntoO9T/mec33ckgIZhE6hXiZZG9+IAKett8=;
 b=GGbWLcnFSBK1jffxE/j1tUJ1c8mOI/LC/yPzFGFPeleXb4DkQPcmHiHYM8CJ0tTBo5Ek4j
 RpavPQ7MDgdnTkuH4KIqzDi2LZ7CS0hCc3n21/gwO/um1ikl3lnf4JGvXkv38uxiUNAiDz
 lh+91Xfyx2gPxmPuqE7aLj58VrZ5low=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-M1U_TDAGNpGY-LvhIqmZuA-1; Fri, 26 Feb 2021 09:29:58 -0500
X-MC-Unique: M1U_TDAGNpGY-LvhIqmZuA-1
Received: by mail-ed1-f70.google.com with SMTP id m1so4616297edv.12
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 06:29:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GM70o2P4ntoO9T/mec33ckgIZhE6hXiZZG9+IAKett8=;
 b=MS1erdqiLHf8+nDX+hqXaBYe6Ne3Mco4RyYARDq4k3mnTJMawLW4n4aIzcJde0+OZq
 VApTvJJ3ePpTDoefJsgaCkKedqFk+QHvRZoRCAVcS25nvspc4oD9fNPu7iYUOe1ZvLiS
 jQgytIOZDKMggZ7RjDE/Q1nFDSMkoe92vVn7Y2nWzdbO0f0Tkybm8eL/UA01IclBdeb8
 g0GS2rAoXmKYNJF2psQLO9qa+1PhWv53Pg2BW+rKuus6+hJRKglc7WqxEgwoMfPMXbkV
 rAuEjXHxgPKIFF+X02cgYJDmluEn8GrYg9fGe5mfAy9uPIxzkNbPoufitGNCSlviZy3k
 1V8Q==
X-Gm-Message-State: AOAM5338dFzwKKFTsi19xmTNWTOHyoxr/tZB21W65Ke1s1Ma2mxa9P9d
 IJug8jjH2HrEDLH0458zvg3YGYSsQF6wzPTzpDgPNXTZprP37xlXYoROSQByM00IAM0lz/Fk5VV
 1Svoex7rQmSjNHO4=
X-Received: by 2002:a17:907:9804:: with SMTP id
 ji4mr3626252ejc.67.1614349796936; 
 Fri, 26 Feb 2021 06:29:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1kPAW7i6htlSjUpjL0TGTtmGbQF42+RhE4j7uOyspt6kCGVR0RHsCCbs2QcHIZSHDKfrrkw==
X-Received: by 2002:a17:907:9804:: with SMTP id
 ji4mr3626232ejc.67.1614349796757; 
 Fri, 26 Feb 2021 06:29:56 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m7sm5516550ejk.52.2021.02.26.06.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 06:29:56 -0800 (PST)
Subject: Re: [PATCH 1/1] qemu_timer.c: add timer_deadline_ms() helper
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20210225212914.366462-1-danielhb413@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8d895a95-f587-37a8-988e-71be67d88760@redhat.com>
Date: Fri, 26 Feb 2021 15:29:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225212914.366462-1-danielhb413@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/02/21 22:29, Daniel Henrique Barboza wrote:
> The pSeries machine is using QEMUTimer internals to return the timeout
> in seconds for a timer object, in hw/ppc/spapr.c, function
> spapr_drc_unplug_timeout_remaining_sec().
> 
> Create a helper in qemu-timer.c to retrieve the deadline for a QEMUTimer
> object, in ms, to avoid exposing timer internals to the PPC code.
> 
> CC: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
> 
> This patch is applicable on top of David's ppc-for-6.0.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

>   hw/ppc/spapr_drc.c   |  5 ++---
>   include/qemu/timer.h |  8 ++++++++
>   util/qemu-timer.c    | 13 +++++++++++++
>   3 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 8c4997d795..98b626acf9 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -421,9 +421,8 @@ void spapr_drc_unplug_request(SpaprDrc *drc)
>   
>   int spapr_drc_unplug_timeout_remaining_sec(SpaprDrc *drc)
>   {
> -    if (drc->unplug_requested && timer_pending(drc->unplug_timeout_timer)) {
> -        return (qemu_timeout_ns_to_ms(drc->unplug_timeout_timer->expire_time) -
> -                qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL)) / 1000;
> +    if (drc->unplug_requested) {
> +        return timer_deadline_ms(drc->unplug_timeout_timer) / 1000;
>       }
>   
>       return 0;
> diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> index 1678238384..5e76e3f8c2 100644
> --- a/include/qemu/timer.h
> +++ b/include/qemu/timer.h
> @@ -795,6 +795,14 @@ static inline int64_t get_max_clock_jump(void)
>       return 60 * NANOSECONDS_PER_SECOND;
>   }
>   
> +/**
> + * timer_deadline_ms:
> + *
> + * Returns the remaining miliseconds for @timer to expire, or zero
> + * if the timer is no longer pending.
> + */
> +int64_t timer_deadline_ms(QEMUTimer *timer);
> +
>   /*
>    * Low level clock functions
>    */
> diff --git a/util/qemu-timer.c b/util/qemu-timer.c
> index 81c28af517..3a03a63daa 100644
> --- a/util/qemu-timer.c
> +++ b/util/qemu-timer.c
> @@ -243,6 +243,19 @@ int64_t timerlist_deadline_ns(QEMUTimerList *timer_list)
>       return delta;
>   }
>   
> +/*
> + * Returns the time remaining for the deadline, in ms.
> + */
> +int64_t timer_deadline_ms(QEMUTimer *timer)
> +{
> +    if (timer_pending(timer)) {
> +        return qemu_timeout_ns_to_ms(timer->expire_time) -
> +               qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
> +    }
> +
> +    return 0;
> +}
> +
>   /* Calculate the soonest deadline across all timerlists attached
>    * to the clock. This is used for the icount timeout so we
>    * ignore whether or not the clock should be used in deadline
> 


