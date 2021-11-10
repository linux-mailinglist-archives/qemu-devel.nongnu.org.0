Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C8744BDC6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 10:27:24 +0100 (CET)
Received: from localhost ([::1]:44142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkjt5-0001Cy-Op
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 04:27:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkjrF-0006gW-5R
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:25:29 -0500
Received: from [2a00:1450:4864:20::436] (port=43715
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkjrD-0003aj-9k
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:25:28 -0500
Received: by mail-wr1-x436.google.com with SMTP id t30so2762636wra.10
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 01:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/qEKz7Cv5cSWR8MPlEwATB9pEJ9UQviSuOtyBFCKk8Q=;
 b=d0/BaWN/kcZ6JSY0qfbn17YedY2NNY9P6R21RqrnV9yioZSmEn5vq88MhpMqFLP/Qb
 H2OeXPsGuztTTFIniJL7eykBHeeP1xf30K/FusAl48g5dLbEHDguAZsO3Ne0nO1/1XcI
 64Q/K3ZqISMhroJeZN8bLeOu2whaUnCc+I/w/UcfMcZRZxayjvh6j+V1EFFbWkjN/F1g
 2dtNlnVbFkvgTV01n//upCjoftWgfJWa0n99+jf3tCLu82NyjMHEQ6J05yaTR3ybbQ5X
 oZ1n+wTNAR/77WJ2EEdqHbhuw/wYquoPZYdkNHjxLLUARJu82QntxL1RIwVDzS1BTLrY
 i1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/qEKz7Cv5cSWR8MPlEwATB9pEJ9UQviSuOtyBFCKk8Q=;
 b=qNT3j95MJXNL6rDxYTNOyRsc/ofTVPi63toH0pE/hfQDvO8p68YUvw5Wz1sEjmmqYY
 2nVscnirfA2zguxv+6VlX9akJYJaMEUNuV6es7jwNg2OqMN2cgi8Ar6pSO8/C27Mtjbk
 x4oSQconGJalhBfjHz9ORiCMOFG6pvpL702kIRC4K5qHM/qrOYXcLaNnHebV4/YOgjGM
 ge4mFR+/zIUgCVQgOF4OgK6zxKeTA6YVLh0iyF8P4D7bJ9kn/lrPGvmb0CiPOU5hXeOc
 UjFW8PTrPmBjTkFRFWBQlPMnxWvRQElk63euT6IkqWeOrucfOLtIl7kajc2tMOP6oVGq
 Ld6A==
X-Gm-Message-State: AOAM532b/iy6Wg0WsYrwU9U3UZVx2zYTHA+jUPjHkpSA0zETAiY8LMbf
 jx9RffKUCkaHrGPHAGJC4JwZkI477YqXrsJe
X-Google-Smtp-Source: ABdhPJzEbgUfQWnItuOk9kAp+Rz911uvk3WITO1cdgFvCmuOGZtV89qjLtFibVdXwyUJO656yft1xw==
X-Received: by 2002:adf:9147:: with SMTP id j65mr17327695wrj.163.1636536324959; 
 Wed, 10 Nov 2021 01:25:24 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id 4sm30505677wrz.90.2021.11.10.01.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 01:25:24 -0800 (PST)
Subject: Re: [PATCH] linux-user: Replace __u64 with uint64_t
To: Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org
References: <20211108194230.1836262-1-raj.khem@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0242a761-cd00-1a22-e64c-952befad9988@linaro.org>
Date: Wed, 10 Nov 2021 10:25:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108194230.1836262-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 8:42 PM, Khem Raj wrote:
> uint64_t is available in all userspaces via compiler include stdint.h
> therefore use it instead of __u64 which is linux internal type, it fixes
> build on some platforms eg. aarch64 systems using musl C library
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   linux-user/host/aarch64/hostdep.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
> index a8d41a21ad..34d934f665 100644
> --- a/linux-user/host/aarch64/hostdep.h
> +++ b/linux-user/host/aarch64/hostdep.h
> @@ -25,7 +25,7 @@ extern char safe_syscall_end[];
>   static inline void rewind_if_in_safe_syscall(void *puc)
>   {
>       ucontext_t *uc = puc;
> -    __u64 *pcreg = &uc->uc_mcontext.pc;
> +    uint64_t *pcreg = &uc->uc_mcontext.pc;
>   
>       if (*pcreg > (uintptr_t)safe_syscall_start
>           && *pcreg < (uintptr_t)safe_syscall_end) {

Queued to tcg-next, since that's where the original patch came from.

r~


