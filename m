Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D09B43A5B2
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 23:18:38 +0200 (CEST)
Received: from localhost ([::1]:46458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf7Mb-0004ch-61
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 17:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mf7Kh-0003Ek-FB
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 17:16:39 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:63349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mf7Kc-0002GM-GB
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 17:16:38 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DCCB5746353;
 Mon, 25 Oct 2021 23:16:30 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 59498746333; Mon, 25 Oct 2021 23:16:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 53EC37462D3;
 Mon, 25 Oct 2021 23:16:30 +0200 (CEST)
Date: Mon, 25 Oct 2021 23:16:30 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: Commit abb0cd93494 breaks -singlestep -d in_asm,cpu with
 qemu-system-sh4
Message-ID: <ec65bc8f-2f99-9f49-d6ee-7b96e67a3a1b@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Commit abb0cd93494 (accel/tcg: Split out log_cpu_exec) seems to have 
broken -singlestep -d in_asm,cpu output with qemu-system-sh4 after a delay 
slot. Since that commit I get:

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
the commit before or reverting that commit I get normal output:

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

However I still don't understand how the delayed branch ends up at 
0x8c800964 instead of 0x8c801528 above. Is this ouput not showing some 
already translated TBs even with -singlestep -d in_asm,cpu,nochain and 
that's why I see those cpu dumps without instructions? What's the correct 
way to get a trace of all executed instructions?

Regards,
BALATON Zoltan

