Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BAD3FC1AB
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 05:46:03 +0200 (CEST)
Received: from localhost ([::1]:41776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKuio-0001ls-SY
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 23:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKugl-00015D-M8
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 23:43:55 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKugO-0002KH-LV
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 23:43:55 -0400
Received: by mail-pg1-x52b.google.com with SMTP id q68so15386172pga.9
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 20:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ez0f/dDIOXxTXyu46vZROE6j8BjQVUVnQ9bnjdKnpkY=;
 b=qCRz6BMo+Sw6EfB8JNulIBQWqCLLBQOXXVii5REv6sr/mTvpLaNddcYL2F1duAuW/g
 tobfscEFE+Z61RSfJJnFl/mEan/4kyeKmvbDfg0aLO0iHAteRGEc2qd657SQZqcECQ9O
 sbtragJw4m7bKFNr+k9KmYH5ptyRTqpt01p88kD7xosv4tFDCLk4q88uAX4C5Go+RxaN
 Q4PUN4ffYiSKQ5FQSw+c4h+SVucfUO71ALIM64bj0cU6qi+njQV1W0mIii0D0V+PCvcs
 XQoLJlnOo8ay1D79sYYQ/xbB+acpZaDuYdoTjNJ10jc3ZY4ce67n9eM1p+Wjhx8Giyn+
 MBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ez0f/dDIOXxTXyu46vZROE6j8BjQVUVnQ9bnjdKnpkY=;
 b=lGUmcrvKiuwtU0s32TVo+MtzIEfa+1DF7sj4lbAFQajtdiCRTVwGAPJvwfLtYx3FyL
 6z7XHggVKjjKhlsq4g++mdjLBsgHl/YBnxRAVHAXJfkhfnk1ZTlhbDb0ejhCtETenJYH
 mw0WEE1z9qBQOIWYzmVcnjwQK/CtFJxqX2qmAYYx6oMElWdhLNhJC/ovxAwXEiZW2KXR
 QCoMcvHolUIw+oXv/+o5u6IBZhgKr0z9MYc+wAvEpz0H4zwk7e9Z+/avG2m2sYQUDHPx
 /ywys1NJnPOdwUxiZ9u/ow+EegKySRQOK3TWdnxv4jnZd+PQ2e2cJbyYN2AJT8godnGM
 /Plw==
X-Gm-Message-State: AOAM530c3WS23XK6c2oV1weMsJMLddRaDS6Nay+kxb+5Edq0fF+/Gk9A
 i/Q8yaGlF18KAe/QNPgAkHWu9A==
X-Google-Smtp-Source: ABdhPJyffjIggL7fHH3U8DzNzgSyPlZyLg4NOzZC81qcU0qsKNuFJ8T+1+5NVcAY8VGaaCfIFnnNbA==
X-Received: by 2002:a63:eb41:: with SMTP id b1mr25047969pgk.236.1630381401443; 
 Mon, 30 Aug 2021 20:43:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id z7sm866908pjr.42.2021.08.30.20.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 20:43:21 -0700 (PDT)
Subject: Re: [PATCH 7/8] target/riscv: 128-bit support for some csrs
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20210830171638.126325-7-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ffcc1322-362b-3496-3c56-ca29f3015e52@linaro.org>
Date: Mon, 30 Aug 2021 20:43:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830171638.126325-7-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 10:16 AM, Frédéric Pétrot wrote:
>   target/riscv/utils_128.h                | 173 ++++++++++++++++

You should extend include/qemu/int128.h as needed, rather than this.

> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4321b03b94..0d18055e08 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -26,6 +26,7 @@
>   #include "fpu/softfloat-types.h"
>   #include "qom/object.h"
>   
> +#include "utils_128.h"

And anyway, it's certainly not needed in cpu.h.

> @@ -60,19 +61,6 @@
>   #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
>   /* To be used on misah, the upper part of misa */
>   #define RV128 ((target_ulong)3 << (TARGET_LONG_BITS - 2))
> -/*
> - * Defined to force the use of tcg 128-bit arithmetic
> - * if the compiler does not have a 128-bit built-in type
> - */
> -#define SOFT_128BIT
> -/*
> - * If available and not explicitly disabled,
> - * use compiler's 128-bit integers.
> - */
> -#if defined(__SIZEOF_INT128__) && !defined(SOFT_128BIT)
> -#define HARD_128BIT
> -#endif

You shouldn't have added these earlier and remove them here.  Of course, I don't think 
they're needed at all.


r~

