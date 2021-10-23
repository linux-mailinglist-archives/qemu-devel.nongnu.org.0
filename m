Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F79A4383CC
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 15:23:49 +0200 (CEST)
Received: from localhost ([::1]:38148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meH00-0008Uz-2U
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 09:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meGyi-0007G8-5q
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 09:22:28 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:49317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meGyf-0001k1-4P
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 09:22:27 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B92A5748F48;
 Sat, 23 Oct 2021 15:22:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8320C7475FA; Sat, 23 Oct 2021 15:22:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7E1FF7462D3;
 Sat, 23 Oct 2021 15:22:19 +0200 (CEST)
Date: Sat, 23 Oct 2021 15:22:19 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Looking for advise on debugging a non-boot kernel on
 qemu-system-sh4
In-Reply-To: <105383e6-9dab-e2bd-ffe2-fead5555f37c@physik.fu-berlin.de>
Message-ID: <c3cf7b52-10bc-eff3-c08a-d6e743cb863@eik.bme.hu>
References: <4882e4cc-6754-1c8a-a8ae-a2ceeca115fb@physik.fu-berlin.de>
 <e11d3ee1-2a25-7633-babd-d45f36b04c5b@eik.bme.hu>
 <013d782d-0d7c-8204-cab2-08102a7d80f4@physik.fu-berlin.de>
 <3c524162-e83-a9b3-1e28-2aa28dbefa76@eik.bme.hu>
 <f0933be1-75ee-b053-1f53-f96258d41163@physik.fu-berlin.de>
 <d2553511-b83c-d4f1-5a88-b661bc97eb@eik.bme.hu>
 <9189dbe7-cf92-19c7-dee5-b707262964d1@physik.fu-berlin.de>
 <3f483f63-9e68-b1da-01ab-a1e05dcf45aa@physik.fu-berlin.de>
 <378d863-abbb-57b7-d624-ce1ca81d09c@eik.bme.hu>
 <105383e6-9dab-e2bd-ffe2-fead5555f37c@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Sat, 23 Oct 2021, John Paul Adrian Glaubitz wrote:
> On 10/23/21 03:07, BALATON Zoltan wrote:
>>> I can confirm that the default config works for me, too. Both with gcc-8 and gcc-11.
>>
>> OK with your config I can reproduce the problem too but the kernel with that config
>> is 177MB and the r2d board has 64MB RAM so this can't work that way. Then it's likely
>> not a but but a too big kernel.
>
> You either need to strip the kernel with "strip vmlinux" or use the image from arch/sh/
> boot/zImage.

I've actually used that kernel but looked at the wrong uncompressed size, 
it's indeed just 9.2MB when stripped so that should work. I was trying to 
debug further and found two problems:

Commit abb0cd93494 (accel/tcg: Split out log_cpu_exec) seems to have 
broken -singlestep -d in_asm,cpu output with sh after a delay slot. Since 
that commit I get:

pc=0xac80003e sr=0x500000f1 pr=0x00000000 fpscr=0x00040001
spc=0x00000000 ssr=0x00000000 gbr=0x00000000 vbr=0x00000000
sgr=0x00000000 dbr=0x00000000 delayed_pc=0x00000000 fpul=0x00000000
r0=0x8cc9d000 r1=0xacc9d000 r2=0xe0000000 r3=0x8c800000
r4=0x00000000 r5=0x00000000 r6=0x00000000 r7=0x00000000
r8=0x00000000 r9=0x00000000 r10=0x00000000 r11=0x00000000
r12=0x00000000 r13=0x00000000 r14=0x00000000 r15=0x00000000
r16=0x00000000 r17=0x500000f0 r18=0x00000000 r19=0x00000000
r20=0x00000000 r21=0x00000000 r22=0x00000000 r23=0x00000000
----------------
IN:
0xac800040:  bt.s       0xac80001a

pc=0xac800040 sr=0x500000f1 pr=0x00000000 fpscr=0x00040001
spc=0x00000000 ssr=0x00000000 gbr=0x00000000 vbr=0x00000000
sgr=0x00000000 dbr=0x00000000 delayed_pc=0x00000000 fpul=0x00000000
r0=0x8cc9cfe0 r1=0xacc9d000 r2=0xe0000000 r3=0x8c800000
r4=0x00000000 r5=0x00000000 r6=0x00000000 r7=0x00000000
r8=0x00000000 r9=0x00000000 r10=0x00000000 r11=0x00000000
r12=0x00000000 r13=0x00000000 r14=0x00000000 r15=0x00000000
r16=0x00000000 r17=0x500000f0 r18=0x00000000 r19=0x00000000
r20=0x00000000 r21=0x00000000 r22=0x00000000 r23=0x00000000
----------------
IN:
0xac800042:  add        #-32,r1

pc=0xac800042 sr=0x500000f1 pr=0x00000000 fpscr=0x00040001
spc=0x00000000 ssr=0x00000000 gbr=0x00000000 vbr=0x00000000
sgr=0x00000000 dbr=0x00000000 delayed_pc=0xac80001a fpul=0x00000000
r0=0x8cc9cfe0 r1=0xacc9d000 r2=0xe0000000 r3=0x8c800000
r4=0x00000000 r5=0x00000000 r6=0x00000000 r7=0x00000000
r8=0x00000000 r9=0x00000000 r10=0x00000000 r11=0x00000000
r12=0x00000000 r13=0x00000000 r14=0x00000000 r15=0x00000000
r16=0x00000000 r17=0x500000f0 r18=0x00000000 r19=0x00000000
r20=0x00000000 r21=0x00000000 r22=0x00000000 r23=0x00000000
in conditional delay slot (delayed_pc=0xac80001a)
pc=0xac80001a sr=0x500000f1 pr=0x00000000 fpscr=0x00040001
spc=0x00000000 ssr=0x00000000 gbr=0x00000000 vbr=0x00000000
sgr=0x00000000 dbr=0x00000000 delayed_pc=0xac80001a fpul=0x00000000
r0=0x8cc9cfe0 r1=0xacc9cfe0 r2=0xe0000000 r3=0x8c800000
r4=0x00000000 r5=0x00000000 r6=0x00000000 r7=0x00000000
r8=0x00000000 r9=0x00000000 r10=0x00000000 r11=0x00000000
r12=0x00000000 r13=0x00000000 r14=0x00000000 r15=0x00000000
r16=0x00000000 r17=0x500000f0 r18=0x00000000 r19=0x00000000
r20=0x00000000 r21=0x00000000 r22=0x00000000 r23=0x00000000
pc=0xac80001c sr=0x500000f1 pr=0x00000000 fpscr=0x00040001
spc=0x00000000 ssr=0x00000000 gbr=0x00000000 vbr=0x00000000
sgr=0x00000000 dbr=0x00000000 delayed_pc=0xac80001a fpul=0x00000000
r0=0x8cc9cfe0 r1=0xacc9cfe0 r2=0xe0000000 r3=0x8c800000
r4=0x00000000 r5=0x00000000 r6=0x00000000 r7=0x00000000
r8=0x00000000 r9=0x00000000 r10=0x00000000 r11=0x00000000
r12=0x00000000 r13=0x00000000 r14=0x00000000 r15=0x00000000
r16=0x00000000 r17=0x500000f0 r18=0x00000000 r19=0x00000000
r20=0x00000000 r21=0x00000000 r22=0x00000000 r23=0x00000000

After the first delay slot no more in_asm output is printed. Going back to 
the commit before I get normal output. Then running zImage with your 
config I see:

----------------
IN:
0x8c801574:  bra        0x8c801528

pc=0x8c801574 sr=0x500000f0 pr=0x8c8013d6 fpscr=0x00040001
spc=0x00000000 ssr=0x00000000 gbr=0x00000000 vbr=0x00000000
sgr=0x00000000 dbr=0x00000000 delayed_pc=0x8c801594 fpul=0x00000000
r0=0x00000007 r1=0x0000000e r2=0x8cca1084 r3=0xfffffff9
r4=0x00000137 r5=0xfffffffa r6=0x8cca1570 r7=0x00000012
r8=0x8cca1044 r9=0x00000011 r10=0x00000005 r11=0x00097d36
r12=0x8cca1014 r13=0x0000000f r14=0x8cc0183c r15=0x8cca0f80
r16=0x00000000 r17=0x500000f0 r18=0x00000000 r19=0x00000000
r20=0x00000000 r21=0x00000000 r22=0x00000000 r23=0x00000000
----------------
IN:
0x8c801576:  add        #-7,r5

pc=0x8c801576 sr=0x500000f0 pr=0x8c8013d6 fpscr=0x00040001
spc=0x00000000 ssr=0x00000000 gbr=0x00000000 vbr=0x00000000
sgr=0x00000000 dbr=0x00000000 delayed_pc=0x8c801528 fpul=0x00000000
r0=0x00000007 r1=0x0000000e r2=0x8cca1084 r3=0xfffffff9
r4=0x00000137 r5=0xfffffffa r6=0x8cca1570 r7=0x00000012
r8=0x8cca1044 r9=0x00000011 r10=0x00000005 r11=0x00097d36
r12=0x8cca1014 r13=0x0000000f r14=0x8cc0183c r15=0x8cca0f80
r16=0x00000000 r17=0x500000f0 r18=0x00000000 r19=0x00000000
r20=0x00000000 r21=0x00000000 r22=0x00000000 r23=0x00000000
in delay slot (delayed_pc=0x8c801528)
----------------
IN:
0x8c800964:  .word 0x0000

pc=0x8c800964 sr=0x500000f1 pr=0x8c801654 fpscr=0x00040001
spc=0x00000000 ssr=0x00000000 gbr=0x00000000 vbr=0x00000000
sgr=0x00000000 dbr=0x00000000 delayed_pc=0x8c800964 fpul=0x00000000
r0=0x0000001b r1=0xac8009ca r2=0x8cc9956d r3=0xfffffefe
r4=0x8cca1014 r5=0x00000000 r6=0x0142850a r7=0x8cc5001e
r8=0x8cca1044 r9=0x00000102 r10=0x00000000 r11=0x00000000
r12=0xac8009ca r13=0xac8009aa r14=0x00000000 r15=0x8cca0f28
r16=0x00000000 r17=0x500000f0 r18=0x00000000 r19=0x00000000
r20=0x00000000 r21=0x00000000 r22=0x00000000 r23=0x00000000
----------------
IN:
0xac800000:  mov.l      0xac80007c,r1   ! 0x500000f0

pc=0xac800000 sr=0x700000f0 pr=0x00000000 fpscr=0x00040001
spc=0x00000000 ssr=0x00000000 gbr=0x00000000 vbr=0x00000000
sgr=0x00000000 dbr=0x00000000 delayed_pc=0x00000000 fpul=0x00000000
r0=0x00000000 r1=0x00000000 r2=0x00000000 r3=0x00000000
r4=0x00000000 r5=0x00000000 r6=0x00000000 r7=0x00000000
r8=0x00000000 r9=0x00000000 r10=0x00000000 r11=0x00000000
r12=0x00000000 r13=0x00000000 r14=0x00000000 r15=0x00000000
r16=0x00000000 r17=0x00000000 r18=0x00000000 r19=0x00000000
r20=0x00000000 r21=0x00000000 r22=0x00000000 r23=0x00000000

This seems to take a wrong turn at the delayed branch and somehow ends up 
at 0x8c800964 instead of 0x8c801528 but I'm not sure where to look firther 
why. I'm cc-ing Richard for both the -d cpu and this hoping he has some 
more insight.

Regards,
BALATON Zoltan

