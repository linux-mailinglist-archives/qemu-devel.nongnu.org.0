Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0426D45A2D4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 13:39:50 +0100 (CET)
Received: from localhost ([::1]:57482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpV5P-00020O-Hp
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 07:39:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpV0T-0006hT-0F
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 07:34:41 -0500
Received: from [2a00:1450:4864:20::430] (port=46909
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpV0P-0000IV-Gs
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 07:34:40 -0500
Received: by mail-wr1-x430.google.com with SMTP id u1so38669234wru.13
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 04:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=b/ZuvY8AHJMaum7QDxTgflPoUu/rAo5bR8zMNUpHaak=;
 b=n360ekevZ2k4Zbg1+5vh6s236G8vJPhYGtV0x96TkmBcgBWte7V43EE4Lg0/zC504w
 VDeOGZQATodUBqQLT3nx/pAnzvNmlDm+4szyJ5zYxIhZb8hrWpo4/PdZQAjaruQ9es+O
 IqHvNTJjjJFMdReMi0cDv08HibrBPkDkpKYbJMioN9vLc/+2PRizxdoEfZmAVWOwYqIx
 geCBqkbg7OJ2h0NqoG/KR1lmnm5P38/n/GKb6OitojvwMSxrRyR+kM50RRvrY2uifisA
 2QkLQUZgjnvB4giwmb42puTE54scrXfBUZCio9NAutOe+ezGE9WNwXodriivbqx4+Xd7
 xC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b/ZuvY8AHJMaum7QDxTgflPoUu/rAo5bR8zMNUpHaak=;
 b=F49GHyyIB1HI1iK+irWP/91+Py1lD9+UusPF7KSpQN3U+J+gdSqP9Xt+LxDX1Lf4Nw
 RwGarOqfJSy3ed/eyTc1rOhuII/zf6G31JZ32YyOznDwZFipC9eUo3oY2SqM9Iv+30Tg
 616Wg1iAPfwgMrNKakBjYeL128NwHhxSdekGebe1wuJftfCwQNPU95YG5+//XSbyYmVt
 mmMFBNer+yFc2PF2vvCPhfkT4/XVuc6tMCv+OXZbD6WmXsaAxOIIjVF0exig1oRq/i/T
 uqz5kxp7R7FVtF9TNfuiKtYcNe9owHSNP8k7COs9zdXzs/VjCwq7+tkx1P+nEfPoW/It
 5esA==
X-Gm-Message-State: AOAM533Y5Q9wdYspkH01hIW7xZExkqPZUTfkR4IlgCqTQN/qg2eQ7cB9
 quEG7QWWehrMB4hJUVexqR4Tss1eOD64nq3wyY4=
X-Google-Smtp-Source: ABdhPJz6aRFqxsBhqyKYFWgiAbd0++6ffueO56ND1+D+mQPJrc4dy21cWCDDyMLocXIUZJpZGc7L/g==
X-Received: by 2002:adf:ea0c:: with SMTP id q12mr6716829wrm.299.1637670875806; 
 Tue, 23 Nov 2021 04:34:35 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id u15sm1376995wmq.13.2021.11.23.04.34.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 04:34:35 -0800 (PST)
Subject: Re: [PULL 0/2] linux-user: Create a common rewind_if_in_safe_syscall
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211123085030.465072-1-richard.henderson@linaro.org>
Message-ID: <27290d88-7162-ce36-efa3-81c62f6a4de5@linaro.org>
Date: Tue, 23 Nov 2021 13:34:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123085030.465072-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.515,
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

On 11/23/21 9:50 AM, Richard Henderson wrote:
> The following changes since commit 6d9c9603ad2ffdbf2aae3f01955c17591287cb4c:
> 
>    Merge tag 'pull-target-arm-20211122-1' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2021-11-23 01:41:05 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-lu-20211123
> 
> for you to fetch changes up to 07637888687bfecf3c0cc8351c5c24f29a611691:
> 
>    linux-user/signal.c: Create a common rewind_if_in_safe_syscall (2021-11-23 01:47:20 +0100)
> 
> ----------------------------------------------------------------
> Create common rewind_if_in_safe_syscall function.
> Resolves pointer type issues with uc_mcontext.pc
> on aarch64 between glibc and musl.
> 
> ----------------------------------------------------------------
> Warner Losh (2):
>        linux-user: Add host_signal_set_pc to set pc in mcontext
>        linux-user/signal.c: Create a common rewind_if_in_safe_syscall
> 
>   linux-user/host/aarch64/host-signal.h |  5 +++++
>   linux-user/host/aarch64/hostdep.h     | 20 --------------------
>   linux-user/host/alpha/host-signal.h   |  5 +++++
>   linux-user/host/arm/host-signal.h     |  5 +++++
>   linux-user/host/arm/hostdep.h         | 20 --------------------
>   linux-user/host/i386/host-signal.h    |  5 +++++
>   linux-user/host/i386/hostdep.h        | 20 --------------------
>   linux-user/host/mips/host-signal.h    |  5 +++++
>   linux-user/host/ppc/host-signal.h     |  5 +++++
>   linux-user/host/ppc64/hostdep.h       | 20 --------------------
>   linux-user/host/riscv/host-signal.h   |  5 +++++
>   linux-user/host/riscv/hostdep.h       | 20 --------------------
>   linux-user/host/s390/host-signal.h    |  5 +++++
>   linux-user/host/s390x/hostdep.h       | 20 --------------------
>   linux-user/host/sparc/host-signal.h   |  9 +++++++++
>   linux-user/host/x86_64/host-signal.h  |  5 +++++
>   linux-user/host/x86_64/hostdep.h      | 20 --------------------
>   linux-user/safe-syscall.h             |  3 +++
>   linux-user/signal.c                   | 15 ++++++++++++---
>   19 files changed, 69 insertions(+), 143 deletions(-)

Applied.

r~


