Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521FF2F8EF4
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 20:48:42 +0100 (CET)
Received: from localhost ([::1]:40398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0rYu-0004vk-Sr
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 14:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l0rX7-0004LH-EW; Sat, 16 Jan 2021 14:46:51 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:40968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l0rX3-0001Hc-Kg; Sat, 16 Jan 2021 14:46:49 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CA23074581E;
 Sat, 16 Jan 2021 20:46:38 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 95BB27456B8; Sat, 16 Jan 2021 20:46:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 942767456B7;
 Sat, 16 Jan 2021 20:46:38 +0100 (CET)
Date: Sat, 16 Jan 2021 20:46:38 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Recent TCG commit breaks PPC
In-Reply-To: <5310dc77-6fa6-36b2-dd51-cd6e1bebaddb@linaro.org>
Message-ID: <42de183-3c50-562a-d22-6e61dbbe893f@eik.bme.hu>
References: <cd52c38c-4b9-791d-fca0-87f99bb0a011@eik.bme.hu>
 <5310dc77-6fa6-36b2-dd51-cd6e1bebaddb@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-514034583-1610826398=:56046"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-514034583-1610826398=:56046
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 16 Jan 2021, Richard Henderson wrote:
> On 1/16/21 4:38 AM, BALATON Zoltan wrote:
>>
>> Commit 8fe35e0444be (tcg/optimize: Use tcg_constant_internal with constant
>> folding) seems to break PPC emulation for me:
>>
>> Thread 3 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
>> [Switching to Thread 0x7ffff51e7700 (LWP 22636)]
>> 0x0000555555afd4ee in ts_are_copies (ts2=0x7fff8c008f90, ts1=0x7fff8c001510) at
>> ../tcg/optimize.c:68
>> 68        return ts_info(ts)->next_copy != ts;
>
> I don't replicate this assertion.
>
> Interestingly, I replicate a different assertion:
>
> qemu-system-ppc: ../qemu/tcg/tcg.c:1210: tcg_temp_alloc: Assertion `n < 512'
> failed.
> Aborted (core dumped)
>
> What compiler version(s) are you guys using?

With --enable-debug (that I don't normally use because it makes PPC 
emulation too slow) I get the same assertion:

qemu-system-ppc: ../tcg/tcg.c:1210: tcg_temp_alloc: Assertion `n < 512' 
failed.

Thread 3 "qemu-system-ppc" received signal SIGABRT, Aborted.

(gdb) bt
#0  0x00007ffff6b29a7a in raise () at /lib64/libc.so.6
#1  0x00007ffff6b12524 in abort () at /lib64/libc.so.6
#2  0x00007ffff6b1240f in _nl_load_domain.cold.0 () at /lib64/libc.so.6
#3  0x00007ffff6b1e9a2 in  () at /lib64/libc.so.6
#4  0x0000555555c5e7a6 in tcg_temp_alloc (s=0x7fff50000b60) at tcg/tcg.c:1210
#5  0x0000555555c5efcb in tcg_constant_internal (type=TCG_TYPE_I32, val=-7401584) at tcg/tcg.c:1436
#6  0x0000555555c7f921 in tcg_opt_gen_movi
     (s=0x7fff50000b60, temps_used=0x7ffff51e94c0, op=0x7fff505d6308, dst=140734535570720, val=18446744073702150032)
     at tcg/optimize.c:247
#7  0x0000555555c81e4b in tcg_optimize (s=0x7fff50000b60) at tcg/optimize.c:1178
#8  0x0000555555c6580a in tcg_gen_code (s=0x7fff50000b60, tb=0x7fffb3181a00) at tcg/tcg.c:4490
#9  0x0000555555c34f9c in tb_gen_code (cpu=0x5555567851e0, pc=4287582720, cs_base=0, flags=24576, cflags=-16777216)
     at accel/tcg/translate-all.c:1952
#10 0x0000555555c79842 in tb_find (cpu=0x5555567851e0, last_tb=0x0, tb_exit=0, cf_mask=0) at accel/tcg/cpu-exec.c:454
#11 0x0000555555c7a109 in cpu_exec (cpu=0x5555567851e0) at accel/tcg/cpu-exec.c:810
#12 0x0000555555c6e906 in tcg_cpus_exec (cpu=0x5555567851e0) at accel/tcg/tcg-cpus.c:57
#13 0x0000555555cbf18e in rr_cpu_thread_fn (arg=0x5555567851e0) at accel/tcg/tcg-cpus-rr.c:217
#14 0x0000555555ea8531 in qemu_thread_start (args=0x5555567c63d0) at util/qemu-thread-posix.c:521
#15 0x00007ffff6cc004c in start_thread () at /lib64/libpthread.so.0
#16 0x00007ffff6bf13af in clone () at /lib64/libc.so.6

Previous one was when configuring without --enable-debug, so maybe it 
depends on compiler flags (-O2 vs. -O0).

Regards,
BALATON Zoltan
--3866299591-514034583-1610826398=:56046--

