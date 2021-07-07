Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1520C3BE0AD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:54:50 +0200 (CEST)
Received: from localhost ([::1]:37678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0wm0-0006gD-Sp
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wlB-00061e-5g
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:53:57 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wl9-0007cS-63
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:53:56 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 d9-20020a17090ae289b0290172f971883bso2117817pjz.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 18:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hNdKH/5Jf+aUsgYkRnw0UPb3dx4GEQn0wx7hu9L7hSk=;
 b=hVHwMjw24dsZEYeg9txGqlqoQWrxlqd0vlcU+I9BRJFhqRNs/SZlnbtHkh+OfTbVG/
 yY09pJya93VMucvZ0M3ntBTm5X8Umax/v/vh6aeM2HqhJSP085cZp2DJDd/k0skGQtT0
 M4tXY+50/hJ3apTSHFgd6wdmL334OEvODD4IopIw1U1dOma2TtO1D9Rl5P/PHgXjEc9z
 u9NH2svne9V+OTpzGu4QPI85LPwbLfAooV9z3qLy87CogIKpYdSAzCcJIUUey0GRonOw
 urSLIC1NvPADUYHNKAe6K/SYXNb9DGKPSNdi6DRollwafbFFWWccFlWUkS0+Mt1WSg7R
 PegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hNdKH/5Jf+aUsgYkRnw0UPb3dx4GEQn0wx7hu9L7hSk=;
 b=IcFnLO0lxbwCE04NfxigSteP9MATdejGEa+4/kxSauFtunkWBZ9y2Hbfwt9MyhpRHk
 GqrNR6QEa3K5fOqFC+yyAa0X69otRqR45CqZ0kvSo5anJAJYOw8EVD5clD5W37tqf6Ai
 X+e9OBx1oi80q+Nosg9JiC/ZjQFEb3488HEh2KNOE7xhBPfsGMUQ4iglZbSFoXBSnK8B
 xsxsznSX7kc0bqp4DYT0TlxsOGUjhb5bYmGfqJjWaCIc1RsR39opP4EOfA7HtuIQQz8l
 aFGKmcog+ucsmbOOKzcAdZi2FqomoFh+Uelbbx45VCznl04ckcI6EP1OzmNuGtwCjEud
 CHWw==
X-Gm-Message-State: AOAM531wRVtkA9Q0Jv8Fw7WWnVy2uhiHfTOl10n6cBdS60N74KbEfIeg
 BeZXNZOhjYGt3qzoCJv1nStflw==
X-Google-Smtp-Source: ABdhPJxEhbtG7NMbM7EbcFLqe/jcp6GWNEtsKT29NytGeerli5dmWBLsOJ93yyM2nyKZs/lUbQhEQw==
X-Received: by 2002:a17:90a:dac1:: with SMTP id
 g1mr3299972pjx.199.1625622833534; 
 Tue, 06 Jul 2021 18:53:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w22sm2764637pfq.83.2021.07.06.18.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:53:53 -0700 (PDT)
Subject: Re: [PATCH 05/12] linux-user: Extract target errno to
 'target_errno_defs.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210704183755.655002-1-f4bug@amsat.org>
 <20210704183755.655002-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <11e451c0-dfc7-5709-9441-28da39b237e6@linaro.org>
Date: Tue, 6 Jul 2021 18:53:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704183755.655002-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
> We want to access the target errno indepently of the rest
> of the linux-user code. Extract it to a new target-specific
> header: 'target_errno_defs.h'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   linux-user/aarch64/target_errno_defs.h    | 6 ++++++
>   linux-user/alpha/target_errno_defs.h      | 4 ++++
>   linux-user/arm/target_errno_defs.h        | 6 ++++++
>   linux-user/cris/target_errno_defs.h       | 6 ++++++
>   linux-user/errno_defs.h                   | 3 +++
>   linux-user/hexagon/target_errno_defs.h    | 6 ++++++
>   linux-user/hppa/target_errno_defs.h       | 4 ++++
>   linux-user/i386/target_errno_defs.h       | 6 ++++++
>   linux-user/m68k/target_errno_defs.h       | 6 ++++++
>   linux-user/microblaze/target_errno_defs.h | 6 ++++++
>   linux-user/mips/target_errno_defs.h       | 4 ++++
>   linux-user/mips64/target_errno_defs.h     | 4 ++++
>   linux-user/nios2/target_errno_defs.h      | 6 ++++++
>   linux-user/openrisc/target_errno_defs.h   | 6 ++++++
>   linux-user/ppc/target_errno_defs.h        | 6 ++++++
>   linux-user/riscv/target_errno_defs.h      | 6 ++++++
>   linux-user/s390x/target_errno_defs.h      | 6 ++++++
>   linux-user/sh4/target_errno_defs.h        | 6 ++++++
>   linux-user/sparc/target_syscall.h         | 2 --
>   linux-user/x86_64/target_errno_defs.h     | 6 ++++++
>   linux-user/xtensa/target_errno_defs.h     | 6 ++++++
>   21 files changed, 109 insertions(+), 2 deletions(-)
>   create mode 100644 linux-user/aarch64/target_errno_defs.h
>   create mode 100644 linux-user/alpha/target_errno_defs.h
>   create mode 100644 linux-user/arm/target_errno_defs.h
>   create mode 100644 linux-user/cris/target_errno_defs.h
>   create mode 100644 linux-user/hexagon/target_errno_defs.h
>   create mode 100644 linux-user/hppa/target_errno_defs.h
>   create mode 100644 linux-user/i386/target_errno_defs.h
>   create mode 100644 linux-user/m68k/target_errno_defs.h
>   create mode 100644 linux-user/microblaze/target_errno_defs.h
>   create mode 100644 linux-user/mips/target_errno_defs.h
>   create mode 100644 linux-user/mips64/target_errno_defs.h
>   create mode 100644 linux-user/nios2/target_errno_defs.h
>   create mode 100644 linux-user/openrisc/target_errno_defs.h
>   create mode 100644 linux-user/ppc/target_errno_defs.h
>   create mode 100644 linux-user/riscv/target_errno_defs.h
>   create mode 100644 linux-user/s390x/target_errno_defs.h
>   create mode 100644 linux-user/sh4/target_errno_defs.h
>   create mode 100644 linux-user/x86_64/target_errno_defs.h
>   create mode 100644 linux-user/xtensa/target_errno_defs.h
> 
> diff --git a/linux-user/aarch64/target_errno_defs.h b/linux-user/aarch64/target_errno_defs.h
> new file mode 100644
> index 00000000000..a809381165a
> --- /dev/null
> +++ b/linux-user/aarch64/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef AARCH64_TARGET_ERRNO_H
> +#define AARCH64_TARGET_ERRNO_H
> +
> +/* Target uses generic errno */
> +
> +#endif

This could be better.

Consider e.g. termbits.h as the model.
These targets should have exactly one line:

#include "../generic/target_errno.h"

> diff --git a/linux-user/alpha/target_errno_defs.h b/linux-user/alpha/target_errno_defs.h
> new file mode 100644
> index 00000000000..13770b14b82
> --- /dev/null
> +++ b/linux-user/alpha/target_errno_defs.h
> @@ -0,0 +1,4 @@
> +#ifndef ALPHA_TARGET_ERRNO_H
> +#define ALPHA_TARGET_ERRNO_H
> +
> +#endif

This one, and ones like it, become

#ifndef ALPHA_TARGET_ERRNO_H
#define ALPHA_TARGET_ERRNO_H

#include "../generic/target_errno.h"

#undef  TARGET_EBAR
#define TARGET_EBAR  xxx
...

#endif


r~

