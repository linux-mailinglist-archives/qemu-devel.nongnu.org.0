Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED59436372
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 15:51:46 +0200 (CEST)
Received: from localhost ([::1]:60730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdYTx-00008c-Fa
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 09:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mdYRv-0007D0-Aq
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:49:39 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:25591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mdYRr-00030J-C6
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:49:38 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 41E6075604D;
 Thu, 21 Oct 2021 15:49:32 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1C9BF75604C; Thu, 21 Oct 2021 15:49:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1AE44756041;
 Thu, 21 Oct 2021 15:49:32 +0200 (CEST)
Date: Thu, 21 Oct 2021 15:49:32 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Looking for advise on debugging a non-boot kernel on
 qemu-system-sh4
In-Reply-To: <013d782d-0d7c-8204-cab2-08102a7d80f4@physik.fu-berlin.de>
Message-ID: <3c524162-e83-a9b3-1e28-2aa28dbefa76@eik.bme.hu>
References: <4882e4cc-6754-1c8a-a8ae-a2ceeca115fb@physik.fu-berlin.de>
 <e11d3ee1-2a25-7633-babd-d45f36b04c5b@eik.bme.hu>
 <013d782d-0d7c-8204-cab2-08102a7d80f4@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Oct 2021, John Paul Adrian Glaubitz wrote:
> Hi Zoltan!
>
> On 10/21/21 14:12, BALATON Zoltan wrote:
>> Adding -d in_asm shows it seems to loop early in the kernel but not sure where.
>> Maybe try to compare addresses with System.map to find out where it's getting
>> stuck (but System.map was not included in your installer image).
>
> Here is the System.map if that helps [1].
>
>> Also if it works on earlier kernel you might try to bisect which kernel commit
>> caused the problem. Maybe knowing that helps to tell where to look further.
>
> If nothing else helps, I will try that.
>
> Adrian
>
>> [1] https://people.debian.org/~glaubitz/System.map-5.14.0-3-sh7751r.gz

I could not find any addresses that look like those in the map but I now 
see it seems to reboot on encountering an invalid instruction maybe before 
(during) uncomressing the kernel:

start:
0xac800000:  mov.l	0xac80007c,r1	! 0x500000f0
[,,,]
0x8c80085e:  mov.l	r1,@(4,r8)
0x8c800860:  bra	0x8c800b84
0x8c800862:  mov	r6,r0

----------------
IN:
0x8c80058c:  .word 0x0000

----------------
IN:
0xac800000:  mov.l	0xac80007c,r1	! 0x500000f0

and then this repeats. I wonder what's that zero opcode is and why is it 
there. Previously before it gets zero there was running it and there was 
still code there:

IN:
0x8c800ad4:  mov.l      r1,@(36,r9)
0x8c800ad6:  mov.l      @(28,r9),r1
0x8c800ad8:  mov.l      @(8,r15),r5
0x8c800ada:  mov.l      r1,@(32,r9)
0x8c800adc:  mov.l      @(24,r9),r1
0x8c800ade:  mov.l      r1,@(28,r9)
0x8c800ae0:  mov.l      @(20,r9),r1
0x8c800ae2:  mov.l      r1,@(24,r9)
0x8c800ae4:  mov.l      0x8c800c44,r1   ! 0x8c80058c
0x8c800ae6:  jsr        @r1
0x8c800ae8:  mov        r8,r4

----------------
IN:
0x8c80058c:  mov.l      r8,@-r15
0x8c80058e:  mov.l      r9,@-r15
0x8c800590:  mov.l      r10,@-r15
0x8c800592:  mov.l      r11,@-r15
0x8c800594:  mov.l      @r4,r2
0x8c800596:  mov.l      0x8c800718,r1   ! 0xffffff
0x8c800598:  mov.l      r12,@-r15
0x8c80059a:  cmp/hi     r1,r2
0x8c80059c:  bt.s       0x8c8005ba
0x8c80059e:  mov.l      r13,@-r15

So somthing seems to overwrite it. Maybe you can try building an 
uncompressed kernel or one using a different compression and see if that 
does the same, at least that way we can see if it's in the decompressing 
or later. I think it's past linux/arch/sh/boot/compressed/head32.S and 
maybe somewhere in decompress_kernel but not sure which decompression it 
uses. Kernel config is also missing to check but I probably give up at 
this point and let you experiment some more.

Regards,
BALATON Zoltan

