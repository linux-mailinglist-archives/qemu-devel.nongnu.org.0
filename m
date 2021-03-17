Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C3833F3F8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:27:19 +0100 (CET)
Received: from localhost ([::1]:49706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMY4s-0000Vg-Qe
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMY0F-0003y2-GE
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:22:31 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:38455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMY0D-0008Rj-CN
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:22:31 -0400
Received: by mail-qt1-x82b.google.com with SMTP id j7so1657216qtx.5
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ydMQ3wnHkdt1MJVD7vtv81sy1R9wobJN8LhAk4c1+Lk=;
 b=P7Nnc0oWo1kCFrS3wUFAslPsF6+3wApYM4CR178Tf5tN5e6vfehpJJLpgNLnydD1fV
 fDifisxNp+4CkAMFzeZCG+DM+gGDTdMlafUXePpk5GdXB/cTMwQomHzWLYuRI+qyVjDI
 +UJdlKqiLwx6FWrRyInbXx2BC9wHFKJj7Z3bk+wREIwZv5D2ngovp8WEHm2p9LPl89RK
 WKvUAcDy2QFXiphC592mP7jzhCV1FJ2DztA3qWgNjH+Xnw9i9Z35icWBfV5/ber1zEPN
 HTLZzHReDZApHpjb4ZwQNfgq0NtOFk2lapYzRXUjgW17Q8oPlSrKle2gwb9V4/Zhfsl5
 xTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ydMQ3wnHkdt1MJVD7vtv81sy1R9wobJN8LhAk4c1+Lk=;
 b=NnT6J9lAcB3qkA/egbJdrOKXLY5cI0STsH0HpTsBP+pooxxEqghv587VoU2Zcn88yF
 t1CcghID/gWDCSmqPa8l1Q8xfAkBRIyLlCZur00/SXS+8KY6jAL7EDWMofyzV38VTWSL
 ZyRMCeJWpob5EKivn1ACaUItT6wDKw1fUBLPcfUd2GHZ09U3AltHuDAjY5wJrSPFBcC/
 St+jj8Z+bD/vc4MEZZFM+gHgNkQLsWUYpcEAtiFAc3YPIZy+pvjbJFojCgUgdCX3+8uM
 9SrHNJQq3+tZ4qhuJj7kSeeodIbd8xSa/salG0b8lwKAj3Sf7c2HRJC26jrsoP/hhwtl
 C3+Q==
X-Gm-Message-State: AOAM530Nf+HLE1IYkGV+NeD2sQBgujVipNUu/ySD8t5IASp35ShGTjV+
 I2T6mqK9zb5WqQKZ6T0UjkouOA==
X-Google-Smtp-Source: ABdhPJwbppAE8nCnBhdEaXxYWNpu5bw8bMqehF4JM545kgvd3SJuvRsct7s4USTYGMp1NuIs3OQHug==
X-Received: by 2002:ac8:4c90:: with SMTP id j16mr4535189qtv.223.1615994547065; 
 Wed, 17 Mar 2021 08:22:27 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s6sm6705915qke.44.2021.03.17.08.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 08:22:26 -0700 (PDT)
Subject: Re: [PATCH 1/2] configure: Don't use the __atomic_*_16 functions for
 testing 128-bit support
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
References: <20210317110512.583747-1-thuth@redhat.com>
 <20210317110512.583747-2-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3b60dba-b65f-8410-13e1-1a4db46c77d9@linaro.org>
Date: Wed, 17 Mar 2021 09:22:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210317110512.583747-2-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 5:05 AM, Thomas Huth wrote:
> The test for 128-bit atomics is causing trouble with FreeBSD 12.2 and
> --enable-werror:
> 
>   cc -Werror -fPIE -DPIE -std=gnu99 -Wall -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wno-initializer-overrides -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-string-plus-int -Wno-typedef-redefinition -Wno-tautological-type-limit-compare -fstack-protector-strong -o config-temp/qemu-conf.exe config-temp/qemu-conf.c -pie -Wl,-z,relro -Wl,-z,now -m64 -fstack-protector-strong
>   config-temp/qemu-conf.c:4:7: error: implicit declaration of function '__atomic_load_16' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>     y = __atomic_load_16(&x, 0);
>         ^
>   config-temp/qemu-conf.c:5:3: error: implicit declaration of function '__atomic_store_16' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>     __atomic_store_16(&x, y, 0);
>     ^
>   config-temp/qemu-conf.c:5:3: note: did you mean '__atomic_load_16'?
>   config-temp/qemu-conf.c:4:7: note: '__atomic_load_16' declared here
>     y = __atomic_load_16(&x, 0);
>         ^
>   config-temp/qemu-conf.c:6:3: error: implicit declaration of function '__atomic_compare_exchange_16' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>     __atomic_compare_exchange_16(&x, &y, x, 0, 0, 0);
>     ^
>   3 errors generated.
> 
> Looking for they way we are using atomic functions in QEMU, we are not
> using these functions with the _16 suffix anyway. Switch to the same
> functions that we use in the include/qemu/atomic.h header.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> ---
>   configure | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index f7d022a5db..4526af87b2 100755
> --- a/configure
> +++ b/configure
> @@ -4761,9 +4761,9 @@ if test "$int128" = "yes"; then
>   int main(void)
>   {
>     unsigned __int128 x = 0, y = 0;
> -  y = __atomic_load_16(&x, 0);
> -  __atomic_store_16(&x, y, 0);
> -  __atomic_compare_exchange_16(&x, &y, x, 0, 0, 0);
> +  y = __atomic_load(&x, 0);
> +  __atomic_store(&x, y, 0);
> +  __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
>     return 0;
>   }
>   EOF
> 


