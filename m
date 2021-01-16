Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED232F8D8C
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 15:39:58 +0100 (CET)
Received: from localhost ([::1]:47738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0mk8-00085v-Ls
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 09:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l0mjD-0007gH-4C; Sat, 16 Jan 2021 09:38:59 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:36683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l0mjA-0005o5-BJ; Sat, 16 Jan 2021 09:38:58 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6A39D7462DB;
 Sat, 16 Jan 2021 15:38:49 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4007E7462D3; Sat, 16 Jan 2021 15:38:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3ED7E7462BD;
 Sat, 16 Jan 2021 15:38:49 +0100 (CET)
Date: Sat, 16 Jan 2021 15:38:49 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Recent TCG commit breaks PPC
Message-ID: <cd52c38c-4b9-791d-fca0-87f99bb0a011@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Commit 8fe35e0444be (tcg/optimize: Use tcg_constant_internal with constant 
folding) seems to break PPC emulation for me:

Thread 3 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7ffff51e7700 (LWP 22636)]
0x0000555555afd4ee in ts_are_copies (ts2=0x7fff8c008f90, ts1=0x7fff8c001510) at ../tcg/optimize.c:68
68	    return ts_info(ts)->next_copy != ts;
(gdb) bt
#0  0x0000555555afd4ee in ts_are_copies (ts2=0x7fff8c008f90, ts1=0x7fff8c001510) at tcg/optimize.c:68
#1  0x0000555555afd4ee in tcg_opt_gen_mov
     (s=s@entry=0x7fff8c000b60, op=op@entry=0x7fff8c6b2348, dst=140735542203664, src=140735542235024) at tcg/optimize.c:191
#2  0x0000555555afe05a in tcg_opt_gen_movi
     (s=s@entry=0x7fff8c000b60, temps_used=temps_used@entry=0x7ffff51e63c0, op=op@entry=0x7fff8c6b2348, dst=<optimized out>,
     val=<optimized out>) at include/tcg/tcg.h:731
#3  0x0000555555aff79f in tcg_optimize (s=s@entry=0x7fff8c000b60) at tcg/optimize.c:1189
#4  0x0000555555b13c39 in tcg_gen_code (s=0x7fff8c000b60, tb=tb@entry=0x7fffb3181380 <code_gen_buffer+4088659>) at tcg/tcg.c:4490
#5  0x0000555555b1b485 in tb_gen_code
     (cpu=cpu@entry=0x55555651c870, pc=pc@entry=4287582720, cs_base=cs_base@entry=0, flags=flags@entry=24576, cflags=-16777216,
     cflags@entry=0) at accel/tcg/translate-all.c:1952
#6  0x0000555555b7c303 in tb_find (cf_mask=0, tb_exit=0, last_tb=0x0, cpu=0x0) at accel/tcg/cpu-exec.c:454
#7  0x0000555555b7c303 in cpu_exec (cpu=cpu@entry=0x55555651c870) at accel/tcg/cpu-exec.c:810
#8  0x0000555555ab5ea2 in tcg_cpus_exec (cpu=cpu@entry=0x55555651c870) at accel/tcg/tcg-cpus.c:57
#9  0x0000555555ab7a03 in rr_cpu_thread_fn (arg=arg@entry=0x55555651c870) at accel/tcg/tcg-cpus-rr.c:217
#10 0x0000555555cc355a in qemu_thread_start (args=<optimized out>) at util/qemu-thread-posix.c:521
#11 0x00007ffff6cc004c in start_thread () at /lib64/libpthread.so.0
#12 0x00007ffff6bf13af in clone () at /lib64/libc.so.6

This can be reproduced for example with booting AROS as described here:

http://zero.eik.bme.hu/~balaton/qemu/amiga/#aros

The segfault happens during boot.

Regards,
BALATON Zoltan

