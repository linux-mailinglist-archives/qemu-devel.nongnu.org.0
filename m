Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B443BF89D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:58:02 +0200 (CEST)
Received: from localhost ([::1]:42256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1RjF-00016n-6a
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1Rgs-0007WU-Bj
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:55:34 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1Rgq-0007eZ-E3
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:55:34 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f17so6959407wrt.6
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 03:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LZq10r/b2LaRmOvnK/QKzHZlwdzvklxGGuynn4v6N+Q=;
 b=UP7dBEDgNT3ZdvYk8T9wSbqA8x/00//VA+oN85jkmcJwWGHCF6IyHkxcMO/PHu2KlS
 tncM7sO9/7hLg1mYHZyxfasni3XZjU9DL3w5CrBdRxtjVt8aiS4+mj2JdhdoNSdEpvkD
 Fp5jg7uKxLGaPOS1GQsYHG7Ct2IUwksHUdFUF3I1j2oE7crHJ8khKcHUCVL3ZJ5/kE3L
 F8bQWRObpZoJulgxTdzfRlG5uQT8NDrnxVO/0WQvFGkDolDx3fwYG7vJrKlZc1Od2VjD
 qM80BJ2XnJm0mu9L7/8aP53xIu5uYCywdSlVUQ2AtCP8eLmmJMY0tnnaDmglTN+kq0LA
 c/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LZq10r/b2LaRmOvnK/QKzHZlwdzvklxGGuynn4v6N+Q=;
 b=GyoqhfS44Kw8EABxiKt1o2/BjQqThqU4367p3Wpt5LvJwPabbptPi9xdIQ8LST50QD
 UNmxde9BhTRoQlxX52sbDG2beS9axLsWLouqmlfbMBXvqVsK7jyXKAzK/RzHCg6QFWyu
 m9i5Ai+9op3YEJdV+YkMJ2GwcvFNOEzi0VV4tq9E0UxwIe2/up8XRO4dZ6VrQLoB7GHd
 9BRfPHZHXV5nNdFhzk67nXBY3vWaU+80SVCT10VT1sRUq4LSiRdXu28MJxqkgS2I0MnF
 CmYfuDiwf9ZWq3sFeQq0urFm0Dm5jGAc0qxc3FuTZ+FWVq4uim3HLn0s9cmqewljG6sH
 OUPQ==
X-Gm-Message-State: AOAM533jeAaY0Mljxdi+GONdyarlE3uBp4uETK/3BNqWyvODhYtkrgsC
 8nqkqBF2GPz/7R///KlVFQA=
X-Google-Smtp-Source: ABdhPJwd4jHYexoP8uo19ve3OhAKsMiis1vNYy6Jk9Xin4NG0diUVbI6f8EcKx1ETmwDfR+kn+NHjw==
X-Received: by 2002:a5d:6b91:: with SMTP id n17mr5781656wrx.385.1625741731024; 
 Thu, 08 Jul 2021 03:55:31 -0700 (PDT)
Received: from [192.168.50.31] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id r15sm8569013wmq.15.2021.07.08.03.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 03:55:30 -0700 (PDT)
Subject: Re: [PATCH v2 00/36] linux-user: Signal trampolines and vdsos
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210706234932.356913-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9544c420-622d-8297-3a47-0dfb95a8da23@amsat.org>
Date: Thu, 8 Jul 2021 12:55:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 1:48 AM, Richard Henderson wrote:
> Supercedes: <20210619034329.532318-1-richard.henderson@linaro.org>
> ("[PATCH 00/12] linux-user: Load a vdso for x86_64 and hppa")
> 
> Supercedes: <20210618192951.125651-1-richard.henderson@linaro.org>
> ("[PATCH v2 00/23] linux-user: Move signal trampolines to new page")
> 
> Changes for v2:
>   * Add vdsos for aarch64, arm, i386, riscv.
>   * Drop setup_sigtramp for any target with a vdso.
>   * Drop arm v1 signal support.
>   * Simplify ppc encode_trampoline.
> 
> The remaining linux kernel targets that support vdsos are:
> 
> MIPS is particularly troublesome because of a multitude of ISAs.
> The kernel doesn't even support them all, disabling the vdso for
> micromips (and probably ignores nanomips entirely).  Though I'll
> note that linux-user/mips does not handle any of the modern
> ISAs -- install_sigtramp is strictly MIPS I.  In addition there
> are 3 ELF ABIs, so there's some combinatorial explosion in the
> set of vdsos that would need to be pre-built.  Perhaps put this
> off until we can build these on demand.

Cc'ing Maciej to keep him aware, but FWIW, this sounds good to me.

> PPC is troublesome because of __kernel_get_syscall_map.
> In addition to needing to collect the set of syscalls that qemu
> supports, we'd need to update the vdso every time we add support
> for a new syscall.  And then there are the 3 ELF ABIs.  So again
> put this off until we can build these on demand.
> 
> S390x shouldn't be troublesome, I just didn't finish them all.
> 
> 
> r~
> 
> 
> Richard Henderson (36):
>   linux-user: Add infrastructure for a signal trampoline page
>   linux-user: Fix style problems in linuxload.c
>   linux-user: Introduce imgsrc_read, imgsrc_read_alloc
>   linux-user: Tidy loader_exec
>   linux-user: Do not clobber bprm_buf swapping ehdr
>   linux-user: Use ImageSource in load_elf_image
>   linux-user: Use ImageSource in load_symbols
>   linux-user: Replace bprm->fd with bprm->src.fd
>   linux-user: Introduce imgsrc_mmap
>   linux-user: Load vdso image if available
>   linux-user: Add gen-vdso tool
>   linux-user/aarch64: Add vdso and use it for rt_sigreturn
>   linux-user/arm: Drop v1 signal frames
>   linux-user/arm: Drop "_v2" from symbols in signal.c
>   target/arm: Add isar_feature_aa32_a32
>   linux-user/arm: Add vdso and use it for rt_sigreturn
>   linux-user/alpha: Implement setup_sigtramp
>   linux-user/cris: Implement setup_sigtramp
>   linux-user/hexagon: Implement setup_sigtramp
>   linux-user/hppa: Add vdso and use it for rt_sigreturn
>   linux-user/x86_64: Raise SIGSEGV if SA_RESTORER not set
>   linux-user/i386: Add vdso and use it for sigreturn
>   linux-user/x86_64: Add vdso
>   linux-user/m68k: Implement setup_sigtramp
>   linux-user/microblaze: Implement setup_sigtramp
>   linux-user/mips: Tidy install_sigtramp
>   linux-user/mips: Implement setup_sigtramp
>   linux-user/nios2: Document non-use of setup_sigtramp
>   linux-user/openrisc: Implement setup_sigtramp
>   target/ppc: Simplify encode_trampoline
>   linux-user/ppc: Implement setup_sigtramp
>   linux-user/riscv: Add vdso and use it for sigreturn
>   linux-user/s390x: Implement setup_sigtramp
>   linux-user/sh4: Implement setup_sigtramp
>   linux-user/sparc: Implement setup_sigtramp
>   linux-user/xtensa: Implement setup_sigtramp
> 
>  linux-user/alpha/target_signal.h      |   1 +
>  linux-user/cris/target_signal.h       |   2 +
>  linux-user/hexagon/target_signal.h    |   2 +
>  linux-user/m68k/target_signal.h       |   2 +
>  linux-user/microblaze/target_signal.h |   2 +
>  linux-user/mips/target_signal.h       |   1 +
>  linux-user/mips64/target_signal.h     |   2 +
>  linux-user/nios2/target_signal.h      |   3 +
>  linux-user/openrisc/target_signal.h   |   2 +
>  linux-user/ppc/target_signal.h        |   2 +
>  linux-user/qemu.h                     |  67 +++-
>  linux-user/s390x/target_signal.h      |   2 +
>  linux-user/sh4/target_signal.h        |   2 +
>  linux-user/sparc/target_signal.h      |   4 +
>  linux-user/xtensa/target_signal.h     |   2 +
>  target/arm/cpu.h                      |   5 +
>  linux-user/aarch64/signal.c           |  17 +-
>  linux-user/alpha/signal.c             |  34 +-
>  linux-user/arm/signal.c               | 500 ++++++--------------------
>  linux-user/cris/signal.c              |  29 +-
>  linux-user/elfload.c                  | 367 ++++++++++++-------
>  linux-user/flatload.c                 |   8 +-
>  linux-user/gen-vdso.c                 | 223 ++++++++++++
>  linux-user/hexagon/signal.c           |  19 +-
>  linux-user/hppa/signal.c              |   8 +-
>  linux-user/i386/signal.c              |  50 +--
>  linux-user/linuxload.c                | 171 ++++++---
>  linux-user/m68k/signal.c              |  47 ++-
>  linux-user/microblaze/signal.c        |  24 +-
>  linux-user/mips/signal.c              |  39 +-
>  linux-user/openrisc/signal.c          |  24 +-
>  linux-user/ppc/signal.c               |  40 +--
>  linux-user/riscv/signal.c             |  10 +-
>  linux-user/s390x/signal.c             |  24 +-
>  linux-user/sh4/signal.c               |  40 ++-
>  linux-user/signal.c                   |   3 +
>  linux-user/sparc/signal.c             |  32 +-
>  linux-user/xtensa/signal.c            |  50 +--
>  target/arm/cpu_tcg.c                  |   7 +
>  linux-user/gen-vdso-elfn.c.inc        | 306 ++++++++++++++++
>  linux-user/aarch64/Makefile.vdso      |  11 +
>  linux-user/aarch64/meson.build        |  11 +
>  linux-user/aarch64/vdso-be.so         | Bin 0 -> 6000 bytes
>  linux-user/aarch64/vdso-le.so         | Bin 0 -> 6000 bytes
>  linux-user/aarch64/vdso.S             |  77 ++++
>  linux-user/aarch64/vdso.ld            |  74 ++++
>  linux-user/arm/Makefile.vdso          |  17 +
>  linux-user/arm/meson.build            |  18 +
>  linux-user/arm/vdso-arm-be.so         | Bin 0 -> 5648 bytes
>  linux-user/arm/vdso-arm-le.so         | Bin 0 -> 5648 bytes
>  linux-user/arm/vdso-thm-be.so         | Bin 0 -> 5620 bytes
>  linux-user/arm/vdso-thm-le.so         | Bin 0 -> 5620 bytes
>  linux-user/arm/vdso.S                 | 209 +++++++++++
>  linux-user/arm/vdso.ld                |  74 ++++
>  linux-user/hppa/Makefile.vdso         |   6 +
>  linux-user/hppa/meson.build           |   6 +
>  linux-user/hppa/vdso.S                | 149 ++++++++
>  linux-user/hppa/vdso.ld               |  75 ++++
>  linux-user/hppa/vdso.so               | Bin 0 -> 5196 bytes
>  linux-user/i386/Makefile.vdso         |   5 +
>  linux-user/i386/meson.build           |   7 +
>  linux-user/i386/vdso.S                | 149 ++++++++
>  linux-user/i386/vdso.ld               |  76 ++++
>  linux-user/i386/vdso.so               | Bin 0 -> 5528 bytes
>  linux-user/meson.build                |   8 +-
>  linux-user/riscv/Makefile.vdso        |  11 +
>  linux-user/riscv/meson.build          |   9 +
>  linux-user/riscv/vdso-32.so           | Bin 0 -> 5624 bytes
>  linux-user/riscv/vdso-64.so           | Bin 0 -> 6120 bytes
>  linux-user/riscv/vdso.S               | 207 +++++++++++
>  linux-user/riscv/vdso.ld              |  76 ++++
>  linux-user/x86_64/Makefile.vdso       |   5 +
>  linux-user/x86_64/meson.build         |   6 +
>  linux-user/x86_64/vdso.S              | 122 +++++++
>  linux-user/x86_64/vdso.ld             |  74 ++++
>  linux-user/x86_64/vdso.so             | Bin 0 -> 6008 bytes
>  76 files changed, 2866 insertions(+), 789 deletions(-)
>  create mode 100644 linux-user/gen-vdso.c
>  create mode 100644 linux-user/gen-vdso-elfn.c.inc
>  create mode 100644 linux-user/aarch64/Makefile.vdso
>  create mode 100644 linux-user/aarch64/meson.build
>  create mode 100755 linux-user/aarch64/vdso-be.so
>  create mode 100755 linux-user/aarch64/vdso-le.so
>  create mode 100644 linux-user/aarch64/vdso.S
>  create mode 100644 linux-user/aarch64/vdso.ld
>  create mode 100644 linux-user/arm/Makefile.vdso
>  create mode 100755 linux-user/arm/vdso-arm-be.so
>  create mode 100755 linux-user/arm/vdso-arm-le.so
>  create mode 100755 linux-user/arm/vdso-thm-be.so
>  create mode 100755 linux-user/arm/vdso-thm-le.so
>  create mode 100644 linux-user/arm/vdso.S
>  create mode 100644 linux-user/arm/vdso.ld
>  create mode 100644 linux-user/hppa/Makefile.vdso
>  create mode 100644 linux-user/hppa/vdso.S
>  create mode 100644 linux-user/hppa/vdso.ld
>  create mode 100755 linux-user/hppa/vdso.so
>  create mode 100644 linux-user/i386/Makefile.vdso
>  create mode 100644 linux-user/i386/vdso.S
>  create mode 100644 linux-user/i386/vdso.ld
>  create mode 100755 linux-user/i386/vdso.so
>  create mode 100644 linux-user/riscv/Makefile.vdso
>  create mode 100644 linux-user/riscv/meson.build
>  create mode 100755 linux-user/riscv/vdso-32.so
>  create mode 100755 linux-user/riscv/vdso-64.so
>  create mode 100644 linux-user/riscv/vdso.S
>  create mode 100644 linux-user/riscv/vdso.ld
>  create mode 100644 linux-user/x86_64/Makefile.vdso
>  create mode 100644 linux-user/x86_64/vdso.S
>  create mode 100644 linux-user/x86_64/vdso.ld
>  create mode 100755 linux-user/x86_64/vdso.so
> 


