Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3F32FCD48
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:14:04 +0100 (CET)
Received: from localhost ([::1]:47240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l29Yx-0000yO-8S
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:14:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1l29Xc-00005e-K3
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:12:40 -0500
Received: from jedlik.phy.bme.hu ([152.66.102.83]:32936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1l29Xa-0007zw-4C
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:12:40 -0500
Received: by jedlik.phy.bme.hu (Postfix, from userid 1000)
 id B6A3FA010A; Wed, 20 Jan 2021 10:03:40 +0100 (CET)
Date: Wed, 20 Jan 2021 10:03:40 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/5] tcg: Dynamically allocate temporaries
In-Reply-To: <b0b5b969-9f67-b9b2-cac2-319b672b9913@amsat.org>
Message-ID: <alpine.LMD.2.03.2101200943140.20093@eik.bme.hu>
References: <20210119183428.556706-1-richard.henderson@linaro.org>
 <7595e6e-bc3d-d626-656b-e7ba3bfd8b90@eik.bme.hu>
 <b0b5b969-9f67-b9b2-cac2-319b672b9913@amsat.org>
User-Agent: Alpine 2.03 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="1117279078-88845053-1611133420=:20093"
Received-SPF: none client-ip=152.66.102.83;
 envelope-from=balaton@jedlik.phy.bme.hu; helo=jedlik.phy.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?ISO-8859-15?Q?Luk=E1=A8_Doktor?= <ldoktor@redhat.com>, lvivier@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1117279078-88845053-1611133420=:20093
Content-Type: TEXT/PLAIN; charset=utf-8; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 20 Jan 2021, Philippe Mathieu-Daud=C3=A9 wrote:
> On 1/20/21 12:06 AM, BALATON Zoltan wrote:
>> On Tue, 19 Jan 2021, Richard Henderson wrote:
>>> My recent change for caching tcg constants has, in a number of cases,
>>> overflowed the statically allocated array of temporaries.=C2=A0 Change =
to
>>> dynamic allocation.
>>
>> This seems to work for me so
>>
>> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
>>
>> but have you done any performance tests to check that this actually
>> improves emulation speed? To mee it seems slower. Booting AmigaOS on
>> sam460ex with c0dd6654f207 (just before your TCG series) takes:
>>
>> real=C2=A0=C2=A0=C2=A0 0m33.829s
>> user=C2=A0=C2=A0=C2=A0 0m34.432s
>> sys=C2=A0=C2=A0=C2=A0 0m0.296s
>>
>> but on HEAD with this series:
>>
>> real=C2=A0=C2=A0=C2=A0 0m44.381s
>> user=C2=A0=C2=A0=C2=A0 0m46.058s
>> sys=C2=A0=C2=A0=C2=A0 0m0.532s
>>
>> This is noticable decrease in speed also without measuring it. With just
>> increasing the TCG_MAX_TEMPS to 2048 on 7c79721606be without this series
>> I get:
>>
>> real=C2=A0=C2=A0=C2=A0 0m42.681s
>> user=C2=A0=C2=A0=C2=A0 0m44.208s
>> sys=C2=A0=C2=A0=C2=A0 0m0.435s
>>
>> So the performance regression is somewhere in the original series not in
>> this fix up series.
>
> Cc'ing Lukas for the performance part, as he is investigating
> how to catch such regressions.

I think there was a GSoC last year that resulted in some scripts to do=20
performance testing and even bisecting regressions. I've seen a few=20
reports posted about those but maybe the project should also use the=20
results and run these on some dedicated test machines regularly to be=20
useful. The GSoC has ended, so the student has left and I think the mentor=
=20
was Aleksandar M. who may also be doing something else now so these=20
benchmarking scripts seem to be abandoned. But maybe could be picked up as=
=20
a starting point or inspiration for any similar activity to build on those=
=20
results.

>>> I'll note that nothing in check-acceptance triggers this overflow.
>>> Anyone care to add some more test cases there?
>>
>> The proposed test for the upcoming pegasos2 machine may also catch this
>> (when that will be merged, its dependencies are still under review)
>
> What are your running on pegasos2?

I've sent you before what test I think we could do for pegasos2, see:

https://lists.nongnu.org/archive/html/qemu-ppc/2021-01/msg00112.html

but I could not write the script for that and have no way to test it so=20
some help would be needed with that. By the way, before that there are=20
also the vt82c686 patches still waiting for review. I hope you haven't=20
forgot and will eventually come back to them.

>> or
>> the sam460ex test that currently only checks the firmware could be
>> enhanced to try to boot AROS if somebody wants to do that. The drawback
>> is that it needs an external iso whereas the current test doesn't need
>> any additional images but it did not catch problems with IRQ and neither
>> this problem with TCG temps.
>
> So this other option is not very useful, right?

It's still useful to test if the machine is working at all but the=20
firmware does not seem to use interrupts and if you don't boot anything it=
=20
won't access disks so some parts will not be tested by only firmware level=
=20
testing. Basically only CPU, RAM, ROM, serial would be tested and that the=
=20
machine could be created which would still catch some bugs but IRQs and=20
IDE probably would only be tested by trying to boot an OS. I think Guenter=
=20
runs Linux kernel boot tests but with -kernel option so disks would still=
=20
not be tested by that therefore it may be more useful to run some other OS=
=20
booted from CD just to increase coverage. Since I plan to use MorphOS for=
=20
pegasos2 as test, sam460ex could use AROS (AmigaOS is not freely available=
=20
so that cannot be used but I also test with that). The AROS isos are free=
=20
but may be somewhat unstable so instead of using the latest, one should=20
use a known working version and only update after manual testing,=20
otherwise the test may break due to change in AROS.

Regards,
BALATON Zoltan
--1117279078-88845053-1611133420=:20093--

