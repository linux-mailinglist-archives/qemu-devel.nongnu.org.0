Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C327457D10
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 11:35:01 +0100 (CET)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moNhz-00021b-T3
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 05:34:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moNgw-0001Lc-Rg
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 05:33:54 -0500
Received: from [2a00:1450:4864:20::42e] (port=38421
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moNgq-0003SZ-OF
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 05:33:54 -0500
Received: by mail-wr1-x42e.google.com with SMTP id u18so22670222wrg.5
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 02:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w87PkhxOLxmwNn2bZT81aMzbv4R64jDQBemEhKEpxfY=;
 b=dpAtgYWEU8GU7II/9MnYgpQMQ2+83IB5JKO9TfLpibVm1vkyT0i1opKONzxJne70Cl
 w9+Pl94OZHfywLTbOGhkaaLu+CWkLDJfhVLJVXGmnULpkvsfD9cQIpxgPRoZhJO7xpaS
 3mX3RoPJof07XceeKwODAOTALf/DC2Won7QKui9VK0gNKi/UHumnJQv8XcHshwin9xaR
 ied51rYs07oLPkEW6eMqdx3Sn8uxOet/6hynvCP+Q0vXk5BanXQ8ReCcYZtEJ0zL+5r7
 xtKVvU/Hsm8FRbiGtTNF10DJahK3JBKDeZt45F/JpH2uh/S7qCB7JYwLBKl5HDzPNJba
 ZT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w87PkhxOLxmwNn2bZT81aMzbv4R64jDQBemEhKEpxfY=;
 b=Lg9Mc/V7RquqXNkjo0Olih1dt+Ul1t3GIUwCT8q83l0N7rkY+00jzbgDnJTlD+WAJ6
 GRbgpRNjuOw9ufEtmgxacpUwIRh5g0JN4YsdBU0pVlTf15rkFsSM/MXLt+TRXlT5A1D3
 OQ8a54hn/kG/un/W3naaJRJvXu10rUrPN+jYRM5R/kUueHBGXJvYfTk0pkZWmWtLac6g
 MRzO07li+MWVARSoYf9w08jZDpQD5nrJ/6oZJSavS5nqH2dCXYgxIk2A++K9gavyOAQC
 3LT5/6vdA4PWk0f1NfiekiNclMtKdrmmoXKvDu6eZE1L3o4gVwFELnYz0S7ap0mv3f3n
 3/bg==
X-Gm-Message-State: AOAM531HE25HhsNvpu2ecC0HW85Eqa67hKvR7J3bbLGj4oemEbrbNkCJ
 fCJFuPUy7EhiP7MBnpq4+TUjTA==
X-Google-Smtp-Source: ABdhPJwEU4MA7jJlz+OfxmX15f7exvPP3e6+oT/Mma+UFwmE0dmybRt4Ipi+yD1CJgLmxeAE5xWQWw==
X-Received: by 2002:a5d:6d84:: with SMTP id l4mr17311809wrs.266.1637404426757; 
 Sat, 20 Nov 2021 02:33:46 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id l5sm2405385wml.20.2021.11.20.02.33.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 02:33:46 -0800 (PST)
Subject: Re: [PATCH v11 19/26] linux-user: Add LoongArch signal support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-20-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
Date: Sat, 20 Nov 2021 11:33:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-20-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   linux-user/loongarch64/signal.c        | 162 +++++++++++++++++++++++++++++++++
>   linux-user/loongarch64/target_signal.h |  29 ++++++
>   2 files changed, 191 insertions(+)
>   create mode 100644 linux-user/loongarch64/signal.c
>   create mode 100644 linux-user/loongarch64/target_signal.h
> 
> diff --git a/linux-user/loongarch64/signal.c b/linux-user/loongarch64/signal.c
> new file mode 100644
> index 0000000..8fbc827
> --- /dev/null
> +++ b/linux-user/loongarch64/signal.c
> @@ -0,0 +1,162 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch emulation of Linux signals
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu.h"
> +#include "signal-common.h"
> +#include "user-internals.h"
> +#include "linux-user/trace.h"
> +
> +struct target_sigcontext {
> +    uint64_t   sc_pc;
> +    uint64_t   sc_gpr[32];
> +    uint64_t   sc_fpr[32];
> +    uint64_t   sc_fcc;
> +    uint32_t   sc_fcsr;
> +    uint32_t   sc_flags;
> +};

Does not match
https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/include/uapi/asm/sigcontext.h

> +
> +struct target_ucontext {
> +    target_ulong tuc_flags;
> +    target_ulong tuc_link;
> +    target_stack_t tuc_stack;
> +    target_ulong pad0;
> +    struct target_sigcontext tuc_mcontext;
> +    target_sigset_t tuc_sigmask;
> +};

Does not match
https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/include/uapi/asm/ucontext.h

> +static inline void setup_sigcontext(CPULoongArchState *env,
> +                                    struct target_sigcontext *sc)

Drop all of the the inline markers.

> +{
> +    int i;
> +
> +    __put_user(env->pc, &sc->sc_pc);
> +
> +    __put_user(0, &sc->sc_gpr[0]);
> +    for (i = 1; i < 32; ++i) {
> +        __put_user(env->gpr[i], &sc->sc_gpr[i]);
> +    }
> +
> +    for (i = 0; i < 32; ++i) {
> +        __put_user(env->fpr[i], &sc->sc_fpr[i]);
> +    }
> +}

Missing fcsr and fcc.

I'll note that the kernel is missing sets of vscr and scr[0-3].  IMO they should at least 
be zeroed in advance of supporting the vector extension.

> +static inline void
> +restore_sigcontext(CPULoongArchState *env, struct target_sigcontext *sc)
> +{
> +    int i;
> +
> +    __get_user(env->pc, &sc->sc_pc);
> +
> +    for (i = 1; i < 32; ++i) {
> +        __get_user(env->gpr[i], &sc->sc_gpr[i]);
> +    }
> +
> +    for (i = 0; i < 32; ++i) {
> +        __get_user(env->fpr[i], &sc->sc_fpr[i]);
> +    }
> +}

Similarly.

> +    return (sp - frame_size) & ~7;

include/asm/asm.h:#define ALMASK        ~15
kernel/signal.c:        return (void __user *)((sp - frame_size) & ALMASK);

> +    env->pc = env->gpr[20] = ka->_sa_handler;

There is no set of gpr[20].

> +void setup_sigtramp(abi_ulong sigtramp_page)
> +{
> +    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
> +    assert(tramp != NULL);
> +
> +    __put_user(0x03822c0b, tramp + 0);  /* ori     a7, a7, 0x8b */

The comment is incorrect: "ori a7, zero, 0x8b", but the hex is right.

> +/* this struct defines a stack used during syscall handling */
> +typedef struct target_sigaltstack {
> +        abi_long ss_sp;
> +        abi_int ss_flags;
> +        abi_ulong ss_size;
> +} target_stack_t;
> +
> +/*
> + * sigaltstack controls
> + */
> +#define TARGET_SS_ONSTACK     1
> +#define TARGET_SS_DISABLE     2
> +
> +#define TARGET_MINSIGSTKSZ    2048
> +#define TARGET_SIGSTKSZ       8192

We should move these to generic/signal.h.


r~

