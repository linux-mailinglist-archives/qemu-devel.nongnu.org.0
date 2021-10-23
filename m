Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79720438137
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 03:08:28 +0200 (CEST)
Received: from localhost ([::1]:56428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me5WN-0006Ew-7J
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 21:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1me5Vd-0005Zp-Ae
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 21:07:41 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:42232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1me5Va-0000Jr-99
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 21:07:40 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B3A1D7475FA;
 Sat, 23 Oct 2021 03:07:34 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8FF5A746333; Sat, 23 Oct 2021 03:07:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8EE0B7462D3;
 Sat, 23 Oct 2021 03:07:34 +0200 (CEST)
Date: Sat, 23 Oct 2021 03:07:34 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Looking for advise on debugging a non-boot kernel on
 qemu-system-sh4
In-Reply-To: <3f483f63-9e68-b1da-01ab-a1e05dcf45aa@physik.fu-berlin.de>
Message-ID: <378d863-abbb-57b7-d624-ce1ca81d09c@eik.bme.hu>
References: <4882e4cc-6754-1c8a-a8ae-a2ceeca115fb@physik.fu-berlin.de>
 <e11d3ee1-2a25-7633-babd-d45f36b04c5b@eik.bme.hu>
 <013d782d-0d7c-8204-cab2-08102a7d80f4@physik.fu-berlin.de>
 <3c524162-e83-a9b3-1e28-2aa28dbefa76@eik.bme.hu>
 <f0933be1-75ee-b053-1f53-f96258d41163@physik.fu-berlin.de>
 <d2553511-b83c-d4f1-5a88-b661bc97eb@eik.bme.hu>
 <9189dbe7-cf92-19c7-dee5-b707262964d1@physik.fu-berlin.de>
 <3f483f63-9e68-b1da-01ab-a1e05dcf45aa@physik.fu-berlin.de>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 23 Oct 2021, John Paul Adrian Glaubitz wrote:
> On 10/22/21 23:49, John Paul Adrian Glaubitz wrote:
>>> How did you compile the kernel that does not boot? What config have you used?
>>
>> The config is constructed from the Debian kernel configuration tree. I have uploaded
>> the resulting config file here:
>>
>>> https://people.debian.org/~glaubitz/config-5.14.0-3-sh7751r.gz
>>
>>> I've tried to reproduce it by compiling a kernel with rts7751r2d1_defconfig and different
>>> compression methods but it did start and never got the problem seen with your kernel.
>>
>> Oh, that's very interesting. How big were the kernel images you got? My suspicion was
>> that the current Debian kernel might be too much.
>
> I can confirm that the default config works for me, too. Both with gcc-8 and gcc-11.

OK with your config I can reproduce the problem too but the kernel with 
that config is 177MB and the r2d board has 64MB RAM so this can't work 
that way. Then it's likely not a but but a too big kernel.

> Using that kernel, however, I cannot use the debian-installer initrd.gz, even with
> CONFIG_BLK_DEV_INITRD enabled in the kernel configuration.
>
> The kernel prints a message saying that the initramfs is uncompressed, but whatever I
> do I cannot get it to mount the initramfs. All I get is this:
>
> [    0.096000] Trying to unpack rootfs image as initramfs...
>
> and then later:
>
> [    0.480000] ---[ end trace 46a3adcb34136251 ]---
> [    0.480000] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    0.480000] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

I don't know, you have to find the needed config options to have what's 
needed to use this initrd. You could either try to strip down the debian 
config or add more to the default until you get a working kernel that fits 
in the memory (and there's some left to run other processes).

Regards,
BALATON Zoltan

