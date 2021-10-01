Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F13941EA52
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 12:05:57 +0200 (CEST)
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWFQS-0002Xi-BN
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 06:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mWFOx-0001pW-1g
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 06:04:23 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:51399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mWFOu-0007NE-Rt
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 06:04:22 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MORVA-1mAhbF2Kju-00PuWp; Fri, 01 Oct 2021 12:04:15 +0200
Subject: Re: [PATCH v5 00/26] linux-user: Move signal trampolines to new page
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210929130553.121567-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5cd1da60-450d-ea87-46d2-9f6a4d6865f0@vivier.eu>
Date: Fri, 1 Oct 2021 12:04:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:D+cAdwgQl4etdbnE6cF37uMCyL53esvNeHP0EeZfBNregveDbhH
 DcDy5QvLhmLGb/YGMV7ySkvAhXpRIVoGQy9xK7o1HqmsPx2B0Pf1cJSVlOrjOHcQiHM+hko
 7lk4Aytr1yHQzNBRr3gu04rcsHw2kWYIkgrRugG3tvUnGGidpuAHum+xdsuMSDuGl11i78S
 uNFJF5CeefADu6MqrJ0ww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LDZxR8s+7yU=:YLvNxsKMtSLQqgDvVArXzj
 X/rhixmXlnzZ5SM6RSqi9C0q3o1oOx96ayA3NCV/SBV1E0hYadtTOGyAwp0wB+/xvZjubqG/g
 gTTkAhaa2w8cFmlNvmjX+nKPnZ+TqQ9DckAiRP5rmr4nslU5JT/2RmXkvHb8sV1DrV++VMdyC
 qCmugwKZeg2kvrUUwz9xKaidU9agI0kW6PJQs0qfunxvnPZ6ExlJXp45nHjO2BqPf2dsfVWic
 YyDisExcFAFXtB3X4g48IBACa+0Cw9nuf6h/Q1gcUJ9E65KypgfOFu0qm9m7BTZmgpCOQW5a1
 HR/bySnCG0C3u8LXmd1PFHPGAk/SiiOharxrs+hKuWQ/8etSVRKpij+N7ZAzrMwf+mXCfAliQ
 qvxmU+bMq4a+F++XHylL2xUQsi4rHPPZ+puzkcZphPDwBu7d5awvipxXGq5bwOpeP4cHp6KiS
 qU81UxHnPtyL+rsx7rXSbiNe/e8WNToSURiM014ZBEQBLvaKUN8Waeqa0H/zE/ESsbO/5HSwl
 v/LyJ391rV7kcRDH9ewhnsZN/InI4SsJ77jF90A12Uw0k521nfqfCBO4d4H3aMHPZMabfZPAZ
 c3HnMkFIbGkAIpRZDuwDl7bhkoYv+FqXZopAlwi1NLYKEbkHG6Ax+qgBt5l4TQcfg6sATRmdD
 jPuaSgUYhXlKg/PG0UyhQU/DXBM+F0lVEaCZZEMuCXPLWoHGn8xpb27G89D6UUtNvCRkPcEKk
 XCPvMWXEKWbjix+m61joCujNyGDMJTut5dY3bQ==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.127,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/09/2021 à 15:05, Richard Henderson a écrit :
> Changes for v5:
>   * Fix arm thumb code copy.
>   * Re-enable signals test (except hppa & sh4).
> 
> Changes for v4:
>   * Drop nios2 changes -- I still haven't built a full toolchain.
>   * Clean up arm changes.
>   * Minur i386 pointer type changes.
> 
> Changes for v3:
>   * Drop vdsos, reinstate setup_sigtramp for all targets.
>   * Incorporate nios2 kuser page emulation, which contains
>     the sigtramp for that target.
> 
> Changes for v2:
>   * Add vdsos for aarch64, arm, i386, riscv.
>   * Drop setup_sigtramp for any target with a vdso.
>   * Drop arm v1 signal support.
>   * Simplify ppc encode_trampoline.
> 
> 
> r~
> 
> Richard Henderson (26):
>   linux-user: Add infrastructure for a signal trampoline page
>   linux-user/aarch64: Implement setup_sigtramp
>   linux-user/arm: Drop v1 signal frames
>   linux-user/arm: Drop "_v2" from symbols in signal.c
>   linux-user/arm: Implement setup_sigtramp
>   linux-user/alpha: Implement setup_sigtramp
>   linux-user/cris: Implement setup_sigtramp
>   linux-user/hexagon: Implement setup_sigtramp
>   linux-user/hppa: Document non-use of setup_sigtramp
>   linux-user/i386: Implement setup_sigtramp
>   linux-user/x86_64: Raise SIGSEGV if SA_RESTORER not set
>   linux-user/m68k: Implement setup_sigtramp
>   linux-user/microblaze: Implement setup_sigtramp
>   linux-user/mips: Tidy install_sigtramp
>   linux-user/mips: Implement setup_sigtramp
>   linux-user/nios2: Document non-use of setup_sigtramp
>   linux-user/openrisc: Implement setup_sigtramp
>   linux-user/ppc: Simplify encode_trampoline
>   linux-user/ppc: Implement setup_sigtramp
>   linux-user/riscv: Implement setup_sigtramp
>   linux-user/s390x: Implement setup_sigtramp
>   linux-user/sh4: Implement setup_sigtramp
>   linux-user/sparc: Implement setup_sigtramp
>   linux-user/xtensa: Implement setup_sigtramp
>   linux-user: Remove default for TARGET_ARCH_HAS_SIGTRAMP_PAGE
>   tests/tcg/multiarch: Re-enable signals test for most guests
> 
>  linux-user/aarch64/target_signal.h    |   2 +
>  linux-user/alpha/target_signal.h      |   1 +
>  linux-user/arm/target_signal.h        |   2 +
>  linux-user/cris/target_signal.h       |   2 +
>  linux-user/hexagon/target_signal.h    |   2 +
>  linux-user/hppa/target_signal.h       |  14 +
>  linux-user/i386/target_signal.h       |   2 +
>  linux-user/m68k/target_signal.h       |   2 +
>  linux-user/microblaze/target_signal.h |   2 +
>  linux-user/mips/target_signal.h       |   1 +
>  linux-user/mips64/target_signal.h     |   2 +
>  linux-user/nios2/target_signal.h      |   3 +
>  linux-user/openrisc/target_signal.h   |   2 +
>  linux-user/ppc/target_signal.h        |   2 +
>  linux-user/riscv/target_signal.h      |   2 +
>  linux-user/s390x/target_signal.h      |   2 +
>  linux-user/sh4/target_signal.h        |   2 +
>  linux-user/signal-common.h            |   6 +
>  linux-user/sparc/target_signal.h      |   4 +
>  linux-user/x86_64/target_signal.h     |   3 +
>  linux-user/xtensa/target_signal.h     |   2 +
>  linux-user/aarch64/signal.c           |  34 +-
>  linux-user/alpha/signal.c             |  34 +-
>  linux-user/arm/signal.c               | 580 +++++++++-----------------
>  linux-user/cris/signal.c              |  29 +-
>  linux-user/elfload.c                  |  14 +
>  linux-user/hexagon/signal.c           |  19 +-
>  linux-user/i386/signal.c              |  65 ++-
>  linux-user/m68k/signal.c              |  47 +--
>  linux-user/microblaze/signal.c        |  24 +-
>  linux-user/mips/signal.c              |  39 +-
>  linux-user/openrisc/signal.c          |  22 +-
>  linux-user/ppc/signal.c               |  40 +-
>  linux-user/riscv/signal.c             |  22 +-
>  linux-user/s390x/signal.c             |  24 +-
>  linux-user/sh4/signal.c               |  40 +-
>  linux-user/signal.c                   |   3 +
>  linux-user/sparc/signal.c             |  40 +-
>  linux-user/xtensa/signal.c            |  56 ++-
>  tests/tcg/hppa/Makefile.target        |   7 +
>  tests/tcg/i386/Makefile.target        |   3 -
>  tests/tcg/multiarch/Makefile.target   |   8 -
>  tests/tcg/sh4/Makefile.target         |   7 +
>  43 files changed, 613 insertions(+), 604 deletions(-)
> 

Applied to my linux-user-for-6.2 branch.

Thanks,
Laurent


