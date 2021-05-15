Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6FE381AD4
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 21:46:06 +0200 (CEST)
Received: from localhost ([::1]:55710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li0Ef-0005iQ-Pq
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 15:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1li0CY-00048l-P2
 for qemu-devel@nongnu.org; Sat, 15 May 2021 15:43:54 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:33481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1li0CP-0001gd-Pr
 for qemu-devel@nongnu.org; Sat, 15 May 2021 15:43:54 -0400
Received: from [192.168.100.1] ([82.142.12.230]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOAJt-1m6ZSo3ev3-00OXJe; Sat, 15 May 2021 21:43:44 +0200
Subject: Re: [PATCH v2 00/25] linux-user/sparc: Implement rt signals
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a3bde463-95bb-3802-1381-beac3675a672@vivier.eu>
Date: Sat, 15 May 2021 21:43:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vj+OYsWDsQjhvXKbZB+BQE+2L00FUrWfdMQNc8M9vRXZy3LBpFu
 4KpndLREuIuf8vSGx/N1jVlCPll2AAPHPfLpyb/7XWMrQ/8a3D1R4+amtuLphrVaO8WMvLw
 iaDKUQMrErZGkcUjIY8JbKe5y81hCbEgxKKYzgpN+t6yZPQpfwNxO+mj81zIOZErjZQBSju
 nv8az9jAxjinw5TzSypdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kuK7pfh2crw=:8noYSv/eAjB1GYJ72xIeyO
 X2Nqz7mNeTHkDlO5Apn0/MfnzSqGPVIO1L7jTfPOdW2HH+xdfM6PrveUD0C1FUFoKOZQL4zw1
 G/Aw97NHITvPoYcGGy3Aw0DVrY/xkFrMeSF5VT0OwDCaaMFebpVwbQMWEtsz4uyBeXx9PvQ11
 yRAX/qfHJJHnaULlfPBe5ASTmkYfV5CMnDwU+/GwQtZE50AlqO8foZhyDiWxNEfjZeIP0InOv
 4bsXSuXAe87a97Et9tRVYtKlFXtXPl2Jy0kpLF4hbm6g1fvBCQvwE5nRB/AkGsJ1ssHbrUH5x
 WK+MfFdD4tlGIFWs1XM4Zg9TJMbIGet4xiKaw6kyQRJjglMyW6AWqQWPQ+ELaHk1TCTUKqUqb
 UdnHyPpg55TUPzGKRqu8S0/aE0c07/hpW7peFEJFz5iUqRLXAn3ZG4HT2Ip168pcrAvLb1Qzf
 TBtUpDG/cEVvxL1Fb8K03ntg3iesOG4qFTkDnStP//NHyCsq8Jnq/R76qIL4ad1X8xJaa0s44
 JnGzE8jbF9kbQMVR9g6Y/g=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/04/2021 à 04:53, Richard Henderson a écrit :
> Supercedes: 20210425155749.896330-1-richard.henderson@linaro.org
> ("linux-user/sparc64: Implement signals")
> 
> This time, in the lead-up, merge the sparc and sparc64 directories.
> Implement rt signals for sparc32 as well, since there are only a few
> differences between the two.
> 
> 
> r~
> 
> 
> Richard Henderson (25):
>   linux-user: Split out target_restore_altstack
>   linux-user: Use target_restore_altstack in all sigreturn
>   linux-user: Pass CPUArchState to do_sigaltstack
>   linux-user: Pass CPUArchState to target_restore_altstack
>   linux-user/sparc: Include TARGET_STACK_BIAS in get_sp_from_cpustate
>   linux-user/sparc: Clean up init_thread
>   linux-user/sparc: Merge sparc64 target_syscall.h
>   linux-user/sparc: Merge sparc64 target_elf.h
>   linux-user/sparc: Merge sparc64 target_structs.h
>   linux-user/sparc: Merge sparc64 termbits.h
>   linux-user/sparc: Merge sparc64/ into sparc/
>   linux-user/sparc: Remove target_sigcontext as unused
>   linux-user/sparc: Remove target_rt_signal_frame as unused
>   linux-user/sparc: Fix the stackframe structure
>   linux-user/sparc: Use target_pt_regs
>   linux-user/sparc: Split out save_reg_win
>   linux-user/sparc: Clean up get_sigframe
>   linux-user/sparc: Save and restore fpu in signal frame
>   linux-user/sparc: Add rwin_save to signal frame
>   linux-user/sparc: Clean up setup_frame
>   linux-user/sparc: Minor corrections to do_sigreturn
>   linux-user/sparc: Add 64-bit support to fpu save/restore
>   linux-user/sparc: Implement sparc32 rt signals
>   linux-user/sparc: Implement sparc64 rt signals
>   tests/tcg/sparc64: Re-enable linux-test
> 
>  .../targets/sparc64-linux-user.mak            |   1 +
>  linux-user/qemu.h                             |   3 +-
>  linux-user/signal-common.h                    |   1 +
>  linux-user/sparc/target_cpu.h                 |   9 +-
>  linux-user/sparc/target_signal.h              |   2 +
>  linux-user/sparc/target_structs.h             |  36 +-
>  linux-user/sparc/target_syscall.h             |  42 +-
>  linux-user/sparc64/sockbits.h                 |   1 -
>  linux-user/sparc64/target_cpu.h               |   1 -
>  linux-user/sparc64/target_elf.h               |  14 -
>  linux-user/sparc64/target_fcntl.h             |   1 -
>  linux-user/sparc64/target_signal.h            |   1 -
>  linux-user/sparc64/target_structs.h           |  58 --
>  linux-user/sparc64/target_syscall.h           |  35 --
>  linux-user/sparc64/termbits.h                 | 291 ----------
>  linux-user/aarch64/signal.c                   |   6 +-
>  linux-user/alpha/signal.c                     |   6 +-
>  linux-user/arm/signal.c                       |   9 +-
>  linux-user/elfload.c                          |  33 +-
>  linux-user/hexagon/signal.c                   |   6 +-
>  linux-user/hppa/signal.c                      |   8 +-
>  linux-user/i386/signal.c                      |   5 +-
>  linux-user/m68k/signal.c                      |   5 +-
>  linux-user/microblaze/signal.c                |   6 +-
>  linux-user/mips/signal.c                      |   6 +-
>  linux-user/nios2/signal.c                     |   8 +-
>  linux-user/openrisc/signal.c                  |   5 +-
>  linux-user/ppc/signal.c                       |   4 +-
>  linux-user/riscv/signal.c                     |   6 +-
>  linux-user/s390x/signal.c                     |   6 +-
>  linux-user/sh4/signal.c                       |   7 +-
>  linux-user/signal.c                           | 120 ++--
>  linux-user/sparc/signal.c                     | 535 ++++++++++++------
>  linux-user/sparc64/cpu_loop.c                 |  20 -
>  linux-user/sparc64/signal.c                   |  19 -
>  linux-user/syscall.c                          |   3 +-
>  linux-user/xtensa/signal.c                    |   6 +-
>  linux-user/meson.build                        |   1 -
>  linux-user/sparc64/meson.build                |   5 -
>  linux-user/sparc64/syscall.tbl                | 487 ----------------
>  linux-user/sparc64/syscallhdr.sh              |  32 --
>  tests/tcg/sparc64/Makefile.target             |   7 +-
>  42 files changed, 504 insertions(+), 1353 deletions(-)
>  delete mode 100644 linux-user/sparc64/sockbits.h
>  delete mode 100644 linux-user/sparc64/target_cpu.h
>  delete mode 100644 linux-user/sparc64/target_elf.h
>  delete mode 100644 linux-user/sparc64/target_fcntl.h
>  delete mode 100644 linux-user/sparc64/target_signal.h
>  delete mode 100644 linux-user/sparc64/target_structs.h
>  delete mode 100644 linux-user/sparc64/target_syscall.h
>  delete mode 100644 linux-user/sparc64/termbits.h
>  delete mode 100644 linux-user/sparc64/cpu_loop.c
>  delete mode 100644 linux-user/sparc64/signal.c
>  delete mode 100644 linux-user/sparc64/meson.build
>  delete mode 100644 linux-user/sparc64/syscall.tbl
>  delete mode 100644 linux-user/sparc64/syscallhdr.sh
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


