Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73293C6287
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 20:21:49 +0200 (CEST)
Received: from localhost ([::1]:33428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m30Yu-0003mT-NF
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 14:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m30XT-0002mV-Su
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 14:20:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57900
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m30XR-0000ra-Nd
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 14:20:19 -0400
Received: from host86-145-86-170.range86-145.btcentralplus.com
 ([86.145.86.170] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m30XE-0004fR-9U; Mon, 12 Jul 2021 19:20:08 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <7cd438df-bb46-73cc-b27a-c3cc6122f369@ilande.co.uk>
Date: Mon, 12 Jul 2021 19:20:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712154004.1410832-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.170
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 00/10] tcg: breakpoint reorg
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.479,
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
Cc: alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/07/2021 16:39, Richard Henderson wrote:

> This is fixing #404 ("windows xp boot takes much longer...")
> and several other similar reports.
> 
> For v2, all prerequisites and 7 of the patches from v1 with
> reviews are now upstream.
> 
> Mark Cave-Ayland reported success with WinXP with v1, with
> this patch set being even faster than b55f54bc~1.  Which was
> a bit of a surprise, but I'll take it.  It means that it's
> probably not worth making the breakpoint detection scheme
> any more complicated.
> 
> I'd still like some more feedback.  Given this is fixing a
> regression from qemu 5.2 I feel comfortable delaying this
> past soft freeze, but not past hard freeze on the 20th.
> 
> 
> r~
> 
> 
> Richard Henderson (10):
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
> 
>   include/exec/exec-all.h       |  30 +++++---
>   include/exec/translator.h     |  17 +++--
>   accel/tcg/cpu-exec.c          | 130 ++++++++++++++++++++++++++++------
>   accel/tcg/translate-all.c     |   7 +-
>   accel/tcg/translator.c        |  79 ++++++++++++++-------
>   cpu.c                         |  24 -------
>   target/alpha/translate.c      |  12 +---
>   target/arm/translate-a64.c    |  14 ++--
>   target/arm/translate.c        |  20 +++---
>   target/avr/translate.c        |   6 +-
>   target/cris/translate.c       |  14 ++--
>   target/hexagon/translate.c    |  13 +---
>   target/hppa/translate.c       |   7 +-
>   target/i386/tcg/translate.c   |  15 ++--
>   target/m68k/translate.c       |  14 +---
>   target/microblaze/translate.c |  14 +---
>   target/mips/tcg/translate.c   |  14 ++--
>   target/nios2/translate.c      |  13 +---
>   target/openrisc/translate.c   |  11 +--
>   target/ppc/translate.c        |  13 +---
>   target/riscv/translate.c      |  11 +--
>   target/rx/translate.c         |   8 +--
>   target/s390x/translate.c      |  12 ++--
>   target/sh4/translate.c        |  12 ++--
>   target/sparc/translate.c      |   9 ++-
>   target/tricore/translate.c    |  13 +---
>   target/xtensa/translate.c     |  12 ++--
>   tcg/tcg-op.c                  |  28 ++++----
>   28 files changed, 280 insertions(+), 292 deletions(-)

FWIW I've just tested this v2 patchset on top of git master (bd38ae26ce) and I still 
see the same improvement i.e. WinXP boot to the login screen goes down from 2m 38s to 
25s so:

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

