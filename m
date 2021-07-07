Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ACD3BF17B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 23:42:34 +0200 (CEST)
Received: from localhost ([::1]:59074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1FJR-0001Pw-Qe
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 17:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1FIe-0000k7-95
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 17:41:44 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1FIc-0007Ym-4i
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 17:41:43 -0400
Received: by mail-pg1-x52d.google.com with SMTP id d12so3698630pgd.9
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 14:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=X/BphWnv/1htSOjfxwVrCY/gdAVowlE2uA0ZPSetJYI=;
 b=eDQPBqWu7ggm7LPnTsi3l5BILwrKGGExvqtsXcSY6deNEvsehEv7tzaX5D9S4kBVms
 HRsBijf5bLhkiqFQPA/MC+MGZeEWBHeOVVEuCjg8k7PSfcbJ8OXYkQ02L1vSCAonuiGc
 IRsjCJuC0iOcS89/dLVd7/bFYSTjFki5AJM1UBHv1zk7UawEu8lp3wxddeR1bElJgkfq
 IuVbJ7clTNvYGEHXZ67qzgscPsNTPnKh2Mc8yb/zvhicyUqGCbqzWzv+OUTiaAy05i3f
 VnOgWVHtqgR13eVZbcj7QHTairBZk17bBF+BGioOm06mDkdk6XodYYNfm9CUd8UATkUJ
 HVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X/BphWnv/1htSOjfxwVrCY/gdAVowlE2uA0ZPSetJYI=;
 b=lUR5GK5JDCui21dqabfGFOAMji78n8+J4DyMZrf8i7EDXYtdjPFdhwcnrQQho+gyUp
 jTlMtYKDefQdGBnUwVo7hKQkvSLGHxMBdZzW/mgFyGPKD5T43Pxlo1a4ZWamnyM6jkG6
 A157mWljaEUIsYLHwAcf7SF90J5mzkuEcVDreK2cUxXIr4OGmgykf8sBH+ovFY7NmULR
 sidc0gCxmVg+Nr/pp/npg2NP7nF6sQKcbdhEPn25CJmlODepqJcZL77x9i9lXLYPWtj0
 k3nrU5/j/jMgzeyQJjcxWm7W5f90pmomH2LIyKBmsnELTL0B+Z2JGlhmU3orAQjaJbjq
 2j8A==
X-Gm-Message-State: AOAM5310S4PJPAG+KMcLSGzqi5bVZgDMYi0ejfelgyEzB1LKj8afjDQw
 ckQC/QK9hBFRVtviGRjAHjb4SA==
X-Google-Smtp-Source: ABdhPJwV5CqHR7YHa1Bgg1G/tRv/QfhmuFCXCtrbmbYwxSo5ps2DLs+YnCuuHWPVsPSjxkcWfz8jMQ==
X-Received: by 2002:a63:494d:: with SMTP id y13mr28989183pgk.248.1625694100260; 
 Wed, 07 Jul 2021 14:41:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w123sm157629pfb.109.2021.07.07.14.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 14:41:40 -0700 (PDT)
Subject: Re: [PATCH v2 00/28] accel/tcg: Introduce translator_use_goto_tb
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
Message-ID: <c39af1e3-3f45-77e6-c35f-3e0f9053f00c@linaro.org>
Date: Wed, 7 Jul 2021 14:41:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.  FWIW, the 3 target/arm patches are the only major target for which I do not have 
reviews, or am not also the maintainer.

r~

On 6/30/21 11:31 AM, Richard Henderson wrote:
> Based-on: <20210629185455.3131172-1-richard.henderson@linaro.org>
> ("[PULL 00/63] tcg patch queue")
> 
> There are a number of inconsistencies with goto_tb usage, and I
> plan to make changes in order to better support breakpoints.
> 
> (1) Testing CF_LAST_IO is a hold-over from since before ba3e7926691
>      ("icount: clean up cpu_can_io at the entry to the block").
>      Several targets still have this test.
> 
> (2) Testing singlestep is superfluous, as it doesn't mean anything
>      besides limiting max_insns to 1.
> 
> (3) Not testing page crossing for CONFIG_USER_ONLY is wrong, because
>      mmap and mprotect can change page permissions.  It's a very
>      uncommon case wrt executables, but it's still wrong.
> 
> (4) Not testing page crossing for non-mmu targets (where page
>      permissions literally cannot change) is not currently wrong,
>      but will be after the breakpoint changes.
> 
> (5) When the TB does cross two pages, considering non-page crossing
>      from the second page is not currently wrong, but will be after
>      the breakpoint changes.
> 
> Changes for v2:
>    * Fix aarch32 ISB, SB insns vs single-stepping.
>    * Drop use_goto_tb for aarch32
>    * Retain use_goto_tb for aarch64.
> 
> Patches lacking review:
>    02-target-alpha-Remove-use_exit_tb.patch
>    03-target-alpha-Remove-in_superpage.patch
>    04-target-alpha-Use-translator_use_goto_tb.patch
>    05-target-arm-Use-gen_jmp-for-ISB-and-SB.patch
>    06-target-arm-Use-translator_use_goto_tb-for-aarch64.patch
>    07-target-arm-Use-translator_use_goto_tb-for-aarch32.patch
>    08-target-avr-Use-translator_use_goto_tb.patch
>    10-target-cris-Use-translator_use_goto_tb.patch
>    11-target-hppa-Use-translator_use_goto_tb.patch
>    12-target-i386-Use-translator_use_goto_tb.patch
>    14-target-microblaze-Use-translator_use_goto_tb.patch
>    15-target-mips-Use-translator_use_goto_tb.patch
>    17-target-nios2-Use-translator_use_goto_tb.patch
>    18-target-openrisc-Use-translator_use_goto_tb.patch
>    21-target-rx-Use-translator_use_goto_tb.patch
>    22-target-s390x-Use-translator_use_goto_tb.patch
>    23-target-s390x-Remove-use_exit_tb.patch
>    24-target-sh4-Use-translator_use_goto_tb.patch
> 
> 
> r~
> 
> 
> Richard Henderson (28):
>    accel/tcg: Introduce translator_use_goto_tb
>    target/alpha: Remove use_exit_tb
>    target/alpha: Remove in_superpage
>    target/alpha: Use translator_use_goto_tb
>    target/arm: Use gen_jmp for ISB and SB
>    target/arm: Use translator_use_goto_tb for aarch64
>    target/arm: Use translator_use_goto_tb for aarch32
>    target/avr: Use translator_use_goto_tb
>    target/avr: Mark some helpers noreturn
>    target/cris: Use translator_use_goto_tb
>    target/hppa: Use translator_use_goto_tb
>    target/i386: Use translator_use_goto_tb
>    target/m68k: Use translator_use_goto_tb
>    target/microblaze: Use translator_use_goto_tb
>    target/mips: Use translator_use_goto_tb
>    target/mips: Fix missing else in gen_goto_tb
>    target/nios2: Use translator_use_goto_tb
>    target/openrisc: Use translator_use_goto_tb
>    target/ppc: Use translator_use_goto_tb
>    target/riscv: Use translator_use_goto_tb
>    target/rx: Use translator_use_goto_tb
>    target/s390x: Use translator_use_goto_tb
>    target/s390x: Remove use_exit_tb
>    target/sh4: Use translator_use_goto_tb
>    target/sparc: Use translator_use_goto_tb
>    target/tricore: Use translator_use_goto_tb
>    target/tricore: Use tcg_gen_lookup_and_goto_ptr
>    target/xtensa: Use translator_use_goto_tb
> 
>   include/exec/translator.h     | 10 ++++++++
>   target/avr/helper.h           |  8 +++---
>   accel/tcg/translator.c        | 11 +++++++++
>   target/alpha/translate.c      | 46 ++++-------------------------------
>   target/arm/translate-a64.c    | 25 ++++---------------
>   target/arm/translate.c        | 16 +++---------
>   target/avr/translate.c        |  9 ++++---
>   target/cris/translate.c       |  5 ++--
>   target/hppa/translate.c       |  5 +---
>   target/i386/tcg/translate.c   | 14 ++---------
>   target/m68k/translate.c       | 12 +--------
>   target/microblaze/translate.c | 11 +--------
>   target/mips/tcg/translate.c   | 20 +++------------
>   target/nios2/translate.c      | 15 +-----------
>   target/openrisc/translate.c   | 15 ++++++------
>   target/ppc/translate.c        | 10 +-------
>   target/riscv/translate.c      | 20 +--------------
>   target/rx/translate.c         | 11 +--------
>   target/s390x/translate.c      | 18 +++-----------
>   target/sh4/translate.c        | 11 +++------
>   target/sparc/translate.c      | 19 ++++-----------
>   target/tricore/translate.c    | 20 +++------------
>   target/xtensa/translate.c     |  6 +----
>   23 files changed, 83 insertions(+), 254 deletions(-)
> 


