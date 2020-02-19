Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76E164EE5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 20:29:39 +0100 (CET)
Received: from localhost ([::1]:58974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4V2Q-0006Xy-6B
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 14:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41501)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j4V1e-000602-Vu
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 14:28:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j4V1d-0007yJ-9G
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 14:28:50 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:25458)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1j4V1d-0007vl-3E; Wed, 19 Feb 2020 14:28:49 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4BD85747D5D;
 Wed, 19 Feb 2020 20:28:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C2FEB747871; Wed, 19 Feb 2020 20:28:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C195B74637E;
 Wed, 19 Feb 2020 20:28:43 +0100 (CET)
Date: Wed, 19 Feb 2020 20:28:43 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: [RFC PATCH v2] target/ppc: Enable hardfloat for PPC
In-Reply-To: <CABLmASGhqbao0ngRAoHA7KBFA5CoMXLwaVh9wzv1Ec022FRjbQ@mail.gmail.com>
Message-ID: <alpine.BSF.2.22.395.2002192001540.88848@zero.eik.bme.hu>
References: <20200218171702.979F074637D@zero.eik.bme.hu>
 <CD566CEF-6844-455C-B9C7-E5DFDE50E770@gmail.com>
 <alpine.BSF.2.22.395.2002191538190.33319@zero.eik.bme.hu>
 <CABLmASGhqbao0ngRAoHA7KBFA5CoMXLwaVh9wzv1Ec022FRjbQ@mail.gmail.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: Paul Clarke <pc@us.ibm.com>, Programmingkid <programmingkidx@gmail.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Feb 2020, Howard Spoelstra wrote:
> I tested with the current ppc-for-5.0 branch and with v1 of the hardfloat
> patches applied on top of that. There is a noticeable speed improvement in
> Linux and OSX hosts. Windows 10 host doesn't seem to be impressed at all. I
> saw no obvious glitches so far. The fpu performance on OSX hosts seems very
> slow. This was not always the case in the past, when it was on par with
> Linux performance.

Interesting, thanks for the measurements.

> Below are my results.
>
> Best,
> Howard
>
> Host Linux (Fedora 31):
> Mac OS tests: 9.2 with MacBench 5.0
> Baseline(100%): G3 300Mhz
> 5.0 branch + hardfloat patches: cpu 193%, fpu 86%
> 5.0 branch: cpu 188%, fpu 57%

Here there's a difference in cpu value before and after patch which I 
can't explain (only changed FPU stuff so it should not change others) but 
also not seen in other measurements so this could be some external 
influence such as something else using CPU while running test? Unless this 
happens consistently I'd put it down to measurement error.

> Mac OSX tests: 10.5 with Skidmarks 4.0 test
> Baseline(100%): G4 1.0Ghz.
> 5.0 branch + hardfloat patches: Int:131 FP:11 Vec:15
> 5.0 branch: Int:131 FP:9 Vec:11
>
> Host OSX Sierra:
> Mac OS tests: 9.2 with MacBench 5.0
> Baseline(100%): G3 300Mhz
> 5.0 branch + hardfloat patches: cpu 199%, fpu 66%
> 5.0 branch: cpu 199%, fpu 40%
> Mac OSX tests: 10.5 with Skidmarks 4.0 test
> Baseline(100%): G4 1.0Ghz.
> 5.0 branch + hardfloat patches: Int:129 PF:11 Vec:14

These values seem to match Linux measurement above so don't seem slower 
although MacOS9 seems to be slower (66 vs. 86) so either this depends on 
the ops used or something else.

> 5.0 branch: Int:129 FP:8 Vec:9
>
> Host Windows 10:
> Mac OS tests: 9.2 with MacBench 5.0
> Baseline(100%): G3 300Mhz
> 5.0 branch + hardfloat patches: cpu 180%, fpu 54%
> 5.0 branch: cpu 199%, fpu 40%

Here there's again difference in cpu value but the other way so maybe if 
the cause is external CPU usage then this again may be an outlying 
measurement? You could retake these two to verify if you get same numbers 
again. The fpu value does seem to improve just not as much as the others 
and it's also lower to start with. I wonder why.

> Mac OSX tests: 10.5 with Skidmarks 4.0 test
> Baseline(100%): G4 1.0Ghz.
> 5.0 branch + hardfloat patches: Int:130 FP:9 Vec:10
> 5.0 branch: Int:130 FP:10 Vec:11
>
> All tests done on the same host with v1 of the hardfloat patches
> Intel i7-4770K at 3.50Ghz. 32Gb memory
> All guests set to 1024x768 and "thousands" of colors.

Does it mean this host machine were rebooted into these OSes or these were 
run in a VM. In case using VM, were all three running in VM or one was on 
host (I'd guess OSX host with Linux and Windows VMs).

> Linux and OSX (with brew) use default compilers.
> Windows build cross-compiled from Fedora with x86_64-win64-mingw32

I assume Linux and OSX were 64 bit builds, is Windows 32 bit or 64 bit 
exe?

Regards,
BALATON Zoltan

