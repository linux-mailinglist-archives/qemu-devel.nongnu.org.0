Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C62457C9F
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 09:55:55 +0100 (CET)
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moMA6-0003XS-H1
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 03:55:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moM8z-0002pk-8C
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 03:54:45 -0500
Received: from [2a00:1450:4864:20::430] (port=44560
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moM8x-0007vf-DA
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 03:54:44 -0500
Received: by mail-wr1-x430.google.com with SMTP id n29so22287337wra.11
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 00:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YgEU63jWTQx9ezspBLO7lQEByylPIYKwLzZjfeHpXrI=;
 b=swRerhER4FvqMyXd3vwU/DHG6clv5ndlnyIiHPVyOhkY8F6kgeeZ8i8Zn33GvEbHGP
 mV77rZYGpJul2rNY1wlJoftsWoagJXskVJB5mQv3GndnGWh2KRTawDWftC92QY9nqToU
 iebv/6s+hTwkoGghZ7ozQVpCd7XRcSRQDFfQVGcS9cEWJORLL8G/Z7vz1y7kUA/UDRYy
 GyQ6jwpuYa3PnaNITIAG+aQ8CapFqjiHoeH/3nxX9bggLdsFSOGYMe2HiG7opP51NV97
 rFgVHsVZT1CsvvmFiURfflrPA7c1GDNwXcrUhqVBUdPrZNyCFMr0UqYPV+mcoktYySe/
 7k5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YgEU63jWTQx9ezspBLO7lQEByylPIYKwLzZjfeHpXrI=;
 b=noWOakCAUh5UJ0SX88og2ypvnPSPSg8WvpvUNItm7jop9YkURtk2zzkRunINg2rwKS
 /l6oOzEShO4s9/8agEYVyuF/zppSvYRY84ebi85MiuB4KQc1NioP6uvzAIms/C0COLk+
 Zu9jq+o9SbkDrJgon65j42HDg7bEWa0+GAFqau1I+QPvVu0E3U1evDYSj/M61sDTPzaF
 V4t8mTP7Nl0gn0SuuVCA7JAi0rErW92iLrwU6tOtPlip9wELS+g5LF1Ih0/O4U1z9gjV
 9W1znaQdpieZ+pAg9WuEJHLNWYVHIuoLKajfYDTPirUJxSPu6oujVcUaaXzbq6O9bTB8
 tP8Q==
X-Gm-Message-State: AOAM531qTQ08PxHQFsnrFoVm/l1NQnbvWiBDXA1Fz/JrY6YizPPGzCWP
 es7GUm38Y/APEgsmGbEOOFLNkw==
X-Google-Smtp-Source: ABdhPJzCXe1ATh+o3Ea554hT1DCP5ztZDS7hyI1AJfsonslR6I60lP1cfp8P9wvOJ6YD4jIstyABUg==
X-Received: by 2002:adf:f990:: with SMTP id f16mr15913760wrr.128.1637398481828; 
 Sat, 20 Nov 2021 00:54:41 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id p12sm2409245wrr.10.2021.11.20.00.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 00:54:41 -0800 (PST)
Subject: Re: [PATCH v11 10/26] target/loongarch: Add floating point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-11-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8768ae20-cc6e-5439-e9c0-07917368675a@linaro.org>
Date: Sat, 20 Nov 2021 09:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-11-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> +static void update_fcsr0_mask(CPULoongArchState *env, uintptr_t pc, int mask)
> +{
> +    int flags = get_float_exception_flags(&env->fp_status);
> +
> +    set_float_exception_flags(0, &env->fp_status);
> +
> +    if (~mask) {
> +        flags = flags & (~mask);
> +    }

No need for if -- mask will always be valid.

     flags &= ~mask.

> +    if (!flags) {
> +        SET_FP_CAUSE(env->fcsr0, flags);
> +        return;
> +    }
> +
> +    flags = ieee_ex_to_loongarch(flags);
> +    SET_FP_CAUSE(env->fcsr0, flags);

It looks like this could be hoisted above the !flags check to unify the two statements.


> +/* Floating-point helper */
> +DEF_HELPER_3(fadd_s, i64, env, i64, i64)
> +DEF_HELPER_3(fadd_d, i64, env, i64, i64)
> +DEF_HELPER_3(fsub_s, i64, env, i64, i64)
> +DEF_HELPER_3(fsub_d, i64, env, i64, i64)
> +DEF_HELPER_3(fmul_s, i64, env, i64, i64)
> +DEF_HELPER_3(fmul_d, i64, env, i64, i64)
> +DEF_HELPER_3(fdiv_s, i64, env, i64, i64)
> +DEF_HELPER_3(fdiv_d, i64, env, i64, i64)
> +DEF_HELPER_3(fmax_s, i64, env, i64, i64)
> +DEF_HELPER_3(fmax_d, i64, env, i64, i64)
> +DEF_HELPER_3(fmin_s, i64, env, i64, i64)
> +DEF_HELPER_3(fmin_d, i64, env, i64, i64)
> +DEF_HELPER_3(fmaxa_s, i64, env, i64, i64)
> +DEF_HELPER_3(fmaxa_d, i64, env, i64, i64)
> +DEF_HELPER_3(fmina_s, i64, env, i64, i64)
> +DEF_HELPER_3(fmina_d, i64, env, i64, i64)
> +
> +DEF_HELPER_5(fmuladd_s, i64, env, i64, i64, i64, i32)
> +DEF_HELPER_5(fmuladd_d, i64, env, i64, i64, i64, i32)
> +
> +DEF_HELPER_3(fscaleb_s, i64, env, i64, i64)
> +DEF_HELPER_3(fscaleb_d, i64, env, i64, i64)
> +
> +DEF_HELPER_2(flogb_s, i64, env, i64)
> +DEF_HELPER_2(flogb_d, i64, env, i64)
> +
> +DEF_HELPER_2(fsqrt_s, i64, env, i64)
> +DEF_HELPER_2(fsqrt_d, i64, env, i64)
> +DEF_HELPER_2(frsqrt_s, i64, env, i64)
> +DEF_HELPER_2(frsqrt_d, i64, env, i64)
> +DEF_HELPER_2(frecip_s, i64, env, i64)
> +DEF_HELPER_2(frecip_d, i64, env, i64)

DEF_HELPER_FLAGS_N, TCG_CALL_NO_WG.


r~

