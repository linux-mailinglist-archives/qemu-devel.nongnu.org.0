Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B461B437FCD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 23:08:35 +0200 (CEST)
Received: from localhost ([::1]:54588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me1mE-0000QN-Rw
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 17:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1me1ke-0007WO-5L
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:06:56 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:16276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1me1ka-0003Mj-Bc
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:06:55 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3AE867475FA;
 Fri, 22 Oct 2021 23:06:48 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 19124746333; Fri, 22 Oct 2021 23:06:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 167067462D3;
 Fri, 22 Oct 2021 23:06:48 +0200 (CEST)
Date: Fri, 22 Oct 2021 23:06:48 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Looking for advise on debugging a non-boot kernel on
 qemu-system-sh4
In-Reply-To: <f0933be1-75ee-b053-1f53-f96258d41163@physik.fu-berlin.de>
Message-ID: <d2553511-b83c-d4f1-5a88-b661bc97eb@eik.bme.hu>
References: <4882e4cc-6754-1c8a-a8ae-a2ceeca115fb@physik.fu-berlin.de>
 <e11d3ee1-2a25-7633-babd-d45f36b04c5b@eik.bme.hu>
 <013d782d-0d7c-8204-cab2-08102a7d80f4@physik.fu-berlin.de>
 <3c524162-e83-a9b3-1e28-2aa28dbefa76@eik.bme.hu>
 <f0933be1-75ee-b053-1f53-f96258d41163@physik.fu-berlin.de>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Oct 2021, John Paul Adrian Glaubitz wrote:
> On 10/21/21 15:49, BALATON Zoltan wrote:
>> So somthing seems to overwrite it. Maybe you can try building an uncompressed
>> kernel or one using a different compression and see if that does the same, at
>> least that way we can see if it's in the decompressing or later. I think it's
>> past linux/arch/sh/boot/compressed/head32.S and maybe somewhere in decompress_kernel
>> but not sure which decompression it uses. Kernel config is also missing to check
>> but I probably give up at this point and let you experiment some more.
>
> I think I've seen problems with compressed kernel images and QEMU before. I will switch
> to an uncompressed kernel and try again.

How did you compile the kernel that does not boot? What config have you 
used? I've tried to reproduce it by compiling a kernel with 
rts7751r2d1_defconfig and different compression methods but it did start 
and never got the problem seen with your kernel. Maybe it's the gcc 
version? My cross compiler is 8.4.0 and you seem to use 10.x. Maybe newer 
gcc uses something that's not emulated correctly? It would be interesting 
to identify what's causing the problem.

Regards,
BALATON Zoltan

