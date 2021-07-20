Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9760A3D0413
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:50:00 +0200 (CEST)
Received: from localhost ([::1]:48370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xck-0008O2-OI
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m5xav-0006wM-Iu
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:48:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39154
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m5xar-00074J-V3
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:48:05 -0400
Received: from host86-145-86-143.range86-145.btcentralplus.com
 ([86.145.86.143] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m5xad-000116-MM; Tue, 20 Jul 2021 22:47:51 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210720195439.626594-1-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <f1fd946c-e658-eec0-9bf0-b43c8a8c6f7c@ilande.co.uk>
Date: Tue, 20 Jul 2021 22:47:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.143
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-6.1 v6 00/17] tcg: breakpoint reorg
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

On 20/07/2021 20:54, Richard Henderson wrote:

> This is fixing #404 ("windows xp boot takes much longer...")
> and several other similar reports.
> 
> Changes for v6:
>    * Reinstate accidental loss of singlestep overriding breakpoint check.
>      Shows up in the record-replay avocado tests failing to make progress.
>    * Add CPUState.gdb_adjust_breakpoint hook for AVR weirdness.
> 
> Changes for v5:
>    * Include missing hunk in tb_gen_code, as noted in reply to v4.
>    * Remove helper_check_breakpoints from target/arm/.
>    * Reorg cflags_for_breakpoints into check_for_breakpoints;
>      reorg cpu_exec to use a break instead of a longjmp.
>    * Move singlestep_enabled check from cflags_for_breakpoints
>      to curr_cflags, which makes cpu_exec_step_atomic cleaner.
> 
> Changes for v4:
>    * Issue breakpoints directly from cflags_for_breakpoints.
>      Do not generate code for a TB beginning with a BP at all.
>    * Drop the problematic TranslatorOps.breakpoint_check hook entirely.
> 
> Changes for v3:
>    * Map CF_COUNT_MASK == 0 -> TCG_MAX_INSNS.
>    * Split out *_breakpoint_check fixes for avr, mips, riscv.
> 
> Changes for v2:
>    * All prerequisites and 7 of the patches from v1 with are merged.
> 
> Patches lacking review:
>    11-hw-core-Introduce-CPUClass.gdb_adjust_breakpoint.patch
>    12-target-avr-Implement-gdb_adjust_breakpoint.patch
>    15-accel-tcg-Remove-TranslatorOps.breakpoint_check.patch
>    17-accel-tcg-Record-singlestep_enabled-in-tb-cflags.patch
> 
> 
> r~
> 
> 
> Richard Henderson (17):
>    accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS
>    accel/tcg: Move curr_cflags into cpu-exec.c
>    target/alpha: Drop goto_tb path in gen_call_pal
>    accel/tcg: Add CF_NO_GOTO_TB and CF_NO_GOTO_PTR
>    accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
>    accel/tcg: Handle -singlestep in curr_cflags
>    accel/tcg: Use CF_NO_GOTO_{TB, PTR} in cpu_exec_step_atomic
>    hw/core: Introduce TCGCPUOps.debug_check_breakpoint
>    target/arm: Implement debug_check_breakpoint
>    target/i386: Implement debug_check_breakpoint
>    hw/core: Introduce CPUClass.gdb_adjust_breakpoint
>    target/avr: Implement gdb_adjust_breakpoint
>    accel/tcg: Merge tb_find into its only caller
>    accel/tcg: Move breakpoint recognition outside translation
>    accel/tcg: Remove TranslatorOps.breakpoint_check
>    accel/tcg: Hoist tb_cflags to a local in translator_loop
>    accel/tcg: Record singlestep_enabled in tb->cflags
> 
>   include/exec/exec-all.h       |  24 ++--
>   include/exec/translator.h     |  11 --
>   include/hw/core/cpu.h         |   4 +
>   include/hw/core/tcg-cpu-ops.h |   6 +
>   target/arm/helper.h           |   2 -
>   target/arm/internals.h        |   3 +
>   target/avr/cpu.h              |   1 +
>   accel/tcg/cpu-exec.c          | 205 ++++++++++++++++++++++++++--------
>   accel/tcg/translate-all.c     |   7 +-
>   accel/tcg/translator.c        |  39 ++-----
>   cpu.c                         |  34 ++----
>   target/alpha/translate.c      |  31 +----
>   target/arm/cpu.c              |   1 +
>   target/arm/cpu_tcg.c          |   1 +
>   target/arm/debug_helper.c     |  12 +-
>   target/arm/translate-a64.c    |  25 -----
>   target/arm/translate.c        |  29 -----
>   target/avr/cpu.c              |   1 +
>   target/avr/gdbstub.c          |  13 +++
>   target/avr/translate.c        |  32 ------
>   target/cris/translate.c       |  20 ----
>   target/hexagon/translate.c    |  17 ---
>   target/hppa/translate.c       |  11 --
>   target/i386/tcg/tcg-cpu.c     |  12 ++
>   target/i386/tcg/translate.c   |  28 -----
>   target/m68k/translate.c       |  18 ---
>   target/microblaze/translate.c |  18 ---
>   target/mips/tcg/translate.c   |  19 ----
>   target/nios2/translate.c      |  27 -----
>   target/openrisc/translate.c   |  17 ---
>   target/ppc/translate.c        |  18 ---
>   target/riscv/translate.c      |  17 ---
>   target/rx/translate.c         |  14 ---
>   target/s390x/tcg/translate.c  |  24 ----
>   target/sh4/translate.c        |  18 ---
>   target/sparc/translate.c      |  17 ---
>   target/tricore/translate.c    |  16 ---
>   target/xtensa/translate.c     |  17 ---
>   tcg/tcg-op.c                  |  28 ++---
>   39 files changed, 248 insertions(+), 589 deletions(-)

I spent a bit of time this evening testing this patchset with some typical OpenBIOS 
debugging patterns across SPARC32, SPARC64 and PPC and didn't spot any regressions, 
and the WinXP image still boots in 25s so:

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

I did find the slow-down noticeable when testing a few OpenBIOS breakpoints e.g. a 
breakpoint on OpenBIOS SPARC64's init_memory() upped the boot time to the Forth 
prompt from 9s to 30s even though it hits only once early in boot (presumably due to 
its proximity to a hot routine). Having said that, the changes look like a good 
improvement and patch 14 suggests that there could be further optimisations to be 
made in future, so in general this feels like a net win.


ATB,

Mark.

