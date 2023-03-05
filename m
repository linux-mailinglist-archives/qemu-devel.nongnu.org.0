Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7106AB1E0
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 20:33:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYu61-00008V-Jj; Sun, 05 Mar 2023 14:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYu5u-0008Qj-Nc
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 14:32:32 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYu5q-0002ja-GH
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 14:32:29 -0500
Received: by mail-pg1-x52c.google.com with SMTP id q189so4276384pga.9
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 11:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678044739;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rb9Rdd0Bh5ttS0Ym4fiVO5GpjHEFwTflg2QqrTfwbZc=;
 b=gPM2Gg5DgTtfie4NTBp1zqef3S7hU9NY3bO0dXWYwtWBmP2vuIN/O4maQSZr9VdRXa
 DQjc5rV/IyHDKxXCOw9yX/P2d6IgVM+jpu1k57YcG3GxpNsOR8flRCo+XJyLZ0aEmiXM
 3YYpLxEGI13vNKnuCyqumX6Coef5aohhJ6FdQ/vCgj4zIwPJvXhViUP5es7lx/k5ncj3
 h69kv2BvXWuvwmW9mTfczQT93JRWtr/h7s1cB4o8NQZa8cV8nZrjnpMgc2YKpiN81AqM
 PodBY3dvxPyq8nI9VZM05lLZS1eeGPTpqcxEW55doAdlxMd8V4qRzmoQS0mruUAuEW6y
 6N/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678044739;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rb9Rdd0Bh5ttS0Ym4fiVO5GpjHEFwTflg2QqrTfwbZc=;
 b=J/52FEaGdecAc6wJaJE5hubPLDehlrr68wFQ4ctdFgiSFIyFm69Sr1UDF5ES85sHqq
 Kz/ld5xp1Icw/M6Y9hea94+KniOIUXqYHsi0rGT11K8rcz3gKZudchq4bXwEq27MXZ0h
 s2XusgczsyQ53gPoCvMUs5Qsyw8+BU0u2p+yLFgBgSTlYYGaEQ0Z3KUKVqD6R6hyrhDU
 dh1RLiFIiTwOVti4YYvxpTVAT9TP0kOP2NDW26XcwThdJqM3YDO0JwR/6kzFqDtuWUzh
 KmcyyMQl6rz4JiTgk/zL/SjuKl+MgeCdZvqVZAK5sqLIVPv6KioECh5AyNezdDkyRtaQ
 le7g==
X-Gm-Message-State: AO0yUKU3Tq4mSBbLFC9+1aJ6YAdVLEXZrz1L/EogQq3Uh4ITe/ex6gSX
 JQg3IgmVex15J/4p8nBpR+tNdg==
X-Google-Smtp-Source: AK7set9fVMRBJ7uHcrMhjV9BlLLf2C7HHeqYC59ydPNW2o1zrpbcI7jB8PTEQFUbCmyqQYIo1qSsxw==
X-Received: by 2002:a62:1dc8:0:b0:5a8:a250:bc16 with SMTP id
 d191-20020a621dc8000000b005a8a250bc16mr6668972pfd.3.1678044739385; 
 Sun, 05 Mar 2023 11:32:19 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:d15:390f:de71:e264?
 ([2602:ae:154a:9f01:d15:390f:de71:e264])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a62be0b000000b005da23d8cbffsm4854398pff.158.2023.03.05.11.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 11:32:18 -0800 (PST)
Message-ID: <ba42506d-4906-3d4b-f934-586356278355@linaro.org>
Date: Sun, 5 Mar 2023 11:32:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/8] util/async: add smp_mb__after_rmw() around BH
 enqueue/dequeue
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-6-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230303171939.237819-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/3/23 09:19, Paolo Bonzini wrote:
> There is no implicit memory barrier in qatomic_fetch_or() and
> atomic_fetch_and() on ARM systems.  Add an explicit
> smp_mb__after_rmw() to match the intended semantics.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   util/async.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/util/async.c b/util/async.c
> index 0657b7539777..6129f2c991cb 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -74,13 +74,15 @@ static void aio_bh_enqueue(QEMUBH *bh, unsigned new_flags)
>       unsigned old_flags;
>   
>       /*
> -     * The memory barrier implicit in qatomic_fetch_or makes sure that:
> -     * 1. idle & any writes needed by the callback are done before the
> -     *    locations are read in the aio_bh_poll.
> +     * The memory barrier makes sure that:
> +     * 1. any writes needed by the callback are visible from the callback
> +     *    after aio_bh_dequeue() returns bh.
>        * 2. ctx is loaded before the callback has a chance to execute and bh
>        *    could be freed.
>        */
>       old_flags = qatomic_fetch_or(&bh->flags, BH_PENDING | new_flags);
> +    smp_mb__after_rmw();
> +
>       if (!(old_flags & BH_PENDING)) {
>           QSLIST_INSERT_HEAD_ATOMIC(&ctx->bh_list, bh, next);
>       }
> @@ -107,14 +109,15 @@ static QEMUBH *aio_bh_dequeue(BHList *head, unsigned *flags)
>       QSLIST_REMOVE_HEAD(head, next);
>   
>       /*
> -     * The qatomic_and is paired with aio_bh_enqueue().  The implicit memory
> -     * barrier ensures that the callback sees all writes done by the scheduling
> +     * The memory barrier is paired with aio_bh_enqueue() and it
> +     * ensures that the callback sees all writes done by the scheduling
>        * thread.  It also ensures that the scheduling thread sees the cleared
>        * flag before bh->cb has run, and thus will call aio_notify again if
>        * necessary.
>        */

Is it really paired with aio_bh_enqueue?

Seems like the enqueue barrier really is for aio_bh_poll, and the dequeue barrier is for 
the callback.

While the comments seem off, the code seems correct.  If you agree:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

