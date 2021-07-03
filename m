Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D963BA79D
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 09:02:43 +0200 (CEST)
Received: from localhost ([::1]:34772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzZfl-0005gN-Fe
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 03:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzZdf-0004Le-A7
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 03:00:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40738
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzZdd-0008U1-AY
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 03:00:31 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzZdI-0005Rq-27; Sat, 03 Jul 2021 08:00:12 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <212cc77c-228d-1fae-f556-dabafd58a594@ilande.co.uk>
Date: Sat, 3 Jul 2021 08:00:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 00/17] tcg: breakpoint reorg
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/07/2021 16:25, Richard Henderson wrote:

> Based-on: <20210630183226.3290849-1-richard.henderson@linaro.org>
> ("[PATCH v2 00/28] accel/tcg: Introduce translator_use_goto_tb")
> 
> This is my attempt at fixing #404 ("windows xp boot takes much longer...").
> 
> I don't actually have windows xp available myself, so I don't know
> if this has worked, really.  I can still boot windows 7, but from
> the lack of tracepoint firings I guess it doesn't play any silly
> games with breakpoints.
> 
> This scheme is not without its drawbacks.  In exchange for no bookkeeping
> and invalidation whatsoever, other code on the same page as an active
> breakpoint runs one insn per tb, doing indirect chaining through
> helper_lookup_tb_ptr to see if we hit the breakpoint.
> 
> The minor testing that I did seemed fast enough though, with gdb
> responding quickly.  So before I go off and try to complicate
> things again with extra bookkeeping, I thought I'd get some feedback.
> 
> 
> r~
> 
> 
> Richard Henderson (17):
>    target/i386: Use cpu_breakpoint_test in breakpoint_handler
>    accel/tcg: Move helper_lookup_tb_ptr to cpu-exec.c
>    accel/tcg: Move tb_lookup to cpu-exec.c
>    accel/tcg: Split out log_cpu_exec
>    accel/tcg: Log tb->cflags with -d exec
>    tcg: Remove TCG_TARGET_HAS_goto_ptr
>    accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS
>    accel/tcg: Move curr_cflags into cpu-exec.c
>    accel/tcg: Add CF_NO_GOTO_TB and CF_NO_GOTO_PTR
>    accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
>    accel/tcg: Handle -singlestep in curr_cflags
>    accel/tcg: Use CF_NO_GOTO_{TB,PTR} in cpu_exec_step_atomic
>    accel/tcg: Move cflags lookup into tb_find
>    accel/tcg: Adjust interface of TranslatorOps.breakpoint_check
>    accel/tcg: Hoist tb_cflags to a local in translator_loop
>    accel/tcg: Encode breakpoint info into tb->cflags
>    cpu: Add breakpoint tracepoints
> 
>   accel/tcg/tb-lookup.h               |  49 ------
>   include/exec/exec-all.h             |  30 ++--
>   include/exec/translator.h           |  17 +-
>   include/tcg/tcg-opc.h               |   3 +-
>   tcg/aarch64/tcg-target.h            |   1 -
>   tcg/arm/tcg-target.h                |   1 -
>   tcg/i386/tcg-target.h               |   1 -
>   tcg/mips/tcg-target.h               |   1 -
>   tcg/ppc/tcg-target.h                |   1 -
>   tcg/riscv/tcg-target.h              |   1 -
>   tcg/s390/tcg-target.h               |   1 -
>   tcg/sparc/tcg-target.h              |   1 -
>   tcg/tci/tcg-target.h                |   1 -
>   accel/tcg/cpu-exec.c                | 238 +++++++++++++++++++++++-----
>   accel/tcg/tcg-runtime.c             |  22 ---
>   accel/tcg/translate-all.c           |   7 +-
>   accel/tcg/translator.c              |  79 ++++++---
>   cpu.c                               |  35 +---
>   target/alpha/translate.c            |  12 +-
>   target/arm/translate-a64.c          |  14 +-
>   target/arm/translate.c              |  20 +--
>   target/avr/translate.c              |   6 +-
>   target/cris/translate.c             |  14 +-
>   target/hexagon/translate.c          |  13 +-
>   target/hppa/translate.c             |   7 +-
>   target/i386/tcg/sysemu/bpt_helper.c |  12 +-
>   target/i386/tcg/translate.c         |  15 +-
>   target/m68k/translate.c             |  14 +-
>   target/microblaze/translate.c       |  14 +-
>   target/mips/tcg/translate.c         |  14 +-
>   target/nios2/translate.c            |  13 +-
>   target/openrisc/translate.c         |  11 +-
>   target/ppc/translate.c              |  13 +-
>   target/riscv/translate.c            |  11 +-
>   target/rx/translate.c               |   8 +-
>   target/s390x/translate.c            |  12 +-
>   target/sh4/translate.c              |  12 +-
>   target/sparc/translate.c            |   9 +-
>   target/tricore/translate.c          |  13 +-
>   target/xtensa/translate.c           |  12 +-
>   tcg/tcg-op.c                        |  28 ++--
>   tcg/tcg.c                           |   8 +-
>   trace-events                        |   5 +
>   43 files changed, 386 insertions(+), 413 deletions(-)
>   delete mode 100644 accel/tcg/tb-lookup.h

Thanks Richard! I grabbed the git tag from patchew and gave it a quick smoke test 
booting a pre-installed WinXP image to the login screen. I've included some extra 
times below for comparison taken from my rather modest laptop:

b55f54bc~1 (i.e. last known good commit): 43s
current master (9c2647f750): 2m 40s
breakpoint reorg patchew tag: 25s(!)

I can certainly report that booting WinXP from the patchew tag is substantially 
faster than both git master and the last known good commit before the TLB flush logic 
was altered, so the initial results are extremely promising.


ATB,

Mark.

