Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092F36AC105
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:31:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAwB-0004Fy-Gy; Mon, 06 Mar 2023 08:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZAw3-0003qX-1C
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:31:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZAw1-0007iO-Br
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:31:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wv3DnAabWhjPvK3/tL/3mwlcjEh5GUOD7AZdaeN3zZo=;
 b=XVnCW1mKWBp/dyMrW1IWp5VxNuIOy6+CsRVmviGTm0EXvDpCXZMg8s3roMErKqYYJ4yYV8
 C5ObCSxuXP2J8NlIQyH/qn6/2RZrzMLIjwlRXA6C2iVtG+KMWaq7idDoVR7QYC9GPoi9wu
 uyGX0prTaJQAsK/aFP8xMfIAFo4xhZA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-yaSbCGnFOu-p3ynvkBxiBQ-1; Mon, 06 Mar 2023 08:31:23 -0500
X-MC-Unique: yaSbCGnFOu-p3ynvkBxiBQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n27-20020a05600c3b9b00b003e9ca0f4677so3737071wms.8
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109482;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wv3DnAabWhjPvK3/tL/3mwlcjEh5GUOD7AZdaeN3zZo=;
 b=EaF5Up+oEQbgu0RecNVsbwgb2XlLV2gk8IBzAoQTGATdUbPdIPlr7LUanrGhX08LVB
 CbPUHq5PTPrkKkB49E3fVqalS4YoJ+jTR2HqQhzQ9td5eIcLPRLxuZ+RCbMC0XSexuTo
 aPjG66fBgHNBkKlietr+/HKAOEu3H4WZrA85916DLXTaNEJg/rd6/kMCaXD5IP6uJmVY
 70YJGd/3wbCQFOM1myyUkruwCTeyBC/umD9iKAY3JFTtqTwow+HCe61XwnUv7uLLfq+o
 FJ6LuPf3j5Z9iLbqSorZu5Cocu72R0RXYIGICMqBY1hHYPFhTlTihZxwmAHUGmZEne6G
 RPPQ==
X-Gm-Message-State: AO0yUKXeAX2J9ZWCD8aabAU26kMBzmqyCEakw6DhDu43x95CvrB+HWkH
 v/QjjJyRTagwWLyekf8NI0B7VxvqgqeJl8gmExPx598eAPy8DT/gdlEDZn+JcX5tbrgQcd5eQGe
 W1fcpDX7zzOxi+OE=
X-Received: by 2002:adf:f483:0:b0:2c7:46f:c410 with SMTP id
 l3-20020adff483000000b002c7046fc410mr7128923wro.36.1678109482378; 
 Mon, 06 Mar 2023 05:31:22 -0800 (PST)
X-Google-Smtp-Source: AK7set95FdQ0/zFzNGUahQcSnNoVn0+N9otqsR4IqrHUWXnn6BxupW3CioixzQ8oYW6cXVpIgxt9Vg==
X-Received: by 2002:adf:f483:0:b0:2c7:46f:c410 with SMTP id
 l3-20020adff483000000b002c7046fc410mr7128904wro.36.1678109481968; 
 Mon, 06 Mar 2023 05:31:21 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:3500:b8a3:191c:eae:cc05?
 (p200300cbc7043500b8a3191c0eaecc05.dip0.t-ipconnect.de.
 [2003:cb:c704:3500:b8a3:191c:eae:cc05])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a5d6452000000b002c71dd1109fsm9723276wrw.47.2023.03.06.05.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:31:21 -0800 (PST)
Message-ID: <080ab2d0-1a6f-47e9-0f3f-33f5ef98d411@redhat.com>
Date: Mon, 6 Mar 2023 14:31:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/8] qemu-thread-win32: cleanup, fix, document QemuEvent
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-4-pbonzini@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230303171939.237819-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03.03.23 18:19, Paolo Bonzini wrote:
> QemuEvent is currently broken on ARM due to missing memory barriers
> after qatomic_*().  Apart from adding the memory barrier, a closer look
> reveals some unpaired memory barriers that are not really needed and
> complicated the functions unnecessarily, as well as some optimizations
> that I couldn't quite prove to be correct.
> 
> Finally, the code is relying on a memory barrier in ResetEvent(); the
> barrier _ought_ to be there but there is really no documentation about
> it; it only affects the slow path, so make it explicit.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

[...]

>   util/qemu-thread-win32.c | 78 +++++++++++++++++++++++++++-------------
>   1 file changed, 53 insertions(+), 25 deletions(-)
> 
> diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
> index 69db254ac7c1..eff664ae6b31 100644
> --- a/util/qemu-thread-win32.c
> +++ b/util/qemu-thread-win32.c
> @@ -272,12 +272,20 @@ void qemu_event_destroy(QemuEvent *ev)
>   void qemu_event_set(QemuEvent *ev)
>   {
>       assert(ev->initialized);
> -    /* qemu_event_set has release semantics, but because it *loads*
> +
> +    /*
> +     * Pairs with memory barrier in qemu_event_reset.
> +     *
> +     * qemu_event_set has release semantics, but because it *loads*
>        * ev->value we need a full memory barrier here.
>        */
>       smp_mb();
>       if (qatomic_read(&ev->value) != EV_SET) {
> -        if (qatomic_xchg(&ev->value, EV_SET) == EV_BUSY) {
> +        int old = qatomic_xchg(&ev->value, EV_SET);
> +
> +        /* Pairs with memory barrier after ResetEvent.  */
> +        smp_mb__after_rmw();
> +        if (old == EV_BUSY) {
>               /* There were waiters, wake them up.  */
>               SetEvent(ev->event);
>           }
> @@ -286,17 +294,19 @@ void qemu_event_set(QemuEvent *ev)
>   
>   void qemu_event_reset(QemuEvent *ev)
>   {
> -    unsigned value;
> -
>       assert(ev->initialized);
> -    value = qatomic_read(&ev->value);
> -    smp_mb_acquire();
> -    if (value == EV_SET) {
> -        /* If there was a concurrent reset (or even reset+wait),
> -         * do nothing.  Otherwise change EV_SET->EV_FREE.
> -         */
> -        qatomic_or(&ev->value, EV_FREE);
> -    }
> +

[had the same thought on patch #2]

IIUC, the "read first" is an optimization to not unconditionally dirty 
the cache-line. But I assume we don't particularly care about that 
optimization on the reset path.

> +    /*
> +     * If there was a concurrent reset (or even reset+wait),
> +     * do nothing.  Otherwise change EV_SET->EV_FREE.
> +     */
> +    qatomic_or(&ev->value, EV_FREE);
> +
> +    /*
> +     * Order reset before checking the condition in the caller.
> +     * Pairs with the first memory barrier in qemu_event_set().
> +     */
> +    smp_mb__after_rmw();
>   }
>   
>   void qemu_event_wait(QemuEvent *ev)
> @@ -304,29 +314,47 @@ void qemu_event_wait(QemuEvent *ev)
>       unsigned value;
>   
>       assert(ev->initialized);
> +
> +    /*
> +     * This read does not have any particular ordering requirements;
> +     * if it moves earlier, we might miss qemu_event_set() and go down the
> +     * slow path unnecessarily, but ultimately the memory barrier below,
> +     * plus the internal synchronization of the kernel event, will ensure
> +     * the check is done correctly.
> +     */
>       value = qatomic_read(&ev->value);
> -    smp_mb_acquire();
>       if (value != EV_SET) {
>           if (value == EV_FREE) {
> -            /* qemu_event_set is not yet going to call SetEvent, but we are
> -             * going to do another check for EV_SET below when setting EV_BUSY.
> -             * At that point it is safe to call WaitForSingleObject.
> +            /*
> +             * Here the underlying kernel event is reset, but qemu_event_set is
> +             * not yet going to call SetEvent.  However, there will be another
> +             * check for EV_SET below when setting EV_BUSY.  At that point it
> +             * is safe to call WaitForSingleObject.
>                */
>               ResetEvent(ev->event);
>   
> -            /* Tell qemu_event_set that there are waiters.  No need to retry
> -             * because there cannot be a concurrent busy->free transition.
> -             * After the CAS, the event will be either set or busy.
> +            /*
> +             * It is not clear whether ResetEvent provides this barrier; kernel
> +             * APIs (KeResetEvent/KeClearEvent) do not.  Better safe than sorry!
> +             */
> +            smp_mb();
> +
> +            /*
> +             * Leave the event reset and tell qemu_event_set that there are
> +             * waiters.  No need to retry, because there cannot be a concurrent
> +             * busy->free transition.  After the CAS, the event will be either
> +             * set or busy.
>                */
>               if (qatomic_cmpxchg(&ev->value, EV_FREE, EV_BUSY) == EV_SET) {
> -                value = EV_SET;
> -            } else {
> -                value = EV_BUSY;
> +                return;
>               }
>           }
> -        if (value == EV_BUSY) {
> -            WaitForSingleObject(ev->event, INFINITE);
> -        }
> +
> +        /*
> +         * ev->value is now EV_BUSY.  Since we didn't observe EV_SET,
> +         * qemu_event_set() must observe EV_BUSY and call SetEvent().
> +         */
> +        WaitForSingleObject(ev->event, INFINITE);
>       }
>   }
>   

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


