Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FAE44C5BC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 18:12:10 +0100 (CET)
Received: from localhost ([::1]:49474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkr8p-0004Ir-5q
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 12:12:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkr1H-0004vu-Cj
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 12:04:19 -0500
Received: from [2a00:1450:4864:20::434] (port=38835
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkr1E-0001l2-FZ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 12:04:18 -0500
Received: by mail-wr1-x434.google.com with SMTP id u18so5213668wrg.5
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 09:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vZtFX7E7LmMjM7Fb/tkvTW4ySe37pcR3rl2S5wkGSa0=;
 b=IttyLI+neGaJcC8FApQ6Xsrc9O8ennYIXyjJ4Pt+dz4gCCIpbyEuVwTisGK0evgmp3
 Ir1dRVoy7hBKgKSKTHPAsL7AdAImrqwaMZjdkvSXPjdokJ0pVQX4uLAXrlMipFmfiz4p
 6aJLlc7XixmXzSvFzhrU/LBNFrmEyW+MvCwwvNRq2Mp62CiytMpI+QeejGQqTNWpL1jg
 5HgqXaUigoXeKSKTlcKseLl7Nb3kzFWJse65KcVOPrkSlfLDakWgsnK6qq8GemLt5Tr9
 Y6xbQWvDXtrmv/7WRhWRmfKh+uVBLsB0tZqUBNX8ouh4Z+vkMFqcs2YXk06HYwDKB9pN
 SoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vZtFX7E7LmMjM7Fb/tkvTW4ySe37pcR3rl2S5wkGSa0=;
 b=SNuBylzGJxckiz9lwml5NGlwzEIuDJUoLQoXF51hN8BXhqLmSJXH2XKinZiM4qpm7w
 mi9oubysnv6rG7cIfPQ1+7xm9rz/1KSvA+rAFQQfsV9atVZwJWUcgJRJHWV18lUZjXUy
 eLiTfyOrlg2JhrrJu+ePGgnnQGuF6L9OMPC4q/FF7nSmA6/eb368nBVFrdlflQBR+TOS
 ZFOEGmwgWJNjLsP3EMOMRCm8sVAxa8IFfxWB/l81BZf0LvfCsjpjSeX1Vibr1brXRk4j
 M+DnzLwlzMiEEojXi9hbpAWI42rCKJxgWUs7kmacmh/HH68oENAB5zMqXEzqdSpanZog
 Jf1A==
X-Gm-Message-State: AOAM533ItCq9H/K+sUZSjbL4tayakHnoE+tZZeUt7NG9Ipv54xt9n+BY
 VAIc1/fFHrGMt1iKfoJzJmTPBA==
X-Google-Smtp-Source: ABdhPJyk5ybY2RqvidcLpS4FicQnzxp2QaaWev5T/Hfr4AN6zQkpzshy6t2khqAlLjbZvzpXoWoDDw==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr592595wrj.325.1636563854747;
 Wed, 10 Nov 2021 09:04:14 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id f3sm6144562wmb.12.2021.11.10.09.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 09:04:14 -0800 (PST)
Subject: Re: [RFC v2 6/6] *-user: move safe-syscall.* to common-user
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211110163133.76357-1-imp@bsdimp.com>
 <20211110163133.76357-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b0c5d701-5187-58ab-7b34-aead73ebae68@linaro.org>
Date: Wed, 10 Nov 2021 18:04:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110163133.76357-7-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 5:31 PM, Warner Losh wrote:
> Move linux-user/safe-syscall.S to common-user/common-safe-syscall.S and
> replace it with a #include "common-safe-syscall.S" so that bsd-user can
> also use it. Also move safe-syscall.h so that it can define a few more
> externs.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   common-user/common-safe-syscall.S          | 30 +++++++++++++++++++++
>   {linux-user => common-user}/safe-syscall.h |  0
>   linux-user/safe-syscall.S                  | 31 +---------------------
>   linux-user/signal.c                        |  1 +
>   meson.build                                |  1 +
>   5 files changed, 33 insertions(+), 30 deletions(-)
>   create mode 100644 common-user/common-safe-syscall.S
>   rename {linux-user => common-user}/safe-syscall.h (100%)
> 
> diff --git a/common-user/common-safe-syscall.S b/common-user/common-safe-syscall.S
> new file mode 100644
> index 0000000000..42ea7c40ba
> --- /dev/null
> +++ b/common-user/common-safe-syscall.S
> @@ -0,0 +1,30 @@
> +/*
> + * safe-syscall.S : include the host-specific assembly fragment
> + * to handle signals occurring at the same time as system calls.
> + *
> + * Written by Peter Maydell <peter.maydell@linaro.org>
> + *
> + * Copyright (C) 2016 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "hostdep.h"
> +#include "target_errno_defs.h"
> +
> +/* We have the correct host directory on our include path
> + * so that this will pull in the right fragment for the architecture.
> + */
> +#ifdef HAVE_SAFE_SYSCALL
> +#include "safe-syscall.inc.S"
> +#endif
> +
> +/* We must specifically say that we're happy for the stack to not be
> + * executable, otherwise the toolchain will default to assuming our
> + * assembly needs an executable stack and the whole QEMU binary will
> + * needlessly end up with one. This should be the last thing in this file.
> + */
> +#if defined(__linux__) && defined(__ELF__)
> +.section        .note.GNU-stack, "", %progbits
> +#endif

Hmm.  If we're going to split this file into safe-syscall.S and common-safe-syscall.S, we 
shouldn't do the ifdef thing here.  (Why it was present at all for linux-user is a mystery.)

What do you have planned for bsd-user that would be more than

> +#include "common-safe-syscall.S"

this?


r~

