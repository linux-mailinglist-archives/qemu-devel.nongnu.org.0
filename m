Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F263BE0CA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 04:11:14 +0200 (CEST)
Received: from localhost ([::1]:48650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0x1t-0006NW-EX
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 22:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wzq-0004Jr-8e
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:09:06 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:38821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wzn-0000ez-Ha
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:09:06 -0400
Received: by mail-pf1-x431.google.com with SMTP id w22so780312pff.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 19:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yUjA0NOZzp+xdxaGELn6KgcpooSGG8bXcoaRGVdUcXE=;
 b=D13+cyoTFkFcETWOuxW/sh8bTh3Yr96wDI0MDtYuDO9tNMfT4P1OYIPSQqWsyEr7gy
 dos09v9oy7S9AEGRSFUWJ9cVW4q48e1DaESFLU+vHMA/K7DslB76p6aE0znX98SL+yzw
 QKnzyYaGqcgmSGgvWJQyLi1TK5JtlQ5PBkSOz2G/DSK9XfoOoI0q9R1TB1QJLE1lg3i1
 i5QGbbQC6sMg3QCIp4G7H4SzCAyFu2tD40yWgh2DsXRns310FEkhiO0xBtqMXYfPJpMf
 SFPfRIYQyv2TjN/ibaUuoIo8VP4WoxHs0w221TnTjG+wcxd4VAn0tKOpjJwX60kkcxMP
 5gvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yUjA0NOZzp+xdxaGELn6KgcpooSGG8bXcoaRGVdUcXE=;
 b=j75Of91AeSK/qZgCaQZmFTaieanV+c7Q1ZzRKXqaxwtGlg1mgAF9uSoPCUFqgCFveu
 IDhfyECzddaVcD0IsR9b0mEWQxTXFKxPHmZIH3EfCo/JaIkEkMRhnjYVYO6Y4rr0Atm1
 PXAefhp0MFrtkXLOgktb3MgZMRSzn6HE8KmeWrudEppmCWoo8wi9gkpBImG45zQ3c1I3
 1QBxLVxGe86fsccGYwr1CWFtcfNsgXXuexB6AQr7tjC2KTg89BcyMwytyCy3AoRep7Ge
 u9Epf7BZF9Q24GFUqRUau96I5bqBY42x+PDmXsytk8oCC1/VC78bURsnKO3PrNXMVkSO
 5YfQ==
X-Gm-Message-State: AOAM533ob+T0yODd5V99aBr7GjpZk6KMwHeUiZcd6brqjUkzSune0ST8
 grctRmVynzn+IMNjEe5xeM4hFg==
X-Google-Smtp-Source: ABdhPJxn/tffp8yV5O0S6col6HFPF8bjCZG7K+sbCbHhigD7jv1xjAVzNH5kjSx7SGeDvlmWHVFQxQ==
X-Received: by 2002:a63:ea0e:: with SMTP id c14mr23633272pgi.117.1625623741527; 
 Tue, 06 Jul 2021 19:09:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n59sm4111874pji.46.2021.07.06.19.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 19:09:01 -0700 (PDT)
Subject: Re: [PATCH 12/12] linux-user: Extract target errno related functions
 to 'target_errno.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210704183755.655002-1-f4bug@amsat.org>
 <20210704183755.655002-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d75bddf7-f54c-6b7a-803b-7a01e8e20fb6@linaro.org>
Date: Tue, 6 Jul 2021 19:08:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704183755.655002-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 Taylor Simpson <tsimpson@quicinc.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 11:37 AM, Philippe Mathieu-Daudé wrote:
> Extract target errno related functions to a new 'target_errno.h'
> header, so we can do the host <-> target errno conversion out of
> the big syscall.c (which is already 13k LoC).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   linux-user/target_errno.h |  32 +++++++
>   linux-user/syscall.c      | 162 +--------------------------------
>   linux-user/target_errno.c | 183 ++++++++++++++++++++++++++++++++++++++
>   linux-user/meson.build    |   1 +
>   4 files changed, 217 insertions(+), 161 deletions(-)
>   create mode 100644 linux-user/target_errno.h
>   create mode 100644 linux-user/target_errno.c

I guess this is just data movement, so it's ok.

But...

> +/*
> + * target_to_host_errno_table[] is initialized from
> + * host_to_target_errno_table[] in target_to_host_errno_table_init().
> + */
> +static uint16_t target_to_host_errno_table[ERRNO_TABLE_SIZE] = {
> +};
> +
> +/*
> + * This list is the union of errno values overridden in asm-<arch>/errno.h
> + * minus the errnos that are not actually generic to all archs.
> + */
> +static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] = {
> +    [EAGAIN]            = TARGET_EAGAIN,
> +    [EIDRM]             = TARGET_EIDRM,
> +    [ECHRNG]            = TARGET_ECHRNG,

... there's enough pattern here to make it easy to initialize both of these at 
compile-time.  We just need to move the list out to a .c.inc file.

--%<

E(EAGAIN)
E(EIDRM)
...
#ifdef EFOO
E(EFOO)
#endif

--%<

static const uint16_t target_to_host_errno_table[] = {
#define E(X)  [TARGET_##X] = X,
#include "errnos.c.inc"
#undef E
};

static const uint16_t host_to_target_errno_table[] = {
#define E(X)  [X] = TARGET_##X,
#include "errnos.c.inc"
#undef E
};

> +int host_to_target_errno(int err)
> +{
> +    if (err >= 0 && err < ERRNO_TABLE_SIZE &&
> +        host_to_target_errno_table[err]) {
> +        return host_to_target_errno_table[err];
> +    }
> +    return err;
> +}

Here and

> +int target_to_host_errno(int err)
> +{
> +    if (err >= 0 && err < ERRNO_TABLE_SIZE &&
> +        target_to_host_errno_table[err]) {
> +        return target_to_host_errno_table[err];
> +    }
> +    return err;
> +}

here, we might as well use ARRAY_SIZE(foo) instead of ERRNO_TABLE_SIZE.

Or even convert directly to switches, with no array, and let the compiler decide what it 
thinks is best.  Which might turn out to compile away to the identity function when host 
and guest are both asm-generic.


r~

