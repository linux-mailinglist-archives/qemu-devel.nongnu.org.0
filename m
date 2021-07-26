Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889E73D5658
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 11:19:06 +0200 (CEST)
Received: from localhost ([::1]:45898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7wlN-000568-Le
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 05:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m7wkL-0004AY-1g
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 05:18:01 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:47066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m7wkJ-0002wH-3S
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 05:18:00 -0400
Received: by mail-wr1-x431.google.com with SMTP id c16so346539wrp.13
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 02:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yUjxAuO5axjYr9PI+cFypzTrZpJkuozLPeMgdiuebtU=;
 b=HFMvA9LpiE5TDfTiqow9rIV2IJsCFfhL2KVpRu99vPkkpLy7x3ZZ4Fe3Kc+Xl0Npzj
 zXkKXMU8p7QtnPtsfEWgAwMuZW8bOqM8odjmt3QHZ8nP/rMHq4lwOysSiDh0snYk129h
 a7YUheSURFMNxV+lgHMYKH3k5ZcZLDmsEdPeODlS1nHa9KWWBiS7IrEXf42XAq9aq31k
 424ZpLfHfrxOty65O7NoZe5ZMvxV7/N/VZGtWjORDzZWuRuSev+ceQiXaw1MFfBf0Lgp
 +0U4rkdqPs6C+RMtPjXreyndIyfdfnZqfFXt5Nu2ZLo359mMhUh1bW07lfY7MFVfB8MM
 UHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yUjxAuO5axjYr9PI+cFypzTrZpJkuozLPeMgdiuebtU=;
 b=ZvfzFq27MtItPvI7jphJElFb/KOkhsqLoAj99VLcFq4svp5WDaMEt4N5gQMu0mHO9+
 uDU3GRWho1tDJF9ij6kVzdp+3rnabWM8KnsNjMk95O3ZsC08AGoDO/x/0VLIsBa8fk07
 bBrkxAtFr6ZmWWb4M+jHCFiv2CFg6HEXmGuF8ihhwC81vsV1dKKwym7ItRgntuoTVAZQ
 Ic+zLRNsKShywtaUJ7s2BoJ3za7KUkukvyuXlbsSpMLeOS7Oc7jx0l/aH/QQSC2PUE0g
 fe1z/jd7ZID8mBFaMuzn7czXpJUm27PocHf7FOBaZWTo8uZD9pM4JbQPLGoMCVeCaxIt
 1Ung==
X-Gm-Message-State: AOAM532dEji71xVDBmFL2I0luJEip9KoZ3l2pYLGpBE3a5EvoR1Y/gOa
 u8EWQy7iZfg2wZTsCmzLOuU=
X-Google-Smtp-Source: ABdhPJz97idCIpkhygGyWi1R7Um9WtcWsYweP71uaNiVoGGa3lL2g8pervQT/iTCaGhlTqd1G/C14A==
X-Received: by 2002:adf:d225:: with SMTP id k5mr8208795wrh.10.1627291077719;
 Mon, 26 Jul 2021 02:17:57 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id h4sm4715715wru.2.2021.07.26.02.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 02:17:56 -0700 (PDT)
Subject: Re: [PATCH for-6.1 1/2] accel/tcg: Don't use CF_COUNT_MASK as the max
 value of icount_decr.u16.low
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210725174405.24568-1-peter.maydell@linaro.org>
 <20210725174405.24568-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dce742b8-acb9-8c08-70b1-d00804b7f802@amsat.org>
Date: Mon, 26 Jul 2021 11:17:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210725174405.24568-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/25/21 7:44 PM, Peter Maydell wrote:
> In cpu_loop_exec_tb() we were bounding the number of insns we might
> try to execute in a TB using CF_COUNT_MASK.  This is incorrect,
> because we can validly put up to 0xffff into icount_decr.u16.low.  In
> particular, since commit 78ff82bb1b67c0d7 reduced CF_COUNT_MASK to
> 511 this meant that we would incorrectly only try to execute 511
> instructions in a 512-instruction TB, which could result in QEMU
> hanging when in icount mode.

Nice catch...

> Use the actual maximum value, which is 0xffff. (This brings this code
> in to line with the similar logic in icount_prepare_for_run() in
> tcg-accel-ops-icount.c.)
> 
> Fixes: 78ff82bb1b67c0d7
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/499
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  accel/tcg/cpu-exec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index fc895cf51e4..6e8dc291197 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -834,7 +834,7 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
>      /* Ensure global icount has gone forward */
>      icount_update(cpu);
>      /* Refill decrementer and continue execution.  */
> -    insns_left = MIN(CF_COUNT_MASK, cpu->icount_budget);
> +    insns_left = MIN(0xffff, cpu->icount_budget);

Or UINT16_MAX.

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>      cpu_neg(cpu)->icount_decr.u16.low = insns_left;
>      cpu->icount_extra = cpu->icount_budget - insns_left;
>  
> 


